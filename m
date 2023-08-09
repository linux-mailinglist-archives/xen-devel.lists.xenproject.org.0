Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2736D776A78
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 22:44:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581348.910014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTq1q-0000ze-Np; Wed, 09 Aug 2023 20:43:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581348.910014; Wed, 09 Aug 2023 20:43:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTq1q-0000xP-KI; Wed, 09 Aug 2023 20:43:38 +0000
Received: by outflank-mailman (input) for mailman id 581348;
 Wed, 09 Aug 2023 20:43:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JRC9=D2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTq1p-0000xJ-IX
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 20:43:37 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 691fea1b-36f5-11ee-b281-6b7b168915f2;
 Wed, 09 Aug 2023 22:43:36 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ABB776494C;
 Wed,  9 Aug 2023 20:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5793AC433C8;
 Wed,  9 Aug 2023 20:43:33 +0000 (UTC)
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
X-Inumbo-ID: 691fea1b-36f5-11ee-b281-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691613814;
	bh=GLEEEVzmf8c44IWFcXE8OXscGqPErXwfrxKkNNHH08w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JfZepUZl40TLsQ/+5TgU4Q6XYWjR60zej/WZ3ZiL2Cz/ZK384TI4fzuSPoPgWRBQ9
	 0GeT3S3SqkauvoUXmE/OAxb4y7vh3bLQEIS9uq7klCaByZWIFxZQbnX0r9lLyBQp2w
	 HramWnKjIoDLKCsVsk+KICekSPFsDbka6jaTzVHdg8D2DtCA0cGGdooM8d2v6HOpSs
	 M3h0Cfdln9MndlCmptpRztmJFGG2ae3KirGlGCEb11JaO2LLFjyuTCLR2FQpeNo2Az
	 wkxkOf0tE8/eFGUivzZBRlRurfSFUtvVqk3JjMvmKExxhXmOMrBC352Y6yhh8VkwWA
	 Rl5Y9Z8yKx39w==
Date: Wed, 9 Aug 2023 13:43:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 2/3] automation/eclair: add ECL deviations
In-Reply-To: <b2979e8cfa01369aa663434144d96bfd3f395ded.1691568344.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308091338510.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691568344.git.simone.ballarin@bugseng.com> <b2979e8cfa01369aa663434144d96bfd3f395ded.1691568344.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Aug 2023, Simone Ballarin wrote:
> This patch adds some deviations for the following guidelines:
> Rule 2.1, Rule 5.3 and Rule 8.2.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Looking at the below, is there anything we should add to
docs/misra/rules.rst to specify that we are adopting the MISRA rule but
in a slightly different way? 

I am happy to make any necessary changes to docs/misra/rules.rst myself,
but I would like to keep docs/misra/rules.rst consistent with
deviations.ecl.

It seems to me that maybe we should add a note about
ASSERT_UNREACHABLE() and BUG() and similar for Rule 2.1. What do you
think? Anything else that I am missing?


> ---
>  .../eclair_analysis/ECLAIR/deviations.ecl     | 34 ++++++++-----------
>  1 file changed, 15 insertions(+), 19 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index e1a06daf2f..696618b59e 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -14,8 +14,13 @@ Constant expressions and unreachable branches of if and switch statements are ex
>  -config=MC3R1.R2.1,+reports={deliberate,"first_area(^.*is never referenced$)"}
>  -doc_end
>  
> --doc_begin="Unreachability in the following macros are expected and safe."
> --config=MC3R1.R2.1,statements+={safe,"macro(name(BUG||assert_failed||ERROR_EXIT||ERROR_EXIT_DOM||PIN_FAIL))"}
> +-doc_begin="Unreachability caused by calls to the following functions or macros is deliberate and there is no risk of code being unexpectedly left out."
> +-config=MC3R1.R2.1,statements+={deliberate,"macro(name(BUG||assert_failed||ERROR_EXIT||ERROR_EXIT_DOM||PIN_FAIL))"}
> +-config=MC3R1.R2.1,statements+={deliberate, "call(decl(name(__builtin_unreachable||panic||do_unexpected_trap||machine_halt||machine_restart||maybe_reboot)))"}
> +-doc_end
> +
> +-doc_begin="Unreachability of an ASSERT_UNREACHABLE() and analogous macro calls is deliberate and safe."
> +-config=MC3R1.R2.1,reports+={deliberate, "any_area(any_loc(any_exp(macro(name(ASSERT_UNREACHABLE||PARSE_ERR_RET||PARSE_ERR||FAIL_MSR||FAIL_CPUID)))))"}
>  -doc_end
>  
>  -doc_begin="Proving compliance with respect to Rule 2.2 is generally impossible:
> @@ -93,25 +98,11 @@ conform to the directive."
>  -doc_begin="The project adopted the rule with an exception listed in
>  'docs/misra/rules.rst'"
>  -config=MC3R1.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^READ_SYSREG$))&&any_exp(macro(^WRITE_SYSREG$))))"}
> --config=MC3R1.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^max_t$))&&any_exp(macro(^min_t$))))"}
> +-config=MC3R1.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^max(_t)?$))&&any_exp(macro(^min(_t)?$))))"}
>  -config=MC3R1.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^read[bwlq]$))&&any_exp(macro(^read[bwlq]_relaxed$))))"}
>  -config=MC3R1.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^per_cpu$))&&any_exp(macro(^this_cpu$))))"}
> --doc_end
> -
> --doc_begin="The identifier 'fdt' is a widely-used name, for which no suitable
> -substitute can be found. It is understood in 'xen/arch/arm/efi-boot.h' that the
> -static variable 'fdt' cannot be confused with parameter names of the function
> -declarations that are present in the file."
> --file_tag+={efi_boot_h, "^xen/arch/arm/efi/efi-boot\\.h$"}
> --config=MC3R1.R5.3,reports+={deliberate, "any_area(decl(kind(var)&&static_storage()&&^fdt$)&&any_loc(file(efi_boot_h)))"}
> --doc_end
> -
> --doc_begin="The identifier 'start' is a widely-used name, for which no suitable
> -substitute can be found. It is understood in 'xen/include/xen/kernel.h' that the
> -extern variable 'start' cannot be confused with omonymous parameter names of the
> -function declarations where that variable is visible."
> --file_tag+={kernel_h, "^xen/include/xen/kernel\\.h$"}
> --config=MC3R1.R5.3,reports+={deliberate, "any_area(decl(kind(var)&&linkage(external)&&^start$)&&any_loc(file(kernel_h)))"}
> +-config=MC3R1.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^__emulate_2op$))&&any_exp(macro(^__emulate_2op_nobyte$))))"}
> +-config=MC3R1.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^read_debugreg$))&&any_exp(macro(^write_debugreg$))))"}
>  -doc_end
>  
>  -doc_begin="Function-like macros cannot be confused with identifiers that are
> @@ -179,6 +170,11 @@ const-qualified."
>  # Series 8.
>  #
>  
> +-doc_begin="The following file is imported from Linux: ignore for now."
> +-file_tag+={adopted_r8_2,"^xen/common/inflate\\.c$"}
> +-config=MC3R1.R8.2,reports+={deliberate,"any_area(any_loc(file(adopted_r8_2)))"}
> +-doc_end
> +
>  -doc_begin="The following variables are compiled in multiple translation units
>  belonging to different executables and therefore are safe."
>  -config=MC3R1.R8.6,declarations+={safe, "name(current_stack_pointer||bsearch||sort)"}
> -- 
> 2.34.1
> 

