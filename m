Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 844D877F3FE
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 12:02:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585262.916332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWZpO-0002ZE-Gx; Thu, 17 Aug 2023 10:02:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585262.916332; Thu, 17 Aug 2023 10:02:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWZpO-0002XF-E6; Thu, 17 Aug 2023 10:02:06 +0000
Received: by outflank-mailman (input) for mailman id 585262;
 Thu, 17 Aug 2023 10:02:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+wLb=EC=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qWZpM-0002X7-Ng
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 10:02:04 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1da80db4-3ce5-11ee-8779-cb3800f73035;
 Thu, 17 Aug 2023 12:02:03 +0200 (CEST)
Received: from [192.168.1.15] (host-79-55-201-67.retail.telecomitalia.it
 [79.55.201.67])
 by support.bugseng.com (Postfix) with ESMTPSA id 3DC7F4EE0737;
 Thu, 17 Aug 2023 12:02:03 +0200 (CEST)
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
X-Inumbo-ID: 1da80db4-3ce5-11ee-8779-cb3800f73035
Message-ID: <fa50cb01-1d4f-a7e1-28f5-ff765d798e51@bugseng.com>
Date: Thu, 17 Aug 2023 12:02:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v2] misra: add more entires to exclude-list.json
Content-Language: en-US, it
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <186af44774dc4670cb1ca0d8238e0620c3d0fc2f.1692266054.git.federico.serafini@bugseng.com>
 <472241eb-0417-46e8-b713-79586642df55@xen.org>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <472241eb-0417-46e8-b713-79586642df55@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/08/23 11:57, Julien Grall wrote:
> Hi,
> 
> On 17/08/2023 10:55, Federico Serafini wrote:
>> Add entries to the exclude-list.json for those files that need to be
>> excluded from the analysis scan.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> ---
>> Changes in v2:
>> - fixed indentation.
> 
> What's the difference with the other v2 you posted ~10 min ago?
> 
> Is this the patch we need to review? If so, can you review on the 
> previous one to explicitely say it should be ignored.
> 
> Cheers,
> 

There is no difference,
it seems that two mails have been sent,
sorry for that.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

