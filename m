Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8760E9BF590
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 19:47:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831303.1246543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8l36-0002X0-Ei; Wed, 06 Nov 2024 18:46:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831303.1246543; Wed, 06 Nov 2024 18:46:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8l36-0002Ub-BZ; Wed, 06 Nov 2024 18:46:36 +0000
Received: by outflank-mailman (input) for mailman id 831303;
 Wed, 06 Nov 2024 18:46:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aqLR=SB=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1t8l34-0001q9-Rx
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 18:46:34 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7081103d-9c6f-11ef-99a3-01e77a169b0f;
 Wed, 06 Nov 2024 19:46:31 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a9ec267b879so10426066b.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 10:46:31 -0800 (PST)
Received: from localhost.localdomain ([89.101.241.141])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb16f8e2csm315523366b.91.2024.11.06.10.46.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 06 Nov 2024 10:46:30 -0800 (PST)
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
X-Inumbo-ID: 7081103d-9c6f-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmQiLCJoZWxvIjoibWFpbC1lajEteDYyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjcwODExMDNkLTljNmYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTE4NzkxLjY1MTExNSwic2VuZGVyIjoicGhpbG1kQGxpbmFyby5vcmciLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730918791; x=1731523591; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yO3kVmbmcBoFVWzYS+y583sX7R+jYDZcKW8eZMLJiQc=;
        b=NUt1njxNyP8K7t5dDpRveanq80bKrNrMgU6qV2xkKJLI/uePjUWSeoKhlxfTHwMvIw
         A/DIDcX1HF8nWkWfW8cdI0sVzmRuFjX9DxxxQZ3cFC70ASg5ziFEIaML9wjk7Rhx/QNw
         ctn9SSRs7X/m3UkS5kqSSkWfkcx6FPFRaQG7FGS51luUnSJ3qXkDYu0b0ZsbwoeLPIae
         caGQZew0oW/Xdvhz70NKDCFBsDrjOlFud4EXLCJ0D5PCt9vAB3A9g+upyw4zkvwY2cgf
         7NvpTivJjgvbIBKKNVc5V8p0JzH403mo5826ji381tHKxrS9dFbKzEVq1IQ3fzxfviLl
         Z2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730918791; x=1731523591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yO3kVmbmcBoFVWzYS+y583sX7R+jYDZcKW8eZMLJiQc=;
        b=ZMsVqjbqRrLPjo1skImcGIB2a+XNjjEhyvJaYAX8+J+6I8sIb1NZUcDXOlOEg3B8Lk
         HJBrrLnG5oc//zOk4hr+lEHTtpJM0fmgrEPctNVBMcOO94S1EeksbCu/+KTZYSmy0RDk
         Th/lF86PXZ0/c8lcwiibh0q3I+yrdspUPTGvUd0jH3iHUCCJMHNewBX5+u0a6vGOD7lO
         ZbQpwVsIxE79UkVYuaTOiWqON65egdqup2f1tRJTW3gUk5OG1bO3C0wlAKKnnuAdrj6s
         494W8OqSB8dCN4WSn8cK4nX1gvKWyLIL9WJtceB2Jw+gGVvAyiNtXkcqjxuchPtfI33+
         tX4g==
X-Forwarded-Encrypted: i=1; AJvYcCWVvcEHmJQmBUam66u4RN8M0ECYlZXcNRe27yA9YPF5BY33LIE6XoGCdaD8yLofS0Ql0sWP3kJWZTo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxbaLjydEfog9Mj5cb8JaByWDI7LJRUhUXtSw0DrBRrYaCkx+Ou
	KpGwQFDvVlft2Q1+hgMQRuR0d8Ze7/UiXe48sPmSYPb+XVWIr4fF+tia70fS9F4=
X-Google-Smtp-Source: AGHT+IHLwEYzjh7bE7VY6UKu2vqJy3kDHJGLTpvdAYwpwyzxfVfdumNtAIjQKBsxyhavBG7XBennEQ==
X-Received: by 2002:a17:907:7ba7:b0:a9a:522a:eddd with SMTP id a640c23a62f3a-a9e5089b4admr2275919566b.11.1730918790907;
        Wed, 06 Nov 2024 10:46:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Artyom Tarasenko <atar4qemu@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Anthony PERARD <anthony@xenproject.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Thomas Huth <huth@tuxfamily.org>,
	Jia Liu <proljc@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Paul Durrant <paul@xen.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/5] hw/m68k: Mark devices as big-endian
Date: Wed,  6 Nov 2024 18:46:10 +0000
Message-ID: <20241106184612.71897-4-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241106184612.71897-1-philmd@linaro.org>
References: <20241106184612.71897-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These devices are only used by the M68K target, which is only
built as big-endian. Therefore the DEVICE_NATIVE_ENDIAN
definition expand to DEVICE_BIG_ENDIAN (besides, the
DEVICE_LITTLE_ENDIAN case isn't tested). Simplify directly
using DEVICE_BIG_ENDIAN.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/m68k/mcf5206.c  | 2 +-
 hw/m68k/mcf5208.c  | 6 +++---
 hw/m68k/mcf_intc.c | 2 +-
 hw/m68k/next-kbd.c | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/m68k/mcf5206.c b/hw/m68k/mcf5206.c
index 7247cdbe5e..4892924fc2 100644
--- a/hw/m68k/mcf5206.c
+++ b/hw/m68k/mcf5206.c
@@ -582,7 +582,7 @@ static const MemoryRegionOps m5206_mbar_ops = {
     .write = m5206_mbar_writefn,
     .valid.min_access_size = 1,
     .valid.max_access_size = 4,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_BIG_ENDIAN,
 };
 
 static void mcf5206_mbar_realize(DeviceState *dev, Error **errp)
diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
index e37cd50d18..4166877066 100644
--- a/hw/m68k/mcf5208.c
+++ b/hw/m68k/mcf5208.c
@@ -155,7 +155,7 @@ static uint64_t m5208_timer_read(void *opaque, hwaddr addr,
 static const MemoryRegionOps m5208_timer_ops = {
     .read = m5208_timer_read,
     .write = m5208_timer_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_BIG_ENDIAN,
 };
 
 static uint64_t m5208_sys_read(void *opaque, hwaddr addr,
@@ -192,7 +192,7 @@ static void m5208_sys_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps m5208_sys_ops = {
     .read = m5208_sys_read,
     .write = m5208_sys_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_BIG_ENDIAN,
 };
 
 static uint64_t m5208_rcm_read(void *opaque, hwaddr addr,
@@ -224,7 +224,7 @@ static void m5208_rcm_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps m5208_rcm_ops = {
     .read = m5208_rcm_read,
     .write = m5208_rcm_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_BIG_ENDIAN,
 };
 
 static void mcf5208_sys_init(MemoryRegion *address_space, qemu_irq *pic,
diff --git a/hw/m68k/mcf_intc.c b/hw/m68k/mcf_intc.c
index 9fc30b03ba..5f38c49077 100644
--- a/hw/m68k/mcf_intc.c
+++ b/hw/m68k/mcf_intc.c
@@ -166,7 +166,7 @@ static void mcf_intc_reset(DeviceState *dev)
 static const MemoryRegionOps mcf_intc_ops = {
     .read = mcf_intc_read,
     .write = mcf_intc_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_BIG_ENDIAN,
 };
 
 static void mcf_intc_instance_init(Object *obj)
diff --git a/hw/m68k/next-kbd.c b/hw/m68k/next-kbd.c
index bc67810f31..4d87edc2de 100644
--- a/hw/m68k/next-kbd.c
+++ b/hw/m68k/next-kbd.c
@@ -163,7 +163,7 @@ static const MemoryRegionOps kbd_ops = {
     .write = kbd_writefn,
     .valid.min_access_size = 1,
     .valid.max_access_size = 4,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_BIG_ENDIAN,
 };
 
 static void nextkbd_event(void *opaque, int ch)
-- 
2.45.2


