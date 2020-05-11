Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0290D1CDC41
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 15:58:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jY8wJ-0006jS-D1; Mon, 11 May 2020 13:57:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HsYJ=6Z=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jY8wI-0006jN-Ha
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 13:57:50 +0000
X-Inumbo-ID: 666823e0-938f-11ea-b9cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 666823e0-938f-11ea-b9cf-bc764e2007e4;
 Mon, 11 May 2020 13:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FyiP+7pmc3k8A4yk2jOn/XBu06jfl+1JFA9puXYHPgM=; b=VPqRd8hlRtLZ+QJlDk/p+hcQjN
 g3M79f5ZujKZOd1MP1HninE7iZypGQYVu6UdWGF/bvu0q+aRd6LRJPIaJ4o9wR16n2IhKaJYvyJA5
 xgeZGsNgtTTtbPdKxbY+PHHuyFIrZU+qXX8mEf4eWmGGuCVkVwVIOeJLloTiWHnkyBcA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jY8wG-0007ZU-7b; Mon, 11 May 2020 13:57:48 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jY8wG-00062C-02; Mon, 11 May 2020 13:57:48 +0000
Subject: Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the
 menuconfig directly
To: Jan Beulich <jbeulich@suse.com>
References: <20200430142548.23751-1-julien@xen.org>
 <20200430142548.23751-3-julien@xen.org>
 <3a4ec020-f626-031e-73a6-b2eee97ab9e8@suse.com>
 <123BE55A-AACB-4FE3-94E2-1559ED73DD09@citrix.com>
 <24240.3047.877655.345428@mariner.uk.xensource.com>
 <1d8eb504-51e9-b8e7-f1af-862760f0f15d@xen.org>
 <24244.16076.627203.282982@mariner.uk.xensource.com>
 <09d729ad-58a7-1f4b-c779-5fd81d7009a4@xen.org>
 <4017f7f0-744b-70ff-8fa4-b33c53a8b9e2@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ca115637-5e84-2990-65e8-e2f04ec0ddb5@xen.org>
Date: Mon, 11 May 2020 14:57:45 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <4017f7f0-744b-70ff-8fa4-b33c53a8b9e2@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 11/05/2020 14:40, Jan Beulich wrote:
> On 11.05.2020 15:30, Julien Grall wrote:
>> Hi Ian,
>>
>> Thank you for the clarification.
>>
>> On 07/05/2020 18:01, Ian Jackson wrote:
>>> Julien Grall writes ("Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the menuconfig directly"):
>>>> On 04/05/2020 13:34, Ian Jackson wrote:
>>>>> George Dunlap writes ("Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the menuconfig directly"):
>>>>>> On Apr 30, 2020, at 3:50 PM, Jan Beulich <JBeulich@suse.com> wrote:
>>>>>>> Well, if I'm not mis-remembering it was on purpose to make it more
>>>>>>> difficult for people to declare themselves "experts". FAOD I'm not
>>>>>>> meaning to imply I don't see and accept the frustration aspect you
>>>>>>> mention further up. The two need to be carefully weighed against
>>>>>>> one another.
>>>>>
>>>>> Yes, it was on purpose.  However, I had my doubts at the time and
>>>>> I think experience has shown that this was a mistake.
>>>>>
>>>>>> I don’t think we need to make it difficult for people to declare
>>>>>> themselves experts, particularly as “all” it means at the moment is,
>>>>>> “Can build something which is not security supported”.  People who
>>>>>> are building their own hypervisors are already pretty well advanced;
>>>>>> I think we can let them shoot themselves in the foot if they want
>>>>>> to.
>>>>>
>>>>> Precisely.
>>>>
>>>> Can I consider this as an Acked-by? :)
>>>
>>> I am happy with the principle of the change.  I haven't reviewed the
>>> details of the commit message etc.
>>>
>>> I reviewed the thread and there were two concernes raised:
>>>
>>>    * The question of principle.  I disagree with this concern
>>>      because I approve of principle of the patch.
>>>
>>>    * Some detail about the precise justificaton as written in
>>>      the commit message, regarding `clean' targets.  Apparently the
>>>      assertion may not be completely true.  I haven't seen a proposed
>>>      alternative wording.
>>
>> I have checked the latest staging, the `clean` target doesn't trash
>> .config anymore.
>>
>>>
>>> I don't feel I should ack a controversial patch with an unresolved
>>> wording issue.  Can you tell me what your proposed wording is ?
>>> To avoid blocking this change I would be happy to review your wording
>>> and see if it meets my reading of the stated objection.
>>
>> Here a suggested rewording:
>>
>> "EXPERT mode is currently used to gate any options that are in technical
>> preview or not security supported At the moment, the only way to select
>> it is to use XEN_CONFIG_EXPERT=y on the make command line.
>>
>> However, if the user forget to add the option when (re)building or when
>> using menuconfig, then .config will get rewritten. This may lead to a
>> rather frustrating experience as it is difficult to diagnostic the
>> issue.
> 
> To me this looks very similar to e.g. not suitably overriding the
> default toolchain binaries, if one has a need to build with newer
> ones than what a distro provides. According to some of my routinely
> built configs both can be done by putting suitable entries into
> ./.config (not xen/.config), removing the need to remember adding
> either to the make command line.

I have never heard of ./.config before. So what are you referring to?

But yes, there are ways to make it permanent. But that involves hacking 
Xen source. This is not a very great approach because if you need to 
bisect, then you have to remember to apply the change everytime. It also 
doesn't work if you have to build for multiple different target from the 
same source.

The compiler is another option that would be worth to move in the 
Kconfig. I have stopped counting the number of time I mixed up between 
Arm64, Arm32 and x86 compilers when building Xen...

Cheers,

-- 
Julien Grall

