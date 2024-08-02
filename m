Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7AE945953
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 09:56:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770282.1181240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZn8l-0002cx-96; Fri, 02 Aug 2024 07:55:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770282.1181240; Fri, 02 Aug 2024 07:55:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZn8l-0002Zg-5c; Fri, 02 Aug 2024 07:55:55 +0000
Received: by outflank-mailman (input) for mailman id 770282;
 Fri, 02 Aug 2024 07:55:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1sZn8j-0002Z3-Ml
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 07:55:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>)
 id 1sZn8h-0007ii-Qw; Fri, 02 Aug 2024 07:55:51 +0000
Received: from [82.67.99.167] (helo=l14) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <anthony@xenproject.org>)
 id 1sZn8h-0006fL-GB; Fri, 02 Aug 2024 07:55:51 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=tDYpX8OhgU2vDn6+kaLICvGCmzz7oNc/vpEca54/QPg=; b=n7GNzGiJXGytPspkEb/geFsItm
	IcbohDc3YQhclt9femLcYQHoB/ksU5ZbZzEVd9OnrcoKOzfPlXY73jMN1jyT7AXJhu2AYiIL9xc9z
	u/YhU9E8l/12l3CuBBV08TANF6kKfIPKsqahOu4MfJ5gErJB1Hy8t9SfIRiUEFvN5dUI=;
Date: Fri, 2 Aug 2024 09:55:49 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	osstest service owner <osstest-admin@xenproject.org>
Subject: Re: [xen-4.19-testing test] 187097: regressions - FAIL
Message-ID: <ZqyRBbeY8KAzdjXV@l14>
References: <osstest-187097-mainreport@xen.org>
 <73902a85-2750-4684-b6f5-33dd67c72172@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73902a85-2750-4684-b6f5-33dd67c72172@suse.com>

On Fri, Aug 02, 2024 at 08:33:09AM +0200, Jan Beulich wrote:
> On 01.08.2024 23:38, osstest service owner wrote:
> > flight 187097 xen-4.19-testing real [real]
> > flight 187112 xen-4.19-testing real-retest [real]
> > http://logs.test-lab.xenproject.org/osstest/logs/187097/
> > http://logs.test-lab.xenproject.org/osstest/logs/187112/
> > 
> > Regressions :-(
> > 
> > Tests which did not succeed and are blocking,
> > including tests which could not be run:
> >  test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop       fail REGR. vs. 187044
> 
> Hmm, this is now pretty persistent in failing. Yet none of the changes
> under test should have affected behavior in any way. Ideas, anyone?

This test passed only a single time, across all branches in the last
year. And that happen to be on the new stable branch.

http://logs.test-lab.xenproject.org/osstest/results/history/test-amd64-amd64-xl-qemut-ws16-amd64/ALL.html

The success rate is incredebly low.

force-push ?

Cheers,

-- 
Anthony PERARD

