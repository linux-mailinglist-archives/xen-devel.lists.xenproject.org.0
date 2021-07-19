Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B544F3CD082
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jul 2021 11:21:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158236.291414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5PS7-0004Jj-Mo; Mon, 19 Jul 2021 09:20:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158236.291414; Mon, 19 Jul 2021 09:20:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5PS7-0004H6-Jd; Mon, 19 Jul 2021 09:20:43 +0000
Received: by outflank-mailman (input) for mailman id 158236;
 Mon, 19 Jul 2021 09:20:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m5PS5-0004Gz-W2
 for xen-devel@lists.xenproject.org; Mon, 19 Jul 2021 09:20:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m5PS4-0006w3-VT; Mon, 19 Jul 2021 09:20:40 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m5PS4-00033w-PS; Mon, 19 Jul 2021 09:20:40 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=EkFWSLO+49FC0vj71lDD+IMDn4IAy9X6kP3i5CkJE80=; b=fyWDgBEpWuC7JiiG5DP2/n7lvc
	fvAsZdBlLuM5IvfqbpwpJTZeXdYOZKVmA27eVWYK7KmYR2oo6rQfvrzQ4nxSufQpjHgCNxp0XHtBC
	qBxPvvmNwQ1hRWFwpLPNTWWciOV8Dff/bobfFpObIgDULOHUw/EK4avz+aNlhOQNrApQ=;
Subject: Re: [xen-unstable test] 163782: regressions - FAIL
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <osstest-163782-mainreport@xen.org>
 <6f3dfbdf-e5f9-f1fb-4cd9-a42adee73e30@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <34190a82-98a3-44b6-fac5-6ddfef6a3738@xen.org>
Date: Mon, 19 Jul 2021 10:20:38 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <6f3dfbdf-e5f9-f1fb-4cd9-a42adee73e30@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 19/07/2021 08:04, Jan Beulich wrote:
> All,

Hi Jan,

> On 19.07.2021 04:38, osstest service owner wrote:
>> flight 163782 xen-unstable real [real]
>> flight 163791 xen-unstable real-retest [real]
>> http://logs.test-lab.xenproject.org/osstest/logs/163782/
>> http://logs.test-lab.xenproject.org/osstest/logs/163791/
>>
>> Regressions :-(
>>
>> Tests which did not succeed and are blocking,
>> including tests which could not be run:
>>   test-amd64-amd64-qemuu-nested-amd 16 xen-boot/l1         fail REGR. vs. 163458
> 
> as Andrew has indicated to me that he cannot predict when he'd be able
> to look at "[PATCH] x86/AMD: adjust SYSCFG, TOM, etc exposure to deal
> with running nested" [1], which I expect will take care of this test
> failure (preventing a push), would anyone of you feel in the position
> to review that change?
I agree that it should solve the issue caught by OSSTest. The patch 
looks fine to me, so I gave my reviewed-by.

Cheers,

-- 
Julien Grall

