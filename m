Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 044371CDF08
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 17:30:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYANN-00077J-Pi; Mon, 11 May 2020 15:29:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HsYJ=6Z=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jYANM-00077E-2a
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 15:29:52 +0000
X-Inumbo-ID: 4193bcac-939c-11ea-b07b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4193bcac-939c-11ea-b07b-bc764e2007e4;
 Mon, 11 May 2020 15:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IAa6CEQzUpKX9xK0f/kTrCmsLxzMGB9ZkNttFZ3ddU8=; b=SC66WyQbC5N5hzdTGCHEYVBI+X
 KcQDok6+QYJDVSlTAYAFxfkx7CsRJKQ78hjHZ2ikrpcQqyCEv7+s5wKPW7TtoX5Tbr1jHYx/s6mPH
 r6tobP7eyVEIZ0Pc+XVr5FN53J4CAQoMzSnJFlcpBW54JTyUqlVlAskCQOWmNs1ERYKI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jYANJ-0001AX-Uy; Mon, 11 May 2020 15:29:49 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jYANJ-0002pd-J9; Mon, 11 May 2020 15:29:49 +0000
Subject: Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the
 menuconfig directly
To: George Dunlap <George.Dunlap@citrix.com>
References: <20200430142548.23751-1-julien@xen.org>
 <20200430142548.23751-3-julien@xen.org>
 <3a4ec020-f626-031e-73a6-b2eee97ab9e8@suse.com>
 <123BE55A-AACB-4FE3-94E2-1559ED73DD09@citrix.com>
 <24240.3047.877655.345428@mariner.uk.xensource.com>
 <1d8eb504-51e9-b8e7-f1af-862760f0f15d@xen.org>
 <24244.16076.627203.282982@mariner.uk.xensource.com>
 <09d729ad-58a7-1f4b-c779-5fd81d7009a4@xen.org>
 <2716ACC1-E38D-45F9-8C07-D99FF846330E@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7048ed1e-1ed4-c594-108b-4bb4cbb77eaf@xen.org>
Date: Mon, 11 May 2020 16:29:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <2716ACC1-E38D-45F9-8C07-D99FF846330E@citrix.com>
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
 Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi George,

On 11/05/2020 16:27, George Dunlap wrote:
> 
> 
>> On May 11, 2020, at 2:30 PM, Julien Grall <julien@xen.org> wrote:
>>
>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>>
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
>>> I am happy with the principle of the change.  I haven't reviewed the
>>> details of the commit message etc.
>>> I reviewed the thread and there were two concernes raised:
>>>   * The question of principle.  I disagree with this concern
>>>     because I approve of principle of the patch.
>>>   * Some detail about the precise justificaton as written in
>>>     the commit message, regarding `clean' targets.  Apparently the
>>>     assertion may not be completely true.  I haven't seen a proposed
>>>     alternative wording.
>>
>> I have checked the latest staging, the `clean` target doesn't trash .config anymore.
>>
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
>> However, if the user forget to add the option when (re)building or when using menuconfig, then .config will get rewritten. This may lead to a rather frustrating experience as it is difficult to diagnostic the
>> issue.
>>
>> A lot of the options behind EXPERT would benefit to be more accessible so user can experiment with it and voice any concern before they are fully be supported.
>>
>> So rather than making really difficult to experiment or tweak your Xen (for instance by adding a built-in command line), this option can now be selected from the menuconfig.
>>
>> This doesn't change the fact a Xen with EXPERT mode selected will not be security supported.
>> "
> 
> How about this, clarifying that top-level .config is an option, but that it’s still better to put it in menuconfig?  (Also note a number of grammar tweaks.)
> 
> —
> 
> EXPERT mode is currently used to gate any options that are in technical
> preview or not security supported. At the moment, this is selected by adding XEN_CONFIG_EXPERT=y on the make command line, or to the (currently undocumented) top-level .config file.
> 
> This makes the option very unintuitive to use: If the user forgets to add the option when (re)building or when using menuconfig, then xen/.config will be silently rewritten, leading to behavior which is very difficult to diagnose.  Adding XEN_CONFIG_EXPERT=y to the top-level .config is not obvious behavior, particularly as the file is undocumented.
> 
> A lot of the options behind EXPERT would benefit from being more accessible so users can experiment with them and voice any concerns before they are fully supported.
> 
> To make this option more discoverable and consistent to use, make it possible to select it from the menuconfig.
> 
> This doesn't change the fact a Xen with EXPERT mode selected will not be security supported.

I am happy this wording.

Cheers,

-- 
Julien Grall

