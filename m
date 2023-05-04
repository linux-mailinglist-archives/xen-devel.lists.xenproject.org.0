Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B65A36F6C96
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 15:08:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529717.824402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puYgr-0001se-Gi; Thu, 04 May 2023 13:08:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529717.824402; Thu, 04 May 2023 13:08:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puYgr-0001pa-E4; Thu, 04 May 2023 13:08:09 +0000
Received: by outflank-mailman (input) for mailman id 529717;
 Thu, 04 May 2023 13:08:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jZxo=AZ=citrix.com=prvs=48139b1ea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1puYgp-0001pM-GT
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 13:08:07 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b45a5c5c-ea7c-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 15:08:05 +0200 (CEST)
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
X-Inumbo-ID: b45a5c5c-ea7c-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683205685;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=q8H9vCnPnI2+EX1f/tER0jjkt7DS5cboSTFX7RAPK34=;
  b=ai3EXpsEZguNyPe5am29NZO5H7W+iMCLvnQCAhyKqfxCeLys4fArHA4H
   HYiYmor6CdT3uQzVlVNU7xOYeamLg8as2rqNrzoIDyLZBQKjhrxIUjXRd
   PMs6kv2H5/YwD7tsWOXeu7peFdajmz9Mi9xd89YAAfkFcf7OdV3eOkryT
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110302272
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:faUxaKm4w6kXsJfZ72YKe9zo5gz3JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOXGHUOPuIZWOge91xbom2oBwH7JDUzYJlTwVo/HpnRiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aWaVA8w5ARkPqgW5AOGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cRfBQwAUDW/vrKZ55a/FdFeip4/HOC+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQth/B/
 jmepT6mWHn2MvTc82O1+yiC3dWQkCyrSZAIEJqc6OJ11Qj7Kms7V0RNCArTTeOColG6c8JSL
 QoT4CVGhbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xJEIJUzpAY9wOr9ItSHoh0
 Vrhoj/yLWUx6vvPEyvbr+rK62roYkD5MFPuewc8CiY57ufGnLhjoTXrSolbIqLvku3cTGSYL
 y+xkMQuu1kCpZdVh/7jpAqX3G3ESovhFVBsuFiONo6xxkYgPdP+OdT1gbTOxawYRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hO0yT5FWyoyGsiTHqFy+5dEdMTX
 GfduBlK+LhYN2awYKl8buqZUpp6lvG8TY29Dq+FM7Kih6RMmPKvpnkyNSZ8IUi0+KTTrU3PE
 cjCKpv9ZZrrIa9m0CC3V48g7FPf/QhnnTm7bcmin3yaPU+2OCb9pUEtbAHfMYjULcqs/G3oz
 jqoH5HWk08HDrelPUE6M+c7dDg3EJTyPriuw+Q/SwJJClAO9L0JYxMJ/Y4cRg==
IronPort-HdrOrdr: A9a23:KY/HHKpx2IEENzHASm/RS7EaV5pIeYIsimQD101hICG9E/b5qy
 nKpp8mPHDP5Qr5NEtLpTniAsi9qA3nmqKdiLN5VYtKNzOLhILHFu9f0bc=
X-Talos-CUID: =?us-ascii?q?9a23=3AXO32XminQGZewHj0g++mM3mpCDJuSjrw8HruBnO?=
 =?us-ascii?q?BWUlObLnKcW2cor9Uup87?=
X-Talos-MUID: 9a23:kjJfygg3njKSgrJtOx/BFsMpd/0x0630Jhs3zpgJ69iWLyhXHymBk2Hi
X-IronPort-AV: E=Sophos;i="5.99,249,1677560400"; 
   d="scan'208";a="110302272"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/bitops: Drop include of cpufeatureset
Date: Thu, 4 May 2023 14:07:55 +0100
Message-ID: <20230504130755.3181176-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Nothing in x86/bitops uses anything from x86/cpufeatureset, and it is creating
problems when trying to untangle other aspects of feature handling.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/include/asm/bitops.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index 5a71afbc89d5..aa8bd65b4565 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -6,7 +6,6 @@
  */
 
 #include <asm/alternative.h>
-#include <asm/cpufeatureset.h>
 
 /*
  * We specify the memory operand as both input and output because the memory
-- 
2.30.2


