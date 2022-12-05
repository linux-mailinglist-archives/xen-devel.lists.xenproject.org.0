Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE47642767
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 12:22:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453446.711063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p29YE-0005BI-1y; Mon, 05 Dec 2022 11:22:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453446.711063; Mon, 05 Dec 2022 11:22:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p29YD-00059V-V6; Mon, 05 Dec 2022 11:22:21 +0000
Received: by outflank-mailman (input) for mailman id 453446;
 Mon, 05 Dec 2022 11:22:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p29YC-00059N-Iz
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 11:22:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p29Y7-00053e-UG; Mon, 05 Dec 2022 11:22:15 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.30.208]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p29Y7-0006jd-NR; Mon, 05 Dec 2022 11:22:15 +0000
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
	bh=Gq7Z+MtUXrP43BZQkEgXpOPETVC57TFJKyDBiaWValY=; b=znEUPrJDEttTDG/X4vDLzWAMhS
	wsk2FsY3GlLQmxUaBAIGveMkAmLknuUuZY9h1nz66zXtQC+6VlOribrcfqUyoh1Kya8zV2jjKKHax
	N65JoKfor5EyR5ZcbEDUBca500v6GGHLB1A4Ull4SWdxa+Nf99+6nXyPvEvnJSy7r8Qw=;
Message-ID: <4e89184f-2e47-8205-1af5-7b2bb5431926@xen.org>
Date: Mon, 5 Dec 2022 11:22:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2] process/release-technician-checklist: Explain how the
 banner in README is generated
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221124190850.35344-1-julien@xen.org>
 <6819d05e-d1ab-fc3e-7795-bac650df3bc4@suse.com>
 <AS8PR08MB7991D653E57C71D2B4D4B0C992149@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB7991D653E57C71D2B4D4B0C992149@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/12/2022 10:50, Henry Wang wrote:
> Hi,

Hi Henry,

>> -----Original Message-----
>> Subject: Re: [PATCH v2] process/release-technician-checklist: Explain how the
>> banner in README is generated
>>
>> On 24.11.2022 20:08, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> Explain how the banner in README is generated and take the opportunity
>>> to mention what it should look like for RC.
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Thanks for the release-acked-by. However, I have no plan to port this 
patch to 4.17 (IMHO, a release technician should always read the 
unstable checklist).

Cheers,

-- 
Julien Grall

