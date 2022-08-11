Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0F659072D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 22:00:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385155.620690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMELC-00027n-SG; Thu, 11 Aug 2022 19:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385155.620690; Thu, 11 Aug 2022 19:59:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMELC-00024N-PV; Thu, 11 Aug 2022 19:59:38 +0000
Received: by outflank-mailman (input) for mailman id 385155;
 Thu, 11 Aug 2022 19:59:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3/DV=YP=citrix.com=prvs=21511e084=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oMELB-00024H-6L
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 19:59:37 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e4f691f-19b0-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 21:59:35 +0200 (CEST)
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
X-Inumbo-ID: 1e4f691f-19b0-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660247975;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1wTTAmkP1sTOy6uXkQm9Y1aQZWYNUG4XBsWtqt3+8t4=;
  b=frCObnwjJfi7q3pUjuqdCABYrg2aYmOcieEJ9kANF1kVw0n2EpLoOV7r
   E9zMO5Ldr2LZErMt1Awa9Cs0g8auSp6/QbM8o7ISPfbzbNMvLwhShZqLY
   G9nibvemFPu/N+746SDcSY6V+JZ9TggvWwPSB/WtupYnvkKgabxwUaTM8
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77908203
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:AfLOg6sHA8oEIKBIWY/Uk4Hc4ufnVDheMUV32f8akzHdYApBsoF/q
 tZmKW6GPPqONGD8fIpyPNm+8h4P75HRzdBqTAE+/3gyFioW+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzl8B56r8ks15qyi4WpA5DTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FZ8opPxQBkdkz
 9M3JAIvQQqloLmy/ZvuH4GAhux7RCXqFIYWu3UmxjDFF/c2B5vERs0m5/cBgm123JoXW6+DO
 YxJMlKDbzyZC/FLEn4RBIgzg6GDgX7nficDgFmUubA28y7YywkZPL3Fb4WEIozQHZ49ckCw/
 GaZ223bOAEmMuez2GvU21fylOv3pHauMG4VPOLhraM76LGJ/UQMDDUGWF39puO24maccd9CL
 00f+gI1sLM/skesS7HVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAOHKr+dvG2Zsj
 AXQ2Yq0W3o/69V5VE5x6J+GnW2oHi8zB1UtSiM2byQfxf64pLwa20enoslYLEKlsjHkMWiun
 WjS/Xdn3ut7Yd0jjPviow2e6964jt2QF1NuuF2KNo6wxlkhDLNJcbBE/rQyARxoCI+CBmeMs
 3Ef8yR1xLBfVMrd/MBhrQhkIV1I2xpmGGeF6bKXN8N9nwlBAlb6FWyq3BlwJV1yLuEPciLzb
 UnYtGt5vcENZCL3M/InOd3hUqzGKJQM8vy7Ps04k/IUOsQhHON51HgGibGsM5DFzxF3zPBX1
 WazesewF3cKYZlaIM6Nb75EidcDm3FhrV4/sLihkHxLJ5LCOyPOIVrEWXPSBt0EAFSs+lWIq
 okFZ5TRln2ykoTWO0HqzGLaFnhSRVBTOHw8g5U/mjKrSua+JFwcNg==
IronPort-HdrOrdr: A9a23:ZiDIIqy1oD0e+t7Hb8Q8KrPwIL1zdoMgy1knxilNoRw8SKKlfq
 eV7ZMmPH7P+VIssR4b+exoVJPtfZq+z+8R3WByB8bAYOCOggLBR+sO0WKL+UyHJ8SUzI9gPM
 lbHJSWcOeAb2RHsQ==
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="77908203"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 0/2] x86/spec-ctrl: Reduce HVM RAS overhead
Date: Thu, 11 Aug 2022 20:59:03 +0100
Message-ID: <20220811195905.7780-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is a optimsiation discovered while working on Retbleed.

Andrew Cooper (2):
  x86/svm: Remove regs param from asm-called functions
  x86/svm: Keep the RAS balanced for guests

 xen/arch/x86/hvm/svm/entry.S     | 58 ++++++++++++++++++++++++++++++++++++----
 xen/arch/x86/hvm/svm/nestedsvm.c |  3 ++-
 xen/arch/x86/hvm/svm/svm.c       |  6 +++--
 3 files changed, 59 insertions(+), 8 deletions(-)

-- 
2.11.0


