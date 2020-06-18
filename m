Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9341FDAA5
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 02:58:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlirT-0005HD-Kp; Thu, 18 Jun 2020 00:56:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZeQT=77=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jlirR-0005H8-PO
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 00:56:57 +0000
X-Inumbo-ID: 9b33b90e-b0fe-11ea-ba33-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b33b90e-b0fe-11ea-ba33-12813bfff9fa;
 Thu, 18 Jun 2020 00:56:56 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 625C0A2FAE;
 Thu, 18 Jun 2020 02:56:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 4E7D1A2F9E;
 Thu, 18 Jun 2020 02:56:54 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id o5n85De7uYtf; Thu, 18 Jun 2020 02:56:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id C4ECBA2FAE;
 Thu, 18 Jun 2020 02:56:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id M8zf2CvrWWM3; Thu, 18 Jun 2020 02:56:53 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 8C6C6A2F9E;
 Thu, 18 Jun 2020 02:56:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 6CF6420981;
 Thu, 18 Jun 2020 02:56:23 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id j0AqRmOhXW1I; Thu, 18 Jun 2020 02:56:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id D6C1520BB5;
 Thu, 18 Jun 2020 02:56:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Ts7feNZlCDTp; Thu, 18 Jun 2020 02:56:17 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 9BBA520981;
 Thu, 18 Jun 2020 02:56:17 +0200 (CEST)
Date: Thu, 18 Jun 2020 02:56:17 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: "Kang, Luwei" <luwei.kang@intel.com>
Message-ID: <1683804232.9278740.1592441777496.JavaMail.zimbra@cert.pl>
In-Reply-To: <DM5PR1101MB22662FC744E519062C941A40809A0@DM5PR1101MB2266.namprd11.prod.outlook.com>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <1555629278.8787770.1592333278517.JavaMail.zimbra@cert.pl>
 <MWHPR11MB1645D9EFF209C6733C4DC5018C9A0@MWHPR11MB1645.namprd11.prod.outlook.com>
 <DM5PR1101MB22669C0DD0A5AA455681A08D809A0@DM5PR1101MB2266.namprd11.prod.outlook.com>
 <20200617092103.GZ735@Air-de-Roger>
 <DM5PR1101MB22669E5CB0C4384B1005A58E809A0@DM5PR1101MB2266.namprd11.prod.outlook.com>
 <20200617125339.GB735@Air-de-Roger>
 <DM5PR1101MB22662FC744E519062C941A40809A0@DM5PR1101MB2266.namprd11.prod.outlook.com>
Subject: Re: [PATCH v1 0/7] Implement support for external IPT monitoring
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: Implement support for external IPT monitoring
Thread-Index: KAn5ItxMsuAqHW3ZzkheyNf1oni9hpiVzvKAgAAIowCAAHHNAIAAVp/wgAArhICAADbMIIAABJuAgACxxQC8IyuhIw==
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 "Nakajima, Jun" <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 18 cze 2020 o 1:29, Kang, Luwei luwei.kang@intel.com napisa=C5=82(a):

>> > > How does KVM deal with this, do they insert/modify trace packets on
>> > > trapped and emulated instructions by the VMM?
>> >
>> > The KVM includes instruction decoder and
>> emulator(arch/x86/kvm/emulate.c), and the guest's memory can be set to
>> write-protect as well. But it doesn't support Intel PT packets software
>> emulator.
>> For KVM, the Intel PT feature will be exposed to KVM guest and KVM guest=
 can
>> use Intel PT feature like native.
>>=20
>> But if such feature is exposed to the guest for it's own usage, won't it=
 be
>> missing packets for instructions emulated by the VMM?
>=20
> If setting the guest's memory write-protect, I think yes.


Thus, I propose to leave it as it is right now. If somebody is purposely al=
tering the VM state then he/she should consult not only the IPT but also un=
derstand what was done "in the meantime" by additional features, e.g. when =
something was altered by vm_event callback. As Tamas said previously, we us=
ually just want to see certain path leading to vmexit.

Please also note that there is a PTWRITE instruction that could be used in =
the future in order to add custom payloads/hints to the PT trace, when need=
ed.


>=20
> Thanks,
> Luwei Kang
>=20
>>=20
> > Thanks, Roger.

