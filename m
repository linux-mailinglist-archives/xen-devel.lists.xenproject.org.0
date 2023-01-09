Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D63662514
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 13:09:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473584.734272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEqxB-00028i-Ry; Mon, 09 Jan 2023 12:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473584.734272; Mon, 09 Jan 2023 12:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEqxB-00025R-Op; Mon, 09 Jan 2023 12:08:37 +0000
Received: by outflank-mailman (input) for mailman id 473584;
 Mon, 09 Jan 2023 12:08:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPNl=5G=citrix.com=prvs=36677a302=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pEqx9-0001pa-TV
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 12:08:35 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55e40d19-9016-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 13:08:34 +0100 (CET)
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
X-Inumbo-ID: 55e40d19-9016-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673266114;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=X8smxQVa1GygRZF5ef4Zl6tvClnyvVfOZsr0vV3ltfY=;
  b=BiV2jukolb08yYA/QWyzghyCjCzr+5Z6jrdpS5UiKpsiJLcaeGvc+P+t
   RiKLmL3wpDLTMyP6JDtcLW+OCuhdVTPwdx8km3LZOACaoTnuYVIEw7brk
   L4XkeKptryhzQVcd2pV/f66jqtKPiRUIkT9vHNKihIoZRle45R1vHTQ1p
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 91779490
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ibDDP6vE42Pzcz5M42V/L+ChJ+fnVJdeMUV32f8akzHdYApBsoF/q
 tZmKWHSb//ZYjP2c9t2ad+/pk0G68TWy4VlSws9+Hs3FXwV+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoQ5AaGxiFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwCyI0UkuEld6MwrOSSLFO3NQbcfjbM9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfAdMYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27J/
 z2ZrjioWnn2MvTB+H254yy9hdblkAnEV6c7KOOc19Bl1Qj7Kms7V0RNCArTTeOColG6c8JSL
 QoT4CVGhaov8gqtR9r0XRy9qVaFuAIRX5xbFOhSwAKA1KvSpRqYD24sTzhdZdhgv8gzLRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBsZSkv7sTnoYozpgnSVdslG6mw5uAZAhmpn
 WrM9nJnwexO04hbjM1X4GwrnRqPtKH1FQkn2j/VX0untiEjdLb4VrynvA2zAel7EK6VSVyIv
 X4hkseY7fwTAZzlqBFhUNnhD5nyua/bbWS0bUpHWsB4qm/zoyLLkZV4umkWGat/DioTldYFi
 mf3sBgZ2pJcNWDCgURfM9PoUJRCIUQN+L3YuhHogjhmOMUZmOyvpnsGiausM4fFziARfVkXY
 8vzTCpVJS9y5V5b5DS3XfwB9rQg2zozw2jeLbiikUv8i+LEOyLOGehZWLdrUgzfxPneyOky2
 48BX/ZmNj0FCLGuCsUp2dJ7wa82wYgTWsmt9p0/mh+rKQt6AmAxY8I9Mpt4E7GJa599z7+Sl
 lnkAx8w9bYKrSGfQel8Qiw5OeyHsFcWhS5TABHAyn70gSNyOdb+svhCH3b1FJF+nNFeITdPZ
 6FtU6297j5nEFwrJxx1gUHBkbFf
IronPort-HdrOrdr: A9a23:u444lqq2KJ+jeL4UZyF9KyQaV5rieYIsimQD101hICG9Ffbo9P
 xG/c566faQsl0ssR4b8+xoVJPsfZr3z+8I3WBpB8bbYOCEggqVxeNZgrcKqgeIcxEWndQy6U
 4PScRD4PeZNykfsS/x2njGLz9x+qj/zEiF7d2uqkuEYGlRGsZdBygQMHf4LqVWLDM2Y6bQT/
 Knl7F6T2jJQwVsUizsbkN1ItT+mw==
X-IronPort-AV: E=Sophos;i="5.96,311,1665460800"; 
   d="scan'208";a="91779490"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 0/2] x86/vmx: Don't crash guests when there is no model-specific LBRs available
Date: Mon, 9 Jan 2023 12:08:26 +0000
Message-ID: <20230109120828.344-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is the minimum bodge required to stop guests crashing on Sapphire Rapids
hardware.

Note that both Arch LBR and safely (in terms of migration) enumerating
PDCM/MSR_PERF_CAPS depend on improved MSR levelling support which is still not
yet complete.

i.e. We cannot do the second half (enumerating LBR_FORMAT=0x3f) yet because
we'll make it more likely for VMs to crash in migrate.

Andrew Cooper (2):
  x86/vmx: Calculate model-specific LBRs once at start of day
  x86/vmx: Support for CPUs without model-specific LBR

 xen/arch/x86/hvm/vmx/vmx.c | 307 +++++++++++++++++++++++----------------------
 1 file changed, 155 insertions(+), 152 deletions(-)

-- 
2.11.0


