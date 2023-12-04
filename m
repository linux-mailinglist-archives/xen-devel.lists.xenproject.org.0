Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 284E9803881
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 16:18:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647109.1009824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAAhk-0001GK-8m; Mon, 04 Dec 2023 15:17:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647109.1009824; Mon, 04 Dec 2023 15:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAAhk-0001Eg-62; Mon, 04 Dec 2023 15:17:52 +0000
Received: by outflank-mailman (input) for mailman id 647109;
 Mon, 04 Dec 2023 15:17:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PiNa=HP=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rAAhi-0001DD-Pe
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 15:17:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 487a5631-92b8-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 16:17:48 +0100 (CET)
Received: from [192.168.1.27] (host-79-46-48-173.retail.telecomitalia.it
 [79.46.48.173])
 by support.bugseng.com (Postfix) with ESMTPSA id E4FB44EE073D;
 Mon,  4 Dec 2023 16:17:47 +0100 (CET)
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
X-Inumbo-ID: 487a5631-92b8-11ee-9b0f-b553b5be7939
Message-ID: <647030e4-a57b-4873-a03a-3279a27553a8@bugseng.com>
Date: Mon, 4 Dec 2023 16:17:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/2] x86/p2m: address a violation of MISRA C:2012 Rule
 8.3
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, xen-devel@lists.xenproject.org
References: <cover.1701344917.git.federico.serafini@bugseng.com>
 <0faaa66465367a9e4c4da5749bc123b832e02103.1701344917.git.federico.serafini@bugseng.com>
 <a330ae4b-7df6-456c-9711-0034a38fc26d@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <a330ae4b-7df6-456c-9711-0034a38fc26d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/23 15:54, Jan Beulich wrote:
> On 30.11.2023 16:48, Federico Serafini wrote:
>> Make function declaration and definition consistent changing
>> parameter name from "gpfn" to "gfn".
>> For consistency, rename also "old_gpfn" to "old_gfn".
>> No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
>> ---
>> This patch depends on patch 1/2 of the same series.
> 
> There's no need to state this, btw. Within a series later patches depending
> on earlier ones if the default. There instead it can help committers if it
> is made clear when patches do not depend on one another (and hence can be
> committed in a order different from the submission's).

Thanks for the information.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

