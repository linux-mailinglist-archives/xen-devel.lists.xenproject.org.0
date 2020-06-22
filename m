Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C13EC203CA6
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 18:35:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnPOh-00020K-Qz; Mon, 22 Jun 2020 16:34:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tVQB=AD=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jnPOg-00020E-0H
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 16:34:14 +0000
X-Inumbo-ID: 343945a6-b4a6-11ea-bb8b-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 343945a6-b4a6-11ea-bb8b-bc764e2007e4;
 Mon, 22 Jun 2020 16:34:12 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id CD238A23FE;
 Mon, 22 Jun 2020 18:34:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id CAA8DA1D3A;
 Mon, 22 Jun 2020 18:34:10 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id v16cT_qraLV1; Mon, 22 Jun 2020 18:34:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 5261FA23FE;
 Mon, 22 Jun 2020 18:34:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id uoKYThEnuR4e; Mon, 22 Jun 2020 18:34:10 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 2CE73A1D3A;
 Mon, 22 Jun 2020 18:34:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 15E8D218C6;
 Mon, 22 Jun 2020 18:33:40 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id vReO675wXacE; Mon, 22 Jun 2020 18:33:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 8483921A10;
 Mon, 22 Jun 2020 18:33:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id LtOUdmnuBOAN; Mon, 22 Jun 2020 18:33:34 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 5E74320562;
 Mon, 22 Jun 2020 18:33:34 +0200 (CEST)
Date: Mon, 22 Jun 2020 18:33:34 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <895766097.11433345.1592843614252.JavaMail.zimbra@cert.pl>
In-Reply-To: <20200622162237.GN735@Air-de-Roger>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <1005194077.9820950.1592523663199.JavaMail.zimbra@cert.pl>
 <4e040500-0532-2231-f5b7-c61e97a0a0c5@suse.com>
 <800738193.11403725.1592836530558.JavaMail.zimbra@cert.pl>
 <87576264-e7df-2590-f141-351d76baac7a@suse.com>
 <1130937743.11428389.1592841763323.JavaMail.zimbra@cert.pl>
 <5b7dd58f-2dc1-32bc-3add-d896631734a4@suse.com>
 <20200622162237.GN735@Air-de-Roger>
Subject: Re: [PATCH v2 4/7] x86/vmx: add do_vmtrace_op
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: add do_vmtrace_op
Thread-Index: f7GTr4GfAQdWl0vLqzhU8plHMDvsqg==
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Jan Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 22 cze 2020 o 18:25, Roger Pau Monn=C3=A9 roger.pau@citrix.com napisa=
=C5=82(a):

> On Mon, Jun 22, 2020 at 06:16:57PM +0200, Jan Beulich wrote:
>> On 22.06.2020 18:02, Micha=C5=82 Leszczy=C5=84ski wrote:
>> > ----- 22 cze 2020 o 17:22, Jan Beulich jbeulich@suse.com napisa=C5=82(=
a):
>> >> On 22.06.2020 16:35, Micha=C5=82 Leszczy=C5=84ski wrote:
>> >>> ----- 22 cze 2020 o 15:25, Jan Beulich jbeulich@suse.com napisa=C5=
=82(a):
>> > It's also not "many gigabytes". In most use cases a buffer of 16/32/64=
 MB
>> > would suffice, I think.
>>=20
>> But that one such buffer per vCPU, isn't it? Plus these buffers
>> need to be physically contiguous, which is an additional possibly
>> severe constraint.
>=20
> FTR, from my reading of the SDM you can use a mode called ToPA where
> the buffer is some kind of linked list of tables that map to output
> regions. That would be nice, but IMO it should be implemented in a
> next iteration after the basic support is in.
>=20
> Roger.

Yes. I keep that in mind but right now I would like to go for the
minimum viable implementation, while ToPA could be added in the next
patch series.


Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

