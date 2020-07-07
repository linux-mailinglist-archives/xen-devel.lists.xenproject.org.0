Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A4E216B4C
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 13:19:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jslbs-00082r-I3; Tue, 07 Jul 2020 11:18:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yzy/=AS=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jslbr-00082m-Kq
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 11:17:59 +0000
X-Inumbo-ID: 82e0634e-c043-11ea-bb8b-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82e0634e-c043-11ea-bb8b-bc764e2007e4;
 Tue, 07 Jul 2020 11:17:58 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 6C4ADA2322;
 Tue,  7 Jul 2020 13:17:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 22AB6A2319;
 Tue,  7 Jul 2020 13:17:56 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Xn2Whme0m547; Tue,  7 Jul 2020 13:17:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 8624AA231D;
 Tue,  7 Jul 2020 13:17:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Wm18HX-qFkK6; Tue,  7 Jul 2020 13:17:55 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 58282A2319;
 Tue,  7 Jul 2020 13:17:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 3D75020C25;
 Tue,  7 Jul 2020 13:17:25 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Maul6dzMYoBj; Tue,  7 Jul 2020 13:17:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 8F3E921C93;
 Tue,  7 Jul 2020 13:17:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 1MsecBsfTsD1; Tue,  7 Jul 2020 13:17:19 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 6AC9A21B5D;
 Tue,  7 Jul 2020 13:17:19 +0200 (CEST)
Date: Tue, 7 Jul 2020 13:17:19 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Julien Grall <julien@xen.org>
Message-ID: <1580655090.20712847.1594120639229.JavaMail.zimbra@cert.pl>
In-Reply-To: <ab992813-4584-f8e0-b90a-7a587c396bae@xen.org>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <b5335c2e-da13-28de-002b-e93dd68a0a11@suse.com>
 <20200703101120.GZ735@Air-de-Roger>
 <51ecaf40-8fb5-8454-7055-5af33a47152e@xen.org>
 <d9e604e9-acb7-17df-f0d1-7552dab526c7@suse.com>
 <88892784-0ed6-2594-bef8-fd0ae46c2b17@xen.org>
 <a13451d6-d6b5-6d86-aeb0-8985db730866@suse.com>
 <ab992813-4584-f8e0-b90a-7a587c396bae@xen.org>
Subject: Re: [PATCH v4 03/10] tools/libxl: add vmtrace_pt_size parameter
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - FF78 (Linux)/8.6.0_GA_1194)
Thread-Topic: tools/libxl: add vmtrace_pt_size parameter
Thread-Index: 9asBT9S/k/EEKcYiYjEmMl9lAxGMew==
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 tamas lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei kang <luwei.kang@intel.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 7 lip 2020 o 11:16, Julien Grall julien@xen.org napisa=C5=82(a):

> On 07/07/2020 10:10, Jan Beulich wrote:
>> On 07.07.2020 10:44, Julien Grall wrote:
>>> Hi,
>>>
>>> On 06/07/2020 09:46, Jan Beulich wrote:
>>>> On 04.07.2020 19:23, Julien Grall wrote:
>>>>> Hi,
>>>>>
>>>>> On 03/07/2020 11:11, Roger Pau Monn=C3=A9 wrote:
>>>>>> On Fri, Jul 03, 2020 at 11:56:38AM +0200, Jan Beulich wrote:
>>>>>>> On 03.07.2020 11:44, Roger Pau Monn=C3=A9 wrote:
>>>>>>>> On Thu, Jul 02, 2020 at 06:23:28PM +0200, Micha=C5=82 Leszczy=C5=
=84ski wrote:
>>>>>>>>> In previous versions it was "size" but it was requested to change=
 it
>>>>>>>>> to "order" in order to shrink the variable size from uint64_t to
>>>>>>>>> uint8_t, because there is limited space for xen_domctl_createdoma=
in
>>>>>>>>> structure.
>>>>>>>>
>>>>>>>> It's likely I'm missing something here, but I wasn't aware
>>>>>>>> xen_domctl_createdomain had any constrains regarding it's size. It=
's
>>>>>>>> currently 48bytes which seems fairly small.
>>>>>>>
>>>>>>> Additionally I would guess a uint32_t could do here, if the value
>>>>>>> passed was "number of pages" rather than "number of bytes"?
>>>>> Looking at the rest of the code, the toolstack accepts a 64-bit value=
.
>>>>> So this would lead to truncation of the buffer if it is bigger than 2=
^44
>>>>> bytes.
>>>>>
>>>>> I agree such buffer is unlikely, yet I still think we want to harden =
the
>>>>> code whenever we can. So the solution is to either prevent check
>>>>> truncation in libxl or directly use 64-bit in the domctl.
>>>>>
>>>>> My preference is the latter.
>>>>>
>>>>>>
>>>>>> That could work, not sure if it needs to state however that those wi=
ll
>>>>>> be 4K pages, since Arm can have a different minimum page size IIRC?
>>>>>> (or that's already the assumption for all number of frames fields)
>>>>>> vmtrace_nr_frames seems fine to me.
>>>>>
>>>>> The hypercalls interface is using the same page granularity as the
>>>>> hypervisor (i.e 4KB).
>>>>>
>>>>> While we already support guest using 64KB page granularity, it is
>>>>> impossible to have a 64KB Arm hypervisor in the current state. You ar=
e
>>>>> going to either break existing guest (if you switch to 64KB page
>>>>> granularity for the hypercall ABI) or render them insecure (the mimim=
um
>>>>> mapping in the P2M would be 64KB).
>>>>>
>>>>> DOMCTLs are not stable yet, so using a number of pages is OK. However=
, I
>>>>> would strongly suggest to use a number of bytes for any xl/libxl/stab=
le
>>>>> libraries interfaces as this avoids confusion and also make more
>>>>> futureproof.
>>>>
>>>> If we can't settle on what "page size" means in the public interface
>>>> (which imo is embarrassing), then how about going with number of kb,
>>>> like other memory libxl controls do? (I guess using Mb, in line with
>>>> other config file controls, may end up being too coarse here.) This
>>>> would likely still allow for a 32-bit field to be wide enough.
>>>
>>> A 32-bit field would definitely not be able to cover a full address
>>> space. So do you mind to explain what is the upper bound you expect her=
e?
>>=20
>> Do you foresee a need for buffer sizes of 4Tb and up?
>=20
> Not I am aware of... However, I think the question was worth it given
> that "wide enough" can mean anything.
>=20
> Cheers,
>=20
> --
> Julien Grall


So would it be OK to use uint32_t everywhere and to store the trace buffer
size as number of kB? I think this is the most straightforward option.

I would also stick with the name "processor_trace_buf_size"
everywhere, both in the hypervisor, ABI and the toolstack, with the
respective comments that the size is in kB.


Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

