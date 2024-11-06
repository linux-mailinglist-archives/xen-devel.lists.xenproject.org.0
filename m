Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9E09BF58E
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 19:47:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831310.1246564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8l3G-0003NS-4B; Wed, 06 Nov 2024 18:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831310.1246564; Wed, 06 Nov 2024 18:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8l3G-0003J5-0k; Wed, 06 Nov 2024 18:46:46 +0000
Received: by outflank-mailman (input) for mailman id 831310;
 Wed, 06 Nov 2024 18:46:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aqLR=SB=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1t8l3E-0001q9-LQ
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 18:46:44 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7676c029-9c6f-11ef-99a3-01e77a169b0f;
 Wed, 06 Nov 2024 19:46:41 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-53a097aa3daso33057e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 10:46:41 -0800 (PST)
Received: from localhost.localdomain ([89.101.134.25])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb16a7dc6sm314521266b.7.2024.11.06.10.46.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 06 Nov 2024 10:46:40 -0800 (PST)
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
X-Inumbo-ID: 7676c029-9c6f-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmUiLCJoZWxvIjoibWFpbC1sZjEteDEyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijc2NzZjMDI5LTljNmYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTE4ODAxLjU3MzQzOCwic2VuZGVyIjoicGhpbG1kQGxpbmFyby5vcmciLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730918801; x=1731523601; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkGkfKVgrldMieE36JppEsQQQbpaD8YlgbmPxpDRAVA=;
        b=EOmEPHvSv1wcVQwCWiWpG7S6c3OlvR54obZp1jOR63EAZ9qDnE1DnKmW2QKC8tJ/mV
         1FPVnMadyv/cWy94mNDAS03yzb34OtrWUkueDzVFwcrTlFqg5rwtawICgEwOMA+J7bS/
         ThUogKEVzUxXkdPY8zwBOh9UBrsQWNkz9XyL/wumycnr5VLzV94iwifRBraoKU0PPPSz
         uShXBolxIp4EIYxFeivGx4Ky8NVy5vuT3/Vfk8KDpZYZAHi/7qV9p+ZGW/IOuwzP8JrR
         Zs+pgw+LXCz+ek6scG2Iq0LLJOxIUYZlF45AruQuH4dtmfFzgn7fsmxEpSRycoremOI+
         CHJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730918801; x=1731523601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MkGkfKVgrldMieE36JppEsQQQbpaD8YlgbmPxpDRAVA=;
        b=XKXdnKSrUOM2u8X5iLKI6rJtKMq0JBO+ou3rNCRjL1fqNcur/5pCP00ZT2Eb18tu3T
         HeIJbqNguBWud+9jQCIWeorqe72fSwQP1fIfqlasI1+G8AG/4/I+o5hDVrmDpCeCylXS
         lGfDzW8zSMkCbEeMCLIAPCGg+fXkQ8+j7Zq4n34GICOtWNydy+4IqtiGrN8qBE59SDaO
         nx173I90HGAQVKYuJRZAgCg5mn2GAVpNdJ5+MwDQlJOo4wVgN7IaGfuJ4cYY/7ydFvOj
         /VLufE58aZKYiINj8U4Ixx6sGdMU3u+dM4h7QPsDADKIqCMJXHcgyJvrlgPRMgVNj7ar
         hJjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXdqOc4XdCAnKiFY2RZW0UIPB5ugRrgM4qc9EYCDix1ltQWttrsStfl5C84t/kiFubHpjg5hBWc3w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxaWfJd73Jf6xUNayatKNV6QcqQV/XT77PSWv95qid8Fr7DMlbq
	cXIJfvNM7VfxIswJNJARrc1XTayM4qgBs3zuBBz3ENn3XxCpc/49Rvn4jZY1B5g=
X-Google-Smtp-Source: AGHT+IGZ7yhvC/Wx3siWVWtSGdKVwGW9oG3YHsndXh771V6dpEgTCitAC2JnhInj+huJT/sEjeTvSw==
X-Received: by 2002:a05:6512:3c96:b0:530:aa09:b6bf with SMTP id 2adb3069b0e04-53d65df7628mr10283658e87.24.1730918800919;
        Wed, 06 Nov 2024 10:46:40 -0800 (PST)
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
Subject: [PATCH 5/5] hw/sparc: Mark devices as big-endian
Date: Wed,  6 Nov 2024 18:46:12 +0000
Message-ID: <20241106184612.71897-6-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241106184612.71897-1-philmd@linaro.org>
References: <20241106184612.71897-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These devices are only used by the SPARC targets, which are
only built as big-endian. Therefore the DEVICE_NATIVE_ENDIAN
definition expand to DEVICE_BIG_ENDIAN (besides, the
DEVICE_LITTLE_ENDIAN case isn't tested). Simplify directly
using DEVICE_BIG_ENDIAN.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sparc/sun4m_iommu.c | 2 +-
 hw/sparc64/sun4u.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/sparc/sun4m_iommu.c b/hw/sparc/sun4m_iommu.c
index 6f765e97e4..4486508e3b 100644
--- a/hw/sparc/sun4m_iommu.c
+++ b/hw/sparc/sun4m_iommu.c
@@ -238,7 +238,7 @@ static void iommu_mem_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps iommu_mem_ops = {
     .read = iommu_mem_read,
     .write = iommu_mem_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_BIG_ENDIAN,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4,
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 541c7f74fa..9d7aebf632 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -254,7 +254,7 @@ static void power_mem_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps power_mem_ops = {
     .read = power_mem_read,
     .write = power_mem_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_BIG_ENDIAN,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4,
-- 
2.45.2


