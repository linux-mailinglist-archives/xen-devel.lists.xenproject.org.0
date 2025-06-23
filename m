Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A042CAE4E56
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 22:46:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022738.1398577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTo3H-0005HP-7J; Mon, 23 Jun 2025 20:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022738.1398577; Mon, 23 Jun 2025 20:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTo3H-0005EO-3x; Mon, 23 Jun 2025 20:46:03 +0000
Received: by outflank-mailman (input) for mailman id 1022738;
 Mon, 23 Jun 2025 20:46:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1Rx=ZG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uTo3F-0004JI-TS
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 20:46:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1214e229-5073-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 22:46:01 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EF3E55C62B1;
 Mon, 23 Jun 2025 20:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED31C4CEEA;
 Mon, 23 Jun 2025 20:45:58 +0000 (UTC)
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
X-Inumbo-ID: 1214e229-5073-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750711559;
	bh=dzoPn6nbN1OcgVRzESyhwetwmEWU74/v/n2v3td19Gw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tzgZalSNH5/vYcTXE9jjFYzobirIKftObMrzzOqVZKJC6mEC2JvYd4GcdahS8elbD
	 9Hm97ZG+t6cKyvqDiDYwqdcJNJdcnS84q4ZpD7Bw2dUgjKD1mX1cjdt0T8R5XsJZ2P
	 yX8p64QAbDewg3p3poTWSDMgRo1Tc0O4Sgd2GrUzzCSrcKQ7Xm41JGpKgieq81JLd+
	 xs263wdwpttnEdc03g+mFm04hiKMSFHFbyCSQpOkAVVJLQc0yefNBLnGhTt5le1tz7
	 o/3KaF8cObjS4ZGpEtFiXrwHXS0HlRM3WstSHu0DzD5VYYxGo7sNerq4OT1TlNr6Gh
	 sXLo2xQrlOarw==
Date: Mon, 23 Jun 2025 13:45:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH test-artifacts v1 3/5] Include git in the ARM64 build
 container too
In-Reply-To: <f1ccf882-1ee5-4703-af7e-2f94725f8fee@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2506231345510.8066@ubuntu-linux-20-04-desktop>
References: <cover.7129d44a341f3fb3a85f808a998c28ebe8a77ee8.1750684376.git-series.marmarek@invisiblethingslab.com> <dd83dd435e519d937eecbdb8313ca0794877c8f5.1750684376.git-series.marmarek@invisiblethingslab.com>
 <f1ccf882-1ee5-4703-af7e-2f94725f8fee@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1551293496-1750711559=:8066"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1551293496-1750711559=:8066
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 23 Jun 2025, Andrew Cooper wrote:
> On 23/06/2025 2:46 pm, Marek Marczykowski-Górecki wrote:
> > It will be used for fetching some Linux versions.
> >
> > Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-1551293496-1750711559=:8066--

