Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B67294135
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 19:13:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9744.25678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUvCl-0003yx-Vb; Tue, 20 Oct 2020 17:13:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9744.25678; Tue, 20 Oct 2020 17:13:47 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUvCl-0003xl-Rl; Tue, 20 Oct 2020 17:13:47 +0000
Received: by outflank-mailman (input) for mailman id 9744;
 Tue, 20 Oct 2020 17:13:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRnX=D3=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kUvCk-0003wl-I1
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 17:13:46 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 221f105f-c56e-4973-a7af-79ab9fac0e24;
 Tue, 20 Oct 2020 17:13:45 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kUvCg-0000FM-0b; Tue, 20 Oct 2020 17:13:42 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kUvCf-0006zy-PL; Tue, 20 Oct 2020 17:13:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=TRnX=D3=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kUvCk-0003wl-I1
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 17:13:46 +0000
X-Inumbo-ID: 221f105f-c56e-4973-a7af-79ab9fac0e24
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 221f105f-c56e-4973-a7af-79ab9fac0e24;
	Tue, 20 Oct 2020 17:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=gEH0W/5uBUfmjQEj5YwJ9g+vVR/8JcE27YLqQ/85Mcw=; b=BCkF5dCIBtzNZF/alEsHdoJfDO
	aRXOiLLa2DzG7zVy72KdmY1yOsJpbxdNVHc3A8YzuZ+fyc9a3XPCV14ul4zy7kI7xeOmNSxbpiisg
	o7L6XzVwprG92VBg5a72QB256NUbd6Vh9V8YftBDEv+RvOChPMZwEYH78Urjw+KX3Cyc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kUvCg-0000FM-0b; Tue, 20 Oct 2020 17:13:42 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kUvCf-0006zy-PL; Tue, 20 Oct 2020 17:13:41 +0000
Subject: Re: Xen Coding style and clang-format
To: Stefano Stabellini <sstabellini@kernel.org>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>
Cc: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "George.Dunlap@citrix.com" <George.Dunlap@citrix.com>,
 "vicooodin@gmail.com" <vicooodin@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "viktor.mitin.19@gmail.com" <viktor.mitin.19@gmail.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <300923eb27aea4d19bff3c21bc51d749c315f8e3.camel@epam.com>
 <4238269c-3bf4-3acb-7464-3d753f377eef@suse.com>
 <E068C671-8009-4976-87B8-0709F6A5C3BF@citrix.com>
 <b16dfb26e0916166180d5cbbe95278dc99277330.camel@epam.com>
 <B64C5E67-7BEA-4C31-9089-AB8CC1F1E80F@citrix.com>
 <3ff3f7d16cdab692178ce638da1a6b880817fb7e.camel@epam.com>
 <64FE5ADB-2359-4A31-B1A1-925750515D98@citrix.com>
 <b4d7e9a7-6c25-1f7f-86ce-867083beb81a@suse.com>
 <4d4f351b152df2c50e18676ccd6ab6b4dc667801.camel@epam.com>
 <5bd7cc00-c4c9-0737-897d-e76f22e2fd5b@xen.org>
 <AM6PR03MB3687A99424FA9FD062F5FE4BF4030@AM6PR03MB3687.eurprd03.prod.outlook.com>
 <alpine.DEB.2.21.2010191101250.12247@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <b0f9c9e0-d43e-e05b-d4ab-40f3bf437643@xen.org>
Date: Tue, 20 Oct 2020 18:13:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010191101250.12247@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi,

On 19/10/2020 19:07, Stefano Stabellini wrote:
> On Fri, 16 Oct 2020, Artem Mygaiev wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: пятница, 16 октября 2020 г. 13:24
>> To: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>; jbeulich@suse.com; George.Dunlap@citrix.com
>> Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>; vicooodin@gmail.com; xen-devel@lists.xenproject.org; committers@xenproject.org; viktor.mitin.19@gmail.com; Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> Subject: Re: Xen Coding style and clang-format
>>
>>> Hi,
>>>
>>> On 16/10/2020 10:42, Anastasiia Lukianenko wrote:
>>>> Thanks for your advices, which helped me improve the checker. I
>>>> understand that there are still some disagreements about the
>>>> formatting, but as I said before, the checker cannot be very flexible
>>>> and take into account all the author's ideas.
>>>
>>> I am not sure what you refer by "author's ideas" here. The checker
>>> should follow a coding style (Xen or a modified version):
>>>      - Anything not following the coding style should be considered as
>>> invalid.
>>>      - Anything not written in the coding style should be left
>>> untouched/uncommented by the checker.
>>>
>>
>> Agree
>>
>>>> I suggest using the
>>>> checker not as a mandatory check, but as an indication to the author of
>>>> possible formatting errors that he can correct or ignore.
>>>
>>> I can understand that short term we would want to make it optional so
>>> either the coding style or the checker can be tuned. But I don't think
>>> this is an ideal situation to be in long term.
>>>
>>> The goal of the checker is to automatically verify the coding style and
>>> get it consistent across Xen. If we make it optional or it is
>>> "unreliable", then we lose the two benefits and possibly increase the
>>> contributor frustration as the checker would say A but we need B.
>>>
>>> Therefore, we need to make sure the checker and the coding style match.
>>> I don't have any opinions on the approach to achieve that.
>>
>> Of the list of remaining issues from Anastasiia, looks like only items 5
>> and 6 are conform to official Xen coding style. As for remainning ones,
>> I would like to suggest disabling those that are controversial (items 1,
>> 2, 4, 8, 9, 10). Maybe we want to have further discussion on refining
>> coding style, we can use these as starting point. If we are open to
>> extending style now, I would suggest to add rules that seem to be
>> meaningful (items 3, 7) and keep them in checker.
> 
> Good approach. Yes, I would like to keep 3, 7 in the checker.
> 
> I would also keep 8 and add a small note to the coding style to say that
> comments should be aligned where possible.

+1 for this. Although, I don't mind the coding style used as long as we 
have a checker and the code is consistent :).

Cheers,

-- 
Julien Grall

