Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0383B1ECCF9
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 11:52:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgQ4F-0007PY-Mk; Wed, 03 Jun 2020 09:52:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I/nL=7Q=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jgQ4E-0007PO-OI
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 09:52:14 +0000
X-Inumbo-ID: e691a79c-a57f-11ea-acd3-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e691a79c-a57f-11ea-acd3-12813bfff9fa;
 Wed, 03 Jun 2020 09:52:14 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: GWqx20nbRQ5mQca92paAidzTrGGh/rAd7kPxvmds8CSIyLwxxAd9Xmbncc2XvP40iHHdo5D9PN
 YwuYb4VPzkbbqfG+PqivFRh40M+rdHeC0/UNUjlljYvN84qoNqnnvsf1esQyNwVH9kV8NCjhmz
 PWv0cYZj47bv0ycXZXNBj/rC+Ddsc0WXckwjXu1SFEBSLRwEZ4OnI/JCuT8iNt70rvXTHHUEAx
 /5ASFaOE7oGZHPibf6BouB9dHqqkAXLWkWz4lL4OwCLZqhCYlDk/R/5Kyoa+h57U7o/vRr5IYC
 qyw=
X-SBRS: 2.7
X-MesageID: 19452395
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,467,1583211600"; d="scan'208";a="19452395"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24279.29385.267956.941601@mariner.uk.xensource.com>
Date: Wed, 3 Jun 2020 10:52:09 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH 0/2] osstest: update FreeBSD guest tests
In-Reply-To: <20200528102648.8724-1-roger.pau@citrix.com>
References: <20200528102648.8724-1-roger.pau@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Roger Pau Monne writes ("[PATCH 0/2] osstest: update FreeBSD guest tests"):
> The following series adds FreeBSD 11 and 12 guests tests to osstest.
> ATM this is only tested on amd64, since the i386 versions had a bug.
> 
> The result can be seen at:
> 
> http://logs.test-lab.xenproject.org/osstest/logs/150428/

Oh, I forgot to say, both patches

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

