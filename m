Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29877202EC7
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 05:01:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnCi2-00013E-Tq; Mon, 22 Jun 2020 03:01:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tVQB=AD=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jnCi1-000139-OR
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 03:01:21 +0000
X-Inumbo-ID: a5d38266-b434-11ea-be2b-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5d38266-b434-11ea-be2b-12813bfff9fa;
 Mon, 22 Jun 2020 03:01:20 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id B7394A2735;
 Mon, 22 Jun 2020 05:01:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id A5B72A271A;
 Mon, 22 Jun 2020 05:01:18 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id mWQqzyt6Udb5; Mon, 22 Jun 2020 05:01:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 2993BA2735;
 Mon, 22 Jun 2020 05:01:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id EL9kClQGd2SP; Mon, 22 Jun 2020 05:01:18 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 09DB8A271A;
 Mon, 22 Jun 2020 05:01:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id EDBD521A10;
 Mon, 22 Jun 2020 05:00:47 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id u8sh5X4nkqzO; Mon, 22 Jun 2020 05:00:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 783BC21A91;
 Mon, 22 Jun 2020 05:00:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ySI8ykVHcZe3; Mon, 22 Jun 2020 05:00:42 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 4D49921A10;
 Mon, 22 Jun 2020 05:00:42 +0200 (CEST)
Date: Mon, 22 Jun 2020 05:00:42 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <934104575.10902082.1592794842242.JavaMail.zimbra@cert.pl>
In-Reply-To: <4cbf963d-7cf0-3fdb-b456-db2845244dec@suse.com>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <1060400786.9820894.1592523480084.JavaMail.zimbra@cert.pl>
 <20200619113434.GZ735@Air-de-Roger>
 <1494219989.10184041.1592570120971.JavaMail.zimbra@cert.pl>
 <4cbf963d-7cf0-3fdb-b456-db2845244dec@suse.com>
Subject: Re: [PATCH v2 1/7] xen/mm: lift 32 item limit from mfn/gfn arrays
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: xen/mm: lift 32 item limit from mfn/gfn arrays
Thread-Index: pF59bWH9iYKvzECv6qANtkxo1o7SkA==
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

----- 19 cze 2020 o 14:39, Jan Beulich jbeulich@suse.com napisa=C5=82(a):

> On 19.06.2020 14:35, Micha=C5=82 Leszczy=C5=84ski wrote:
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
>>=20
>> One more question. Are these continuations transparent from the caller s=
ide,
>> or do I also need to add something on the invoker side to properly handl=
e these
>> continuations?
>=20
> They are (mostly) transparent to the guest, yes. "Mostly" because we
> have cases (iirc) where the continuation data is stored in a way that
> a guest could observe it. But it still wouldn't need to do anything
> in order for the hypercall to get continued until it completes (which
> may be "fails", faod).
>=20
> Jan


Okay, I've managed to implement continuations while still having these arra=
y small.
The operation could simply process max. 32 elements at the time and creates=
 continuation
until everything gets processed.

This will be in patch v3.


Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

