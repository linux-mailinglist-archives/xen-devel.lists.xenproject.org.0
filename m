Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB7D58A053
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 20:15:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380635.614945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJfM5-0002cH-0s; Thu, 04 Aug 2022 18:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380635.614945; Thu, 04 Aug 2022 18:13:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJfM4-0002a2-U9; Thu, 04 Aug 2022 18:13:56 +0000
Received: by outflank-mailman (input) for mailman id 380635;
 Thu, 04 Aug 2022 18:13:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oJfM3-0002Zw-C9
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 18:13:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJfM2-0002Pp-9V; Thu, 04 Aug 2022 18:13:54 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227] helo=[10.95.117.14])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJfM2-0001dQ-3A; Thu, 04 Aug 2022 18:13:54 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=cBsxvs6xNeVJKwi0WROT3i2B2lv8Mwc4fO12YDEu9AI=; b=p/hCgvQ9/iD+MwJHot6G5gXqCQ
	3JKvDwQ4inw+zvz2b8sPMSKf/5Cf3DYaaXfvkXDXxoWCTusQhLRE9VPzAb07c4+C3DcwzrWYlYcKu
	a4m9+pfQRxuQbzduho4fhdlCTsJI7zlF4Ozjyx1DPpAK1Cy9qQrjDAAIxw6twHQXngjc=;
Message-ID: <d1895e3a-4866-f325-7606-d57dae29182f@xen.org>
Date: Thu, 4 Aug 2022 19:13:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH] doc: Add git commands to generate Fixes
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <b57628b8cf8355a5f4f32e6ea577689ae7450a69.1659537759.git.bertrand.marquis@arm.com>
 <688de547-896b-da29-9137-44cf2c20227a@xen.org>
 <CE812F61-3A0D-4E5B-8FC6-54FA40F84E14@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CE812F61-3A0D-4E5B-8FC6-54FA40F84E14@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 04/08/2022 16:07, Bertrand Marquis wrote:
> 
> 
>> On 4 Aug 2022, at 14:38, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Bertrand,
>>
>> On 03/08/2022 15:43, Bertrand Marquis wrote:
>>> Add git commands examples that can be used to generate fixes and how to
>>> use the pretty configuration for git.
>>> This should make it easier for contributors to have the right format.
>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>> ---
>>>   docs/process/sending-patches.pandoc | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>> diff --git a/docs/process/sending-patches.pandoc b/docs/process/sending-patches.pandoc
>>> index 7ff7826c992b..9c4c4655323b 100644
>>> --- a/docs/process/sending-patches.pandoc
>>> +++ b/docs/process/sending-patches.pandoc
>>> @@ -102,6 +102,10 @@ E.g.:
>>>         Fixes: 67d01cdb5518 ("x86: infrastructure to allow converting certain indirect calls to direct ones")
>>>   +If git was configured as explained earlier, this can be retrieved using
>>> +``git log --pretty=fixes`` otherwise ``git log --abbrev=12 --oneline`` will
>>> +give the proper tag and title.
>>
>> Rather than "proper tag", do you mean "commit-id"?
> 
> Yes you are right commit-id is better.
> Can you fix on commit ?

Sure. It is now committed.

Cheers,

-- 
Julien Grall

