Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AC9fHHNU/GlOOAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:59:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4D74E561A
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:59:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302344.1576370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKuZm-0004uQ-FC; Thu, 07 May 2026 08:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302344.1576370; Thu, 07 May 2026 08:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKuZl-0004q1-VB; Thu, 07 May 2026 08:59:21 +0000
Received: by outflank-mailman (input) for mailman id 1302344;
 Thu, 07 May 2026 08:59:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKuZj-0004BH-EO
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 08:59:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKuZi-005UsV-RG
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 10:59:18 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fc545f-e002-0a2a0a5209dd-0a2a4501ca64-46
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:59:18 +0200
Received: from [209.85.208.46] (helo=mail-ed1-f46.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fc5466-c1f2-0a2a45010019-d155d02ecdcd-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:59:18 +0200
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-67c1e0229acso818406a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 01:59:18 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bc81d5e9583sm57549966b.17.2026.05.07.01.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 01:59:16 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778144358; x=1778749158; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4xx6/9HjQw0qDDPVFVAifvL6T1Uk5lWG9wv0V6Tryc=;
        b=arfaYfjsPY0xibppCmeb4yALQvEfJo5UbdgLTT9a4KcOLx6jj8PA9l4o38QXhvJvDB
         LRBKkUAXYYIDwYy/A0rxHosR/naXy0Fzh6r+bp/YO1Q4Av3b7J/GmT6nTcT8vPsYcUMo
         pkP8Z480AIgoxtmXizFhf4Rc4kayEZKKpEOl/dD00VeuwFTBUu12nT109YH4yLR9UGZN
         MQwvsQy0urlgGUsE0WvQTrL4p7Ld5Y9hskWIfe0hpT+j+E4Ba78SlTLz8JlXNMnNKDVV
         oIp2Nu4cHVwzuPi9f/8eff6nM3vhrfR/r2ZHzpqKP8NWLe8dTuo3YA4o5Sm9g9qNB/J0
         DqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778144358; x=1778749158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x4xx6/9HjQw0qDDPVFVAifvL6T1Uk5lWG9wv0V6Tryc=;
        b=VSHczLp72NOjb1/r/zD2uBspNDz8ggO2t7LnyCqGz6g1LNAvldjCND7ojPSCaAhb7h
         u6CHRI+SxSYPe5bA9d9RSAkWrztxCZ/XTEeA4k0NvkeVv7hXdZqA5LJlQbZR+Inyvl4Q
         SPrJsMI5p1td5UHeIR+GMEd9TvE3KH3V4LmXXKl3HCC6iszyPDqzk7bU0HgUPrfr5veD
         0pGz5CwhoZVYvR+SECwP8Io22y/QB5T6ulHJaZeYDxHZEn73hAQuQGfdotsmDk404omM
         N/0Is/7nQfjIdULNmZZW6nfvFfPItHxkzZBXAtO0QED264uGiUXdfuSv4kVEoXpEGFTJ
         K2Fg==
X-Gm-Message-State: AOJu0YySDb9GhX2g9ipj4ndCS/378sd+GyQVN6A4hl4qQMBwOJSXSTVG
	xp9oMPdJTxHM+N+N4AALd90yXQcXsvMJplooEhVxVU9wlqkC5xENBDC7NAmKBg==
X-Gm-Gg: AeBDiesNM1cwXQIhJsBi0R1RqRMkn10Gic30KDpaNCj9FkNnUyQTabEvMACLZCn9hjM
	gu4XuNkgj3/Eu5GlUIE3pk9L+3QQDYCieOFiyRizBUDeyDO5qcmbVfXcRjdual3G1DFSW+9VRxb
	Q3C/RLhqnnyJLBpaA4OtrBUmKyI6m8NgNvUXsNolyLTLhr3m1ZW+EtLGbOnY681WhwTEq7+rotB
	wbaF8EEn6EhFaByDYX/JWHUXsBCMN29c+ggWbYj1yEZwwfWLRVGU96M4xPAYX6LO6y8umGow7tp
	jyePTBlvgOOsSo4WnlbKX1Xhag/pPS4NCIf0H+jvJz1/NQXzjyMsiNfPHvedNwxThZoKJW1uJlS
	51uO4OlOPk1q2Oam2f2zQrXFdPsoNAxcOYrDGXkZCA1FE8nvOpGuJhWZWs0CDWJ9ORk0WdFksWC
	UfZe2y3R80KMTU84jiezBs/Rby7Egf/LM32zTKTPynGbbZr5cB71OQ5cJkWRQYQaY3xf+HNYeqS
	2EO
X-Received: by 2002:a17:907:c06:b0:b9c:9594:e00 with SMTP id a640c23a62f3a-bc56aa4283emr413226166b.1.1778144357643;
        Thu, 07 May 2026 01:59:17 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 10/11] xen/riscv: add definition of guest RAM banks
Date: Thu,  7 May 2026 10:58:49 +0200
Message-ID: <9c04bfe7d7f5510e164567c35e6ea223509f45d5.1778140240.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778140240.git.oleksii.kurochko@gmail.com>
References: <cover.1778140240.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1778144358-AC457FF4-4B987711/10/73395122804
X-purgate-type: spam
X-purgate-size: 3241
X-Rspamd-Queue-Id: 1E4D74E561A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

The dom0less solution uses defined RAM banks as compile-time constants,
so introduce macros to describe guest RAM banks.

The reason for 2 banks is that there is typically always a use case for
low memory under 4 GB, but the bank under 4 GB ends up being small because
there are other things under 4 GB it can conflict with (interrupt
controller, PCI BARs, etc.). So a second bank is added above that MMIO
region (starting at 8 GiB) to provide the remaining RAM; the gap between
the two banks also exercises code paths handling discontiguous memory.
For Sv32 guests (34-bit GPA, 16 GiB addressable), bank0 provides 2 GB
(2–4 GB) and the first 8 GB of bank1 (8–16 GB) is accessible.

Extended regions are useful for RISC-V: they could be used to provide a
"space" for Linux to map grant mappings.

Despite the fact that for every guest MMU mode the GPA could be up
to 56 bits wide (except Sv32 whose GPA is 34 bits), the combined size
of both banks is limited to 1018 GB as it is more than enough for most
use cases.

Add inclusion of asm/guest-layout.h to asm/domain.h to make dom0less
common code build happy.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5:
 - Nothing changed. Only rebase.
---
Changes in v4:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v3:
 - Move GUEST_RAM*-related defines to asm/p2m.h instead of public header.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/include/asm/domain.h       |  1 +
 xen/arch/riscv/include/asm/guest-layout.h | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/guest-layout.h

diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 6c48bf13111d..6044ce0feee0 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -7,6 +7,7 @@
 #include <xen/xmalloc.h>
 #include <public/hvm/params.h>
 
+#include <asm/guest-layout.h>
 #include <asm/p2m.h>
 #include <asm/vtimer.h>
 
diff --git a/xen/arch/riscv/include/asm/guest-layout.h b/xen/arch/riscv/include/asm/guest-layout.h
new file mode 100644
index 000000000000..68d95a09394c
--- /dev/null
+++ b/xen/arch/riscv/include/asm/guest-layout.h
@@ -0,0 +1,23 @@
+#ifndef ASM_RISCV_GUEST_LAYOUT_H
+#define ASM_RISCV_GUEST_LAYOUT_H
+
+#include <public/xen.h>
+
+#define GUEST_RAM_BANKS   2
+
+/*
+ * The way to find the extended regions (to be exposed to the guest as unused
+ * address space) relies on the fact that the regions reserved for the RAM
+ * below are big enough to also accommodate such regions.
+ */
+#define GUEST_RAM0_BASE   xen_mk_ullong(0x80000000) /* 2GB of low RAM @ 2GB */
+#define GUEST_RAM0_SIZE   xen_mk_ullong(0x80000000)
+
+#define GUEST_RAM1_BASE   xen_mk_ullong(0x0200000000) /* 1016 GB of RAM @ 8GB */
+#define GUEST_RAM1_SIZE   xen_mk_ullong(0xFE00000000)
+
+/* TODO: allocate these all dynamically */
+#define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
+#define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }
+
+#endif /* ASM_RISCV_GUEST_LAYOUT_H */
-- 
2.54.0


