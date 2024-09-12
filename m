Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B8F975E0C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 02:36:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796936.1206667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soXoc-00081C-Lv; Thu, 12 Sep 2024 00:36:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796936.1206667; Thu, 12 Sep 2024 00:36:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soXoc-0007yP-JP; Thu, 12 Sep 2024 00:36:06 +0000
Received: by outflank-mailman (input) for mailman id 796936;
 Thu, 12 Sep 2024 00:36:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T9bO=QK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1soXoc-0006jX-4L
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 00:36:06 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe6d47ee-709e-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 02:36:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D32A9A4167A;
 Thu, 12 Sep 2024 00:35:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 012BEC4CEC5;
 Thu, 12 Sep 2024 00:36:02 +0000 (UTC)
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
X-Inumbo-ID: fe6d47ee-709e-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726101364;
	bh=zVFdtsQgJCO5WXtzQiXXJOUtdkef0wpf3YVRGwjbGaU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T2pFcxmKFNy6dUWFWdjE50t4IrFJpeDTjXHyhPK13GoLvyJ4Tg4ZDf3PrrQ2z8rfV
	 lcsXIwW7wfbAw/r/FwY7s2MIfTQ7Iy4/4v8MwxyxpWVul0T9Z4N371wLTBl8De7pkE
	 j2wWxPTpvuNAl1miRUn7Wuhchllg/+IykYsab08z3aNGmpUPiiAZ5A+fANAVsm5vgR
	 fDtcvjV7U7quRHfEuhG2VCTQImH700c1U/ZQqdyhk730wSC2x5F2XxSdXfzSsa29pa
	 81jIKozZ+RpGij7tdeLFbPxbXhZ+Z+U7XbTHpscf553nRilqbRVs7MSqvYPEhPKJ5I
	 Ctd7iw7EFblVg==
Date: Wed, 11 Sep 2024 17:36:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH] automation/eclair_analysis: address violation of
 Rule 20.7
In-Reply-To: <a2fb434d56dc668c27b51d03be0fab703583c18d.1725972157.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2409111735550.611587@ubuntu-linux-20-04-desktop>
References: <a2fb434d56dc668c27b51d03be0fab703583c18d.1725972157.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 10 Sep 2024, Nicola Vetrini wrote:
> MISRA Rule 20.7 states:
> "Expressions resulting from the expansion of macro parameters
> shall be enclosed in parentheses".
> 
> The files imported from the gnu-efi package are already deviated, yet
> the macro NextMemoryDescriptor is used in non-excluded code, so a further
> deviation is needed to exclude also any expansion of the macro.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index ed80ac795851..3241f96cd612 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -566,7 +566,7 @@ of the IS_ENABLED or STATIC_IF/STATIC_IF_NOT macros, so it always receives a lit
>  not in scope for compliance are allowed, as that is imported code."
>  -file_tag+={gnu_efi_include, "^xen/include/efi/.*$"}
>  -file_tag+={acpi_cpu_idle, "^xen/arch/x86/acpi/cpu_idle\\.c$"}
> --config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(file(gnu_efi_include)))"}
> +-config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(file(gnu_efi_include)||any_exp(macro(^NextMemoryDescriptor$))))"}
>  -config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(file(acpi_cpu_idle)))"}
>  -doc_end
>  
> -- 
> 2.43.0
> 

