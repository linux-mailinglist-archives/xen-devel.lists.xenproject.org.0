Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC6275EDFE
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 10:42:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568503.887856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNr8m-0005Ad-3q; Mon, 24 Jul 2023 08:42:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568503.887856; Mon, 24 Jul 2023 08:42:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNr8l-00058R-VT; Mon, 24 Jul 2023 08:42:03 +0000
Received: by outflank-mailman (input) for mailman id 568503;
 Mon, 24 Jul 2023 08:42:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AOzI=DK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qNr8k-00058J-QR
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 08:42:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f34440b1-29fd-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 10:41:58 +0200 (CEST)
Received: from [192.168.1.100] (unknown [37.162.132.135])
 by support.bugseng.com (Postfix) with ESMTPSA id F18A44EE0737;
 Mon, 24 Jul 2023 10:41:58 +0200 (CEST)
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
X-Inumbo-ID: f34440b1-29fd-11ee-8612-37d641c3527e
Message-ID: <f96761cf-1329-2a95-29bc-4d0ae97423f5@bugseng.com>
Date: Mon, 24 Jul 2023 10:41:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] xen/spinlock: mechanically rename parameter name
 'debug'
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <78255b6c5caaaa02dad638c7d4102ea793a09b88.1689953306.git.nicola.vetrini@bugseng.com>
 <4f3b6c7c-f8a3-b904-1b23-baa9eb2455a1@suse.com>
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
In-Reply-To: <4f3b6c7c-f8a3-b904-1b23-baa9eb2455a1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/07/23 10:14, Jan Beulich wrote:
> On 21.07.2023 17:29, Nicola Vetrini wrote:
>> --- a/xen/common/spinlock.c
>> +++ b/xen/common/spinlock.c
>> @@ -78,7 +78,7 @@ static int __init cf_check lockdebug_init(void)
>>   }
>>   presmp_initcall(lockdebug_init);
>>   
>> -void check_lock(union lock_debug *debug, bool try)
>> +void check_lock(union lock_debug *dbg, bool try)
> 
> I consider it reasonably likely that something named "dbg" might also
> appear, when we already have something with as generic a named as
> "debug". How about naming these parameters "ld", "ldbg", "lkdbg", or
> yet something along these lines, but (at least slightly) less generic?
> 

No problem. I prefer "lkdbg" among the alternatives.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

