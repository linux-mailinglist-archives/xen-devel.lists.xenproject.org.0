Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0611A8B902F
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 21:46:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715401.1116990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Fte-00046E-MW; Wed, 01 May 2024 19:45:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715401.1116990; Wed, 01 May 2024 19:45:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Fte-00044i-Jj; Wed, 01 May 2024 19:45:42 +0000
Received: by outflank-mailman (input) for mailman id 715401;
 Wed, 01 May 2024 19:45:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aa2W=ME=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s2Ftc-00044c-PG
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 19:45:40 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f29e1c7-07f3-11ef-b4bb-af5377834399;
 Wed, 01 May 2024 21:45:36 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4E6F8CE12A3;
 Wed,  1 May 2024 19:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C44FC4AF19;
 Wed,  1 May 2024 19:45:28 +0000 (UTC)
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
X-Inumbo-ID: 5f29e1c7-07f3-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714592730;
	bh=UyPQCRw95DefHzzFpKOcfCzyAdIzf1ArezoRPBVab1k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VdAB6I7vQFX+n7WO+nKbouHMCFKXWW7yZI9hM83f7wof3T6aO/jblW8lE5HjcShS2
	 EjcP1OJOavEDFNCTzcwU7xw1BOkVM6V6XmjJ5LRuorL01qd+pi6LXxZV447XeWHDdp
	 VS4xG24BStnyufB9SQxvMrRD/GvhoPTkfhxs4l/GcQf9pnWTM2+8q7mBgqJ2yiq5yY
	 An2BF8bqFLDO9e3eSSTPhbB4xtSQdQqsvq2YVcVwGUMx9sI3LvDCOLVxBzC0BeUu9Q
	 5KuAzIrrerH2HebI/JBFyFGJMFCBPzyg1/vm31f/Mcs/WtDuwndtFX9uOu9g7qVvrh
	 Apw5xrUKniPSQ==
Date: Wed, 1 May 2024 12:45:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 1/3] automation/eclair: tag Rule 7.2 as clean and
 temporarily remove Rules 1.1 and 8.2
In-Reply-To: <69c412a2322151971bf2b2705cabe4a292882028.1714401209.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2405011245170.497719@ubuntu-linux-20-04-desktop>
References: <cover.1714401209.git.federico.serafini@bugseng.com> <69c412a2322151971bf2b2705cabe4a292882028.1714401209.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 29 Apr 2024, Federico Serafini wrote:
> Update ECLAIR configuration to consider Rule 7.2 as clean.
> 
> Temporarily remove the clean tag from Rules 1.1 and 8.2:
> when violations of such rules will be addressed, the clean tag will be
> reintroduced.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/eclair_analysis/ECLAIR/tagging.ecl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index d609b470eb..bdf94ed996 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -19,7 +19,7 @@
>  
>  -doc_begin="Clean guidelines: new violations for these guidelines are not accepted."
>  
> --service_selector={clean_guidelines_common,"MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.1||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R1.1||MC3R1.R11.7||MC3R1.R11.9||MC3R1.R12.5||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R14.1||MC3R1.R16.7||MC3R1.R17.1||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.5||MC3R1.R17.6||MC3R1.R20.13||MC3R1.R20.14||MC3R1.R20.4||MC3R1.R20.9||MC3R1.R21.13||MC3R1.R21.19||MC3R1.R21.21||MC3R1.R2.2||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6||MC3R1.R2.6||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R4.2||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.4||MC3R1.R5.6||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R7.4||MC3R1.R8.1||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R8.2||MC3R1.R8.5||MC3R1.R8.6||MC3R1.R8.8||MC3R1.R9.2||MC3R1.R9.3||MC3R1.R9.4||MC3R1.R9.5"
> +-service_selector={clean_guidelines_common,"MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.1||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R11.7||MC3R1.R11.9||MC3R1.R12.5||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R14.1||MC3R1.R16.7||MC3R1.R17.1||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.5||MC3R1.R17.6||MC3R1.R20.13||MC3R1.R20.14||MC3R1.R20.4||MC3R1.R20.9||MC3R1.R21.13||MC3R1.R21.19||MC3R1.R21.21||MC3R1.R2.2||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6||MC3R1.R2.6||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R4.2||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.4||MC3R1.R5.6||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R7.2||MC3R1.R7.4||MC3R1.R8.1||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R8.5||MC3R1.R8.6||MC3R1.R8.8||MC3R1.R9.2||MC3R1.R9.3||MC3R1.R9.4||MC3R1.R9.5"
>  }
>  
>  -setq=target,getenv("XEN_TARGET_ARCH")
> -- 
> 2.34.1
> 

