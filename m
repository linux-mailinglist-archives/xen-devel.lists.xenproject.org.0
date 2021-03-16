Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C2F33CA42
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 01:08:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98140.186061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLxEl-0002vV-1Z; Tue, 16 Mar 2021 00:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98140.186061; Tue, 16 Mar 2021 00:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLxEk-0002v6-Um; Tue, 16 Mar 2021 00:07:02 +0000
Received: by outflank-mailman (input) for mailman id 98140;
 Tue, 16 Mar 2021 00:07:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1wRD=IO=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1lLxEj-0002v1-At
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 00:07:01 +0000
Received: from MTA-14-4.privateemail.com (unknown [198.54.118.206])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8479674d-2bc3-49d1-bba2-c2cc3beea485;
 Tue, 16 Mar 2021 00:07:00 +0000 (UTC)
Received: from mta-14.privateemail.com (localhost [127.0.0.1])
 by mta-14.privateemail.com (Postfix) with ESMTP id 70DF780069
 for <xen-devel@lists.xenproject.org>; Mon, 15 Mar 2021 20:06:59 -0400 (EDT)
Received: from mail-wm1-f47.google.com (unknown [10.20.151.201])
 by mta-14.privateemail.com (Postfix) with ESMTPA id 3A02C80065
 for <xen-devel@lists.xenproject.org>; Mon, 15 Mar 2021 20:06:59 -0400 (EDT)
Received: by mail-wm1-f47.google.com with SMTP id d191so9104526wmd.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Mar 2021 17:06:59 -0700 (PDT)
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
X-Inumbo-ID: 8479674d-2bc3-49d1-bba2-c2cc3beea485
X-Gm-Message-State: AOAM532iuDgwOntq34Dmt12s0h0zOT2jIprrqBmk2Ht5bToHts3gpMGX
	GPpybneJYLfY+qj4Cq80ykf8WAN+ZauTTpU1Vms=
X-Google-Smtp-Source: ABdhPJyKxQicTCyus8S9gdc8tagFA/qW0dDvhdEzBO1KHCrKttUT//X91NW4lLud1AOHQBE9l+1ZDkVRVwIqbJG3nMo=
X-Received: by 2002:a7b:c214:: with SMTP id x20mr1953853wmi.186.1615853217975;
 Mon, 15 Mar 2021 17:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <CABfawh=fNCxQs+QBsYw5StA+vNwqzyQUHyiib3_rujDS1W8S9A@mail.gmail.com>
 <YE/tHMt0BAtPVVi/@mail-itl>
In-Reply-To: <YE/tHMt0BAtPVVi/@mail-itl>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 15 Mar 2021 20:06:21 -0400
X-Gmail-Original-Message-ID: <CABfawhmr4JHG4mNVM2FO=tm-6sBp5ErfpF7en4=GH+DRmjRdbg@mail.gmail.com>
Message-ID: <CABfawhmr4JHG4mNVM2FO=tm-6sBp5ErfpF7en4=GH+DRmjRdbg@mail.gmail.com>
Subject: Re: 4.15.0-rc3 can't create domain when dom0 uses newer kernel
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: ClamAV using ClamSMTP

On Mon, Mar 15, 2021 at 7:26 PM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Mon, Mar 15, 2021 at 04:18:42PM -0400, Tamas K Lengyel wrote:
> > Hi all,
> > I've ran into a pretty strange issue. I have a freshly installed 4.15.0=
-rc3
> > system and everything works fine with the stock Ubuntu 20.04
> > vmlinuz-5.4.0-66-generic as the dom0 kernel - except vmtrace, which nee=
ds a
> > newer kernel, that's expected. Now if I boot dom0 with
> > vmlinuz-5.8.0-44-generic or vmlinuz-5.10.0-1016-oem I can't start any
> > domains because of some strange disk error:
> >
> > root@t2:/shared/cfg# xl create ubuntu-20.04.cfg
> > Parsing config from ubuntu-20.04.cfg
> > libxl: error: libxl_device.c:1109:device_backend_callback: Domain 1:una=
ble
> > to add device with path /local/domain/0/backend/vbd/1/51712
> > libxl: error: libxl_create.c:1613:domcreate_launch_dm: Domain 1:unable =
to
> > add disk devices
> > libxl: error: libxl_device.c:1109:device_backend_callback: Domain 1:una=
ble
> > to remove device with path /local/domain/0/backend/vbd/1/51712
> > libxl: error: libxl_domain.c:1529:devices_destroy_cb: Domain
> > 1:libxl__devices_destroy failed
> > libxl: error: libxl_domain.c:1182:libxl__destroy_domid: Domain
> > 1:Non-existant domain
> > libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain 1:Una=
ble
> > to destroy guest
> > libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain 1:Destructi=
on
> > of domain failed
> >
> > This is the disk config:
> >
> > disk =3D ['phy:/dev/t2vg/ubuntu-20.04,xvda,w']
> >
> > It's a standard LVM volume that is active, lvscan shows:
> >
> >   ACTIVE            '/dev/t2vg/ubuntu-20.04' [40.00 GiB] inherit
> >
> > I checked all the logs and I don't see anything relevant anywhere. If I
> > reboot the system with the older kernel everything works as expected as=
 far
> > as creating the same domain with the same config.
> >
> > Anyone has any idea what might be going on here?
>
> Make sure your kernel has this patch:
> https://lore.kernel.org/xen-devel/4c9af052a6e0f6485d1de43f2c38b1461996db9=
9.camel@infradead.org/
> I'm not sure about the 5.8.x, but for 5.10 it is in >=3D 5.10.13.

Thanks, after bumping the version to
https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.11.6 it all works
now. There should really be some better checks in the toolstack to
verify that the underlying kernel will work or not and give the user
an informative warning if not. The libxl errors are really not
indicative at all for what the underlying issue really is.

Tamas

