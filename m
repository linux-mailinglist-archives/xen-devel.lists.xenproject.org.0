Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E69D421433
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 18:36:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201602.356183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXQwu-0007zV-Qa; Mon, 04 Oct 2021 16:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201602.356183; Mon, 04 Oct 2021 16:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXQwu-0007xi-NL; Mon, 04 Oct 2021 16:36:20 +0000
Received: by outflank-mailman (input) for mailman id 201602;
 Mon, 04 Oct 2021 16:36:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mXQws-0007xc-MA
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 16:36:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mXQws-0008E2-5x
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 16:36:18 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mXQws-0007Rm-4s
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 16:36:18 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mXQwq-0006JB-Eu; Mon, 04 Oct 2021 17:36:16 +0100
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:To:Date:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=J+A+dJc9NQ1vxPcmG92HlCZ1+ykOPq6IrZjabbIK8Ek=; b=S/JzVE8atBDOfHEtJSeAzuRMsw
	6FViQPtSNWvj6K/OYErj4yirbP9XUKEbxwHeImwmA1js5BALfA0ceplX7BEad25tCFhOMVUKnP6fd
	WmxIvp3DSD4lS/3D/lL/nOBKfWZR5gVJtwGQmalz2Rfd7ERe2c81Ta1EB/zTZlBH8WHE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24923.11648.199884.55909@mariner.uk.xensource.com>
Date: Mon, 4 Oct 2021 17:36:16 +0100
To: xen-devel@lists.xenproject.org,
    jbeulich@suse.com,
    julien.grall.oss@gmail.com,
    iwj@xenproject.org,
    sstabellini@kernel.org,
    dpsmith@apertussolutions.com
Subject: Re: [adhoc test] 165354: all pass
In-Reply-To: <E1mXQpU-0003hw-A4@osstest.test-lab.xenproject.org>
References: <E1mXQpU-0003hw-A4@osstest.test-lab.xenproject.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

iwj@xenbits.xen.org writes ("[adhoc test] 165354: all pass"):
> [adhoc adhoc] <testing.git master /dev/pts/39>
> harness 3a3089c9: mfi-common: Drop Linux dom0 i386 tests for newer Lin...
> 165354: all pass
> 
> flight 165354 xen-unstable adhoc [adhoc]
> http://logs.test-lab.xenproject.org/osstest/logs/165354/
> 
> Perfect :-)
> All tests in this flight passed as required
> 
> jobs:
>  build-arm64-pvops                                            pass    

I botched the host allocation syntax and I'm having to run this
again...

Ian.

