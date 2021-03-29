Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A150B34D4A1
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 18:15:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103131.196782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQuXv-0006sQ-HA; Mon, 29 Mar 2021 16:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103131.196782; Mon, 29 Mar 2021 16:15:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQuXv-0006s4-E2; Mon, 29 Mar 2021 16:15:19 +0000
Received: by outflank-mailman (input) for mailman id 103131;
 Mon, 29 Mar 2021 16:15:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HZ2U=I3=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lQuXu-0006rz-0c
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 16:15:18 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ba0f9e8-f5e0-4e76-865d-a21c2abcdcfa;
 Mon, 29 Mar 2021 16:15:16 +0000 (UTC)
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
X-Inumbo-ID: 7ba0f9e8-f5e0-4e76-865d-a21c2abcdcfa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617034516;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H/etSajIvVyS1+Qxid3LfzwQ29MP/LQNDTOK0oSc3bk=;
  b=AYzEdSust4twO1JuEMT5IiYRY0eaA/odgwGipBzAIqfBarfuPqy6N/m4
   3ddf3EzP5RbIelnDVL6/m/XkYpyuLDVAZsmZUcoyUXalqR92/zVpb3ZKd
   3GlX4PK7YVDGTLEnNjvDrxcUsl92SC9TChXt7r0hAPRY3CmCet6bPpcWA
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: K0nMMO/Bfjp4Bf06twPple1uGIET5rFB22LalhadRLPgqNetCJs5vU+/G6c30dCZRe8CgbGqnG
 IzxwlBvWHyKoW5xFGjFVkGq3wdttrHhMsSILiay7nrMVqTA9/jnRMJtudIorU96Cl2qJoQ4nyh
 72A9ufA7PniY26bOCg1vpAZr4VenqLCsx4+7Dpu1OMnzt3GxPZO3J1N6UPx7F0XaHDC3Olpocd
 VN/h/jKUkGnTmWJ6OrTJt4H/IUye05YbnMfCXBGlTvoZAD7f7rxA3lEg88fgYH+oGWW1J1K1uN
 F/s=
X-SBRS: 5.1
X-MesageID: 40515557
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:IbpqjKixhk/a3daqMzfMAFHWfXBQXl8ji2hD6mlwRA09T+Wzva
 mV8sgz/xnylToXRTUcgtiGIqaNWjfx8pRy7IkXM96ZLW/bkUGvK5xv6pan/i34F0TFh5Zg/I
 ppbqQWMr3NJHdgi8KS2mWFOvYmhOKK6aW5wdrZpk0dKD1CT4FFw0NHBh2AEktwLTM2YqYRMJ
 aH/MJIq36BVB0sH6eGL0IIVeTCuNHH/aiOCXVtaiIP0wWAgSil77T3CXGjr3MjeghC3Ks49i
 z9mxH5j5/Tys2T8APW1GPY8v1t+efJ990rPqOxo/lQDj3tjwqyDb4ROYG/gA==
X-IronPort-AV: E=Sophos;i="5.81,288,1610427600"; 
   d="scan'208";a="40515557"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Ian Jackson <ian.jackson@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: [PATCH v2 for-4.15 3/7] CHANGELOG.md: Add dom0/domU zstd compression support
Date: Mon, 29 Mar 2021 17:14:53 +0100
Message-ID: <20210329161457.345360-3-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210329161457.345360-1-george.dunlap@citrix.com>
References: <20210329161457.345360-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
v2:
 - domU support also added

CC: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 8c89212f14..538eae611c 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -12,6 +12,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - ARM SMMUv3 (Tech Preview)
  - Intel Processor Trace support (Tech Preview)
  - Named PCI devices for xl/libxl
+ - Support for zstd-compressed dom0 and domU kernels
 
 ## Removed / support downgraded
 
-- 
2.30.2


