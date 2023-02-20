Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C66A69D451
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 20:47:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498353.769217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUC89-0002PA-K7; Mon, 20 Feb 2023 19:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498353.769217; Mon, 20 Feb 2023 19:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUC89-0002NZ-Go; Mon, 20 Feb 2023 19:47:21 +0000
Received: by outflank-mailman (input) for mailman id 498353;
 Mon, 20 Feb 2023 19:47:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CT8u=6Q=citrix.com=prvs=408b4b2b9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pUC87-00026t-8z
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 19:47:19 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61d62945-b157-11ed-933d-83870f6b2ba8;
 Mon, 20 Feb 2023 20:47:18 +0100 (CET)
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
X-Inumbo-ID: 61d62945-b157-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676922438;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=59YlNFN9gprKCcNZMjv06aajCgsZGhQvKhHumYZ971A=;
  b=SPF/HPidQT9QQH5iPFa59F21Skd7EwKYwPpTzZr3hIRNst87M8qbZ/CG
   l+hYbHJO9iAs/HzTqWvEwnMt8uwM4dT5xzWrY/H5EsbFK6utJOKnxhkrQ
   d+xjQfHM+/MjqS5pnniLUoV6H7Np6KrCUlj9z1tWzy7TWub0z5+2oKy1E
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97179658
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:pLOcRKowHzvlRUst5zmcGuqzJU5eBmIOZRIvgKrLsJaIsI4StFCzt
 garIBmFPvaJZWLwfot1Pojk9BkGu5/RzdBqTwpl+C82E3sR85uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weEzSFNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAAkqR06uod66+ZW+QchghPglLca2f7pK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVxrl6PqLVxyG/U1AFri5DmMcbPe8zMTsJQ9qqdj
 jOZpjuoXExKXDCZ4SulyFacvdHupxrQCYECTOT/1dBx2nTGkwT/DzVJDADm8JFVkHWWRNZ3O
 0ESvC00osAa5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAmZDNcbN0ttOctWCcnk
 FSOmrvU6SdH6ePPDyjHr/HN8G30YHJORYMfWcMaZTIiyofOhr0/tzXKRfdvEpKzj9KoWgill
 lhmsxMCr7kUiMcK0YCy8lbGny+gq/D1c+Il2unEdjn7t10kPeZJc6TtsAGGtqgYcO51W3Hb5
 BA5d96iAPfi5H1nvAiEW60zEb6g/J5p2xWM0Ac0T/HNG9lAkkNPnLy8AhkkeS+F0e5eI1cFh
 XM/XisIvfdu0IOCN/MfXm5II51CIVLcPdrkTOvISdFFf4J8cgSKlAk3OxHOjjm9yBhzyPpnU
 Xt+TSpLJSxHYZmLMRLsH7tNuVPV7n1WKZzvqWDTkE38jOv2iI+9QrYZKlqeBt3VH4vdyDg5B
 +13bpPQoz0GCb2WX8Ui2dJLRbz8BSRhVM+eRg0+XrLrHzeK70l7VaaBnON+J90890mX/8+Rl
 kyAtoZj4AKXrRX6xc+iMxiPtJuHsU5DkE8G
IronPort-HdrOrdr: A9a23:5+eu96tj6q3WnvMJZVjhrGNG7skDttV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMXFKyfzUzSP9OewGqeP3lJxBh43lvgpQpdcBUdAd0+97YDzrbXGfXGN9dP0E/A
 L33Ls9m9KnE05nCPhSVhE+LpH+T8SgruOfXSI7
X-IronPort-AV: E=Sophos;i="5.97,313,1669093200"; 
   d="scan'208";a="97179658"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] x86/irq: Improve local_irq_restore() code generation and performance
Date: Mon, 20 Feb 2023 19:47:02 +0000
Message-ID: <20230220194702.2260181-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230220194702.2260181-1-andrew.cooper3@citrix.com>
References: <20230220194702.2260181-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

POPF is a horribly expensive instruction, while STI is an optimised fastpath.

Switching POPF for a conditional branch and STI caused an 8% perf improvement
in various linux measurements.  While I don't expect the change to be that
dramatic in Xen, there will be an improvement.

Furthermore, there is the following code generation improvement:

  add/remove: 0/0 grow/shrink: 3/52 up/down: 52/-966 (-914)

owing to not needing to opencode the restriction to just IF in asm.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/include/asm/system.h | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/include/asm/system.h b/xen/arch/x86/include/asm/system.h
index 65e63de69a67..4be235472ecd 100644
--- a/xen/arch/x86/include/asm/system.h
+++ b/xen/arch/x86/include/asm/system.h
@@ -267,13 +267,8 @@ static inline unsigned long array_index_mask_nospec(unsigned long index,
 })
 #define local_irq_restore(x)                                     \
 ({                                                               \
-    BUILD_BUG_ON(sizeof(x) != sizeof(long));                     \
-    asm volatile ( "pushfq\n\t"                                  \
-                   "andq %0, (%%rsp)\n\t"                        \
-                   "orq  %1, (%%rsp)\n\t"                        \
-                   "popfq"                                       \
-                   : : "i?r" ( ~X86_EFLAGS_IF ),                 \
-                       "ri" ( (x) & X86_EFLAGS_IF ) );           \
+    if ( (x) & X86_EFLAGS_IF )                                   \
+        local_irq_enable();                                      \
 })
 
 static inline int local_irq_is_enabled(void)
-- 
2.30.2


