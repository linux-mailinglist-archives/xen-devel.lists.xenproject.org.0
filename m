Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D733DB5C4
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jul 2021 11:19:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162406.297843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9Of6-0005gG-4P; Fri, 30 Jul 2021 09:18:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162406.297843; Fri, 30 Jul 2021 09:18:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9Of6-0005ev-1T; Fri, 30 Jul 2021 09:18:36 +0000
Received: by outflank-mailman (input) for mailman id 162406;
 Fri, 30 Jul 2021 09:18:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9J0s=MW=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1m9Of5-0005ep-1V
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 09:18:35 +0000
Received: from mx.upb.ro (unknown [141.85.13.220])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b05782d7-24df-4f68-ad71-f13ba9cbc785;
 Fri, 30 Jul 2021 09:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 34426B560069;
 Fri, 30 Jul 2021 12:18:31 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id fX2wbm4miKFb; Fri, 30 Jul 2021 12:18:28 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id B3D86B56007B;
 Fri, 30 Jul 2021 12:18:28 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ySPbAUy1TZD4; Fri, 30 Jul 2021 12:18:28 +0300 (EEST)
Received: from [192.168.1.35] (unknown [86.121.88.42])
 by mx.upb.ro (Postfix) with ESMTPSA id 81F4CB56006D;
 Fri, 30 Jul 2021 12:18:27 +0300 (EEST)
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
X-Inumbo-ID: b05782d7-24df-4f68-ad71-f13ba9cbc785
X-Virus-Scanned: amavisd-new at upb.ro
Subject: Re: [PATCH] stubdom: foreignmemory: Fix build after 0dbb4be739c5
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
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
 <3a6f1fc6-a9b3-78bc-1b73-b7ad10d20405@cs.pub.ro>
 <627d776e-575e-c32a-f3f6-87ace982d6da@citrix.com>
From: Costin Lupu <costin.lupu@cs.pub.ro>
Message-ID: <600e843a-741b-477c-9705-483f5e6c252a@cs.pub.ro>
Date: Fri, 30 Jul 2021 12:18:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <627d776e-575e-c32a-f3f6-87ace982d6da@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/27/21 4:36 PM, Andrew Cooper wrote:
> On 16/07/2021 19:28, Costin Lupu wrote:
>> On 7/13/21 6:20 PM, Juergen Gross wrote:
>>> On 13.07.21 17:15, Julien Grall wrote:
>>>> Hi Juergen,
>>>>
>>>> On 13/07/2021 16:09, Juergen Gross wrote:
>>>>> On 13.07.21 16:38, Julien Grall wrote:
>>>>>> Hi Juergen,
>>>>>>
>>>>>> On 13/07/2021 15:23, Juergen Gross wrote:
>>>>>>> On 13.07.21 16:19, Julien Grall wrote:
>>>>>>>> Hi Jan,
>>>>>>>>
>>>>>>>> On 13/07/2021 15:14, Jan Beulich wrote:
>>>>>>>>>> And I don't think it should be named XC_PAGE_*, but rather
>>>>>>>>>> XEN_PAGE_*.
>>>>>>>>> Even that doesn't seem right to me, at least in principle. Ther=
e
>>>>>>>>> shouldn't
>>>>>>>>> be a build time setting when it may vary at runtime. IOW on Arm=
 I
>>>>>>>>> think a
>>>>>>>>> runtime query to the hypervisor would be needed instead.
>>>>>>>> Yes, we want to be able to use the same userspace/OS without
>>>>>>>> rebuilding to a specific hypervisor page size.
>>>>>>> This define is used for accessing data of other domains. See the
>>>>>>> define
>>>>>>> for XEN_PAGE_SIZE in xen/include/public/io/ring.h
>>>>>>>
>>>>>>> So it should be a constant (minimal) page size for all hypervisor=
s and
>>>>>>> guests of an architecture.
>>>>>> Do you mean the maximum rather than minimal? If you use the minima=
l
>>>>>> (4KB), then you would not be able to map the page in the stage-2 i=
f
>>>>>> the hypervisor is using 64KB.
>>>>> But this would mean that the current solution to use XC_PAGE_SIZE i=
s
>>>>> wrong, as this is 4k.
>>>> The existing ABI is implicitely based on using the hypervisor page
>>>> granularity (currently 4KB).
>>>>
>>>> There is really no way we can support existing guest on 64KB
>>>> hypervisor. But if we were going to break them, then we should
>>>> consider to do one of the following option:
>>>> =C2=A0=C2=A0=C2=A0 1) use 64KB page granularity for ABI
>>>> =C2=A0=C2=A0=C2=A0 2) query the hypervisor page granularity at runti=
me
>>>>
>>>> The ideal is 2) because it is more scalable for the future. We also
>>>> need to consider to extend the PV protocol so the backend and fronte=
nd
>>>> can agree on the page size.
>>> I absolutely agree, but my suggestion was to help finding a proper wa=
y
>>> to cleanup the current interface mess. And this should be done the wa=
y
>>> I suggested IMO.
>>>
>>> A later interface extension for future guests can still be done on to=
p
>>> of that.
>> Alright, let's have a little recap to see if I got it right and to agr=
ee
>> on the next steps. There are 2 proposed solutions, let's say a static
>> one and a dynamic one.
>>
>> 1) Static solution (proposed by Juergen)
>> - We define XEN_PAGE_* values in a xen/include/public/arch-*/*.h heade=
r.
>> - Q: Should we define a new header for that? page.h or page_size.h are
>> ok as new filenames?
>>
>> Pros:
>> - We fix the interfaces mess and we can get rid of xenctrl lib
>> dependency for some of the libs that need only the XEN_PAGE_* definiti=
ons.
>> - It's faster to implement, with fewer changes.
>>
>> Cons:
>> - Well, it's static, it doesn't allow the hypervisor to provide
>> different values for different guests.
>>
>>
>> 2) Dynamic solution (proposed by Jan and Julien)
>> We get the value(s) by calling a hypcall, probably as a query related =
to
>> some guest domain.
>>
>> Pros:
>> - It's dynamic and scalable. We would support different values for
>> different guests.
>>
>> Cons:
>> - More difficult to implement. It changes the paradigm in the toolstac=
k
>> libs, every occurrence of XC_PAGE_* would have to be amended. Moreover=
,
>> we might want to make the hypcall once and save the value for later
>> (probably several toolstack structures should be extended for that)
>>
>>
>> I searched for the occurrences of XC_PAGE_* in the toolstack libs and
>> it's a *lot* of them. IMHO I think we should pick the static solution
>> for now, considering that it would be faster to implement. Please let =
me
>> know if this is OK or not. Any comments are appreciated.
>=20
> The immediate problem needing fixing is the stable libraries inclusion
> of unstable headers - specifically, the inclusion of <xenctrl.h>.
>=20
> Juergen's proposal moves the existing constant to a more appropriate
> location, and specifically, a location where its value is stable.
>=20
> It does not change the ABI.=C2=A0 It merely demonstrates that the exist=
ing
> ABI is broken, and thus is absolutely a step in the right direction.
>=20
> This is the approach you should take in the short term, and needs
> sorting before 4.16 ships.
>=20
>=20
> The dynamic solution, while preferable in the longterm, is far more
> complicated than even described thus far, and is not as simple as just
> having a hypercall and using that value.
>=20
> Among other things, it requires coordination with the dom0 kernel as to
> its pagetable setup, and with Xen's choice of pagetable size for dom0,
> which may not be the same as domU's.=C2=A0 It is a large quantity of wo=
rk,
> very invasive to the existing APIs/ABIs, and stands no chance at all of
> being ready for 4.16.

Thanks for clearing this, Andrew. What is the deadline for the 4.16
release? Where can I find the release calendar?

Costin

