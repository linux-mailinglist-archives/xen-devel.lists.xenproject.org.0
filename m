Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1589483D9
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 23:10:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772371.1182819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sb4xw-0002f4-TW; Mon, 05 Aug 2024 21:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772371.1182819; Mon, 05 Aug 2024 21:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sb4xw-0002bs-Qi; Mon, 05 Aug 2024 21:10:04 +0000
Received: by outflank-mailman (input) for mailman id 772371;
 Mon, 05 Aug 2024 21:10:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Idk=PE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sb4xu-0002Ez-VC
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 21:10:02 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12960084-536f-11ef-bc04-fd08da9f4363;
 Mon, 05 Aug 2024 23:10:00 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1C45BCE0B89;
 Mon,  5 Aug 2024 21:09:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1B5EC32782;
 Mon,  5 Aug 2024 21:09:52 +0000 (UTC)
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
X-Inumbo-ID: 12960084-536f-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722892193;
	bh=9CMcrHK/+sJ2mFm1ONU1jdDiD1dAJ5Xr5U6REbOE2K8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ii6OkRVGHezxfx0GIyvC5Noonj9lkrOtn0vJO55+3Q50iBNYSm8lH3PVS58Krh+fk
	 +VdU6h4gOwARPE3vfrLinmtnArDK3ZJEfiVFbVmyNfUMj80Sb/ouu/RKCxr+6rKbkv
	 ZvNMIM7IQnP2UgEV/TZR/m2le6n10EtMYLvWGD9s0J/PLx5cQVItXAVQ6U4q8VOhkO
	 Jb+WY55Qzuxpg7qFKwFy8qphWiFy9mhuqyRtMo0Wd//iZNoDzbA+yRMaCDOz4sEIG7
	 cz0bHaT9t3sDypYHwMFM4RIR6j08JUv6ax3skhDKPgy5ehsANylNKhwnoPiSGzyZX1
	 QdT1vzu0f9uoA==
Date: Mon, 5 Aug 2024 14:09:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 1/2] automation/eclair: sort monitored guidelines
 with -V
In-Reply-To: <cc69ad735dd53b10237981ded44229f8e6894076.1722842330.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2408051409450.4954@ubuntu-linux-20-04-desktop>
References: <cover.1722842330.git.federico.serafini@bugseng.com> <cc69ad735dd53b10237981ded44229f8e6894076.1722842330.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 Aug 2024, Federico Serafini wrote:
> To improve readability, sort guidelines with -V.
> 
> No functional change.

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  .../eclair_analysis/ECLAIR/monitored.ecl      | 92 +++++++++----------
>  1 file changed, 46 insertions(+), 46 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/eclair_analysis/ECLAIR/monitored.ecl
> index 8a7e3f3cea..7b085a329a 100644
> --- a/automation/eclair_analysis/ECLAIR/monitored.ecl
> +++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
> @@ -2,58 +2,17 @@
>  -enable=MC3R1.D1.1
>  -enable=MC3R1.D2.1
>  -enable=MC3R1.D4.1
> +-enable=MC3R1.D4.3
> +-enable=MC3R1.D4.7
>  -enable=MC3R1.D4.10
>  -enable=MC3R1.D4.11
>  -enable=MC3R1.D4.12
>  -enable=MC3R1.D4.14
> --enable=MC3R1.D4.3
> --enable=MC3R1.D4.7
> --enable=MC3R1.R10.1
> --enable=MC3R1.R10.2
>  -enable=MC3R1.R1.1
> --enable=MC3R1.R11.1
> --enable=MC3R1.R11.7
> --enable=MC3R1.R11.8
> --enable=MC3R1.R11.9
> --enable=MC3R1.R12.5
>  -enable=MC3R1.R1.3
> --enable=MC3R1.R13.6
> --enable=MC3R1.R13.1
>  -enable=MC3R1.R1.4
> --enable=MC3R1.R14.1
> --enable=MC3R1.R14.4
> --enable=MC3R1.R16.2
> --enable=MC3R1.R16.3
> --enable=MC3R1.R16.4
> --enable=MC3R1.R16.6
> --enable=MC3R1.R16.7
> --enable=MC3R1.R17.1
> --enable=MC3R1.R17.3
> --enable=MC3R1.R17.4
> --enable=MC3R1.R17.5
> --enable=MC3R1.R17.6
> --enable=MC3R1.R18.6
> --enable=MC3R1.R19.1
> --enable=MC3R1.R20.12
> --enable=MC3R1.R20.13
> --enable=MC3R1.R20.14
> --enable=MC3R1.R20.4
> --enable=MC3R1.R20.7
> --enable=MC3R1.R20.9
>  -enable=MC3R1.R2.1
> --enable=MC3R1.R21.10
> --enable=MC3R1.R21.13
> --enable=MC3R1.R21.17
> --enable=MC3R1.R21.18
> --enable=MC3R1.R21.19
> --enable=MC3R1.R21.20
> --enable=MC3R1.R21.21
> --enable=MC3R1.R21.9
>  -enable=MC3R1.R2.2
> --enable=MC3R1.R22.2
> --enable=MC3R1.R22.4
> --enable=MC3R1.R22.5
> --enable=MC3R1.R22.6
>  -enable=MC3R1.R2.6
>  -enable=MC3R1.R3.1
>  -enable=MC3R1.R3.2
> @@ -72,32 +31,73 @@
>  -enable=MC3R1.R7.3
>  -enable=MC3R1.R7.4
>  -enable=MC3R1.R8.1
> --enable=MC3R1.R8.10
> --enable=MC3R1.R8.12
> --enable=MC3R1.R8.14
>  -enable=MC3R1.R8.2
>  -enable=MC3R1.R8.3
>  -enable=MC3R1.R8.4
>  -enable=MC3R1.R8.5
>  -enable=MC3R1.R8.6
>  -enable=MC3R1.R8.8
> +-enable=MC3R1.R8.10
> +-enable=MC3R1.R8.12
> +-enable=MC3R1.R8.14
>  -enable=MC3R1.R9.2
>  -enable=MC3R1.R9.3
>  -enable=MC3R1.R9.4
>  -enable=MC3R1.R9.5
> +-enable=MC3R1.R10.1
> +-enable=MC3R1.R10.2
> +-enable=MC3R1.R11.1
> +-enable=MC3R1.R11.7
> +-enable=MC3R1.R11.8
> +-enable=MC3R1.R11.9
> +-enable=MC3R1.R12.5
> +-enable=MC3R1.R13.1
> +-enable=MC3R1.R13.6
> +-enable=MC3R1.R14.1
> +-enable=MC3R1.R14.4
> +-enable=MC3R1.R16.2
> +-enable=MC3R1.R16.3
> +-enable=MC3R1.R16.4
> +-enable=MC3R1.R16.6
> +-enable=MC3R1.R16.7
> +-enable=MC3R1.R17.1
> +-enable=MC3R1.R17.3
> +-enable=MC3R1.R17.4
> +-enable=MC3R1.R17.5
> +-enable=MC3R1.R17.6
> +-enable=MC3R1.R18.6
>  -enable=MC3R1.R18.8
> +-enable=MC3R1.R19.1
>  -enable=MC3R1.R20.2
>  -enable=MC3R1.R20.3
> +-enable=MC3R1.R20.4
>  -enable=MC3R1.R20.6
> +-enable=MC3R1.R20.7
> +-enable=MC3R1.R20.9
>  -enable=MC3R1.R20.11
> +-enable=MC3R1.R20.12
> +-enable=MC3R1.R20.13
> +-enable=MC3R1.R20.14
>  -enable=MC3R1.R21.3
>  -enable=MC3R1.R21.4
>  -enable=MC3R1.R21.5
>  -enable=MC3R1.R21.7
>  -enable=MC3R1.R21.8
> +-enable=MC3R1.R21.9
> +-enable=MC3R1.R21.10
>  -enable=MC3R1.R21.12
> +-enable=MC3R1.R21.13
> +-enable=MC3R1.R21.17
> +-enable=MC3R1.R21.18
> +-enable=MC3R1.R21.19
> +-enable=MC3R1.R21.20
> +-enable=MC3R1.R21.21
>  -enable=MC3R1.R22.1
> +-enable=MC3R1.R22.2
>  -enable=MC3R1.R22.3
> +-enable=MC3R1.R22.4
> +-enable=MC3R1.R22.5
> +-enable=MC3R1.R22.6
>  -enable=MC3R1.R22.7
>  -enable=MC3R1.R22.8
>  -enable=MC3R1.R22.9
> -- 
> 2.34.1
> 

