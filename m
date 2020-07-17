Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FE2224090
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 18:28:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwTDt-0002k7-8j; Fri, 17 Jul 2020 16:28:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Bgo=A4=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jwTDr-0002k2-Pm
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 16:28:31 +0000
X-Inumbo-ID: 8cec88ae-c84a-11ea-bca7-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8cec88ae-c84a-11ea-bca7-bc764e2007e4;
 Fri, 17 Jul 2020 16:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595003312;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:subject:in-reply-to:references;
 bh=2/3732gubJuYU2C+ir5CDPG+T3m5Zqv4+URMK8hhZtw=;
 b=VSVsyyr6sN2R+4UrBsabOlP2agYq7GpRur/ldULqQ7NKO9yMVPkLn/3e
 8SwThzOdKyE4Mjjfb+rFKF+r3egSEEKf15B16ctCB9+CdZ684vcSHz+fH
 rhjrZ2KRi8MNbg/+Y7eh9FDwfdpFlQrQG0chgHMtKr15T9geL7BMdPRbK k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: n3INc9QJiNhGZs7foyxwrav/xL2wsV5IVzSUAfOz3WUcMHKoo6L0duiYhJFyyNSm+o7jjsCOQk
 Di32RkY1PMl+cOrwOs0XUDxH7BatPURmPDl8Mw5/iUQcT8LLfxTKPp3ugELGT+ObkVyo3nLei0
 hzLXwhw+zAwswkw2+pTCI6Kkqt2E7oBh694cdEw9ef5JsbiAHec1IRifnWgc04O4Gt1ni2YPDk
 Vvvi1lk1VikcQ6O+0xJLHfgzBcWVGZZjfJwrrCbZvQo2k5VaFdMmNBvP9gTnQ+wlLoHPPomHaA
 xSE=
X-SBRS: 2.7
X-MesageID: 22634716
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,362,1589256000"; d="scan'208";a="22634716"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24337.53671.899413.925330@mariner.uk.xensource.com>
Date: Fri, 17 Jul 2020 17:28:23 +0100
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 0/2] osstest: update FreeBSD guest tests
In-Reply-To: <24279.29385.267956.941601@mariner.uk.xensource.com>
References: <20200528102648.8724-1-roger.pau@citrix.com>
 <24279.29385.267956.941601@mariner.uk.xensource.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ian Jackson writes ("Re: [PATCH 0/2] osstest: update FreeBSD guest tests"):
> Roger Pau Monne writes ("[PATCH 0/2] osstest: update FreeBSD guest tests"):
> > The following series adds FreeBSD 11 and 12 guests tests to osstest.
> > ATM this is only tested on amd64, since the i386 versions had a bug.
> > 
> > The result can be seen at:
> > 
> > http://logs.test-lab.xenproject.org/osstest/logs/150428/
> 
> Oh, I forgot to say, both patches
> 
> Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

Thanks, pushed.

Ian.

