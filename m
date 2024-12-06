Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D219E7E9F
	for <lists+xen-devel@lfdr.de>; Sat,  7 Dec 2024 08:05:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.850522.1264962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJorL-0003RP-Nb; Sat, 07 Dec 2024 07:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 850522.1264962; Sat, 07 Dec 2024 07:04:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJorL-0003Mn-FU; Sat, 07 Dec 2024 07:04:11 +0000
Received: by outflank-mailman (input) for mailman id 850522;
 Fri, 06 Dec 2024 21:40:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gq+l=S7=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tJg3h-0004tw-TV
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 21:40:22 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b07ca4cd-b41a-11ef-99a3-01e77a169b0f;
 Fri, 06 Dec 2024 22:40:19 +0100 (CET)
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
X-Inumbo-ID: b07ca4cd-b41a-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=obvfqx6jczfvvnv5aare5csz3u.protonmail; t=1733521218; x=1733780418;
	bh=mZRhc2iB7FrrSohk+3J3TNgbBs+IDDRJtYpJFl+k+Zk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=f18ohYVDnqiUcpXJWJ1c4zPP3h8Ej3C/QdO0MZK+7hn7KSjKTP1d5PW7qOOWIPUJi
	 PVcRWeppxIzDXaC/55MrERMns6hBbkh+sC4J1af1XWUT9ZwOaFvb5DtmRV2FrkZDnZ
	 gQedHFaE27QpeJJXobTQsaJwT7AxNyaD3XJsYFGQ7g9+CZ3EioaGUjm7/UdQmU1Oix
	 /R6vl1TzxV8dqA5819Oy7jzPO8bmXz2dvfF/B44gVCzZbiQfk7bz10Bsq5Fkw3sRbj
	 BmKSdlBzi9F+1uzUIo6CQc0YPDJHcwQw6VAemXcPpKSDz7aKryqOc7tNmhE2sMmy4i
	 o/u/780ukZYmw==
Date: Fri, 06 Dec 2024 21:40:13 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 00/36] Introduce NS8250 UART emulator
Message-ID: <9UHall6dGEJP7fCAeg7-Xx4wZ2Nsrsi6yUH-ViDUl3rMpk31wPzGOId82_u3rMc0dTNTLyUidIv-6c2ni_7n5YFgSCINSbXY6aS1JMardHU=@proton.me>
In-Reply-To: <c08bd940-a2eb-4fb8-9f8d-2c5f3f1fab54@citrix.com>
References: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com> <c08bd940-a2eb-4fb8-9f8d-2c5f3f1fab54@citrix.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 0f42e75e612e9467429412ae432aab55b1da5586
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Tuesday, November 26th, 2024 at 3:57 PM, Andrew Cooper <andrew.cooper3@c=
itrix.com> wrote:

>=20
>=20
> On 26/11/2024 11:21 pm, Denis Mukhin via B4 Relay wrote:
>=20
> > The patch series introduces initial in-hypervisor emulator for
> > NS8250/NS16x50-compatible UARTs under CONFIG_HAS_VUART_NS8250.
> >=20
> > In parallel domain creation scenario (hyperlaunch), NS8520 emulator hel=
ps
> > early guest OS bringup debugging, because it eliminates dependency on t=
he
> > external emulator being operational by the time domains are created. Al=
so,
> > there's no early console facility similar to vpl011 to support x86 gues=
t OS
> > bring up.
> >=20
> > The NS8250 emulator is disabled by default.
> >=20
> > Series
> > =3D=3D=3D=3D=3D=3D
> > - patches 1-2: some miscellaneous random fixes, added into the series
> > because I stepped into those while debugging NS8250 emulator.
> >=20
> > - patches 3-14: preparation fixes for xen console and NS8250 emulator.
> >=20
> > - patches 15-29: xen console driver cleanup and preparation for enablin=
g
> > physical serial console focus assignment to the guest VM w/ virtual NS8=
250.
> >=20
> > - patches 30-36: initial NS8250 emulator. That adds the I/O port emulat=
or
> > for legacy PC COM UARTs, Kconfig option, enabling emulator and libxl
> > plumbing.
> >=20
> > Limitations
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > - Only x86;
> > - Only Linux guest tested so far;
> > - Only legacy COM{1,2,3,4} resources, no customization;
> > - Only Xen console as a backend, no inter-domain communication (similar=
 to
> > vpl011 on Arm);
> > - Only 8-bit characters;
> > - Baud rate is not emulated;
> > - FIFO-less mode is not emulated properly;
> > - RX FIFO interrupt moderation (FCR) is not emulated properly, TL16C750
> > has special FCR handling;
> > - No integration w/ VM snapshotting (HVM_REGISTER_SAVE_RESTORE() and
> > friends);
> > - Assumes no ISA-device IRQ sharing;
> > - MMIO-based UART is not supported.
> >=20
> > Testing
> > =3D=3D=3D=3D=3D=3D=3D
> >=20
> > I tested boot of HVM linux guest w/ OVMF as the virtual firmware.
> >=20
> > The emulator, if enabled via CONFIG_HAS_VUART_NS8250=3Dy, will use COM1=
 (0x3f8)
> > resources by default.
> >=20
> > To test w/ virtual COM1, the guest kernel parameters should contain
> > earlycon=3Duart,io,0x3f8,115200n8 console=3Duart,io,0x3f8,115200n8
> >=20
> > Xen is able to forward physical console input to the domain w/ virtual =
NS8250.
> > To switch the console focus press Ctrl+aaa. If console=3D is given to t=
he HVM
> > kernel, then the user shall be able to see the login prompt on xen cons=
ole once
> > console focus is switched to the HVM guest.
> >=20
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
>=20
>=20
> Hello,
>=20
> Thankyou for this. It's an excellent start for first posting to the list.
>=20
> Two things stand out at a glance.
>=20
> First, xmalloc/free are the expected functions to use, and kmalloc/free
> are not equivalent. We have some drivers ported from Linux, hence the
> compatibility, and if it needs to extend beyond smmu.c then there's
> linux-compat.h where definitions can live, but we really don't want them
> visible generally.

Dropped in v2:
  https://lore.kernel.org/xen-devel/20241205-vuart-ns8250-v1-0-e9aa923127eb=
@ford.com/

>=20
> Second and more importantly, I'm afraid this won't pass CI right now.
> Your function pointees (e.g. ns8250_iir_check_lsi()/etc) need a cf_check
> attribute on them, in order to function when running on CET-IBT capable
> hardware.
>=20
> From the root of the Xen tree, if you run:
>=20
> CONTAINER=3Dbookworm-x86_64-gcc-ibt ./automation/scripts/containerize
>=20
> then you'll get a build environment with suitable diagnostics.
> Unfortunately we're still relying on an out-of-tree GCC patch to have a
> compiler that can point out the problems at build time, as opposed to
> encountering the #CP exceptions at runtime.

Addressed in v2.
Thanks for help w/ fixing CI!

>=20
>=20
> I'll try to have a closer look at the rest of the series tomorrow.
>=20
> ~Andrew



