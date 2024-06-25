Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 423BE915B15
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 02:45:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747023.1154289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuIf-0006pR-Ez; Tue, 25 Jun 2024 00:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747023.1154289; Tue, 25 Jun 2024 00:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuIf-0006mz-Bi; Tue, 25 Jun 2024 00:44:45 +0000
Received: by outflank-mailman (input) for mailman id 747023;
 Tue, 25 Jun 2024 00:44:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmkP=N3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sLuIe-0006mj-7I
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 00:44:44 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b3af71d-328c-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 02:44:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5B937CE100E;
 Tue, 25 Jun 2024 00:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C698C2BBFC;
 Tue, 25 Jun 2024 00:44:34 +0000 (UTC)
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
X-Inumbo-ID: 1b3af71d-328c-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719276275;
	bh=Vtkpy9kOQr6ZNYLWY48gW0OGdAAuqTE3Gsz6e82YGlo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Hg7F2epKwAKauKNof0vwehn6NApPxrhq00BZVae16pCdc96H2hiFqPRf96L+9SmoS
	 si+dS6drD5Jq4SaLVI1/UOt4nI/tZ/jUNHBbitJDGJQhqxq1G8YDBoaVk20PNzAxml
	 4TEk2u7Ad0mmJALO7DUeieFHhhZn/BXYdRTqJIXvGLhk4mPeT3uChGKneFGltp07T0
	 o+0SBK5eDRtUD31nmdt+ryRIaYTWus9m2TCnuTOxqcnX91UrOrE/rOxZQN3cy1XSob
	 nb81Sy71a0j/giwSe9cKfJ00EaD5Q27+mD02p/Wqbh2ZMtLOjUUY0f3e1OnQTaOO5M
	 U5e/hg45sGbjw==
Date: Mon, 24 Jun 2024 17:44:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH v2 6/6][RESEND] automation/eclair_analysis: clean
 ECLAIR configuration scripts
In-Reply-To: <120e7e4579b931c08d28d0a96848af1df7a07f7d.1718378539.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406241744270.3870429@ubuntu-linux-20-04-desktop>
References: <cover.1718378539.git.nicola.vetrini@bugseng.com> <120e7e4579b931c08d28d0a96848af1df7a07f7d.1718378539.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Jun 2024, Nicola Vetrini wrote:
> Remove from the ECLAIR integration scripts an unused option, which
> was already ignored, and make the help texts consistent
> with the rest of the scripts.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/eclair_analysis/ECLAIR/analyze.sh | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/analyze.sh b/automation/eclair_analysis/ECLAIR/analyze.sh
> index 0ea5520c93a6..e96456c3c18d 100755
> --- a/automation/eclair_analysis/ECLAIR/analyze.sh
> +++ b/automation/eclair_analysis/ECLAIR/analyze.sh
> @@ -11,7 +11,7 @@ fatal() {
>  }
>  
>  usage() {
> -  fatal "Usage: ${script_name} <ARM64|X86_64> <Set0|Set1|Set2|Set3>"
> +  fatal "Usage: ${script_name} <ARM64|X86_64> <accepted|monitored>"
>  }
>  
>  if [[ $# -ne 2 ]]; then
> @@ -40,7 +40,6 @@ ECLAIR_REPORT_LOG=${ECLAIR_OUTPUT_DIR}/REPORT.log
>  if [[ "$1" = "X86_64" ]]; then
>    export CROSS_COMPILE=
>    export XEN_TARGET_ARCH=x86_64
> -  EXTRA_ECLAIR_ENV_OPTIONS=-disable=MC3R1.R20.7
>  elif [[ "$1" = "ARM64" ]]; then
>    export CROSS_COMPILE=aarch64-linux-gnu-
>    export XEN_TARGET_ARCH=arm64
> -- 
> 2.34.1
> 

