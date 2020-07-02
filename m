Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA65212DDD
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 22:30:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jr5pW-0007sU-9J; Thu, 02 Jul 2020 20:29:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c/Sk=AN=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jr5pV-0007sP-1I
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 20:29:09 +0000
X-Inumbo-ID: ad2751c0-bca2-11ea-88b5-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad2751c0-bca2-11ea-88b5-12813bfff9fa;
 Thu, 02 Jul 2020 20:29:07 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id E6FD1A37DD;
 Thu,  2 Jul 2020 22:29:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id D13B2A3664;
 Thu,  2 Jul 2020 22:29:04 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id WcG16VrIrpmI; Thu,  2 Jul 2020 22:29:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 396F2A37DD;
 Thu,  2 Jul 2020 22:29:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ZXkfElhBcH6q; Thu,  2 Jul 2020 22:29:04 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 08F30A3664;
 Thu,  2 Jul 2020 22:29:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id E297E22E3F;
 Thu,  2 Jul 2020 22:28:33 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id iVaWd6boHJqx; Thu,  2 Jul 2020 22:28:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 5DA6422E40;
 Thu,  2 Jul 2020 22:28:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id mx456RbkkZ2G; Thu,  2 Jul 2020 22:28:28 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 3236022E3F;
 Thu,  2 Jul 2020 22:28:28 +0200 (CEST)
Date: Thu, 2 Jul 2020 22:28:28 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Julien Grall <julien@xen.org>
Message-ID: <187614050.18497785.1593721708078.JavaMail.zimbra@cert.pl>
In-Reply-To: <dadeeedd-a9e1-d5f4-4754-8da3f065fd44@xen.org>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <3fa0c3e7-9243-b1bb-d6ad-a3bd21437782@xen.org>
 <0e02a9b5-ba7a-43a2-3369-a4410f216ddb@suse.com>
 <9a3f4d58-e5ad-c7a1-6c5f-42aa92101ca1@xen.org>
 <d0165fc3-fb05-2e49-eff3-e45a674b00e1@suse.com>
 <7f915146-6566-e5a7-14d2-cb2319838562@xen.org>
 <7ac383c2-0264-cc75-a85b-13c1fdfb0bd6@suse.com>
 <dadeeedd-a9e1-d5f4-4754-8da3f065fd44@xen.org>
Subject: Re: [PATCH v4 02/10] x86/vmx: add IPT cpu feature
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: add IPT cpu feature
Thread-Index: ayJ3lBVi1JgJBZhMzn8HOkHk4Vrvhw==
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
 Stefano Stabellini <sstabellini@kernel.org>,
 tamas lengyel <tamas.lengyel@intel.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 luwei kang <luwei.kang@intel.com>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 2 lip 2020 o 16:31, Julien Grall julien@xen.org napisa=C5=82(a):

> On 02/07/2020 15:17, Jan Beulich wrote:
>> On 02.07.2020 16:14, Julien Grall wrote:
>>> On 02/07/2020 14:30, Jan Beulich wrote:
>>>> On 02.07.2020 11:57, Julien Grall wrote:
>>>>> On 02/07/2020 10:18, Jan Beulich wrote:
>>>>>> On 02.07.2020 10:54, Julien Grall wrote:
>>>>>>> On 02/07/2020 09:50, Jan Beulich wrote:
>>>>>>>> On 02.07.2020 10:42, Julien Grall wrote:
>>>>>>>>> On 02/07/2020 09:29, Jan Beulich wrote:
>>>>> Another way to do it, would be the toolstack to do the mapping. At wh=
ich
>>>>> point, you still need an hypercall to do the mapping (probably the
>>>>> hypercall acquire).
>>>>
>>>> There may not be any mapping to do in such a contrived, fixed-range
>>>> environment. This scenario was specifically to demonstrate that the
>>>> way the mapping gets done may be arch-specific (here: a no-op)
>>>> despite the allocation not being so.
>>> You are arguing on extreme cases which I don't think is really helpful
>>> here. Yes if you want to map at a fixed address in a guest you may not
>>> need the acquire hypercall. But in most of the other cases (see has for
>>> the tools) you will need it.
>>>
>>> So what's the problem with requesting to have the acquire hypercall
>>> implemented in common code?
>>=20
>> Didn't we start out by you asking that there be as little common code
>> as possible for the time being?
>=20
> Well as I said I am not in favor of having the allocation in common
> code, but if you want to keep it then you also want to implement
> map/unmap in the common code ([1], [2]).
>=20
>> I have no issue with putting the
>> acquire implementation there ...
> This was definitely not clear given how you argued with extreme cases...
>=20
> Cheers,
>=20
> [1] <9a3f4d58-e5ad-c7a1-6c5f-42aa92101ca1@xen.org>
> [2] <cf41855b-9e5e-13f2-9ab0-04b98f8b3cdd@xen.org>
>=20
> --
> Julien Grall


Guys,

could you express your final decision on this topic?

While I understand the discussion and the arguments you've raised,
I would like to know what particular elements should be moved where.

So are we going abstract way, or non-abstract-x86 only way?

Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

