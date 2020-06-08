Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0B61F1BD1
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 17:15:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiJUk-0006uL-4C; Mon, 08 Jun 2020 15:15:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iXsd=7V=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jiJUi-0006uG-MC
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 15:15:24 +0000
X-Inumbo-ID: dfbad9ec-a99a-11ea-96fb-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dfbad9ec-a99a-11ea-96fb-bc764e2007e4;
 Mon, 08 Jun 2020 15:15:23 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: iUCmOXMdZG+HF4p9TX04tVXlCNTQQYV4PuUveK3lr/b7BcmdnOY+lIk2xHnEccd71XpE8PW3ef
 TOHd2pNaR/x/vUWktFTUH/QWbl8dLzOHmxuoPgXaRQ/6WxSYOReTBWb8hFaiFwTDU+qe+ZXqLt
 5CMi7dTza1erwETLhiX0XZ4em21DnUVr4+8sAWv4f+Qvs5rSBDQmnVpkQEwknAigEFa8Jzo7P6
 a7heS3orSCzPNTiNO6Niub2of3gnXnCYChdqztNFglCCrUL8SGXvxglkUMGvACGGgmNBihj386
 BSA=
X-SBRS: 2.7
X-MesageID: 20244468
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,487,1583211600"; d="scan'208";a="20244468"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <24286.22007.498299.812546@mariner.uk.xensource.com>
Date: Mon, 8 Jun 2020 16:15:03 +0100
To: "paul@xen.org" <paul@xen.org>
Subject: Re: 4.14.0-rc1 blocked on goland build failure - decision needed [and
 1 more messages]
In-Reply-To: <24286.20279.622221.291800@mariner.uk.xensource.com>,
 <4DD3680F-7EE6-4C97-B070-DFFE86AE7D4A@citrix.com>
References: <005201d635a9$2b9bbc20$82d33460$@xen.org>
 <2C4D8F6A-1498-4F13-923C-AAF2960D531F@citrix.com>
 <007401d635c2$6b14a150$413de3f0$@xen.org>
 <001201d63b5b$d8ebe7d0$8ac3b770$@xen.org>
 <DC327618-2416-47D9-832E-AE8198060A97@citrix.com>
 <002901d63d7f$2301a6a0$6904f3e0$@xen.org>
 <24286.12984.247498.799575@mariner.uk.xensource.com>
 <003001d63d93$9a4bbcf0$cee336d0$@xen.org>
 <24286.18072.880121.172973@mariner.uk.xensource.com>
 <003301d63d9e$97de3e60$c79abb20$@xen.org>
 <24286.20279.622221.291800@mariner.uk.xensource.com>
 <24286.20424.998938.535648@mariner.uk.xensource.com>
 <4DD3680F-7EE6-4C97-B070-DFFE86AE7D4A@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Nick Rosbrook <rosbrookn@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ian Jackson writes ("4.14.0-rc1 blocked on goland build failure - decision needed"):
> Hi, Paul.  For those on xen-devel: context is that Paul asked me to
> cut 4.14.0-rc1.  The checklist asks me to perform a test build.
> 
> My 32-bit tools test build failed.  I think the problem is probably
> specific to 32-bit userland on 64-bit Linux kernel.  I will send a
> second followup mail not CC Paul with technical details.

George Dunlap writes ("Re: 4.14.0-rc1 blocked on goland build failure - decision needed"):
> Actually, I don’t think this has anything to do with 32-bit userspace, but instead has to do with the version of go: The version in stretch is 1.7 and chokes on this for some reason.  I haven’t had time to track down why.  It does work for golang 1.11.
> 
> Options are:
> 
> 1. Document that if you have a version of golang older than 1.11, you need to add `—disable-golang` 

I suggest we do this for -rc1 and then consider our options.

I have added this option to my pre-release test build and the build
works now.

> 2. Modify configure to check for the go version, and only enable if the version is > 1.11
> 
> 3. Try to root-cause the issue.
> 
> I’m inclined to say we should go with #1 for this RC, then either #2 or #3.

Also please send a patch to osstest to install the relevant golang
packages.  Even for stretch where it won't be supported.  Currently I
would expect that patch to cause tests to regress, so the
corresponding xen patch(es) should go in (and be backported) first.

Ian.

