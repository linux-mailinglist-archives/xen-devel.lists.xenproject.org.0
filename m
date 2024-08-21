Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C98AB95922B
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 03:29:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780870.1190485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sga9S-00019N-Vh; Wed, 21 Aug 2024 01:28:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780870.1190485; Wed, 21 Aug 2024 01:28:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sga9S-00017s-Sq; Wed, 21 Aug 2024 01:28:42 +0000
Received: by outflank-mailman (input) for mailman id 780870;
 Wed, 21 Aug 2024 01:28:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0c/y=PU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sga9R-00017m-OY
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 01:28:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1136aad-5f5c-11ef-8776-851b0ebba9a2;
 Wed, 21 Aug 2024 03:28:39 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1D76660F96;
 Wed, 21 Aug 2024 01:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 723B8C4AF09;
 Wed, 21 Aug 2024 01:28:36 +0000 (UTC)
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
X-Inumbo-ID: b1136aad-5f5c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724203717;
	bh=Edd8K73reMn7pUR/xfFCHjOocAYQ1b3lbtGS/U9q3qM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lXR1X7nkzmgJDDGTM01Q3ByORGJH+1tJKFEhr3/fo2plpI5VYv6kEWkGcrPOiTgcH
	 Aud0eBmgDCoSIFCP/9At3MRQDLRyTI30m/89krwqSA5F34zd0fEtnk+wjC0IkWViLe
	 guB2+4T7q+PTi54Z2cokNtOjUP8Dwmyfod2Cq0U0n0dDGHCfIlhnqksVxSsRa3upyM
	 7HGh10i2BUqxrtLtLH1wOjK8pRSOUsYNhVtAY0n/fIo5DO6XDO+b4FvpJozhNbprGw
	 rUs1A7RBKgT+Teq4t8JC3DfnFbDtQfZRL8jPt9ZDnafP7HHSg1DVWKccCkVJcTOmpy
	 TTuRnT1woFWjw==
Date: Tue, 20 Aug 2024 18:28:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v5] automation/eclair: extend existing deviations of
 MISRA C Rule 16.3
In-Reply-To: <4f862eb7f88c0deee86f2f0543f2794cc22a1585.1724138992.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2408201828110.298534@ubuntu-linux-20-04-desktop>
References: <4f862eb7f88c0deee86f2f0543f2794cc22a1585.1724138992.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Aug 2024, Federico Serafini wrote:
> Update ECLAIR configuration to deviate more cases where an
> unintentional fallthrough cannot happen.
> 
> Tag Rule 16.3 as clean for arm.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
> Hi, v4 of this patch has been on hold due to discussion on whether or not
> to consider switch clauses ending with ASSERT_UNREACHABLE() as safe;
> I propose the patch again to continue the discussion and maybe reach an
> agreement.

Yes this makes sense and reflect the agreement reached on the other
thread

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes from v4:
> - rebase against staging.
> ---
> Changes from v3:
> - do not add the rule to the monitored set (it is already there).
> ---
> Changes from v2:
> - fixed grammar;
> - reprhased deviations regarding do-while-false and ASSERT_UNREACHABLE().
> ---
>  .../eclair_analysis/ECLAIR/deviations.ecl     | 28 +++++++++++++++----
>  automation/eclair_analysis/ECLAIR/tagging.ecl |  2 +-
>  docs/misra/deviations.rst                     | 28 +++++++++++++++++--
>  3 files changed, 48 insertions(+), 10 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 1aa8277066..9051f41602 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -461,14 +461,30 @@ therefore it is deemed better to leave such files as is."
>  -config=MC3R1.R16.2,reports+={deliberate, "any_area(any_loc(file(x86_emulate||x86_svm_emulate)))"}
>  -doc_end
>  
> --doc_begin="Switch clauses ending with continue, goto, return statements are
> -safe."
> --config=MC3R1.R16.3,terminals+={safe, "node(continue_stmt||goto_stmt||return_stmt)"}
> +-doc_begin="Statements that change the control flow (i.e., break, continue, goto, return) and calls to functions that do not return the control back are \"allowed terminal statements\"."
> +-stmt_selector+={r16_3_allowed_terminal, "node(break_stmt||continue_stmt||goto_stmt||return_stmt)||call(property(noreturn))"}
> +-config=MC3R1.R16.3,terminals+={safe, "r16_3_allowed_terminal"}
> +-doc_end
> +
> +-doc_begin="An if-else statement having both branches ending with an allowed terminal statement is itself an allowed terminal statement."
> +-stmt_selector+={r16_3_if, "node(if_stmt)&&(child(then,r16_3_allowed_terminal)||child(then,any_stmt(stmt,-1,r16_3_allowed_terminal)))"}
> +-stmt_selector+={r16_3_else, "node(if_stmt)&&(child(else,r16_3_allowed_terminal)||child(else,any_stmt(stmt,-1,r16_3_allowed_terminal)))"}
> +-stmt_selector+={r16_3_if_else, "r16_3_if&&r16_3_else"}
> +-config=MC3R1.R16.3,terminals+={safe, "r16_3_if_else"}
> +-doc_end
> +
> +-doc_begin="An if-else statement having an always true condition and the true branch ending with an allowed terminal statement is itself an allowed terminal statement."
> +-stmt_selector+={r16_3_if_true, "r16_3_if&&child(cond,definitely_in(1..))"}
> +-config=MC3R1.R16.3,terminals+={safe, "r16_3_if_true"}
> +-doc_end
> +
> +-doc_begin="A switch clause ending with a statement expression which, in turn, ends with an allowed terminal statement is safe."
> +-config=MC3R1.R16.3,terminals+={safe, "node(stmt_expr)&&child(stmt,node(compound_stmt)&&any_stmt(stmt,-1,r16_3_allowed_terminal||r16_3_if_else||r16_3_if_true))"}
>  -doc_end
>  
> --doc_begin="Switch clauses ending with a call to a function that does not give
> -the control back (i.e., a function with attribute noreturn) are safe."
> --config=MC3R1.R16.3,terminals+={safe, "call(property(noreturn))"}
> +-doc_begin="A switch clause ending with a do-while-false the body of which, in turn, ends with an allowed terminal statement is safe.
> +An exception to that is the macro ASSERT_UNREACHABLE() which is effective in debug build only: a switch clause ending with ASSERT_UNREACHABLE() is not considered safe."
> +-config=MC3R1.R16.3,terminals+={safe, "!macro(name(ASSERT_UNREACHABLE))&&node(do_stmt)&&child(cond,definitely_in(0))&&child(body,any_stmt(stmt,-1,r16_3_allowed_terminal||r16_3_if_else||r16_3_if_true))"}
>  -doc_end
>  
>  -doc_begin="Switch clauses ending with pseudo-keyword \"fallthrough\" are
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index 4d0ac94848..b8448938e6 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -112,7 +112,7 @@ if(string_equal(target,"x86_64"),
>  )
>  
>  if(string_equal(target,"arm64"),
> -    service_selector({"additional_clean_guidelines","MC3R1.R16.6||MC3R1.R2.1||MC3R1.R5.3||MC3R1.R7.3"})
> +    service_selector({"additional_clean_guidelines","MC3R1.R2.1||MC3R1.R5.3||MC3R1.R7.3||MC3R1.R16.3||MC3R1.R16.6"})
>  )
>  
>  -reports+={clean:added,"service(clean_guidelines_common||additional_clean_guidelines)"}
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index d51aa422b5..b66c271c4e 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -415,12 +415,34 @@ Deviations related to MISRA C:2012 Rules:
>       - Tagged as `deliberate` for ECLAIR.
>  
>     * - R16.3
> -     - Switch clauses ending with continue, goto, return statements are safe.
> +     - Statements that change the control flow (i.e., break, continue, goto,
> +       return) and calls to functions that do not return the control back are
> +       \"allowed terminal statements\".
>       - Tagged as `safe` for ECLAIR.
>  
>     * - R16.3
> -     - Switch clauses ending with a call to a function that does not give
> -       the control back (i.e., a function with attribute noreturn) are safe.
> +     - An if-else statement having both branches ending with one of the allowed
> +       terminal statemets is itself an allowed terminal statements.
> +     - Tagged as `safe` for ECLAIR.
> +
> +   * - R16.3
> +     - An if-else statement having an always true condition and the true
> +       branch ending with an allowed terminal statement is itself an allowed
> +       terminal statement.
> +     - Tagged as `safe` for ECLAIR.
> +
> +   * - R16.3
> +     - A switch clause ending with a statement expression which, in turn, ends
> +       with an allowed terminal statement (e.g., the expansion of
> +       generate_exception()) is safe.
> +     - Tagged as `safe` for ECLAIR.
> +
> +   * - R16.3
> +     - A switch clause ending with a do-while-false the body of which, in turn,
> +       ends with an allowed terminal statement (e.g., PARSE_ERR_RET()) is safe.
> +       An exception to that is the macro ASSERT_UNREACHABLE() which is
> +       effective in debug build only: a switch clause ending with
> +       ASSERT_UNREACHABLE() is not considered safe.
>       - Tagged as `safe` for ECLAIR.
>  
>     * - R16.3
> -- 
> 2.34.1
> 

