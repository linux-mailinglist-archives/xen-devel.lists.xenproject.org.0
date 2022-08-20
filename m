Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DBA59AF94
	for <lists+xen-devel@lfdr.de>; Sat, 20 Aug 2022 20:35:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390848.628451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPTIE-0002iM-D9; Sat, 20 Aug 2022 18:33:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390848.628451; Sat, 20 Aug 2022 18:33:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPTIE-0002fV-9n; Sat, 20 Aug 2022 18:33:58 +0000
Received: by outflank-mailman (input) for mailman id 390848;
 Sat, 20 Aug 2022 18:33:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oPTIC-0002fP-SN
 for xen-devel@lists.xenproject.org; Sat, 20 Aug 2022 18:33:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oPTIA-0007ZZ-EF; Sat, 20 Aug 2022 18:33:54 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oPTIA-000141-8U; Sat, 20 Aug 2022 18:33:54 +0000
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
	bh=odhYjoQtqwM29jXVI749lIcT47PeBLMj4bEVl1OwMQg=; b=qlpGQ8ztbq62OUiM/n8ehevSA/
	h+9w8L0lXrUSGcZeMYFII8uEXyTDNTbLMSsp9PbypK0RVnc/nBtCPizGXLk7GzP5nnCYbD7X8AJAL
	zrgVSlPWnqmMZG/WfTKX3EnJUXFKFns4JfQUZSj/N8/gy+2e2avN8R4D34IWBs7Vq2EU=;
Message-ID: <4d7c1cd2-0ea7-8974-88f1-c7f2276736cb@xen.org>
Date: Sat, 20 Aug 2022 19:33:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/3] Add SPDX to CODING_STYLE
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org, wl@xen.org, jbeulich@suse.com,
 george.dunlap@citrix.com, andrew.cooper3@citrix.com,
 bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com, roger.pau@citrix.com
References: <alpine.DEB.2.22.394.2208181453530.3790@ubuntu-linux-20-04-desktop>
 <20220818220320.2538705-1-stefano.stabellini@amd.com>
 <fb2e6b9d-8ffc-a7f2-8411-3751dc8d4022@xen.org>
 <alpine.DEB.2.22.394.2208191522310.3790@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2208191522310.3790@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 19/08/2022 23:24, Stefano Stabellini wrote:
> On Fri, 19 Aug 2022, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 18/08/2022 23:03, Stefano Stabellini wrote:
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>> ---
>>>    CODING_STYLE | 10 ++++++++++
>>>    1 file changed, 10 insertions(+)
>>>
>>> diff --git a/CODING_STYLE b/CODING_STYLE
>>> index 3386ee1d90..5faf274b3a 100644
>>> --- a/CODING_STYLE
>>> +++ b/CODING_STYLE
>>> @@ -14,6 +14,16 @@ explicitly (e.g. tools/libxl/CODING_STYLE) but often
>>> implicitly (Linux
>>>    coding style is fairly common). In general you should copy the style
>>>    of the surrounding code. If you are unsure please ask.
>>>    +SPDX
>>> +----
>>> +
>>> +New files should start with a single-line SPDX comment to express the
>>> +license, e.g.:
>>> +
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +
>>> +See LICENSES/ for a list of licenses and SPDX tags currently used.
>>> +
>>
>> A user reading CODING_STYLE and CONTRIBUTING may think they need to also add
>> the full license (see the section "COMMON COPYRIGHT NOTICES").
>>
>> So as we are going to promote SPDX, we should update CONTRIBUTING to reflect
>> that the full license should not be present copied.
> 
> Yes good idea. Should I just remove the entire "COMMON COPYRIGHT
> NOTICES" section?

I would say yes. You will need to tweak the first section of that file 
because it reference the section " COMMON COPYRIGHT NOTICES".

Cheers,

-- 
Julien Grall

