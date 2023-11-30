Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7C77FE772
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 03:57:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644365.1005236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8XEa-0003ll-QS; Thu, 30 Nov 2023 02:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644365.1005236; Thu, 30 Nov 2023 02:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8XEa-0003jM-Nq; Thu, 30 Nov 2023 02:57:00 +0000
Received: by outflank-mailman (input) for mailman id 644365;
 Thu, 30 Nov 2023 02:56:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SKhV=HL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8XEZ-0003jD-Dw
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 02:56:59 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 200a20fc-8f2c-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 03:56:57 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id B85ABB83E27;
 Thu, 30 Nov 2023 02:56:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BAB8C433C7;
 Thu, 30 Nov 2023 02:56:54 +0000 (UTC)
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
X-Inumbo-ID: 200a20fc-8f2c-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701313015;
	bh=KQGVboxEyzsjKgCktQoMusDvcgouoDeN7X/M0jJi898=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OhLRz8XszNihaqGuHyC6b3JnJPELsg1m/nE187BZSFO6BnJqNM7b/+WYaHEVLDy5J
	 4Gi8cHZadtifxNViA3mSzZG/12/JT1MM2adcss3hpROV5aJhYTn8qHi+PEDC5F0yD3
	 ElCXLvgNI4P4yIuqhQd9IH7zqQYtKPwhc/Em5PQJ5hLzxszA1EW13r7ejohn3E5XDa
	 L6g61lt1vdOsRFVbyXM78mBA3yy3KXVkhmlX2fNDdFR30T6IQ369jnPTajwq4hSo52
	 Tb5ce2hs1yg9u1fyPFPMj+/VmQF4TnnKDwFci1/LosolLT/CySLZu+Y4ALj8srX+mc
	 /mG7JpdeXLeFg==
Date: Wed, 29 Nov 2023 18:56:52 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 2/5] automation/alpine: add elfutils-dev
In-Reply-To: <20231128100352.35430-3-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2311291856470.3533093@ubuntu-linux-20-04-desktop>
References: <20231128100352.35430-1-roger.pau@citrix.com> <20231128100352.35430-3-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1626092098-1701313014=:3533093"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1626092098-1701313014=:3533093
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 28 Nov 2023, Roger Pau Monne wrote:
> In preparation for adding some livepatch-build-tools test update the Alpine
> container to also install elfutils-dev.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  automation/build/alpine/3.18.dockerfile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/automation/build/alpine/3.18.dockerfile b/automation/build/alpine/3.18.dockerfile
> index 4ae9cb5e9e30..aac2d8cc82d9 100644
> --- a/automation/build/alpine/3.18.dockerfile
> +++ b/automation/build/alpine/3.18.dockerfile
> @@ -47,3 +47,5 @@ RUN apk --no-cache add \
>    libcap-ng-dev \
>    ninja \
>    pixman-dev \
> +  # livepatch-tools deps
> +  elfutils-dev
> -- 
> 2.43.0
> 
--8323329-1626092098-1701313014=:3533093--

