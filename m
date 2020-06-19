Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F86200817
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 13:52:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmFZ6-0008TD-FG; Fri, 19 Jun 2020 11:52:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=318C=AA=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jmFZ5-0008T8-1b
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 11:52:11 +0000
X-Inumbo-ID: 4e45b108-b223-11ea-bca7-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e45b108-b223-11ea-bca7-bc764e2007e4;
 Fri, 19 Jun 2020 11:52:10 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 1A8FEA3457;
 Fri, 19 Jun 2020 13:52:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 09658A328F;
 Fri, 19 Jun 2020 13:52:08 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id VtwnB6FmtmDD; Fri, 19 Jun 2020 13:52:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 82627A3457;
 Fri, 19 Jun 2020 13:52:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id b9OA9_9QeFuU; Fri, 19 Jun 2020 13:52:07 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 56CE6A328F;
 Fri, 19 Jun 2020 13:52:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 3F3C621747;
 Fri, 19 Jun 2020 13:51:37 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id tmSQ1ygic8_q; Fri, 19 Jun 2020 13:51:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id B6C0A2256C;
 Fri, 19 Jun 2020 13:51:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 8G8oGYxRY3RS; Fri, 19 Jun 2020 13:51:31 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 8CFF52255E;
 Fri, 19 Jun 2020 13:51:31 +0200 (CEST)
Date: Fri, 19 Jun 2020 13:51:31 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <1261259347.10148244.1592567491475.JavaMail.zimbra@cert.pl>
In-Reply-To: <8f38c905-c5ed-06d7-db4e-e8024e897b43@suse.com>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <1060400786.9820894.1592523480084.JavaMail.zimbra@cert.pl>
 <20200619113434.GZ735@Air-de-Roger>
 <1542506040.10138544.1592566594292.JavaMail.zimbra@cert.pl>
 <8f38c905-c5ed-06d7-db4e-e8024e897b43@suse.com>
Subject: Re: [PATCH v2 1/7] xen/mm: lift 32 item limit from mfn/gfn arrays
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: xen/mm: lift 32 item limit from mfn/gfn arrays
Thread-Index: LZiSNEInEtZmx5F3W49fgkm7P7pLww==
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
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 19 cze 2020 o 13:48, Jan Beulich jbeulich@suse.com napisa=C5=82(a):

> On 19.06.2020 13:36, Micha=C5=82 Leszczy=C5=84ski wrote:
>> ----- 19 cze 2020 o 13:34, Roger Pau Monn=C3=A9 roger.pau@citrix.com nap=
isa=C5=82(a):
>>=20
>>> On Fri, Jun 19, 2020 at 01:38:00AM +0200, Micha=C5=82 Leszczy=C5=84ski =
wrote:
>>>> Replace on-stack array allocation with heap allocation
>>>> in order to lift the limit of 32 items in mfn/gfn arrays
>>>> when calling acquire_resource.
>>>
>>> I'm afraid this is not correct, you cannot allow unbounded amounts of
>>> items to be processed like this, it's likely that you manage to
>>> trigger the watchdog if the list is long enough, specially when doing
>>> set_foreign_p2m_entry.
>>>
>>> You need to process the items in batches (32 was IMO a good start), and
>>> then add support for hypercall continuations. Take a look at how
>>> XENMEM_populate_physmap just a couple of lines below makes use of
>>> hypercall_create_continuation.
>>>
>>> After processing every batch you need to check if
>>> hypercall_preempt_check returns true and if so use
>>> hypercall_create_continuation in order to encode a continuation.
>>>
>>> Thanks, Roger.
>>=20
>>=20
>> Somebody previously suggested that this limit could be lifted this way,
>> so I would like to hear some more opinions on that.
>=20
> I did suggest the limit can be lifted, but not by processing all
> pieces in one go. Whether batches of 32 or 64 or 128 are chosen
> is a different thing, but you can't do arbitrary amounts without
> any preemption checks.
>=20
> Jan


Okay. I will try to correct it within v3.

Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

