Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA54D421299
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 17:23:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201574.356151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXPnn-0007se-Ta; Mon, 04 Oct 2021 15:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201574.356151; Mon, 04 Oct 2021 15:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXPnn-0007qr-Pq; Mon, 04 Oct 2021 15:22:51 +0000
Received: by outflank-mailman (input) for mailman id 201574;
 Mon, 04 Oct 2021 15:22:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mXPnm-0007ql-E5
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 15:22:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mXPnm-0006Sq-71
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 15:22:50 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mXPnm-0001L0-5q
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 15:22:50 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mXPnh-00069f-3w; Mon, 04 Oct 2021 16:22:45 +0100
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
	bh=WmCVz8cIuJXVv4OwZK710il+hN8M1FemURRpKATNDTI=; b=daCVzO0XpmIw5Wtl1E1cz82p3S
	0c5kOA2ecaSwRa88mMQq97qoHMsl8lFptmLfemnkDhEQvu2TjLu0MjBlJ2OK5Tzflv3wulsaOs/nJ
	boYXryHqav5btIi3j+8RkjAunu35ZnnrztLJ3Ng+wq8zDjowrMmJOAP5H8+HmQ7j0TAE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24923.7236.871825.647092@mariner.uk.xensource.com>
Date: Mon, 4 Oct 2021 16:22:44 +0100
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

This was disrupted by the osstest failure.  I'm running it again.
165354 and 165355.

Ian.

For my reference:

./mg-transient-task ./mg-repro-setup -P -Exen-devel@lists.xenproject.org,jbeulich@suse.com,julien.grall.oss@gmail.com,iwj@xenproject.org,sstabellini@kernel.org,dpsmith@apertussolutions.com 165218 test-arm64-arm64-libvirt-raw X --rebuild +linux=https://xenbits.xen.org/git-http/people/iwj/linux.git#164996-fix alloc:'{equiv-rochester,real}

