Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A033905EB
	for <lists+xen-devel@lfdr.de>; Tue, 25 May 2021 17:54:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132266.246776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llZOE-0007iR-Rz; Tue, 25 May 2021 15:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132266.246776; Tue, 25 May 2021 15:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llZOE-0007fo-Og; Tue, 25 May 2021 15:54:42 +0000
Received: by outflank-mailman (input) for mailman id 132266;
 Tue, 25 May 2021 15:54:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1llZOD-0007fi-F5
 for xen-devel@lists.xenproject.org; Tue, 25 May 2021 15:54:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9318dbcd-b8c7-4a50-8af6-d90eaa465b3b;
 Tue, 25 May 2021 15:54:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8E318AB71;
 Tue, 25 May 2021 15:54:39 +0000 (UTC)
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
X-Inumbo-ID: 9318dbcd-b8c7-4a50-8af6-d90eaa465b3b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621958079; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bOFxakO4RGNFsjlnSLdzXV3v8NGAhbbK08sIoC70Cbs=;
	b=HDRf4FntaJPDXTN3VAQv/YfBvL0X3deOu6Xiv1UkDK1oT2V1BwtIcPfdNyGhswzNWxpetE
	NuqYb/5rtIZPttIwTfODL3TWXUxbBtq/DnJI81xttMvZYvjzh+mkQTNwb9Ee3xobkne8t8
	JrKbJ61i4URv1oa6hkDC78OOYBuvQek=
Subject: Re: [PATCH 3/3] firmware/shim: UNSUPPORTED=n
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <19695ffc-34d8-b682-b092-668f872d4e57@suse.com>
 <dbfa9126-6809-64cf-5bd5-01b402616f11@suse.com>
 <YK0MBTWXYJmihvUn@Air-de-Roger>
 <6b74b1de-5ec4-09dc-ba1e-821025402d36@suse.com>
 <YK0c9oPEYVUlNSU6@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ad740a43-edfc-0662-d4f5-ea337bdabf19@suse.com>
Date: Tue, 25 May 2021 17:54:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YK0c9oPEYVUlNSU6@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 25.05.2021 17:51, Roger Pau Monné wrote:
> On Tue, May 25, 2021 at 05:21:43PM +0200, Jan Beulich wrote:
>> On 25.05.2021 16:39, Roger Pau Monné wrote:
>>> On Fri, Apr 30, 2021 at 04:45:03PM +0200, Jan Beulich wrote:
>>>> @@ -31,7 +31,7 @@ config SCHED_ARINC653
>>>>  
>>>>  config SCHED_NULL
>>>>  	bool "Null scheduler support (UNSUPPORTED)" if UNSUPPORTED
>>>> -	default y
>>>> +	default PV_SHIM || DEBUG
>>>
>>> Do we need the pvshim_defconfig to set CONFIG_SCHED_NULL=y after this?
>>
>> I don't think so, the default will be y for it. Explicit settings
>> are needed only when we want a non-default value.
> 
> Right, I think I haven't expressed myself correctly. I wanted to point
> out that I think CONFIG_SCHED_NULL=y is no longer needed in the
> pvshim_defconfig.

Oh, I see - yes, that ought to work. I'll make such an adjustment for
v2 (unless I discover something standing in the way).

Jan

