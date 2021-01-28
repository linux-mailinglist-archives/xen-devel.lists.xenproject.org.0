Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2D73077FD
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 15:26:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77078.139409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l58Fp-0005Rg-Js; Thu, 28 Jan 2021 14:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77078.139409; Thu, 28 Jan 2021 14:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l58Fp-0005RH-Gn; Thu, 28 Jan 2021 14:26:37 +0000
Received: by outflank-mailman (input) for mailman id 77078;
 Thu, 28 Jan 2021 14:26:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l58Fn-0005RC-Jc
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 14:26:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l58Fn-0007OV-Is
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 14:26:35 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l58Fn-0007GV-Hm
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 14:26:35 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l58Fi-0004XJ-Qh; Thu, 28 Jan 2021 14:26:30 +0000
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
	bh=DWvunvAhXPdHyLl1Zq+lFl/s2vTQCtLafeibSV/i43M=; b=2KxOyVMPQsJI28SaDG/TU1XaB6
	C+nsEkPwTdaDtyf2hq4SCLrEq81NH0rAQxrbT65rt8I3qqfJiIIVxKXhOC/bm5g8AoEP06paLMCgG
	mQtWG/YIWmCG5BM7Dth1J6QBPsuQdqtomx9U6VtoPFkdgElChjNDScvn3fGsCAHlHVvM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24594.51606.52336.298888@mariner.uk.xensource.com>
Date: Thu, 28 Jan 2021 14:26:30 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Edwin Torok <edvin.torok@citrix.com>,
    <xen-devel@lists.xenproject.org>,
    Christian Lindig <christian.lindig@citrix.com>,
    =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
    Wei Liu <wl@xen.org>
Subject: Re: [OSSTEST PATCH 7/7] make-flight: Stripy xenstored [and 2 more
 messages]
In-Reply-To: <98d9c63f-030b-6de8-0d29-37d950b0a595@citrix.com>
References: <20210122155603.23402-1-iwj@xenproject.org>
	<20210122155603.23402-7-iwj@xenproject.org>
	<8b231075e5ed13412f98881c3b3454d9abf9e871.camel@citrix.com>
	<81f92e66-3a43-dea8-f633-2fcf725c10dc@citrix.com>
	<0361ffd5-a640-ac59-c222-4a2d5a9a4727@citrix.com>
	<24586.64456.905401.474099@mariner.uk.xensource.com>
	<a436baeb-888e-a213-2a68-6817309a6b2a@citrix.com>
	<24587.3400.673049.196349@mariner.uk.xensource.com>
	<98d9c63f-030b-6de8-0d29-37d950b0a595@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [OSSTEST PATCH 7/7] make-flight: Stripy xenstored [and 2 more messages]"):
> Well - I ask specifically because there is a thread on xen-devel about
> upping the minimum supported version of Ocaml, in order to simplify a
> couple of aspects.
> 
> This would manifest as oxenstored no longer building on older distros. 
> (I've got no idea if the specific suggestion would impact OSSTest this
> time.)

I wasn't aware of that.  So, noted, thanks.

> For now - lets just fix our testing gap.

This series is in osstest production now and happily did not reveal
any previously-masked problems with C xenstored!

Ian.

