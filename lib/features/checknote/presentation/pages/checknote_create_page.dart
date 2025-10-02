import 'package:app/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../components/organisms/checknote_creation_step1_form.dart';
import '../components/organisms/checknote_creation_step2_form.dart';
import '../components/organisms/checknote_creation_step3_form.dart';
import '../components/organisms/checknote_creation_preview.dart';
import '../components/layouts/checknote_creation_layout.dart';
import '../components/molecules/step1_summary.dart';
import '../providers/checknote_provider.dart';
import '../providers/checknote_creation_provider.dart';
import '../../domain/entities/checknote_entity.dart';

/// 체크노트 생성 통합 페이지 (모든 스텝 포함)
class ChecknoteCreatePage extends ConsumerStatefulWidget {
  const ChecknoteCreatePage({super.key});

  @override
  ConsumerState<ChecknoteCreatePage> createState() =>
      _ChecknoteCreatePageState();
}

class _ChecknoteCreatePageState extends ConsumerState<ChecknoteCreatePage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(checknoteCreationProvider);
    ref.watch(createChecknoteProvider);

    return ChecknoteCreationLayout(
      currentStep: state.currentStep,
      stepNumber: _getStepTitle(state.currentStep),
      backgroundImgPath: AppImages.checknoteCreationStep1,
      stepTitle: _getStepDescription(state.currentStep),
      child: _buildStepContent(state.currentStep),
    );
  }

  String _getStepTitle(int step) {
    switch (step) {
      case 0:
        return 'Step 1.';
      case 1:
        return 'Step 2.';
      case 2:
        return 'Step 3.';
      default:
        return 'Step 1.';
    }
  }

  String _getStepDescription(int step) {
    switch (step) {
      case 0:
        return '체크 노트 정하기';
      case 1:
        return '체크 노트 소개하기';
      case 2:
        return '체크 노트 완성하기';
      default:
        return '체크 노트 정하기';
    }
  }

  Widget _buildStepContent(int step) {
    switch (step) {
      case 0:
        return ChecknoteCreationStep1Form(
          onSubmit: _onStep1Complete,
        );
      case 1:
        return ChecknoteCreationStep2Form(
          onPrevious: _onPrevious,
          onNext: _onStep2Complete,
        );
      case 2:
        return ChecknoteCreationStep3Form(
          onPrevious: _onPrevious,
          onComplete: _onComplete,
        );
      default:
        return ChecknoteCreationStep1Form(
          onSubmit: _onStep1Complete,
        );
    }
  }

  Future<void> _onStep1Complete(
      String name, List<String> imageUrls, ChecknoteType type) async {
    try {
      // step1 데이터를 creation provider에 저장
      ref.read(checknoteCreationProvider.notifier).updateStep1Data(
            name: name,
            imageUrls: imageUrls,
            type: type,
          );

      // 다음 스텝으로 이동
      ref.read(checknoteCreationProvider.notifier).nextStep();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Step 1 완료! Step 2로 이동합니다.'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('오류가 발생했습니다: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _onStep2Complete() {
    // 다음 스텝으로 이동
    ref.read(checknoteCreationProvider.notifier).nextStep();

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Step 2 완료! Step 3으로 이동합니다.'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  void _onPrevious() {
    // 이전 스텝으로 이동
    ref.read(checknoteCreationProvider.notifier).previousStep();
  }

  void _onComplete() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ChecknoteCreationPreview(
          onPrevious: () => Navigator.of(context).pop(),
          onCreate: _onCreateConfirm,
        ),
      ),
    );
  }

  void _onCreateConfirm() {
    // TODO: 실제 생성 로직 연동 시 이곳에서 처리
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('체크노트가 성공적으로 생성되었습니다!'),
        backgroundColor: Colors.green,
      ),
    );
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
