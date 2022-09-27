Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 045815EC86F
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 17:48:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412793.656244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odCo1-0003va-HA; Tue, 27 Sep 2022 15:47:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412793.656244; Tue, 27 Sep 2022 15:47:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odCo1-0003sS-EW; Tue, 27 Sep 2022 15:47:33 +0000
Received: by outflank-mailman (input) for mailman id 412793;
 Tue, 27 Sep 2022 15:47:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0TW=Z6=citrix.com=prvs=262f03aef=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1odCnz-0003sM-QP
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 15:47:31 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b008db8e-3e7b-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 17:47:29 +0200 (CEST)
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
X-Inumbo-ID: b008db8e-3e7b-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664293649;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WTUk5bTnx2ZKsSOf3ETiJqP/Wq57G2VTdYbXU0GpZJQ=;
  b=K8NxtzZQuO6VXUh6PoF1G8Kl9mTSVZEaKroyDtaMAzAj+t1AODZMBbD9
   4x25gI0/3huYCb0VyqEUofuiiYG2JiQosA0L7Ps7hk8XHppqL0fjTPqAS
   mU2kM1VvP2yF3sa+A867C8ZaGh8nk5wf//XJAdECr85QkvtuQCuyUcU9u
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 81880227
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lTg/HKh9uCJyimvRBdKKSjTNX161WBAKZh0ujC45NGQN5FlHY01je
 htvXGjUbKmPYDDzeNt0bN/gpk8EvZXRy4MxHAZoqy49Fykb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrSCYkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UgHUMja4mtC5ARvP68T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWdO0
 dopATcgVw6S2uSO6uinWPNdh8t2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKQOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiFZwFzh7C/
 D2uE2LROx4CbNrA9gW84lHwrNbqrA74X687G+jtnhJtqALKnTFCYPEMbnOkpdGph0j4XMhQQ
 2QW5y4voK4a5EGtCN7nUHWQgHOCpA9aZNNWHMUz8gTLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313pW+oC62OCMVBXQffiJCRgwAi/H4u506hB/LStdlEYa2g8fzFDW2x
 CqFxBXSnJ1K05RNjf/iuwma3XT8/fAlUzLZ+C3RXkaD3yp+Sbe7dtGu0XKB8eRaHYeWGwzpU
 Gc/p+CS6+UHDJeonSOLQfkQELzB28tpIAEwknY0QcB/qm3FF2qLONkJvWogfBsB3tMsI2eBX
 aPFhe9GCHa/1lOOZLQ/XY++At9CIUPIRYW8DaC8gjajj/FMmO67EMNGPxb4M4PFyhJEfUQD1
 XCzLq6R4Y4yU/gP8dZPb751PUUX7i4/33jPYpvw0g6q17GTDFbMF+lZagLRM7FpvfvVyOkwz
 zq4H5Ti9vmieLemPnm/HXA7dDjm0kTX9bip8pcKJ4Zv0yJtGX07Cu+5/I7Nj7dNxv0N/tokC
 1nnBSe0PnKj2iCcQehLA1g/AI7SsWFX9yxmY3V2bQr1hRDOo++Htc8iSnf+RpF/nMQL8BK+Z
 6JtlxmoahiXdgn6xg==
IronPort-HdrOrdr: A9a23:yIAY2KHrrMK32P7tpLqE5seALOsnbusQ8zAXP0AYc31om6uj5q
 aTdZUgpHjJYVkqKRIdcLy7V5VoIkmskaKdg7NhX4tKNTOO0ADDQe1fBOPZskTd8kbFltK1u5
 0PT0EHMqyUMWRH
X-IronPort-AV: E=Sophos;i="5.93,349,1654574400"; 
   d="scan'208";a="81880227"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH for-4.17] Build: Drop -no-pie from EMBEDDED_EXTRA_CFLAGS
Date: Tue, 27 Sep 2022 16:47:08 +0100
Message-ID: <20220927154708.15787-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This breaks all Clang builds, as demostrated by Gitlab CI.

Contrary to the description in ecd6b9759919, -no-pie is not even an option
passed to the linker.  GCC's actual behaviour is to inhibit the passing of
-pie to the linker, as well as selecting different cr0 artefacts to be linked.

EMBEDDED_EXTRA_CFLAGS is not used for $(CC)-doing-linking, and not liable to
gain such a usecase.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Fixes: ecd6b9759919 ("Config.mk: correct PIE-related option(s) in EMBEDDED_EXTRA_CFLAGS")
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Henry Wang <Henry.Wang@arm.com>

Henry: This bugfix is a blocker for 4.17.
---
 Config.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index 000e57e57b44..69af1e60d4cc 100644
--- a/Config.mk
+++ b/Config.mk
@@ -188,7 +188,7 @@ endif
 APPEND_LDFLAGS += $(foreach i, $(APPEND_LIB), -L$(i))
 APPEND_CFLAGS += $(foreach i, $(APPEND_INCLUDES), -I$(i))
 
-EMBEDDED_EXTRA_CFLAGS := -fno-pie -no-pie -fno-stack-protector -fno-stack-protector-all
+EMBEDDED_EXTRA_CFLAGS := -fno-pie -fno-stack-protector -fno-stack-protector-all
 EMBEDDED_EXTRA_CFLAGS += -fno-exceptions -fno-asynchronous-unwind-tables
 
 XEN_EXTFILES_URL ?= http://xenbits.xen.org/xen-extfiles
-- 
2.11.0


