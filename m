Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D5D1EB756
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 10:28:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg2GL-0007om-AZ; Tue, 02 Jun 2020 08:27:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QZr+=7P=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jg2GJ-0007oe-78
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 08:27:07 +0000
X-Inumbo-ID: d47784b2-a4aa-11ea-abae-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d47784b2-a4aa-11ea-abae-12813bfff9fa;
 Tue, 02 Jun 2020 08:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uAPnBN0B4iiAtoT1qh9vzb5X2lKrkrGg9r+FZnrxvXc=; b=jvN6CTfgVziaINzNNtIcusZh+D
 qDsIAnNFkFNEtVXW8SIdykF+XRBtevf3/lQ+oWVZ1We5AVoiSkMVZY8WwWcyfx4HaGh6nYjkRSruY
 RIDIc8y7PDYvZ/mMLYQEKJg10s0jbmvFV+5LY2y0JYHrYBkvX40skXOY+n9rlJFJel/U=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jg2G8-0006is-TD; Tue, 02 Jun 2020 08:26:56 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jg2G8-0006sF-MA; Tue, 02 Jun 2020 08:26:56 +0000
Subject: Re: Xen XSM/FLASK policy, grub defaults, etc.
To: Jan Beulich <jbeulich@suse.com>
References: <24270.35349.838484.116865@mariner.uk.xensource.com>
 <0D83AAA6-A205-4256-8A38-CC8122AC063D@citrix.com>
 <24272.59646.746545.343358@mariner.uk.xensource.com>
 <4a8e7cf2-8f63-d4d2-e051-9484a5b8c8ed@suse.com>
 <96F32637-E410-4EC8-937A-CFC8BE724352@citrix.com>
 <24273.8332.662607.125522@mariner.uk.xensource.com>
 <7eaa7541-f698-b29b-b4b3-1f40fc37c5d7@xen.org>
 <63838ce9-8dbf-aacf-521d-97540758a945@suse.com>
 <429e81a2-80d5-0d50-6352-6471cd4698a8@xen.org>
 <1a08fcca-e890-a735-682d-635e9d11f2a4@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6673669b-19c7-306c-8988-8156a1e49d85@xen.org>
Date: Tue, 2 Jun 2020 09:26:54 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <1a08fcca-e890-a735-682d-635e9d11f2a4@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "cjwatson@debian.org" <cjwatson@debian.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 02/06/2020 08:21, Jan Beulich wrote:
> On 29.05.2020 19:24, Julien Grall wrote:
>> On 29/05/2020 16:11, Jan Beulich wrote:
>>> On 29.05.2020 17:05, Julien Grall wrote:
>>>> On 29/05/2020 15:47, Ian Jackson wrote:
>>>>> George Dunlap writes ("Re: Xen XSM/FLASK policy, grub defaults, etc."):
>>>>>> Which isn’t to say we shouldn’t do it; but it might be nice to also have an intermediate solution that works right now, even if it’s not optimal.
>>>>>
>>>>> I propose the following behaviour by updste-grub:
>>>>>
>>>>>     1. Look for an ELF note, TBD.  If it's found, make XSM boot entries.
>>>>>        (For now, skip this step, since the ELF note is not defined.)
>>>>
>>>> I am afraid the ELF note is a very x86 thing. On Arm, we don't have such
>>>> thing for the kernel/xen (actually the final binary is not even an ELF).
>>>
>>> Ouch - of course. Is there anything similar one could employ there?
>>
>> In the past, we discussed about adding support for note in the zImage
>> (arm32 kernel format) but I never got the chance to pursue the discussion.
>>
>> With Juergen's hypfs series, the hypervisor now embbed the .config. Is
>> it possible to extract it?
> 
> How easy is it to reliably find a random blob of gzip-ed data in an
> otherwise unstructured (as in: no ELF sections, and hence no way to
> put the data of interest into a separate section for easy
> recognition) binary?

As I pointed out in another reply, Linux is already doing it (see 
scripts/extract-ikconfig). In fact I was able to extract the .config 
from an Linux Arm64 Image.

AFAICT, Linux will look up with to specific value in the kernel image 
which surround the gzipped .config.

If Linux is able to do it, then we should be able to do it. I don't know 
whether this is 100% reliable, however we could make sure your .config 
is towards the end of the image. So it reduces the chance you find 
something different.

> Also don't forget that the embedding of .config
> is an optional thing.

I don't really see this as a blocker. Embedding the .config can be made 
mandatory going forward. This is not going to significantly increase the 
size of Xen and would help to when debugging as you could exactly know 
which .config was used.

Cheers,

-- 
Julien Grall

