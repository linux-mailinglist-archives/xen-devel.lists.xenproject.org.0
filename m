Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5704DB17793
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 23:02:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066432.1431659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhaPw-0004vu-MS; Thu, 31 Jul 2025 21:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066432.1431659; Thu, 31 Jul 2025 21:02:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhaPw-0004t2-JA; Thu, 31 Jul 2025 21:02:24 +0000
Received: by outflank-mailman (input) for mailman id 1066432;
 Thu, 31 Jul 2025 21:02:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hI6J=2M=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uhaPv-0004sw-1r
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 21:02:23 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6393835-6e51-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 23:02:21 +0200 (CEST)
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
X-Inumbo-ID: a6393835-6e51-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753995739; x=1754254939;
	bh=w2VzcL0+ouSUbWEqgl//tn4zIzBXF6Dgxe7DSjMKWI8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=M18Y8IJqfP1OYBS9EBa6fhdksg5+GZ6Z1uEKiXYv/LsG9+X7fxTkRw5XeKgeJpZuH
	 i4EfE+F6t6/agmw/zLlJ6IHtzmcpL7yM/TcZfZvfDjc1QNys9LF0R7UazWCK+Bk9IZ
	 d5/eda2AQ+65V3CdW6Y8RLkwGeSYNoryGIUEG4Nfmsv6uwuqgnytUVMHidtMLNWKIV
	 yc6VOJPUUvKOOAyV30Nx25G5HP85NMoVw6hwonV6rZJLoZK18TJDncfHLWZzhLE1f4
	 rO9Bcjsz0mV6uaZwH9et2un2WiKXejK8AH4dtrSuv/yZELG6BTThZvHTI6T+iedLzG
	 OwA+xkuuK7VLg==
Date: Thu, 31 Jul 2025 21:02:14 +0000
To: "Orzel, Michal" <michal.orzel@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v1 07/16] arm/vuart: rename 'virtual UART' Kconfig option
Message-ID: <aIvZ0a5P1ETGoOmp@kraken>
In-Reply-To: <3daf1254-0acb-426b-b28b-57665f406c3b@amd.com>
References: <20250624035443.344099-1-dmukhin@ford.com> <20250624035443.344099-8-dmukhin@ford.com> <070f16b8-c397-487c-bcb8-0ba13bad919b@amd.com> <aFpQOXAZkDbj2VhN@kraken> <3daf1254-0acb-426b-b28b-57665f406c3b@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: c60239bf37344ba21e0686063ddb7db1c4db9456
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Michal,

On Wed, Jun 25, 2025 at 09:07:48AM +0200, Orzel, Michal wrote:
>=20
>=20
> On 24/06/2025 09:14, dmkhn@proton.me wrote:
> > On Tue, Jun 24, 2025 at 08:37:22AM +0200, Orzel, Michal wrote:
> >>
> >>
> >> On 24/06/2025 05:55, dmkhn@proton.me wrote:
> >>> From: Denis Mukhin <dmukhin@ford.com>
> >>>
> >>> Rename HWDOM_VUART to HAS_VUART_MMIO.
> >>>
> >>> This emulator emulates only one register and the use of the emulator =
is
> >>> limited to early boot console in the guest OS.
> >>>
> >>> No functional change.
> >>>
> >>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> >>> ---
> >>>  xen/arch/arm/Kconfig              | 2 +-
> >>>  xen/arch/arm/Makefile             | 2 +-
> >>>  xen/arch/arm/include/asm/domain.h | 2 +-
> >>>  xen/arch/arm/vuart.h              | 4 ++--
> >>>  4 files changed, 5 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> >>> index 03888569f38c..b11cb583a763 100644
> >>> --- a/xen/arch/arm/Kconfig
> >>> +++ b/xen/arch/arm/Kconfig
> >>> @@ -177,7 +177,7 @@ config HAS_VUART_PL011
> >>>  =09  Allows a guest to use SBSA Generic UART as a console. The
> >>>  =09  SBSA Generic UART implements a subset of ARM PL011 UART.
> >>>
> >>> -config HWDOM_VUART
> >>> +config HAS_VUART_MMIO
> >> I personally don't like this change. The current config option name re=
ads much
> >> better and clearly denotes the purpose.
> >
> > In my opinion, the MMIO-based UART is a useful debugging tool for early=
 guest
> > boot, even when the guest doesn't run in hwdom or on Arm system.
> The reason why this vUART is for hwdom is that is uses information from d=
tuart
> (physical UART used by Xen probed from DT). This is to enable kernels use=
d as
> dom0 that had early printk/earlycon set for this serial device (as if the=
y run
> baremetal). Regular domUs have vPL011 and don't need hwdom vUART.

OK, I'll keep hwdom, hope there will be no need to change it again.

I think dtuart may be useful for bringing up some exotic OSes which do
not have pl011 driver.

But then, I want to do s/HWDOM_VUART/VUART_HWDOM/g so all vUART build-time =
settings
have the same naming convention:
    VUART_SBSA
    VUART_NS16550

Will that be OK with you?

--
Denis

>=20
> ~Michal
>=20


