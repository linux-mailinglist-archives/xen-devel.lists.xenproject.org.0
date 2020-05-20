Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B98021DBB14
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 19:20:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbSO2-0000VV-Rb; Wed, 20 May 2020 17:20:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NWk/=7C=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jbSO1-0000VO-Bz
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 17:20:09 +0000
X-Inumbo-ID: 275435c8-9abe-11ea-b9cf-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 275435c8-9abe-11ea-b9cf-bc764e2007e4;
 Wed, 20 May 2020 17:20:08 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Hy70aDVNs4PsAR3OYYC29RETWWM1PnlDmQqWOkvKGaKuLHIUl5bkbHqFyn0pg/buDtjH/me2P1
 XlLk9bukeYrFZ32aSqMDYJ6ZLAMPGfLzCmz1VEaoeXv5ukGWLb8q0VfUyt9397rjQVD1nb0FKb
 0AXWfGa570ObZVba+ZSBCAAypS99jl+SRLekpMh8gOVXTyVUYg4KNq6n5vzlRS0jRlnjA2OEJQ
 iF6WOirsCvcGMt1DzvNW20teer5XPWqJCyqc8Uhu0S2vA73fJ1Ngn2n5cpSnWGFViOrmosP3SC
 dT8=
X-SBRS: 2.7
X-MesageID: 18296172
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,414,1583211600"; d="scan'208";a="18296172"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24261.26307.721031.349605@mariner.uk.xensource.com>
Date: Wed, 20 May 2020 18:20:03 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
Subject: [XEN PATCH] tools/xenstore: mark variable in header as extern
In-Reply-To: <20200520163942.131919-1-anthony.perard@citrix.com>
References: <20200520163942.131919-1-anthony.perard@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Anthony PERARD writes ("[XEN PATCH] tools/xenstore: mark variable in header as extern"):
> This patch fix "multiple definition of `xprintf'" (or xgt_handle)
> build error with GCC 10.1.0.

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

