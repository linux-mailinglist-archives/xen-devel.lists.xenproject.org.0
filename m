Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61200CB178D
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 01:18:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182350.1505236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT7uX-0003LV-44; Wed, 10 Dec 2025 00:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182350.1505236; Wed, 10 Dec 2025 00:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT7uX-0003JF-1Q; Wed, 10 Dec 2025 00:18:29 +0000
Received: by outflank-mailman (input) for mailman id 1182350;
 Wed, 10 Dec 2025 00:18:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oeO=6Q=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vT7uV-0003J6-DB
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 00:18:27 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be2eb78e-d55d-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 01:18:25 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7D5D0433B1;
 Wed, 10 Dec 2025 00:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D42C4CEF5;
 Wed, 10 Dec 2025 00:18:23 +0000 (UTC)
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
X-Inumbo-ID: be2eb78e-d55d-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765325904;
	bh=SYEX4jnRBLYGw6NEnh1ISPmSlYidErXLvJLw4gNuZWE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=E/tFdHKIq5fV52FiC+I6178EyZb00kZWYBgOS7YX1Sj0gWwPVnGRLcxJP9y1L4IiG
	 jpZc6qXlOEs5Gbt0gkgcWdrHavbwxHPwMGkyz4jCuiLRegqPwGZ0PVcXpPgPs/r7yQ
	 mjqVhlldDDqRueaHeAlt6Y5eyby0I/zHo84XDlkqdFD6Z+Jc30mBRtG+I8mK/VvbUT
	 m60EEI0KIfk9iwDV3yPmgkA3PD8oxaaNxa/VcIiC3NXAIdB/O95+3N5mkimNkaFa4i
	 70Dtncx0M8EsEi+kQpPXR9FeiNHOk9rLxu/sdRQQthLfoLgBQuQBR44OYRaEEc1WaR
	 FUGVzT4AcC6xw==
Date: Tue, 9 Dec 2025 16:18:22 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 05/12] Enable CONFIG_USB_RTL8152 in kernel for hw12
 runner
In-Reply-To: <9489737256953defce752f60d5d9bc413e75a35a.1764866136.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2512091618160.19429@ubuntu-linux-20-04-desktop>
References: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com> <9489737256953defce752f60d5d9bc413e75a35a.1764866136.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-406630342-1765325904=:19429"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-406630342-1765325904=:19429
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 4 Dec 2025, Marek Marczykowski-Górecki wrote:
> It uses this USB network interface.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> This was posted before at https://lore.kernel.org/xen-devel/20250411203336.585215-1-marmarek@invisiblethingslab.com/
> ---
>  scripts/build-linux.sh | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/build-linux.sh b/scripts/build-linux.sh
> index 441b872..cf0e744 100755
> --- a/scripts/build-linux.sh
> +++ b/scripts/build-linux.sh
> @@ -32,6 +32,7 @@ case $UNAME in
>              | grep 'XEN' \
>              | grep '=m' \
>              | sed 's/=m/=y/g' >> .config
> +        ./scripts/config --enable USB_RTL8152
>          ;;
>  
>      aarch64)
> -- 
> git-series 0.9.1
> 
--8323329-406630342-1765325904=:19429--

