Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 966EF771CD1
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 11:03:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577869.904954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSw8q-0000WE-1k; Mon, 07 Aug 2023 09:03:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577869.904954; Mon, 07 Aug 2023 09:03:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSw8p-0000UX-V6; Mon, 07 Aug 2023 09:03:07 +0000
Received: by outflank-mailman (input) for mailman id 577869;
 Mon, 07 Aug 2023 09:03:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FiBK=DY=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qSw8o-0000UO-JR
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 09:03:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38a5eda8-3501-11ee-b27d-6b7b168915f2;
 Mon, 07 Aug 2023 11:03:05 +0200 (CEST)
Received: from [192.168.1.15] (host-79-35-203-138.retail.telecomitalia.it
 [79.35.203.138])
 by support.bugseng.com (Postfix) with ESMTPSA id 2B7334EE0737;
 Mon,  7 Aug 2023 11:03:05 +0200 (CEST)
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
X-Inumbo-ID: 38a5eda8-3501-11ee-b27d-6b7b168915f2
Message-ID: <3abb05c9-93b8-3a0c-3a57-4d8fd89bfc14@bugseng.com>
Date: Mon, 7 Aug 2023 11:03:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] x86: Address violations of MISRA C:2012 and drop
 bool_t
Content-Language: en-US, it
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <2cd78bd0d39b36fe73e87cd1011658a54c2c729d.1691158092.git.federico.serafini@bugseng.com>
 <41d5d8aa-c936-2024-b738-2df5242513ec@suse.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <41d5d8aa-c936-2024-b738-2df5242513ec@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/08/23 10:44, Jan Beulich wrote:
> On 04.08.2023 16:11, Federico Serafini wrote:
>> Give a name to unnamed parameters to address violations of
>> MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
>> named parameters").
>> Keep consistency between object and function declarations thus
>> addressing violations of MISRA C:2012 Rule 8.3 ("All declarations of an
>> object or function shall use the same names and type qualifiers").
>> Replace the occurrences of bool_t with bool.
> 
> Hmm, I read the title as a promise that bool_t would be gone from the
> code base (which I couldn't really believe). Perhaps "... by replacing
> bool_t uses"?

Sounds good to me.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

