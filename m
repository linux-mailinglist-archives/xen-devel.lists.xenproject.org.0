Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C51586FB9E
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 09:20:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688201.1072114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh3Y2-00060u-DQ; Mon, 04 Mar 2024 08:19:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688201.1072114; Mon, 04 Mar 2024 08:19:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh3Y2-0005yU-A1; Mon, 04 Mar 2024 08:19:46 +0000
Received: by outflank-mailman (input) for mailman id 688201;
 Mon, 04 Mar 2024 08:19:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TG1g=KK=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rh3Y1-0005yO-AN
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 08:19:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4a136f4-d9ff-11ee-afda-a90da7624cb6;
 Mon, 04 Mar 2024 09:19:44 +0100 (CET)
Received: from [192.168.1.113] (93-36-220-117.ip62.fastwebnet.it
 [93.36.220.117])
 by support.bugseng.com (Postfix) with ESMTPSA id 4020F4EE0737;
 Mon,  4 Mar 2024 09:19:43 +0100 (CET)
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
X-Inumbo-ID: f4a136f4-d9ff-11ee-afda-a90da7624cb6
Message-ID: <fb415b35-a383-4327-a858-211ae3b7497f@bugseng.com>
Date: Mon, 4 Mar 2024 09:19:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: add deviation for MISRA C:2012
 Rule 16.6
Content-Language: en-US, it
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <a9027b582d7866a31d7438d083499c53a3245989.1709305397.git.federico.serafini@bugseng.com>
 <87326c7b-b7d8-4072-bced-d902e23134ed@suse.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <87326c7b-b7d8-4072-bced-d902e23134ed@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/03/24 09:04, Jan Beulich wrote:
> On 01.03.2024 16:04, Federico Serafini wrote:
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -322,6 +322,12 @@ Deviations related to MISRA C:2012 Rules:
>>            - /\* Fallthrough \*/
>>            - /\* Fallthrough. \*/
>>   
>> +   * - R16.6
>> +     - A switch statement with a single switch clause and no default label is
>> +       deliberate and improves readability with respect to an equivalent if
>> +       statement.
>> +     - Tagged as `deliberate` for ECLAIR.
> 
> Imo this is another example of wording a deviation in too wide a manner.
> It shouldn't be "is", but "may". Whether what is said here applies is
> entirely down to every specific instance; otherwise I'm inclined to read
> this as a suggestion to replace all if() by switch(), for that always
> improving readability. FTAOD things would be different if this was
> explanatory text to a SAF comment - there the specific context is always
> given (by where the comment actually appears).

Ok, I'll rephrase a v2.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

