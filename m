Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3B91F1B47
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 16:47:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiJ2d-0003zK-O4; Mon, 08 Jun 2020 14:46:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iXsd=7V=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jiJ2b-0003yb-OG
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 14:46:21 +0000
X-Inumbo-ID: d11dd5f0-a996-11ea-b289-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d11dd5f0-a996-11ea-b289-12813bfff9fa;
 Mon, 08 Jun 2020 14:46:21 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: fZE+rIwQViK1TuO9EoTkz06zeHFpoous8ELYsuEqyz35DEgMWd9Kw/yrnzpJ04jED2TmSexEYp
 4o+eG4ATa41TJyj9/MrZ1delmlVxO7NxkPc4SQiYwRCv5fT30kNnyuXu6wrhISwuL+biBVaLEr
 uwPVhu3c/fME+NZRM0bFNCVEepelVPRCNuDDBvDlH8onEYJfpa5ZY6Y2BikMF+Y6Xl64Z70Tcr
 kI2adPJStvQwhshnhSADt8bvxICL+ybrslK6OdkxkYT0sQ0xIGNV66cimCBvm/oMMu0xBV+Q+q
 7L8=
X-SBRS: 2.7
X-MesageID: 20240805
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,487,1583211600"; d="scan'208";a="20240805"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24286.20279.622221.291800@mariner.uk.xensource.com>
Date: Mon, 8 Jun 2020 15:46:15 +0100
To: "paul@xen.org" <paul@xen.org>
Subject: 4.14.0-rc1 blocked on goland build failure - decision needed
In-Reply-To: <003301d63d9e$97de3e60$c79abb20$@xen.org>
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

Hi, Paul.  For those on xen-devel: context is that Paul asked me to
cut 4.14.0-rc1.  The checklist asks me to perform a test build.

My 32-bit tools test build failed.  I think the problem is probably
specific to 32-bit userland on 64-bit Linux kernel.  I will send a
second followup mail not CC Paul with technical details.

Paul: do you want me to abort this RC to to release it anyway ?

Ian.

