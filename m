Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A30811CF2FF
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 13:00:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYSeC-0000MR-Is; Tue, 12 May 2020 11:00:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WwR0=62=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jYSeA-0000MM-VX
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 11:00:27 +0000
X-Inumbo-ID: c8ed7528-943f-11ea-b9cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8ed7528-943f-11ea-b9cf-bc764e2007e4;
 Tue, 12 May 2020 11:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NLaF4lxv8ZeQ+uHNhOEK7cs0zYlDraOV3q7r2ycHm7w=; b=c8qaO9cr4pGeFPXaNF/rOdgoX4
 RGtpdESDY01JiQ0FXTVDbsCRzfvTO5ipWnfydPDO61RChQUyZCwupLPj24urdhdbHmxt9JLPzIdQo
 Rw2tvdcyCMMgx7gZExxF8qFrTRDeJCev2Taie3y5ao1n8TB6WQ8iH9mq6kZUevuljCec=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jYSe8-000487-Ob; Tue, 12 May 2020 11:00:24 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jYSe8-0005BQ-HF; Tue, 12 May 2020 11:00:24 +0000
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
 <ca115637-5e84-2990-65e8-e2f04ec0ddb5@xen.org>
 <803876ce-503a-2e97-f310-0413e515970b@suse.com>
 <bbc12f81-7854-ad72-63ee-3ec94b378bf9@xen.org>
 <bf6a9ed3-fd7e-c588-9f72-8084dab1f556@suse.com>
 <24249.34804.568523.847077@mariner.uk.xensource.com>
 <88487e23-88f7-2ce8-8292-7e97ed8902c5@suse.com>
 <8dc17648-c669-eec7-2ecd-81245fa8d517@xen.org>
 <cabaa3f1-5eca-c7a5-e819-1c7487c4add1@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <71e63752-b6b0-9578-e79a-0bef30a7c50a@xen.org>
Date: Tue, 12 May 2020 12:00:22 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <cabaa3f1-5eca-c7a5-e819-1c7487c4add1@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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

Hi Jan,

On 12/05/2020 11:15, Jan Beulich wrote:
> On 12.05.2020 12:08, Julien Grall wrote:
>> On 12/05/2020 08:18, Jan Beulich wrote:
>>> On 11.05.2020 19:14, Ian Jackson wrote:
>>>> Jan Beulich writes ("Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the menuconfig directly"):
>>>>> I'm trying to make the point that your patch, to me, looks to be
>>>>> trying to overcome a problem for which we have had a solution all
>>>>> the time.
>>>>
>>>> Thanks for this clear statement of your objection.  I'm afraid I don't
>>>> agree.  Even though .config exists (and is even used by osstest, so I
>>>> know about it) I don't think it is as good as having it in
>>>> menuconfig.
>>>
>>> But you realize that my objection is (was) more towards the reasoning
>>> behind the change, than towards the change itself. If, as a community,
>>> we decide to undo what we might now call a mistake, and if we're ready
>>> to deal with the consequences, so be it.
>>
>> Would you mind to explain the fall out you expect from this patch? Are
>> you worry more people may contact security@xen.org for non-security issue?
> 
> That's one possible thing that might happen. But even more generally
> the likelihood will increase that people report issues without paying
> attention that they depend on their choice of configuration.
I agree that you are going to get more report because there are more 
users to try new things. So inevitently, you will get more incomplete 
report. This is always the downside of allowing more flexibility.

But we also need to look at the upside. I can see 2 advantages:
     1) It will be easier to try upcoming features (e.g Argo). The more 
testing and input, the more chance a feature will be a success.
     2) It will be easier to tailor Xen (such as built-in command line).

In both cases, you make Xen more compelling because you allow to 
experiment and make it more flexible. IHMO, this is one of the best way 
to attract users and possible new contributors/reviewers to Xen community.

>  We'll
> have to both take this into consideration and ask back for the
> specific .config they've used.
Correct me if I am wrong, but this is not very specific to EXPERT mode. 
You can already select different options that will affect the behavior 
of the hypervisor. For instance, on x86, you can disable PV guest 
support. How do you figure that out today without asking the .config?

Cheers,

-- 
Julien Grall

