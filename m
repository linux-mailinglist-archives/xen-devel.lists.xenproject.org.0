Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE3E508A71
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 16:13:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309283.525380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhB5G-0001JO-V4; Wed, 20 Apr 2022 14:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309283.525380; Wed, 20 Apr 2022 14:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhB5G-0001HY-R9; Wed, 20 Apr 2022 14:13:30 +0000
Received: by outflank-mailman (input) for mailman id 309283;
 Wed, 20 Apr 2022 14:13:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7E3+=U6=citrix.com=prvs=10247635a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nhB5G-0001HR-2Z
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 14:13:30 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ba8f292-c0b4-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 16:13:28 +0200 (CEST)
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
X-Inumbo-ID: 0ba8f292-c0b4-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650464008;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5WBV3cEowC/5kYrEFg00ztx1PWHE5BHr/HFwGHA9nB0=;
  b=VpWcafuWS6mkANBtKxmRMUl50ZF5daqya4uQbvwgSEAyxDtk6KjdSZaQ
   WyVHahH1GJI5+u1D/l409+jstXShEczg5sSH+blwL9FUu29qQTduVXptu
   HxcyST7NMwnPkDk2gQ3InzdDia/vw1gmaMn6pxPaF7ln0WpX1SdlwitgN
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 71942788
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:aetsRKw5CTiLFy18nwx6t+ffxirEfRIJ4+MujC+fZmUNrF6WrkVVm
 GYXDGnUbqyJZmTweoglao23pktQv8TQzNFkGldlqCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NY024DhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpluaKSaEApPabwgflBcl52NyZ7H4pm9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6BP
 ptFM2U/PHwsZTVRY3tOMMsZltzvuXKlSjZWog6Hg+04tj27IAtZj+G2bYu9lsaxbftSmkGUt
 2fX5VPTCxsRNMGc4Ted+3fqjejK9Qv5RYYTGbuQ5vNsxlqJyQQ7AhocX0r9rOK5jkO7UtR3J
 Ekd+y5opq83nGShQ8PhRRS+rDiBtwQFRttLO+Qg7UeGza+8yySzC3UATzVBQMc7r8JwTjsvv
 neZktWsCTFxvbm9TXOG6qzSvT60ITISL2IJeWkDVwRty8bniJE+iFTIVNkLOLWuktT/FDX0w
 jaLhCsznbMeiYgMzarTwLzcq2vy/N6TFFdzv1iJGDL+hu9kWGK7T4CWy3mc7fVLEJ+EEnjGk
 lwDnuq5zO9bWPlhixexaOkKGbio4dOMPzvdnUNjEvEdyti9x5KwVdsOuW8jfS+FJu5BIGa0O
 xGL5Wu98bcJZBOXgblLj5Vd4ijA5YzpDpzbW//ddbKiibAhJVbcrEmCiaN9tl0BcXTAc4liY
 f93ku72VB727JiLKxLsGY8gPUcDnHxW+I8qbcmTI+6b+bSffmWJbrwOLUGDaOs0hIvd/liNr
 44Fa5TVkUUDOAEbXsUx2ddCRbztBSJlba0aVuQNLrLTSuaYMD1J5wDtLUMJJNU+wvU9ehbg9
 XChQE5IoGcTdlWcQThmnktLMeu1Nb4m9CpTFXV1YT6Ahil4Ca7yvfh3SnfCVeR+nACV5aUsH
 6dtlgTpKqkndwkrDBxENMem/d0+Lknz7e9MVgL8CAUCk1dbb1Sh0rfZksHHqEHi0gLfWRMCn
 oCd
IronPort-HdrOrdr: A9a23:YkwWa6Grsyj7T1m2pLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-IronPort-AV: E=Sophos;i="5.90,275,1643691600"; 
   d="scan'208";a="71942788"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Bobby Eshleman <bobby.eshleman@gmail.com>
Subject: [PATCH v5 0/6] Clean up common/arch split for debugger.h
Date: Wed, 20 Apr 2022 15:13:01 +0100
Message-ID: <20220420141307.24153-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This work is primarily to prevent new architectures from needing to implement
a stub debugger.h for something that is in practice only implemented on x86,
and probably bitrotten into oblivion.  It also resolves a lot of technical
debt on the x86 side.

Andrew Cooper (3):
  x86/gdbsx: Move domain_pause_for_debugger() into gdbsx
  x86/gdbstub: Clean up includes
  x86/debugger: Misc cleanup prior to splitting

Bobby Eshleman (3):
  x86/debugger: Remove debugger_trap_entry()
  x86/gdbsx: Rename debug.c to gdbsx.c
  xen: Split x86/debugger.h into common and arch specific parts

 xen/arch/arm/include/asm/debugger.h | 15 ------
 xen/arch/x86/Makefile               |  2 +-
 xen/arch/x86/domain.c               | 14 ------
 xen/arch/x86/domctl.c               | 14 +-----
 xen/arch/x86/gdbstub.c              |  5 +-
 xen/arch/x86/{debug.c => gdbsx.c}   | 37 +++++++++------
 xen/arch/x86/hvm/svm/svm.c          |  2 +-
 xen/arch/x86/hvm/vmx/realmode.c     |  3 +-
 xen/arch/x86/hvm/vmx/vmx.c          |  2 +-
 xen/arch/x86/include/asm/debugger.h | 93 +++++--------------------------------
 xen/arch/x86/include/asm/gdbsx.h    | 19 ++++++++
 xen/arch/x86/nmi.c                  |  1 -
 xen/arch/x86/setup.c                |  1 -
 xen/arch/x86/traps.c                | 37 +++++++--------
 xen/arch/x86/x86_64/gdbstub.c       |  2 +-
 xen/common/domain.c                 |  1 -
 xen/common/gdbstub.c                |  3 +-
 xen/common/keyhandler.c             |  2 +-
 xen/common/shutdown.c               |  2 +-
 xen/drivers/char/console.c          |  2 +-
 xen/include/xen/debugger.h          | 44 ++++++++++++++++++
 xen/include/xen/gdbstub.h           |  2 +
 22 files changed, 133 insertions(+), 170 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/debugger.h
 rename xen/arch/x86/{debug.c => gdbsx.c} (87%)
 create mode 100644 xen/arch/x86/include/asm/gdbsx.h
 create mode 100644 xen/include/xen/debugger.h

-- 
2.11.0


