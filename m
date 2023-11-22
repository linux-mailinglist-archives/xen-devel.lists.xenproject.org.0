Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 710837F3B35
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 02:23:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638350.994835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5bxR-0006ia-6y; Wed, 22 Nov 2023 01:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638350.994835; Wed, 22 Nov 2023 01:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5bxR-0006gQ-4K; Wed, 22 Nov 2023 01:23:13 +0000
Received: by outflank-mailman (input) for mailman id 638350;
 Wed, 22 Nov 2023 01:23:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIMN=HD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5bxQ-0006gK-8b
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 01:23:12 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b264f463-88d5-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 02:23:11 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 47F87CE1E93;
 Wed, 22 Nov 2023 01:23:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB821C433C7;
 Wed, 22 Nov 2023 01:23:07 +0000 (UTC)
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
X-Inumbo-ID: b264f463-88d5-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700616188;
	bh=2bLnMTXhyZM+R/a1tHoAFr/QLK+ZQeaCAXn1fuY6U7A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kBIna9pRUzLKK+j7qmiuSc3rJFl2x577EC/0+9vQkDPE9ses4A//uNNc01l8abBoY
	 EvRugzrfeK1ZEjHv3G3YqAt+437wUwYjRnncLuy8mzqIQ/ZX+broxV0rICvyweL+vN
	 LcEFgkd4OX1CU1EJ3W70qL/wFqW9++6pc4AgIWURUylEWFAuTGhR/KFDAl9Z7qap+A
	 LuBryOQhnGd+Zkp4AWxJHjsM3WN0MbRLEd/DU0PvoztgQSKf08s190CQdKwlrGtfcI
	 /7nUa5XRCPmMIZFUGbpScF3QSW4dYatoSPJV41i1tlIa1uQiqlXby+nYpzlhtTqvde
	 gWFduc/rZTi6A==
Date: Tue, 21 Nov 2023 17:23:06 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 2/7] automation: remove com1= parameter on QEMU smoke
 tests
In-Reply-To: <20231121160358.8080-3-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2311211723000.2053963@ubuntu-linux-20-04-desktop>
References: <20231121160358.8080-1-roger.pau@citrix.com> <20231121160358.8080-3-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1669872003-1700616188=:2053963"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1669872003-1700616188=:2053963
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 21 Nov 2023, Roger Pau Monne wrote:
> The serial is already setup by the firmware, be consistent with the rest of the
> QEMU tests and don't specify a com1 setup.
> 
> Note it's also bogus, as the extra ',' will make the intended DPS argument to
> be parsed as the io-base.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> Changes in v2:
>  - New in this version
> ---
>  automation/scripts/qemu-smoke-x86-64.sh | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/automation/scripts/qemu-smoke-x86-64.sh b/automation/scripts/qemu-smoke-x86-64.sh
> index 188ff8e3d658..3014d07314b9 100755
> --- a/automation/scripts/qemu-smoke-x86-64.sh
> +++ b/automation/scripts/qemu-smoke-x86-64.sh
> @@ -19,8 +19,7 @@ set +e
>  timeout -k 1 30 \
>  qemu-system-x86_64 -nographic -kernel binaries/xen \
>          -initrd xtf/tests/example/$k \
> -        -append "loglvl=all com1=115200,,8n1 console=com1 noreboot \
> -                 console_timestamps=boot $extra" \
> +        -append "loglvl=all console=com1 noreboot console_timestamps=boot $extra" \
>          -m 512 -monitor none -serial file:smoke.serial
>  set -e
>  grep -q 'Test result: SUCCESS' smoke.serial || exit 1
> -- 
> 2.42.0
> 
--8323329-1669872003-1700616188=:2053963--

