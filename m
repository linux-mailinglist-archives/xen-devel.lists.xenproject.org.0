Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F229B2FAB28
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 21:16:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70043.125653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1avt-0001qA-2x; Mon, 18 Jan 2021 20:15:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70043.125653; Mon, 18 Jan 2021 20:15:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1avs-0001pl-Vg; Mon, 18 Jan 2021 20:15:24 +0000
Received: by outflank-mailman (input) for mailman id 70043;
 Mon, 18 Jan 2021 20:15:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I5CA=GV=todobom.com=claudemir@srs-us1.protection.inumbo.net>)
 id 1l1avs-0001pg-D5
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 20:15:24 +0000
Received: from mail-qt1-x836.google.com (unknown [2607:f8b0:4864:20::836])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc040658-96f7-4368-a209-8a602c9e2785;
 Mon, 18 Jan 2021 20:15:23 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id h19so12134794qtq.13
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jan 2021 12:15:23 -0800 (PST)
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
X-Inumbo-ID: dc040658-96f7-4368-a209-8a602c9e2785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=todobom-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=ganFHNF7bj8Cb0v0dSgvy5KiNJJ1grugqUPh27jCuSc=;
        b=U/qNFYw57ySbIjKDsA8GmYusMsc9TwYq/oVDy2YV+oKekgyZISNUqoikqMwnDSLFzP
         jMj3TPZwE1PE/knzHlQ1CYJeZP2CScmBG1m8PWqPDlQfZdlQc0VTAGUFa6vZbEh/eMz8
         W34pbN8GQ40ICkKY7yeVdk2Dn3vM5rIntPbXlHAxs5QJGA9i13g7Im08KAxPvVXs7Puq
         SX14aq+ZDE1JDBm5+X5sav0gHwlnkaYuRWJxTYPpIeB34/oZt0R8h2zDa/XIEXkQl8me
         KWO2TiKnCOpxy6/kvTGeyGY11n00zfZ6xfkKk1c0nonw3R5ddgqa0rV65cnaRaVdlM6H
         ZnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ganFHNF7bj8Cb0v0dSgvy5KiNJJ1grugqUPh27jCuSc=;
        b=SPKrG2q5M2Gq5Dq/6x/O7qNrNAn63Ri6wR0KLIPoqHTL3OU3Dh6xw9sOJor2m+o9E+
         ZKoidaKXaTR5ecclH/I4hfFJdJgUp/j9HeDVxfvEmtjOlYKfAYRX7kkEDNlCiv7yw9uL
         N8wgByobC74lvCkRhoLepT99pImXyJzAZC5HXdOSsoG+KptRjhewPFK+5uzt5KN5emkE
         3Q5Ch4/Kc05B6Lk/lYypp5f0TCOWv21aVuvYcfJ/wrRorETo8ThCK08He2x0NEz5JBnR
         bM44oole6QX5J9D7DWMklyfjxMDrJkTo/BwzOC+ctNz5pNOdg6Os5TV18p7PA8uek+gu
         57Gg==
X-Gm-Message-State: AOAM531Xlbf9MCoGDmWXEUMQC1fKmhea1OWpkCpP6gRgZiJ1skw51TKU
	CDdplxAiQ4FBLb6e2bYJQDN0+zEbnG+v914h4d3TtkNR8B0=
X-Google-Smtp-Source: ABdhPJxBDVZIRxyloheIKo1UsXc0QhZK6gfhd2eEiZhftDIFFpFKUicHyoBQ3L+iB5oCxfgd34ne/ffDK2E9gwtGUz0=
X-Received: by 2002:ac8:3ac2:: with SMTP id x60mr1233389qte.333.1611000922695;
 Mon, 18 Jan 2021 12:15:22 -0800 (PST)
MIME-Version: 1.0
From: Claudemir Todo Bom <claudemir@todobom.com>
Date: Mon, 18 Jan 2021 17:15:11 -0300
Message-ID: <CANyqHYfNBHnUiBiXHdt+R3mZ72oYQBnQcaWuKw5gY0uDb_ZqKw@mail.gmail.com>
Subject: Problems with APIC on versions 4.9 and later (4.8 works)
To: xen-users@lists.xenproject.org, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000baf58205b93261ed"

--000000000000baf58205b93261ed
Content-Type: text/plain; charset="UTF-8"

Hi,

Sorry for the simultaneous post on xen-users and xen-devel, but as I noted
that the problem appears only for versions of xen that are >= 4.9, I think
that developers may have a look at this.

I recently bought a generic mainboard and a Xeon E5-2926v2 CPU, it is a 12
core, 24 threads cpu.

My system was already running on another machine with xen 4.11 on a debian
10 system and after replacing the mainboard it didn't boot.

After many tries I noticed that downgrading to the previous version of Xen
(4.8, available on Debian 9) works well. I also tried a lot of variations
for the dom0 kernel, all of them with the same results.

All my tests were done with 4.11, but I checked with a live version of
Alpine Linux (3.7.3, with Xen 4.9.4) that the system doesn't boot on that
release also.

With more research I noticed that if I limit dom0 to use only one CPU
(dom0_max_vcpus=1) the system boots up, I didn't check if guest VM worked,
but I suppose that they would not be able to use the other 23 vcpus
available, anyway, a system with one vcpu for dom0 would be very slow I
think.

I've noticed also that if I keep dom0 to use more than one core but disable
acpi on the dom0 kernel, it boots up, unfortunately this is not
sufficient because I cannot use any device attached to the system (not even
the usb keyboard). This only helps to detect that the problem may be in the
ACPI/APIC code.

I tried many variations with parameters related with ACPI and APIC. None of
them was satisfactory, always ended on a halted system or a self rebooting
one.

Can anyone point me to a solution for this?

Best regards,
Claudemir

--000000000000baf58205b93261ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Sorry for the simultaneous post on =
xen-users and xen-devel, but as I noted that the problem appears only for v=
ersions of xen that are &gt;=3D 4.9, I think that developers may have a loo=
k at this.</div><div><br></div><div>I recently bought a generic mainboard a=
nd a Xeon E5-2926v2 CPU, it is a 12 core, 24 threads cpu.</div><div><br></d=
iv><div>My system was already running on another machine with xen 4.11 on a=
 debian 10 system and after replacing the mainboard it didn&#39;t boot.=C2=
=A0</div><div><br></div><div>After many tries I noticed that downgrading to=
 the previous version of Xen (4.8, available on Debian 9) works well. I als=
o tried a lot of variations for the dom0 kernel, all of them with the same =
results.</div><div><br></div><div>All my tests were done with 4.11, but I c=
hecked with a live version of Alpine Linux (3.7.3, with Xen 4.9.4) that the=
 system doesn&#39;t boot on that release also.</div><div><br></div><div>Wit=
h more research I noticed that if I limit dom0 to use only one CPU (dom0_ma=
x_vcpus=3D1) the system boots up,=C2=A0I didn&#39;t check if guest=C2=A0VM =
worked, but I suppose that they would not be able to use the other 23 vcpus=
 available, anyway, a system with one vcpu for dom0 would be very slow I th=
ink.</div><div><br></div><div>I&#39;ve noticed also that if I keep dom0 to =
use more than one core but disable acpi on the dom0 kernel, it boots up, un=
fortunately this is not sufficient=C2=A0because I cannot use any device att=
ached to the system (not even the usb keyboard). This only helps to detect =
that the problem may be in the ACPI/APIC code.</div><div><br></div><div>I t=
ried many variations with parameters related with ACPI and APIC. None of th=
em was satisfactory, always ended on a halted system or a self rebooting on=
e.</div><div><br></div><div>Can anyone point me to a solution for this?</di=
v><div><br></div><div>Best regards,</div><div>Claudemir</div></div>

--000000000000baf58205b93261ed--

