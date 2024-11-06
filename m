Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 721469BF58F
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 19:47:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831306.1246555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8l3A-0002vG-P9; Wed, 06 Nov 2024 18:46:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831306.1246555; Wed, 06 Nov 2024 18:46:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8l3A-0002s4-Jw; Wed, 06 Nov 2024 18:46:40 +0000
Received: by outflank-mailman (input) for mailman id 831306;
 Wed, 06 Nov 2024 18:46:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aqLR=SB=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1t8l39-0001q9-Ke
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 18:46:39 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7365aef6-9c6f-11ef-99a3-01e77a169b0f;
 Wed, 06 Nov 2024 19:46:36 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a9acafdb745so35862666b.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 10:46:36 -0800 (PST)
Received: from localhost.localdomain ([89.101.134.25])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb16d9d68sm317330266b.72.2024.11.06.10.46.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 06 Nov 2024 10:46:35 -0800 (PST)
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
X-Inumbo-ID: 7365aef6-9c6f-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmYiLCJoZWxvIjoibWFpbC1lajEteDYyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjczNjVhZWY2LTljNmYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTE4Nzk2LjQ5NjAwOCwic2VuZGVyIjoicGhpbG1kQGxpbmFyby5vcmciLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730918796; x=1731523596; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsFK2U3XFqb/vEljmH+2siHctjoVhJmmiNdlJHfI0/4=;
        b=W/J9lIP6zrElw4Hq74bucweEH1iuYzhVkfIZnGeKvjmhiR637CEOELSdwbQ5ov/FzW
         XUhrEcp/0eByp4ffvDhX8XpY79dFhu8zwzLcG7ZzFD+TEynWkoC3J/U42YkuXsTQ9klK
         QCztpol6HIUaPiKFk97spKmU2bX29AVbVwsHrLaMyFBdm3ce3l89LucJP0zNr1F6Qvvy
         vKipokhQYP4AkczuC6DWCsmxR3SAfRGPgOuKWbRk22raHwL8catbRDmryJi6Z3ewnkl3
         9hWby6R00rOi8t3E3Kdf+grGfMkOqSp9PpfSTEvZ4DzVn0uniHNazPBEwZPlyeZPVh5L
         IBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730918796; x=1731523596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YsFK2U3XFqb/vEljmH+2siHctjoVhJmmiNdlJHfI0/4=;
        b=QtycT7FjhMyvnwCN1HQMyNNiRQXXblxZ8IOezV7m2v8/fJUjnx/01kEdfWp6OS+3Yw
         9u0oHl3ySAhZ30nOSfBLKiKFSh6+4/gehHv4jjgwBRw/uQdzJEW10yfjeKD3BK7xufaz
         MnFlRc1t3IRaZj9CvL+uwSvuvDd2YL1WQpC1sdMcSyXkSBnAJX+ND6G4RikzMjgMwZ9A
         sneQ7EJ5k4xGm+xEg71XykFJzT5HaRGOBT+hr5eS2lfDeIWjRZCDW70G6BHwZh9kbTmh
         DpPKfSKw9AVjDbz/VXquJMEesOzhtgJUIP9b7eY8KFKMbH8xuc67tZSK/5bqC3sBTWDk
         LoNA==
X-Forwarded-Encrypted: i=1; AJvYcCUjHSc1O/tm83TUcbpyIDRMzboflgJ/e+gNL6+BwhZOFff+J5YmPC6zdMOCzxefFHsA1LHFZzyZCLo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwT5qLqg1Rf/SqDQI38huvA47Gr44/KDtQdpur4D+6i57JIEvQJ
	wr2W9jrzpNew5OB7xleZM6vd0JAyuFhjvXLJ8cod87GPvjoedBsKaMOsYU1pmfE=
X-Google-Smtp-Source: AGHT+IE+L+yQyHT39fSRf4/OhKcpAqJYHinN1o/h9Nj2ZuOUgW78Lq2jC2oQuBoUyZL+R29YcaV+GA==
X-Received: by 2002:a17:907:7f90:b0:a9e:670f:9485 with SMTP id a640c23a62f3a-a9ed51c6ed6mr17121666b.30.1730918795914;
        Wed, 06 Nov 2024 10:46:35 -0800 (PST)
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
Subject: [PATCH 4/5] hw/openrisc: Mark devices as big-endian
Date: Wed,  6 Nov 2024 18:46:11 +0000
Message-ID: <20241106184612.71897-5-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241106184612.71897-1-philmd@linaro.org>
References: <20241106184612.71897-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These devices are only used by the OpenRISC target, which is
only built as big-endian. Therefore the DEVICE_NATIVE_ENDIAN
definition expand to DEVICE_BIG_ENDIAN (besides, the
DEVICE_LITTLE_ENDIAN case isn't tested). Simplify directly
using DEVICE_BIG_ENDIAN.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/openrisc/openrisc_sim.c | 2 +-
 hw/openrisc/virt.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index 9fb63515ef..794c175bdb 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -266,7 +266,7 @@ static void openrisc_sim_serial_init(Or1ksimState *state, hwaddr base,
     }
     serial_mm_init(get_system_memory(), base, 0, serial_irq, 115200,
                    serial_hd(OR1KSIM_UART_COUNT - uart_idx - 1),
-                   DEVICE_NATIVE_ENDIAN);
+                   DEVICE_BIG_ENDIAN);
 
     /* Add device tree node for serial. */
     nodename = g_strdup_printf("/serial@%" HWADDR_PRIx, base);
diff --git a/hw/openrisc/virt.c b/hw/openrisc/virt.c
index 47d2c9bd3c..ede57fe391 100644
--- a/hw/openrisc/virt.c
+++ b/hw/openrisc/virt.c
@@ -236,7 +236,7 @@ static void openrisc_virt_serial_init(OR1KVirtState *state, hwaddr base,
     qemu_irq serial_irq = get_per_cpu_irq(cpus, num_cpus, irq_pin);
 
     serial_mm_init(get_system_memory(), base, 0, serial_irq, 115200,
-                   serial_hd(0), DEVICE_NATIVE_ENDIAN);
+                   serial_hd(0), DEVICE_BIG_ENDIAN);
 
     /* Add device tree node for serial. */
     nodename = g_strdup_printf("/serial@%" HWADDR_PRIx, base);
-- 
2.45.2


