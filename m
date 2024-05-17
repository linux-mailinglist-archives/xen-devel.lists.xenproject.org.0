Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A278C8DE2
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 23:51:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724476.1129739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s85Tn-0002f0-Ks; Fri, 17 May 2024 21:51:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724476.1129739; Fri, 17 May 2024 21:51:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s85Tn-0002d2-IK; Fri, 17 May 2024 21:51:07 +0000
Received: by outflank-mailman (input) for mailman id 724476;
 Fri, 17 May 2024 21:51:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ijk8=MU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s85Tm-0002cv-8r
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 21:51:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cd35686-1497-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 23:51:01 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2213061E0F;
 Fri, 17 May 2024 21:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E973C2BD10;
 Fri, 17 May 2024 21:50:59 +0000 (UTC)
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
X-Inumbo-ID: 8cd35686-1497-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715982659;
	bh=DuPDxR+/wnXLaLSayYn+Lc6ZaqKuqoSweToKrjwmE1Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hs6ZeIAvOY3S3laj2qvhNPQYTkYxPeqwxFDF19BnR8y17Niqf0wfNCux5XOhM++nu
	 wJGrdBBNw0vPxaSnqueWU8yWOUvd6vNZKK4SYT3JL475v2ySC5BTbckhKQFY7E9qzk
	 7vnN0S2t5UF1QxFXyA76oUvopSPZKwPbNBYt8xKusCPtDk4FbtTVBKpFf2hnV3SkQ6
	 g2YJp007oOPnNDJ0e1eSgPVB5W9OnlCH98UimJbydi0PgbANiSVZmYeojIWmExOiM9
	 n+L43jCJGkHv7urXLVmWbRuTIRNOVAyZryP6cFGnDwv24heerz0QbjVwwToc/XPrg3
	 4f8OJZW+lH6rw==
Date: Fri, 17 May 2024 14:50:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 04/12] automation: increase verbosity of starting a
 domain
In-Reply-To: <cebd305832fab02532fba4b63d2b3c64801753ef.1715867907.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2405171450280.1052252@ubuntu-linux-20-04-desktop>
References: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com> <cebd305832fab02532fba4b63d2b3c64801753ef.1715867907.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1165086875-1715982659=:1052252"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1165086875-1715982659=:1052252
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 16 May 2024, Marek Marczykowski-Górecki wrote:
> And start collecting qemu log earlier, so it isn't lost in case of a
> timeout during domain startup.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/scripts/qemu-alpine-x86_64.sh    | 2 +-
>  automation/scripts/qemu-smoke-dom0-arm32.sh | 2 +-
>  automation/scripts/qemu-smoke-dom0-arm64.sh | 2 +-
>  automation/scripts/qubes-x86-64.sh          | 4 ++--
>  4 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
> index 8e398dcea34b..a188d60ea6f3 100755
> --- a/automation/scripts/qemu-alpine-x86_64.sh
> +++ b/automation/scripts/qemu-alpine-x86_64.sh
> @@ -56,7 +56,7 @@ bash /etc/init.d/xencommons start
>  
>  xl list
>  
> -xl create -c /root/test.cfg
> +xl -vvv create -c /root/test.cfg
>  
>  " > etc/local.d/xen.start
>  chmod +x etc/local.d/xen.start
> diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
> index d91648905669..3d208cd55bfa 100755
> --- a/automation/scripts/qemu-smoke-dom0-arm32.sh
> +++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
> @@ -21,7 +21,7 @@ echo "#!/bin/bash
>  
>  xl list
>  
> -xl create -c /root/test.cfg
> +xl -vvv create -c /root/test.cfg
>  
>  " > ./root/xen.start
>  echo "bash /root/xen.start" >> ./etc/init.d/xen-watchdog
> diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
> index e0bb37af3610..afc24074eef8 100755
> --- a/automation/scripts/qemu-smoke-dom0-arm64.sh
> +++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
> @@ -52,7 +52,7 @@ bash /etc/init.d/xencommons start
>  
>  xl list
>  
> -xl create -c /root/test.cfg
> +xl -vvv create -c /root/test.cfg
>  
>  " > etc/local.d/xen.start
>  chmod +x etc/local.d/xen.start
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index 4beeff17d31b..bd620b0d9273 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -112,7 +112,6 @@ echo \"${passed}\"
>  "
>  
>      dom0_check="
> -tail -F /var/log/xen/qemu-dm-domU.log &
>  until grep -q \"^domU Welcome to Alpine Linux\" /var/log/xen/console/guest-domU.log; do
>      sleep 1
>  done
> @@ -167,7 +166,8 @@ ifconfig xenbr0 192.168.0.1
>  
>  # get domU console content into test log
>  tail -F /var/log/xen/console/guest-domU.log 2>/dev/null | sed -e \"s/^/(domU) /\" &
> -xl create /etc/xen/domU.cfg
> +tail -F /var/log/xen/qemu-dm-domU.log 2>/dev/null | sed -e \"s/^/(qemu-dm) /\" &
> +xl -vvv create /etc/xen/domU.cfg
>  ${dom0_check}
>  " > etc/local.d/xen.start
>  chmod +x etc/local.d/xen.start
> -- 
> git-series 0.9.1
> 
--8323329-1165086875-1715982659=:1052252--

