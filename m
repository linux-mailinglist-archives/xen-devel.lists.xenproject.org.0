Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A379483DA
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 23:10:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772372.1182829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sb4y1-0003EO-4W; Mon, 05 Aug 2024 21:10:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772372.1182829; Mon, 05 Aug 2024 21:10:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sb4y1-0003D2-1h; Mon, 05 Aug 2024 21:10:09 +0000
Received: by outflank-mailman (input) for mailman id 772372;
 Mon, 05 Aug 2024 21:10:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Idk=PE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sb4xz-0003B6-7L
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 21:10:07 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15ced7e4-536f-11ef-8776-851b0ebba9a2;
 Mon, 05 Aug 2024 23:10:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8768E60E08;
 Mon,  5 Aug 2024 21:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77CAFC32782;
 Mon,  5 Aug 2024 21:10:02 +0000 (UTC)
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
X-Inumbo-ID: 15ced7e4-536f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722892203;
	bh=gOvM9GNTT9aamBeH8D5rPqNrADQQutz7YuV6M932/To=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rYR/hlcsMkPrEkoNf0Md06xs8SaF8vILvH+Pe5mv0pKkaSH3Mu+o9iGFnScCx4qPI
	 0nfH3E3UNUHtJ3HfmnxSfEtRM6o/YTZ1fDE8taGJQr95mLiQnNcz5HzxIcpMEKQuuY
	 LvWLswJQ2I9OiLOFzsNfakp6GO5Is5t+Ypt48rpCPExUQUPrZC9oFO1tRDpo8tQcTn
	 TYOSms4iuvHA+X4ZIbf4S5wEa5ume2WFrXteYh6w6EtD4r0RgmCrsDov7Mj6T4ZcJL
	 nuY8MwpTmSM/G8YSX4lSYP3zReOxhaC/qEIYkqVzZ3JnJf7Z1CFgy1MplsTketWup/
	 LvMGf0M8Ndx1Q==
Date: Mon, 5 Aug 2024 14:10:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 2/2] automation/eclair: tag more guidelines as
 clean
In-Reply-To: <d552057fece18290c86e082434e3a04c783b4d46.1722842330.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2408051409560.4954@ubuntu-linux-20-04-desktop>
References: <cover.1722842330.git.federico.serafini@bugseng.com> <d552057fece18290c86e082434e3a04c783b4d46.1722842330.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 Aug 2024, Federico Serafini wrote:
> Tag more of the accepted guidelines as clean to avoid regressions.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  automation/eclair_analysis/ECLAIR/tagging.ecl | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index e7b32773e6..4d0ac94848 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -56,11 +56,14 @@ MC3R1.R9.3||
>  MC3R1.R9.4||
>  MC3R1.R9.5||
>  MC3R1.R10.2||
> +MC3R1.R11.6||
>  MC3R1.R11.7||
>  MC3R1.R11.9||
>  MC3R1.R12.5||
>  MC3R1.R14.1||
> +MC3R1.R14.3||
>  MC3R1.R14.4||
> +MC3R1.R16.2||
>  MC3R1.R16.7||
>  MC3R1.R17.1||
>  MC3R1.R17.3||
> @@ -85,6 +88,7 @@ MC3R1.R21.7||
>  MC3R1.R21.8||
>  MC3R1.R21.9||
>  MC3R1.R21.10||
> +MC3R1.R21.11||
>  MC3R1.R21.12||
>  MC3R1.R21.13||
>  MC3R1.R21.19||
> -- 
> 2.34.1
> 

