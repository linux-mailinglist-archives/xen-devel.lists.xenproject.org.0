Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 834DA56B3F2
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 10:01:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363299.593802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9iuq-00037v-GG; Fri, 08 Jul 2022 08:00:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363299.593802; Fri, 08 Jul 2022 08:00:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9iuq-00034T-DQ; Fri, 08 Jul 2022 08:00:44 +0000
Received: by outflank-mailman (input) for mailman id 363299;
 Fri, 08 Jul 2022 08:00:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o9iup-00034H-Oc
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 08:00:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o9iuf-0006eZ-Ls; Fri, 08 Jul 2022 08:00:33 +0000
Received: from [54.239.6.190] (helo=[192.168.18.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o9iuf-00074u-Ea; Fri, 08 Jul 2022 08:00:33 +0000
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
	bh=Q2jemuyu2t51ULKJGG0792ZOnC+HDrw35wUr+fGi/K4=; b=FK6WOm3OvzLfOZvBAKWPUzvT/H
	7NLMBg0Vhe/HRn7otLmmlDx7rGkFr9m930cMynxAETG8KRf9jT2Ihsiea+zOivSUXbjsLfHb9yfra
	CnWb4F5d/9O+4U6Je7d7IegNBVUuR6OkEGOqcIHk0UnYsASYxMiCsY66a7BRlodqSD8c=;
Message-ID: <a60c3062-cb83-4a97-d553-5355219cfcc5@xen.org>
Date: Fri, 8 Jul 2022 09:00:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: Xen 4.17: Proposed release schedule
To: Jan Beulich <jbeulich@suse.com>, Henry Wang <Henry.Wang@arm.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
 "christopher.clark@starlab.io" <christopher.clark@starlab.io>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall
 <jgrall@amazon.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "jgross@suse.com" <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 "Wei Liu (LSG)" <liuwe@microsoft.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <AS8PR08MB7991145C8063D6939AFFED8F92829@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <73ba5d67-635b-b377-14c6-7dd488b10e32@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <73ba5d67-635b-b377-14c6-7dd488b10e32@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08/07/2022 08:51, Jan Beulich wrote:
> On 08.07.2022 09:35, Henry Wang wrote:
>> Proposed option 1: Wed Sep 28, 2022
>> (+9 months from Xen 4.16 release, after Xen Summit)
> 
> This would break our 8-month cadence or shorten 4.18 by a month (or
> more, 4.16 was late in November already, and we're liable to slip
> anyway - simply based on history). Therefore, as discussed on the
> call yesterday, ...
> 
>> - Last posting date          Fri Jul 29, 2022 (+3 weeks from now)
>>
>> Patches adding new features should be posted to the mailing list
>> by this date, although perhaps not in their final version.
>>
>> - Feature freeze             Fri Aug 19, 2022 (+3 weeks from Last posting date)
>>
>> Patches adding new features should be committed by this date.
>> Straightforward bugfixes may continue to be accepted by maintainers.
>>
>> - Code freeze                Fri Sep 9, 2022 (+3 weeks from Feature freeze)
>>
>> Bugfixes only.
>>
>> - Hard code freeze           Fri Sep 16, 2022 (+1 week from Code freeze)
>>
>> Branch off staging-4.17. Bugfixes for serious bugs (including regressions),
>> and low-risk fixes only.
>>
>> - Final commits              Fri Sep 23, 2022 (+1 week from Hard code freeze)
>>
>> Docs/prep only
>>
>> - Release                    Wed Sep 28, 2022
>>
>>
>> Proposed option 2: Wed Nov 2, 2022
>> (+1 year from Xen 4.16 release)
> 
> ... my personal view is that this is the better alternative, considering
> the circumstances.

+1

> 
> Jan
> 
>> - Last posting date          Fri Aug 12, 2022 (+5 weeks from now)
>>
>> - Feature freeze             Fri Sep 2, 2022 (+3 weeks from Last posting date)
>>
>> - Code freeze                Fri Sep 23, 2022 (+3 weeks from Feature freeze)
>>
>> - Hard code freeze           Fri Oct 14, 2022 (+3 weeks from Code freeze)
>>
>> - Final commits              Fri Oct 28, 2022 (+2 weeks from Hard code freeze)
>>
>> - Release                    Wed Nov 2, 2022
>>
>>
>> As soon as the release schedule is decided, I will post reminders one
>> week before important dates.
>>
>> Kind regards,
>> Henry
> 

-- 
Julien Grall

