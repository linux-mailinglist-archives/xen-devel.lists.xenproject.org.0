Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 690B9A7B42B
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 02:33:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937588.1338520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Uzu-0002kv-IE; Fri, 04 Apr 2025 00:33:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937588.1338520; Fri, 04 Apr 2025 00:33:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Uzu-0002jO-FV; Fri, 04 Apr 2025 00:33:26 +0000
Received: by outflank-mailman (input) for mailman id 937588;
 Fri, 04 Apr 2025 00:33:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oGR=WW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u0Uzt-0002jI-3N
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 00:33:25 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67abc5e4-10ec-11f0-9ffb-bf95429c2676;
 Fri, 04 Apr 2025 02:33:19 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 265A4A45A44;
 Fri,  4 Apr 2025 00:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F4DC4CEE3;
 Fri,  4 Apr 2025 00:33:16 +0000 (UTC)
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
X-Inumbo-ID: 67abc5e4-10ec-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743726797;
	bh=TkxRwZQ+thdOaCKvNHQdXlojvPVGsxy8M1omF3sUV7o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uj9GXk0AE6TSmtEb1s0uqm8UDkf3E8RekJEHXtH1A5ytIqJqKcn8ktt9S7BDtobcW
	 KCbK0Vj9BHOd22jysxDHWNHWK1By/VaotsO491OF413KIOA/2wrIzfhE8WAiYwadZA
	 okLjGLWYR+MeTzbwA7KWH+6Gv4viN/Z357aD+6cm52Hoip+xRk41FO5q2zEFaAoZgK
	 x7UnJnYiee1ZjN3L9uzkms3iCZGaGqsHG2iIGwYUK7UJtvmfDkqui2DK1n9w4kmLkT
	 Ln2LuOuB/pv2qet05WMdCbM6QkqbQEgMpaajH8kwnNAvnbK9yhmiRxhdnd6K/p1l64
	 U7HicKRY1NLTQ==
Date: Thu, 3 Apr 2025 17:33:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 05/11] ci: increase verbosity of starting a domain
In-Reply-To: <12d51df19d6111c2f61910e9851595aecceb752b.1743678257.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2504031732540.3529306@ubuntu-linux-20-04-desktop>
References: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com> <12d51df19d6111c2f61910e9851595aecceb752b.1743678257.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-402144187-1743726797=:3529306"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-402144187-1743726797=:3529306
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 3 Apr 2025, Marek Marczykowski-Górecki wrote:
> And start collecting qemu log earlier, so it isn't lost in case of a
> timeout during domain startup.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

As we are doing this across the board please also do the same for
xilinx-smoke-dom0-x86_64.sh


> ---
>  automation/scripts/qemu-alpine-x86_64.sh    | 2 +-
>  automation/scripts/qemu-smoke-dom0-arm32.sh | 2 +-
>  automation/scripts/qemu-smoke-dom0-arm64.sh | 2 +-
>  automation/scripts/qubes-x86-64.sh          | 4 ++--
>  4 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
> index 1ff689b577e3..17e2141d625e 100755
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
> index e1cd83880928..0c60a66e25e3 100755
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
> index 4d22a124df11..8774a8701232 100755
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
> index d316c17e0c9f..822b81d186a7 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -122,7 +122,6 @@ echo \"${passed}\"
>  "
>  
>          dom0_check="
> -tail -F /var/log/xen/qemu-dm-domU.log &
>  until grep -q \"^domU Welcome to Alpine Linux\" /var/log/xen/console/guest-domU.log; do
>      sleep 1
>  done
> @@ -222,7 +221,8 @@ if [ -n "$domU_check" ]; then
>      echo "
>  # get domU console content into test log
>  tail -F /var/log/xen/console/guest-domU.log 2>/dev/null | sed -e \"s/^/(domU) /\" &
> -xl create /etc/xen/domU.cfg
> +tail -F /var/log/xen/qemu-dm-domU.log 2>/dev/null | sed -e \"s/^/(qemu-dm) /\" &
> +xl -vvv create /etc/xen/domU.cfg
>  ${dom0_check}
>  " >> etc/local.d/xen.start
>  else
> -- 
> git-series 0.9.1
> 
--8323329-402144187-1743726797=:3529306--

