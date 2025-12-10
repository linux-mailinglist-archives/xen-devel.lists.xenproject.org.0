Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5BFCB1799
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 01:20:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182364.1505247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT7wm-0004r0-HB; Wed, 10 Dec 2025 00:20:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182364.1505247; Wed, 10 Dec 2025 00:20:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT7wm-0004nx-EH; Wed, 10 Dec 2025 00:20:48 +0000
Received: by outflank-mailman (input) for mailman id 1182364;
 Wed, 10 Dec 2025 00:20:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oeO=6Q=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vT7wl-0004nr-JS
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 00:20:47 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11f5a76a-d55e-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 01:20:46 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 102F243961;
 Wed, 10 Dec 2025 00:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435CDC4CEF5;
 Wed, 10 Dec 2025 00:20:44 +0000 (UTC)
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
X-Inumbo-ID: 11f5a76a-d55e-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765326044;
	bh=uW7hXCLLvLptVhfObDre58YGWsbWWy5Abay7nQicnBA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lixdRv7S6u/do0uAW26fnOfkNLiqLTS40sV/tgrkbGK5lw2E5QZF7jqjrHfrh4WWa
	 o37Dnl9OnQ02bWfipFUcPIQi1aQwtTS7mcykGjqLv4E30PVdoV5d7oZJO6VrN5jdhp
	 FRQNrYA6wiHZJvI05XX2H/ZlUyNRUzjaMe/hWEVeQU4eGi2xxmls4EIo8zWDnEjDGY
	 WQxjeCvT52OnxF1aYFZ/4qBD1BKT37/D5khaw6AZSpcE4VHMHZYxa05eM28/gD52vl
	 pX9vhJjIoYnaV+1vcnOTFPISTfMP+sy5xwb/9Jutm2E+Az1/GKTQLeJdnoOMjuATsb
	 k3GM10C9osSDA==
Date: Tue, 9 Dec 2025 16:20:42 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 06/12] Include git in the ARM64 build container too
In-Reply-To: <c404521c3598d4872a0a02155833f7f64cebcdab.1764866136.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2512091620370.19429@ubuntu-linux-20-04-desktop>
References: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com> <c404521c3598d4872a0a02155833f7f64cebcdab.1764866136.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1184978092-1765326044=:19429"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1184978092-1765326044=:19429
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 4 Dec 2025, Marek Marczykowski-Górecki wrote:
> It will be used for fetching some Linux versions.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  images/alpine/3.18-arm64-build.dockerfile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/images/alpine/3.18-arm64-build.dockerfile b/images/alpine/3.18-arm64-build.dockerfile
> index 25a8dbd..38464c9 100644
> --- a/images/alpine/3.18-arm64-build.dockerfile
> +++ b/images/alpine/3.18-arm64-build.dockerfile
> @@ -14,6 +14,7 @@ RUN <<EOF
>        DEPS=(# Base environment
>              build-base
>              curl
> +            git
>  
>              # Linux build deps
>              bison
> -- 
> git-series 0.9.1
> 
--8323329-1184978092-1765326044=:19429--

