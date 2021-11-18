Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2D5455A53
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 12:29:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227353.393209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnfb1-000314-QW; Thu, 18 Nov 2021 11:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227353.393209; Thu, 18 Nov 2021 11:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnfb1-0002yf-MI; Thu, 18 Nov 2021 11:28:51 +0000
Received: by outflank-mailman (input) for mailman id 227353;
 Thu, 18 Nov 2021 11:28:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mnfb0-0002yZ-Be
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 11:28:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mnfas-00025v-0S; Thu, 18 Nov 2021 11:28:42 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227] helo=[10.7.236.15])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mnfar-0003Qg-O2; Thu, 18 Nov 2021 11:28:41 +0000
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
	bh=yBln7b8ZuTbuxB6/HuY2RMqTGG4fOndJLS4yNcskPDM=; b=63N39sn7LR5Vs+dA3s4PO5/HOQ
	z8FBxp7kQZl3S859H4A+csZIFXtuBJywSA2Q3Rbw//ED47xkBL0jEa18BhOvQhekwfyZNp/q29oRF
	/pl0NRi1/Onrw56UzTFBibEoyASRs9baLxrxdG8BCeEORbqkiNDGlYrU2bL3FL0iXghM=;
Message-ID: <5a76d1d7-81d6-0a3e-3ab7-0ca735ee522f@xen.org>
Date: Thu, 18 Nov 2021 11:28:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH for-4.16 2/2] CHANGELOG: add missing entries for work
 during the 4.16 release cycle
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
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
 Rahul Singh <Rahul.Singh@arm.com>, Ross Lagerwall
 <ross.lagerwall@citrix.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Shriram Rajagopalan <rshriram@cs.ubc.ca>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Tim Deegan <tim@xen.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Wei Liu <wl@xen.org>,
 Community Manager <community.manager@xenproject.org>
References: <20211117095338.14947-1-roger.pau@citrix.com>
 <20211117095338.14947-3-roger.pau@citrix.com>
 <17956608-4AF6-4F97-99EC-E74E088F792B@arm.com>
 <YZYVzkaQTQ6+Rn72@Air-de-Roger>
 <31E84B55-DF77-40B5-A61E-45DC79AEC7F6@arm.com>
 <YZYs6ewhD7yBetFh@Air-de-Roger>
 <02E4A3D7-6FD7-4B48-BA66-2D62DF94003C@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <02E4A3D7-6FD7-4B48-BA66-2D62DF94003C@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 18/11/2021 11:14, Bertrand Marquis wrote:
> Hi Roger,
> 
>> On 18 Nov 2021, at 10:37, Roger Pau Monné <roger.pau@citrix.com> wrote:
>>
>> On Thu, Nov 18, 2021 at 10:01:08AM +0000, Bertrand Marquis wrote:
>>> Hi Roger,
>>>
>>>
>>>> On 18 Nov 2021, at 08:58, Roger Pau Monné <roger.pau@citrix.com> wrote:
>>>>
>>>> On Wed, Nov 17, 2021 at 02:07:50PM +0000, Bertrand Marquis wrote:
>>>>> Hi Roger,
>>>>>
>>>>>> On 17 Nov 2021, at 09:53, Roger Pau Monne <roger.pau@citrix.com> wrote:
>>>>>>
>>>>>> Document some of the relevant changes during the 4.16 release cycle,
>>>>>> likely more entries are missing.
>>>>>>
>>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>>> ---
>>>>>> CHANGELOG.md | 11 +++++++++++
>>>>>> 1 file changed, 11 insertions(+)
>>>>>>
>>>>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>>>>> index ad1a8c2bc2..8b0bdd9cf0 100644
>>>>>> --- a/CHANGELOG.md
>>>>>> +++ b/CHANGELOG.md
>>>>>> @@ -21,6 +21,17 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>>>> - qemu-traditional based device models (both, qemu-traditional and ioemu-stubdom) will
>>>>>>   no longer be built per default. In order to be able to use those, configure needs to
>>>>>>   be called with "--enable-qemu-traditional" as parameter.
>>>>>> + - Fixes for credit2 scheduler stability in corner case conditions.
>>>>>> + - Ongoing improvements in the hypervisor build system.
>>>>>> + - vtpmmgr miscellaneous fixes in preparation for TPM 2.0 support.
>>>>>> + - 32bit PV guests only supported in shim mode.
>>>>>> + - Improved PVH dom0 debug key handling.
>>>>>> + - Fix booting on some Intel systems without a PIT (i8254).
>>>>>
>>>>> Missing:
>>>>> - cpu ID sanitization on arm64
>>>>> - fix 32/64bit vreg emulation on arm64
>>>>
>>>> Can I get a bit more information about those items? Just a pointer to
>>>> the commit messages would be helpful so that I can try to write a more
>>>> comprehensive entry (or maybe it's just me not knowing anything about
>>>> Arm that fails to understand it).
>>>
>>> I agree, the text is not quite clear, I will try to come with a better one.
>>> In the meantime here is are links to the series:
>>> https://patchwork.kernel.org/project/xen-devel/list/?series=535805&state=*
>>> https://patchwork.kernel.org/project/xen-devel/list/?series=477151&archive=both
>>
>> Thanks. I've added:
>>
>> - CPU feature leveling on arm64 platform with heterogeneous cores.
> Yes
>> - Handle register accesses as 32/64bit on Arm depending on the processor
>>    bitness.
> 
> I would say:
> - Fix coprocessor register accesses on Arm to use the proper 32/64bit access size.

I would suggest s/coprocessor/system/ because the changes was targeting 
arm64.

Cheers,

-- 
Julien Grall

