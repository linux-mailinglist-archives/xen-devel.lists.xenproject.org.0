Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB22223DD8
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 16:11:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwR52-0005uY-WA; Fri, 17 Jul 2020 14:11:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z3hM=A4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1jwR51-0005uT-GA
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 14:11:15 +0000
X-Inumbo-ID: 5f7895b0-c837-11ea-bb8b-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f7895b0-c837-11ea-bb8b-bc764e2007e4;
 Fri, 17 Jul 2020 14:11:14 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q15so15048169wmj.2
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2020 07:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=U2sdQPnze1MLKuOyuvhgbGRrHIX0NCpYikz7yBYrP2s=;
 b=veMcm7MPqDZno/rNed+Uxve/K3wX3zKeS9iLg0IUHnzbidZF8Y8lL3Jvf04KyqPqlN
 bjCZma7N628NLHjPxOpY76Uk4zKJDO4T6MfEmpj7zGkoixjr2132cHATW0hRajD9aYr7
 DLTdXIyK/pWyJmrBPCx9jrCfz7L4YC3lqgC5NstdaavS0aYwzWD4wSB5GcyQIqsOrWL2
 fpnJssjbCSRAlGZsRBK+o3XpiZ9cCEymOLdGr85UdPntq5Y4BPt3mEAYIXmh1CxUc7SZ
 USJcFAy6oAjD7QXIPVoZk0HmGOlCjOXruD9+PSWA8dRR5Zv3WX2GSEfC3DNPC2sEnYg2
 Iawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=U2sdQPnze1MLKuOyuvhgbGRrHIX0NCpYikz7yBYrP2s=;
 b=eHPBcEVBGJyAfZi8CJTAG1fhbCUu78PmeRkjne/R7ASdFdalzBcQmuu4TIdXIZUuP/
 qfbb/jFqE1NzNsNt/VxKq/bU4bT15S7XpqRTcycNdhzhwsH7LChpLUhl4QVXFdq30fP6
 LryrvNoF7J4uSKXY1uV3BckUjWy/7SMAcrh2CVg7kPxYcXgQ/1d/6vvK3bt8PCxsoqVQ
 HuxwIkisG/tMRvY5/Lb0B7qCJSWwFmhcnGEhSE4MhNeZmCL5MIEnFKdRjNR4QBvZlATf
 WAV+93OvgtiIzQnjUxdyoAXW+WzgvB44mnJJ3Izt2ptSnCHwCF/m3HFQRE0ooZEZLhh2
 416A==
X-Gm-Message-State: AOAM530xuNHBogg73pv11z0mGjen47NCwr1329Fhhiv96ll1bjWWdsAc
 gxpClsD27VT1bB4iVcBHgq+mCxogy/G84QqFoRKGvY2/3nQ=
X-Google-Smtp-Source: ABdhPJyDkKUC2h2JgdO2TeX6ielZxqfsAEnsEafrae3Ug4c8EwPNRyINL55G9FaJvOQK9hbdyCZIdB2rrBi0x3O10Wk=
X-Received: by 2002:a05:600c:218f:: with SMTP id
 e15mr8915485wme.63.1594995073104; 
 Fri, 17 Jul 2020 07:11:13 -0700 (PDT)
MIME-Version: 1.0
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Fri, 17 Jul 2020 17:11:02 +0300
Message-ID: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
Subject: Virtio in Xen on Arm (based on IOREQ concept)
To: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000c0409f05aaa3ba28"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Oleksandr Andrushchenko <andr2000@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Artem Mygaiev <joculator@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--000000000000c0409f05aaa3ba28
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello all.

We would like to resume Virtio in Xen on Arm activities. You can find some
background at [1] and Virtio specification at [2].

*A few words about importance:*
There is an increasing interest, I would even say, the requirement to have
flexible, generic and standardized cross-hypervisor solution for I/O
virtualization
in the automotive and embedded areas. The target is quite clear here.
Providing a standardized interface and device models for device
para-virtualization
in hypervisor environments, Virtio interface allows us to move Guest domain=
s
among different hypervisor systems without further modification at the
Guest side.
What is more that Virtio support is available in Linux, Android and many
other
operating systems and there are a lot of existing Virtio drivers (frontends=
)
which could be just reused without reinventing the wheel. Many
organisations push
Virtio direction as a common interface. To summarize, Virtio support would
be
the great feature in Xen on Arm in addition to traditional Xen PV drivers
for
the user to be able to choose which one to use.

*A few word about solution:*
As it was mentioned at [1], in order to implement virtio-mmio Xen on Arm
requires
some implementation to forward guest MMIO access to a device model. And as
it
turned out the Xen on x86 contains most of the pieces to be able to use tha=
t
transport (via existing IOREQ concept). Julien has already done a big amoun=
t
of work in his PoC (xen/arm: Add support for Guest IO forwarding to a
device emulator).
Using that code as a base we managed to create a completely functional PoC
with DomU
running on virtio block device instead of a traditional Xen PV driver
without
modifications to DomU Linux. Our work is mostly about rebasing Julien's
code on the actual
codebase (Xen 4.14-rc4), various tweeks to be able to run emulator
(virtio-disk backend)
in other than Dom0 domain (in our system we have thin Dom0 and keep all
backends
in driver domain), misc fixes for our use-cases and tool support for the
configuration.
Unfortunately, Julien doesn=E2=80=99t have much time to allocate on the wor=
k
anymore,
so we would like to step in and continue.

*A few word about the Xen code:*
You can find the whole Xen series at [5]. The patches are in RFC state
because
some actions in the series should be reconsidered and implemented properly.
Before submitting the final code for the review the first IOREQ patch
(which is quite
big) will be split into x86, Arm and common parts. Please note, x86 part
wasn=E2=80=99t
even build-tested so far and could be broken with that series. Also the
series probably
wants splitting into adding IOREQ on Arm (should be focused first) and
tools support
for the virtio-disk (which is going to be the first Virtio driver)
configuration before going
into the mailing list.

What I would like to add here, the IOREQ feature on Arm could be used not
only
for implementing Virtio, but for other use-cases which require some
emulator entity
outside Xen such as custom PCI emulator (non-ECAM compatible) for example.

*A few word about the backend(s):*
One of the main problems with Virtio in Xen on Arm is the absence of
=E2=80=9Cready-to-use=E2=80=9D and =E2=80=9Cout-of-Qemu=E2=80=9D Virtio bac=
kends (I least am not aware of).
We managed to create virtio-disk backend based on demu [3] and kvmtool [4]
using
that series. It is worth mentioning that although Xenbus/Xenstore is not
supposed
to be used with native Virtio, that interface was chosen to just pass
configuration from toolstack
to the backend and notify it about creating/destroying Guest domain (I
think it is
not bad since backends are usually tied to the hypervisor and can use
services
provided by hypervisor), the most important thing here is that all Virtio
subsystem
in the Guest was left unmodified. Backend wants some cleanup and, probably,
refactoring. We have a plan to publish it in a while.

Our next plan is to start preparing series for the review. Any feedback and
would be
highly appreciated.

[1]
https://lists.xenproject.org/archives/html/xen-devel/2019-07/msg01746.html
[2]
https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html
[3] https://xenbits.xen.org/gitweb/?p=3Dpeople/pauldu/demu.git;a=3Dsummary
[4] https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/
[5] https://github.com/xen-troops/xen/commits/ioreq_4.14_ml

--=20
Regards,

Oleksandr Tyshchenko

--000000000000c0409f05aaa3ba28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello all.<br><br>We would like to resume Virtio in Xen on=
 Arm activities. You can find some<br>background at [1] and Virtio specific=
ation at [2].<br><br>*A few words about importance:*<br>There is an increas=
ing interest, I would even say, the requirement to have<br>flexible, generi=
c and standardized cross-hypervisor solution for I/O virtualization<br>in t=
he automotive and embedded areas. The target is quite clear here.<br>Provid=
ing a standardized interface and device models for device para-virtualizati=
on<br>in hypervisor environments, Virtio interface allows us to move Guest =
domains<br>among different hypervisor systems without further modification =
at the Guest side.<br>What is more that Virtio support is available in Linu=
x, Android and many other<br>operating systems and there are a lot of exist=
ing Virtio drivers (frontends)<br>which could be just reused without reinve=
nting the wheel. Many organisations push<br>Virtio direction as a common in=
terface. To summarize, Virtio support would be<br>the great feature in Xen =
on Arm in addition to traditional Xen PV drivers for<br>the user to be able=
 to choose which one to use.<br><br>*A few word about solution:*<br>As it w=
as mentioned at [1], in order to implement virtio-mmio Xen on Arm requires<=
br>some implementation to forward guest MMIO access to a device model. And =
as it<br>turned out the Xen on x86 contains most of the pieces to be able t=
o use that<br>transport (via existing IOREQ concept). Julien has already do=
ne a big amount<br>of work in his PoC (xen/arm: Add support for Guest IO fo=
rwarding to a device emulator).<br>Using that code as a base we managed to =
create a completely functional PoC with DomU<br>running on virtio block dev=
ice instead of a traditional Xen PV driver without<br>modifications to DomU=
 Linux. Our work is mostly about rebasing Julien&#39;s code on the actual<b=
r>codebase (Xen 4.14-rc4), various tweeks to be able to run emulator (virti=
o-disk backend)<br>in other than Dom0 domain (in our system we have thin Do=
m0 and keep all backends<br>in driver domain), misc fixes for our use-cases=
 and tool support for the configuration.<br>Unfortunately, Julien doesn=E2=
=80=99t have much time to allocate on the work anymore,<br>so we would like=
 to step in and continue.<br><br>*A few word about the Xen code:*<br>You ca=
n find the whole Xen series at [5]. The patches are in RFC state because<br=
>some actions in the series should be reconsidered and implemented properly=
. <br>Before submitting the final code for the review the first IOREQ patch=
 (which is quite<br>big) will be split into x86, Arm and common parts. Plea=
se note, x86 part wasn=E2=80=99t<br>even build-tested so far and could be b=
roken with that series. Also the series probably<br>wants splitting into ad=
ding IOREQ on Arm (should be focused first) and tools support<br>for the vi=
rtio-disk (which is going to be the first Virtio driver) configuration befo=
re going<div>into the mailing list.<div><br><div>What I would like to add h=
ere, the IOREQ feature on Arm could be used not only</div><div>for implemen=
ting Virtio, but for other use-cases which require some emulator entity</di=
v><div>outside Xen such as custom PCI emulator (non-ECAM compatible) for ex=
ample.<br><div><br>*A few word about the backend(s):*<br>One of the main pr=
oblems with Virtio in Xen on Arm is the absence of<br>=E2=80=9Cready-to-use=
=E2=80=9D and =E2=80=9Cout-of-Qemu=E2=80=9D Virtio backends (I least am not=
 aware of).<br>We managed to create virtio-disk backend based on demu [3] a=
nd kvmtool [4] using<br>that series. It is worth mentioning that although X=
enbus/Xenstore is not supposed<br>to be used with native Virtio, that inter=
face was chosen to just pass configuration from toolstack<br>to the backend=
 and notify it about creating/destroying Guest domain (I think it is<br>not=
 bad since backends are usually tied to the hypervisor and can use services=
<br>provided by hypervisor), the most important thing here is that all Virt=
io subsystem<br>in the Guest was left unmodified. Backend wants some cleanu=
p and, probably,<br>refactoring. We have a plan to publish it in a while.</=
div><div><br>Our next plan is to start preparing series for the review. Any=
 feedback and would be<br>highly appreciated.<br><br>[1] <a href=3D"https:/=
/lists.xenproject.org/archives/html/xen-devel/2019-07/msg01746.html">https:=
//lists.xenproject.org/archives/html/xen-devel/2019-07/msg01746.html</a><br=
>[2] <a href=3D"https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-=
v1.1-cs01.html">https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-=
v1.1-cs01.html</a><br>[3] <a href=3D"https://xenbits.xen.org/gitweb/?p=3Dpe=
ople/pauldu/demu.git;a=3Dsummary">https://xenbits.xen.org/gitweb/?p=3Dpeopl=
e/pauldu/demu.git;a=3Dsummary</a><br>[4] <a href=3D"https://git.kernel.org/=
pub/scm/linux/kernel/git/will/kvmtool.git/">https://git.kernel.org/pub/scm/=
linux/kernel/git/will/kvmtool.git/</a><br>[5] <a href=3D"https://github.com=
/xen-troops/xen/commits/ioreq_4.14_ml">https://github.com/xen-troops/xen/co=
mmits/ioreq_4.14_ml</a><br clear=3D"all"><div><br></div>-- <br><div dir=3D"=
ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><span style=3D"backgro=
und-color:rgb(255,255,255)"><font size=3D"2"><span style=3D"color:rgb(51,51=
,51);font-family:Arial,sans-serif">Regards,</span></font></span></div><div =
dir=3D"ltr"><br></div><div dir=3D"ltr"><div><span style=3D"background-color=
:rgb(255,255,255)"><font size=3D"2">Oleksandr Tyshchenko</font></span></div=
></div></div></div></div></div></div></div></div></div></div></div>

--000000000000c0409f05aaa3ba28--

