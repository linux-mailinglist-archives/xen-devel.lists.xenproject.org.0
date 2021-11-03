Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 871C14441DE
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 13:48:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220873.382300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miFgv-0007mZ-97; Wed, 03 Nov 2021 12:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220873.382300; Wed, 03 Nov 2021 12:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miFgv-0007jk-5i; Wed, 03 Nov 2021 12:48:33 +0000
Received: by outflank-mailman (input) for mailman id 220873;
 Wed, 03 Nov 2021 12:48:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miFgt-0007jc-18
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 12:48:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miFgt-0000Fg-0R
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 12:48:31 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miFgs-0004qw-Vq
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 12:48:30 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1miFgp-0004Fn-AN; Wed, 03 Nov 2021 12:48:27 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=DKrZRkgIcN+WO5szkq5fF7dE3zj4TJ69/V8dI7cyLng=; b=MQJJt9bq0/iYt05YfKi2zPLOQh
	spubKzMOba4iONrd1S0AsIlb13vvBzQwEBAm0RGia7pLTaIoNWFpVF+9u9AMQ4toUq0jRRZ4rv9qo
	j5zQmOap3CoMW5csR69Pexnrgnqs3pmIqXPAH3+z6WClbrvnN9dXgjQlXuML7pleVGMk=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24962.34074.895482.391944@mariner.uk.xensource.com>
Date: Wed, 3 Nov 2021 12:48:26 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [xen-unstable test] 165973: regressions - FAIL
In-Reply-To: <356da0d1-4e13-5122-6fb1-0e1ed01a675d@suse.com>
References: <osstest-165973-mainreport@xen.org>
	<356da0d1-4e13-5122-6fb1-0e1ed01a675d@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [xen-unstable test] 165973: regressions - FAIL"):
> On 02.11.2021 04:07, osstest service owner wrote:
> > flight 165973 xen-unstable real [real]
> > flight 165977 xen-unstable real-retest [real]
> > http://logs.test-lab.xenproject.org/osstest/logs/165973/
> > http://logs.test-lab.xenproject.org/osstest/logs/165977/
> > 
> > Regressions :-(
> > 
> > Tests which did not succeed and are blocking,
> > including tests which could not be run:
> >  test-amd64-amd64-examine      4 memdisk-try-append       fail REGR. vs. 165966
> 
> Ian - another force push may be on order here, as this again ended
> up running on one of the albanas?

I have a series to make this work better in general, which I have just
poshed to osstest pretest.  In the meantime the next flight picked a
different host anyway.

Thanks,
Ian.

