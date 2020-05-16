Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EA01D5D72
	for <lists+xen-devel@lfdr.de>; Sat, 16 May 2020 02:55:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZl5h-0004Lh-67; Sat, 16 May 2020 00:54:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4r6I=66=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jZl5f-0004Lc-PG
 for xen-devel@lists.xenproject.org; Sat, 16 May 2020 00:54:11 +0000
X-Inumbo-ID: c033694c-970f-11ea-9887-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c033694c-970f-11ea-9887-bc764e2007e4;
 Sat, 16 May 2020 00:54:10 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id E2953A22BA
 for <xen-devel@lists.xenproject.org>; Sat, 16 May 2020 02:54:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id DD70FA221F
 for <xen-devel@lists.xenproject.org>; Sat, 16 May 2020 02:54:07 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id wBJ7ySV-v-f5 for <xen-devel@lists.xenproject.org>;
 Sat, 16 May 2020 02:54:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 5CDA0A1FAE
 for <xen-devel@lists.xenproject.org>; Sat, 16 May 2020 02:54:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id gLT2_Iv1aunW for <xen-devel@lists.xenproject.org>;
 Sat, 16 May 2020 02:54:07 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 3EAF3A1F9B
 for <xen-devel@lists.xenproject.org>; Sat, 16 May 2020 02:54:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 25510219DD
 for <xen-devel@lists.xenproject.org>; Sat, 16 May 2020 02:53:37 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id XEWAgGxgG1Km for <xen-devel@lists.xenproject.org>;
 Sat, 16 May 2020 02:53:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 7783F21A09
 for <xen-devel@lists.xenproject.org>; Sat, 16 May 2020 02:53:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Qat2-CW364Mr for <xen-devel@lists.xenproject.org>;
 Sat, 16 May 2020 02:53:31 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 500A2219DD
 for <xen-devel@lists.xenproject.org>; Sat, 16 May 2020 02:53:31 +0200 (CEST)
Date: Sat, 16 May 2020 02:53:31 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Message-ID: <1740303418.53653891.1589590411232.JavaMail.zimbra@cert.pl>
Subject: Re: [PATCH 0/3] vm_event: fix race-condition when disabling monitor
 events
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC81 (Win)/8.6.0_GA_1194)
Thread-Topic: vm_event: fix race-condition when disabling monitor events
Thread-Index: GQOYuTEZ4+ZEM83zLw5zzDot3iub4A==
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> For the last couple years we have received numerous reports from users of
> monitor vm_events of spurious guest crashes when using events. In particu=
lar,
> it has observed that the problem occurs when vm_events are being disabled=
. The
> nature of the guest crash varied widely and has only occured occasionally=
. This
> made debugging the issue particularly hard. We had discussions about this=
 issue
> even here on the xen-devel mailinglist with no luck figuring it out.
>=20
> The bug has now been identified as a race-condition between register even=
t
> handling and disabling the vm_event interface.
>=20
> Patch 96760e2fba100d694300a81baddb5740e0f8c0ee, "vm_event: deny register =
writes
> if refused by  vm_event reply" is the patch that introduced the error. In=
 this
> patch emulation of register write events can be postponed until the
> corresponding vm_event handler decides whether to allow such write to tak=
e
> place. Unfortunately this can only be implemented by performing the deny/=
allow
> step when the vCPU gets scheduled. Due to that postponed emulation of the=
 event
> if the user decides to pause the VM in the vm_event handler and then disa=
ble
> events, the entire emulation step is skipped the next time the vCPU is re=
sumed.
> Even if the user doesn't pause during the vm_event handling but exits
> immediately and disables vm_event, the situation becomes racey as disabli=
ng
> vm_event may succeed before the guest's vCPUs get scheduled with the pend=
ing
> emulation task. This has been particularly the case with VMs that have se=
veral
> vCPUs as after the VM is unpaused it may actually take a long time before=
 all
?vCPUs get scheduled.
>=20
> The only solution currently is to poll each vCPU before vm_events are dis=
abled
> to verify they had been scheduled. The following patches resolve this iss=
ue in
> a much nicer way.
>=20
> Patch 1 adds an option to the monitor_op domctl that needs to be specifie=
d if
>     the user wants to actually use the postponed register-write handling
>     mechanism. If that option is not specified then handling is performed=
 the
>     same way as before patch 96760e2fba100d694300a81baddb5740e0f8c0ee.
>    =20
> Patch 2 performs sanity checking when disabling vm_events to determine wh=
ether
>     its safe to free all vm_event structures. The vCPUs still get unpause=
d to
>     allow them to get scheduled and perform any of their pending operatio=
ns,
>     but otherwise an -EAGAIN error is returned signaling to the user that=
 they
>     need to wait and try again disabling the interface.
>    =20
> Patch 3 adds a vm_event specifically to signal to the user when it is saf=
e to
>     continue disabling the interface.
>    =20
> Shout out to our friends at CERT.pl for stumbling upon a crucial piece of
> information that lead to finally squashing this nasty bug.
>=20
> Tamas K Lengyel (3):
>   xen/monitor: Control register values
>   xen/vm_event: add vm_event_check_pending_op
>   xen/vm_event: Add safe to disable vm_event
>=20
>  xen/arch/x86/hvm/hvm.c            | 69 +++++++++++++++++++++++--------
>  xen/arch/x86/hvm/monitor.c        | 14 +++++++
>  xen/arch/x86/monitor.c            | 23 ++++++++++-
>  xen/arch/x86/vm_event.c           | 23 +++++++++++
>  xen/common/vm_event.c             | 17 ++++++--
>  xen/include/asm-arm/vm_event.h    |  7 ++++
>  xen/include/asm-x86/domain.h      |  2 +
>  xen/include/asm-x86/hvm/monitor.h |  1 +
>  xen/include/asm-x86/vm_event.h    |  2 +
>  xen/include/public/domctl.h       |  3 ++
>  xen/include/public/vm_event.h     |  8 ++++
>  11 files changed, 147 insertions(+), 22 deletions(-)
>=20
> --=20
> 2.26.1

Hi,

I have reproduced the mentioned race-condition between register event handl=
ing and disabling the vm_event interface. With Xen 4.13.0 and Windows 7 x64=
 DomU (2 VCPUs), my test program causes random BSODs on DomU once vm_event =
interface is disabled. I can confirm that after applying Patch 1 to Xen 4.1=
3.0 the test program doesn't crash the DomU anymore, so it would actually r=
esolve the mentioned bug.

Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Poland

