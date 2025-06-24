Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CE8AE5D7D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 09:14:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023172.1399096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTxrJ-0007cm-Fa; Tue, 24 Jun 2025 07:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023172.1399096; Tue, 24 Jun 2025 07:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTxrJ-0007Zn-Cy; Tue, 24 Jun 2025 07:14:21 +0000
Received: by outflank-mailman (input) for mailman id 1023172;
 Tue, 24 Jun 2025 07:14:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1A0Y=ZH=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uTxrH-0007Zh-Dq
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 07:14:20 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7308873-50ca-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 09:14:17 +0200 (CEST)
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
X-Inumbo-ID: d7308873-50ca-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750749255; x=1751008455;
	bh=cuN8mmJqD27E+XZYiZXR3wELgsWrA9nQ/IWAH2J8jDI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=B/n0IILGgfCw8ysHPJEuMyCXx9jRsL5UYUszgMKm/knHBTnKd/qVVdl50qDg+JExS
	 OiVYF6qvks+tYRsBgYKOBo37qA27FvqeyF8Veg3Jum26S40cJn67W/CXeKABdKlNX4
	 HpUOJ9POc4UTpTdxFDeGbIq21NQX+BPJqnlGtL+zQyoGzWS503ALDaXXMy4NTgOJdm
	 Vprr8B10mmpx6XidqvLBJ0PV2WEHCx9J3EMqrARVR4oLtzeHzYfN8Vlhoe5GlxuSAm
	 8se+G3I0aDlKJjF+7Bi3bfSBWFS2xqhN+64FpjYpme+WA/2JFL6rcQz6RIEo8pkHgz
	 woFyrwYNao2iw==
Date: Tue, 24 Jun 2025 07:14:09 +0000
To: "Orzel, Michal" <michal.orzel@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v1 07/16] arm/vuart: rename 'virtual UART' Kconfig option
Message-ID: <aFpQOXAZkDbj2VhN@kraken>
In-Reply-To: <070f16b8-c397-487c-bcb8-0ba13bad919b@amd.com>
References: <20250624035443.344099-1-dmukhin@ford.com> <20250624035443.344099-8-dmukhin@ford.com> <070f16b8-c397-487c-bcb8-0ba13bad919b@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 430f2903a2c0eccae9c94b94759ff41c164de67d
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 08:37:22AM +0200, Orzel, Michal wrote:
>=20
>=20
> On 24/06/2025 05:55, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Rename HWDOM_VUART to HAS_VUART_MMIO.
> >
> > This emulator emulates only one register and the use of the emulator is
> > limited to early boot console in the guest OS.
> >
> > No functional change.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> >  xen/arch/arm/Kconfig              | 2 +-
> >  xen/arch/arm/Makefile             | 2 +-
> >  xen/arch/arm/include/asm/domain.h | 2 +-
> >  xen/arch/arm/vuart.h              | 4 ++--
> >  4 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > index 03888569f38c..b11cb583a763 100644
> > --- a/xen/arch/arm/Kconfig
> > +++ b/xen/arch/arm/Kconfig
> > @@ -177,7 +177,7 @@ config HAS_VUART_PL011
> >  =09  Allows a guest to use SBSA Generic UART as a console. The
> >  =09  SBSA Generic UART implements a subset of ARM PL011 UART.
> >
> > -config HWDOM_VUART
> > +config HAS_VUART_MMIO
> I personally don't like this change. The current config option name reads=
 much
> better and clearly denotes the purpose.

In my opinion, the MMIO-based UART is a useful debugging tool for early gue=
st
boot, even when the guest doesn't run in hwdom or on Arm system.

>=20
> ~Michal
>=20


