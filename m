Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F9E588BB5
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 14:02:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379856.613688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJD4s-0004ar-KW; Wed, 03 Aug 2022 12:02:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379856.613688; Wed, 03 Aug 2022 12:02:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJD4s-0004Yi-Hc; Wed, 03 Aug 2022 12:02:18 +0000
Received: by outflank-mailman (input) for mailman id 379856;
 Wed, 03 Aug 2022 12:02:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oJD4q-0004YW-LO
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 12:02:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJD4o-0007Z2-FM; Wed, 03 Aug 2022 12:02:14 +0000
Received: from [54.239.6.189] (helo=[10.7.237.20])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJD4o-0001Io-9n; Wed, 03 Aug 2022 12:02:14 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=tqqqxGtEV4G+2l+h9SD9LaY+UvqrDzHj83h+UhNhUGU=; b=f2pnLN8G09efuCZElEHHYjnUVl
	aSotKt6nKFfvysmHF6X5wj83z0TV8I1BU/PNB9q+VAWZFeDwvom+ZgpfoNbw6+VTN677SgENWokQb
	IFMS1BvXLKOozEiB5y+PAxwQiFl6H3/5+UcMHyOsAlMaQF1HH6p3DTA6S1qGUMXw6fQA=;
Message-ID: <9a72a1ef-c332-7dd3-b84d-baf34f9d7d9f@xen.org>
Date: Wed, 3 Aug 2022 13:02:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [xen-unstable test] 172089: regressions - FAIL
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <osstest-172089-mainreport@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <osstest-172089-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 03/08/2022 08:13, osstest service owner wrote:
> flight 172089 xen-unstable real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/172089/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>   build-i386-libvirt            6 libvirt-build            fail REGR. vs. 172073
>   build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 172073
>   build-arm64-libvirt           6 libvirt-build            fail REGR. vs. 172073

I was going to force this flight because of the libvirt issues. But...

>   test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 172073

... this is not a test related to libvirt. Can one of the x86 folks 
advise whether the issue is benign?

Cheers,

-- 
Julien Grall

