Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF35E862017
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 23:54:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684960.1065251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdeQ9-0001Rn-Hl; Fri, 23 Feb 2024 22:53:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684960.1065251; Fri, 23 Feb 2024 22:53:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdeQ9-0001QJ-E8; Fri, 23 Feb 2024 22:53:33 +0000
Received: by outflank-mailman (input) for mailman id 684960;
 Fri, 23 Feb 2024 22:53:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OEAM=KA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rdeQ8-0001QD-MX
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 22:53:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5cd9dddf-d29e-11ee-8a57-1f161083a0e0;
 Fri, 23 Feb 2024 23:53:30 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6D94561A0F;
 Fri, 23 Feb 2024 22:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5023EC433C7;
 Fri, 23 Feb 2024 22:53:28 +0000 (UTC)
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
X-Inumbo-ID: 5cd9dddf-d29e-11ee-8a57-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708728809;
	bh=ber/363D8X2ld/t6L5y424sXzcWWrZxiUdpGvaBWudk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EEiDsF+mWilZIskklE1ev588FwyFs0FWHroBJVia2k2GYrvGR1KXyrHdYjil2ng3T
	 fG5IfT7dwOc6qwSujjH5mYGta7GR36EiD5gXRtbbGnOWdca04O9LP0gDY1WDW21xvU
	 z7TQ14o0OLEIJPlNQ1UScwvijaXGhTllo/qH7jP/9cQiyLj6juoKM89TR+gSZNv1ex
	 0v61x0sTwmtkh6CZ5P5A5sbBMko821yq9OwBqbN9Bogfghhf8zZGeX6YajBDpIwzk0
	 3wa0f6/KNpi9PV6RcXv9TaLbJVcId/ba4THzbNyWly6UWQdheWtla9GeaLtvpbUyB8
	 SLj91cgyPcaVw==
Date: Fri, 23 Feb 2024 14:53:26 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 2/2] automation/eclair: tag MISRA C:2012 Rule 8.2 as
 clean
In-Reply-To: <59db8ce679a2ab46b23b39e8f1591cd9fc1c9218.1708677243.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2402231453210.754277@ubuntu-linux-20-04-desktop>
References: <cover.1708677243.git.federico.serafini@bugseng.com> <59db8ce679a2ab46b23b39e8f1591cd9fc1c9218.1708677243.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 23 Feb 2024, Federico Serafini wrote:
> Update ECLAIR configuration to consider Rule 8.2 as clean.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/eclair_analysis/ECLAIR/tagging.ecl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index 900c532196..a1dea32b21 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -30,7 +30,7 @@
>  
>  -doc_begin="Clean guidelines: new violations for these guidelines are not accepted."
>  
> --service_selector={clean_guidelines_common,"MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R1.1||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R2.2||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R4.2||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.4||MC3R1.R5.6||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R8.1||MC3R1.R8.5||MC3R1.R8.6||MC3R1.R8.8||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R9.2||MC3R1.R9.4||MC3R1.R9.5||MC3R1.R12.5||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.6||MC3R1.R20.13||MC3R1.R20.14||MC3R1.R21.13||MC3R1.R21.19||MC3R1.R21.21||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6"
> +-service_selector={clean_guidelines_common,"MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R1.1||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R2.2||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R4.2||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.4||MC3R1.R5.6||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R8.1||MC3R1.R8.2||MC3R1.R8.5||MC3R1.R8.6||MC3R1.R8.8||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R9.2||MC3R1.R9.4||MC3R1.R9.5||MC3R1.R12.5||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.6||MC3R1.R20.13||MC3R1.R20.14||MC3R1.R21.13||MC3R1.R21.19||MC3R1.R21.21||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6"
>  }
>  
>  -setq=target,getenv("XEN_TARGET_ARCH")
> -- 
> 2.34.1
> 

