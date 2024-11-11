Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE2D9C44BE
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 19:17:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834093.1249613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAYyB-00005v-N9; Mon, 11 Nov 2024 18:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834093.1249613; Mon, 11 Nov 2024 18:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAYyB-0008V8-KB; Mon, 11 Nov 2024 18:16:59 +0000
Received: by outflank-mailman (input) for mailman id 834093;
 Mon, 11 Nov 2024 18:16:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dX8x=SG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tAYy9-0007mr-Jx
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 18:16:57 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 220166b6-a059-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 19:16:55 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-539fbe22ac0so4722516e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 10:16:55 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53d82689a79sm1633691e87.109.2024.11.11.10.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2024 10:16:52 -0800 (PST)
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
X-Inumbo-ID: 220166b6-a059-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzAiLCJoZWxvIjoibWFpbC1sZjEteDEzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjIyMDE2NmI2LWEwNTktMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzQ5MDE1LjU3ODMxOSwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731349014; x=1731953814; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mz2MW4exBDctQDRSrNhCcwZhjMjXlWzvBMCOW4yqM7c=;
        b=lzEomCibVf8rTChGX4xaXzBg5CzowKCjR06kvS6DDIkKYf6v7ZkhEApAQUJCIHIkBl
         FEEnxQ2wsZNYIkroIkI+oUsogCwJYr6VAwTAxdLO9ngstQ/jLfhKy3aaykRK2rZ1A+HD
         +dBjnY1c7PiHWTWf1soAhMecGuY+WtTEfIHj9BMzBAr0wZPYEdaBNo9QdbdG+Ix3CtJU
         ocgj6DezJQ7h36M4mNfzl4TekQ4EtJvFgS+F9aO1XenDrnEElO39XptVsyXhgw73zZj2
         G9mDwOY4h5wXBSqGTdoTOFoNVmwltsbHwFVE2kCpa1QuvRXrJ1yJcNx3P4Kmr8WMvqZ8
         QOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731349014; x=1731953814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mz2MW4exBDctQDRSrNhCcwZhjMjXlWzvBMCOW4yqM7c=;
        b=XfJw7cvvZDo9olX/7vKF71qKXdzSk93vwKYpMtSc3iOxO3fpmSWlggGD1iDc34I3xm
         QDevJlEyrrI6P0y1kz8XWsk6PDUPjjSoNy0SA9wTaIE3upLeZE+LxXnOT76TWfcjC07X
         5Jtn4DqdkD2nkBXVC/XHYSsx7HhFSwXwDsK8qo0TENjm/ViyZ4ojnARQAWuQ+Db6nRrD
         TKWNtNJ6+NV9Nf0U8g47HuWEAybAb+IJPHjLJ9gMZE70ABo8+qd5OlW2rBLHmRSQ/DFa
         h/oAN4dE9nKUCkB0/qsREPVTbPkztamOtIPfmAni+GhBlOlhLAHJ18lpW8fU96jqHQ16
         3NCQ==
X-Gm-Message-State: AOJu0YwUIscxTk0mxJbGk8x9gDofEvULCuojOjazrfQdE2fjCUhLEj6r
	eMnslkYaYQuFTDtcms0EkcAllch41aiNaqzsO6/Imt4t+rPWKNHPGPajLg==
X-Google-Smtp-Source: AGHT+IFDR0V/wPJFTzqQVaxuZu86z59oTmoUUJlLL6N0pYGV2RhQ8c1JSwnyhJENtaq9fPLx48NmjQ==
X-Received: by 2002:a05:6512:2207:b0:53b:20a1:1c4a with SMTP id 2adb3069b0e04-53d862eea05mr6128215e87.42.1731349013843;
        Mon, 11 Nov 2024 10:16:53 -0800 (PST)
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
Subject: [PATCH v5 3/3] xen/riscv: finalize boot allocator and transition to boot state
Date: Mon, 11 Nov 2024 19:16:44 +0100
Message-ID: <ff7f4f652337c8188ee531dc7b978cbfdb378cea.1731344883.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1731344883.git.oleksii.kurochko@gmail.com>
References: <cover.1731344883.git.oleksii.kurochko@gmail.com>
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
Change in V2-V5:
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


