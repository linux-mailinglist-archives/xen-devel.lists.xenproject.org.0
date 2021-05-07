Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0573761BE
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 10:14:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123803.233585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1levci-0007aq-AM; Fri, 07 May 2021 08:14:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123803.233585; Fri, 07 May 2021 08:14:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1levci-0007Z1-78; Fri, 07 May 2021 08:14:12 +0000
Received: by outflank-mailman (input) for mailman id 123803;
 Fri, 07 May 2021 08:14:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rJTn=KC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1levcg-0007Ys-1S
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 08:14:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fa8b46ab-451b-4d15-94d9-5a93f7496d9c;
 Fri, 07 May 2021 08:14:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 56D02B12E;
 Fri,  7 May 2021 08:14:07 +0000 (UTC)
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
X-Inumbo-ID: fa8b46ab-451b-4d15-94d9-5a93f7496d9c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620375247; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ouOrfKbce9WN0n8msMSMMyCEi4fK4JyvSh7mKSKsy8s=;
	b=TLVEBQw8PrRVodntv69+s4NPYh3ckQ0bLkmVKUG15fPEcSwQusVO+t1lNZR0mj6caxEkLw
	pWQ7qDuRlJv153jhWlN4beLK2hSXRvzU6qShNH0BEjFLz/DzbfcgYhWvXPCsq3hjumN6Ty
	xJG4RUKt28hPgrtCPok143Fq5VpAJ4A=
Subject: Re: [xen-4.12-testing test] 161776: regressions - FAIL
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>
References: <osstest-161776-mainreport@xen.org>
 <24724.6389.95487.1868@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d0e817e2-4097-239a-ee16-95f23e9ca52d@suse.com>
Date: Fri, 7 May 2021 10:14:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <24724.6389.95487.1868@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.05.2021 18:27, Ian Jackson wrote:
> osstest service owner writes ("[xen-4.12-testing test] 161776: regressions - FAIL"):
>> flight 161776 xen-4.12-testing real [real]
>> flight 161806 xen-4.12-testing real-retest [real]
>> http://logs.test-lab.xenproject.org/osstest/logs/161776/
>> http://logs.test-lab.xenproject.org/osstest/logs/161806/
>>
>> Regressions :-(
>>
>> Tests which did not succeed and are blocking,
>> including tests which could not be run:
>>  test-amd64-amd64-xl-qcow2    19 guest-localmigrate/x10   fail REGR. vs. 159418
> 
> This has been failing for 48 days.
> 
>   http://logs.test-lab.xenproject.org/osstest/logs/161776/test-amd64-amd64-xl-qcow2/19.ts-guest-localmigrate.log
> 
> shows this:
> 
>   libxl: error: libxl_dom_suspend.c:377:suspend_common_wait_guest_timeout: Domain
> 6:guest did not suspend, timed out
> 
> as the first thing that goes wrong.  This is after the guest has
> acknowledged the suspend request.
> 
> osstest tried to bisect it but was not able to reproduce the basis
> pass.  That means either that we got (un)lucky with the basis pass, or
> that something not version-controlled by osstest is responsible.  In
> this case I think the dom0 and domU kernels, as well as the usual
> pieces, are all properly version controlled by osstest.  The non-Xen
> userland tools are not but I doubt they are the cause.
> 
> So I think this is not a real regression.  In lieu of a fix, I propose
> to force push 5984905b2638df87a0262d1ee91f0a6e14a86df6 to stable-4.12.

I did consider this as an option, but I don't think it's this simple.
Neither 4.11 and older nor 4.13 and newer exhibit such behavior. In
fact in 4.12 we appear to see pushes blocked now because there was a
success of this test once, in flight 159418. So while this may not
be a regression within 4.12 (and hence a force push may still be an
appropriate step), there is something wrong there with 4.12, I would
say. It being out of (general) support may of course mean we want to
leave it at that. Better, for the remaining time the branch is in
security-only maintenance state, would of course be to identify the
(presumably) missing backport ... Of course that's easy to say for
me, because I don't think I would realistically be the one to
undertake such an exercise.

Jan

