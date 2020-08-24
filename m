Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F5624FB3C
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 12:22:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kA9bU-0000f8-8n; Mon, 24 Aug 2020 10:21:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/Qh=CC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kA9bT-0000f3-1P
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 10:21:27 +0000
X-Inumbo-ID: 116a266b-2789-4ed0-8f11-196eba9b12d5
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 116a266b-2789-4ed0-8f11-196eba9b12d5;
 Mon, 24 Aug 2020 10:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598264485;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ULpHYD2kxPvx+j5GH9L5lyyx6tZY7W94AdgQGKMsvx0=;
 b=hpt4/r/XQnHOyV3ZTCwKLGljRkgxsZf4bl/mVDU27O/h58vtHq3Fwo+V
 5FJQlvFiEiHcNaUj1JQKxTHE8brDmXY61eMkqDdL8kTxCyvoxlA8DDNzX
 O9/+2jrHIfwATJC+oJ1F2pGQ4Bnn5F+TX6j6YNRXILTWTIXofbU+Q1eVC M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: FCTQkWibIUfpKJjLnT4eEDR+4BeTd8TLTccIPK1IR0Z4vm0Kjs+NcWybjBgzSvdyi77nS2O8xc
 nbYZ7av2CeD4+eG9xn0X/nJPbPaaGdTopTkwRKsFLyP24QTcykDpGAsoVyOqamo8ceRXBkK8ec
 Dcqs3wJLnK5FBcaEK+e+P9FhIX71SiJEQNDhjlBpPDj4VrHQOiVoRdbweF4nLvT1rkDobyc/r5
 l+jADDk7gfVsrhnCEedueh+sklE28Jj/tXi3M/HAo6k7miB5wJMBZCKNeGSydcwefyKKdSjP97
 7XI=
X-SBRS: 2.7
X-MesageID: 25472750
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,348,1592884800"; d="scan'208";a="25472750"
Subject: Re: [linux-linus test] 152672: regressions - FAIL
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Jan Beulich
 <jbeulich@suse.com>
CC: osstest service owner <osstest-admin@xenproject.org>,
 <xen-devel@lists.xenproject.org>
References: <osstest-152672-mainreport@xen.org>
 <93d94ca3-1a87-a11a-daef-11ec183d9a2f@suse.com>
 <d8fb302b-8dae-a0fe-7617-dc9d3b0ec6fa@suse.com>
 <0061138a-749f-4702-2dbc-084690062976@suse.com>
 <28c918a3-7290-b3c3-4e10-009e5ea48aa0@suse.com>
 <7b8fd84b-a0bb-9976-ff57-3e104b57ffcc@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ae261da3-162b-12e6-60c9-a5b9fdf30d6d@citrix.com>
Date: Mon, 24 Aug 2020 11:21:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7b8fd84b-a0bb-9976-ff57-3e104b57ffcc@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24/08/2020 09:00, Jürgen Groß wrote:
> On 24.08.20 09:51, Jan Beulich wrote:
>> On 24.08.2020 09:23, Jürgen Groß wrote:
>>> On 24.08.20 08:44, Jan Beulich wrote:
>>>> On 23.08.2020 07:52, Jürgen Groß wrote:
>>>>> On 23.08.20 07:24, osstest service owner wrote:
>>>>>> flight 152672 linux-linus real [real]
>>>>>> http://logs.test-lab.xenproject.org/osstest/logs/152672/
>>>>>>
>>>>>> Regressions :-(
>>>>>
>>>>> With 32-bit pv support now removed from the kernel the associated
>>>>> tests
>>>>> should be removed for the upstream kernel, too.
>>>>
>>>> Not exactly sure how things are organized, but isn't the 2nd
>>>> <arch> in the test identifier currently specifying "Dom0
>>>> bitness" as a whole? If so, shouldn't testing a 32-bit tool
>>>> stack build continue to be done (under this same name perhaps),
>>>> just with a 64-bit kernel now? In which case the next question
>>>
>>> Only the linux-linus tests are affected right now. "Old" kernels can
>>> still be used for 32-bit tests. And PVH ones, of course.
>>>
>>>> is whether the 64-bit kernel is actually fully ready to be used
>>>> this way. I'm afraid it isn't, as there's still no privcmd
>>>> compat ioctl handling afaict, which I would say should have
>>>> been a prereq for removing PV support from 32-bit kernels.
>>>
>>> No, I don't think so.
>>>
>>> 32-bit pv linux kernels are missing Meltdown mitigation and using a
>>> 32-bit toolstack on a 64-bit kernel is no feature I'd like to
>>> encourage.
>>
>> Where else do you propose to test the 32-bit tool stack then?
>
> Right now stable kernels, later PVH only.
>
>> Even if right now only linux-linus is really affected, sooner
>> or later the stable Linux tree will also be switched to one
>> which doesn't have 32-bit PV support anymore.
>
> Yes.
>
>> I also have trouble seeing why it should be use to dictate what
>> bitness a user space people are running. Even more so that we've
>
> We are not talking about some random user programs, but the tools
> we are providing and which are running in dom0 only.
>
> And I don't think running a 32-bit toolstack on a 64-bit kernel is
> supported right now (in case it is, then we don't need to worry as
> it should continue to work). I don't think we should start supporting
> that just for being able to test it.

32bit toolstack on a 64bit kernel doesn't remotely work, due to pointers
embedded in structures which privcmd passes through unmodified.

It will actually start working again after the tools ABI stability work,
because this is just one of the many ABI mistakes which will be corrected.


That said, 32bit toolstacks are not a useful or sensible thing these
days.  I strongly suspect it gets 0 use outside of OSSTest.

~Andrew

