Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A393F5C63
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 12:51:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170896.311923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIU1F-0001w1-PC; Tue, 24 Aug 2021 10:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170896.311923; Tue, 24 Aug 2021 10:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIU1F-0001sQ-Lr; Tue, 24 Aug 2021 10:51:01 +0000
Received: by outflank-mailman (input) for mailman id 170896;
 Tue, 24 Aug 2021 10:51:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU1E-0001EC-7s
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:51:00 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef0fc935-9c35-46d8-a7ef-10ed928aeba0;
 Tue, 24 Aug 2021 10:50:51 +0000 (UTC)
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
X-Inumbo-ID: ef0fc935-9c35-46d8-a7ef-10ed928aeba0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802251;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q742NIKsfagzLTI5IRupvO4GLE3bLFBwUaLmp6zd0iU=;
  b=ewvO3pYNInt3Ak6F8VmSe8r0zV+C+2jfUmaQb5C0WQ+WwZK5PY+CkZ7Z
   EZlrlZdXgtZJaNZ7tsvPiBMtIofAXLgUAbXMK+CkDlGhptxZkhtJcLaMd
   3b425zHaoiBDP47wbnrb/EFw7irWCTZZ0Fbe+rdFq1aMNWYcqp4y2bVtf
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 2ibQmHC7TUxW3LONtSaNsTqjpSt2xZEyWMZFxgziJ7B03C4tL1Pvpb0sScLPd34rI20DEBBrkG
 1QwFvR/nyHdxIflkipHqSQPmnZVeXEikszOd1uii8/n2noZ8jzt7CsQCsmgxNzztIHUh7szzWQ
 KDhkk6/UNeOKktnfG2bwCZGjlLsob8OhYuYnKBy3JB20FNhg1/hVTAauG1/t/Jn69lOT6VpINc
 TLSVGh3Lg2vh298nklo8mK2qFjCEiGvEaby1t7jAT0H99or5RUsT4SJQ3Gl9MLXWVZ83gqUqWr
 swPzu1VnrHzlUsJ4OrFr+J80
X-SBRS: 5.1
X-MesageID: 51166334
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:rrW4qKz8RU4/Y18Hk6ZjKrPw1r1zdoMgy1knxilNoHxuH/BwWf
 rPoB17726RtN91YhsdcL+7V5VoLUmzyXcX2/h1AV7BZniEhILAFugLgbcKqweKJ8SUzJ8+6U
 4PSclD4N2bNykGsS75ijPIb+rJFrO8gd+VbeS19QYScelzAZsQiDuQkmygYzZLrA8tP+teKL
 OsovBpihCHYnotYsGyFhA+LpL+T42iruOeXfYebSRXkDWzsQ==
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51166334"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v7 03/51] build: use if_changed_rules with %.o:%.c targets
Date: Tue, 24 Aug 2021 11:49:50 +0100
Message-ID: <20210824105038.1257926-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Use $(dot-target) to have the target name prefix with a dot.

Now, when the CC command has run, it is recorded in .*.cmd
file, then if_changed_rules will compare it on subsequent runs.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/Rules.mk | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index 5a6a5d63260f..eaf770414305 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -192,19 +192,27 @@ FORCE:
 
 SRCPATH := $(patsubst $(BASEDIR)/%,%,$(CURDIR))
 
-%.o: %.c Makefile
+quiet_cmd_cc_o_c = CC      $@
 ifeq ($(CONFIG_ENFORCE_UNIQUE_SYMBOLS),y)
-	$(CC) $(c_flags) -c $< -o $(@D)/.$(@F).tmp -MQ $@
-ifeq ($(CONFIG_CC_IS_CLANG),y)
-	$(OBJCOPY) --redefine-sym $<=$(SRCPATH)/$< $(@D)/.$(@F).tmp $@
-else
-	$(OBJCOPY) --redefine-sym $(<F)=$(SRCPATH)/$< $(@D)/.$(@F).tmp $@
-endif
-	rm -f $(@D)/.$(@F).tmp
+    cmd_cc_o_c = $(CC) $(c_flags) -c $< -o $(dot-target).tmp -MQ $@
+    ifeq ($(CONFIG_CC_IS_CLANG),y)
+        cmd_objcopy_fix_sym = $(OBJCOPY) --redefine-sym $<=$(SRCPATH)/$< $(dot-target).tmp $@
+    else
+        cmd_objcopy_fix_sym = $(OBJCOPY) --redefine-sym $(<F)=$(SRCPATH)/$< $(dot-target).tmp $@
+    endif
+    cmd_objcopy_fix_sym += && rm -f $(dot-target).tmp
 else
-	$(CC) $(c_flags) -c $< -o $@
+    cmd_cc_o_c = $(CC) $(c_flags) -c $< -o $@
 endif
 
+define rule_cc_o_c
+    $(call cmd_and_record,cc_o_c)
+    $(call cmd,objcopy_fix_sym)
+endef
+
+%.o: %.c FORCE
+	$(call if_changed_rule,cc_o_c)
+
 quiet_cmd_cc_o_S = CC      $@
 cmd_cc_o_S = $(CC) $(a_flags) -c $< -o $@
 
-- 
Anthony PERARD


