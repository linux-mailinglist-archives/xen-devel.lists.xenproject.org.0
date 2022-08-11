Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3356A58FB0C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 13:01:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384467.619848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM5vp-0002Dr-Vr; Thu, 11 Aug 2022 11:00:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384467.619848; Thu, 11 Aug 2022 11:00:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM5vp-0002Bl-T4; Thu, 11 Aug 2022 11:00:53 +0000
Received: by outflank-mailman (input) for mailman id 384467;
 Thu, 11 Aug 2022 11:00:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XZap=YP=citrix.com=prvs=215a4cc3a=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1oM5vo-0002BY-Dp
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 11:00:52 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db77152b-1964-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 13:00:50 +0200 (CEST)
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
X-Inumbo-ID: db77152b-1964-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660215650;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7zTsj3FgiSrtsICRFnfbrIPJEMJyYijoongIaQQeKlc=;
  b=f8i0uyWv9dp3PizsTKHCJI0G7cy/shFULdnIIuHl3KGmMkQV52qlVzvL
   16tEr6CI9qUc5pDSnm57+GICsnGa9fLTZYugxnwPnChkWbo/TSddr83vg
   8ZcSnlfuLE09rd2WIU5oIcCvPOSSqqzYEMWtltwIKopMbx6fAg4TMMMdr
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80415703
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:HZsWc6OyJV84ZVjvrR3Ml8FynXyQoLVcMsEvi/4bfWQNrUol0TICz
 WMWCGrVa/qMYTDxc9x3Oo3k/EtS6J/Uy9VjQQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyEULOZ82QsaDhMu/va8EoHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPTws9SFVk9G7YH0cFaCmIft
 vsFARokO0Xra+KemNpXS8Fpj8UnasLqIJkeqjdryjSx4fQOGM6ZBf+QvJkBgWl21psm8fX2P
 qL1bRJ1aw/bJRlGNVoNF5s6mM+jh2Xlci0eo1WQzUYyyziLkFUsj+C2WDbTUvnTFOVN2WeWm
 kDH2kvzDShLGIbP0BPQpxpAgceQxHimCer+DoaQ6fpCkFCVgGsJB3U+V1G2vP24gU6WQM9EJ
 gof/S9Ghbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6k6nMsF2AbLoZ87YlvGGJsh
 gThc87V6SJHj7yvdWuF/ZGvshiVFCMWfCwFeAYuZF5QizX8m73fni4jX/46TvDt1oyqQGiuq
 9yZhHNg3utO1Kbnw43+pAma2Gz0+/AlWyZvvm3qsnSZAhSVjWJPT6ih8hDl4PlJN+51pXHR7
 SFfy6ByAA3jZKxhdRBho81XRdlFH97fbFXhbadHRvHNDQiF9X+5Zpx36zpjPkpvOctsUWa3P
 heL5lsItc8OZiHCgUpLj2WZVawXIVXIT4y5Bpg4kPIXCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mTCpYNl5DUPwP5GfnGI8gPUoDnH9WKZX7Gc+mlHxKENO2OBaodFvyGAHQNLBpvPjV/F69H
 hQ2H5Li9iizmdbWOkH/mbP/53hTdRDX2bieRxRrS9O+
IronPort-HdrOrdr: A9a23:pO0ht6oMXISkm6wL0QFq10waV5oneYIsimQD101hICG8cqSj+f
 xG+85rsSMc6QxhPk3I9urhBEDtex/hHP1OkOws1NWZLWrbUQKTRekIh+bfKlXbakrDH4VmtJ
 uIHZIQNDSJNykZsfrH
X-IronPort-AV: E=Sophos;i="5.93,228,1654574400"; 
   d="scan'208";a="80415703"
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ross Lagerwall
	<ross.lagerwall@citrix.com>
Subject: [PATCH] x86/amd: Only call setup_force_cpu_cap for boot CPU
Date: Thu, 11 Aug 2022 11:59:56 +0100
Message-ID: <20220811105956.3984262-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This should only be called for the boot CPU to avoid calling _init code
after it has been unloaded.

Fixes: 062868a5a8b4 ("x86/amd: Work around CLFLUSH ordering on older parts")
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

This replaces "x86/cpu: Drop _init from *_cpu_cap functions".

 xen/arch/x86/cpu/amd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 29c59bcba4..d5f8e5e899 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -845,7 +845,7 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	 * everything, including reads and writes to address, and
 	 * LFENCE/SFENCE instructions.
 	 */
-	if (!cpu_has_clflushopt)
+	if (c == &boot_cpu_data && !cpu_has_clflushopt)
 		setup_force_cpu_cap(X86_BUG_CLFLUSH_MFENCE);
 
 	switch(c->x86)
-- 
2.31.1


