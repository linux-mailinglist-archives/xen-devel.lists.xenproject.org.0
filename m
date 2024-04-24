Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA528B0347
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 09:38:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711221.1111024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzXCM-0000bc-Hf; Wed, 24 Apr 2024 07:37:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711221.1111024; Wed, 24 Apr 2024 07:37:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzXCM-0000Ys-Er; Wed, 24 Apr 2024 07:37:46 +0000
Received: by outflank-mailman (input) for mailman id 711221;
 Wed, 24 Apr 2024 07:37:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S7Hn=L5=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rzXCL-0000XC-3W
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 07:37:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8923ce62-020d-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 09:37:43 +0200 (CEST)
Received: from [192.168.1.11] (host-79-60-221-62.business.telecomitalia.it
 [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 6AF474EE0739;
 Wed, 24 Apr 2024 09:37:42 +0200 (CEST)
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
X-Inumbo-ID: 8923ce62-020d-11ef-b4bb-af5377834399
Message-ID: <816589b3-5c19-4f1f-80b1-b084a0ac5aec@bugseng.com>
Date: Wed, 24 Apr 2024 09:37:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: add deviations for MISRA C:2012
 Rule 16.4
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <4981c3fb0992898a121881333485004f3609eaf7.1713866519.git.federico.serafini@bugseng.com>
 <17c022d9-245b-449f-96c5-7a29ba782880@suse.com>
 <11b8bbbd-1e22-4eb9-b571-cdd5d2661dfc@bugseng.com>
 <1ea60e22-12d9-432d-9ba9-7dd7b2b7d22b@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <1ea60e22-12d9-432d-9ba9-7dd7b2b7d22b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/04/24 18:06, Jan Beulich wrote:
> On 23.04.2024 17:52, Federico Serafini wrote:
>> On 23/04/24 12:26, Jan Beulich wrote:
>>> On 23.04.2024 12:02, Federico Serafini wrote:
>>>> +
>>>> +   * - R16.4
>>>> +     - A switch statement with a single switch clause and no default label may
>>>> +       be used in place of an equivalent if statement if it is considered to
>>>> +       improve readability."
> 
> No, I don't think there should be examples in those documents. But those
> documents should also not (blindly) rely on terminology in the Misra
> spec, as not everyone has access to that (licensed copies had to be
> obtained for quite a few of us).

In deviations.rst there is an identical deviation for Rule 16.6
("Every switch statement shall have at least two switch-clauses").
I think we should remain consistent.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

