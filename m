Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A088C3CBBDC
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 20:30:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157681.290398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4SZz-0002we-Rp; Fri, 16 Jul 2021 18:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157681.290398; Fri, 16 Jul 2021 18:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4SZz-0002tc-On; Fri, 16 Jul 2021 18:28:55 +0000
Received: by outflank-mailman (input) for mailman id 157681;
 Fri, 16 Jul 2021 18:28:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YMg2=MI=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1m4SZy-0002tW-Ea
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 18:28:54 +0000
Received: from mx.upb.ro (unknown [141.85.13.221])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d17edcb9-a963-436a-a980-07be32fe60ec;
 Fri, 16 Jul 2021 18:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id BC65BB5600A4;
 Fri, 16 Jul 2021 21:28:50 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 2VKC7S7Qb5Ep; Fri, 16 Jul 2021 21:28:48 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 71FBFB5600B2;
 Fri, 16 Jul 2021 21:28:48 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id BSx4MdhDdz8l; Fri, 16 Jul 2021 21:28:48 +0300 (EEST)
Received: from [192.168.1.35] (unknown [82.78.48.31])
 by mx.upb.ro (Postfix) with ESMTPSA id 8F5C6B5600A4;
 Fri, 16 Jul 2021 21:28:47 +0300 (EEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d17edcb9-a963-436a-a980-07be32fe60ec
X-Virus-Scanned: amavisd-new at upb.ro
Subject: Re: [PATCH] stubdom: foreignmemory: Fix build after 0dbb4be739c5
To: Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210713092019.7379-1-julien@xen.org>
 <0698e4b1-8fb9-919e-e9a2-1b135a808e3e@suse.com>
 <d84bb0ca-ff51-2def-3826-c0a921ec1835@citrix.com>
 <fb6cc1b7-37b4-1819-6f6f-ebf96aefe00e@xen.org>
 <756ba923-17a6-0889-cc7e-bcd43a5eb258@citrix.com>
 <3505f2da-4c41-f5ca-d775-814d038d5bad@xen.org>
 <badec201-6719-844e-2a07-6508e891ca3e@citrix.com>
 <3c819563-b354-5527-050d-f698324d6021@xen.org>
 <c299355b-c031-3efd-ef97-671bd102809b@cs.pub.ro>
 <65d35862-304c-7fe3-82de-3ff62f06529a@suse.com>
 <40c00267-60d2-c0fc-cde4-8ac4ce936f87@suse.com>
 <d7cbedf3-bb67-1eda-70e2-d15c5649c0cd@xen.org>
 <69c62b4c-b46f-9eab-8dfd-742c07423424@suse.com>
 <c0a7de56-de7b-3451-8cc5-ccb73c78ba42@xen.org>
 <ce7a20e5-3f18-11b6-d0d1-72e31362d2fb@suse.com>
 <bb9e482c-e9b6-9def-7e7e-ac2ba9b7e7f4@xen.org>
 <7fab704a-6b59-1e9b-663e-a3afdfcc319f@suse.com>
From: Costin Lupu <costin.lupu@cs.pub.ro>
Message-ID: <3a6f1fc6-a9b3-78bc-1b73-b7ad10d20405@cs.pub.ro>
Date: Fri, 16 Jul 2021 21:28:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7fab704a-6b59-1e9b-663e-a3afdfcc319f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/13/21 6:20 PM, Juergen Gross wrote:
> On 13.07.21 17:15, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 13/07/2021 16:09, Juergen Gross wrote:
>>> On 13.07.21 16:38, Julien Grall wrote:
>>>> Hi Juergen,
>>>>
>>>> On 13/07/2021 15:23, Juergen Gross wrote:
>>>>> On 13.07.21 16:19, Julien Grall wrote:
>>>>>> Hi Jan,
>>>>>>
>>>>>> On 13/07/2021 15:14, Jan Beulich wrote:
>>>>>>>> And I don't think it should be named XC_PAGE_*, but rather
>>>>>>>> XEN_PAGE_*.
>>>>>>>
>>>>>>> Even that doesn't seem right to me, at least in principle. There
>>>>>>> shouldn't
>>>>>>> be a build time setting when it may vary at runtime. IOW on Arm I
>>>>>>> think a
>>>>>>> runtime query to the hypervisor would be needed instead.
>>>>>>
>>>>>> Yes, we want to be able to use the same userspace/OS without
>>>>>> rebuilding to a specific hypervisor page size.
>>>>>
>>>>> This define is used for accessing data of other domains. See the
>>>>> define
>>>>> for XEN_PAGE_SIZE in xen/include/public/io/ring.h
>>>>>
>>>>> So it should be a constant (minimal) page size for all hypervisors =
and
>>>>> guests of an architecture.
>>>>
>>>> Do you mean the maximum rather than minimal? If you use the minimal
>>>> (4KB), then you would not be able to map the page in the stage-2 if
>>>> the hypervisor is using 64KB.
>>>
>>> But this would mean that the current solution to use XC_PAGE_SIZE is
>>> wrong, as this is 4k.
>>
>> The existing ABI is implicitely based on using the hypervisor page
>> granularity (currently 4KB).
>>
>> There is really no way we can support existing guest on 64KB
>> hypervisor. But if we were going to break them, then we should
>> consider to do one of the following option:
>> =C2=A0=C2=A0=C2=A0 1) use 64KB page granularity for ABI
>> =C2=A0=C2=A0=C2=A0 2) query the hypervisor page granularity at runtime
>>
>> The ideal is 2) because it is more scalable for the future. We also
>> need to consider to extend the PV protocol so the backend and frontend
>> can agree on the page size.
>=20
> I absolutely agree, but my suggestion was to help finding a proper way
> to cleanup the current interface mess. And this should be done the way
> I suggested IMO.
>=20
> A later interface extension for future guests can still be done on top
> of that.

Alright, let's have a little recap to see if I got it right and to agree
on the next steps. There are 2 proposed solutions, let's say a static
one and a dynamic one.

1) Static solution (proposed by Juergen)
- We define XEN_PAGE_* values in a xen/include/public/arch-*/*.h header.
- Q: Should we define a new header for that? page.h or page_size.h are
ok as new filenames?

Pros:
- We fix the interfaces mess and we can get rid of xenctrl lib
dependency for some of the libs that need only the XEN_PAGE_* definitions=
.
- It's faster to implement, with fewer changes.

Cons:
- Well, it's static, it doesn't allow the hypervisor to provide
different values for different guests.


2) Dynamic solution (proposed by Jan and Julien)
We get the value(s) by calling a hypcall, probably as a query related to
some guest domain.

Pros:
- It's dynamic and scalable. We would support different values for
different guests.

Cons:
- More difficult to implement. It changes the paradigm in the toolstack
libs, every occurrence of XC_PAGE_* would have to be amended. Moreover,
we might want to make the hypcall once and save the value for later
(probably several toolstack structures should be extended for that)


I searched for the occurrences of XC_PAGE_* in the toolstack libs and
it's a *lot* of them. IMHO I think we should pick the static solution
for now, considering that it would be faster to implement. Please let me
know if this is OK or not. Any comments are appreciated.

Cheers,
Costin

