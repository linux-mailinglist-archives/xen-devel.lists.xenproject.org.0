Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE556CAF03
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 21:42:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515455.798357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgsiv-0003GY-MI; Mon, 27 Mar 2023 19:41:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515455.798357; Mon, 27 Mar 2023 19:41:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgsiv-0003Dj-HP; Mon, 27 Mar 2023 19:41:45 +0000
Received: by outflank-mailman (input) for mailman id 515455;
 Mon, 27 Mar 2023 19:41:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kO+W=7T=citrix.com=prvs=443697bea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pgsit-0002j7-ET
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 19:41:43 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65a50857-ccd7-11ed-b464-930f4c7d94ae;
 Mon, 27 Mar 2023 21:41:41 +0200 (CEST)
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
X-Inumbo-ID: 65a50857-ccd7-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679946101;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+37pQAwDXobSUp4Mzig8HvM3vol/fpBbo+6RTtS8o+U=;
  b=NFAbki5vAz5tR0Sc3/Q7kmMPUkKSL57zbrlv+wN1XLXZqmVyts0wVHN4
   xN1GEwva1h9sGvb2x9S3EtQ8hvEMV+/Jfe0hEVEE0kE/wkfQqv8eoQfaD
   oXzU23nbtv4KZ2RD257bTxg7F+xgU9632xTvEyw2z1r1fOuHHtWfe7XMz
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 103008789
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:U/9cFqnuwuEzBP100vdnyHjo5gyMJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOXWmHaa6MMTTxKtF3O9ix808Bv5/QytdjHAFlqS0wRCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5gCGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 e0ydBsVcC+Eu9CN/Z6wVvVTv8gRE/C+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQth/A/
 TqerzupU3n2MvSG8wvf2FuTqtWWvgzZcblNLIOn98dT1Qj7Kms7V0RNCArTTeOCol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4Mcc39QWMwar8+BuCCy4PSTspQMMinN87Q3otz
 FDhoj/yLWUx6vvPEyvbr+rK62roYkD5MFPuewcVZ1cu+8fcp70BtS/jRcp/L5e5vOLMTGSYL
 y+xkMQuu1kCpZdViPTlow2d2GrESovhFVBsuFiONo6xxkYgPdP+OdT1gbTOxawYRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hO0yT5FWyoyGsiTHqFyPosdz7ze
 1P0sghM/pJVN3bCRfYpPNPgV516lve6S4yNuhXogjxmOMAZmOivoklTibO4hTixwCDAb4lmU
 XtkTSpcJSlDUvk2pNZHb+wczaUq1kgD+I8nfriil07P+ePHNBaopUItbAPmRvon95mNvAi92
 48Zb6NmPT0DCryhCsQWmKZPRW03wY8TXMmv8JYLL77Se2KL2ggJUpfs/F/oQKQ994w9qwsC1
 ivVtpNwoLYnuUD6FA==
IronPort-HdrOrdr: A9a23:xBZJf6ADUn2ktp3lHelr55DYdb4zR+YMi2TC1yhKOHpom62j9/
 xG+c5x6faaslcssR0b6LW90cq7MArhHPxOkPEs1N6ZNWGI1ldARLsSlrcKqAeQfxEWmNQtsp
 tIQuxSMvC1K35Q5PyX3OC/Kbwd6ejCyoyTwc356FhMYz1QQ5xBySA8MCqne3cGJzVuNN43FJ
 +R/MpVqyDIQxkqR86mHGQCW+TZh/CjruOFXSI7
X-IronPort-AV: E=Sophos;i="5.98,295,1673931600"; 
   d="scan'208";a="103008789"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Sergey Dyasli
	<sergey.dyasli@citrix.com>
Subject: [PATCH 0/5] x86/ucode: Fixes to bootstrap_map() handling
Date: Mon, 27 Mar 2023 20:41:21 +0100
Message-ID: <20230327194126.3573997-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Stumbled on to while trying to fix bugs elsewhere with bootstrap_map().  I
don't know if I'd conciously reaslised how bogus microcode_init() was
previously, but it absolutely can't stay...

Andrew Cooper (5):
  xen/earlycpio: Drop nextoff parameter
  x86/ucode: Fold early_update_cache() into microcode_init_cache()
  x86/ucode: Fold early_microcode_update_cpu() into early_microcode_init()
  x86/ucode: Cache results in microcode_scan_module()
  x86/ucode: Drop ucode_mod and ucode_blob

 xen/arch/x86/cpu/microcode/core.c | 247 +++++++++++++++---------------
 xen/common/earlycpio.c            |   8 +-
 xen/include/xen/earlycpio.h       |   3 +-
 3 files changed, 128 insertions(+), 130 deletions(-)

-- 
2.30.2


