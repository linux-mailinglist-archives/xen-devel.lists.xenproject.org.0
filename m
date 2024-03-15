Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A20487CAA4
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 10:25:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693711.1082120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl3oF-0007Ye-GH; Fri, 15 Mar 2024 09:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693711.1082120; Fri, 15 Mar 2024 09:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl3oF-0007WR-D4; Fri, 15 Mar 2024 09:25:03 +0000
Received: by outflank-mailman (input) for mailman id 693711;
 Fri, 15 Mar 2024 09:25:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1mWO=KV=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rl3oE-0007WL-Uq
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 09:25:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e61e3328-e2ad-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 10:25:01 +0100 (CET)
Received: from [192.168.1.113] (93-36-220-117.ip62.fastwebnet.it
 [93.36.220.117])
 by support.bugseng.com (Postfix) with ESMTPSA id C3FD54EE073C;
 Fri, 15 Mar 2024 10:25:00 +0100 (CET)
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
X-Inumbo-ID: e61e3328-e2ad-11ee-afdd-a90da7624cb6
Message-ID: <ce16a268-0c78-4635-a90e-247d24bbc8b5@bugseng.com>
Date: Fri, 15 Mar 2024 10:25:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: allow parameter name "unused"
Content-Language: en-US, it
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <f2666bff183d5497b4993fdc27f6a66141ec8d85.1710433895.git.federico.serafini@bugseng.com>
 <f3c56a60-2f66-4d9a-bd29-1e573122080d@suse.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <f3c56a60-2f66-4d9a-bd29-1e573122080d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/03/24 10:12, Jan Beulich wrote:
> On 14.03.2024 17:35, Federico Serafini wrote:
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -157,6 +157,11 @@ Deviations related to MISRA C:2012 Rules:
>>            - xen/common/unxz.c
>>            - xen/common/unzstd.c
>>   
>> +   * - R8.3
>> +     - Parameter name "unused" is deliberate and makes explicit the intention
>> +       of not using the parameter within the function.
>> +     - Tagged as `deliberate` for ECLAIR.
> 
> Before writing this, did you consider what is going to happen when a
> function happens to have more than one unused parameter? They can't all
> be named "unused", so some flexibility is needed here. E.g. by permitting
> a number to be appended.

Right, thanks for the observation.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

