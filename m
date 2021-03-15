Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8B933B4D2
	for <lists+xen-devel@lfdr.de>; Mon, 15 Mar 2021 14:43:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98039.185903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLnUw-0005kh-5x; Mon, 15 Mar 2021 13:43:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98039.185903; Mon, 15 Mar 2021 13:43:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLnUw-0005kI-2g; Mon, 15 Mar 2021 13:43:06 +0000
Received: by outflank-mailman (input) for mailman id 98039;
 Mon, 15 Mar 2021 13:43:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EzTP=IN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lLnUu-0005kB-GY
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 13:43:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b1a0909-b338-4a73-b334-6ffcdbb3d459;
 Mon, 15 Mar 2021 13:43:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 085B9AE1F;
 Mon, 15 Mar 2021 13:43:03 +0000 (UTC)
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
X-Inumbo-ID: 2b1a0909-b338-4a73-b334-6ffcdbb3d459
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615815783; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e4ABBFVGdT2XYXoO2vyay7DO/9ObTm0n//0dhYk0bSs=;
	b=ihcOiHsotN3ficjT3s3CYgD5m3XAuf+Hj2Q3i3XEdf0lEsQy++EmgmSZtgwxdLg2dTBN1S
	cZW+rFU7PMBzH76gDYui8xFKRybWMt27onGgRYCqjSu8dbACIteh49m/CqBBvgNREYVqrw
	OJTYFB2HqDcoaNInx+hGEAAoBpxiLfA=
Subject: Re: [PATCH 4.15 3/3] CHANGELOG.md: Glean some information from
 SUPPORT.md
To: George Dunlap <George.Dunlap@citrix.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 Community Manager <community.manager@xenproject.org>,
 Ian Jackson <iwj@xenproject.org>
References: <20210309145002.30359-1-iwj@xenproject.org>
 <20210309145002.30359-4-iwj@xenproject.org>
 <702645DF-2B40-42E9-95A3-11A8BF3E7E0C@citrix.com>
 <07E3E597-6E99-4591-BE73-737B59DF5E17@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8a53528d-73c1-bb78-c54d-ac25b60c29ae@suse.com>
Date: Mon, 15 Mar 2021 14:43:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <07E3E597-6E99-4591-BE73-737B59DF5E17@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.03.2021 14:40, George Dunlap wrote:
>> On Mar 15, 2021, at 1:26 PM, George Dunlap <George.Dunlap@citrix.com> wrote:
>>> On Mar 9, 2021, at 2:50 PM, Ian Jackson <iwj@xenproject.org> wrote:
>>>
>>> Signed-off-by: Ian Jackson <iwj@xenproject.org>
>>> ---
>>> CHANGELOG.md | 10 ++++++++++
>>> 1 file changed, 10 insertions(+)
>>>
>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>> index 4ecd157a35..ccdbb82c2e 100644
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -6,6 +6,16 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>
>>> ## [Unreleased](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog)
>>>
>>> +## Added / support upgraded
>>> + - Linux device model stubdomains (Tech Preview)
>>> + - Xen PV display protocol "backend allocation" mode (Experimental)
>>> + - ARM IOREQ servers (device emulation etc.) (Tech Preview)
>>> + - Renesas IPMMU-VMSA (Supported, not security supported; was Tech Preview)
>>> + - ARM SMMUv3 (Tech Preview)
>>
>> Other general things I’m seeing in the tree (may need both SUPPORT.md and changelog updates):
>>
>> * Support for zstd-compressed dom0 kernels
>> * vmtrace support
>> * named PCI devices in xl / libxl
>> * gnttab stupport for NetBSD
>> * viridian: Better virtualized IPI support, cpu hotplug, removal of 64-vcpu limit
>> * x86_emulate support for AVX-VNNI
>> * Expanded test-cases for x86_emulate
>> * HVM-specific MM code (shadow, p2m) code factored out into a separate file
>> * hypfs: Added cpupool directories and controls
> 
> More things:
> 
> * Something about MSRs?

I guess that's rather something which needs mentioning in release notes.

Jan

