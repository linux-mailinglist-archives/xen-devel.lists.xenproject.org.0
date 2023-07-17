Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CC275633F
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 14:52:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564522.881999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLNhx-0002uA-3a; Mon, 17 Jul 2023 12:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564522.881999; Mon, 17 Jul 2023 12:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLNhx-0002rw-0y; Mon, 17 Jul 2023 12:52:09 +0000
Received: by outflank-mailman (input) for mailman id 564522;
 Mon, 17 Jul 2023 12:52:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LRey=DD=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qLNhv-0002ra-Gq
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 12:52:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbdcb5a6-24a0-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 14:52:06 +0200 (CEST)
Received: from [192.168.1.100] (unknown [37.163.206.54])
 by support.bugseng.com (Postfix) with ESMTPSA id 1925A4EE0739;
 Mon, 17 Jul 2023 14:52:04 +0200 (CEST)
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
X-Inumbo-ID: bbdcb5a6-24a0-11ee-b23a-6b7b168915f2
Message-ID: <60cc8da1-47ef-fc0b-d77d-a8a559a2dbd3@bugseng.com>
Date: Mon, 17 Jul 2023 14:51:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Violations of mandatory MISRA C:2012 Rule 19.1 in X86_64 build
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: xen-devel@lists.xenproject.org
References: <fa2bc5da-b866-05ac-409f-c26e025428c3@bugseng.com>
 <747d6fc3-f20e-924d-5eab-5c387ffe439e@suse.com>
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
In-Reply-To: <747d6fc3-f20e-924d-5eab-5c387ffe439e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17/07/23 14:42, Jan Beulich wrote:
> On 11.07.2023 18:40, Roberto Bagnara wrote:
>> Mandatory Rule 19.1 (An object shall not be assigned or copied to an
>> overlapping object) is directly targeted at two undefined behaviors,
>> one of which is the subject of 6.5.16.1p3, namely:
>>
>>     If the value being stored in an object is read from another object
>>     that overlaps in any way the storage of the first object, then the
>>     overlap shall be exact and the two objects shall have qualified or
>>     unqualified versions of a compatible type; otherwise, the behavior
>>     is undefined.
>>
>> You can see a number of definite violations in the X86_64 build
>> at this link:
>>
>>     https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/origin/staging/X86_64-Set1/149/PROJECT.ecd;/by_service/MC3R1.R19.1.html
> 
> After having agreed among the x86 maintainers to switch to using casts
> there, I tried to access this list again, just to find that now I'm
> getting back "Cannot open database". I know you said this would go
> away after a couple of weeks, but it's less than one wee that has
> passed. I'll try to go from memory when making the patch, but of
> course I may miss instances ...
> 
> Jan
> 

I can generate a new database with just this rule, and we will 
definitely extend the period these artifacts will remain available.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

