Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BF9A115A4
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 00:50:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872128.1283082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXqfb-0007DW-NP; Tue, 14 Jan 2025 23:50:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872128.1283082; Tue, 14 Jan 2025 23:50:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXqfb-0007Al-Ka; Tue, 14 Jan 2025 23:50:03 +0000
Received: by outflank-mailman (input) for mailman id 872128;
 Tue, 14 Jan 2025 23:50:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=weCb=UG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tXqfZ-0006o9-NS
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 23:50:01 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 428ed675-d2d2-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 00:49:57 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E2C55A41DBA;
 Tue, 14 Jan 2025 23:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C4BC4CEDD;
 Tue, 14 Jan 2025 23:49:55 +0000 (UTC)
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
X-Inumbo-ID: 428ed675-d2d2-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736898596;
	bh=JD9NzxRFWErx3OXTgkffv3WN8CHR5a0OqAXtNpc3WnU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=S59B7bAa0T4esnWzMsc/5Ya5m75I3cJdc3ATOHx63X5PifK3PFld7o09tf/tXY9W5
	 9C0+KRRenW2kHUuZ6A5WXgW1DuauUaVxmemroZeN/QL7N5l8GrMy25y9BHnnc/SDhh
	 6JQyO8MiHbYG84JTJl+eKDOwXOvbZ+3Ha856gj3YUdmgsB5PH2tprOAipyMRu+fxk2
	 oq30JGaDi9qUt/EeIYWosBX/S1ynE3HaD5c9EolKwMq9v6AHHds1sXxEfeXPHb5dz0
	 7LN1KRtsY6d89nIKGkhyqBcYTCtsAw7/2tq9pRBj5NaO+xlvjwNlUYaoC9L9eJ7P4b
	 UyQCl2DFtfKlw==
Date: Tue, 14 Jan 2025 15:49:54 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.20] automation/gitlab: disable coverage from clang
 randconfig
In-Reply-To: <c715348e-0f40-4ac4-b38e-1aead29cde52@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2501141549460.2684657@ubuntu-linux-20-04-desktop>
References: <20250114174345.60887-1-roger.pau@citrix.com> <c715348e-0f40-4ac4-b38e-1aead29cde52@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1865805318-1736898596=:2684657"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1865805318-1736898596=:2684657
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 14 Jan 2025, Andrew Cooper wrote:
> On 14/01/2025 5:43 pm, Roger Pau Monne wrote:
> > If randconfig enables coverage support the build times out due to GNU LD
> > taking too long.  For the time being prevent coverage from being enabled in
> > clang randconfig job.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-1865805318-1736898596=:2684657--

