Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF38C812C72
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 11:05:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654384.1021243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDias-0001qC-9Y; Thu, 14 Dec 2023 10:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654384.1021243; Thu, 14 Dec 2023 10:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDias-0001nO-6w; Thu, 14 Dec 2023 10:05:26 +0000
Received: by outflank-mailman (input) for mailman id 654384;
 Thu, 14 Dec 2023 10:05:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i1ex=HZ=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rDiaq-0001nI-EM
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 10:05:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b171102-9a68-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 11:05:22 +0100 (CET)
Received: from [192.168.1.15] (host-82-60-45-193.retail.telecomitalia.it
 [82.60.45.193])
 by support.bugseng.com (Postfix) with ESMTPSA id 9B34C4EE073A;
 Thu, 14 Dec 2023 11:05:21 +0100 (CET)
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
X-Inumbo-ID: 4b171102-9a68-11ee-9b0f-b553b5be7939
Message-ID: <a2729da1-3538-4bbd-a040-2dd05521c5cf@bugseng.com>
Date: Thu, 14 Dec 2023 11:05:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: X86: MISRA C:2012 Rule 5.6
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
 "consulting@bugseng.com" <consulting@bugseng.com>
References: <9de5ec9d-1ebd-4fa9-89d4-e962d7c377e0@bugseng.com>
 <7222b529-ab39-4a18-a448-2a007992b9aa@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <7222b529-ab39-4a18-a448-2a007992b9aa@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/12/23 09:57, Jan Beulich wrote:
> On 13.12.2023 12:44, Federico Serafini wrote:
>> I have another question regarding Rule 5.6 ("A `typedef' name shall be
>> a unique identifier"), this time for X86:
>> the violations left [1] involve guest_intpte_t, guest_l1e_t and
>> guest_l2e_t, which seem to be deliberately defined differently depending
>> on the number of guest paging levels.
>> I would like to propose a deviation for these types, do you agree?
> 
> Yes. In fact I think we said so already when discussing this rule. The
> whole rebuild-same-file-for-multiple-purposes can hardly work without
> something along the lines of multiple ways of defining the same macros
> and/or typedefs for each of the instances.

Thanks for the feedback.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

