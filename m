Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF338BB44E
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 21:44:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716650.1118787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2ypM-0000mi-2d; Fri, 03 May 2024 19:44:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716650.1118787; Fri, 03 May 2024 19:44:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2ypM-0000kP-07; Fri, 03 May 2024 19:44:16 +0000
Received: by outflank-mailman (input) for mailman id 716650;
 Fri, 03 May 2024 19:44:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IauD=MG=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1s2ypK-0000kJ-8i
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 19:44:14 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 845f1ee5-0985-11ef-909c-e314d9c70b13;
 Fri, 03 May 2024 21:44:13 +0200 (CEST)
Received: from [192.168.1.20] (host-79-36-52-167.retail.telecomitalia.it
 [79.36.52.167])
 by support.bugseng.com (Postfix) with ESMTPSA id 3783F4EE0738;
 Fri,  3 May 2024 21:44:12 +0200 (CEST)
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
X-Inumbo-ID: 845f1ee5-0985-11ef-909c-e314d9c70b13
Message-ID: <ecebd04a-1b95-4055-9f1c-a5468cc3bb1a@bugseng.com>
Date: Fri, 3 May 2024 21:44:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Re: [XEN PATCH 0/3] automation/eclair: do not allow
 failure for triggered analyses
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1714401209.git.federico.serafini@bugseng.com>
 <d24c9ef6-a7c8-4ee0-baff-b1585c788db1@citrix.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <d24c9ef6-a7c8-4ee0-baff-b1585c788db1@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/05/24 21:14, Andrew Cooper wrote:
> On 29/04/2024 4:21 pm, Federico Serafini wrote:
>> Patch 1/3 does some preparation work.
>>
>> Patch 2/3, as the title says, removes allow_failure = true for triggered
>> analyses.
>>
>> Patch 3/3 makes explicit that initally no files are tagged as adopted, this
>> is needed by the scheduled analysis.
> 
> I'm afraid that something in this series is broken.
> 
> Since these patches went in, all pipelines are now getting a status of
> blocked rather than passed.
> 
> If I manually start the Eclair jobs, then eventually the pipeline gets
> to Passed.

Can you provide us a link to those failures?
I am looking at gitlab xen-project/xen and xen-project/patchew
and everything seems ok.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

