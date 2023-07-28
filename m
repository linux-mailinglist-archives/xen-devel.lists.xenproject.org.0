Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AD576719F
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 18:14:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571507.895521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPQ66-0003Oq-WC; Fri, 28 Jul 2023 16:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571507.895521; Fri, 28 Jul 2023 16:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPQ66-0003N8-TS; Fri, 28 Jul 2023 16:13:46 +0000
Received: by outflank-mailman (input) for mailman id 571507;
 Fri, 28 Jul 2023 16:13:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8l51=DO=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qPQ65-0003N2-1P
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 16:13:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b89b0293-2d61-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 18:13:42 +0200 (CEST)
Received: from [172.20.10.2] (unknown [37.160.17.225])
 by support.bugseng.com (Postfix) with ESMTPSA id 9A8664EE073F;
 Fri, 28 Jul 2023 18:13:41 +0200 (CEST)
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
X-Inumbo-ID: b89b0293-2d61-11ee-8613-37d641c3527e
Message-ID: <06ea131d-d6d9-33f9-7875-59cfd84a2c2e@bugseng.com>
Date: Fri, 28 Jul 2023 18:13:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] xen/keyhandler: address violations of MISRA C:2012
 Rule 8.3 and drop bool_t
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <7cb2183e6e387c04547b57b6f9f95c08bb613019.1690560051.git.federico.serafini@bugseng.com>
 <1c181873-bb65-46b6-841c-47748662b10a@citrix.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <1c181873-bb65-46b6-841c-47748662b10a@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Andrew,

On 28/07/23 18:04, Andrew Cooper wrote:
> On 28/07/2023 5:02 pm, Federico Serafini wrote:
>> Change types in function declarations to be consistent with the
>> corresponding definitions.
>> This addresses violations of MISRA C:2012 Rule 8.3: "All declarations
>> of an object or function shall use the same names and type qualifiers".
>>
>> No functional changes.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Always glad to see more bool_t disappearing.

in the message body I inverted 'definitions' with 'declarations',
please can you fix it?

Thanks
-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

