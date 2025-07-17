Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A25B0954B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 21:59:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047376.1417849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucUkk-0004Cn-G4; Thu, 17 Jul 2025 19:58:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047376.1417849; Thu, 17 Jul 2025 19:58:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucUkk-00049i-DT; Thu, 17 Jul 2025 19:58:50 +0000
Received: by outflank-mailman (input) for mailman id 1047376;
 Thu, 17 Jul 2025 19:58:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8uVp=Z6=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ucUkj-00049c-LE
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 19:58:49 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 738d8984-6348-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 21:58:47 +0200 (CEST)
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
X-Inumbo-ID: 738d8984-6348-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1752782326; x=1753041526;
	bh=bqj3iULFfX1PShTSawTLURnU50KMBirj7ihGkNIjCUc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=UrWu8+sduO/IvjSWOQoJF9XlDz2AyqUWMf7g/I2kbS1drsOwTjWjr4ybiJ6sUHXW4
	 AhRElS/fD40ohgVgdQkV0/McHP7bjKV1NiuLAcWVTgGn/qxYUEgJ+D+8yxR/UuRQPz
	 S/0BrS/uW7Rf7jQC4fK6/bLr5ok0llpnL6vcjMKN4cUGgJHk0BwgZFXaiohNRTTP7U
	 fFGw1sJ8C/6Z+WnHtYstTz7MRmxf+/wUv4+9JrHGmurqi74qG1ziKFe1E/LsD4FNEq
	 rNHbwzdbPjSWyQrY96SumGAY0IoD+FFt9bv+cM7nxlLYwbFyq345sIsjZoKHrtn/HB
	 VpCUYznU6nmvw==
Date: Thu, 17 Jul 2025 19:58:42 +0000
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
From: dmkhn@proton.me
Cc: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v1 01/16] arm/vpl011: rename virtual PL011 Kconfig option
Message-ID: <aHlV7fSjTS6SMlKh@kraken>
In-Reply-To: <DBEG1ORR4MYS.3JV34VYUK2T6G@amd.com>
References: <20250624035443.344099-1-dmukhin@ford.com> <20250624035443.344099-2-dmukhin@ford.com> <da16500d-f589-4396-8ad6-78cdb443da60@amd.com> <aFpSvMzxrNrgQEVB@kraken> <DBEG1ORR4MYS.3JV34VYUK2T6G@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 40355a88c1116aba520453904240de638b644cda
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 05:43:22PM +0200, Alejandro Vallejo wrote:
> On Tue Jun 24, 2025 at 9:24 AM CEST, dmkhn wrote:
> > On Tue, Jun 24, 2025 at 08:13:08AM +0200, Orzel, Michal wrote:
> >>
> >>
> >> On 24/06/2025 05:55, dmkhn@proton.me wrote:
> >> > From: Denis Mukhin <dmukhin@ford.com>
> >> >
> >> > Rename CONFIG_SBSA_VUART_CONSOLE to CONFIG_HAS_VUART_PL011.
> >> Why? We emulate SBSA UART and not PL011. Despite the similarities (the=
 former is
> >> a subset of the latter) they are not the same. I find it confusing and=
 drivers
> >> for PL011 might not work with SBSA UART. Also, in the future we may wa=
nt to
> >> emulate full PL011 in which case it will be even more confusing.
> >
> > That's because the emulator is called vpl011, but yes, it is SBSA UART.
> > I will adjust to SBSA, thanks!
> >
> >>
> >> Also, why HAS_?
> >
> > My understanding is that HAS_ is the desired naming convention througho=
ut the
> > code (not documented, though), e.g. all Arm UART drivers are gated by H=
AS_XXX
> > (e.g. arch/arm/platforms/Kconfig).
>=20
> HAS_ is a non-selectable property dependent on the arch. Think HAS_PCI, o=
r
> HAS_EHCI, etc. IOW: HAS_X means "you may implement feature X on this arch=
",
> which is why some options have X and HAS_X variants, where X is selectabl=
e
> while HAS_X is not.

Thanks; I will fix that.

Jan explained the difference here [1] and [2]:
[1] https://lore.kernel.org/xen-devel/6d33355c-477f-4ef3-8f17-b7f1dd1164ce@=
suse.com/
[2] https://lore.kernel.org/xen-devel/a63ac9d5-152e-47b0-8169-bf470611c059@=
suse.com/

It's just there's a lot of drivers (UARTs) which are selectable by the user=
 via
HAS_ symbols (drivers/char/Kconfig)

>=20
> Cheers,
> Alejandro
>=20


