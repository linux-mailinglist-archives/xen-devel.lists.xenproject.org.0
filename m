Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B22558C8D4A
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 22:30:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724436.1129710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s84E1-0003mA-NN; Fri, 17 May 2024 20:30:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724436.1129710; Fri, 17 May 2024 20:30:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s84E1-0003j0-KA; Fri, 17 May 2024 20:30:45 +0000
Received: by outflank-mailman (input) for mailman id 724436;
 Fri, 17 May 2024 20:30:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ijk8=MU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s84E0-0003is-5z
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 20:30:44 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52bef38a-148c-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 22:30:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1B0DDCE1A70;
 Fri, 17 May 2024 20:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F83C2BD10;
 Fri, 17 May 2024 20:30:36 +0000 (UTC)
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
X-Inumbo-ID: 52bef38a-148c-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715977837;
	bh=l1bHbBdaAZNckLc8f+mmN8ZM6MqCAhEGHsfsqTqXtx4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=leVSUTgrMH+EnknipHKE5aEspA0xTI37Os52hk3hXRBRZktLMVsBg6EUhWQZnQfRA
	 yXnQ/GR7l4uqPPth2YeL1A/PcCR6Tm+cnfD4TIgRzPzZfcW+CKKUpMuK61ZdOyHeFE
	 vmZ0ik28D0BqsmnphlVQttD3wvIGFISJp1wj1zUyDp06ERuEIyhZgCWPSC/lMAIq9l
	 FdiRgQND3EHkmvWKR74cpZeWRvQFRdTDb+L/dleEzKYPKVnTni4FpqTlWxrjfH38cf
	 ZT9uxfzEKX5YBvYsk/Jk3yBUhW26YZigzdFXhHZ43kQi2m6wFkticjnC1PTAWw6EwC
	 5vyIkqrmxKDWA==
Date: Fri, 17 May 2024 13:30:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH] automation/eclair_analysis: set MISRA C Rule 10.2
 as clean
In-Reply-To: <7ded6026fc8a02f53bdb841a4e4c5e3be45a15a0.1715930684.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2405171330251.1052252@ubuntu-linux-20-04-desktop>
References: <7ded6026fc8a02f53bdb841a4e4c5e3be45a15a0.1715930684.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 17 May 2024, Nicola Vetrini wrote:
> This rule has no more violations in the codebase, so it can be
> set as clean.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



> ---
>  automation/eclair_analysis/ECLAIR/tagging.ecl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index acea15f486a1..b7a9f75b275b 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -19,7 +19,7 @@
>  
>  -doc_begin="Clean guidelines: new violations for these guidelines are not accepted."
>  
> --service_selector={clean_guidelines_common, "MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.1||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R11.7||MC3R1.R11.9||MC3R1.R12.5||MC3R1.R1.1||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R14.1||MC3R1.R16.7||MC3R1.R17.1||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.5||MC3R1.R17.6||MC3R1.R20.13||MC3R1.R20.14||MC3R1.R20.4||MC3R1.R20.9||MC3R1.R21.10||MC3R1.R21.13||MC3R1.R21.19||MC3R1.R21.21||MC3R1.R21.9||MC3R1.R2.2||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6||MC3R1.R2.6||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R4.2||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.4||MC3R1.R5.6||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R7.2||MC3R1.R7.4||MC3R1.R8.1||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R8.2||MC3R1.R8.5||MC3R1.R8.6||MC3R1.R8.8||MC3R1.R9.2||MC3R1.R9.3||MC3R1.R9.4||MC3R1.R9.5"
> +-service_selector={clean_guidelines_common, "MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.1||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R10.2||MC3R1.R11.7||MC3R1.R11.9||MC3R1.R12.5||MC3R1.R1.1||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R14.1||MC3R1.R16.7||MC3R1.R17.1||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.5||MC3R1.R17.6||MC3R1.R20.13||MC3R1.R20.14||MC3R1.R20.4||MC3R1.R20.9||MC3R1.R21.10||MC3R1.R21.13||MC3R1.R21.19||MC3R1.R21.21||MC3R1.R21.9||MC3R1.R2.2||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6||MC3R1.R2.6||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R4.2||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.4||MC3R1.R5.6||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R7.2||MC3R1.R7.4||MC3R1.R8.1||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R8.2||MC3R1.R8.5||MC3R1.R8.6||MC3R1.R8.8||MC3R1.R9.2||MC3R1.R9.3||MC3R1.R9.4||MC3R1.R9.5"
>  }
>  
>  -setq=target,getenv("XEN_TARGET_ARCH")
> -- 
> 2.34.1
> 

