Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F43911805
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 03:25:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744998.1152132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKT11-0008Nf-3a; Fri, 21 Jun 2024 01:24:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744998.1152132; Fri, 21 Jun 2024 01:24:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKT11-0008Ld-0t; Fri, 21 Jun 2024 01:24:35 +0000
Received: by outflank-mailman (input) for mailman id 744998;
 Fri, 21 Jun 2024 01:24:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B+dc=NX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sKT0z-0008LX-Qd
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 01:24:33 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff480a33-2f6c-11ef-b4bb-af5377834399;
 Fri, 21 Jun 2024 03:24:30 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D401FCE2AC1;
 Fri, 21 Jun 2024 01:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 069E0C2BD10;
 Fri, 21 Jun 2024 01:24:20 +0000 (UTC)
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
X-Inumbo-ID: ff480a33-2f6c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718933062;
	bh=39d+RSqkVI/IFmqsOyIDeJfWRVBK+BQo0Pl8gVMAu7g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ehPspm3OqwGGWGhgf9iUmKtj/4OmXh5QrtJeBaCNasgRrv/K6tQ4D9QeHBRhmRSiG
	 As5JciXFePd2IRkI+vLcqUoskQkrc819deL8tj85Mdjgpf8BR7RCztwaKjejSOkV/z
	 yIhKr1iSPJThYbzNsgsSTUXCaKtxYmU4Kg44qtaP6S5W/GwyyAviuIh2nWcmqlLl26
	 he5MnAxK+UtAFBycZ+KNlMrBvP3oxpanv0OOplsNSXQuf07cqSgpsSeQ90dQps+m5E
	 jdfiHBAhgK+NV28whOWpTekQGNZQhkMj6OpZRkj3/fu7pbAFlWCYUKKephPUUsdnEP
	 C8yXQnd6gqaTg==
Date: Thu, 20 Jun 2024 18:24:19 -0700 (PDT)
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
Message-ID: <alpine.DEB.2.22.394.2406201824090.2572888@ubuntu-linux-20-04-desktop>
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

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


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

