Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4A71EA468
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 15:11:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfkD6-0005WQ-Tv; Mon, 01 Jun 2020 13:10:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kFUs=7O=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jfkD5-0005WE-OR
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 13:10:35 +0000
X-Inumbo-ID: 476c2c0e-a409-11ea-ab1a-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 476c2c0e-a409-11ea-ab1a-12813bfff9fa;
 Mon, 01 Jun 2020 13:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z+Z1Z70sMwfAK/8fETUXVUy+iRGNrRmTFJBAppBhpro=; b=gFMkPM6UvGLNaAupnL6SXD5Kt5
 kop2NQkEG7ByJhsksqLN50E9sWPnnTZma2mQ1D6W5j/5kbJ8JH7aCYHjk3IPIEwgYniNWjjujxO2J
 3HajibZI5P+nR686pXao32RPn0Ay1Pzd6+qqGngGADqLj1LQ53Vqy1rDVyHVMri+egrE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jfkD2-0001gw-Ft; Mon, 01 Jun 2020 13:10:32 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jfkD2-0002T6-8X; Mon, 01 Jun 2020 13:10:32 +0000
Subject: Re: Xen XSM/FLASK policy, grub defaults, etc.
To: George Dunlap <George.Dunlap@citrix.com>
References: <24270.35349.838484.116865@mariner.uk.xensource.com>
 <0D83AAA6-A205-4256-8A38-CC8122AC063D@citrix.com>
 <24272.59646.746545.343358@mariner.uk.xensource.com>
 <4a8e7cf2-8f63-d4d2-e051-9484a5b8c8ed@suse.com>
 <96F32637-E410-4EC8-937A-CFC8BE724352@citrix.com>
 <24273.8332.662607.125522@mariner.uk.xensource.com>
 <7eaa7541-f698-b29b-b4b3-1f40fc37c5d7@xen.org>
 <63838ce9-8dbf-aacf-521d-97540758a945@suse.com>
 <429e81a2-80d5-0d50-6352-6471cd4698a8@xen.org>
 <EEFCB4D0-9C2F-4527-8445-0FA78DE7285E@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b06a89b2-3fa1-86d7-ba82-d4aac1236cf2@xen.org>
Date: Mon, 1 Jun 2020 14:10:29 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <EEFCB4D0-9C2F-4527-8445-0FA78DE7285E@citrix.com>
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi George,

On 01/06/2020 13:57, George Dunlap wrote:
> 
> 
>> On May 29, 2020, at 6:24 PM, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Jan,
>>
>> On 29/05/2020 16:11, Jan Beulich wrote:
>>> On 29.05.2020 17:05, Julien Grall wrote:
>>>> On 29/05/2020 15:47, Ian Jackson wrote:
>>>>> George Dunlap writes ("Re: Xen XSM/FLASK policy, grub defaults, etc."):
>>>>>> Which isn’t to say we shouldn’t do it; but it might be nice to also have an intermediate solution that works right now, even if it’s not optimal.
>>>>>
>>>>> I propose the following behaviour by updste-grub:
>>>>>
>>>>>    1. Look for an ELF note, TBD.  If it's found, make XSM boot entries.
>>>>>       (For now, skip this step, since the ELF note is not defined.)
>>>>
>>>> I am afraid the ELF note is a very x86 thing. On Arm, we don't have such
>>>> thing for the kernel/xen (actually the final binary is not even an ELF).
>>> Ouch - of course. Is there anything similar one could employ there?
>>
>> In the past, we discussed about adding support for note in the zImage (arm32 kernel format) but I never got the chance to pursue the discussion.
>>
>> With Juergen's hypfs series, the hypervisor now embbed the .config. Is it possible to extract it?
> 
> The problem is that update-grub doesn’t want the config of the *currently running* hypervisor, but of whatever specific hypervisor there is in /boot. >
> So for instance, when someone first does “apt-get install xen”, after xen binaries are put in /boot, update-grub is called to make new entries for it.  Ideally, we want it to create FLASK grub entries, and boot them by default, if and only if *that Xen binary* has FLASK enabled and there is a policy for it.  At the time update-grub runs, Xen will not be running.

I am fully aware we want to get information of the binaries residing in 
/boot (I wouldn't have suggested zImage note otherwise). So I think you 
misundertood my question.

> 
> And if a user installs several Xen binaries, some of which have FLASK enabled and some of which don’t, we want update-grub to generate FLASK entries for the binaries that have FLASK enabled, and not for the ones which don’t.  So hypfs isn’t really a suitable solution.

I have never suggested to use hypfs. Instead, I have pointed out that 
.config is embedded in the binary thanks to hypfs. So I was asking 
whether we can extract it.

On Linux, they have a script to extract the .config from the Kernel 
Image (see scripts/extract-ikconfig). Now that the .config is part of 
the Xen binarry, I was wondering whether we could have extract it.

> 
> The options proposed have included:
> 
> 1. Making the tools not generate a FLASK policy unless FLASK is enabled in the hypervisor being built.  This is flaky because there’s no necessary connection between the two builds.
> 
> 2. Using the xen config file normally copied into /boot.  This should work now, but it’s been suggested that packagers may not want to continue putting the xen config in /boot along with xen.gz, just as they’ve stopped putting the Linux config in /boot along with vmlinuz.
> 
> 3. Mark the xen.gz binary itself somehow as having FLASK.  This could work for x86 in the future, but won’t work for current binaries; and it sounds like it won’t work for ARM either.

4. Extract the .config from the binary using a similar script to 
script/extract-ikconfig.

Cheers,

-- 
Julien Grall

