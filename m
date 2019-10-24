Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8D0E3AF5
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 20:28:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNhn6-0004h2-UI; Thu, 24 Oct 2019 18:24:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rm0f=YR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iNhn5-0004gx-3k
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 18:24:55 +0000
X-Inumbo-ID: 93314fa6-f68b-11e9-8aca-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93314fa6-f68b-11e9-8aca-bc764e2007e4;
 Thu, 24 Oct 2019 18:24:54 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7C84520684;
 Thu, 24 Oct 2019 18:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571941493;
 bh=7HxQFkEPdS3o/8BxWnQxLJzBei1dlG3UdU+D35kMK7Y=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=UFAvDHyAXfbSoAP6R2W9fyFTF4ASrjOEZdpvscSTCjXSZ0Ix+pNNzFZVUF1m5cwBs
 h6HemBA0lKk78V70epTNZFmVysI2ZQ/4FjgLPiroyBreYzz3D385XKyKkIPud/kJnJ
 iPZfU+iuJ8/5dbWkWDeB7Wwnk2nRWA5z3lFbhPC0=
Date: Thu, 24 Oct 2019 11:24:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <e0864a74-876d-73ab-f6f1-de4b41d35bf4@arm.com>
Message-ID: <alpine.DEB.2.21.1910241105580.3633@sstabellini-ThinkPad-T480s>
References: <osstest-143061-mainreport@xen.org>
 <45b32f7a-4dcd-c576-4d3f-387cec4d91e2@suse.com>
 <e0864a74-876d-73ab-f6f1-de4b41d35bf4@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-2008138694-1571941461=:3633"
Content-ID: <alpine.DEB.2.21.1910241124270.3633@sstabellini-ThinkPad-T480s>
Subject: Re: [Xen-devel] [xen-unstable test] 143061: regressions - trouble:
 broken/fail/pass
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: =?UTF-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 osstest service owner <osstest-admin@xenproject.org>, brian.woods@xilinx.com,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2008138694-1571941461=:3633
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.1910241124271.3633@sstabellini-ThinkPad-T480s>

On Thu, 24 Oct 2019, Julien Grall wrote:
> (+Ian and Stefano)
> 
> Hi,
> 
> On 10/24/19 8:13 AM, Jürgen Groß wrote:
> > On 24.10.19 08:47, osstest service owner wrote:
> > > flight 143061 xen-unstable real [real]
> > > http://logs.test-lab.xenproject.org/osstest/logs/143061/
> > > 
> > > Regressions :-(
> > > 
> > > Tests which did not succeed and are blocking,
> > > including tests which could not be run:
> > >   test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm    <job status>  
> > > broken
> > >   test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 4 host-install(4)
> > > broken REGR. vs. 142750
> > 
> > Why is Linux kernel 5.4.0-rc4 being used for testing xen-unstable here?
> > Or am I reading the logs wrong?
> > 
> > >   test-arm64-arm64-examine    11 examine-serial/bootloader fail REGR. vs.
> > > 142750
> > 
> > I'm not sure what has gone wrong here? The serial logs seem to be fine
> > for me, but maybe I'm missing something?
> 
> This is a known issue on rochesters for the past 6 months (see [1]). In short,
> Osstest is checking the sanity of the platform by adding cookie in the
> bootloader output. However, this cookie is lost.
> 
> Stefano promised to investigate it back then. Last time I heard, he had access
> to the colo. Stefano where are we with this?
> 
> Cheers,
> 
> [1] https://lists.xen.org/archives/html/xen-devel/2019-05/msg00018.html

I haven't had any time to look at this so far yet unfortunately, I am on
the hot path for too many things at the moment. If somebody else would
like to step forward in analyzing the issue they would be very welcome.

And I do have a suggestion for somebody else to pick this up: Brian
(CC'ed) has joined Xilinx recently and might be willing to help on this.
However, we would need to give him access to the colo for him to be able
to make any progress.
--8323329-2008138694-1571941461=:3633
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-2008138694-1571941461=:3633--

