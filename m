Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F09B58515
	for <lists+xen-devel@lfdr.de>; Mon, 15 Sep 2025 21:03:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124405.1466772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyETH-00059e-QY; Mon, 15 Sep 2025 19:02:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124405.1466772; Mon, 15 Sep 2025 19:02:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyETH-00058P-Mx; Mon, 15 Sep 2025 19:02:39 +0000
Received: by outflank-mailman (input) for mailman id 1124405;
 Mon, 15 Sep 2025 19:02:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uyETF-00058J-Rn
 for xen-devel@lists.xenproject.org; Mon, 15 Sep 2025 19:02:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uyETF-00BKi4-1S;
 Mon, 15 Sep 2025 19:02:37 +0000
Received: from [2a02:8012:3a1:0:94fa:2916:1471:b94a]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uyETF-00B54Q-1n;
 Mon, 15 Sep 2025 19:02:37 +0000
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
	bh=c6ZWZdslp/khrddMiuDlVzvNHOb1VnysWLgLZoQhNeM=; b=WU0M7REmFqWaRYz9aq2WxSRMd1
	xlYT2qvsoyPZ2CXN2LoTs3NAi+1B5hAGtcCXP86Hx9dXne8OC//bWpvsXZfrfpbdyasGHNby3gqw/
	LjYgkvC3w7gmFCz2UgVDGxPuMQrQhNOJPhvsvG3bK4emGaWWIphmUO7dHT+CTZ6tZen0=;
Message-ID: <14f698f1-b1cf-4244-9157-7214710e92d2@xen.org>
Date: Mon, 15 Sep 2025 20:02:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] SUPPORT.md: add xenstorepvh-stubdom live update
Content-Language: en-GB
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250730122305.4050-1-jgross@suse.com>
 <20250730122305.4050-9-jgross@suse.com>
 <25c867ca-3b73-4b65-be98-c2d7b3ea4f7b@xen.org>
 <1f1a5a8f-0b1f-4e50-9467-3d27d8a3089d@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1f1a5a8f-0b1f-4e50-9467-3d27d8a3089d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 13/09/2025 08:16, Jürgen Groß wrote:
> On 12.09.25 23:09, Julien Grall wrote:
>> Hi Juergen,
>>
>> Sorry for the late answer.
>>
>> On 30/07/2025 13:23, Juergen Gross wrote:
>>> Live update is now working with the PVH variant of xenstore-stubdom.
>>  > > Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>> V2:
>>> - new patch
>>> ---
>>>   SUPPORT.md | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/SUPPORT.md b/SUPPORT.md
>>> index 6a82a92189..eb44ee85fd 100644
>>> --- a/SUPPORT.md
>>> +++ b/SUPPORT.md
>>> @@ -280,7 +280,7 @@ or itself will not be regarded a security issue.
>>>   ### C xenstore stubdom PVH
>>>       Status: Supported
>>> -    Status, Liveupdate: Not implemented
>>> +    Status, Liveupdate: Supported
>>
>> I went through the changes in Xenstored for the stubdom and I have one 
>> question regarding [1]. Does this mean the event channel will be 
>> closed during Live- Update? Asking because I vaguely remember we need 
>> to keep them open to avoid losing events. I am wondering how this 
>> would work in stubdom?
> 
> The event channel is still open, its just the Mini-OS internals that don't
> know about this. This is the reason for calling xenevtchn_bind() to bring
> hypervisor and Mini-OS view in sync again, without changing the hypervisor
> side.

Thanks for the clarification.

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,
-- 
Julien Grall


