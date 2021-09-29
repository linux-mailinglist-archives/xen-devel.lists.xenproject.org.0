Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC79141BEED
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 08:04:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198600.352162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVSh0-0000Ub-B1; Wed, 29 Sep 2021 06:03:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198600.352162; Wed, 29 Sep 2021 06:03:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVSh0-0000Sk-78; Wed, 29 Sep 2021 06:03:46 +0000
Received: by outflank-mailman (input) for mailman id 198600;
 Wed, 29 Sep 2021 06:03:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=arYX=OT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mVSgz-0000Se-5L
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 06:03:45 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 007b8d98-20eb-11ec-bcde-12813bfff9fa;
 Wed, 29 Sep 2021 06:03:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 878CD61357;
 Wed, 29 Sep 2021 06:03:43 +0000 (UTC)
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
X-Inumbo-ID: 007b8d98-20eb-11ec-bcde-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632895423;
	bh=lFRzRQMb+/Pr9VGvjQ8zg38ynqeuX82osa/6lfy+IMI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VCiFs3CcgSiOQFR9hzwmxELpaXptRjaX5TxOSCbMADZlvvbloQN2Xo7763Lsdmn2L
	 4LBLnj9XPOC7b701ev54efCkrx1NLIPsllzYMUfT5LN1xQezQT8xtZjBQhTY9Q5FBl
	 Bf8LxK4P+YcswJwhFTRhnk5QwToLf1ZI4/fWXohGf/eGny2uvAd/K4YG5vT2bbtlRC
	 yXiMeRlhOLylHbjs827ioOOOKMLEuyN2pXsmCzhoDiRC2oDIN+yo906YmcluGKfju4
	 DGqO4+4y+U1E+wctLDlfzwhzQLmT5WfNXACL3NGXE/qzrV+ZtRooWABElaWKsSjbCx
	 9Nd/BBetrriQw==
Date: Tue, 28 Sep 2021 23:03:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: iwj@xenbits.xen.org
cc: xen-devel@lists.xenproject.org, jbeulich@suse.com, 
    julien.grall.oss@gmail.com, iwj@xenproject.org, sstabellini@kernel.org, 
    dpsmith@apertussolutions.com
Subject: Re: [adhoc test] 165241: all pass
In-Reply-To: <E1mVGlH-0006re-DA@osstest.test-lab.xenproject.org>
Message-ID: <alpine.DEB.2.21.2109282301540.5022@sstabellini-ThinkPad-T480s>
References: <E1mVGlH-0006re-DA@osstest.test-lab.xenproject.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

That's great, Ian.

Should I go ahead and add the patch to linux-arm-xen? Or do you want to
do it?


On Tue, 28 Sep 2021, iwj@xenbits.xen.org wrote:
> [adhoc adhoc] <testing.git master /dev/pts/25>
> harness 3a3089c9: mfi-common: Drop Linux dom0 i386 tests for newer Lin...
> 165241: all pass
> 
> flight 165241 xen-unstable adhoc [adhoc]
> http://logs.test-lab.xenproject.org/osstest/logs/165241/
> 
> Perfect :-)
> All tests in this flight passed as required
> 
> jobs:
>  build-arm64-pvops                                            pass    
> 
> 
> ------------------------------------------------------------
> sg-report-flight on osstest.test-lab.xenproject.org
> logs: /home/logs/logs
> images: /home/logs/images
> 
> Logs, config files, etc. are available at
>     http://logs.test-lab.xenproject.org/osstest/logs
> 
> Explanation of these reports, and of osstest in general, is at
>     http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
>     http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master
> 
> Test harness code can be found at
>     http://xenbits.xen.org/gitweb?p=osstest.git;a=summary
> 

