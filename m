Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D777F83AE
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 20:19:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640903.999697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6bi8-0006t8-Tj; Fri, 24 Nov 2023 19:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640903.999697; Fri, 24 Nov 2023 19:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6bi8-0006qF-Qs; Fri, 24 Nov 2023 19:19:32 +0000
Received: by outflank-mailman (input) for mailman id 640903;
 Fri, 24 Nov 2023 19:19:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SB6C=HF=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1r6bi6-0006q7-OZ
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 19:19:30 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 637c070e-8afe-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 20:19:29 +0100 (CET)
Received: from [192.168.1.9] (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 166594EE073C;
 Fri, 24 Nov 2023 20:19:28 +0100 (CET)
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
X-Inumbo-ID: 637c070e-8afe-11ee-98e2-6d05b1d4d9a1
Message-ID: <6b2c0903-7225-4644-858e-e26146cb9e74@bugseng.com>
Date: Fri, 24 Nov 2023 20:19:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] xen: address violations of MISRA C:2012 Rule 11.8
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, maria.celeste.cesario@bugseng.com,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1700842832.git.maria.celeste.cesario@bugseng.com>
 <b8e0926a-bb63-4227-a5d5-3fb9f4a1bf49@citrix.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <b8e0926a-bb63-4227-a5d5-3fb9f4a1bf49@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/11/23 18:56, Andrew Cooper wrote:
> On 24/11/2023 4:29 pm, Simone Ballarin wrote:
>> Maria Celeste Cesario (5):
>>    x86/platform_hypercall: address violations of MISRA C:2012 Rule 11.8
>>    x86/boot/reloc: address violations of MISRA C:2012 Rule 11.8
>>    AMD/IOMMU: address violations of MISRA C:2012 Rule 11.8
>>    x86/atomic: address violations of MISRA C:2012 Rule 11.8
>>    xen/arm: address violations of MISRA C:2012 Rule 11.8
> 
> Patches 1,2,4 Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Patch 3 I'm happy to fix on commit if you're happy with the suggestion.

Yes, the change is fine. Thanks!

> 
> ~Andrew
> 

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


