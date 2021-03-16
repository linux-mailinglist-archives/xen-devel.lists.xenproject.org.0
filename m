Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E540633D5ED
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 15:39:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98319.186425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMArA-0000OL-Lr; Tue, 16 Mar 2021 14:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98319.186425; Tue, 16 Mar 2021 14:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMArA-0000Ny-Hq; Tue, 16 Mar 2021 14:39:36 +0000
Received: by outflank-mailman (input) for mailman id 98319;
 Tue, 16 Mar 2021 14:39:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lMAr8-0000Nt-IN
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 14:39:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMAr7-0004qs-0Q; Tue, 16 Mar 2021 14:39:33 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMAr5-0001m7-R7; Tue, 16 Mar 2021 14:39:32 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=EBKEQhSIx4f0lLRksQ9MTl13pQWhozrcIVkbXi2KStQ=; b=2UanwEREz/J+8bjz5IkGiCpXrI
	DhBJk6uKK2b9Eqo8EM2gTF62xXhApB/6mOf/nJc1mbECT3Z1/NvPHVU7i6abY4X4psPZqUi+d1mme
	5F9sxDV1G545Xfd5NFf57iEaFYke/nxKNRuEELqHfXvoELSow9x6aUgO+lPkkH1+CeYI=;
Subject: Re: [PATCH for-4.15] SUPPORT.MD: Mark C XenStored LiveUpdate as Tech
 Preview
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, George Dunlap
 <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210313135500.27241-1-julien@xen.org>
 <43d6d118-308d-6bb0-3b91-7dc0f8a38d56@citrix.com>
 <663f08cf-a7cb-2e53-fe22-69d232e6aa07@xen.org>
 <03787b98-9acd-f1a8-66d4-953d7c99ee0d@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <cbc98429-aa76-8567-16bc-3a0ba9d00454@xen.org>
Date: Tue, 16 Mar 2021 14:39:28 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <03787b98-9acd-f1a8-66d4-953d7c99ee0d@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 16/03/2021 14:36, Jürgen Groß wrote:
> On 16.03.21 15:35, Julien Grall wrote:
>> Hi,
>>
>> On 15/03/2021 12:17, Andrew Cooper wrote:
>>> On 13/03/2021 13:55, Julien Grall wrote:
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> Support to liveupdate C XenStored was adding during the 4.15
>>>> development cycle. Add a section in SUPPORT.MD to explain what is the
>>>> support state.
>>>>
>>>> For now, it is a tech preview.
>>>>
>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>>
>>>> ---
>>>>
>>>> CC: Juergen Gross <jgross@suse.com>
>>>>
>>>> It looks like the OCaml side was not merged in 4.15.
>>>
>>> Yes it was.
>>>
>>>> So I have only
>>>> described the support state for C XenStored.
>>>
>>> What about stub-cxenstored?  I think it wants pointing out specifically,
>>> whatever its status, to avoid confusion.
>>
>> Is it even working? @Juergen?
> 
> LU of xenstore-stubdom isn't working yet.

Ok. Would renaming the section to "Dom0 C Xen-Stored LiveUpdate" would 
be suitable?

Cheers,


-- 
Julien Grall

