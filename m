Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A982CAE4E53
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 22:45:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022732.1398566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTo2t-0004lH-V8; Mon, 23 Jun 2025 20:45:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022732.1398566; Mon, 23 Jun 2025 20:45:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTo2t-0004jQ-ST; Mon, 23 Jun 2025 20:45:39 +0000
Received: by outflank-mailman (input) for mailman id 1022732;
 Mon, 23 Jun 2025 20:45:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1Rx=ZG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uTo2s-0004bG-Hd
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 20:45:38 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03d769ec-5073-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 22:45:37 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0A76EA51262;
 Mon, 23 Jun 2025 20:45:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8675C4CEEA;
 Mon, 23 Jun 2025 20:45:34 +0000 (UTC)
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
X-Inumbo-ID: 03d769ec-5073-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750711535;
	bh=DUPFoBciQgT5BPaFcfzLa2hOM85X8bQ7TmXxlETZ/Eg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ei23kj74VQn9zdHUuP4HxAXvtBvjt749wqUXroO5WOIMI2X2KB+A0cdAyEja0swG8
	 s1pHNlL/2qA+kojKFOxj62yhNhyFxy6GNOsENGIfW6bRh1ksVcRffIYieRyp0tk1zv
	 k97HicvMVLLBz7kU4bbUPCQZiXZHGcdbFzAxnHLySzI3A6zf7FRuuHKI/yS7VyPZJd
	 qPuDf+r/xRmow6xAgVGFhw3L/QNGnmKgl/UORg7G7dpglDcYGzBn+9/JGNN6MMYZJW
	 0S3AtL4IYT87avFYjW7UZisCT0m1xqElBaNVbeWgDKH6Ke6NauFKGorNFIA3ojXwym
	 2FNDNrq7/0FSA==
Date: Mon, 23 Jun 2025 13:45:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts v1 2/5] Enable CONFIG_USB_RTL8152 in kernel
 for hw12 runner
In-Reply-To: <9cf513c5-7a16-48e7-8560-4ff0214e7836@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2506231345280.8066@ubuntu-linux-20-04-desktop>
References: <cover.7129d44a341f3fb3a85f808a998c28ebe8a77ee8.1750684376.git-series.marmarek@invisiblethingslab.com> <8c97ac17c41e53c15e769f28d537faa01a0b2e6a.1750684376.git-series.marmarek@invisiblethingslab.com>
 <9cf513c5-7a16-48e7-8560-4ff0214e7836@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1650126933-1750711535=:8066"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1650126933-1750711535=:8066
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 23 Jun 2025, Andrew Cooper wrote:
> On 23/06/2025 2:46 pm, Marek Marczykowski-Górecki wrote:
> > It uses this USB network interface.
> >
> > Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-1650126933-1750711535=:8066--

