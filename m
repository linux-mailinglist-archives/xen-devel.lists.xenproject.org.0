Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F136242B62
	for <lists+xen-devel@lfdr.de>; Wed, 12 Aug 2020 16:31:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5rlY-0008FU-Pl; Wed, 12 Aug 2020 14:30:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tE7g=BW=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k5rlX-0008FP-VO
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2020 14:30:08 +0000
X-Inumbo-ID: bea311fe-1655-47f4-8e77-89161ef5a3e7
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bea311fe-1655-47f4-8e77-89161ef5a3e7;
 Wed, 12 Aug 2020 14:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597242607;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject;
 bh=X3YoeWSBQB6eNiVStiVx6CBFctTLjzfr6DUaaLxD9Sc=;
 b=V6MqHjMlPES8Z2Jp9hMMoAutbnO54J1/mdrt6CPWjp9kTnjaTwaWlsKH
 xScPukff+mrG2q9GpUDMgqkwzFvQug0m+5JINCpMo1QFiS6xKybDQvfwp
 KYcorqfgDFQxIVb1n664TBu2E1CIGEm6zs+/bC0hbX5aVWywaqh2vjYaW 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: vc+XMQly3Kh63+40XISXkNWmjhzutX92ZX2SP/gB2D4mgm0GyBghnqoZjL++Durzakv86yS3CX
 3ze9viIE7Jqugcl3R265KNAMJuVJ5UVt9GENv3k2uAIo4BSiDluYp8BayXovAdga7GDU+NK2MD
 AQKB1g9A1y1Iw4Hskw2SS3jCRuvXj3XtrGmbD5TgzGtYe/5NAbBqX9q6LPpfXUslUIWu0yM5Hz
 l9jSDLdGltByrfqx+Uwe5RMYXvVckRhBRLdDlYqKzTlWNpgnp3DknVfRqSUb1tZUGDsfP2A6e0
 bB0=
X-SBRS: 2.7
X-MesageID: 24354583
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,304,1592884800"; d="scan'208";a="24354583"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24371.64746.743317.606471@mariner.uk.xensource.com>
Date: Wed, 12 Aug 2020 15:30:02 +0100
To: <committers@xenproject.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Planned osstest outage, around 17th August
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

osstest's infrastructure hosts need upgrading to Debian "buster" (aka
Debian "stable").  We are planning to do this on Monday the 17th of
August.

This will involve telling osstest to start draining its queues some
time around the 15th of August.  If all goes well, it will be back in
operation late on the 17th.  But it is possible that difficulties will
arise, in which case it might be out of operation, or operating in a
degraded way, for perhaps the rest of that week.

Please let me know if you think this is a bad time.

Ian.

