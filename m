Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AA9215569
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 12:19:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsODJ-0003EJ-47; Mon, 06 Jul 2020 10:19:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YXjd=AR=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jsODH-0003EE-57
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 10:19:03 +0000
X-Inumbo-ID: 1ca74b8c-bf72-11ea-8c58-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ca74b8c-bf72-11ea-8c58-12813bfff9fa;
 Mon, 06 Jul 2020 10:19:02 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 45042A1AAF;
 Mon,  6 Jul 2020 12:19:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 2D22FA1A0A;
 Mon,  6 Jul 2020 12:19:00 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id V8pAvAeiI1Td; Mon,  6 Jul 2020 12:18:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id A32C0A1AAF;
 Mon,  6 Jul 2020 12:18:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id zRw0KEerLma7; Mon,  6 Jul 2020 12:18:59 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 7FA84A1A0A;
 Mon,  6 Jul 2020 12:18:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 6F72A22367;
 Mon,  6 Jul 2020 12:18:29 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id J27zcxqFVr_q; Mon,  6 Jul 2020 12:18:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id D6FD321756;
 Mon,  6 Jul 2020 12:18:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id kYyNzTsQF1cw; Mon,  6 Jul 2020 12:18:23 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id B872720C59;
 Mon,  6 Jul 2020 12:18:23 +0200 (CEST)
Date: Mon, 6 Jul 2020 12:18:23 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <661559454.20033618.1594030703652.JavaMail.zimbra@cert.pl>
In-Reply-To: <d1948f7a-22ed-c525-d7ac-35ea98929a01@citrix.com>
References: <cover.1593974333.git.michal.leszczynski@cert.pl>
 <cover.1593974333.git.michal.leszczynski@cert.pl>
 <e0ac5422825ce307470256aab1652336d5179a9a.1593974333.git.michal.leszczynski@cert.pl>
 <983829150.19744505.1593975521301.JavaMail.zimbra@cert.pl>
 <78e96f30-acf3-ad44-1488-62bf974bd83a@suse.com>
 <d1948f7a-22ed-c525-d7ac-35ea98929a01@citrix.com>
Subject: Re: [PATCH v5 11/11] tools/proctrace: add proctrace tool
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - FF78 (Linux)/8.6.0_GA_1194)
Thread-Topic: tools/proctrace: add proctrace tool
Thread-Index: J97tXiE2N0uxaGqHhI6BjCDQQ4aKqw==
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
Cc: tamas lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 luwei kang <luwei.kang@intel.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 6 lip 2020 o 11:47, Andrew Cooper andrew.cooper3@citrix.com napisa=C5=
=82(a):

> On 06/07/2020 09:33, Jan Beulich wrote:
>> On 05.07.2020 20:58, Micha=C5=82 Leszczy=C5=84ski wrote:
>>> ----- 5 lip 2020 o 20:55, Micha=C5=82 Leszczy=C5=84ski michal.leszczyns=
ki@cert.pl
>>> napisa=C5=82(a):
>>>> --- /dev/null
>>>> +++ b/tools/proctrace/proctrace.c
>>>> +#include <stdlib.h>
>>>> +#include <stdio.h>
>>>> +#include <sys/mman.h>
>>>> +#include <signal.h>
>>>> +
>>>> +#include <xenctrl.h>
>>>> +#include <xen/xen.h>
>>>> +#include <xenforeignmemory.h>
>>>> +
>>>> +#define BUF_SIZE (16384 * XC_PAGE_SIZE)
>>> I would like to discuss here, how we should retrieve the trace buffer s=
ize
>>> in runtime? Should there be a hypercall for it, or some extension to
>>> acquire_resource logic?
>> Personally I'd prefer the latter, but the question is whether one can
>> be made in a backwards compatible way.
>=20
> I already covered this in v4.
>=20
> ~Andrew


Ok, sorry, I see:

> The guest_handle_is_null(xmar.frame_list) path
> in Xen is supposed to report the size of the resource, not the size of
> Xen's local buffer, so userspace can ask "how large is this resource".
>=20
> I'll try and find some time to fix this and arrange for backports, but
> the current behaviour is nonsense, and problematic for new users.

So to make it clear: should I modify the acquire_resource logic
in such way that NULL guest handle would report the actual
size of the resource?

If I got it right, here:

https://lists.xen.org/archives/html/xen-devel/2020-07/msg00159.html

it was suggested that it should report the constant value of
UINT_MAX >> MEMOP_EXTENT_SHIFT and as far as I understood, the expectation
is that it would report how many frames might be requested at once,
not what is the size of the resource we're asking for.


Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

