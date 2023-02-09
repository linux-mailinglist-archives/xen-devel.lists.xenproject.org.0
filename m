Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD32690861
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 13:12:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492415.761931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ5mY-0003k2-Ko; Thu, 09 Feb 2023 12:12:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492415.761931; Thu, 09 Feb 2023 12:12:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ5mY-0003i8-Hj; Thu, 09 Feb 2023 12:12:06 +0000
Received: by outflank-mailman (input) for mailman id 492415;
 Thu, 09 Feb 2023 12:12:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6rTn=6F=citrix.com=prvs=3970fcfec=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pQ5mW-0003i2-Fe
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 12:12:04 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4bf1684-a872-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 13:12:02 +0100 (CET)
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
X-Inumbo-ID: f4bf1684-a872-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675944722;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=abgN/ZAr8rV/3HOV7E7gPEvQBK2pQRmnd+JqKbakiQQ=;
  b=MiFMN73kuc5C4CrfwrDhz8BcL5mrRtq1BxdtekGnNu13De7xeIR/sKYr
   01mthNFEACaBxJyu0O98tIT7C5dQUgAF3ms+sTUu/SbTZ++wYLmqBRBS/
   BgwneZGbxKw3qeYfo4KWpYDY9I3uGGYW6ST+j7CQU2TXY9oQJBT74/Fv9
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 95192122
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:gMz8fKpesvw7ziUkRaqo59/2c5BeBmILZRIvgKrLsJaIsI4StFCzt
 garIBmCOvyCM2SnKdtxOt+1oxkFuZeHmtUwSQc9+Sk0E34S8puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weEzyhNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACk9fxupptCr+rKiELVpgN4YcsrzYbpK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVRrk6VoqwmpXDe1gVr3JDmMcbPe8zMTsJQ9qqdj
 jObpjWjW0tAXDCZ4Suu/lisor+Spwb2SNIfD6G77cZWsXTGkwT/DzVJDADm8JFVkHWWRNZ3O
 0ESvC00osAa9kOxScLmdwalu3PCtRkZM/JAHut/5AyTx6785weCGnNCXjNHcMYhtsI9WXotz
 FDhoj/yLWUx6vvPEyvbr+rK62roYkD5MFPuewcdfRoOyfjRvbszl0iTS9B5K/C2loDMTGSYL
 y+xkAAygLAajMgu3qq9/Ezajz/EmqUlXjLZ9S2MADv7s1oRiJqNItXxtAOFtaoowJOxFAHpg
 ZQSpySJAAni57mpnTfFfugCFarBCx2tYGyF2g4H83XMGl2QF5+fkWJ4umkWyKRBaJxsldrVj
 Kj752tsCGd7ZifCUEOOS9vZ5z4W5abhD8/5cfvfc8BDZJN8HCfeon4zNR7Jhz68wRJ9+U3aB
 Xt9WZ38ZZr9If04pAdaus9HieN7rszA7Ty7qW/HI+SPjuPFOS/9pUYtO1qSdOEphJ5oUy2Mm
 +uzw/Cikk0FOMWnO3m/zGLmBQxSRZTNLcys+pM/my/qClYOJVzN/NeInO19IdE4xP0F/goKl
 1nkMnJlJJPErSWvAW23hrpLMdsDgb4XQaoHABER
IronPort-HdrOrdr: A9a23:+E7dq6rYwNURWiLboU54KvAaV5oieYIsimQD101hICG9E/bo8v
 xG88526faZslkssRIb6LK90cu7IU80nKQdieN9AV7FZmfbUQOTXeZfBODZsl7d8kPFl9K105
 0KT0EEMqyVMWRH
X-IronPort-AV: E=Sophos;i="5.97,283,1669093200"; 
   d="scan'208";a="95192122"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: [XEN PATCH] libs/util: Remove unused headers in libxlu_pci.c
Date: Thu, 9 Feb 2023 12:11:40 +0000
Message-ID: <20230209121140.10982-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

libxlu_pci.c doesn't use any "xlu__cfg*()" functions and doesn't use
any of the disk parsing functions "xlu__disk*()", so all those headers
can be removed.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/util/libxlu_pci.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tools/libs/util/libxlu_pci.c b/tools/libs/util/libxlu_pci.c
index 551d8e3aed..294482c6d7 100644
--- a/tools/libs/util/libxlu_pci.c
+++ b/tools/libs/util/libxlu_pci.c
@@ -3,9 +3,6 @@
 #include <ctype.h>
 
 #include "libxlu_internal.h"
-#include "libxlu_disk_l.h"
-#include "libxlu_disk_i.h"
-#include "libxlu_cfg_i.h"
 
 
 #define XLU__PCI_ERR(_c, _x, _a...) \
-- 
Anthony PERARD


