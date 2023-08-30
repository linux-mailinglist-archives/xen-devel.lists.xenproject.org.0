Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B636D78D42F
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 10:46:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592778.925605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbGq6-0005YT-2Y; Wed, 30 Aug 2023 08:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592778.925605; Wed, 30 Aug 2023 08:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbGq5-0005X6-W2; Wed, 30 Aug 2023 08:46:13 +0000
Received: by outflank-mailman (input) for mailman id 592778;
 Wed, 30 Aug 2023 08:46:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gtsd=EP=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qbGq4-0005Ww-NJ
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 08:46:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a93c12da-4711-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 10:46:08 +0200 (CEST)
Received: from [192.168.8.109] (unknown [151.36.90.25])
 by support.bugseng.com (Postfix) with ESMTPSA id AB51D4EE0738;
 Wed, 30 Aug 2023 10:46:06 +0200 (CEST)
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
X-Inumbo-ID: a93c12da-4711-11ee-8783-cb3800f73035
Message-ID: <ceab0d73-229e-01b0-731c-39ccbeaca6b1@bugseng.com>
Date: Wed, 30 Aug 2023 10:46:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 01/13] misra: add deviation for headers that
 explicitly avoid guards
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, sstabellini@kernel.org
Cc: consulting@bugseng.com, Doug Goldstein <cardoe@cardoe.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
 <9b8165105c28f8e684844f56814726498e34c46e.1693228255.git.simone.ballarin@bugseng.com>
 <25c0c12b-c851-d688-28c8-19eea756fef1@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <25c0c12b-c851-d688-28c8-19eea756fef1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/08/23 08:33, Jan Beulich wrote:
> On 28.08.2023 15:19, Simone Ballarin wrote:
>> --- a/docs/misra/rules.rst
>> +++ b/docs/misra/rules.rst
>> @@ -60,7 +60,8 @@ maintainers if you want to suggest a change.
>>        - Precautions shall be taken in order to prevent the contents of a
>>          header file being included more than once
>>        - Files that are intended to be included more than once do not need to
>> -       conform to the directive
>> +       conform to the directive. Files that explicitly avoid inclusion guards
>> +       under specific circumstances do not need to conform the directive.
> 
> Nit: There's a "to" missing near the end of the added sentence. Can likely
> be taken care of while committing, since Stefano has already ack-ed this,
> but I'd like to still raise the question of the utility of this statement:
> How is one to know whether omission of guards is intentional?

As suggested by Stefano, this kind of deviation should be done using
the format specified in safe.json, and I will follow his suggestion in 
the next submission. The statement will disappear.

> 
> Jan
> 
> 
> 

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


