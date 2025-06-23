Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A4EAE4E50
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 22:45:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022728.1398557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTo2U-0004LF-Nt; Mon, 23 Jun 2025 20:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022728.1398557; Mon, 23 Jun 2025 20:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTo2U-0004JO-Ky; Mon, 23 Jun 2025 20:45:14 +0000
Received: by outflank-mailman (input) for mailman id 1022728;
 Mon, 23 Jun 2025 20:45:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1Rx=ZG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uTo2T-0004JI-J5
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 20:45:13 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f50d6e3c-5072-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 22:45:12 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5B1CC4A5D9;
 Mon, 23 Jun 2025 20:45:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 812CEC4CEED;
 Mon, 23 Jun 2025 20:45:10 +0000 (UTC)
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
X-Inumbo-ID: f50d6e3c-5072-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750711511;
	bh=RDPZHFICfod1F+Yjy8WvWC56PpTydfZoTb2k1h3xG0w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=t9hjHXf1jnYL6B6gFtPuyzY8v9TnwUgiOucuvTh3ci3sHQRp0VVAuQ3+ERQbx8HC/
	 9qCjAj5a5ILsOO7FL+WSFf8xZeWL3a9140dOX5xBMV75erKt0z0k1HTCgZpslQ2ZmH
	 NVdsqE2GQ/d4rqEip/lmb0/WyvAXIsbGo4DlkG16mggEyGBDfRCbvtUW0lDc2w6Dhm
	 CQjcEQ+EJvQtp/0O3cBTmtYibXyWOB1Rm31FAIWAVZSJjbUvSJ9p5gD6XUy7iIOLEK
	 ie4yIWJn15+caWeBLc9yIHHZ0eVp1xJUFWwrMsuQH38WXJqVkSpZwJk9UDC8Z0zRgd
	 nLI9ygJve2CQw==
Date: Mon, 23 Jun 2025 13:45:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts v1 1/5] Add linux-6.12.34-x86_64
In-Reply-To: <cf4b8af8-1855-43d8-8416-90db9ec4a634@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2506231345030.8066@ubuntu-linux-20-04-desktop>
References: <cover.7129d44a341f3fb3a85f808a998c28ebe8a77ee8.1750684376.git-series.marmarek@invisiblethingslab.com> <0a3e893e5fe133dc710d11a31006ba4f2c1b0cbe.1750684376.git-series.marmarek@invisiblethingslab.com>
 <cf4b8af8-1855-43d8-8416-90db9ec4a634@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-935472679-1750711511=:8066"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-935472679-1750711511=:8066
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 23 Jun 2025, Andrew Cooper wrote:
> On 23/06/2025 2:46 pm, Marek Marczykowski-Górecki wrote:
> > This is necessary for new Zen4 runner.
> > Do not include Argo module in this build, as it isn't compatible with
> > 6.12 yet.
> >
> > Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-935472679-1750711511=:8066--

