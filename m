Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8CA212946
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 18:24:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jr20Q-0003dY-0i; Thu, 02 Jul 2020 16:24:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c/Sk=AN=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jr20O-0003dT-BD
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 16:24:08 +0000
X-Inumbo-ID: 735438ea-bc80-11ea-bb8b-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 735438ea-bc80-11ea-bb8b-bc764e2007e4;
 Thu, 02 Jul 2020 16:24:07 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id E306CA3090;
 Thu,  2 Jul 2020 18:24:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id CBE9FA300A;
 Thu,  2 Jul 2020 18:24:04 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id go5xOBPgBZZb; Thu,  2 Jul 2020 18:24:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 4FE7BA3090;
 Thu,  2 Jul 2020 18:24:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id xbCvnvvTXBNC; Thu,  2 Jul 2020 18:24:04 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 13D4CA300A;
 Thu,  2 Jul 2020 18:24:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id E2D4F22DE9;
 Thu,  2 Jul 2020 18:23:33 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id I6vpVB927P65; Thu,  2 Jul 2020 18:23:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 71D1722E11;
 Thu,  2 Jul 2020 18:23:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id MHEpN4-fX64b; Thu,  2 Jul 2020 18:23:28 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 47A5522DE9;
 Thu,  2 Jul 2020 18:23:28 +0200 (CEST)
Date: Thu, 2 Jul 2020 18:23:28 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <1505813895.18300396.1593707008144.JavaMail.zimbra@cert.pl>
In-Reply-To: <20200702090047.GX735@Air-de-Roger>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <5f4f4b1afa432258daff43f2dc8119b6a441fff4.1593519420.git.michal.leszczynski@cert.pl>
 <20200702090047.GX735@Air-de-Roger>
Subject: Re: [PATCH v4 03/10] tools/libxl: add vmtrace_pt_size parameter
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - FF77 (Linux)/8.6.0_GA_1194)
Thread-Topic: tools/libxl: add vmtrace_pt_size parameter
Thread-Index: 5q6wqdKAf9z93k0C4h0wD+I0N+vYmQ==
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 tamas lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei kang <luwei.kang@intel.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 2 lip 2020 o 11:00, Roger Pau Monn=C3=A9 roger.pau@citrix.com napisa=
=C5=82(a):

> On Tue, Jun 30, 2020 at 02:33:46PM +0200, Micha=C5=82 Leszczy=C5=84ski wr=
ote:
>> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
>> index 59bdc28c89..7b8289d436 100644
>> --- a/xen/include/public/domctl.h
>> +++ b/xen/include/public/domctl.h
>> @@ -92,6 +92,7 @@ struct xen_domctl_createdomain {
>>      uint32_t max_evtchn_port;
>>      int32_t max_grant_frames;
>>      int32_t max_maptrack_frames;
>> +    uint8_t vmtrace_pt_order;
>=20
> I've been thinking about this, and even though this is a domctl (so
> not a stable interface) we might want to consider using a size (or a
> number of pages) here rather than an order. IPT also supports
> TOPA mode (kind of a linked list of buffers) that would allow for
> sizes not rounded to order boundaries to be used, since then only each
> item in the linked list needs to be rounded to an order boundary, so
> you could for example use three 4K pages in TOPA mode AFAICT.
>=20
> Roger.

In previous versions it was "size" but it was requested to change it
to "order" in order to shrink the variable size from uint64_t to
uint8_t, because there is limited space for xen_domctl_createdomain
structure.

How should I proceed?

Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

