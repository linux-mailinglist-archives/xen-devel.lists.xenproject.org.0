Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B841F1B50
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 16:48:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiJ4z-00047D-58; Mon, 08 Jun 2020 14:48:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iXsd=7V=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jiJ4x-000477-AD
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 14:48:47 +0000
X-Inumbo-ID: 27e9b8c2-a997-11ea-b289-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 27e9b8c2-a997-11ea-b289-12813bfff9fa;
 Mon, 08 Jun 2020 14:48:46 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 5Vf2vtuwm9AbQkt7ENoccWZJ+KP1LISg1ERtf10ANhs3+mWCBMmQbunPoob5W2V9wknpaI4jbm
 1NdZuTSH+ZUnE40VJRKbe+vheCNQuxwrO2TZ+4jbz9HIXgHALvC8354qlHTUivTlsQ8gb+JY46
 bQaIy2DscPaDv4zLZ7jyr7W2bfpM5VaCiKVrIkFOIhEunGtccd1lakfGboFOwCv/8hAxmR+MT5
 9bY2TeR1CbdiomBnBLvz8nBz/j+eGNfkBuxcasJbNB9u5lr+oyvW9vxTf9iEg3glg/eWoLNFNl
 hFQ=
X-SBRS: 2.7
X-MesageID: 19779146
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,487,1583211600"; d="scan'208";a="19779146"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24286.20424.998938.535648@mariner.uk.xensource.com>
Date: Mon, 8 Jun 2020 15:48:40 +0100
To: George Dunlap <George.Dunlap@citrix.com>, Nick Rosbrook
 <rosbrookn@gmail.com>
Subject: Re: 4.14.0-rc1 blocked on goland build failure - decision needed
In-Reply-To: <24286.20279.622221.291800@mariner.uk.xensource.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ian Jackson writes ("4.14.0-rc1 blocked on goland build failure - decision needed"):
> Hi, Paul.  For those on xen-devel: context is that Paul asked me to
> cut 4.14.0-rc1.  The checklist asks me to perform a test build.
> 
> My 32-bit tools test build failed.  I think the problem is probably
> specific to 32-bit userland on 64-bit Linux kernel.  I will send a
> second followup mail not CC Paul with technical details.

Technical details@:

The first error looks like this:

./helpers.gen.go:901[/tmp/go-build643158686/_/u/iwj/work/xen.git/tools/golang/xenlight/_obj/helpers.gen.cgo1.go:1172]:
type [268435456]_Ctype_struct_libxl_sched_params larger than address
space

I suspected that golang was misdetecting my build environment, which
was a 32-bit Linux userland on a 64-bit Linux kernel, reporting this

  $ uname -av
  Linux mariner 3.16.0-6-amd64 #1 SMP Debian 3.16.57-2 (2018-07-14)
  x86_64 GNU/Linux
  $ env | grep XEN
  XEN_COMPILE_ARCH=x86_32
  $

So I tried using `linux32' to change the process personality:

  $ uname -av
  + uname -av
  Linux mariner 3.16.0-6-amd64 #1 SMP Debian 3.16.57-2 (2018-07-14) i686
  GNU/Linux
  $ env | grep XEN
  + grep XEN
  + env
  XEN_COMPILE_ARCH=x86_32
  $

I did the build again, from a clean tree, and got the same result.  I
was building my prospective -rc1 git branch but I am pretty sure the
problem exists with master and staging.

I have not yet done a formal repro in a 32-bit chroot on another
system.  I'm going to do that next.

Ian.

