Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02064207341
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 14:25:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo4SH-0007Cw-7g; Wed, 24 Jun 2020 12:24:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JNOX=AF=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jo4SF-0007Cr-Uj
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 12:24:39 +0000
X-Inumbo-ID: abca6a3a-b615-11ea-80a9-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id abca6a3a-b615-11ea-80a9-12813bfff9fa;
 Wed, 24 Jun 2020 12:24:38 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id A3DD9A2520;
 Wed, 24 Jun 2020 14:24:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 8C5FFA213C;
 Wed, 24 Jun 2020 14:24:36 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id w_BX55rURejH; Wed, 24 Jun 2020 14:24:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id CD808A2520;
 Wed, 24 Jun 2020 14:24:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id YMxNNB2yH312; Wed, 24 Jun 2020 14:24:35 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 9D42FA213C;
 Wed, 24 Jun 2020 14:24:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 838F021A16;
 Wed, 24 Jun 2020 14:24:05 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id IBS4fOvqu9RR; Wed, 24 Jun 2020 14:24:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 12813201EB;
 Wed, 24 Jun 2020 14:24:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id DBzudGtVUnH9; Wed, 24 Jun 2020 14:23:59 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id E5782200F2;
 Wed, 24 Jun 2020 14:23:59 +0200 (CEST)
Date: Wed, 24 Jun 2020 14:23:59 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1353594139.12442277.1593001439838.JavaMail.zimbra@cert.pl>
In-Reply-To: <bfa3d028-58de-eb99-fcff-dfc4cf1b93f1@citrix.com>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <800738193.11403725.1592836530558.JavaMail.zimbra@cert.pl>
 <87576264-e7df-2590-f141-351d76baac7a@suse.com>
 <1130937743.11428389.1592841763323.JavaMail.zimbra@cert.pl>
 <5b7dd58f-2dc1-32bc-3add-d896631734a4@suse.com>
 <901046162.11470361.1592874264410.JavaMail.zimbra@cert.pl>
 <32b7234b-dc64-a0ea-2c5c-448bcec44c34@suse.com>
 <bfa3d028-58de-eb99-fcff-dfc4cf1b93f1@citrix.com>
Subject: Re: [PATCH v2 4/7] x86/vmx: add do_vmtrace_op
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: add do_vmtrace_op
Thread-Index: o6iyDlCcFKtukIq7gCjwJRc2Z2TpEA==
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 23 cze 2020 o 19:24, Andrew Cooper andrew.cooper3@citrix.com napisa=
=C5=82(a):
> On 23/06/2020 09:51, Jan Beulich wrote:
>> I'd still like to see an explicit confirmation by him that this
>> use of memory is indeed what he has intended. There are much smaller
>> amounts of memory which we allocate on demand, just to avoid
>> allocating some without then ever using it.
>=20
> PT is a debug/diagnostic tool.=C2=A0 Its not something you'd run in
> production against a production VM.
>=20
> It's off by default (by virtue of having to explicitly ask to use it in
> the first place), and those who've asked for it don't want to be finding
> -ENOMEM after the domain has been running for a few seconds (or midway
> through the vcpus), when they inveterately want to map the rings.
>=20
> Those who request buffers in the first place and forget about them are
> not semantically different from those who ask for a silly shadow memory
> limit, or typo the guest memory and give it too much.=C2=A0 Its a admin
> error, not a safety/correctness issue.
>=20
> ~Andrew


Absolutely +1.

Assuming that somebody wants to perform some advanced scenario and is tryin=
g
to run many domains (e.g. 20), it's much better to have 19 domains
working fine and 1 prematurely crashing because of -ENOMEM,
rather than have all 20 domains randomly crashing in runtime because
it turned out there is a shortage of memory.


Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

