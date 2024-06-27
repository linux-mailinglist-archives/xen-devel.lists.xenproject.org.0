Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8358919BD3
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 02:41:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749584.1157786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMdCT-0003uI-Oo; Thu, 27 Jun 2024 00:41:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749584.1157786; Thu, 27 Jun 2024 00:41:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMdCT-0003s8-LL; Thu, 27 Jun 2024 00:41:21 +0000
Received: by outflank-mailman (input) for mailman id 749584;
 Thu, 27 Jun 2024 00:41:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iDhR=N5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sMdCS-0003s1-GM
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 00:41:20 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4c63504-341d-11ef-b4bb-af5377834399;
 Thu, 27 Jun 2024 02:41:15 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2C165CE2D2D;
 Thu, 27 Jun 2024 00:41:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08259C116B1;
 Thu, 27 Jun 2024 00:41:08 +0000 (UTC)
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
X-Inumbo-ID: f4c63504-341d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719448870;
	bh=hp/TBTOzYTzgrlkHDDLQbaMM8fjvukGqwrWs3uisSeA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HmER610D3kaYtBvp6IGWDmEaP7N+Tl5n6W9C8OGoBtRg/bdF7irVMLr1n9W+DWpHL
	 TR0/o4dEycnm+wnynck8tid76/MzdBkKImO4EeYR7S/G5il1BtWSjpm5R2b0yzdyrj
	 WK9XTmshUu8aCHSFIEbzdw86z/DwEg6fqhhFZsIOOGj08+TK3WRviIrTnhYZrfxc6A
	 +gImLz881XFyUWrwhSQ9j9hFjcl2xLkZ7N9t/BYmdTmUlSLak55NxNFx35astuqsAJ
	 TuXnbmXBUtISFcdynninUmWjA+2BHHp9gRww83CC48XiVUvSGEchU9//FrZ35ZPY8E
	 xFPmY98+GOK6A==
Date: Wed, 26 Jun 2024 17:41:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [XEN PATCH v2 for-4.19] automation/eclair: add deviations agreed
 in MISRA meetings
In-Reply-To: <816b323f5e325784947d09502f9352188bd325cf.1719381829.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406261740560.3635@ubuntu-linux-20-04-desktop>
References: <816b323f5e325784947d09502f9352188bd325cf.1719381829.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Jun 2024, Federico Serafini wrote:
> Update ECLAIR configuration to take into account the deviations
> agreed during the MISRA meetings.
> 
> While doing this, remove the obsolete "Set [123]" comments.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

release-ack requested


> ---
> Changes in v2:
> - keep sync between deviations.ecl and deviations.rst;
> - use 'deliberate' tag for all the deviations of R14.3;
> - do not use the term "project-wide deviation" since it does not add useful
>   information.
> ---
>  .../eclair_analysis/ECLAIR/deviations.ecl     | 93 +++++++++++++++++--
>  docs/misra/deviations.rst                     | 81 ++++++++++++++--
>  2 files changed, 158 insertions(+), 16 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index ae2eaf50f7..37cad8bf68 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -1,5 +1,3 @@
> -### Set 1 ###
> -
>  #
>  # Series 2.
>  #
> @@ -23,6 +21,11 @@ Constant expressions and unreachable branches of if and switch statements are ex
>  -config=MC3R1.R2.1,reports+={deliberate, "any_area(any_loc(any_exp(macro(name(ASSERT_UNREACHABLE||PARSE_ERR_RET||PARSE_ERR||FAIL_MSR||FAIL_CPUID)))))"}
>  -doc_end
>  
> +-doc_begin="The asm-offset files are not linked deliberately, since they are used to generate definitions for asm modules."
> +-file_tag+={asm_offsets, "^xen/arch/(arm|x86)/(arm32|arm64|x86_64)/asm-offsets\\.c$"}
> +-config=MC3R1.R2.1,reports+={deliberate, "any_area(any_loc(file(asm_offsets)))"}
> +-doc_end
> +
>  -doc_begin="Pure declarations (i.e., declarations without initialization) are
>  not executable, and therefore it is safe for them to be unreachable."
>  -config=MC3R1.R2.1,ignored_stmts+={"any()", "pure_decl()"}
> @@ -63,6 +66,12 @@ they are not instances of commented-out code."
>  -config=MC3R1.D4.3,reports+={disapplied,"!(any_area(any_loc(file(^xen/arch/arm/arm64/.*$))))"}
>  -doc_end
>  
> +-doc_begin="The inline asm in 'arm64/lib/bitops.c' is tightly coupled with the surronding C code that acts as a wrapper, so it has been decided not to add an additional encapsulation layer."
> +-file_tag+={arm64_bitops, "^xen/arch/arm/arm64/lib/bitops\\.c$"}
> +-config=MC3R1.D4.3,reports+={deliberate, "all_area(any_loc(file(arm64_bitops)&&any_exp(macro(^(bit|test)op$))))"}
> +-config=MC3R1.D4.3,reports+={deliberate, "any_area(any_loc(file(arm64_bitops))&&context(name(int_clear_mask16)))"}
> +-doc_end
> +
>  -doc_begin="This header file is autogenerated or empty, therefore it poses no
>  risk if included more than once."
>  -file_tag+={empty_header, "^xen/arch/arm/efi/runtime\\.h$"}
> @@ -213,10 +222,25 @@ Therefore the absence of prior declarations is safe."
>  -config=MC3R1.R8.4,declarations+={safe, "loc(file(asm_defns))&&^current_stack_pointer$"}
>  -doc_end
>  
> +-doc_begin="The function apei_(read|check|clear)_mce are dead code and are excluded from non-debug builds, therefore the absence of prior declarations is safe."
> +-config=MC3R1.R8.4,declarations+={safe, "^apei_(read|check|clear)_mce\\(.*$"}
> +-doc_end
> +
>  -doc_begin="asmlinkage is a marker to indicate that the function is only used to interface with asm modules."
>  -config=MC3R1.R8.4,declarations+={safe,"loc(text(^(?s).*asmlinkage.*$, -1..0))"}
>  -doc_end
>  
> +-doc_begin="Given that bsearch and sort are defined with the attribute 'gnu_inline', it's deliberate not to have a prior declaration.
> +See Section \"6.33.1 Common Function Attributes\" of \"GCC_MANUAL\" for a full explanation of gnu_inline."
> +-file_tag+={bsearch_sort, "^xen/include/xen/(sort|lib)\\.h$"}
> +-config=MC3R1.R8.4,reports+={deliberate, "any_area(any_loc(file(bsearch_sort))&&decl(name(bsearch||sort)))"}
> +-doc_end
> +
> +-doc_begin="first_valid_mfn is defined in this way because the current lack of NUMA support in Arm and PPC requires it."
> +-file_tag+={first_valid_mfn, "^xen/common/page_alloc\\.c$"}
> +-config=MC3R1.R8.4,declarations+={deliberate,"loc(file(first_valid_mfn))"}
> +-doc_end
> +
>  -doc_begin="The following variables are compiled in multiple translation units
>  belonging to different executables and therefore are safe."
>  -config=MC3R1.R8.6,declarations+={safe, "name(current_stack_pointer||bsearch||sort)"}
> @@ -257,8 +281,6 @@ dimension is higher than omitting the dimension."
>  -config=MC3R1.R9.5,reports+={deliberate, "any()"}
>  -doc_end
>  
> -### Set 2 ###
> -
>  #
>  # Series 10.
>  #
> @@ -299,7 +321,6 @@ integers arguments on two's complement architectures
>  -config=MC3R1.R10.1,reports+={safe, "any_area(any_loc(any_exp(macro(^ISOLATE_LSB$))))"}
>  -doc_end
>  
> -### Set 3 ###
>  -doc_begin="XEN only supports architectures where signed integers are
>  representend using two's complement and all the XEN developers are aware of
>  this."
> @@ -323,6 +344,49 @@ constant expressions are required.\""
>  # Series 11
>  #
>  
> +-doc_begin="The conversion from a function pointer to unsigned long or (void *) does not lose any information, provided that the target type has enough bits to store it."
> +-config=MC3R1.R11.1,casts+={safe,
> +  "from(type(canonical(__function_pointer_types)))
> +   &&to(type(canonical(builtin(unsigned long)||pointer(builtin(void)))))
> +   &&relation(definitely_preserves_value)"
> +}
> +-doc_end
> +
> +-doc_begin="The conversion from a function pointer to a boolean has a well-known semantics that do not lead to unexpected behaviour."
> +-config=MC3R1.R11.1,casts+={safe,
> +  "from(type(canonical(__function_pointer_types)))
> +   &&kind(pointer_to_boolean)"
> +}
> +-doc_end
> +
> +-doc_begin="The conversion from a pointer to an incomplete type to unsigned long does not lose any information, provided that the target type has enough bits to store it."
> +-config=MC3R1.R11.2,casts+={safe,
> +  "from(type(any()))
> +   &&to(type(canonical(builtin(unsigned long))))
> +   &&relation(definitely_preserves_value)"
> +}
> +-doc_end
> +
> +-doc_begin="Conversions to object pointers that have a pointee type with a smaller (i.e., less strict) alignment requirement are safe."
> +-config=MC3R1.R11.3,casts+={safe,
> +  "!relation(more_aligned_pointee)"
> +}
> +-doc_end
> +
> +-doc_begin="Conversions from and to integral types are safe, in the assumption that the target type has enough bits to store the value.
> +See also Section \"4.7 Arrays and Pointers\" of \"GCC_MANUAL\""
> +-config=MC3R1.R11.6,casts+={safe,
> +    "(from(type(canonical(integral())))||to(type(canonical(integral()))))
> +     &&relation(definitely_preserves_value)"}
> +-doc_end
> +
> +-doc_begin="The conversion from a pointer to a boolean has a well-known semantics that do not lead to unexpected behaviour."
> +-config=MC3R1.R11.6,casts+={safe,
> +  "from(type(canonical(__pointer_types)))
> +   &&kind(pointer_to_boolean)"
> +}
> +-doc_end
> +
>  -doc_begin="Violations caused by container_of are due to pointer arithmetic operations
>  with the provided offset. The resulting pointer is then immediately cast back to its
>  original type, which preserves the qualifier. This use is deemed safe.
> @@ -354,9 +418,18 @@ activity."
>  -config=MC3R1.R14.2,reports+={disapplied,"any()"}
>  -doc_end
>  
> --doc_begin="The XEN team relies on the fact that invariant conditions of 'if'
> -statements are deliberate"
> --config=MC3R1.R14.3,statements={deliberate , "wrapped(any(),node(if_stmt))" }
> +-doc_begin="The XEN team relies on the fact that invariant conditions of 'if' statements and conditional operators are deliberate"
> +-config=MC3R1.R14.3,statements+={deliberate, "wrapped(any(),node(if_stmt||conditional_operator||binary_conditional_operator))" }
> +-doc_end
> +
> +-doc_begin="Switches having a 'sizeof' operator as the condition are deliberate and have limited scope."
> +-config=MC3R1.R14.3,statements+={deliberate, "wrapped(any(),node(switch_stmt)&&child(cond, operator(sizeof)))" }
> +-doc_end
> +
> +-doc_begin="The use of an invariant size argument in {put,get}_unsafe_size and array_access_ok, as defined in arch/x86(_64)?/include/asm/uaccess.h is deliberate and is deemed safe."
> +-file_tag+={x86_uaccess, "^xen/arch/x86(_64)?/include/asm/uaccess\\.h$"}
> +-config=MC3R1.R14.3,reports+={deliberate, "any_area(any_loc(file(x86_uaccess)&&any_exp(macro(^(put|get)_unsafe_size$))))"}
> +-config=MC3R1.R14.3,reports+={deliberate, "any_area(any_loc(file(x86_uaccess)&&any_exp(macro(^array_access_ok$))))"}
>  -doc_end
>  
>  -doc_begin="A controlling expression of 'if' and iteration statements having integer, character or pointer type has a semantics that is well-known to all Xen developers."
> @@ -527,8 +600,8 @@ falls under the jurisdiction of other MISRA rules."
>  # General
>  #
>  
> --doc_begin="do-while-0 is a well recognized loop idiom by the xen community."
> --loop_idioms={do_stmt, "literal(0)"}
> +-doc_begin="do-while-[01] is a well recognized loop idiom by the xen community."
> +-loop_idioms={do_stmt, "literal(0)||literal(1)"}
>  -doc_end
>  -doc_begin="while-[01] is a well recognized loop idiom by the xen community."
>  -loop_idioms+={while_stmt, "literal(0)||literal(1)"}
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 16fc345756..d682616796 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -63,6 +63,11 @@ Deviations related to MISRA C:2012 Rules:
>         switch statement.
>       - ECLAIR has been configured to ignore those statements.
>  
> +   * - R2.1
> +     - The asm-offset files are not linked deliberately, since they are used to
> +       generate definitions for asm modules.
> +     - Tagged as `deliberate` for ECLAIR.
> +
>     * - R2.2
>       - Proving compliance with respect to Rule 2.2 is generally impossible:
>         see `<https://arxiv.org/abs/2212.13933>`_ for details. Moreover, peer
> @@ -203,6 +208,26 @@ Deviations related to MISRA C:2012 Rules:
>         it.
>       - Tagged as `safe` for ECLAIR.
>  
> +   * - R8.4
> +     - Some functions are excluded from non-debug build, therefore the absence
> +       of declaration is safe.
> +     - Tagged as `safe` for ECLAIR, such functions are:
> +         - apei_read_mce()
> +         - apei_check_mce()
> +         - apei_clear_mce()
> +
> +   * - R8.4
> +     - Given that bsearch and sort are defined with the attribute 'gnu_inline',
> +       it's deliberate not to have a prior declaration.
> +       See Section \"6.33.1 Common Function Attributes\" of \"GCC_MANUAL\" for
> +       a full explanation of gnu_inline.
> +     - Tagged as `deliberate` for ECLAIR.
> +
> +   * - R8.4
> +     - first_valid_mfn is defined in this way because the current lack of NUMA
> +       support in Arm and PPC requires it.
> +     - Tagged as `deliberate` for ECLAIR.
> +
>     * - R8.6
>       - The following variables are compiled in multiple translation units
>         belonging to different executables and therefore are safe.
> @@ -282,6 +307,39 @@ Deviations related to MISRA C:2012 Rules:
>         If no bits are set, 0 is returned.
>       - Tagged as `safe` for ECLAIR.
>  
> +   * - R11.1
> +     - The conversion from a function pointer to unsigned long or (void \*) does
> +       not lose any information, provided that the target type has enough bits
> +       to store it.
> +     - Tagged as `safe` for ECLAIR.
> +
> +   * - R11.1
> +     - The conversion from a function pointer to a boolean has a well-known
> +       semantics that do not lead to unexpected behaviour.
> +     - Tagged as `safe` for ECLAIR.
> +
> +   * - R11.2
> +     - The conversion from a pointer to an incomplete type to unsigned long
> +       does not lose any information, provided that the target type has enough
> +       bits to store it.
> +     - Tagged as `safe` for ECLAIR.
> +
> +   * - R11.3
> +     - Conversions to object pointers that have a pointee type with a smaller
> +       (i.e., less strict) alignment requirement are safe.
> +     - Tagged as `safe` for ECLAIR.
> +
> +   * - R11.6
> +     - Conversions from and to integral types are safe, in the assumption that
> +       the target type has enough bits to store the value.
> +       See also Section \"4.7 Arrays and Pointers\" of \"GCC_MANUAL\"
> +     - Tagged as `safe` for ECLAIR.
> +
> +   * - R11.6
> +     - The conversion from a pointer to a boolean has a well-known semantics
> +       that do not lead to unexpected behaviour.
> +     - Tagged as `safe` for ECLAIR.
> +
>     * - R11.8
>       - Violations caused by container_of are due to pointer arithmetic operations
>         with the provided offset. The resulting pointer is then immediately cast back to its
> @@ -308,8 +366,19 @@ Deviations related to MISRA C:2012 Rules:
>  
>     * - R14.3
>       - The Xen team relies on the fact that invariant conditions of 'if'
> -       statements are deliberate.
> -     - Project-wide deviation; tagged as `disapplied` for ECLAIR.
> +       statements and conditional operators are deliberate.
> +     - Tagged as `deliberate` for ECLAIR.
> +
> +   * - R14.3
> +     - Switches having a 'sizeof' operator as the condition are deliberate and
> +       have limited scope.
> +     - Tagged as `deliberate` for ECLAIR.
> +
> +   * - R14.3
> +     - The use of an invariant size argument in {put,get}_unsafe_size and
> +       array_access_ok, as defined in arch/x86(_64)?/include/asm/uaccess.h is
> +       deliberate and is deemed safe.
> +     - Tagged as `deliberate` for ECLAIR.
>  
>     * - R14.4
>       - A controlling expression of 'if' and iteration statements having
> @@ -475,10 +544,10 @@ Other deviations:
>     * - Deviation
>       - Justification
>  
> -   * - do-while-0 loops
> -     - The do-while-0 is a well-recognized loop idiom used by the Xen community
> -       and can therefore be used, even though it would cause a number of
> -       violations in some instances.
> +   * - do-while-0 and do-while-1 loops
> +     - The do-while-0 and do-while-1 loops are well-recognized loop idioms used
> +       by the Xen community and can therefore be used, even though they would
> +       cause a number of violations in some instances.
>  
>     * - while-0 and while-1 loops
>       - while-0 and while-1 are well-recognized loop idioms used by the Xen
> -- 
> 2.34.1
> 

