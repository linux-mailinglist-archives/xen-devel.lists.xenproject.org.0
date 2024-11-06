Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 807869BF58C
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 19:47:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831302.1246534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8l31-0002DK-7p; Wed, 06 Nov 2024 18:46:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831302.1246534; Wed, 06 Nov 2024 18:46:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8l31-0002B3-3b; Wed, 06 Nov 2024 18:46:31 +0000
Received: by outflank-mailman (input) for mailman id 831302;
 Wed, 06 Nov 2024 18:46:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aqLR=SB=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1t8l2z-0001bx-Sw
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 18:46:29 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d42fc42-9c6f-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 19:46:26 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5cb15b84544so60659a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 10:46:26 -0800 (PST)
Received: from localhost.localdomain ([89.101.134.25])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb16d9f96sm318040866b.75.2024.11.06.10.46.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 06 Nov 2024 10:46:25 -0800 (PST)
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
X-Inumbo-ID: 6d42fc42-9c6f-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmQiLCJoZWxvIjoibWFpbC1lZDEteDUyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjZkNDJmYzQyLTljNmYtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTE4Nzg2LjE4NzU3Mywic2VuZGVyIjoicGhpbG1kQGxpbmFyby5vcmciLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730918785; x=1731523585; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNstnbcurcwe9tiYawZfa8Zi088/DUlHFBmK9/a+8zY=;
        b=sruHHMZyssMgzhOqYMe+sYjr0w1eMmCgkOkvAksLwg/mqXhj2NKg7TXW9EQ02mOVSP
         mn3GL7uTN0yTF2Zy3fzGrNMY9WlcDiCtxUuroBDV5mWSSan/SJw1HKIPuPTd4G/iBkZS
         vzNosczKOmO00uhJVIamOTs1nNrBeCSDIJZ7Aj8R7PA6SgRNpfrKoJr+MuWHfCnO4WJS
         5H8+OyeN9sFNnBriI8WZ0aPd+MNgoV3H9/6p89WJXr8eNQvBopyhqT+NX1iVY9etjddN
         oF6y/C+7yUsCenZSnBBvwbY0vLRZ+8GHYZiWJ0+ynJCbuoAoAV6QZkwZ3vK/pq7H60ul
         S3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730918785; x=1731523585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNstnbcurcwe9tiYawZfa8Zi088/DUlHFBmK9/a+8zY=;
        b=J5tKR/wC/unQRQD3P+aeZH8lfUESxCrFUBsridW8AWDYSnnprnG5HyIKUimk3leOCo
         /LM55m8McFd5F8jRbcrA7zzJXyKso68RslwEwg2a194r21mNIo3jCcNyg/LjZyFVzuJO
         R2w97zIZ8dSQ25ZBlba0EIvGsPO5zzN34QfQmSO13brUlvPMX2ZXFP5H71Eh08Q3Kj3h
         yoWIvU8L/27kaXMZGd+ayw7HZVdvsF2wnUq9afAQYO0DNoBQu3ZXfC0FUZz7Wf/XiUNr
         sVjC9ZpC/QY9Q+2gegEVXeNFuTVM+N5fQTIhbaz7S7kmdUedho1Xd2gfo3gJwnc5e2yf
         9nNg==
X-Forwarded-Encrypted: i=1; AJvYcCVq4lPezw24DigGPJK88KlrSyZkG2JVxLpfqAMXCYkrAOL3z7TlAYnd7BH6Egf/ikUeza0/olIIiAY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3jycs2MoUFQmY6BNqp/4ACfR7GkYV6rxs32Zks23/FyMkfMLf
	gUxj4eI9Sv5hTCCNyOdPsZcB+ELHswmxDAP/VbIQRZ6b+ItRAi9AfUeOx/w4TgI=
X-Google-Smtp-Source: AGHT+IGjArD1IMYMRr0Wdsufa3Pz3wV1Bnd8QpL2R9nInPp4yr8/a39mB/pkO2WyFWxS76ZZlJR3WQ==
X-Received: by 2002:a17:907:94cb:b0:a9a:835b:fc77 with SMTP id a640c23a62f3a-a9e6549106bmr2239257766b.8.1730918785638;
        Wed, 06 Nov 2024 10:46:25 -0800 (PST)
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
Subject: [PATCH 2/5] hw/tricore: Mark devices as little-endian
Date: Wed,  6 Nov 2024 18:46:09 +0000
Message-ID: <20241106184612.71897-3-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241106184612.71897-1-philmd@linaro.org>
References: <20241106184612.71897-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These devices are only used by the TriCore target, which is
only built as little-endian. Therefore the DEVICE_NATIVE_ENDIAN
definition expand to DEVICE_LITTLE_ENDIAN (besides, the
DEVICE_BIG_ENDIAN case isn't tested). Simplify directly using
DEVICE_LITTLE_ENDIAN.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/tricore/tricore_testdevice.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/tricore/tricore_testdevice.c b/hw/tricore/tricore_testdevice.c
index ae95c49565..169f5907e9 100644
--- a/hw/tricore/tricore_testdevice.c
+++ b/hw/tricore/tricore_testdevice.c
@@ -47,7 +47,7 @@ static const MemoryRegionOps tricore_testdevice_ops = {
         .min_access_size = 4,
         .max_access_size = 4,
     },
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void tricore_testdevice_init(Object *obj)
-- 
2.45.2


