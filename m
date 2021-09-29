Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B25FB41CE47
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 23:36:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199314.353289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVhF9-00053I-FI; Wed, 29 Sep 2021 21:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199314.353289; Wed, 29 Sep 2021 21:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVhF9-00051V-BQ; Wed, 29 Sep 2021 21:35:59 +0000
Received: by outflank-mailman (input) for mailman id 199314;
 Wed, 29 Sep 2021 21:35:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mVhF8-00051N-6X
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 21:35:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mVhF8-0001Gi-45
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 21:35:58 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mVhF8-0005kd-2z
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 21:35:58 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mVhF3-0000V3-DA; Wed, 29 Sep 2021 22:35:53 +0100
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
	bh=2LgtL/bOBLKlY+f62iWCjTBNXfxnBCoS7kexrmF43FA=; b=LqkJhR2s/Y1OIzRItC9IVmDCmI
	rmy5MwE6rIK2ROtYrBbOUp7i8KKm/OqPss4HRyW0ssbs85nJULcAXLpdJ0u3b+qSMYnlK3MR2B3t3
	0O79Y6wScIkjm3/lchvb4Pe3Q8MYe5P8igyAdEcJCA0mKd2XWkKmbAylpule0r0dN2VA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24916.56377.137361.34717@mariner.uk.xensource.com>
Date: Wed, 29 Sep 2021 22:35:53 +0100
To: Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien.grall.oss@gmail.com>,
    xen-devel <xen-devel@lists.xenproject.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    dpsmith@apertussolutions.com
Subject: Re: [xen-unstable test] 164996: regressions - FAIL
In-Reply-To: <24915.16323.60012.172236@mariner.uk.xensource.com>
References: <osstest-164996-mainreport@xen.org>
	<d049ba60-db81-aaa4-1769-54c6964cfd06@suse.com>
	<24904.44119.940679.241639@mariner.uk.xensource.com>
	<alpine.DEB.2.21.2109211631330.17979@sstabellini-ThinkPad-T480s>
	<19906cf8-365b-63c9-5c59-aef8dae41505@suse.com>
	<alpine.DEB.2.21.2109221807131.17979@sstabellini-ThinkPad-T480s>
	<CAJ=z9a1W9BqeOGFu3F2+qbXM6UNo8ZO=0y-zYsnK01MNSNdbkw@mail.gmail.com>
	<dda286dc-1edc-4505-a049-e82047b44590@suse.com>
	<24915.16323.60012.172236@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Ian Jackson writes ("Re: [xen-unstable test] 164996: regressions - FAIL"):
> Thanks.  The attachment didn't git-am but I managed to make a tree
> with it in (but a bogus commit message).
> 
> I have a repro of 165218 test-arm64-arm64-libvirt-raw (that's the last
> xen-unstable flight) running.  If all goes well it will rebuild Linux
> from my branch (new flight 165241) and then run the test using that
> kernel (new flight 165242).  I have told it to report to the people on
> this thread (and the list).
> 
> It will probably report in an hour or two (since it needs to rebuild a
> kernel and then negotiate to get a host to run the repro on).
> I didn't ask it to keep the host for me, but it ought to publish the
> logs and as I say, send an email report here.

Restarted as 165323 and 165324.  Maybe the thing won't catch fire this
time.  Unusual consequences for a small kernel patch :-).

Ian.

