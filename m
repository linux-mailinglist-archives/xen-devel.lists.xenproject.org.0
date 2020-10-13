Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE1C28CFCA
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 16:06:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6233.16586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSKwA-0007hN-9g; Tue, 13 Oct 2020 14:05:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6233.16586; Tue, 13 Oct 2020 14:05:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSKwA-0007gy-53; Tue, 13 Oct 2020 14:05:58 +0000
Received: by outflank-mailman (input) for mailman id 6233;
 Tue, 13 Oct 2020 14:05:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M+FY=DU=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kSKw9-0007gn-Gq
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 14:05:57 +0000
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bbce91b6-eb35-4f3c-aad1-1bb9acab6041;
 Tue, 13 Oct 2020 14:05:56 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id b69so20908874qkg.8
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2020 07:05:56 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:2df1:3321:942a:fbce])
 by smtp.gmail.com with ESMTPSA id z26sm13793609qki.40.2020.10.13.07.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 07:05:55 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=M+FY=DU=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kSKw9-0007gn-Gq
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 14:05:57 +0000
X-Inumbo-ID: bbce91b6-eb35-4f3c-aad1-1bb9acab6041
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id bbce91b6-eb35-4f3c-aad1-1bb9acab6041;
	Tue, 13 Oct 2020 14:05:56 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id b69so20908874qkg.8
        for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2020 07:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z5sCn2g22QNClDVC8ApV+Mu5VWc6D2QWQMvZw+Aegos=;
        b=CfvQXnZCbKI+aeJIUwszdFQKsZPrD0OxTTWrzEaSn/d3DDvLCCcXgs0dyeR+jPToj2
         ukNtrMP4s3qkhNcd4ZKW8eZc9hXTU5do+L9/1IXwwlil/SY1O+BoBGnTsV9LbPuRBOoW
         wLvovZjgplbCIvu7UWrbpYFfsq6LUq+KITh8knWtWOPyNIDkmkzgC/c/vjm/h9BKZtWR
         F3MUx8xrMrC6VFmBxyBfXPQUwvR2XyfQNtTxOgCECyVPgaWY048xCzZMVL3/JPU2XvOH
         +G7OLxyuA3UDUcVKDN5GSAS0q0FP/GZ8g0JPMLVvw8X0pYznkVSbSR2BOS0Poh4A+h+J
         J4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z5sCn2g22QNClDVC8ApV+Mu5VWc6D2QWQMvZw+Aegos=;
        b=AG4hg/rEiy6IO9qtZMxObc70OtEiA2cRKN+VUG8+22lQwjZ1N5y6uTviHIbnO4k67o
         d30yXrueHsyZo61OVHtif+Zcf+e3WF4iUwLgtklAfMAXvv+A5IRNPBuCbOx5h/lk0S9L
         Y6NmOVvrF/x8V5vDQNAY5hot9CS+6LduDf1Gt+m8tFHWAm9wAJXiCCKhtggrs20KsP0G
         oux9/wJqOlBv2G9R42gO1MCyzXG3rAtvuklP9MiaTcPGfyF86i9Ai9ZJIhA2F7nQO12R
         MXCBwXIXSapXpO3MFthQqAE3c/pJBdvl9IxNwASn+HBP+y1z6zVLqqgvUzhgwnzmcOqB
         6xaw==
X-Gm-Message-State: AOAM530HOA163ed//RvL6zTQ+ae+s2xpAUs7cpusf9/npPeZRzWvTvAb
	SB8uDpuygBcj5dXQYweziN0=
X-Google-Smtp-Source: ABdhPJwtxBEnRnNPjEHcuVVHof6O92obazL/vN2TmbQ5O2rfIz0/rAfUoxQkml2srmIG5IH2ZnkKwQ==
X-Received: by 2002:ae9:ef56:: with SMTP id d83mr100087qkg.83.1602597956496;
        Tue, 13 Oct 2020 07:05:56 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:2df1:3321:942a:fbce])
        by smtp.gmail.com with ESMTPSA id z26sm13793609qki.40.2020.10.13.07.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 07:05:55 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	Jason Andryuk <jandryuk@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH v2 3/3] accel: Add xen CpusAccel using dummy-cpus
Date: Tue, 13 Oct 2020 10:05:11 -0400
Message-Id: <20201013140511.5681-4-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201013140511.5681-1-jandryuk@gmail.com>
References: <20201013140511.5681-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen was broken by commit 1583a3898853 ("cpus: extract out qtest-specific
code to accel/qtest").  Xen relied on qemu_init_vcpu() calling
qemu_dummy_start_vcpu() in the default case, but that was replaced by
g_assert_not_reached().

Add a minimal "CpusAccel" for Xen using the dummy-cpus implementation
used by qtest.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 accel/meson.build   | 1 +
 accel/xen/xen-all.c | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/accel/meson.build b/accel/meson.build
index 9a417396bd..b26cca227a 100644
--- a/accel/meson.build
+++ b/accel/meson.build
@@ -12,3 +12,4 @@ dummy_ss.add(files(
 ))
 
 specific_ss.add_all(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'], if_true: dummy_ss)
+specific_ss.add_all(when: ['CONFIG_XEN'], if_true: dummy_ss)
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 60b971d0a8..878a4089d9 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -16,6 +16,7 @@
 #include "hw/xen/xen_pt.h"
 #include "chardev/char.h"
 #include "sysemu/accel.h"
+#include "sysemu/cpus.h"
 #include "sysemu/xen.h"
 #include "sysemu/runstate.h"
 #include "migration/misc.h"
@@ -153,6 +154,10 @@ static void xen_setup_post(MachineState *ms, AccelState *accel)
     }
 }
 
+const CpusAccel xen_cpus = {
+    .create_vcpu_thread = dummy_start_vcpu_thread,
+};
+
 static int xen_init(MachineState *ms)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
@@ -180,6 +185,9 @@ static int xen_init(MachineState *ms)
      * opt out of system RAM being allocated by generic code
      */
     mc->default_ram_id = NULL;
+
+    cpus_register_accel(&xen_cpus);
+
     return 0;
 }
 
-- 
2.25.1


