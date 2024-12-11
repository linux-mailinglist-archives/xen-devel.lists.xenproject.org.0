Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BF19EC0A2
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 01:21:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853475.1266923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLATE-0008U3-NI; Wed, 11 Dec 2024 00:20:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853475.1266923; Wed, 11 Dec 2024 00:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLATE-0008QS-KE; Wed, 11 Dec 2024 00:20:52 +0000
Received: by outflank-mailman (input) for mailman id 853475;
 Wed, 11 Dec 2024 00:20:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wq+n=TE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tLATD-00080F-1d
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 00:20:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c44d42ce-b755-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 01:20:47 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 113BC5C5E44;
 Wed, 11 Dec 2024 00:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 121ADC4CED6;
 Wed, 11 Dec 2024 00:20:43 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: c44d42ce-b755-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733876445;
	bh=IaQ5PEFSSBLojhKyCdvM1Z3HAopf2lDGrNXNZPv6dCs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=q0ysTf1l4qjQAn+Tn5YZsMLp/QOSCuvVCCf8xrzgFgQ10MxSQlg1CoTLa55GdFGgd
	 kaLfeuBjoKHQTJ0s9OPY0V1P97fIpdHpCsyBY809Kakxww6Zp04pFXj8XGSu2h5hUp
	 Nxg9Pb+NcpBbJW+EsCicpSS+ySa1otsgpclW51Hp9BB+MS/Ce7D9EEXd9d/x5yhsV7
	 QVDCT3Z6m99ymVV0Jmz19O2fkHv0aCRBJmVvGHQpVdtSLPQyi77pgiZT+DAo6QJaex
	 949e0vg+SrMTVqX/OZBaSxhjbBv8ZCFzNkUFs4h/p63k2MVUuM82Ow4lasDMjwRQ1z
	 8k20rNSomGV0Q==
Date: Tue, 10 Dec 2024 16:20:42 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen: update ECLAIR service identifiers from MC3R1 to
 MC3A2.
In-Reply-To: <cf13be4779f15620e94b99b3b91f9cb040319989.1733826952.git.alessandro.zucchelli@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2412101620360.463523@ubuntu-linux-20-04-desktop>
References: <cf13be4779f15620e94b99b3b91f9cb040319989.1733826952.git.alessandro.zucchelli@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 10 Dec 2024, Alessandro Zucchelli wrote:
> Rename all instances of ECLAIR MISRA C:2012 service identifiers,
> identified by the prefix MC3R1, to use the prefix MC3A2, which
> refers to MISRA C:2012 Amendment 2 guidelines.
> 
> This update is motivated by the need to upgrade ECLAIR GitLab runners
> that use the new naming scheme for MISRA C:2012 Amendment 2 guidelines.
> 
> Changes to the docs/misra directory are needed in order to keep
> comment-based deviation up to date.
> 
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> The change was made using the following command:
> find . -type f -exec sed -i 's/MC3R1/MC3A2/g' {} +
> 
> In order to avoid CI failures this patch and the ECLAIR runners must
> be updated at roughly the same time. This backwards-incompatible
> change is needed to bring to the runners other bugfixes.
> ---
>  .../eclair_analysis/ECLAIR/B.UNEVALEFF.ecl    |   2 +-
>  .../ECLAIR/accepted_guidelines.sh             |   2 +-
>  .../eclair_analysis/ECLAIR/analysis.ecl       |   6 +-
>  .../eclair_analysis/ECLAIR/deviations.ecl     | 244 +++++++++---------
>  .../eclair_analysis/ECLAIR/monitored.ecl      | 208 +++++++--------
>  automation/eclair_analysis/ECLAIR/tagging.ecl | 176 ++++++-------
>  docs/misra/documenting-violations.rst         |   6 +-
>  docs/misra/safe.json                          |  32 +--
>  8 files changed, 338 insertions(+), 338 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/B.UNEVALEFF.ecl b/automation/eclair_analysis/ECLAIR/B.UNEVALEFF.ecl
> index 92d8db8986..fa249b8e36 100644
> --- a/automation/eclair_analysis/ECLAIR/B.UNEVALEFF.ecl
> +++ b/automation/eclair_analysis/ECLAIR/B.UNEVALEFF.ecl
> @@ -1,4 +1,4 @@
> --clone_service=MC3R1.R13.6,B.UNEVALEFF
> +-clone_service=MC3A2.R13.6,B.UNEVALEFF
>  
>  -config=B.UNEVALEFF,summary="The operand of the `alignof' and `typeof'  operators shall not contain any expression which has potential side effects"
>  -config=B.UNEVALEFF,stmt_child_matcher=
> diff --git a/automation/eclair_analysis/ECLAIR/accepted_guidelines.sh b/automation/eclair_analysis/ECLAIR/accepted_guidelines.sh
> index 368135122c..2c4b339d0d 100755
> --- a/automation/eclair_analysis/ECLAIR/accepted_guidelines.sh
> +++ b/automation/eclair_analysis/ECLAIR/accepted_guidelines.sh
> @@ -10,6 +10,6 @@ script_dir="$(
>  accepted_rst=$1
>  
>  grep -Eo "\`(Dir|Rule) [0-9]+\.[0-9]+" ${accepted_rst} \
> -     | sed -e 's/`Rule /MC3R1.R/' -e  's/`Dir /MC3R1.D/' -e 's/.*/-enable=&/' > ${script_dir}/accepted.ecl
> +     | sed -e 's/`Rule /MC3A2.R/' -e  's/`Dir /MC3A2.D/' -e 's/.*/-enable=&/' > ${script_dir}/accepted.ecl
>  
>  echo "-enable=B.UNEVALEFF" >> ${script_dir}/accepted.ecl
> diff --git a/automation/eclair_analysis/ECLAIR/analysis.ecl b/automation/eclair_analysis/ECLAIR/analysis.ecl
> index df0b551812..824283a989 100644
> --- a/automation/eclair_analysis/ECLAIR/analysis.ecl
> +++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
> @@ -22,15 +22,15 @@ setq(analysis_kind,getenv("ANALYSIS_KIND"))
>  -doc_begin="These configurations serve the purpose of recognizing the 'mem*' macros as
>  their Standard Library equivalents."
>  
> --config=MC3R1.R21.14,call_select+=
> +-config=MC3A2.R21.14,call_select+=
>  {"macro(^memcmp$)&&any_arg(1..2, skip(__non_syntactic_paren_cast_stmts, node(string_literal)))",
>   "any()", violation, "%{__callslct_any_base_fmt()}", {{arg, "%{__callslct_arg_fmt()}"}}}
>  
> --config=MC3R1.R21.15,call_args+=
> +-config=MC3A2.R21.15,call_args+=
>  {"macro(^mem(cmp|move|cpy)$)", {1, 2}, "unqual_pointee_compatible",
>   "%{__argscmpr_culprit_fmt()}", "%{__argscmpr_evidence_fmt()}"}
>  
> --config=MC3R1.R21.16,call_select+=
> +-config=MC3A2.R21.16,call_select+=
>  {"macro(^memcmp$)&&any_arg(1..2, skip(__non_syntactic_paren_stmts, type(canonical(__memcmp_pte_types))))",
>   "any()", violation, "%{__callslct_any_base_fmt()}", {{arg,"%{__callslct_arg_type_fmt()}"}}}
>  
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 2f58f29203..ae25eeb76a 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -4,36 +4,36 @@
>  
>  -doc_begin="The compiler implementation guarantees that the unreachable code is removed.
>  Constant expressions and unreachable branches of if and switch statements are expected."
> --config=MC3R1.R2.1,+reports={safe,"first_area(^.*has an invariantly.*$)"}
> --config=MC3R1.R2.1,+reports={safe,"first_area(^.*incompatible with labeled statement$)"}
> +-config=MC3A2.R2.1,+reports={safe,"first_area(^.*has an invariantly.*$)"}
> +-config=MC3A2.R2.1,+reports={safe,"first_area(^.*incompatible with labeled statement$)"}
>  -doc_end
>  
>  -doc_begin="Some functions are intended to be not referenced."
> --config=MC3R1.R2.1,+reports={deliberate,"first_area(^.*is never referenced$)"}
> +-config=MC3A2.R2.1,+reports={deliberate,"first_area(^.*is never referenced$)"}
>  -doc_end
>  
>  -doc_begin="Unreachability caused by calls to the following functions or macros is deliberate and there is no risk of code being unexpectedly left out."
> --config=MC3R1.R2.1,statements+={deliberate,"macro(name(BUG||assert_failed))"}
> --config=MC3R1.R2.1,statements+={deliberate, "call(decl(name(__builtin_unreachable||panic||do_unexpected_trap||machine_halt||machine_restart||reboot_or_halt)))"}
> +-config=MC3A2.R2.1,statements+={deliberate,"macro(name(BUG||assert_failed))"}
> +-config=MC3A2.R2.1,statements+={deliberate, "call(decl(name(__builtin_unreachable||panic||do_unexpected_trap||machine_halt||machine_restart||reboot_or_halt)))"}
>  -doc_end
>  
>  -doc_begin="Unreachability inside an ASSERT_UNREACHABLE() and analogous macro calls is deliberate and safe."
> --config=MC3R1.R2.1,reports+={deliberate, "any_area(any_loc(any_exp(macro(name(ASSERT_UNREACHABLE||PARSE_ERR_RET||PARSE_ERR||FAIL_MSR||FAIL_CPUID)))))"}
> +-config=MC3A2.R2.1,reports+={deliberate, "any_area(any_loc(any_exp(macro(name(ASSERT_UNREACHABLE||PARSE_ERR_RET||PARSE_ERR||FAIL_MSR||FAIL_CPUID)))))"}
>  -doc_end
>  
>  -doc_begin="The asm-offset files are not linked deliberately, since they are used to generate definitions for asm modules."
>  -file_tag+={asm_offsets, "^xen/arch/(arm|x86)/(arm32|arm64|x86_64)/asm-offsets\\.c$"}
> --config=MC3R1.R2.1,reports+={deliberate, "any_area(any_loc(file(asm_offsets)))"}
> +-config=MC3A2.R2.1,reports+={deliberate, "any_area(any_loc(file(asm_offsets)))"}
>  -doc_end
>  
>  -doc_begin="Pure declarations (i.e., declarations without initialization) are
>  not executable, and therefore it is safe for them to be unreachable."
> --config=MC3R1.R2.1,ignored_stmts+={"any()", "pure_decl()"}
> +-config=MC3A2.R2.1,ignored_stmts+={"any()", "pure_decl()"}
>  -doc_end
>  
>  -doc_begin="The following autogenerated file is not linked deliberately."
>  -file_tag+={C_runtime_failures,"^automation/eclair_analysis/C-runtime-failures\\.rst\\.c$"}
> --config=MC3R1.R2.1,reports+={deliberate, "any_area(any_loc(file(C_runtime_failures)))"}
> +-config=MC3A2.R2.1,reports+={deliberate, "any_area(any_loc(file(C_runtime_failures)))"}
>  -doc_end
>  
>  -doc_begin="Proving compliance with respect to Rule 2.2 is generally impossible:
> @@ -42,11 +42,11 @@ confidence that no evidence of errors in the program's logic has been missed due
>  to undetected violations of Rule 2.2, if any. Testing on time behavior gives us
>  confidence on the fact that, should the program contain dead code that is not
>  removed by the compiler, the resulting slowdown is negligible."
> --config=MC3R1.R2.2,reports+={disapplied,"any()"}
> +-config=MC3A2.R2.2,reports+={disapplied,"any()"}
>  -doc_end
>  
>  -doc_begin="Some labels are unused in certain build configurations, or are deliberately marked as unused, so that the compiler is entitled to remove them."
> --config=MC3R1.R2.6,reports+={deliberate, "any_area(text(^.*__maybe_unused.*$))"}
> +-config=MC3A2.R2.6,reports+={deliberate, "any_area(text(^.*__maybe_unused.*$))"}
>  -doc_end
>  
>  #
> @@ -55,7 +55,7 @@ removed by the compiler, the resulting slowdown is negligible."
>  
>  -doc_begin="Comments starting with '/*' and containing hyperlinks are safe as
>  they are not instances of commented-out code."
> --config=MC3R1.R3.1,reports+={safe, "first_area(text(^.*https?://.*$))"}
> +-config=MC3A2.R3.1,reports+={safe, "first_area(text(^.*https?://.*$))"}
>  -doc_end
>  
>  #
> @@ -63,25 +63,25 @@ they are not instances of commented-out code."
>  #
>  
>  -doc_begin="The directive has been accepted only for the ARM codebase."
> --config=MC3R1.D4.3,reports+={disapplied,"!(any_area(any_loc(file(^xen/arch/arm/arm64/.*$))))"}
> +-config=MC3A2.D4.3,reports+={disapplied,"!(any_area(any_loc(file(^xen/arch/arm/arm64/.*$))))"}
>  -doc_end
>  
>  -doc_begin="The inline asm in 'arm64/lib/bitops.c' is tightly coupled with the surronding C code that acts as a wrapper, so it has been decided not to add an additional encapsulation layer."
>  -file_tag+={arm64_bitops, "^xen/arch/arm/arm64/lib/bitops\\.c$"}
> --config=MC3R1.D4.3,reports+={deliberate, "all_area(any_loc(file(arm64_bitops)&&any_exp(macro(^(bit|test)op$))))"}
> --config=MC3R1.D4.3,reports+={deliberate, "any_area(any_loc(file(arm64_bitops))&&context(name(int_clear_mask16)))"}
> +-config=MC3A2.D4.3,reports+={deliberate, "all_area(any_loc(file(arm64_bitops)&&any_exp(macro(^(bit|test)op$))))"}
> +-config=MC3A2.D4.3,reports+={deliberate, "any_area(any_loc(file(arm64_bitops))&&context(name(int_clear_mask16)))"}
>  -doc_end
>  
>  -doc_begin="Files that are intended to be included more than once do not need to
>  conform to the directive."
> --config=MC3R1.D4.10,reports+={safe, "first_area(text(^/\\* This file is legitimately included multiple times\\. \\*/$, begin-4))"}
> --config=MC3R1.D4.10,reports+={safe, "first_area(text(^/\\* Generated file, do not edit! \\*/$, begin-3))"}
> --config=MC3R1.D4.10,reports+={safe, "all_area(all_loc(file(^xen/include/generated/autoconf.h$)))"}
> +-config=MC3A2.D4.10,reports+={safe, "first_area(text(^/\\* This file is legitimately included multiple times\\. \\*/$, begin-4))"}
> +-config=MC3A2.D4.10,reports+={safe, "first_area(text(^/\\* Generated file, do not edit! \\*/$, begin-3))"}
> +-config=MC3A2.D4.10,reports+={safe, "all_area(all_loc(file(^xen/include/generated/autoconf.h$)))"}
>  -doc_end
>  
>  -doc_begin="Including multiple times a .c file is safe because every function or data item
>  it defines would (in the common case) be already defined. Peer reviewed by the community."
> --config=MC3R1.D4.10,reports+={safe, "all_area(all_loc(^.*\\.c$))"}
> +-config=MC3A2.D4.10,reports+={safe, "all_area(all_loc(^.*\\.c$))"}
>  -doc_end
>  
>  #
> @@ -90,50 +90,50 @@ it defines would (in the common case) be already defined. Peer reviewed by the c
>  
>  -doc_begin="The project adopted the rule with an exception listed in
>  'docs/misra/rules.rst'"
> --config=MC3R1.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^READ_SYSREG$))&&any_exp(macro(^WRITE_SYSREG$))))"}
> --config=MC3R1.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^max(_t)?$))&&any_exp(macro(^min(_t)?$))))"}
> --config=MC3R1.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^read[bwlq]$))&&any_exp(macro(^read[bwlq]_relaxed$))))"}
> --config=MC3R1.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^per_cpu$))&&any_exp(macro(^this_cpu$))))"}
> --config=MC3R1.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^__emulate_2op$))&&any_exp(macro(^__emulate_2op_nobyte$))))"}
> --config=MC3R1.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^read_debugreg$))&&any_exp(macro(^write_debugreg$))))"}
> +-config=MC3A2.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^READ_SYSREG$))&&any_exp(macro(^WRITE_SYSREG$))))"}
> +-config=MC3A2.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^max(_t)?$))&&any_exp(macro(^min(_t)?$))))"}
> +-config=MC3A2.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^read[bwlq]$))&&any_exp(macro(^read[bwlq]_relaxed$))))"}
> +-config=MC3A2.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^per_cpu$))&&any_exp(macro(^this_cpu$))))"}
> +-config=MC3A2.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^__emulate_2op$))&&any_exp(macro(^__emulate_2op_nobyte$))))"}
> +-config=MC3A2.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^read_debugreg$))&&any_exp(macro(^write_debugreg$))))"}
>  -doc_end
>  
>  -doc_begin="Macros expanding to their own identifier (e.g., \"#define x x\") are deliberate."
> --config=MC3R1.R5.5,reports+={deliberate, "all_area(macro(same_id_body())||!macro(!same_id_body()))"}
> +-config=MC3A2.R5.5,reports+={deliberate, "all_area(macro(same_id_body())||!macro(!same_id_body()))"}
>  -doc_end
>  
>  -doc_begin="There is no clash between function like macros and not callable objects."
> --config=MC3R1.R5.5,reports+={deliberate, "all_area(macro(function_like())||decl(any()))&&all_area(macro(any())||!decl(kind(function))&&!decl(__function_pointer_decls))"}
> +-config=MC3A2.R5.5,reports+={deliberate, "all_area(macro(function_like())||decl(any()))&&all_area(macro(any())||!decl(kind(function))&&!decl(__function_pointer_decls))"}
>  -doc_end
>  
>  -doc_begin="Clashes between function names and macros are deliberate for string handling functions since some architectures may want to use their own arch-specific implementation."
> --config=MC3R1.R5.5,reports+={deliberate, "all_area(all_loc(file(^xen/arch/x86/string\\.c|xen/include/xen/string\\.h|xen/lib/.*$)))"}
> +-config=MC3A2.R5.5,reports+={deliberate, "all_area(all_loc(file(^xen/arch/x86/string\\.c|xen/include/xen/string\\.h|xen/lib/.*$)))"}
>  -doc_end
>  
>  -doc_begin="In libelf, clashes between macros and function names are deliberate and needed to prevent the use of undecorated versions of memcpy, memset and memmove."
> --config=MC3R1.R5.5,reports+={deliberate, "any_area(decl(kind(function))||any_loc(macro(name(memcpy||memset||memmove))))&&any_area(any_loc(file(^xen/common/libelf/libelf-private\\.h$)))"}
> +-config=MC3A2.R5.5,reports+={deliberate, "any_area(decl(kind(function))||any_loc(macro(name(memcpy||memset||memmove))))&&any_area(any_loc(file(^xen/common/libelf/libelf-private\\.h$)))"}
>  -doc_end
>  
>  -doc_begin="The type \"ret_t\" is deliberately defined multiple times,
>  depending on the guest."
> --config=MC3R1.R5.6,reports+={deliberate,"any_area(any_loc(text(^.*ret_t.*$)))"}
> +-config=MC3A2.R5.6,reports+={deliberate,"any_area(any_loc(text(^.*ret_t.*$)))"}
>  -doc_end
>  
>  -doc_begin="On X86, the types \"guest_intpte_t\", \"guest_l1e_t\" and
>  \"guest_l2e_t\" are deliberately defined multiple times, depending on the
>  number of guest paging levels."
> --config=MC3R1.R5.6,reports+={deliberate,"any_area(any_loc(file(^xen/arch/x86/include/asm/guest_pt\\.h$)))&&any_area(any_loc(text(^.*(guest_intpte_t|guest_l[12]e_t).*$)))"}
> +-config=MC3A2.R5.6,reports+={deliberate,"any_area(any_loc(file(^xen/arch/x86/include/asm/guest_pt\\.h$)))&&any_area(any_loc(text(^.*(guest_intpte_t|guest_l[12]e_t).*$)))"}
>  -doc_end
>  
>  -doc_begin="The following files are imported from the gnu-efi package."
>  -file_tag+={adopted_r5_6,"^xen/include/efi/.*$"}
>  -file_tag+={adopted_r5_6,"^xen/arch/.*/include/asm/.*/efibind\\.h$"}
> --config=MC3R1.R5.6,reports+={deliberate,"any_area(any_loc(file(adopted_r5_6)))"}
> +-config=MC3A2.R5.6,reports+={deliberate,"any_area(any_loc(file(adopted_r5_6)))"}
>  -doc_end
>  
>  -doc_begin="The project intentionally reuses tag names in order to have identifiers matching the applicable external specifications as well as established internal conventions.
>  As there is little possibility for developer confusion not resulting into compilation errors, the risk of renaming outweighs the potential advantages of compliance."
> --config=MC3R1.R5.7,reports+={deliberate,"any()"}
> +-config=MC3A2.R5.7,reports+={deliberate,"any()"}
>  -doc_end
>  
>  #
> @@ -142,7 +142,7 @@ As there is little possibility for developer confusion not resulting into compil
>  
>  -doc_begin="It is safe to use certain octal constants the way they are defined
>  in specifications, manuals, and algorithm descriptions."
> --config=MC3R1.R7.1,reports+={safe, "any_area(any_loc(any_exp(text(^.*octal-ok.*$))))"}
> +-config=MC3A2.R7.1,reports+={safe, "any_area(any_loc(any_exp(text(^.*octal-ok.*$))))"}
>  -doc_end
>  
>  -doc_begin="Violations in files that maintainers have asked to not modify in the
> @@ -155,17 +155,17 @@ context of R7.2."
>  -file_tag+={adopted_r7_2,"^xen/arch/x86/cpu/intel\\.c$"}
>  -file_tag+={adopted_r7_2,"^xen/arch/x86/cpu/amd\\.c$"}
>  -file_tag+={adopted_r7_2,"^xen/arch/x86/cpu/common\\.c$"}
> --config=MC3R1.R7.2,reports+={deliberate,"any_area(any_loc(file(adopted_r7_2)))"}
> +-config=MC3A2.R7.2,reports+={deliberate,"any_area(any_loc(file(adopted_r7_2)))"}
>  -doc_end
>  
>  -doc_begin="Violations caused by __HYPERVISOR_VIRT_START are related to the
>  particular use of it done in xen_mk_ulong."
> --config=MC3R1.R7.2,reports+={deliberate,"any_area(any_loc(macro(name(BUILD_BUG_ON))))"}
> +-config=MC3A2.R7.2,reports+={deliberate,"any_area(any_loc(macro(name(BUILD_BUG_ON))))"}
>  -doc_end
>  
>  -doc_begin="Allow pointers of non-character type as long as the pointee is
>  const-qualified."
> --config=MC3R1.R7.4,same_pointee=false
> +-config=MC3A2.R7.4,same_pointee=false
>  -doc_end
>  
>  #
> @@ -173,7 +173,7 @@ const-qualified."
>  #
>  
>  -doc_begin="The type ret_t is deliberately used and defined as int or long depending on the architecture."
> --config=MC3R1.R8.3,reports+={deliberate,"any_area(any_loc(text(^.*ret_t.*$)))"}
> +-config=MC3A2.R8.3,reports+={deliberate,"any_area(any_loc(text(^.*ret_t.*$)))"}
>  -doc_end
>  
>  -doc_begin="The following files are imported from Linux and decompress.h defines a unique and documented interface towards all the (adopted) decompress functions."
> @@ -183,71 +183,71 @@ const-qualified."
>  -file_tag+={adopted_decompress_r8_3,"^xen/common/unlzo\\.c$"}
>  -file_tag+={adopted_decompress_r8_3,"^xen/common/unxz\\.c$"}
>  -file_tag+={adopted_decompress_r8_3,"^xen/common/unzstd\\.c$"}
> --config=MC3R1.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_decompress_r8_3)))&&any_area(any_loc(file(^xen/include/xen/decompress\\.h$)))"}
> +-config=MC3A2.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_decompress_r8_3)))&&any_area(any_loc(file(^xen/include/xen/decompress\\.h$)))"}
>  -doc_end
>  
>  -doc_begin="Parameter name \"unused\" (with an optional numeric suffix) is deliberate and makes explicit the intention of not using such parameter within the function."
> --config=MC3R1.R8.3,reports+={deliberate, "any_area(^.*parameter `unused[0-9]*'.*$)"}
> +-config=MC3A2.R8.3,reports+={deliberate, "any_area(^.*parameter `unused[0-9]*'.*$)"}
>  -doc_end
>  
>  -doc_begin="The following file is imported from Linux: ignore for now."
>  -file_tag+={adopted_time_r8_3,"^xen/arch/x86/time\\.c$"}
> --config=MC3R1.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_time_r8_3)))&&(any_area(any_loc(file(^xen/include/xen/time\\.h$)))||any_area(any_loc(file(^xen/arch/x86/include/asm/setup\\.h$))))"}
> +-config=MC3A2.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_time_r8_3)))&&(any_area(any_loc(file(^xen/include/xen/time\\.h$)))||any_area(any_loc(file(^xen/arch/x86/include/asm/setup\\.h$))))"}
>  -doc_end
>  
>  -doc_begin="The following file is imported from Linux: ignore for now."
>  -file_tag+={adopted_cpu_idle_r8_3,"^xen/arch/x86/acpi/cpu_idle\\.c$"}
> --config=MC3R1.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_cpu_idle_r8_3)))&&any_area(any_loc(file(^xen/include/xen/pmstat\\.h$)))"}
> +-config=MC3A2.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_cpu_idle_r8_3)))&&any_area(any_loc(file(^xen/include/xen/pmstat\\.h$)))"}
>  -doc_end
>  
>  -doc_begin="The following file is imported from Linux: ignore for now."
>  -file_tag+={adopted_mpparse_r8_3,"^xen/arch/x86/mpparse\\.c$"}
> --config=MC3R1.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_mpparse_r8_3)))&&any_area(any_loc(file(^xen/arch/x86/include/asm/mpspec\\.h$)))"}
> +-config=MC3A2.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_mpparse_r8_3)))&&any_area(any_loc(file(^xen/arch/x86/include/asm/mpspec\\.h$)))"}
>  -doc_end
>  
>  -doc_begin="The definitions present in this file are meant to generate definitions for asm modules, and are not called by C code. Therefore the absence of prior declarations is safe."
>  -file_tag+={asm_offsets, "^xen/arch/(arm|x86)/(arm32|arm64|x86_64)/asm-offsets\\.c$"}
> --config=MC3R1.R8.4,reports+={safe, "first_area(any_loc(file(asm_offsets)))"}
> +-config=MC3A2.R8.4,reports+={safe, "first_area(any_loc(file(asm_offsets)))"}
>  -doc_end
>  
>  -doc_begin="The functions defined in this file are meant to be called from gcc-generated code in a non-release build configuration.
>  Therefore the absence of prior declarations is safe."
>  -file_tag+={gcov, "^xen/common/coverage/gcov_base\\.c$"}
> --config=MC3R1.R8.4,reports+={safe, "first_area(any_loc(file(gcov)))"}
> +-config=MC3A2.R8.4,reports+={safe, "first_area(any_loc(file(gcov)))"}
>  -doc_end
>  
>  -doc_begin="Recognize the occurrence of current_stack_pointer as a declaration."
>  -file_tag+={asm_defns, "^xen/arch/x86/include/asm/asm_defns\\.h$"}
> --config=MC3R1.R8.4,declarations+={safe, "loc(file(asm_defns))&&^current_stack_pointer$"}
> +-config=MC3A2.R8.4,declarations+={safe, "loc(file(asm_defns))&&^current_stack_pointer$"}
>  -doc_end
>  
>  -doc_begin="The function apei_(read|check|clear)_mce are dead code and are excluded from non-debug builds, therefore the absence of prior declarations is safe."
> --config=MC3R1.R8.4,declarations+={safe, "^apei_(read|check|clear)_mce\\(.*$"}
> +-config=MC3A2.R8.4,declarations+={safe, "^apei_(read|check|clear)_mce\\(.*$"}
>  -doc_end
>  
>  -doc_begin="asmlinkage is a marker to indicate that the function is only used to interface with asm modules."
> --config=MC3R1.R8.4,declarations+={safe,"loc(text(^(?s).*asmlinkage.*$, -1..0))"}
> +-config=MC3A2.R8.4,declarations+={safe,"loc(text(^(?s).*asmlinkage.*$, -1..0))"}
>  -doc_end
>  
>  -doc_begin="Given that bsearch and sort are defined with the attribute 'gnu_inline', it's deliberate not to have a prior declaration.
>  See Section \"6.33.1 Common Function Attributes\" of \"GCC_MANUAL\" for a full explanation of gnu_inline."
>  -file_tag+={bsearch_sort, "^xen/include/xen/(sort|lib)\\.h$"}
> --config=MC3R1.R8.4,reports+={deliberate, "any_area(any_loc(file(bsearch_sort))&&decl(name(bsearch||sort)))"}
> +-config=MC3A2.R8.4,reports+={deliberate, "any_area(any_loc(file(bsearch_sort))&&decl(name(bsearch||sort)))"}
>  -doc_end
>  
>  -doc_begin="first_valid_mfn is defined in this way because the current lack of NUMA support in Arm and PPC requires it."
>  -file_tag+={first_valid_mfn, "^xen/common/page_alloc\\.c$"}
> --config=MC3R1.R8.4,declarations+={deliberate,"loc(file(first_valid_mfn))"}
> +-config=MC3A2.R8.4,declarations+={deliberate,"loc(file(first_valid_mfn))"}
>  -doc_end
>  
>  -doc_begin="The following variables are compiled in multiple translation units
>  belonging to different executables and therefore are safe."
> --config=MC3R1.R8.6,declarations+={safe, "name(current_stack_pointer||bsearch||sort)"}
> +-config=MC3A2.R8.6,declarations+={safe, "name(current_stack_pointer||bsearch||sort)"}
>  -doc_end
>  
>  -doc_begin="Declarations without definitions are allowed (specifically when the
>  definition is compiled-out or optimized-out by the compiler)"
> --config=MC3R1.R8.6,reports+={deliberate, "first_area(^.*has no definition$)"}
> +-config=MC3A2.R8.6,reports+={deliberate, "first_area(^.*has no definition$)"}
>  -doc_end
>  
>  -doc_begin="The search procedure for Unix linkers is well defined, see ld(1)
> @@ -258,11 +258,11 @@ the linker will include the appropriate file(s) from the archive\".
>  In Xen, thanks to the order in which file names appear in the build commands,
>  if arch-specific definitions are present, they get always linked in before
>  searching in the lib.a archive resulting from xen/lib."
> --config=MC3R1.R8.6,declarations+={deliberate, "loc(file(^xen/lib/.*$))"}
> +-config=MC3A2.R8.6,declarations+={deliberate, "loc(file(^xen/lib/.*$))"}
>  -doc_end
>  
>  -doc_begin="The gnu_inline attribute without static is deliberately allowed."
> --config=MC3R1.R8.10,declarations+={deliberate,"property(gnu_inline)"}
> +-config=MC3A2.R8.10,declarations+={deliberate,"property(gnu_inline)"}
>  -doc_end
>  
>  #
> @@ -272,12 +272,12 @@ searching in the lib.a archive resulting from xen/lib."
>  -doc_begin="Violations in files that maintainers have asked to not modify in the
>  context of R9.1."
>  -file_tag+={adopted_r9_1,"^xen/arch/arm/arm64/lib/find_next_bit\\.c$"}
> --config=MC3R1.R9.1,reports+={deliberate,"any_area(any_loc(file(adopted_r9_1)))"}
> +-config=MC3A2.R9.1,reports+={deliberate,"any_area(any_loc(file(adopted_r9_1)))"}
>  -doc_end
>  
>  -doc_begin="The possibility of committing mistakes by specifying an explicit
>  dimension is higher than omitting the dimension."
> --config=MC3R1.R9.5,reports+={deliberate, "any()"}
> +-config=MC3A2.R9.5,reports+={deliberate, "any()"}
>  -doc_end
>  
>  #
> @@ -285,45 +285,45 @@ dimension is higher than omitting the dimension."
>  #
>  
>  -doc_begin="The value-preserving conversions of integer constants are safe"
> --config=MC3R1.R10.1,etypes={safe,"any()","preserved_integer_constant()"}
> --config=MC3R1.R10.3,etypes={safe,"any()","preserved_integer_constant()"}
> --config=MC3R1.R10.4,etypes={safe,"any()","preserved_integer_constant()||sibling(rhs,preserved_integer_constant())"}
> +-config=MC3A2.R10.1,etypes={safe,"any()","preserved_integer_constant()"}
> +-config=MC3A2.R10.3,etypes={safe,"any()","preserved_integer_constant()"}
> +-config=MC3A2.R10.4,etypes={safe,"any()","preserved_integer_constant()||sibling(rhs,preserved_integer_constant())"}
>  -doc_end
>  
>  -doc_begin="Shifting non-negative integers to the right is safe."
> --config=MC3R1.R10.1,etypes+={safe,
> +-config=MC3A2.R10.1,etypes+={safe,
>    "stmt(node(binary_operator)&&operator(shr))",
>    "src_expr(definitely_in(0..))"}
>  -doc_end
>  
>  -doc_begin="Shifting non-negative integers to the left is safe if the result is
>  still non-negative."
> --config=MC3R1.R10.1,etypes+={safe,
> +-config=MC3A2.R10.1,etypes+={safe,
>    "stmt(node(binary_operator)&&operator(shl)&&definitely_in(0..))",
>    "src_expr(definitely_in(0..))"}
>  -doc_end
>  
>  -doc_begin="Bitwise logical operations on non-negative integers are safe."
> --config=MC3R1.R10.1,etypes+={safe,
> +-config=MC3A2.R10.1,etypes+={safe,
>    "stmt(node(binary_operator)&&operator(and||or||xor))",
>    "src_expr(definitely_in(0..))"}
>  -doc_end
>  
>  -doc_begin="The implicit conversion to Boolean for logical operator arguments is well known to all Xen developers to be a comparison with 0"
> --config=MC3R1.R10.1,etypes+={safe, "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", "dst_type(ebool||boolean)"}
> +-config=MC3A2.R10.1,etypes+={safe, "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", "dst_type(ebool||boolean)"}
>  -doc_end
>  
>  -doc_begin="The macro ISOLATE_LSB encapsulates a well-known pattern to obtain
>  a mask where only the lowest bit set in the argument is set, if any, for unsigned
>  integers arguments on two's complement architectures
>  (all the architectures supported by Xen satisfy this requirement)."
> --config=MC3R1.R10.1,reports+={safe, "any_area(any_loc(any_exp(macro(^ISOLATE_LSB$))))"}
> +-config=MC3A2.R10.1,reports+={safe, "any_area(any_loc(any_exp(macro(^ISOLATE_LSB$))))"}
>  -doc_end
>  
>  -doc_begin="XEN only supports architectures where signed integers are
>  representend using two's complement and all the XEN developers are aware of
>  this."
> --config=MC3R1.R10.1,etypes+={safe,
> +-config=MC3A2.R10.1,etypes+={safe,
>    "stmt(operator(and||or||xor||not||and_assign||or_assign||xor_assign))",
>    "any()"}
>  -doc_end
> @@ -334,7 +334,7 @@ C language, GCC does not use the latitude given in C99 and C11 only to treat
>  certain aspects of signed `<<' as undefined. However, -fsanitize=shift (and
>  -fsanitize=undefined) will diagnose such cases. They are also diagnosed where
>  constant expressions are required.\""
> --config=MC3R1.R10.1,etypes+={safe,
> +-config=MC3A2.R10.1,etypes+={safe,
>    "stmt(operator(shl||shr||shl_assign||shr_assign))",
>    "any()"}
>  -doc_end
> @@ -344,7 +344,7 @@ constant expressions are required.\""
>  #
>  
>  -doc_begin="The conversion from a function pointer to unsigned long or (void *) does not lose any information, provided that the target type has enough bits to store it."
> --config=MC3R1.R11.1,casts+={safe,
> +-config=MC3A2.R11.1,casts+={safe,
>    "from(type(canonical(__function_pointer_types)))
>     &&to(type(canonical(builtin(unsigned long)||pointer(builtin(void)))))
>     &&relation(definitely_preserves_value)"
> @@ -352,14 +352,14 @@ constant expressions are required.\""
>  -doc_end
>  
>  -doc_begin="The conversion from a function pointer to a boolean has a well-known semantics that do not lead to unexpected behaviour."
> --config=MC3R1.R11.1,casts+={safe,
> +-config=MC3A2.R11.1,casts+={safe,
>    "from(type(canonical(__function_pointer_types)))
>     &&kind(pointer_to_boolean)"
>  }
>  -doc_end
>  
>  -doc_begin="The conversion from a pointer to an incomplete type to unsigned long does not lose any information, provided that the target type has enough bits to store it."
> --config=MC3R1.R11.2,casts+={safe,
> +-config=MC3A2.R11.2,casts+={safe,
>    "from(type(any()))
>     &&to(type(canonical(builtin(unsigned long))))
>     &&relation(definitely_preserves_value)"
> @@ -367,20 +367,20 @@ constant expressions are required.\""
>  -doc_end
>  
>  -doc_begin="Conversions to object pointers that have a pointee type with a smaller (i.e., less strict) alignment requirement are safe."
> --config=MC3R1.R11.3,casts+={safe,
> +-config=MC3A2.R11.3,casts+={safe,
>    "!relation(more_aligned_pointee)"
>  }
>  -doc_end
>  
>  -doc_begin="Conversions from and to integral types are safe, in the assumption that the target type has enough bits to store the value.
>  See also Section \"4.7 Arrays and Pointers\" of \"GCC_MANUAL\""
> --config=MC3R1.R11.6,casts+={safe,
> +-config=MC3A2.R11.6,casts+={safe,
>      "(from(type(canonical(integral())))||to(type(canonical(integral()))))
>       &&relation(definitely_preserves_value)"}
>  -doc_end
>  
>  -doc_begin="The conversion from a pointer to a boolean has a well-known semantics that do not lead to unexpected behaviour."
> --config=MC3R1.R11.6,casts+={safe,
> +-config=MC3A2.R11.6,casts+={safe,
>    "from(type(canonical(__pointer_types)))
>     &&kind(pointer_to_boolean)"
>  }
> @@ -390,11 +390,11 @@ See also Section \"4.7 Arrays and Pointers\" of \"GCC_MANUAL\""
>  with the provided offset. The resulting pointer is then immediately cast back to its
>  original type, which preserves the qualifier. This use is deemed safe.
>  Fixing this violation would require to increase code complexity and lower readability."
> --config=MC3R1.R11.8,reports+={safe,"any_area(any_loc(any_exp(macro(^container_of$))))"}
> +-config=MC3A2.R11.8,reports+={safe,"any_area(any_loc(any_exp(macro(^container_of$))))"}
>  -doc_end
>  
>  -doc_begin="This construct is used to check if the type is scalar, and for this purpose the use of 0 as a null pointer constant is deliberate."
> --config=MC3R1.R11.9,reports+={deliberate, "any_area(any_loc(any_exp(macro(^__ACCESS_ONCE$))))"
> +-config=MC3A2.R11.9,reports+={deliberate, "any_area(any_loc(any_exp(macro(^__ACCESS_ONCE$))))"
>  }
>  -doc_end
>  
> @@ -404,16 +404,16 @@ Fixing this violation would require to increase code complexity and lower readab
>  
>  -doc_begin="All developers and reviewers can be safely assumed to be well aware
>  of the short-circuit evaluation strategy of such logical operators."
> --config=MC3R1.R13.5,reports+={disapplied,"any()"}
> +-config=MC3A2.R13.5,reports+={disapplied,"any()"}
>  -doc_end
>  
>  -doc_begin="Macros alternative_v?call[0-9] use sizeof and typeof to check that the argument types match the corresponding parameter ones."
> --config=MC3R1.R13.6,reports+={deliberate,"any_area(any_loc(any_exp(macro(^alternative_vcall[0-9]$))&&file(^xen/arch/x86/include/asm/alternative\\.h*$)))"}
> +-config=MC3A2.R13.6,reports+={deliberate,"any_area(any_loc(any_exp(macro(^alternative_vcall[0-9]$))&&file(^xen/arch/x86/include/asm/alternative\\.h*$)))"}
>  -config=B.UNEVALEFF,reports+={deliberate,"any_area(any_loc(any_exp(macro(^alternative_v?call[0-9]$))&&file(^xen/arch/x86/include/asm/alterantive\\.h*$)))"}
>  -doc_end
>  
>  -doc_begin="Anything, no matter how complicated, inside the BUILD_BUG_ON macro is subject to a compile-time evaluation without relevant side effects."
> --config=MC3R1.R13.6,reports+={safe,"any_area(any_loc(any_exp(macro(name(BUILD_BUG_ON)))))"}
> +-config=MC3A2.R13.6,reports+={safe,"any_area(any_loc(any_exp(macro(name(BUILD_BUG_ON)))))"}
>  -config=B.UNEVALEFF,reports+={safe,"any_area(any_loc(any_exp(macro(name(BUILD_BUG_ON)))))"}
>  -doc_end
>  
> @@ -424,31 +424,31 @@ of the short-circuit evaluation strategy of such logical operators."
>  -doc_begin="The severe restrictions imposed by this rule on the use of for
>  statements are not balanced by the presumed facilitation of the peer review
>  activity."
> --config=MC3R1.R14.2,reports+={disapplied,"any()"}
> +-config=MC3A2.R14.2,reports+={disapplied,"any()"}
>  -doc_end
>  
>  -doc_begin="The XEN team relies on the fact that invariant conditions of 'if' statements and conditional operators are deliberate"
> --config=MC3R1.R14.3,statements+={deliberate, "wrapped(any(),node(if_stmt||conditional_operator||binary_conditional_operator))" }
> +-config=MC3A2.R14.3,statements+={deliberate, "wrapped(any(),node(if_stmt||conditional_operator||binary_conditional_operator))" }
>  -doc_end
>  
>  -doc_begin="Switches having a 'sizeof' operator as the condition are deliberate and have limited scope."
> --config=MC3R1.R14.3,statements+={deliberate, "wrapped(any(),node(switch_stmt)&&child(cond, operator(sizeof)))" }
> +-config=MC3A2.R14.3,statements+={deliberate, "wrapped(any(),node(switch_stmt)&&child(cond, operator(sizeof)))" }
>  -doc_end
>  
>  -doc_begin="The use of an invariant size argument in {put,get}_unsafe_size and array_access_ok, as defined in arch/x86(_64)?/include/asm/uaccess.h is deliberate and is deemed safe."
>  -file_tag+={x86_uaccess, "^xen/arch/x86(_64)?/include/asm/uaccess\\.h$"}
> --config=MC3R1.R14.3,reports+={deliberate, "any_area(any_loc(file(x86_uaccess)&&any_exp(macro(^(put|get)_unsafe_size$))))"}
> --config=MC3R1.R14.3,reports+={deliberate, "any_area(any_loc(file(x86_uaccess)&&any_exp(macro(^array_access_ok$))))"}
> +-config=MC3A2.R14.3,reports+={deliberate, "any_area(any_loc(file(x86_uaccess)&&any_exp(macro(^(put|get)_unsafe_size$))))"}
> +-config=MC3A2.R14.3,reports+={deliberate, "any_area(any_loc(file(x86_uaccess)&&any_exp(macro(^array_access_ok$))))"}
>  -doc_end
>  
>  -doc_begin="A controlling expression of 'if' and iteration statements having integer, character or pointer type has a semantics that is well-known to all Xen developers."
> --config=MC3R1.R14.4,etypes+={deliberate, "any()", "src_type(integer||character)||src_expr(type(desugar(pointer(any()))))"}
> +-config=MC3A2.R14.4,etypes+={deliberate, "any()", "src_type(integer||character)||src_expr(type(desugar(pointer(any()))))"}
>  -doc_end
>  
>  -doc_begin="The XEN team relies on the fact that the enum is_dying has the
>  constant with assigned value 0 act as false and the other ones as true,
>  therefore have the same behavior of a boolean"
> --config=MC3R1.R14.4,etypes+={deliberate, "stmt(child(cond,child(expr,ref(^<?domain>?::is_dying$))))","src_type(enum)"}
> +-config=MC3A2.R14.4,etypes+={deliberate, "stmt(child(cond,child(expr,ref(^<?domain>?::is_dying$))))","src_type(enum)"}
>  -doc_end
>  
>  #
> @@ -459,58 +459,58 @@ therefore have the same behavior of a boolean"
>  therefore it is deemed better to leave such files as is."
>  -file_tag+={x86_emulate,"^xen/arch/x86/x86_emulate/.*$"}
>  -file_tag+={x86_svm_emulate,"^xen/arch/x86/hvm/svm/emulate\\.c$"}
> --config=MC3R1.R16.2,reports+={deliberate, "any_area(any_loc(file(x86_emulate||x86_svm_emulate)))"}
> +-config=MC3A2.R16.2,reports+={deliberate, "any_area(any_loc(file(x86_emulate||x86_svm_emulate)))"}
>  -doc_end
>  
>  -doc_begin="Statements that change the control flow (i.e., break, continue, goto, return) and calls to functions that do not return the control back are \"allowed terminal statements\"."
>  -stmt_selector+={r16_3_allowed_terminal, "node(break_stmt||continue_stmt||goto_stmt||return_stmt)||call(property(noreturn))"}
> --config=MC3R1.R16.3,terminals+={safe, "r16_3_allowed_terminal"}
> +-config=MC3A2.R16.3,terminals+={safe, "r16_3_allowed_terminal"}
>  -doc_end
>  
>  -doc_begin="An if-else statement having both branches ending with an allowed terminal statement is itself an allowed terminal statement."
>  -stmt_selector+={r16_3_if, "node(if_stmt)&&(child(then,r16_3_allowed_terminal)||child(then,any_stmt(stmt,-1,r16_3_allowed_terminal)))"}
>  -stmt_selector+={r16_3_else, "node(if_stmt)&&(child(else,r16_3_allowed_terminal)||child(else,any_stmt(stmt,-1,r16_3_allowed_terminal)))"}
>  -stmt_selector+={r16_3_if_else, "r16_3_if&&r16_3_else"}
> --config=MC3R1.R16.3,terminals+={safe, "r16_3_if_else"}
> +-config=MC3A2.R16.3,terminals+={safe, "r16_3_if_else"}
>  -doc_end
>  
>  -doc_begin="An if-else statement having an always true condition and the true branch ending with an allowed terminal statement is itself an allowed terminal statement."
>  -stmt_selector+={r16_3_if_true, "r16_3_if&&child(cond,definitely_in(1..))"}
> --config=MC3R1.R16.3,terminals+={safe, "r16_3_if_true"}
> +-config=MC3A2.R16.3,terminals+={safe, "r16_3_if_true"}
>  -doc_end
>  
>  -doc_begin="A switch clause ending with a statement expression which, in turn, ends with an allowed terminal statement is safe."
> --config=MC3R1.R16.3,terminals+={safe, "node(stmt_expr)&&child(stmt,node(compound_stmt)&&any_stmt(stmt,-1,r16_3_allowed_terminal||r16_3_if_else||r16_3_if_true))"}
> +-config=MC3A2.R16.3,terminals+={safe, "node(stmt_expr)&&child(stmt,node(compound_stmt)&&any_stmt(stmt,-1,r16_3_allowed_terminal||r16_3_if_else||r16_3_if_true))"}
>  -doc_end
>  
>  -doc_begin="A switch clause ending with a do-while-false the body of which, in turn, ends with an allowed terminal statement is safe.
>  An exception to that is the macro ASSERT_UNREACHABLE() which is effective in debug build only: a switch clause ending with ASSERT_UNREACHABLE() is not considered safe."
> --config=MC3R1.R16.3,terminals+={safe, "!macro(name(ASSERT_UNREACHABLE))&&node(do_stmt)&&child(cond,definitely_in(0))&&child(body,any_stmt(stmt,-1,r16_3_allowed_terminal||r16_3_if_else||r16_3_if_true))"}
> +-config=MC3A2.R16.3,terminals+={safe, "!macro(name(ASSERT_UNREACHABLE))&&node(do_stmt)&&child(cond,definitely_in(0))&&child(body,any_stmt(stmt,-1,r16_3_allowed_terminal||r16_3_if_else||r16_3_if_true))"}
>  -doc_end
>  
>  -doc_begin="Switch clauses ending with pseudo-keyword \"fallthrough\" are
>  safe."
> --config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(/fallthrough;/))))"}
> +-config=MC3A2.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(/fallthrough;/))))"}
>  -doc_end
>  
>  -doc_begin="Switch clauses ending with failure method \"BUG()\" are safe."
> --config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(/BUG\\(\\);/))))"}
> +-config=MC3A2.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(/BUG\\(\\);/))))"}
>  -doc_end
>  
>  -doc_begin="Switch clauses ending with an explicit comment indicating the fallthrough intention are safe."
> --config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through\\.? \\*/.*$,0..2))))"}
> +-config=MC3A2.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through\\.? \\*/.*$,0..2))))"}
>  -doc_end
>  
>  -doc_begin="Switch statements having a controlling expression of enum type deliberately do not have a default case: gcc -Wall enables -Wswitch which warns (and breaks the build as we use -Werror) if one of the enum labels is missing from the switch."
> --config=MC3R1.R16.4,reports+={deliberate,'any_area(kind(context)&&^.* has no `default.*$&&stmt(node(switch_stmt)&&child(cond,skip(__non_syntactic_paren_stmts,type(canonical(enum_underlying_type(any())))))))'}
> +-config=MC3A2.R16.4,reports+={deliberate,'any_area(kind(context)&&^.* has no `default.*$&&stmt(node(switch_stmt)&&child(cond,skip(__non_syntactic_paren_stmts,type(canonical(enum_underlying_type(any())))))))'}
>  -doc_end
>  
>  -doc_begin="A switch statement with a single switch clause and no default label may be used in place of an equivalent if statement if it is considered to improve readability."
> --config=MC3R1.R16.4,switch_clauses+={deliberate,"switch(1)&&default(0)"}
> +-config=MC3A2.R16.4,switch_clauses+={deliberate,"switch(1)&&default(0)"}
>  -doc_end
>  
>  -doc_begin="A switch statement with a single switch clause and no default label may be used in place of an equivalent if statement if it is considered to improve readability."
> --config=MC3R1.R16.6,switch_clauses+={deliberate, "default(0)"}
> +-config=MC3A2.R16.6,switch_clauses+={deliberate, "default(0)"}
>  -doc_end
>  
>  #
> @@ -518,16 +518,16 @@ safe."
>  #
>  
>  -doc_begin="printf()-like functions are allowed to use the variadic features provided by stdarg.h."
> --config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printk\\(.*\\)$)))"}
> --config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printf\\(.*\\)$)))"}
> --config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(panic)&&kind(function))))"}
> --config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(elf_call_log_callback)&&kind(function))))"}
> --config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vprintk_common)&&kind(function))))"}
> --config=MC3R1.R17.1,macros+={hide , "^va_(arg|start|copy|end)$"}
> +-config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printk\\(.*\\)$)))"}
> +-config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printf\\(.*\\)$)))"}
> +-config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(panic)&&kind(function))))"}
> +-config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(elf_call_log_callback)&&kind(function))))"}
> +-config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vprintk_common)&&kind(function))))"}
> +-config=MC3A2.R17.1,macros+={hide , "^va_(arg|start|copy|end)$"}
>  -doc_end
>  
>  -doc_begin="Not using the return value of a function does not endanger safety if it coincides with an actual argument."
> --config=MC3R1.R17.7,calls+={safe, "any()", "decl(name(__builtin_memcpy||__builtin_memmove||__builtin_memset||cpumask_check))"}
> +-config=MC3A2.R17.7,calls+={safe, "any()", "decl(name(__builtin_memcpy||__builtin_memmove||__builtin_memset||cpumask_check))"}
>  -doc_end
>  
>  #
> @@ -538,16 +538,16 @@ safe."
>  are guaranteed not to be exploited by a compiler that relies on the absence of
>  C99 Undefined Behaviour 45: Pointers that do not point into, or just beyond, the same array object are subtracted (6.5.6)."
>  -eval_file=linker_symbols.ecl
> --config=MC3R1.R18.2,reports+={safe, "any_area(stmt(operator(sub)&&child(lhs||rhs, skip(__non_syntactic_paren_stmts, ref(linker_symbols)))))"}
> +-config=MC3A2.R18.2,reports+={safe, "any_area(stmt(operator(sub)&&child(lhs||rhs, skip(__non_syntactic_paren_stmts, ref(linker_symbols)))))"}
>  -doc_end
>  
>  -doc_begin="The following macro performs a subtraction between pointers to obtain the mfn, but does not lead to undefined behaviour."
> --config=MC3R1.R18.2,reports+={safe, "any_area(any_loc(any_exp(macro(^page_to_mfn$))))"}
> +-config=MC3A2.R18.2,reports+={safe, "any_area(any_loc(any_exp(macro(^page_to_mfn$))))"}
>  -doc_end
>  
>  -doc_begin="Flexible array members are deliberately used and XEN developers are aware of the dangers related to them:
>  unexpected result when the structure is given as argument to a sizeof() operator and the truncation in assignment between structures."
> --config=MC3R1.R18.7,reports+={deliberate, "any()"}
> +-config=MC3A2.R18.7,reports+={deliberate, "any()"}
>  -doc_end
>  
>  #
> @@ -558,7 +558,7 @@ unexpected result when the structure is given as argument to a sizeof() operator
>  as function arguments; (2) as macro arguments; (3) as array indices; (4) as lhs
>  in assignments; (5) as initializers, possibly designated, in initalizer lists;
>  (6) as the constant expression in a switch clause label."
> --config=MC3R1.R20.7,expansion_context=
> +-config=MC3A2.R20.7,expansion_context=
>  {safe, "context(__call_expr_arg_contexts)"},
>  {safe, "left_right(^[(,\\[]$,^[),\\]]$)"},
>  {safe, "context(skip_to(__expr_non_syntactic_contexts, stmt_child(node(array_subscript_expr), subscript)))"},
> @@ -571,62 +571,62 @@ in assignments; (5) as initializers, possibly designated, in initalizer lists;
>  breaking the macro's logic; futhermore, the macro is only ever used in the context
>  of the IS_ENABLED or STATIC_IF/STATIC_IF_NOT macros, so it always receives a literal
>  0 or 1 as input, posing no risk to safety."
> --config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(any_exp(macro(^___config_enabled$))))"}
> +-config=MC3A2.R20.7,reports+={safe, "any_area(any_loc(any_exp(macro(^___config_enabled$))))"}
>  -doc_end
>  
>  -doc_begin="Violations due to the use of macros defined in files that are
>  not in scope for compliance are allowed, as that is imported code."
>  -file_tag+={gnu_efi_include, "^xen/include/efi/.*$"}
>  -file_tag+={acpi_cpu_idle, "^xen/arch/x86/acpi/cpu_idle\\.c$"}
> --config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(file(gnu_efi_include)||any_exp(macro(^NextMemoryDescriptor$))))"}
> --config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(file(acpi_cpu_idle)))"}
> +-config=MC3A2.R20.7,reports+={safe, "any_area(any_loc(file(gnu_efi_include)||any_exp(macro(^NextMemoryDescriptor$))))"}
> +-config=MC3A2.R20.7,reports+={safe, "any_area(any_loc(file(acpi_cpu_idle)))"}
>  -doc_end
>  
>  -doc_begin="To avoid compromising readability, the macros alternative_(v)?call[0-9] are allowed
>  not to parenthesize their arguments."
> --config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(any_exp(macro(^alternative_(v)?call[0-9]$))))"}
> +-config=MC3A2.R20.7,reports+={safe, "any_area(any_loc(any_exp(macro(^alternative_(v)?call[0-9]$))))"}
>  -doc_end
>  
>  -doc_begin="The argument 'x' of the count_args_ macro can't be parenthesized as
>  the rule would require, without breaking the functionality of the macro. The uses
>  of this macro do not lead to developer confusion, and can thus be deviated."
> --config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(any_exp(macro(^count_args_$))))"}
> +-config=MC3A2.R20.7,reports+={safe, "any_area(any_loc(any_exp(macro(^count_args_$))))"}
>  -doc_end
>  
>  -doc_begin="The argument \"fn\" in macros {COMPILE,RUNTIME}_CHECK is not parenthesized
>  on purpose, to be able to test function-like macros. Given the specialized and limited
>  use of this macro, it is deemed ok to deviate them."
> --config=MC3R1.R20.7,reports+={deliberate, "any_area(any_loc(any_exp(macro(^(COMPILE_CHECK|RUNTIME_CHECK)$))))"}
> +-config=MC3A2.R20.7,reports+={deliberate, "any_area(any_loc(any_exp(macro(^(COMPILE_CHECK|RUNTIME_CHECK)$))))"}
>  -doc_end
>  
>  -doc_begin="Problems related to operator precedence can not occur if the expansion of the macro argument is surrounded by tokens '{', '}' and ';'."
> --config=MC3R1.R20.7,expansion_context+={safe, "left_right(^[\\{;]$,^[;\\}]$)"}
> +-config=MC3A2.R20.7,expansion_context+={safe, "left_right(^[\\{;]$,^[;\\}]$)"}
>  -doc_end
>  
>  -doc_begin="Uses of variadic macros that have one of their arguments defined as
>  a macro and used within the body for both ordinary parameter expansion and as an
>  operand to the # or ## operators have a behavior that is well-understood and
>  deliberate."
> --config=MC3R1.R20.12,macros+={deliberate, "variadic()"}
> +-config=MC3A2.R20.12,macros+={deliberate, "variadic()"}
>  -doc_end
>  
>  -doc_begin="Uses of a macro parameter for ordinary expansion and as an operand
>  to the # or ## operators within the following macros are deliberate, to provide
>  useful diagnostic messages to the user."
> --config=MC3R1.R20.12,macros+={deliberate, "name(ASSERT||BUILD_BUG_ON||BUILD_BUG_ON_ZERO||RUNTIME_CHECK)"}
> +-config=MC3A2.R20.12,macros+={deliberate, "name(ASSERT||BUILD_BUG_ON||BUILD_BUG_ON_ZERO||RUNTIME_CHECK)"}
>  -doc_end
>  
>  -doc_begin="The helper macro GENERATE_CASE may use a macro parameter for ordinary
>  expansion and token pasting to improve readability. Only instances where this
>  leads to a violation of the Rule are deviated."
>  -file_tag+={deliberate_generate_case, "^xen/arch/arm/vcpreg\\.c$"}
> --config=MC3R1.R20.12,macros+={deliberate, "name(GENERATE_CASE)&&loc(file(deliberate_generate_case))"}
> +-config=MC3A2.R20.12,macros+={deliberate, "name(GENERATE_CASE)&&loc(file(deliberate_generate_case))"}
>  -doc_end
>  
>  -doc_begin="The macro DEFINE is defined and used in excluded files asm-offsets.c.
>  This may still cause violations if entities outside these files are referred to
>  in the expansion."
> --config=MC3R1.R20.12,macros+={deliberate, "name(DEFINE)&&loc(file(asm_offsets))"}
> +-config=MC3A2.R20.12,macros+={deliberate, "name(DEFINE)&&loc(file(asm_offsets))"}
>  -doc_end
>  
>  #
> @@ -636,7 +636,7 @@ in the expansion."
>  -doc_begin="or, and and xor are reserved identifiers because they constitute alternate
>  spellings for the corresponding operators (they are defined as macros by iso646.h).
>  However, Xen doesn't use standard library headers, so there is no risk of overlap."
> --config=MC3R1.R21.2,reports+={safe, "any_area(stmt(ref(kind(label)&&^(or|and|xor|not)$)))"}
> +-config=MC3A2.R21.2,reports+={safe, "any_area(stmt(ref(kind(label)&&^(or|and|xor|not)$)))"}
>  -doc_end
>  
>  -doc_begin="Xen does not use the functions provided by the Standard Library, but
> @@ -645,8 +645,8 @@ The implementation of these functions is available in source form, so the undefi
>  or implementation-defined behaviors contemplated by the C Standard do not apply.
>  If some undefined or unspecified behavior does arise in the implementation, it
>  falls under the jurisdiction of other MISRA rules."
> --config=MC3R1.R21.9,reports+={deliberate, "any()"}
> --config=MC3R1.R21.10,reports+={deliberate, "any()"}
> +-config=MC3A2.R21.9,reports+={deliberate, "any()"}
> +-config=MC3A2.R21.10,reports+={deliberate, "any()"}
>  -doc_end
>  
>  #
> @@ -671,7 +671,7 @@ falls under the jurisdiction of other MISRA rules."
>  programmers:no developers' confusion is not possible. In addition, adopted code
>  is assumed to work as is. Reports that are fully contained in adopted code are
>  hidden/tagged with the 'adopted' tag."
> --service_selector={developer_confusion_guidelines,"^(MC3R1\\.R2\\.1|MC3R1\\.R2\\.2|MC3R1\\.R2\\.3|MC3R1\\.R2\\.4|MC3R1\\.R2\\.5|MC3R1\\.R2\\.6|MC3R1\\.R2\\.7|MC3R1\\.R4\\.1|MC3R1\\.R5\\.3|MC3R1\\.R5\\.6|MC3R1\\.R5\\.7|MC3R1\\.R5\\.8|MC3R1\\.R5\\.9|MC3R1\\.R7\\.1|MC3R1\\.R7\\.2|MC3R1\\.R7\\.3|MC3R1\\.R8\\.7|MC3R1\\.R8\\.8|MC3R1\\.R8\\.9|MC3R1\\.R8\\.11|MC3R1\\.R8\\.12|MC3R1\\.R8\\.13|MC3R1\\.R9\\.3|MC3R1\\.R9\\.4|MC3R1\\.R9\\.5|MC3R1\\.R10\\.2|MC3R1\\.R10\\.5|MC3R1\\.R10\\.6|MC3R1\\.R10\\.7|MC3R1\\.R10\\.8|MC3R1\\.R11\\.9|MC3R1\\.R12\\.1|MC3R1\\.R12\\.3|MC3R1\\.R12\\.4|MC3R1\\.R13\\.5|MC3R1\\.R14\\.1|MC3R1\\.R14\\.2|MC3R1\\.R14\\.3|MC3R1\\.R15\\.1|MC3R1\\.R15\\.2|MC3R1\\.R15\\.3|MC3R1\\.R15\\.4|MC3R1\\.R15\\.5|MC3R1\\.R15\\.6|MC3R1\\.R15\\.7|MC3R1\\.R16\\.1|MC3R1\\.R16\\.2|MC3R1\\.R16\\.3|MC3R1\\.R16\\.4|MC3R1\\.R16\\.5|MC3R1\\.R16\\.6|MC3R1\\.R16\\.7|MC3R1\\.R17\\.7|MC3R1\\.R17\\.8|MC3R1\\.R18\\.4|MC3R1\\.R18\\.5)$"
> +-service_selector={developer_confusion_guidelines,"^(MC3A2\\.R2\\.1|MC3A2\\.R2\\.2|MC3A2\\.R2\\.3|MC3A2\\.R2\\.4|MC3A2\\.R2\\.5|MC3A2\\.R2\\.6|MC3A2\\.R2\\.7|MC3A2\\.R4\\.1|MC3A2\\.R5\\.3|MC3A2\\.R5\\.6|MC3A2\\.R5\\.7|MC3A2\\.R5\\.8|MC3A2\\.R5\\.9|MC3A2\\.R7\\.1|MC3A2\\.R7\\.2|MC3A2\\.R7\\.3|MC3A2\\.R8\\.7|MC3A2\\.R8\\.8|MC3A2\\.R8\\.9|MC3A2\\.R8\\.11|MC3A2\\.R8\\.12|MC3A2\\.R8\\.13|MC3A2\\.R9\\.3|MC3A2\\.R9\\.4|MC3A2\\.R9\\.5|MC3A2\\.R10\\.2|MC3A2\\.R10\\.5|MC3A2\\.R10\\.6|MC3A2\\.R10\\.7|MC3A2\\.R10\\.8|MC3A2\\.R11\\.9|MC3A2\\.R12\\.1|MC3A2\\.R12\\.3|MC3A2\\.R12\\.4|MC3A2\\.R13\\.5|MC3A2\\.R14\\.1|MC3A2\\.R14\\.2|MC3A2\\.R14\\.3|MC3A2\\.R15\\.1|MC3A2\\.R15\\.2|MC3A2\\.R15\\.3|MC3A2\\.R15\\.4|MC3A2\\.R15\\.5|MC3A2\\.R15\\.6|MC3A2\\.R15\\.7|MC3A2\\.R16\\.1|MC3A2\\.R16\\.2|MC3A2\\.R16\\.3|MC3A2\\.R16\\.4|MC3A2\\.R16\\.5|MC3A2\\.R16\\.6|MC3A2\\.R16\\.7|MC3A2\\.R17\\.7|MC3A2\\.R17\\.8|MC3A2\\.R18\\.4|MC3A2\\.R18\\.5)$"
>  }
>  -config=developer_confusion_guidelines,reports+={relied,adopted_report}
>  -doc_end
> diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/eclair_analysis/ECLAIR/monitored.ecl
> index 4e1deef7a7..8351996ec8 100644
> --- a/automation/eclair_analysis/ECLAIR/monitored.ecl
> +++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
> @@ -1,106 +1,106 @@
>  -doc_begin="A set of guidelines that are clean or that only have few violations left."
> --enable=MC3R1.D1.1
> --enable=MC3R1.D2.1
> --enable=MC3R1.D4.1
> --enable=MC3R1.D4.3
> --enable=MC3R1.D4.7
> --enable=MC3R1.D4.10
> --enable=MC3R1.D4.11
> --enable=MC3R1.D4.14
> --enable=MC3R1.R1.1
> --enable=MC3R1.R1.3
> --enable=MC3R1.R1.4
> --enable=MC3R1.R2.1
> --enable=MC3R1.R2.6
> --enable=MC3R1.R3.1
> --enable=MC3R1.R3.2
> --enable=MC3R1.R4.1
> --enable=MC3R1.R4.2
> --enable=MC3R1.R5.1
> --enable=MC3R1.R5.2
> --enable=MC3R1.R5.3
> --enable=MC3R1.R5.4
> --enable=MC3R1.R5.5
> --enable=MC3R1.R5.6
> --enable=MC3R1.R6.1
> --enable=MC3R1.R6.2
> --enable=MC3R1.R7.1
> --enable=MC3R1.R7.2
> --enable=MC3R1.R7.3
> --enable=MC3R1.R7.4
> --enable=MC3R1.R8.1
> --enable=MC3R1.R8.2
> --enable=MC3R1.R8.3
> --enable=MC3R1.R8.4
> --enable=MC3R1.R8.5
> --enable=MC3R1.R8.6
> --enable=MC3R1.R8.8
> --enable=MC3R1.R8.10
> --enable=MC3R1.R8.12
> --enable=MC3R1.R8.14
> --enable=MC3R1.R9.2
> --enable=MC3R1.R9.3
> --enable=MC3R1.R9.4
> --enable=MC3R1.R10.1
> --enable=MC3R1.R10.2
> --enable=MC3R1.R11.1
> --enable=MC3R1.R11.2
> --enable=MC3R1.R11.7
> --enable=MC3R1.R11.8
> --enable=MC3R1.R11.9
> --enable=MC3R1.R12.5
> --enable=MC3R1.R13.1
> --enable=MC3R1.R13.2
> --enable=MC3R1.R13.6
> --enable=MC3R1.R14.1
> --enable=MC3R1.R14.4
> --enable=MC3R1.R16.2
> --enable=MC3R1.R16.3
> --enable=MC3R1.R16.4
> --enable=MC3R1.R16.6
> --enable=MC3R1.R16.7
> --enable=MC3R1.R17.1
> --enable=MC3R1.R17.3
> --enable=MC3R1.R17.4
> --enable=MC3R1.R17.5
> --enable=MC3R1.R17.6
> --enable=MC3R1.R18.1
> --enable=MC3R1.R18.2
> --enable=MC3R1.R18.6
> --enable=MC3R1.R18.8
> --enable=MC3R1.R19.1
> --enable=MC3R1.R20.2
> --enable=MC3R1.R20.3
> --enable=MC3R1.R20.4
> --enable=MC3R1.R20.6
> --enable=MC3R1.R20.7
> --enable=MC3R1.R20.9
> --enable=MC3R1.R20.11
> --enable=MC3R1.R20.12
> --enable=MC3R1.R20.13
> --enable=MC3R1.R20.14
> --enable=MC3R1.R21.3
> --enable=MC3R1.R21.4
> --enable=MC3R1.R21.5
> --enable=MC3R1.R21.7
> --enable=MC3R1.R21.8
> --enable=MC3R1.R21.9
> --enable=MC3R1.R21.10
> --enable=MC3R1.R21.12
> --enable=MC3R1.R21.13
> --enable=MC3R1.R21.17
> --enable=MC3R1.R21.18
> --enable=MC3R1.R21.19
> --enable=MC3R1.R21.20
> --enable=MC3R1.R21.21
> --enable=MC3R1.R22.1
> --enable=MC3R1.R22.2
> --enable=MC3R1.R22.3
> --enable=MC3R1.R22.4
> --enable=MC3R1.R22.5
> --enable=MC3R1.R22.6
> --enable=MC3R1.R22.7
> --enable=MC3R1.R22.8
> --enable=MC3R1.R22.9
> --enable=MC3R1.R22.10
> +-enable=MC3A2.D1.1
> +-enable=MC3A2.D2.1
> +-enable=MC3A2.D4.1
> +-enable=MC3A2.D4.3
> +-enable=MC3A2.D4.7
> +-enable=MC3A2.D4.10
> +-enable=MC3A2.D4.11
> +-enable=MC3A2.D4.14
> +-enable=MC3A2.R1.1
> +-enable=MC3A2.R1.3
> +-enable=MC3A2.R1.4
> +-enable=MC3A2.R2.1
> +-enable=MC3A2.R2.6
> +-enable=MC3A2.R3.1
> +-enable=MC3A2.R3.2
> +-enable=MC3A2.R4.1
> +-enable=MC3A2.R4.2
> +-enable=MC3A2.R5.1
> +-enable=MC3A2.R5.2
> +-enable=MC3A2.R5.3
> +-enable=MC3A2.R5.4
> +-enable=MC3A2.R5.5
> +-enable=MC3A2.R5.6
> +-enable=MC3A2.R6.1
> +-enable=MC3A2.R6.2
> +-enable=MC3A2.R7.1
> +-enable=MC3A2.R7.2
> +-enable=MC3A2.R7.3
> +-enable=MC3A2.R7.4
> +-enable=MC3A2.R8.1
> +-enable=MC3A2.R8.2
> +-enable=MC3A2.R8.3
> +-enable=MC3A2.R8.4
> +-enable=MC3A2.R8.5
> +-enable=MC3A2.R8.6
> +-enable=MC3A2.R8.8
> +-enable=MC3A2.R8.10
> +-enable=MC3A2.R8.12
> +-enable=MC3A2.R8.14
> +-enable=MC3A2.R9.2
> +-enable=MC3A2.R9.3
> +-enable=MC3A2.R9.4
> +-enable=MC3A2.R10.1
> +-enable=MC3A2.R10.2
> +-enable=MC3A2.R11.1
> +-enable=MC3A2.R11.2
> +-enable=MC3A2.R11.7
> +-enable=MC3A2.R11.8
> +-enable=MC3A2.R11.9
> +-enable=MC3A2.R12.5
> +-enable=MC3A2.R13.1
> +-enable=MC3A2.R13.2
> +-enable=MC3A2.R13.6
> +-enable=MC3A2.R14.1
> +-enable=MC3A2.R14.4
> +-enable=MC3A2.R16.2
> +-enable=MC3A2.R16.3
> +-enable=MC3A2.R16.4
> +-enable=MC3A2.R16.6
> +-enable=MC3A2.R16.7
> +-enable=MC3A2.R17.1
> +-enable=MC3A2.R17.3
> +-enable=MC3A2.R17.4
> +-enable=MC3A2.R17.5
> +-enable=MC3A2.R17.6
> +-enable=MC3A2.R18.1
> +-enable=MC3A2.R18.2
> +-enable=MC3A2.R18.6
> +-enable=MC3A2.R18.8
> +-enable=MC3A2.R19.1
> +-enable=MC3A2.R20.2
> +-enable=MC3A2.R20.3
> +-enable=MC3A2.R20.4
> +-enable=MC3A2.R20.6
> +-enable=MC3A2.R20.7
> +-enable=MC3A2.R20.9
> +-enable=MC3A2.R20.11
> +-enable=MC3A2.R20.12
> +-enable=MC3A2.R20.13
> +-enable=MC3A2.R20.14
> +-enable=MC3A2.R21.3
> +-enable=MC3A2.R21.4
> +-enable=MC3A2.R21.5
> +-enable=MC3A2.R21.7
> +-enable=MC3A2.R21.8
> +-enable=MC3A2.R21.9
> +-enable=MC3A2.R21.10
> +-enable=MC3A2.R21.12
> +-enable=MC3A2.R21.13
> +-enable=MC3A2.R21.17
> +-enable=MC3A2.R21.18
> +-enable=MC3A2.R21.19
> +-enable=MC3A2.R21.20
> +-enable=MC3A2.R21.21
> +-enable=MC3A2.R22.1
> +-enable=MC3A2.R22.2
> +-enable=MC3A2.R22.3
> +-enable=MC3A2.R22.4
> +-enable=MC3A2.R22.5
> +-enable=MC3A2.R22.6
> +-enable=MC3A2.R22.7
> +-enable=MC3A2.R22.8
> +-enable=MC3A2.R22.9
> +-enable=MC3A2.R22.10
>  -doc_end
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index 755ea3271f..b524318591 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -20,93 +20,93 @@
>  -doc_begin="Clean guidelines: new violations for these guidelines are not accepted."
>  
>  -service_selector={clean_guidelines_common,
> -"MC3R1.D1.1||
> -MC3R1.D2.1||
> -MC3R1.D4.1||
> -MC3R1.D4.11||
> -MC3R1.D4.14||
> -MC3R1.R1.1||
> -MC3R1.R1.3||
> -MC3R1.R1.4||
> -MC3R1.R2.6||
> -MC3R1.R3.1||
> -MC3R1.R3.2||
> -MC3R1.R4.1||
> -MC3R1.R4.2||
> -MC3R1.R5.1||
> -MC3R1.R5.2||
> -MC3R1.R5.3||
> -MC3R1.R5.4||
> -MC3R1.R5.6||
> -MC3R1.R6.1||
> -MC3R1.R6.2||
> -MC3R1.R7.1||
> -MC3R1.R7.2||
> -MC3R1.R7.3||
> -MC3R1.R7.4||
> -MC3R1.R8.1||
> -MC3R1.R8.2||
> -MC3R1.R8.3||
> -MC3R1.R8.4||
> -MC3R1.R8.5||
> -MC3R1.R8.6||
> -MC3R1.R8.8||
> -MC3R1.R8.10||
> -MC3R1.R8.12||
> -MC3R1.R8.14||
> -MC3R1.R9.2||
> -MC3R1.R9.3||
> -MC3R1.R9.4||
> -MC3R1.R10.2||
> -MC3R1.R11.6||
> -MC3R1.R11.7||
> -MC3R1.R11.9||
> -MC3R1.R12.5||
> -MC3R1.R13.6||
> -MC3R1.R14.1||
> -MC3R1.R14.3||
> -MC3R1.R14.4||
> -MC3R1.R16.2||
> -MC3R1.R16.3||
> -MC3R1.R16.7||
> -MC3R1.R17.1||
> -MC3R1.R17.3||
> -MC3R1.R17.4||
> -MC3R1.R17.5||
> -MC3R1.R17.6||
> -MC3R1.R18.6||
> -MC3R1.R18.8||
> -MC3R1.R20.2||
> -MC3R1.R20.3||
> -MC3R1.R20.4||
> -MC3R1.R20.6||
> -MC3R1.R20.9||
> -MC3R1.R20.11||
> -MC3R1.R20.12||
> -MC3R1.R20.13||
> -MC3R1.R20.14||
> -MC3R1.R21.3||
> -MC3R1.R21.4||
> -MC3R1.R21.5||
> -MC3R1.R21.7||
> -MC3R1.R21.8||
> -MC3R1.R21.9||
> -MC3R1.R21.10||
> -MC3R1.R21.11||
> -MC3R1.R21.12||
> -MC3R1.R21.13||
> -MC3R1.R21.19||
> -MC3R1.R21.21||
> -MC3R1.R22.1||
> -MC3R1.R22.2||
> -MC3R1.R22.3||
> -MC3R1.R22.4||
> -MC3R1.R22.5||
> -MC3R1.R22.6||
> -MC3R1.R22.7||
> -MC3R1.R22.8||
> -MC3R1.R22.9||
> -MC3R1.R22.10"
> +"MC3A2.D1.1||
> +MC3A2.D2.1||
> +MC3A2.D4.1||
> +MC3A2.D4.11||
> +MC3A2.D4.14||
> +MC3A2.R1.1||
> +MC3A2.R1.3||
> +MC3A2.R1.4||
> +MC3A2.R2.6||
> +MC3A2.R3.1||
> +MC3A2.R3.2||
> +MC3A2.R4.1||
> +MC3A2.R4.2||
> +MC3A2.R5.1||
> +MC3A2.R5.2||
> +MC3A2.R5.3||
> +MC3A2.R5.4||
> +MC3A2.R5.6||
> +MC3A2.R6.1||
> +MC3A2.R6.2||
> +MC3A2.R7.1||
> +MC3A2.R7.2||
> +MC3A2.R7.3||
> +MC3A2.R7.4||
> +MC3A2.R8.1||
> +MC3A2.R8.2||
> +MC3A2.R8.3||
> +MC3A2.R8.4||
> +MC3A2.R8.5||
> +MC3A2.R8.6||
> +MC3A2.R8.8||
> +MC3A2.R8.10||
> +MC3A2.R8.12||
> +MC3A2.R8.14||
> +MC3A2.R9.2||
> +MC3A2.R9.3||
> +MC3A2.R9.4||
> +MC3A2.R10.2||
> +MC3A2.R11.6||
> +MC3A2.R11.7||
> +MC3A2.R11.9||
> +MC3A2.R12.5||
> +MC3A2.R13.6||
> +MC3A2.R14.1||
> +MC3A2.R14.3||
> +MC3A2.R14.4||
> +MC3A2.R16.2||
> +MC3A2.R16.3||
> +MC3A2.R16.7||
> +MC3A2.R17.1||
> +MC3A2.R17.3||
> +MC3A2.R17.4||
> +MC3A2.R17.5||
> +MC3A2.R17.6||
> +MC3A2.R18.6||
> +MC3A2.R18.8||
> +MC3A2.R20.2||
> +MC3A2.R20.3||
> +MC3A2.R20.4||
> +MC3A2.R20.6||
> +MC3A2.R20.9||
> +MC3A2.R20.11||
> +MC3A2.R20.12||
> +MC3A2.R20.13||
> +MC3A2.R20.14||
> +MC3A2.R21.3||
> +MC3A2.R21.4||
> +MC3A2.R21.5||
> +MC3A2.R21.7||
> +MC3A2.R21.8||
> +MC3A2.R21.9||
> +MC3A2.R21.10||
> +MC3A2.R21.11||
> +MC3A2.R21.12||
> +MC3A2.R21.13||
> +MC3A2.R21.19||
> +MC3A2.R21.21||
> +MC3A2.R22.1||
> +MC3A2.R22.2||
> +MC3A2.R22.3||
> +MC3A2.R22.4||
> +MC3A2.R22.5||
> +MC3A2.R22.6||
> +MC3A2.R22.7||
> +MC3A2.R22.8||
> +MC3A2.R22.9||
> +MC3A2.R22.10"
>  }
>  
>  -setq=target,getenv("XEN_TARGET_ARCH")
> @@ -116,7 +116,7 @@ if(string_equal(target,"x86_64"),
>  )
>  
>  if(string_equal(target,"arm64"),
> -    service_selector({"additional_clean_guidelines","MC3R1.R2.1||MC3R1.R5.3||MC3.R11.2||MC3R1.R16.6||MC3R1.R20.7"})
> +    service_selector({"additional_clean_guidelines","MC3A2.R2.1||MC3A2.R5.3||MC3.R11.2||MC3A2.R16.6||MC3A2.R20.7"})
>  )
>  
>  -reports+={clean:added,"service(clean_guidelines_common||additional_clean_guidelines)"}
> diff --git a/docs/misra/documenting-violations.rst b/docs/misra/documenting-violations.rst
> index 8f1cbd83b8..d26377d5aa 100644
> --- a/docs/misra/documenting-violations.rst
> +++ b/docs/misra/documenting-violations.rst
> @@ -53,7 +53,7 @@ Here is an example to add a new justification in safe.json::
>  |            "analyser": {
>  |                "cppcheck": "misra-c2012-20.7",
>  |                "coverity": "misra_c_2012_rule_20_7_violation",
> -|                "eclair": "MC3R1.R20.7"
> +|                "eclair": "MC3A2.R20.7"
>  |            },
>  |            "name": "R20.7 C macro parameters not used as expression",
>  |            "text": "The macro parameters used in this [...]"
> @@ -138,7 +138,7 @@ for the Rule 8.6:
>  
>  Eclair reports it in its web report, file xen/include/xen/kernel.h, line 68:
>  
> -| MC3R1.R8.6 for program 'xen/xen-syms', variable '_start' has no definition
> +| MC3A2.R8.6 for program 'xen/xen-syms', variable '_start' has no definition
>  
>  Also coverity reports it, here is an extract of the finding:
>  
> @@ -165,7 +165,7 @@ We will prepare our entry in the safe.json database::
>  |        {
>  |            "id": "SAF-1-safe",
>  |            "analyser": {
> -|                "eclair": "MC3R1.R8.6",
> +|                "eclair": "MC3A2.R8.6",
>  |                "coverity": "misra_c_2012_rule_8_6_violation"
>  |            },
>  |            "name": "Rule 8.6: linker script defined symbols",
> diff --git a/docs/misra/safe.json b/docs/misra/safe.json
> index 684346386e..b8a4f878ea 100644
> --- a/docs/misra/safe.json
> +++ b/docs/misra/safe.json
> @@ -4,7 +4,7 @@
>          {
>              "id": "SAF-0-safe",
>              "analyser": {
> -                "eclair": "MC3R1.R8.6",
> +                "eclair": "MC3A2.R8.6",
>                  "coverity": "misra_c_2012_rule_8_6_violation"
>              },
>              "name": "Rule 8.6: linker script defined symbols",
> @@ -13,7 +13,7 @@
>          {
>              "id": "SAF-1-safe",
>              "analyser": {
> -                "eclair": "MC3R1.R8.4"
> +                "eclair": "MC3A2.R8.4"
>              },
>              "name": "Rule 8.4: asm-only definition",
>              "text": "Functions and variables used only by asm modules do not need to have a visible declaration prior to their definition."
> @@ -21,23 +21,23 @@
>          {
>              "id": "SAF-2-safe",
>              "analyser": {
> -                "eclair": "MC3R1.R10.1"
> +                "eclair": "MC3A2.R10.1"
>              },
> -            "name": "MC3R1.R10.1: use of an enumeration constant in an arithmetic operation",
> +            "name": "MC3A2.R10.1: use of an enumeration constant in an arithmetic operation",
>              "text": "This violation can be fixed with a cast to (int) of the enumeration constant, but a deviation was chosen due to code readability (see also the comment in BITS_TO_LONGS)."
>          },
>          {
>              "id": "SAF-3-safe",
>              "analyser": {
> -                "eclair": "MC3R1.R20.4"
> +                "eclair": "MC3A2.R20.4"
>              },
> -            "name": "MC3R1.R20.4: allow the definition of a macro with the same name as a keyword in some special cases",
> +            "name": "MC3A2.R20.4: allow the definition of a macro with the same name as a keyword in some special cases",
>              "text": "The definition of a macro with the same name as a keyword can be useful in certain configurations to improve the guarantees that can be provided by Xen. See docs/misra/deviations.rst for a precise rationale for all such cases."
>          },
>          {
>              "id": "SAF-4-safe",
>              "analyser": {
> -                "eclair": "MC3R1.R17.1"
> +                "eclair": "MC3A2.R17.1"
>              },
>              "name": "Rule 17.1: internal helper functions made to break long running hypercalls into multiple calls.",
>              "text": "They need to take a variable number of arguments depending on the original hypercall they are trying to continue."
> @@ -45,31 +45,31 @@
>          {
>              "id": "SAF-5-safe",
>              "analyser": {
> -                "eclair": "MC3R1.R16.2"
> +                "eclair": "MC3A2.R16.2"
>              },
> -            "name": "MC3R1.R16.2: using a case label when the most closely-enclosing compound statement is not a switch statement",
> +            "name": "MC3A2.R16.2: using a case label when the most closely-enclosing compound statement is not a switch statement",
>              "text": "A switch label enclosed by some compound statement that is not the body of a switch is permitted within local helper macros that are unlikely to be misused or misunderstood."
>          },
>          {
>              "id": "SAF-6-safe",
>              "analyser": {
> -                "eclair": "MC3R1.R20.12"
> +                "eclair": "MC3A2.R20.12"
>              },
> -            "name": "MC3R1.R20.12: use of a macro argument that deliberately violates the Rule",
> +            "name": "MC3A2.R20.12: use of a macro argument that deliberately violates the Rule",
>              "text": "A macro parameter that is itself a macro is intentionally used within the macro both as a regular parameter and for text replacement."
>          },
>          {
>              "id": "SAF-7-safe",
>              "analyser": {
> -                "eclair": "MC3R1.R20.7"
> +                "eclair": "MC3A2.R20.7"
>              },
> -            "name": "MC3R1.R20.7: deliberately non-parenthesized macro argument",
> +            "name": "MC3A2.R20.7: deliberately non-parenthesized macro argument",
>              "text": "A macro parameter expands to an expression that is non-parenthesized, as doing so would break the functionality."
>          },
>          {
>              "id": "SAF-8-safe",
>              "analyser": {
> -                "eclair": "MC3R1.D4.10"
> +                "eclair": "MC3A2.D4.10"
>              },
>              "name": "Dir 4.10: headers that leave it up to the caller to include them correctly",
>              "text": "Headers that deliberatively leave the responsability of their correct inclusion to the caller are allowed."
> @@ -77,7 +77,7 @@
>          {
>              "id": "SAF-9-safe",
>              "analyser": {
> -                "eclair": "MC3R1.D4.10"
> +                "eclair": "MC3A2.D4.10"
>              },
>              "name": "Dir 4.10: empty headers",
>              "text": "Empty headers pose no risk if included more than once."
> @@ -85,7 +85,7 @@
>          {
>              "id": "SAF-10-safe",
>              "analyser": {
> -                "eclair": "MC3R1.D4.10"
> +                "eclair": "MC3A2.D4.10"
>              },
>              "name": "Dir 4.10: direct inclusion guard before",
>              "text": "Headers with just the direct inclusion guard before the inclusion guard are safe."
> -- 
> 2.43.0
> 

