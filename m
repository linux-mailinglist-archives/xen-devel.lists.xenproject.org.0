Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EBBADBE58
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 03:02:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017610.1394590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRKi1-0003Am-Ld; Tue, 17 Jun 2025 01:01:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017610.1394590; Tue, 17 Jun 2025 01:01:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRKi1-00039G-H7; Tue, 17 Jun 2025 01:01:53 +0000
Received: by outflank-mailman (input) for mailman id 1017610;
 Tue, 17 Jun 2025 01:01:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Ip9=ZA=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uRKhz-000398-8s
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 01:01:52 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9dd02b60-4b16-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 03:01:36 +0200 (CEST)
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
X-Inumbo-ID: 9dd02b60-4b16-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750122094; x=1750381294;
	bh=lOWjNrVJ+2owpZ3HYE+jAf5VTHLHLjZhbcR67OKBKJA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=FYkVjUR8QVoezEj0biPlh2jrjnCYBcm6435QEkzzSFQ6aspNEOpCaqGUuIv/wy6pu
	 Op84ZUpPHWCkZLNpa+vy4yvFomXdHePFleznFxphoMEnxuinnkHJ56um4grHk3delJ
	 EVIgHjB3j0jAQbfjva1yzF2F/s2f5Jj9ob1xOFitXWG6JUDEXHFleBi7vHe1hDcpd8
	 QUnHOsWT+2qx/Dh8qqnVRnOWVoHNihS7M9SkAFfDUQtMhsR5GGzcGgrl0Abo+yoYQj
	 BavmG7m0l8VlL3UkQ7ezAyfJAJGl3B4KSUAA03hbSliOjgfMpOI/N2TtYSdT5tIh39
	 YXqjj8QHpBNfg==
Date: Tue, 17 Jun 2025 01:01:29 +0000
To: Stefano Stabellini <sstabellini@kernel.org>
From: dmkhn@proton.me
Cc: Alejandro Vallejo <agarciav@amd.com>, Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Bertrand Marquis <bertrand.marquis@arm.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 14/14] kconfig: Allow x86 to pick CONFIG_DOM0LESS_BOOT
Message-ID: <aFC+ZW+l+llw8//Y@kraken>
In-Reply-To: <alpine.DEB.2.22.394.2506161639240.1384757@ubuntu-linux-20-04-desktop>
References: <20250613151612.754222-1-agarciav@amd.com> <20250613151612.754222-15-agarciav@amd.com> <2a54e49b-c1ad-4654-9291-4373e92580ff@xen.org> <DAO1A9SJ9I2G.2L00II6AC0JDZ@amd.com> <alpine.DEB.2.22.394.2506161639240.1384757@ubuntu-linux-20-04-desktop>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: c5eedbfe6de051fd842a13fa2b997bbea3105621
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 04:39:28PM -0700, Stefano Stabellini wrote:
> On Mon, 16 Jun 2025, Alejandro Vallejo wrote:
> > On Mon Jun 16, 2025 at 10:00 AM CEST, Julien Grall wrote:
> > > Hi,
> > >
> > > On 13/06/2025 16:13, Alejandro Vallejo wrote:
> > >> Without picking CONFIG_HAS_DEVICE_TREE.
> > >>
> > >> In order to do that. Allow CONFIG_DOM0LESS_BOOT to enable a subset
> > >> of the common/device-tree/ directory.
> > >  > x86 doesn't want dom0less-build.c,> as that's tightly integrated
> > > still to the ARM way of building domains.
> > >
> > > I don't understand this argument. dom0less-build.c was moved to commo=
n
> > > and it will soon be used by RISC-V. This raises the question what's s=
o
> > > special with x86?
> >
> > That's 2 separate matters:
> >
> >   1. dom0less-build.c not being compiled in.
> >   2. CONFIG_DOM0LESS_BOOT enabling use of DT code without CONFIG_HAS_DE=
VICE_TREE.
> >
> > (1) is a matter of not wanting to boil the ocean upfront. The way x86 a=
nd
> > everyone else build domains is just different and duplicated in non-tri=
vially
> > consolidable ways. The goal here is to enable the domain builders in an=
y arch
> > to use the same backbone. I don't want to go the extra mile just yet to=
 unify
> > domain construction (though in time I will want to).
> >
> > (2) has to do with compiling OUT things I really cannot have around. An=
ything
> > involving devices described in a DT must not exist on x86, because it h=
as no
> > concept of a "struct device".
> >
> > My intent is/was to repurpose CONFIG_HAS_DEVICE_TREE to mean "this hype=
rvisor
> > goes on a platform that gives a platform-describing DT". On x86 that's =
given by
> > DSDT/SSDTs with ACPI.
>=20
> Alejandro is suggesting two levels of Device Tree support:
>=20
> - full DT support, including device discovery via DT
> - minimal DT support, for the dom0less/hyperlaunch configuration
>=20
> Reading this series, it looks reasonable to me, at least as a stepping
> stone. I think it is expected that the kind of DT support needed by an
> architecture like ARM or RISC-V is different from the one needed by an
> architecture like x86. Of course we might be able to align things even
> more in the future but as of today I think it is reasonable to
> distinguish between the two.
>=20
> That said, we might want to consider renaming or changing the kconfig
> options. For instance:
>=20
> - CONFIG_HAS_DEVICE_TREE -> enable minimal DT support
> - CONFIG_DT_DEVICE_DISCOVERY -> device discovery via DT

Perhaps, shorter name like CONFIG_DT will be satisfactory? (instead of
CONFIG_DT_DEVICE_DISCOVERY and 'similar' convention to existing CONFIG_ACPI=
)

>=20
> In this model, all architectures would have CONFIG_HAS_DEVICE_TREE, but
> only ARM and RISC-V would have CONFIG_DT_DEVICE_DISCOVERY.
>=20
>=20
> > > Note I don't particularly care if you don't want to use it on x86.
> > > However, the argument provided is lacking some details... This will b=
e
> > > useful in the future if someone thinks about consolidating the two.
> >
> > I very definitely will want it all unified, but I'm working one elephan=
t at
> > a time.
>=20
> +1
>=20


