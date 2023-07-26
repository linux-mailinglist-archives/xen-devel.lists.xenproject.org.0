Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BD6762BB8
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 08:42:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570066.891363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOYDx-0008RT-Om; Wed, 26 Jul 2023 06:42:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570066.891363; Wed, 26 Jul 2023 06:42:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOYDx-0008Pf-Lp; Wed, 26 Jul 2023 06:42:17 +0000
Received: by outflank-mailman (input) for mailman id 570066;
 Wed, 26 Jul 2023 06:42:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eYuv=DM=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qOYDw-0008PZ-8e
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 06:42:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ddfd381-2b7f-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 08:42:14 +0200 (CEST)
Received: from [192.168.1.100] (unknown [37.163.26.92])
 by support.bugseng.com (Postfix) with ESMTPSA id CECDE4EE0738;
 Wed, 26 Jul 2023 08:42:11 +0200 (CEST)
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
X-Inumbo-ID: 8ddfd381-2b7f-11ee-8613-37d641c3527e
Message-ID: <f424fc5b-6266-3d04-b494-0448fa453b75@bugseng.com>
Date: Wed, 26 Jul 2023 08:42:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v3] xen/spinlock: mechanically rename parameter name
 'debug'
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <a66f1084686b77b098c5ccf3d0cf5f52980fdf5a.1690317797.git.nicola.vetrini@bugseng.com>
 <11a3ae18-508b-cf08-2803-bc4aaeec7353@suse.com>
Content-Language: en-US
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
In-Reply-To: <11a3ae18-508b-cf08-2803-bc4aaeec7353@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/07/23 08:34, Jan Beulich wrote:
> On 25.07.2023 22:45, Nicola Vetrini wrote:
>> Rule 5.3 has the following headline:
>> "An identifier declared in an inner scope shall not hide an
>> identifier declared in an outer scope"
>>
>> To avoid any confusion resulting from the parameter 'debug'
>> hiding the homonymous function declared at
>> 'xen/arch/x86/include/asm/processor.h:428'
>> the rename of parameters s/debug/lkdbg/ is performed.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> Changes in v2:
>> - s/dbg/lkdbg/
>> Changes in v3:
>> - Added missing renames for consistency
> 
> Hmm, you asked whether to send v3, but then you didn't wait for an
> answer. So to repeat what I said there: I'd prefer if we could first
> settle whether to rename the conflicting x86 symbol.
> 

Stefano replied asking for a v3 [1] before I had a chance to read your 
message this morning.

[1] 
https://lore.kernel.org/xen-devel/0a7742a3-7f94-de37-cab7-ef54ffcef8ac@suse.com/T/#m14b4eebd936e3b349491a1b9f46a17a5d9bb9c30

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

