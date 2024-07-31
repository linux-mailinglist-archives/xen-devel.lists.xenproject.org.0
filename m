Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB2D94392B
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 01:04:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769163.1180052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZIM0-0001Ve-Af; Wed, 31 Jul 2024 23:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769163.1180052; Wed, 31 Jul 2024 23:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZIM0-0001Ti-7W; Wed, 31 Jul 2024 23:03:32 +0000
Received: by outflank-mailman (input) for mailman id 769163;
 Wed, 31 Jul 2024 23:03:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gQnf=O7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sZILy-0001Tc-SC
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 23:03:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18d73c4a-4f91-11ef-8776-851b0ebba9a2;
 Thu, 01 Aug 2024 01:03:28 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3202962603;
 Wed, 31 Jul 2024 23:03:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE8DC116B1;
 Wed, 31 Jul 2024 23:03:25 +0000 (UTC)
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
X-Inumbo-ID: 18d73c4a-4f91-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722467006;
	bh=wAtVXMIt1HCt202CvoVAR17kHrD+uQxKCEpiwXwDrQ8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Q6CvsIFhsSaQ8iwxDug52Mz/Z78MH7lGEus1XnG+/gk03ar3Y5Lafm4nfJpbeXUaR
	 Ny5nyB/0UpUKfwg53TBIM//qXGxrZ0z5Gh5E0jmrfhagN6kFndNe00sehbV65mm0Mm
	 Ize9/iCMyhZN23wA+KJzeO/XAgtUoJ1SdFGoq2OuOqCW/61frv0+m8x+LHtjHZUuHV
	 i9ZCt2lECBKVeYdy8yscW9kAO3GrTMLNrjcQXwSMoDFXN00dFxij2dNFZC8NLqgdHf
	 Eu6ejRLvaejrfzpLW82xBwVTHcYLn/eaiIDKaTrcwz7VIVzp/jyYPqalyF2l9FUP43
	 PLLQzTAz3GZvg==
Date: Wed, 31 Jul 2024 16:03:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH] automation/eclair_analysis: add Rule 18.6 to the
 clean guidelines
In-Reply-To: <c4dddc9468224e037f42ef77eb8407ba9a71207e.1722429655.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2407311603020.4857@ubuntu-linux-20-04-desktop>
References: <c4dddc9468224e037f42ef77eb8407ba9a71207e.1722429655.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 31 Jul 2024, Nicola Vetrini wrote:
> MISRA C Rule 18.6 states: "The address of an object with automatic
> storage shall not be copied to another object that persists after
> the first object has ceased to exist."
> 
> The rule is set as monitored and tagged clean, in order to block
> the CI on any violations that may arise, allowing the presence
> of cautions (currently there are no violations).
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/eclair_analysis/ECLAIR/monitored.ecl | 1 +
>  automation/eclair_analysis/ECLAIR/tagging.ecl   | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/eclair_analysis/ECLAIR/monitored.ecl
> index 9ffaebbdc378..8a7e3f3ceaa9 100644
> --- a/automation/eclair_analysis/ECLAIR/monitored.ecl
> +++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
> @@ -32,6 +32,7 @@
>  -enable=MC3R1.R17.4
>  -enable=MC3R1.R17.5
>  -enable=MC3R1.R17.6
> +-enable=MC3R1.R18.6
>  -enable=MC3R1.R19.1
>  -enable=MC3R1.R20.12
>  -enable=MC3R1.R20.13
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index b829655ca0bc..e7b32773e60e 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -67,6 +67,7 @@ MC3R1.R17.3||
>  MC3R1.R17.4||
>  MC3R1.R17.5||
>  MC3R1.R17.6||
> +MC3R1.R18.6||
>  MC3R1.R18.8||
>  MC3R1.R20.2||
>  MC3R1.R20.3||
> -- 
> 2.34.1
> 

