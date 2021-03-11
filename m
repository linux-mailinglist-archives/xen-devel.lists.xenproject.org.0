Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4B3337199
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 12:43:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96468.182538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKJjE-0002vc-Fs; Thu, 11 Mar 2021 11:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96468.182538; Thu, 11 Mar 2021 11:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKJjE-0002vD-Cn; Thu, 11 Mar 2021 11:43:44 +0000
Received: by outflank-mailman (input) for mailman id 96468;
 Thu, 11 Mar 2021 11:43:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QJ7d=IJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKJjC-0002v8-Qe
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 11:43:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 410110a1-e5e2-48cd-be02-e6a3338d58df;
 Thu, 11 Mar 2021 11:43:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3176EAC17;
 Thu, 11 Mar 2021 11:43:41 +0000 (UTC)
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
X-Inumbo-ID: 410110a1-e5e2-48cd-be02-e6a3338d58df
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615463021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uiNWiXnPAoe+/jhRiPkWAurq6xpVbqXwniHx4z+FwSc=;
	b=QmryxUU+HNwebzKmtsT4vhyZZY9Trd647NnGgGzo7kDCjPibvWs2pcnvhdt3jfTOCrDmML
	QKz6DJW2ytA9Yeov0wnM9V+8CnHmrmclTJZcWaGphzGn3eBymM3AzhR0WQD6OvV+RtAxRr
	qisrCZoMqGu7FpjWDinRwOJlEl77HJg=
Subject: Re: [PATCH for-4.15] xen: Bump the minimum version of GCC supported
 to 4.9 (5.1 on arm64)
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210306214148.27021-1-julien@xen.org>
 <1897022d-7591-3450-4e57-884a2860b13d@suse.com>
 <7fd07dc9-9c03-bb13-3907-c3c268a4e970@xen.org>
 <2de5160f-8636-5cdf-a20c-acaa2640c893@suse.com>
 <e4ea36f5-7aca-e19d-5e78-45058b13697b@xen.org>
 <e1176ad2-0a66-3a6d-c053-f0da9d4ae35f@suse.com>
 <7ab87cab-8836-e8a0-993e-0cdeca3c45e3@xen.org>
 <2bc2ad13-8636-e5d4-3a4a-722c75e3b92a@suse.com>
 <6048b3f0-b131-9ced-9521-a935e5b337eb@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <13983f51-f6d9-db70-dbce-51481d4aaa2b@suse.com>
Date: Thu, 11 Mar 2021 12:43:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <6048b3f0-b131-9ced-9521-a935e5b337eb@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.03.2021 10:31, Julien Grall wrote:
> On 11/03/2021 08:17, Jan Beulich wrote:
>> On 10.03.2021 19:05, Julien Grall wrote:
>>> On 09/03/2021 11:20, Jan Beulich wrote:
>>>> On 08.03.2021 21:22, Julien Grall wrote:
>>>>> On 08/03/2021 11:20, Jan Beulich wrote:
>>>>>> On 08.03.2021 11:51, Julien Grall wrote:
>>>>>>> On 08/03/2021 08:09, Jan Beulich wrote:
>>>>>>>> Additionally - partly related to your own reply regarding the CI
>>>>>>>> failures - imo there needs to be an analysis of what older distros
>>>>>>>> will no longer build (at all or by default).
>>>>>>>
>>>>>>> Per the CI, this would be Ubuntu Trusty (and older), Centos 7 (and older)
>>>>>>>
>>>>>>> Do you have any other in mind?
>>>>>>
>>>>>> Our SLE12 (latest service pack is SP5 and still has a while to go
>>>>>> to at least reach LTSS state) comes with gcc 4.8 as the default
>>>>>> compiler.
>>>>>
>>>>> Thanks! That's good to know. Is it the old GCC Suse supports?
>>>>
>>>> Not sure I understand the question: The default compiler of this or
>>>> any distro is of course (expected to be) supported by the vendor
>>>> for the lifetime of the OS.
>>>
>>> Sorry for the wording. I was asking whether Suse also supports compiler
>>> older than GCC 4.8.
>>
>> Oh, I see. SLES11 has another year to go for LTSS to end, and it's 4.3
>> which is used there.
> 
> Thanks for the info! Are you planning to build Xen 4.15 there too?

If "you" is the company - there are no plans to provide 4.15 there. But
I do build Xen myself on such systems. That's how I'm noticing
compatibility issues like the one in grant table code where you don't
like the workaround.

Jan

