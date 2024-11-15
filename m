Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB959CDE9C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 13:48:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837504.1253458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBvjw-0006Af-Qq; Fri, 15 Nov 2024 12:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837504.1253458; Fri, 15 Nov 2024 12:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBvjw-000682-MD; Fri, 15 Nov 2024 12:47:56 +0000
Received: by outflank-mailman (input) for mailman id 837504;
 Fri, 15 Nov 2024 12:47:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TwMO=SK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tBvjv-0005bz-A2
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 12:47:55 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3a875c8-a34f-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 13:47:52 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a9ed49edd41so309797866b.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 04:47:52 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e08617esm177517666b.182.2024.11.15.04.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 04:47:49 -0800 (PST)
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
X-Inumbo-ID: d3a875c8-a34f-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzYiLCJoZWxvIjoibWFpbC1lajEteDYzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQzYTg3NWM4LWEzNGYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjc0ODcyLjIxNjExNCwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731674870; x=1732279670; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fb2F3eq0F3Y0oXgz+Msta7iUhtnpQIl83uC+FFkcYuQ=;
        b=hypkJ5ZO6j1w0rmcZkD+dPOlewJDRem0ZbnC6Ljba5RFYC7VGIf3/4vgyHgAoLbMrN
         slVez7PztgcOZFEmFeP8Wd8IBeKSQKFQcY92E7gpAwcFMt2u9eqVAwN/z39I98BoYs/9
         5IiP1UhzPkKgMwysghjiQNZcSBU3Hmd4looo8jRRckfDc5ih7rffVbDo43rxM+nrXLzt
         /uGQFdaR120zykzfRaYsM05R7Wy3ViutM6va9hIicHMavqjIEBWIIs7FD4rlevN/fDfN
         coYpLv9DbOkN/W4w3lZKaXt0/N8NpF/3s279ebMPKuojY1D73zyDtd8d7w0r47bZmhtL
         rzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731674870; x=1732279670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fb2F3eq0F3Y0oXgz+Msta7iUhtnpQIl83uC+FFkcYuQ=;
        b=KJoJ1Dnw00ki2NmOXPKwC1Hd66qKC7fCN8jDS0B4CmeBxBtAIjth2dtOfZpOxla8Cz
         ksvbiSaebGkst5nq10MEGRn4lw/CS3JjRkQL3nm4EgkHdLTfhihzFpeGf4WzlpytaJei
         acywoJW1unBs3tSHGDPvjshLbAH+Xp2ssFQCLd7lEKkV6AzMnPvwlr4QZHgrUn8ZFFDY
         zP3xYiwsPgZHNDT32FKTeHzvXas69PiVkB6Qu00KCbWI15q9F6+Sw5C0LcduNqIPTqt6
         nUEAJvzRaz9hwx9X2cYdgjjgI8HQjIMiJDYAvo2CDOOMk6nB0dxqsPiOR9NBivOUqsPB
         hP1Q==
X-Gm-Message-State: AOJu0YyqH2Uf2H6HM+cfQ372wfFE00aS9biqvmJha9C5ieCHN4Dqssii
	Lv+xb7/+Sj7dljcEl0br6PAfNQKOBBpKgN6vK3nrWqfNPQsemtukcRdWxg==
X-Google-Smtp-Source: AGHT+IGTNUjDV0uFSCtDPMhxxNOznjd/eCWq2DbSvp/rF4qUn8WQx20dB75Ac0hrC8AgeMlENLKlSQ==
X-Received: by 2002:a17:907:608a:b0:a9e:c947:8c5e with SMTP id a640c23a62f3a-aa483552958mr214567866b.57.1731674870229;
        Fri, 15 Nov 2024 04:47:50 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 3/3] xen/riscv: finalize boot allocator and transition to boot state
Date: Fri, 15 Nov 2024 13:47:44 +0100
Message-ID: <fdcd7c181cec2779a19b65e7460f6ba49fd9c4f9.1731672668.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1731672668.git.oleksii.kurochko@gmail.com>
References: <cover.1731672668.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a call to end_boot_allocator() in start_xen() to finalize the
boot memory allocator, moving free pages to the domain sub-allocator.

After initializing the memory subsystem, update `system_state` from
`SYS_STATE_early_boot` to `SYS_STATE_boot`, signifying the end of the
early boot phase.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Change in V2-V6:
 - Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/riscv/setup.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 3652cb056d..9680332fee 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -65,6 +65,14 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     vm_init();
 
+    end_boot_allocator();
+
+    /*
+     * The memory subsystem has been initialized, we can now switch from
+     * early_boot -> boot.
+     */
+    system_state = SYS_STATE_boot;
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.47.0


