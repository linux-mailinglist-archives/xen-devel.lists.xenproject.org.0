Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E06912F98
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 23:33:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745605.1152745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKlt5-0005ky-2W; Fri, 21 Jun 2024 21:33:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745605.1152745; Fri, 21 Jun 2024 21:33:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKlt4-0005jQ-Vw; Fri, 21 Jun 2024 21:33:38 +0000
Received: by outflank-mailman (input) for mailman id 745605;
 Fri, 21 Jun 2024 21:33:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B+dc=NX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sKlt4-0005jK-5b
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 21:33:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea61e56d-3015-11ef-90a3-e314d9c70b13;
 Fri, 21 Jun 2024 23:33:37 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5F20B62FA1;
 Fri, 21 Jun 2024 21:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35869C2BBFC;
 Fri, 21 Jun 2024 21:33:34 +0000 (UTC)
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
X-Inumbo-ID: ea61e56d-3015-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719005615;
	bh=l48y11LNjI5XuqxT5ZaEsrDv47R4Kr4/Whk+1TSosxU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GBt9tNICFCug0CfC4IfhkbegYSyVNKwjilJaH7WukO2osnm8N7RoP5HFhoKGQnvVD
	 kjPpNX+X/obq/cARz/FUsSFEvcOdv6qYu2RMplq1oKtgcSSR4poyXN4yihFuHzHAdh
	 +C5eYsb337g2DwZaFt6SfyP//msRKPB3fsKMmYSOS/Vvi+ihNHQOSSuzryjWeWuw3K
	 vpdEhwI377u1XQcCJCN/37jd8xMxTsEPHHxX1zJljsU5xZfdIhXnSdsTRTFtYDQLdx
	 URFd/kVrvbb/ypAVVLUghaJWcDyvj2ne0aFhFzJ9XVtztwqAT3h7gjonwXaQTarmLX
	 iaR4kA9/ma4Jw==
Date: Fri, 21 Jun 2024 14:33:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, oleksii.kurochko@gmail.com
Subject: Re: [XEN PATCH] automation/eclair: add more guidelines to the
 monitored set
In-Reply-To: <f03398504405689413521de1675a33e50cdbc30b.1718983858.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406211432140.2572888@ubuntu-linux-20-04-desktop>
References: <f03398504405689413521de1675a33e50cdbc30b.1718983858.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 21 Jun 2024, Federico Serafini wrote:
> Add more accepted guidelines to the monitored set to check them at each
> commit.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Asking for a release ack: this allows us to see more violations in the
regular ECLAIR scanning results. But they are not blocking, so they
won't cause additional new failures in the pipeline. It is just
informative.


> ---
>  automation/eclair_analysis/ECLAIR/monitored.ecl | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/eclair_analysis/ECLAIR/monitored.ecl
> index 4daecb0c83..9ffaebbdc3 100644
> --- a/automation/eclair_analysis/ECLAIR/monitored.ecl
> +++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
> @@ -18,10 +18,13 @@
>  -enable=MC3R1.R12.5
>  -enable=MC3R1.R1.3
>  -enable=MC3R1.R13.6
> +-enable=MC3R1.R13.1
>  -enable=MC3R1.R1.4
>  -enable=MC3R1.R14.1
>  -enable=MC3R1.R14.4
>  -enable=MC3R1.R16.2
> +-enable=MC3R1.R16.3
> +-enable=MC3R1.R16.4
>  -enable=MC3R1.R16.6
>  -enable=MC3R1.R16.7
>  -enable=MC3R1.R17.1
> @@ -34,6 +37,7 @@
>  -enable=MC3R1.R20.13
>  -enable=MC3R1.R20.14
>  -enable=MC3R1.R20.4
> +-enable=MC3R1.R20.7
>  -enable=MC3R1.R20.9
>  -enable=MC3R1.R2.1
>  -enable=MC3R1.R21.10
> @@ -58,6 +62,7 @@
>  -enable=MC3R1.R5.2
>  -enable=MC3R1.R5.3
>  -enable=MC3R1.R5.4
> +-enable=MC3R1.R5.5
>  -enable=MC3R1.R5.6
>  -enable=MC3R1.R6.1
>  -enable=MC3R1.R6.2
> -- 
> 2.34.1
> 

