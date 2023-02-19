Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F17569C1F7
	for <lists+xen-devel@lfdr.de>; Sun, 19 Feb 2023 19:45:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497853.768632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTogq-0003QO-Mp; Sun, 19 Feb 2023 18:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497853.768632; Sun, 19 Feb 2023 18:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTogq-0003OC-K9; Sun, 19 Feb 2023 18:45:36 +0000
Received: by outflank-mailman (input) for mailman id 497853;
 Sun, 19 Feb 2023 18:45:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pTogp-0003O6-KV
 for xen-devel@lists.xenproject.org; Sun, 19 Feb 2023 18:45:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pTogn-0006zD-VA; Sun, 19 Feb 2023 18:45:33 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pTogn-0000ns-QO; Sun, 19 Feb 2023 18:45:33 +0000
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
	bh=V0oDH/Yq3gpCHs/8/f/FTGzeSPkLlYuB4NNPvGTFmQA=; b=dL11qbP97jyryiCGIqhiVmvdS6
	SDvwLQbg7Ziixse6o0e+X1fFPb+OK+2+V8NzaDZhseMp2L1AAvToc7+CJijWITMGpJfABRfxiUO6U
	e+UMIGpUOA5WTNV0GLh8H5uz4NNoEwb7wJIhfkYBP3fd3YD0OOOkOganI9V7laN79diI=;
Message-ID: <de00e9ea-8734-a5c3-6ef2-b74cd7f12418@xen.org>
Date: Sun, 19 Feb 2023 18:45:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/4] docs/process: branching-checklist: Reword the
 section about Config.mk
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230209172820.56292-1-julien@xen.org>
 <20230209172820.56292-2-julien@xen.org>
 <AS8PR08MB79916656C845345C353CE29692DE9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB79916656C845345C353CE29692DE9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/02/2023 01:57, Henry Wang wrote:
> Hi Julien,

Hi Henry,

> 
>> -----Original Message-----
>> Subject: [PATCH v2 1/4] docs/process: branching-checklist: Reword the
>> section about Config.mk
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Since at least Xen 4.12, the revision for external trees don't contain
>> the word "unstable". So explicitely list the *_REVISION variables that
> 
> A small typo that can be fixed on commit: s/explicitely/explicitly
> 
>> need to be updated as part of the branching process.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Change looks good, thanks for updating the doc :)
> 
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Thanks! I fixed the typo and committed the series.

Cheers,

-- 
Julien Grall

