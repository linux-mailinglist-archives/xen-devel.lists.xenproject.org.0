Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15902CFFE71
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 21:03:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197192.1514800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdZjl-0003AG-0g; Wed, 07 Jan 2026 20:02:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197192.1514800; Wed, 07 Jan 2026 20:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdZjk-00038n-Tt; Wed, 07 Jan 2026 20:02:32 +0000
Received: by outflank-mailman (input) for mailman id 1197192;
 Wed, 07 Jan 2026 20:02:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xjqK=7M=proton.me=milky_way_303030@srs-se1.protection.inumbo.net>)
 id 1vdZjh-00038h-Ip
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 20:02:31 +0000
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9a57512-ec03-11f0-9ccf-f158ae23cfc8;
 Wed, 07 Jan 2026 21:02:26 +0100 (CET)
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
X-Inumbo-ID: c9a57512-ec03-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1767816144; x=1768075344;
	bh=x/Ic/i0CEktQ5Yo7F7Ko7SDsLFKzmOEy8wDcpfg0JUE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=EHjdW1vJwtSWFPJ9XrJ1iCZoX3hnNoz99Vnw2y5lPxJKy4rVE10h6oadO8/eihtgr
	 iutPv86Ra2WBYqZMFaflctqAnnwvKkkC2NCz9wbvyv0IO+oohNhDQYoIaNAOUsMVln
	 aGbJInb30rbnV1jwnCZxFYieO5YWL38Fx+mVsJsug7kuricV3pcoSVuSzZDDAZqyOb
	 Xu/zd6kFbT/Hlrq519BxIU4FeaTq1Cht4KImcXPWeDSr6ZEEt6VyN3CXKbVkvyLYYy
	 +i+pVy7lETKq1bDNb/uy8E58/gtYtEKmafjSHxDrc09583S//yHjCIbREgaoVedSN/
	 W3KHgZu0e/xUA==
Date: Wed, 07 Jan 2026 20:02:19 +0000
To: Jason Andryuk <jandryuk@gmail.com>
From: Milky <milky_way_303030@proton.me>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Cpufreq drivers not working on T480S
Message-ID: <unRhWiUKUGc3G4yBmJJ2Pc0JOSbM4HC0b-fTBaf1f0RYJEi_aIHV3-il1EafrSE9c77-tZNUV386xdg3UANDdeonG_zecEVq7HrG2COheJ8=@proton.me>
In-Reply-To: <CAKf6xptg+0KrsjrmLD1iZFuT411S+7Pz9-HSX8L-KwQFR8o3Nw@mail.gmail.com>
References: <dg8zeLW4X3RWRJt-1jas5pAqHft5GbxYxS5mNwc4ONE8tDEruL1-5a_e-vQu1RdOUWsMXxKe_Igcewy2zcbnOfkaGVG7y6hXLcLd78HI1po=@proton.me> <CAKf6xpsN_RnY2dHnXKj_-UySf1z0auye2qy=KHOEhcBbZ1un9A@mail.gmail.com> <NqFx_tXl0Zmx2ft7YVNGodkDcUFK7nA8KWUQMjOmD0y4T5W3-sTcGxCt7ViSRObUeJog3069xTY0ODZIG5hrX-Th2MvE95dSze13MGQ2tOY=@proton.me> <CAKf6xpvtF_cE7vMb9JfsVLkYH1XRXZG3nj+QO_72-zKJ3Cxh9w@mail.gmail.com> <DkXw78UBxXYCLNKCoThGPM1kde5JwARo3NhWtlBBrrFtLFVTnwNlwDlZYzuNlSdAs9XzE0aDPqgt9dri9YKJULULBXwJLEcEgbLOgzkVSVU=@proton.me> <CAKf6xptg+0KrsjrmLD1iZFuT411S+7Pz9-HSX8L-KwQFR8o3Nw@mail.gmail.com>
Feedback-ID: 171106842:user:proton
X-Pm-Message-ID: 725be580148ccd17904489e21fd4fbbb99e08fa5
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Tuesday, January 6th, 2026 at 1:06 AM, Jason Andryuk <jandryuk@gmail.com=
> wrote:

> > As suggested, I added the debug parameters to the dom0 kernel. Before o=
r
> > after `modprobe xen-acpi-processor dyndbg=3D=3Dpmf`, there is no useful
> > debug information that I could find, apart from the
> > `xen_acpi_processor:get_max_acpi_id` message as seen below.
> >=20
> > ```
> > # sudo dmesg | grep xen.acpi
> > [ 2.282851] Kernel command line: placeholder root=3D/dev/mapper/qubes_d=
om0-root ro rd.luks.uuid=3D<...> rd.lvm.lv=3Dqubes_dom0/root rd.lvm.lv=3Dqu=
bes_dom0/swap plymouth.ignore-serial-consoles 6.6.77-1.qubes.fc37.x86_64 x8=
6_64 rhgb loglevel=3D9 "dyndbg=3Dmodule xen_acpi_processor +p" "xen_acpi_pr=
ocessor.dyndbg=3Dfunc * +p" rd.qubes.hide_all_usb
> > [ 5.224092] xen_acpi_processor: Max ACPI ID: 6
>=20
>=20
> You successfully turned on dyndbg to get that output, but there is no
> further output. This makes me think something else is wrong and
> xen-acpi-processor doesn't upload anything.
>=20
> The call here https://elixir.bootlin.com/linux/v6.18.2/source/drivers/xen=
/xen-acpi-processor.c#L557
> to
> https://elixir.bootlin.com/linux/v6.18.2/source/drivers/acpi/processor_pe=
rflib.c#L421
> goes into some acpi code. Maybe there are other messages in dmesg
> around the same time? Maybe you'd have to turn on more debugging to
> get them.

I'm dumping below a few more entries from the same dmesg log.=20

```
[    5.175506] xen:xen_evtchn: Event-channel device installed
[    5.208487] xen_pciback: backend is vpci
[    5.215060] xen_acpi_processor: Max ACPI ID: 6
[    5.721955] pciback 0000:00:14.0: xen_pciback: seizing device
[    5.722265] xen: registering gsi 16 triggering 0 polarity 1
[    5.722288] Already setup the GSI :16
[    5.723125] pciback 0000:00:1f.6: xen_pciback: seizing device
[    5.723389] xen: registering gsi 16 triggering 0 polarity 1
[    5.723408] Already setup the GSI :16
[    5.829865] pciback 0000:02:00.0: xen_pciback: seizing device
[    5.832192] xen: registering gsi 18 triggering 0 polarity 1
[    5.832214] Already setup the GSI :18
[    7.476065] nvme nvme0: pci function 0000:03:00.0
[    7.476438] xen: registering gsi 16 triggering 0 polarity 1
[    7.476459] Already setup the GSI :16
[    7.486102] nvme nvme0: 4/0/0 default/read/poll queues
[    7.489856]  nvme0n1: p1 p2
[    8.877791] xen: registering gsi 16 triggering 0 polarity 1
[    8.877823] Already setup the GSI :16
[    8.877910] i915 0000:00:02.0: [drm] Found KABYLAKE (device ID 5917) dis=
play version 9.00 stepping C0
```

> You could de-compile the ACPI tables and see if they have CPU info.
> Something like:
> mkdir acpi-tables
> cd acpi-tables
> cp /sys/firmware/acpi/tables/* .
> iasl -d *
> grep -r -e _PCT -e _PPC -e _PSS *.dsl
>=20
> That could help confirm the tables are missing.

Unfortunately it would appear so. Grepping doesn't return any results.=20

The same is also true under Debian Live; does it mean that frequency scalin=
g, since it seems to be working under Debian Live, doesn't always rely on t=
his?

I'm currently trying to find someone else with a librebooted T480S to check=
 their ACPI tables, since I'm wondering if I botched my libreboot build.


