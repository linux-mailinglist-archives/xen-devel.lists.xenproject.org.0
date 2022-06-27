Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE47755B8D3
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 11:00:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356339.584501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5kbR-0004QD-UI; Mon, 27 Jun 2022 09:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356339.584501; Mon, 27 Jun 2022 09:00:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5kbR-0004Ni-RM; Mon, 27 Jun 2022 09:00:17 +0000
Received: by outflank-mailman (input) for mailman id 356339;
 Mon, 27 Jun 2022 09:00:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o5kbQ-0004Nc-6b
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 09:00:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o5kbP-0006fj-B8; Mon, 27 Jun 2022 09:00:15 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.2.226]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o5kbP-00055g-4Y; Mon, 27 Jun 2022 09:00:15 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=x66fwp7U5pJGbfGG45GupYS/hRJj/Cb1f0e/GfzQ8G4=; b=VP2p12BDeBJZLPufQzbo+jmHbh
	cLuMAr2FMgTmGeH59pHzVp0CTBXfaIRDfqkMC7WQl9gMgdIDK5hRBVzHQ7q3VQT6oEUJhv2rjbk+F
	VObsSWfD9gXnzqlW7oopHBcJsRTChl+xr1QZ6bVVLDJbw3cfWVrcBA9FpAiRkvU+v9ZM=;
Message-ID: <d4dbc687-a6ec-0532-65ea-dbe949f5f93c@xen.org>
Date: Mon, 27 Jun 2022 10:00:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [linux-linus test] 171361: regressions - FAIL
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: osstest service owner <osstest-admin@xenproject.org>,
 Juergen Gross <jgross@suse.com>
References: <osstest-171361-mainreport@xen.org>
 <d9c96d44-ca77-3f96-7da6-301c88695126@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d9c96d44-ca77-3f96-7da6-301c88695126@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 27/06/2022 08:38, Jan Beulich wrote:
> On 27.06.2022 03:38, osstest service owner wrote:
>> flight 171361 linux-linus real [real]
>> http://logs.test-lab.xenproject.org/osstest/logs/171361/
>>
>> Regressions :-(
>>
>> Tests which did not succeed and are blocking,
>> including tests which could not be run:
>>   test-amd64-amd64-dom0pvh-xl-intel  8 xen-boot            fail REGR. vs. 171277
>>   test-amd64-amd64-xl-qemuu-ws16-amd64  8 xen-boot         fail REGR. vs. 171277
>>   test-amd64-amd64-xl-qemut-win7-amd64  8 xen-boot         fail REGR. vs. 171277
>>   test-amd64-amd64-pygrub       8 xen-boot                 fail REGR. vs. 171277
>>   test-amd64-amd64-freebsd11-amd64  8 xen-boot             fail REGR. vs. 171277
>>   test-amd64-amd64-dom0pvh-xl-amd  8 xen-boot              fail REGR. vs. 171277
>>   test-amd64-amd64-qemuu-nested-amd  8 xen-boot            fail REGR. vs. 171277
>>   test-amd64-amd64-xl-qemuu-win7-amd64  8 xen-boot         fail REGR. vs. 171277
>>   test-amd64-amd64-xl-qemut-ws16-amd64  8 xen-boot         fail REGR. vs. 171277
>>   test-amd64-amd64-xl-qemut-debianhvm-i386-xsm  8 xen-boot fail REGR. vs. 171277
>>   test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  8 xen-boot fail REGR. vs. 171277
>>   test-amd64-amd64-xl-qemuu-ovmf-amd64  8 xen-boot         fail REGR. vs. 171277
>>   test-amd64-amd64-xl-xsm       8 xen-boot                 fail REGR. vs. 171277
>>   test-amd64-amd64-xl           8 xen-boot                 fail REGR. vs. 171277
> 
> At the example of this:
> 
> Jun 26 21:51:47.667404 mapping kernel into physical memory
> Jun 26 21:51:47.667425 about to get started...
> Jun 26 21:51:47.667435 (XEN) arch/x86/mm.c:2159:d0v0 Bad L1 flags 400000
> Jun 26 21:51:47.667448 (XEN) Hardware Dom0 halted: halting machine
> 
> This is an attempt to install (modify?) a PTE with _PAGE_GNTTAB set
> via normal page table management hypercalls. Considering how early in
> the boot process this appears to be, I wonder whether a flag was
> introduced in the kernel which aliases _PAGE_GNTTAB (or a use of such
> a pre-existing flag on a path which previously was safe from being hit
> when running in PV mode under Xen).
> 
> I wonder if the bisector is already having a go at isolating the
> offending commit, or whether it had already failed in trying to.

I saw the same issues in my testing. Manually bisection poiunted to:

https://lore.kernel.org/all/22d07a44c80d8e8e1e82b9a806ddc8c6bbb2606e.1654759036.git.jpoimboe@kernel.org/

This is meant to be fixed by:

https://lore.kernel.org/xen-devel/20220623094608.7294-1-jgross@suse.com/

Cheers,

-- 
Julien Grall

