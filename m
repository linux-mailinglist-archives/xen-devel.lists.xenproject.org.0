Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFF09DA816
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 13:51:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844754.1260292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGHV0-0005fk-6o; Wed, 27 Nov 2024 12:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844754.1260292; Wed, 27 Nov 2024 12:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGHV0-0005dk-2f; Wed, 27 Nov 2024 12:50:30 +0000
Received: by outflank-mailman (input) for mailman id 844754;
 Wed, 27 Nov 2024 12:50:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pugq=SW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tGHUy-0004Yu-Ld
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 12:50:28 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 291205f9-acbe-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 13:50:20 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-53dde5262fdso4894834e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2024 04:50:20 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd8cb7f00sm2023267e87.7.2024.11.27.04.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 04:50:19 -0800 (PST)
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
X-Inumbo-ID: 291205f9-acbe-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzQiLCJoZWxvIjoibWFpbC1sZjEteDEzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjI5MTIwNWY5LWFjYmUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNzExODIwLjU3ODIxOSwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732711820; x=1733316620; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFssf5rjB5zK7xWMEIyHt0mx4lOxs7souSKxYFyKhsg=;
        b=Lmjnu6XVo0HOK1Z2M40hEHrpzF8BsLOvCL9TXTkKnZ8dmuhumyKusrCQuStsmU2YqR
         +srk5oOB+ZYrEHWiuiDW9G95LCl8LlfAm00cXqzyAmDbzrKE8KM7238MwMWN14bkBuiU
         sqPk5qSEqGzfra2tAKerr7DVAzoSddSmDuLzRMn0DlJI+FQTWcoCRbGP67hl33xjnqf1
         QZOyoDuBHxBhlHAX2HJsW7ax5ra6BjzsDdMD9sY+s9f0lNPd+SE8LS4u3ftcnVpANhL6
         hWxGb4MLwSrt6VxJMS+xMGivPxvLcf6RVtJUnM2UbUFxl+sAB6Wl0J9pTRn4c5yVlNDr
         5dHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732711820; x=1733316620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pFssf5rjB5zK7xWMEIyHt0mx4lOxs7souSKxYFyKhsg=;
        b=XXv+ZFJ+zTxVNzcwYq5hVEqziJrnCalcrFhCtbZR9hinWfsaSjdq76oZ1FXNDZpKSl
         3NYFYIQ0+GI9FJtawEbAB6MldCW/ElBhBY32w3XSSoFx6yvoOMg9h63IicleSx9EqDP9
         P+mrkloirzcWA7KMCou62QdlNy9JYQMxLvHW93TzUyURAzrksBCmtTZSjW0ZYSwloz1h
         5kyPME0GG/IUukXrazsfolkrPBY1DV/EQZqYl759tBVBHg+uaQnVkhAB++/GCLZBWEmc
         PVGiILuVWyCdL1n/xvOLNKU9gc1og4wZhNWOHJVZs4FG+iKz8cPA+ehgxhrmkVl9x0y7
         Rinw==
X-Gm-Message-State: AOJu0YzH1HaHgrdFgrX3vtzG9N4Z/Y9q4quRtzKrZOriL+dLelYxmTPo
	90I7lqvRC/fSpiFGWcmABs2GXG+F3SaEshULFS6jSTg4WKU26EuT+3SXkg==
X-Gm-Gg: ASbGncuLHE0uSru93mk14EsZQyu8UU68F0rXyk0y/1skA4mLQwt9ilY6l11xmGyYj0y
	IHFfY2UOEOPJ3Wu72IdTPtHx3spo5bmch1FhgqjFSdSfx8uSchaDqRtGW++Hw7Vp3Ksz01vDlKb
	LjzRoAjZ2rP8Tpy/4ptTv5cG1zuX7P9W9CissvWPEXxT9SYQk7zJNT+tyt3CvK8UF5rAAHCJ4tq
	28GYnAjOELNWFHfZektmAucR4gNSXGSdm8kleyt+sehi6lCyPo=
X-Google-Smtp-Source: AGHT+IHxWQrerUzX8OstxJxfpu0eDrJwhc4s7hxMC5R1C6DfUnvCNB6hs7z1V7Mn7fele0Xat9s46Q==
X-Received: by 2002:a05:6512:2309:b0:53d:a883:5a3e with SMTP id 2adb3069b0e04-53df0108ff1mr1418457e87.39.1732711819589;
        Wed, 27 Nov 2024 04:50:19 -0800 (PST)
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
Subject: [PATCH v1 2/6] xen/riscv: reorder includes in asm/page.h alphabetically
Date: Wed, 27 Nov 2024 13:50:11 +0100
Message-ID: <4b458dea207cc6f2c2ab5d5a3d67ca9f6d5958da.1732709650.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1732709650.git.oleksii.kurochko@gmail.com>
References: <cover.1732709650.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/page.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index 91b1194b55..bf3f75e85d 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -5,8 +5,8 @@
 
 #ifndef __ASSEMBLY__
 
-#include <xen/const.h>
 #include <xen/bug.h>
+#include <xen/const.h>
 #include <xen/types.h>
 
 #include <asm/atomic.h>
-- 
2.47.0


