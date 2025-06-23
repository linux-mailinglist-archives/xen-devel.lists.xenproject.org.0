Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B151FAE4E68
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 22:58:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022769.1398617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uToF9-0000Ma-06; Mon, 23 Jun 2025 20:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022769.1398617; Mon, 23 Jun 2025 20:58:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uToF8-0000Jt-SX; Mon, 23 Jun 2025 20:58:18 +0000
Received: by outflank-mailman (input) for mailman id 1022769;
 Mon, 23 Jun 2025 20:58:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1Rx=ZG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uToF7-0008C8-Hx
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 20:58:17 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c832c920-5074-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 22:58:16 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 26A9D6114F;
 Mon, 23 Jun 2025 20:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A30C4CEEA;
 Mon, 23 Jun 2025 20:58:14 +0000 (UTC)
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
X-Inumbo-ID: c832c920-5074-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750712294;
	bh=htdm7+A0ZLRUwUfY40C8qJbNYASLp3zRKuWhGO6Gmt8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RNlhDsSZCilltfjCZeW2L3NM0fRTV0aRvwC98IBzb31YJEF+7qY+q022ntkuJ1WE3
	 3DEiWjEhWLs/8kXhiNRh14Y0Nw2nWQF+92KvzxvUFVYdh6xw6G6WyJWwvEHhgVpzZD
	 3y0Z9Ov5ty2xOzb59n67V8dWbhrzExh5iCB6j4jd0E+VcFXTcqap90C0gq0OuJ2bSY
	 VqFeQxFMLTtJ+QI0OweHuVLu2VWDkZYNoA0zEHwA5wIbrw76E0a8zNpq8wDmttn03w
	 97zOycfKPPnE/ONGXqyrvv3jZ1vJi+dNF8ThFvn9rz/IJaNlcrhxZ3Ps05LI4R9XIX
	 aVxg4cc1V2MsQ==
Date: Mon, 23 Jun 2025 13:58:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 5/6] CI: use Alpine's network setup
In-Reply-To: <041efab43d46d82553fb156ae7f01cd7d7ace2fe.1750686195.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2506231358050.8066@ubuntu-linux-20-04-desktop>
References: <cover.16ccd290bf95e314a4f23777f5564b3aa2417e57.1750686195.git-series.marmarek@invisiblethingslab.com> <041efab43d46d82553fb156ae7f01cd7d7ace2fe.1750686195.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-218181069-1750712294=:8066"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-218181069-1750712294=:8066
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 23 Jun 2025, Marek Marczykowski-Górecki wrote:
> This allows Alpine startup script to properly handle service
> dependencies - necessary for starting dropbear ssh server.
> For the latter, always take the IP address from DHCP, in addition to the
> test-local one.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/scripts/qubes-x86-64.sh | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index 2750d24eba17..cf040a29856b 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -214,25 +214,23 @@ cat "${dom0_rootfs_parts[@]}" > binaries/dom0-rootfs.cpio.gz
>  # test-local configuration
>  mkdir -p rootfs
>  cd rootfs
> -mkdir -p boot etc/local.d root
> +mkdir -p boot etc/local.d root etc/network
>  cp -a ../automation/scripts/run-tools-tests root/
>  
> +echo "
> +auto xenbr0
> +iface xenbr0 inet dhcp
> +    bridge-ports eth0
> +    bridge-stp 0
> +    up ip a a 192.168.0.1/24 dev \$IFACE
> +" > etc/network/interfaces
> +
>  echo "#!/bin/bash
>  
>  bash /etc/init.d/xencommons start
>  
> -brctl addbr xenbr0
> -brctl addif xenbr0 eth0
> -ifconfig eth0 up
> -ifconfig xenbr0 up
> -ifconfig xenbr0 192.168.0.1
> -
>  " > etc/local.d/xen.start
>  
> -if [ -n "$retrieve_xml" ]; then
> -    echo "timeout 30s udhcpc -i xenbr0" >> etc/local.d/xen.start
> -fi
> -
>  if [ -n "$domU_check" ]; then
>      echo "
>  # get domU console content into test log
> -- 
> git-series 0.9.1
> 
--8323329-218181069-1750712294=:8066--

