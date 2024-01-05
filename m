Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA5C82564B
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 16:05:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662190.1032141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLlk8-0000wO-8H; Fri, 05 Jan 2024 15:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662190.1032141; Fri, 05 Jan 2024 15:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLlk8-0000u5-5b; Fri, 05 Jan 2024 15:04:16 +0000
Received: by outflank-mailman (input) for mailman id 662190;
 Fri, 05 Jan 2024 15:04:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7et4=IP=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rLlk6-0000tz-Nh
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 15:04:14 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aeef1894-abdb-11ee-98ef-6d05b1d4d9a1;
 Fri, 05 Jan 2024 16:04:11 +0100 (CET)
Received: from [192.168.1.15] (host-79-44-205-232.retail.telecomitalia.it
 [79.44.205.232])
 by support.bugseng.com (Postfix) with ESMTPSA id E20154EE073F;
 Fri,  5 Jan 2024 16:04:10 +0100 (CET)
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
X-Inumbo-ID: aeef1894-abdb-11ee-98ef-6d05b1d4d9a1
Message-ID: <a6a6ce27-76ad-4304-aaa8-d4cdc8e3badc@bugseng.com>
Date: Fri, 5 Jan 2024 16:04:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 7/7] xen/arm: smmu-v3: address violations of MISRA
 C:2012 Rule 16.3
Content-Language: en-US, it
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1703066935.git.federico.serafini@bugseng.com>
 <93d32bf20bb85b93618be5140edb1be527606b77.1703066935.git.federico.serafini@bugseng.com>
 <0b26cab9-8422-4f5f-ab96-b64a4afbdb24@xen.org>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <0b26cab9-8422-4f5f-ab96-b64a4afbdb24@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Julien,

On 20/12/23 12:49, Julien Grall wrote:
> Hi Federico,
> 
> On 20/12/2023 11:03, Federico Serafini wrote:
>> Add a break statement at the end of the switch-clauses to address
>> violations of MISRA C:2012 Rule 16.3 ("An unconditional `break'
>> statement shall terminate every switch-clause").
>> No funtional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
>

I noticed that this has not yet been committed.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

