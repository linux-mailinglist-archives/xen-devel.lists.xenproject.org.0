Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A9D24D762
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 16:33:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k985x-0005aB-Ve; Fri, 21 Aug 2020 14:32:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gmas=B7=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1k985w-0005a6-7k
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 14:32:40 +0000
X-Inumbo-ID: 798c6b75-8b0e-422a-b258-688ed73bc0be
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 798c6b75-8b0e-422a-b258-688ed73bc0be;
 Fri, 21 Aug 2020 14:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598020358;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d9jkX7xQUZGU/iOazCiM65pYFD8bi5vAUslABjb7dXQ=;
 b=hqJQ6Wsl7voc0lVieDRcL5GSqGcupD5kLHKTQQzLjujAMooSlzrfyGiP
 UqlUuiUQX7W/avbmc5KlPsepIZBibPob1vmyJF/rIfkHyAM/CxA0oumXT
 SfM4kBigXIsMs4k2EbR5ILZPk2siG0RUvNkrtnM0cCmxem9MoaP/1lZgM k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: uRSuitdDmjZsY15rHGXdlmufeoPbY/aiy8lkkDmrg+NeNMHljdBczmqsbkSujAq0tnSfwntgl3
 bH9Ns8tcXM8r3B1FVOA89guw98n36Mhh+AUogh8PuFWFNlGnA1CMVl4U8uNhrz1PthxVqlanWE
 jMKnVRksyroPzZb5BmigYz4crUzVNYbSaXqQI65StPRZLV2t9WoLwihouyJQ+/H2S3bkLuLA83
 m4dRnXWUQ27TsKKRoCOlR1HeO9MRTOhbMGiJnJPoSFhnLybrFoeV/AQzi6z36IK3Lx3eWIPfuw
 OvQ=
X-SBRS: 2.7
X-MesageID: 25346087
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,337,1592884800"; d="scan'208";a="25346087"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne
 <roger.pau@citrix.com>
Subject: [PATCH] MAINTAINERS: Add Roger Pau Monne as x86 maintainer
Date: Fri, 21 Aug 2020 15:32:01 +0100
Message-ID: <20200821143201.831774-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="true"
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 33fe51324e..978fc2fe72 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -521,8 +521,8 @@ F:	docs/misc/vtpm-platforms.txt
 X86 ARCHITECTURE
 M:	Jan Beulich <jbeulich@suse.com>
 M:	Andrew Cooper <andrew.cooper3@citrix.com>
+M:	Roger Pau Monné <roger.pau@citrix.com>
 R:	Wei Liu <wl@xen.org>
-R:	Roger Pau Monné <roger.pau@citrix.com>
 S:	Supported
 L:	xen-devel@lists.xenproject.org
 F:	xen/arch/x86/
-- 
2.25.1


