Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 821802008C9
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 14:36:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmGFb-0003nl-4W; Fri, 19 Jun 2020 12:36:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=318C=AA=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jmGFZ-0003ng-7L
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 12:36:05 +0000
X-Inumbo-ID: 6df5ff20-b229-11ea-bb79-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6df5ff20-b229-11ea-bb79-12813bfff9fa;
 Fri, 19 Jun 2020 12:36:00 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id B4C86A3479;
 Fri, 19 Jun 2020 14:35:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id A23B6A2C6C;
 Fri, 19 Jun 2020 14:35:57 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id PIGH2CyjRmv1; Fri, 19 Jun 2020 14:35:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id E9BBEA3478;
 Fri, 19 Jun 2020 14:35:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id rD96HgxpXxCn; Fri, 19 Jun 2020 14:35:56 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id B0A9AA2C6C;
 Fri, 19 Jun 2020 14:35:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 9CCA321000;
 Fri, 19 Jun 2020 14:35:26 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id bXILZbiN6RZR; Fri, 19 Jun 2020 14:35:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 370052247F;
 Fri, 19 Jun 2020 14:35:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id vIObhvTjidDM; Fri, 19 Jun 2020 14:35:21 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 0E1AA21000;
 Fri, 19 Jun 2020 14:35:21 +0200 (CEST)
Date: Fri, 19 Jun 2020 14:35:20 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <1494219989.10184041.1592570120971.JavaMail.zimbra@cert.pl>
In-Reply-To: <20200619113434.GZ735@Air-de-Roger>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <1060400786.9820894.1592523480084.JavaMail.zimbra@cert.pl>
 <20200619113434.GZ735@Air-de-Roger>
Subject: Re: [PATCH v2 1/7] xen/mm: lift 32 item limit from mfn/gfn arrays
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: xen/mm: lift 32 item limit from mfn/gfn arrays
Thread-Index: 9ePTz9uC4rSX28Kka1ieARXLoMMfNw==
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Jan Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 19 cze 2020 o 13:34, Roger Pau Monn=C3=A9 roger.pau@citrix.com napisa=
=C5=82(a):

> On Fri, Jun 19, 2020 at 01:38:00AM +0200, Micha=C5=82 Leszczy=C5=84ski wr=
ote:
>> Replace on-stack array allocation with heap allocation
>> in order to lift the limit of 32 items in mfn/gfn arrays
>> when calling acquire_resource.
>=20
> I'm afraid this is not correct, you cannot allow unbounded amounts of
> items to be processed like this, it's likely that you manage to
> trigger the watchdog if the list is long enough, specially when doing
> set_foreign_p2m_entry.
>=20
> You need to process the items in batches (32 was IMO a good start), and
> then add support for hypercall continuations. Take a look at how
> XENMEM_populate_physmap just a couple of lines below makes use of
> hypercall_create_continuation.
>=20
> After processing every batch you need to check if
> hypercall_preempt_check returns true and if so use
> hypercall_create_continuation in order to encode a continuation.
>=20
> Thanks, Roger.


One more question. Are these continuations transparent from the caller side=
,
or do I also need to add something on the invoker side to properly handle t=
hese
continuations?


Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

