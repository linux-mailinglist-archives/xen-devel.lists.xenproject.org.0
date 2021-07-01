Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7863B92E5
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 16:10:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148703.274809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxOY-0005Nu-UC; Thu, 01 Jul 2021 14:10:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148703.274809; Thu, 01 Jul 2021 14:10:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxOY-0005Lz-R4; Thu, 01 Jul 2021 14:10:22 +0000
Received: by outflank-mailman (input) for mailman id 148703;
 Thu, 01 Jul 2021 14:10:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxOX-0005KT-06
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:10:21 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6d7bec2-fc7c-4841-b48a-662147126978;
 Thu, 01 Jul 2021 14:10:20 +0000 (UTC)
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
X-Inumbo-ID: f6d7bec2-fc7c-4841-b48a-662147126978
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625148620;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M6ZtiyzeBF8+xl4b4ReAdiPAiV8nv9ZrRcrwPVwToLw=;
  b=djwyYSDoGnR6L0cB6cL3Ot8ERH+w5cv68Z4FwVCd36NJVLcFClINhzuj
   zw6WaNMO9NO0nzDNbPLpTlthkz1ta+Fy6uAAX9IXK/2PZT6Saf67I0jeA
   /BOKHCb2EN1m+fehpijz0S9wCzU9J7AGB4mfS+kjedfnmxEcggBICTner
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: JX4PJpMfXqJB1Jhc9vF/KyT0TFFbWgzenewcihWWkjultgZsxthgoZfN8cTFCjsO6R1XQjOUNI
 YqP1GKUk8RP6E8GblNXfOkRA0t1D8Qdyuu5BnyqdGQP+1wNcu8dN3PnDHQfNESfq/JMyBSswqB
 qATb211dJjZxLrrxHwX4kr/u9OclwZPqzLTjpedJSmsAjtFyycNPsSF4CgXNupgYFKaUOOf6ts
 xRZIWI0yfrkFsxbo9jZRibB7KrQ4mMbTh9UiOzbf9OkVD9CWYVkyTPajS7w1bPzGUJ1m12YX8G
 BMQ=
X-SBRS: 5.1
X-MesageID: 47093296
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Txlc0KOGQSvGR8BcTvmjsMiBIKoaSvp037Eqv3oedfUzSL3/qy
 nOpoVi6faaslYssR0b9exofZPwJE80lqQFhrX5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtrJ
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47093296"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v6 01/31] build: fix %.s: %.S rule
Date: Thu, 1 Jul 2021 15:09:41 +0100
Message-ID: <20210701141011.785641-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701141011.785641-1-anthony.perard@citrix.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Fixes: e321576f4047 ("xen/build: start using if_changed")
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v6:
    - new patch

 xen/Rules.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index ceb3d204b84f..d65d6a48993b 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -227,8 +227,8 @@ cmd_cpp_i_c = $(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) -MQ $@ -o $@ $<
 quiet_cmd_cc_s_c = CC      $@
 cmd_cc_s_c = $(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -S $< -o $@
 
-quiet_cmd_s_S = CPP     $@
-cmd_s_S = $(CPP) $(filter-out -Wa$(comma)%,$(a_flags)) -MQ $@ -o $@ $<
+quiet_cmd_cpp_s_S = CPP     $@
+cmd_cpp_s_S = $(CPP) $(filter-out -Wa$(comma)%,$(a_flags)) -MQ $@ -o $@ $<
 
 %.i: %.c FORCE
 	$(call if_changed,cpp_i_c)
-- 
Anthony PERARD


