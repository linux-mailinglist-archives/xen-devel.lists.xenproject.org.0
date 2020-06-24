Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 237C320709A
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 12:02:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo2DR-0001ai-Qx; Wed, 24 Jun 2020 10:01:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hC7e=AF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jo2DQ-0001ad-T2
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 10:01:12 +0000
X-Inumbo-ID: a0590198-b601-11ea-8090-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a0590198-b601-11ea-8090-12813bfff9fa;
 Wed, 24 Jun 2020 10:01:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 48E51AD25;
 Wed, 24 Jun 2020 10:01:08 +0000 (UTC)
Subject: Re: [xen-4.11-testing test] 151295: regressions - FAIL
To: osstest service owner <osstest-admin@xenproject.org>
References: <osstest-151295-mainreport@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a7f16ab8-4c8b-4cef-e767-162199e1b455@suse.com>
Date: Wed, 24 Jun 2020 12:01:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <osstest-151295-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23.06.2020 20:32, osstest service owner wrote:
> flight 151295 xen-4.11-testing real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/151295/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  build-amd64-prev              6 xen-build      fail in 151260 REGR. vs. 150040
>  build-i386-prev               6 xen-build      fail in 151260 REGR. vs. 150040
> 
> Tests which are failing intermittently (not blocking):
>  test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 10 debian-hvm-install fail pass in 151260
> 
> Tests which did not succeed, but are not blocking:

I'm once again struggling to see why there was no push here: The
latter two groups both say "not blocking", and the two build-*-prev
didn't actually fail here, but in an earlier flight. Without
understanding the reason here I'm hesitant to suggest a force push,
though.

Jan

