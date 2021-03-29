Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C3034D4A2
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 18:15:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103132.196794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQuY1-0006vP-Qn; Mon, 29 Mar 2021 16:15:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103132.196794; Mon, 29 Mar 2021 16:15:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQuY1-0006up-NQ; Mon, 29 Mar 2021 16:15:25 +0000
Received: by outflank-mailman (input) for mailman id 103132;
 Mon, 29 Mar 2021 16:15:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HZ2U=I3=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lQuY0-0006uY-K6
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 16:15:24 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75101d4c-f12a-46ba-bd6a-1e2f4f100ae3;
 Mon, 29 Mar 2021 16:15:23 +0000 (UTC)
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
X-Inumbo-ID: 75101d4c-f12a-46ba-bd6a-1e2f4f100ae3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617034523;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4Kmj6iy4PIotKGTyDexDXi398U4mGAHli8fvkm6ZyDw=;
  b=crWJqpb/GTWlLlHAua0bog8yA5eDTthVhSjtQcpWrsCHY+XyRN3pHYzy
   7xWPe5lQTbByCyiP1lfe1c8kTf325Ct15Wpgm7N1IO25Cyxlo7JoyumbT
   /8CfULwLtBy0aJk9xN817PnQCdDpeU6B4PDqO6dzRy5kfOdaHUxFttr95
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: B6X4D/X+yoUmNQD3kIEUN8V2lCaLAIhNq/P69Ib1Y0W5xZMR2zVozqclKlXP8OUuq03IyMJeKf
 K8UZdZpOSyM6S03neVjE4kvrdOFNQngeF/sri4FNAAgCe46dG8IKu2bgXEYd4C4smscIhXnWy3
 dCc4l5saIi3ehq/ZmJAjW84276/SV+RYs2LW6pQV5/6jT+xoSPiwhf1mqlMTWyMDYRvydi+ZZt
 RX64YvfRl5lbP6Y5y+IogDOPHt80ptUWC3JnttpS1H+1XpERRGKEru36vtDlp54wCwX+L2CJTQ
 99k=
X-SBRS: 5.1
X-MesageID: 40346954
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:qi6weK+SlyXb9W/94xluk+A+I+orLtY04lQ7vn1ZYzY9SK2lvu
 qpm+kW0gKxtS0YX2sulcvFFK6LR37d8pAd2/h3AZ6JWg76tGy0aLxz9IeK+UyYJwTS/vNQvJ
 0QEJRWJ8b3CTFB4vrSxCmdP5IezMKc8Kau7N2uq0tFaQ1xcalv40NYJ2+gYy9LbTJLD5Y4C5
 aQj/Avz1HLFBgqR/+2G2UfWKz7r8DL/aiWByIuPQIt6wWFkFqTiILSLh7w5HkjegIK5b8j9G
 Tf+jaJg5mejw==
X-IronPort-AV: E=Sophos;i="5.81,288,1610427600"; 
   d="scan'208";a="40346954"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Ian Jackson <ian.jackson@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Tamas K Lengyel <tamas.lengyel@zentific.com>
Subject: [PATCH v2 for-4.15 1/7] Intel Processor Trace Support: Add CHANGELOG.md and SUPPORT.md entries
Date: Mon, 29 Mar 2021 17:14:51 +0100
Message-ID: <20210329161457.345360-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Release-acked-by: Ian Jackson <ian.jackson@citrix.com>
---
v2:
 - Added "x86" specifier

CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Tamas K Lengyel <tamas.lengyel@zentific.com>
---
 CHANGELOG.md | 1 +
 SUPPORT.md   | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index c407f6bb2f..7f03e85bd7 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -10,6 +10,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - ARM IOREQ servers (device emulation etc.) (Tech Preview)
  - Renesas IPMMU-VMSA (Supported, not security supported; was Tech Preview)
  - ARM SMMUv3 (Tech Preview)
+ - Intel Processor Trace support (Tech Preview)
 
 ## Removed / support downgraded
 
diff --git a/SUPPORT.md b/SUPPORT.md
index a1efd8fcfd..cd0c09e6a4 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -247,6 +247,13 @@ Export hypervisor coverage data suitable for analysis by gcov or lcov.
 
     Status: Supported, Not security supported
 
+### Processor trace support
+
+Support for using Intel Processor Trace technology to trace guests
+from dom0.
+
+    Status, x86: Tech Preview
+
 ## Memory Management
 
 ### Dynamic memory control
-- 
2.30.2


