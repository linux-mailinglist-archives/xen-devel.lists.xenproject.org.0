Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B96687CC2F
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 12:19:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693805.1082395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5ad-0005m6-Lq; Fri, 15 Mar 2024 11:19:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693805.1082395; Fri, 15 Mar 2024 11:19:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5ad-0005ix-If; Fri, 15 Mar 2024 11:19:07 +0000
Received: by outflank-mailman (input) for mailman id 693805;
 Fri, 15 Mar 2024 11:19:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1mWO=KV=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rl5ac-0005hc-L2
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 11:19:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d596e4f3-e2bd-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 12:19:05 +0100 (CET)
Received: from [172.20.10.8] (unknown [78.211.227.3])
 by support.bugseng.com (Postfix) with ESMTPSA id A21404EE073C;
 Fri, 15 Mar 2024 12:19:04 +0100 (CET)
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
X-Inumbo-ID: d596e4f3-e2bd-11ee-afdd-a90da7624cb6
Message-ID: <4a6f8d2a-9ab7-447c-b9cb-c19e7167174f@bugseng.com>
Date: Fri, 15 Mar 2024 12:19:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: x86/bitops and MISRA C:2012 Rule 5.5
Content-Language: en-US, it
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <42d630c9-e311-4e17-9fae-e14ec81a339e@bugseng.com>
 <9958b4cc-a6a5-4370-b87e-3e2facf7ee5f@citrix.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <9958b4cc-a6a5-4370-b87e-3e2facf7ee5f@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/03/24 12:13, Andrew Cooper wrote:
> On 15/03/2024 11:07 am, Federico Serafini wrote:
>> Hello everyone,
>>
>> there are violations of Rule 5.5 ("Identifiers shall be distinct
>> from macro names") in xen/arch/x86/include/asm/bitops.h.
>> You can see them at [1].
>>
>> Do you agree to distinguish between function-like macros and
>> inline functions by adding a suffix to the functions?
> 
> Please see the other bitops thread, which you're also CC'd on.
> 
> Although it's not got to these functions yet, this is going to be fixed
> by having set_bit() be common, and arch_set_bit() be the per-arch
> implemenation.
> 
> Neither _unsafe nor _nocheck are remotely appropriate here.

Thanks, I missed it.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

