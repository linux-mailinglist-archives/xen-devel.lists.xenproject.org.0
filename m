Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E8A7DCE18
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 14:45:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625783.975418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxp3j-0000gl-B3; Tue, 31 Oct 2023 13:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625783.975418; Tue, 31 Oct 2023 13:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxp3j-0000f4-85; Tue, 31 Oct 2023 13:45:31 +0000
Received: by outflank-mailman (input) for mailman id 625783;
 Tue, 31 Oct 2023 13:45:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qxp3i-0000eb-Gp
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 13:45:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qxp3i-00043O-02; Tue, 31 Oct 2023 13:45:30 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.9.249]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qxp3h-0007sr-OQ; Tue, 31 Oct 2023 13:45:29 +0000
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
	bh=iwYI4ZMnbN8MCNAV6joKKfGx9XaQKtsZJPpi4/QISrY=; b=Hf8i7T3J8f+VokxNvxjb9J5SyT
	gWW72f8Q5I6DjGrO9q4oykkQdi62j54sOswijeg5qCE4ZcNYuYtVNBYXr4jPKjs1hToKDCCwmzkq9
	4cxyCUizyeo6qtw+sQlchJ5D7bsHokL22sEpK7pzoJaFwY4YPzAVS5IzZGBDoxNXF3vY=;
Message-ID: <1bac4eda-a0d8-4dd8-83ba-9ad78eb2947e@xen.org>
Date: Tue, 31 Oct 2023 13:45:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 3/3] CHANGELOG: Keep unstable section
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <20231031131954.3310725-1-andrew.cooper3@citrix.com>
 <20231031131954.3310725-4-andrew.cooper3@citrix.com>
 <d2a5b85e-e25a-458e-b3ad-0821eb106e85@xen.org>
 <37bcdf0c-75be-4390-8758-d53f097d5b88@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <37bcdf0c-75be-4390-8758-d53f097d5b88@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 31/10/2023 13:38, Andrew Cooper wrote:
> On 31/10/2023 1:31 pm, Julien Grall wrote:
>> Hi,
>>
>> On 31/10/2023 13:19, Andrew Cooper wrote:
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> Henry already provided a similar patch [1]. The only reason it is not
>> yet committed is because we haven't yet set a final date for 4.18 and
>> I want to avoid any clash when that patch will appear.
>>
>> Cheers,
>>
>> [1] 20231023092123.1756426-5-Henry.Wang@arm.com
> 
> This section should not have been deleted in d9f07b06cfc9.

Why? This has always been our process. We should not ship 4.18 with the 
UNSTABLE section. So it was correct to delete it in d9f07b06cfc9.

> 
> It's fine to have an unstable section before the 4.18 date is confirmed,
> and the section must exist before staging is re-opened for 4.19 content.

I disagree. 4.19 will not be fully re-open until we finally release. So 
I wouldn't expect any new features to be merged.

> 
> I don't mind which of these two patches gets committed, but one of them
> is getting committed today ahead of staging re-opening.  Part of
> branching ought to ensure that this section exists.

If you want to go down that route, then please update the 
docs/process/branching-checklist.txt. Otherwise, I will continue to do 
as I did previously.

Cheers,

-- 
Julien Grall

