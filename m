Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1721EB786
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 10:39:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg2S6-0000Rl-Ja; Tue, 02 Jun 2020 08:39:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QZr+=7P=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jg2S5-0000Rg-QV
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 08:39:17 +0000
X-Inumbo-ID: 8b6e4592-a4ac-11ea-abae-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b6e4592-a4ac-11ea-abae-12813bfff9fa;
 Tue, 02 Jun 2020 08:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X/fbmrrcpG02apB1t6aeNgi9uVwvghABUyItqe4N0gs=; b=tzzWr3eGr+UO+kh87MygpfDtn4
 AmL43ta/iSH64yPyJvftFjgQZaa9ev3DMY/bJHDaHsM618A75KozBnLhKNPmbmD1hEAUy+TlndJft
 0WqxB2QEKOIMilWROnJqJI/+Opd+fjvFYXI8Wbv237kn1Kp4jWTs713b5+odr7WrkkGY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jg2S1-0006xm-6N; Tue, 02 Jun 2020 08:39:13 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jg2S0-0007rT-VR; Tue, 02 Jun 2020 08:39:13 +0000
Subject: Re: Xen XSM/FLASK policy, grub defaults, etc.
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>
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
 <6673669b-19c7-306c-8988-8156a1e49d85@xen.org>
 <6919b0e1-3b2b-4864-b0a8-162da9c1d9ec@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b5590bf7-92a1-b800-0412-9c48555b0355@xen.org>
Date: Tue, 2 Jun 2020 09:39:10 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <6919b0e1-3b2b-4864-b0a8-162da9c1d9ec@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "cjwatson@debian.org" <cjwatson@debian.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Juergen,

On 02/06/2020 09:30, Jürgen Groß wrote:
> On 02.06.20 10:26, Julien Grall wrote:
>>
>>
>> On 02/06/2020 08:21, Jan Beulich wrote:
>>> On 29.05.2020 19:24, Julien Grall wrote:
>>>> On 29/05/2020 16:11, Jan Beulich wrote:
>>>>> On 29.05.2020 17:05, Julien Grall wrote:
>>>>>> On 29/05/2020 15:47, Ian Jackson wrote:
>>>>>>> George Dunlap writes ("Re: Xen XSM/FLASK policy, grub defaults, 
>>>>>>> etc."):
>>>>>>>> Which isn’t to say we shouldn’t do it; but it might be nice to 
>>>>>>>> also have an intermediate solution that works right now, even if 
>>>>>>>> it’s not optimal.
>>>>>>>
>>>>>>> I propose the following behaviour by updste-grub:
>>>>>>>
>>>>>>>     1. Look for an ELF note, TBD.  If it's found, make XSM boot 
>>>>>>> entries.
>>>>>>>        (For now, skip this step, since the ELF note is not defined.)
>>>>>>
>>>>>> I am afraid the ELF note is a very x86 thing. On Arm, we don't 
>>>>>> have such
>>>>>> thing for the kernel/xen (actually the final binary is not even an 
>>>>>> ELF).
>>>>>
>>>>> Ouch - of course. Is there anything similar one could employ there?
>>>>
>>>> In the past, we discussed about adding support for note in the zImage
>>>> (arm32 kernel format) but I never got the chance to pursue the 
>>>> discussion.
>>>>
>>>> With Juergen's hypfs series, the hypervisor now embbed the .config. Is
>>>> it possible to extract it?
>>>
>>> How easy is it to reliably find a random blob of gzip-ed data in an
>>> otherwise unstructured (as in: no ELF sections, and hence no way to
>>> put the data of interest into a separate section for easy
>>> recognition) binary?
>>
>> As I pointed out in another reply, Linux is already doing it (see 
>> scripts/extract-ikconfig). In fact I was able to extract the .config 
>> from an Linux Arm64 Image.
>>
>> AFAICT, Linux will look up with to specific value in the kernel image 
>> which surround the gzipped .config.
>>
>> If Linux is able to do it, then we should be able to do it. I don't 
>> know whether this is 100% reliable, however we could make sure your 
>> .config is towards the end of the image. So it reduces the chance you 
>> find something different.
>>
>>> Also don't forget that the embedding of .config
>>> is an optional thing.
>>
>> I don't really see this as a blocker. Embedding the .config can be 
>> made mandatory going forward. This is not going to significantly 
>> increase the size of Xen and would help to when debugging as you could 
>> exactly know which .config was used.
> 
> If you can find an embedded .config via a special pattern you can just
> define a pattern and embed that only in case of a flask-enabled Xen.

This is a fair point. However, this would be very specific to 
flask-enabled Xen. In that case, it might be better to consider a 
zImage/Image note style on Arm.

> This would remove the need to make the config option a stable ABI.

Cheers,

-- 
Julien Grall

