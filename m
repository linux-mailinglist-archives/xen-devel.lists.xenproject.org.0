Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD7E456E16
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 12:16:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227766.394072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo1sU-0003xU-RG; Fri, 19 Nov 2021 11:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227766.394072; Fri, 19 Nov 2021 11:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo1sU-0003uH-Nd; Fri, 19 Nov 2021 11:16:22 +0000
Received: by outflank-mailman (input) for mailman id 227766;
 Fri, 19 Nov 2021 11:16:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mo1sT-0003uB-H8
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 11:16:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mo1sK-0005tV-1W; Fri, 19 Nov 2021 11:16:12 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.20.70]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mo1sJ-00040B-PZ; Fri, 19 Nov 2021 11:16:11 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=rIuYMytVBtKcJ2FEaAYjI4zadEJzMO79nM7z4J3NZHM=; b=v21LSpglYrh8ly90alSXGCWu+1
	MjIE7kMyHF1ygaN/EluuevJOnnSku2y36m0d6GKAqfeT0oXCBGypvHX+/1SHOQs6fSXfspyiS1lM3
	s+Cmlx3qq/40OkheaRBEoy5mLgVYsxY9l5NRxzpLvPkmqSXTZKmX0PiS9qMp8igY23is=;
Message-ID: <c0347d42-1b10-5bd0-0dd0-ab7ed70ccd7e@xen.org>
Date: Fri, 19 Nov 2021 11:16:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH for-4.16 2/2] CHANGELOG: add missing entries for work
 during the 4.16 release cycle
To: Oleksandr <olekstysh@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Dario Faggioli
 <dfaggioli@suse.com>, David Scott <dave@recoil.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Juergen Gross <jgross@suse.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Nick Rosbrook <rosbrookn@ainfosec.com>, Paul Durrant <paul@xen.org>,
 Quan Xu <quan.xu0@gmail.com>, Rahul Singh <rahul.singh@arm.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Shriram Rajagopalan <rshriram@cs.ubc.ca>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Tim Deegan <tim@xen.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Wei Liu <wl@xen.org>,
 Community Manager <community.manager@xenproject.org>
References: <20211117095338.14947-1-roger.pau@citrix.com>
 <20211117095338.14947-3-roger.pau@citrix.com>
 <CAPD2p-nb7u7om7zv5-KvfZTsmGis9uGfBkvwjEXrym_+4PN-RQ@mail.gmail.com>
 <YZaOgGWfbDkIq4Lq@Air-de-Roger>
 <d4f3d50d-9875-f7bf-2c82-83f8fedb8cfc@gmail.com>
 <YZdZZsgXjZv/rh66@Air-de-Roger>
 <41554b67-552b-3e44-9e5e-f7e493ebf615@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <41554b67-552b-3e44-9e5e-f7e493ebf615@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksandr,

On 19/11/2021 09:34, Oleksandr wrote:
> 
> On 19.11.21 09:59, Roger Pau Monné wrote:
> 
> Hi Roger, all
> 
> 
>> On Thu, Nov 18, 2021 at 09:04:30PM +0200, Oleksandr wrote:
>>> On 18.11.21 19:33, Roger Pau Monné wrote:
>>>
>>> Hi Roger
>>>
>>>
>>>> On Thu, Nov 18, 2021 at 06:11:07PM +0200, Oleksandr Tyshchenko wrote:
>>>>> On Wed, Nov 17, 2021 at 11:54 AM Roger Pau Monne 
>>>>> <roger.pau@citrix.com>
>>>>> wrote:
>>>>>
>>>>> Hi Roger, all
>>>>>
>>>>> [Sorry for the possible format issues]
>>>>>
>>>>> Document some of the relevant changes during the 4.16 release cycle,
>>>>>> likely more entries are missing.
>>>>>>
>>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>>> ---
>>>>>>    CHANGELOG.md | 11 +++++++++++
>>>>>>    1 file changed, 11 insertions(+)
>>>>>>
>>>>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>>>>> index ad1a8c2bc2..8b0bdd9cf0 100644
>>>>>> --- a/CHANGELOG.md
>>>>>> +++ b/CHANGELOG.md
>>>>>> @@ -21,6 +21,17 @@ The format is based on [Keep a Changelog](
>>>>>> https://keepachangelog.com/en/1.0.0/)
>>>>>>     - qemu-traditional based device models (both, qemu-traditional 
>>>>>> and
>>>>>> ioemu-stubdom) will
>>>>>>       no longer be built per default. In order to be able to use 
>>>>>> those,
>>>>>> configure needs to
>>>>>>       be called with "--enable-qemu-traditional" as parameter.
>>>>>> + - Fixes for credit2 scheduler stability in corner case conditions.
>>>>>> + - Ongoing improvements in the hypervisor build system.
>>>>>> + - vtpmmgr miscellaneous fixes in preparation for TPM 2.0 support.
>>>>>> + - 32bit PV guests only supported in shim mode.
>>>>>> + - Improved PVH dom0 debug key handling.
>>>>>> + - Fix booting on some Intel systems without a PIT (i8254).
>>>>>>
>>>>> I would add "Various fixes for OP-TEE mediator (Arm)" here and ...
>>>>>
>>>>>
>>>>>
>>>>>> +
>>>>>> +### Added
>>>>>> + - 32bit Arm builds to the automated tests.
>>>>>> + - New x86 pagetable APIs.
>>>>>> + - Arm vPMU support.
>>>>>>
>>>>> "Extended regions support, device tree only (Arm)" here.
>>>>>
>>>>> ...
>>>>> The extended regions are ranges of unused address space exposed to 
>>>>> domains
>>>>> as
>>>>> "safe to use" for special memory mappings.
>>>> I've worded this as:
>>>>
>>>> "Report unpopulated memory regions safe to use for foreign mappings,
>>>> Arm and device tree only."
>>>>
>>>> As "extended regions" was IMO too vague. Let me know if that's OK.
>>> I think, it is OK. Nit: maybe replace "foreign" with "foreign/grant"? I
>>> would be OK either way.
>> Maybe, I would consider grants as foreign mappings also, ie: the
>> memory is foreign to the domain, but I can see this being confusing as
>> we have a specific kind of mappings that are named foreign.
>>
>> Does replacing foreign with external seem better?
> 
> Fine with me, thank you.
> 
> 
> BTW, I noticed that "Support of generic DT IOMMU bindings for SMMU V2 
> (Arm)" is not mentioned. Looks like the support has reached upstream 
> during the 4.16 release cycle, so worth adding here.

You are right.

> 
> @Julien, @Stefano?

I agree we should mention it.

Cheers,

-- 
Julien Grall

