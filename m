Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF7B1EA55D
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 15:54:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfktV-0002GS-Jh; Mon, 01 Jun 2020 13:54:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ele=7O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jfktU-0002GN-DP
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 13:54:24 +0000
X-Inumbo-ID: 6616f160-a40f-11ea-81bc-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6616f160-a40f-11ea-81bc-bc764e2007e4;
 Mon, 01 Jun 2020 13:54:23 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 4KYDU8yOE7cRy2lc3w4OLANl5w6fh7aqQN2GsYYg8FXBuUTEfQvqmJ5u5eucXNNFdNWCg7nbEj
 kgkx75+dKVRjFQf3Tjs/EHEVMTBLJeOyTzBUcyvYU072VwbJWB/08NvkaxSG9cr/dbZIL4baxC
 f3zccThPE/27BZYxiBCWNVYLNI9wlIC6mouHHUy0qVA3dickpgeSIovy/wGCvxtUpWar/5NtIN
 wHuedXb3EovSqPr7mo4CLcRn0r/+9zp8QbpHwTW3Ai3DoKn2uO1v3EKmXXUj76svPhagjw7m+b
 rHY=
X-SBRS: 2.7
X-MesageID: 19273160
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,461,1583211600"; d="scan'208";a="19273160"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v3 0/2] clang/llvm: build fixes
Date: Mon, 1 Jun 2020 15:53:23 +0200
Message-ID: <20200601135325.34156-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

Two pending bug fixes for clang/llvm toolstacks.

Roger Pau Monne (2):
  x86/mm: do not attempt to convert _PAGE_GNTTAB to a boolean
  build32: don't discard .shstrtab in linker script

 xen/arch/x86/boot/build32.lds | 14 ++++++++++++++
 xen/arch/x86/mm.c             |  9 ++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

-- 
2.26.2


