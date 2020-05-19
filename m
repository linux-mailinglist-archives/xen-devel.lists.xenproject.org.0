Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 977DD1D93BB
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 11:46:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaypW-0003qO-6q; Tue, 19 May 2020 09:46:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wtzB=7B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jaypV-0003qJ-98
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 09:46:33 +0000
X-Inumbo-ID: 9ef0e3d8-99b5-11ea-b9cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ef0e3d8-99b5-11ea-b9cf-bc764e2007e4;
 Tue, 19 May 2020 09:46:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 93DC2AD9F;
 Tue, 19 May 2020 09:46:34 +0000 (UTC)
Subject: Re: [PATCH] changelog: add relevant changes during 4.14 development
 window
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200511103145.37098-1-roger.pau@citrix.com>
 <9f783539-6a36-08eb-c141-bd0f76e5acfd@suse.com>
 <20200519094357.GD54375@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <57969e66-69a0-7e67-81be-46ae686afc8d@suse.com>
Date: Tue, 19 May 2020 11:46:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200519094357.GD54375@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19.05.2020 11:43, Roger Pau Monné wrote:
> On Mon, May 11, 2020 at 03:10:07PM +0200, Jan Beulich wrote:
>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>>
>> On 11.05.2020 12:31, Roger Pau Monne wrote:
>>> Add entries for the relevant changes I've been working on during the
>>> 4.14 development time frame. Mostly performance improvements related
>>> to pvshim scalability issues when running with high number of vCPUs.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>>  CHANGELOG.md | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>> index b11e9bc4e3..554eeb6a12 100644
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -8,6 +8,12 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>  
>>>  ### Added
>>>   - This file and MAINTAINERS entry.
>>> + - Use x2APIC mode whenever available, regardless of interrupt remapping
>>> +   support.
>>> + - Performance improvements to guest assisted TLB flushes, either when using
>>> +   the Xen hypercall interface or the viridian one.
>>> + - Assorted pvshim performance and scalability improvements plus some bug
>>> +   fixes.
>>
>> Wouldn't most/all of these better go under a "### Changed" heading?
> 
> Sorry I didn't get to this on time, I see the patch has been
> committed. Would you like me to move them?

Well, not sure. Whoever committed the patch must have done so for
a reason. Personally I continue to think as expressed ...

Jan

