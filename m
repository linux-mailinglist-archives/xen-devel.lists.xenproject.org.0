Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C6751FCAB
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 14:25:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324456.546503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no2RM-0005sq-Ma; Mon, 09 May 2022 12:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324456.546503; Mon, 09 May 2022 12:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no2RM-0005qT-Hl; Mon, 09 May 2022 12:24:40 +0000
Received: by outflank-mailman (input) for mailman id 324456;
 Mon, 09 May 2022 12:24:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JH+5=VR=citrix.com=prvs=12132ff7f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1no2RK-0005qA-Iv
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 12:24:38 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc755ce5-cf92-11ec-8fc4-03012f2f19d4;
 Mon, 09 May 2022 14:24:36 +0200 (CEST)
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
X-Inumbo-ID: fc755ce5-cf92-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652099076;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uq1foPJpvaO1u+wSYrV1CFyZhCk56IBZRoJ5uogU+Oo=;
  b=MGXZoehUnaea7hS+Wo72qck8/13+MJ6pTQuQyizYIv56qHGyfTypqHQa
   6SZoxgGmazWa0XSXbf3pTlfUEKX4V3EqeRPqRYqvdcuymdzJNr87zgrTO
   OT+rKRiCF0rPOjZhRm+R0Jy9KcLogVjJPP84KP3vPKSf1l3nVO49BoKsz
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 70874005
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:AJbh3aKqaJHA+IRnFE+RGJUlxSXFcZb7ZxGr2PjKsXjdYENSgmQGz
 GUZWWvSa/7cYmKjedB0borj/EwD7JfcmIcyQVFlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA149IMsdoUg7wbRh39Y52YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 P9J7ICrexclBPDJwMctTwFeFwYlbLITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQq6OO
 JZBMWcHgBLoOy9uP1U8OrMFu+aKlD7jXB0JgmmWqv9ii4TU5FMoi+W8WDbPQfSIWMFUk0Cwt
 m/AuWPjDXkyCtubzjaU92O2scXGlyj7RYE6GaWx87hhh1j77mYeEgEMXF235/ywkFejWsl3I
 lYRvCEpqMAa60iDXtT7GRqirxasrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQI/
 FKUm9LiBRR0raaYD3ma89+8tiiuMCIYKWsDYy4sTgYf5dTn5oYpgXryos1LSfDvyIevQHepn
 m7M/HNWa6gvYdAj/aHi4Uv1kz6W+52RbT4p/gPTeTn08VYsDGK6XLCA5V/e5PdGCY+WSFido
 XQJ8/SjAPAy4YKlz3LUHrhUdF29z7PcaWCH3wYzd3U03271k0NPa7y8992XyK1BFs8fMQHkb
 0bI0e+6zM8CZSD6BUObjm/YNijL8UQCPYm+Phw3RoAXCnSUSONg1Hs3DXN8J0i3zCARfVgXY
 P93i/qEA3cAErhAxzGrXeob2rJD7nlgmDmLGMuql0n4i+X2iJuppVAtagDmUwzExPnc/FW9H
 yh3aaNmNCmzoMWhO3KKoOb/3HgBLGQhBICeliCkXrXrH+aSI0l4U6W56ep4I+RNxv0J/s+Vr
 yrVchIJlzLCaYjvdFzihoZLM+u/A/6SbBsTYEQRALpf8yV9Mdv3sPdDJvPav9APrYRe8BK9d
 NFdE+3oPxiFYm2vF+g1BXUlkLFfSQ==
IronPort-HdrOrdr: A9a23:y82ea6N6KMpEesBcTvmjsMiBIKoaSvp037Eqv3oedfUzSL3gqy
 nOpoV86faaslYssR0b9exofZPwJE80lqQFhrX5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtrZ
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.91,211,1647316800"; 
   d="scan'208";a="70874005"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH 2/3] x86/shadow: Don't use signed bitfield in sh_emulate_ctxt
Date: Mon, 9 May 2022 13:24:08 +0100
Message-ID: <20220509122409.14184-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220509122409.14184-1-andrew.cooper3@citrix.com>
References: <20220509122409.14184-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

'int' bitfields in particular have implementation defined behaviour under gcc
and can change signed-ness with -funsigned-bitfields.

There is no need for low_bit_was_clear to be a bitfield in the first place; it
is only used as a boolean.  Doing so even improves the code generation in
sh_emulate_map_dest() to avoid emitting a merge with structure padding.

Spotted by Eclair MISRA scanner.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/x86/mm/shadow/private.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm/shadow/private.h b/xen/arch/x86/mm/shadow/private.h
index 3dc024e30f20..772521b55dd3 100644
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -827,7 +827,7 @@ struct sh_emulate_ctxt {
 #if (SHADOW_OPTIMIZATIONS & SHOPT_SKIP_VERIFY)
     /* Special case for avoiding having to verify writes: remember
      * whether the old value had its low bit (_PAGE_PRESENT) clear. */
-    int low_bit_was_clear:1;
+    bool low_bit_was_clear;
 #endif
 };
 
-- 
2.11.0


