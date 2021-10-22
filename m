Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C8D4378F8
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 16:21:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215115.374101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdvQE-0003IY-Bp; Fri, 22 Oct 2021 14:21:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215115.374101; Fri, 22 Oct 2021 14:21:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdvQE-0003Gb-8W; Fri, 22 Oct 2021 14:21:26 +0000
Received: by outflank-mailman (input) for mailman id 215115;
 Fri, 22 Oct 2021 14:21:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mdvQC-0003GV-W1
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 14:21:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mdvQC-0005pQ-UE
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 14:21:24 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mdvQC-0006sZ-T5
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 14:21:24 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mdvQ9-0001lG-99; Fri, 22 Oct 2021 15:21:21 +0100
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
	bh=PH5aOSrUL+ee30CSPPXWWOGczmFCRGE5tHNa1SMU4Xg=; b=GXaUGL0FrKCGkG/ALgFAUzI6Cu
	chNQiDWrFGYU/IJX0CMcX5ZBiY9KzA6bLnQrAwYFNDUjZb1UsRez0jSFth52HZes7ozy1gAJXelB6
	28XC51uJf4m+SnJEK290ed8B9BAeU6GB/lMH7OKzFpvdFfiLhPiQ/3RJkN0Cdg4d/kZc=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24946.51424.880154.393018@mariner.uk.xensource.com>
Date: Fri, 22 Oct 2021 15:21:20 +0100
To: jgross@suse.com,
    xen-devel@lists.xenproject.org
Subject: Re: [adhoc test] 165675: truncated
In-Reply-To: <E1mcptl-0002fM-6i@osstest.test-lab.xenproject.org>
References: <E1mcptl-0002fM-6i@osstest.test-lab.xenproject.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

iwj@xenbits.xen.org writes ("[adhoc test] 165675: truncated"):
> [adhoc play] <testing.git (HEAD detached at 14a279c4) /dev/pts/3>
> harness 14a279c4: osstest: explicitly enable building qemu-traditional
> 165675: truncated
> 
> flight 165675 xen-unstable play [play]
> http://logs.test-lab.xenproject.org/osstest/logs/165675/
> 
> Perfect :-)
> All tests in this flight passed as required
> baseline version:
>  flight               165635
> 
> jobs:
>  build-amd64                                                  truncated

I looked at this log

http://logs.test-lab.xenproject.org/osstest/logs/165675/build-amd64/6.ts-xen-build.log

and

+ qemutrad=--enable-qemu-traditional
+ ./configure --sysconfdir=/etc --enable-ovmf --enable-qemu-traditional

So I have pushed your patch to osstest pretest.

Ian.

