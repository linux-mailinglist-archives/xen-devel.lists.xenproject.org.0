Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E41433174AA
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 00:47:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83738.156596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9zBh-0007FD-37; Wed, 10 Feb 2021 23:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83738.156596; Wed, 10 Feb 2021 23:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9zBg-0007Eo-W9; Wed, 10 Feb 2021 23:46:24 +0000
Received: by outflank-mailman (input) for mailman id 83738;
 Wed, 10 Feb 2021 23:46:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LpDB=HM=chromium.org=keescook@srs-us1.protection.inumbo.net>)
 id 1l9zBf-0007Ej-5D
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 23:46:23 +0000
Received: from mail-pg1-x52d.google.com (unknown [2607:f8b0:4864:20::52d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3fff3cd9-f03e-4e37-a6ca-e13748a058c7;
 Wed, 10 Feb 2021 23:46:22 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id o38so2337969pgm.9
 for <xen-devel@lists.xenproject.org>; Wed, 10 Feb 2021 15:46:22 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id o4sm3039796pjs.57.2021.02.10.15.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 15:46:21 -0800 (PST)
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
X-Inumbo-ID: 3fff3cd9-f03e-4e37-a6ca-e13748a058c7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GxK3PI7vDPZB0gE5y+t0L6ekPC7epRKuLKN0gHcGI0k=;
        b=d3G7HKaV8TmLFxjZgmM1jOP6UW61nVg63mfethWVl7OVzgYXa4v/IGP6MBs7csssdM
         FzxOodhdMQjKziKVV5tXS3iah1TBI8bkHNvTqVAvxSVSAO9MlvRZ1ecRZNnnZjC+Ts+I
         Wn3ra5BRnmBNAwHijpb1eHcIh9e9+dERbWg+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GxK3PI7vDPZB0gE5y+t0L6ekPC7epRKuLKN0gHcGI0k=;
        b=UMJFfXi+PL9U7g3opkMnzzlO7ViG9LZQY6fFcBaBIZfAXGpl+7pbVObcGRhG9amhCa
         y485j6RtsKYfLN/V6IxnmmmgEMUu1ks0hK3ShFCXpC2+9yt6m4HJku7MfBOIwlzSwzfC
         n2kFeQqCDgf21sQ8Tto/9LP+zpXeZGoH4teuVG8I4cFJZ2F8t6zvZ1pPJDgWutqvNBsI
         HGQPDoR4Fn56PSE+1cuN8AlHtUIDd78LMBdWi65CoYoL2rzK9A4jUPfMXRXZFLPEWiDW
         IGai98YDX8P2rrmeqrFXhRcesHM696tfIfmSBGB3Y6l9AEa/TRYXv5Jw0//HETHejZ6F
         Lg7g==
X-Gm-Message-State: AOAM531Bmy/CRoSbqoos9z/Pj2MlDciJM+XXyt1ZqXaiWZuZs2RuiMl9
	ezm7CRCYW8IbPIHltFth9qNpiQ==
X-Google-Smtp-Source: ABdhPJwqbO8wVuYN5ck6GRwRGKKtKGHav/dWOVfnnFJrcGzMbAZZSGMs7fiQXdjdff7l8sTmz1+MAw==
X-Received: by 2002:a62:5b87:0:b029:1d8:90df:a54b with SMTP id p129-20020a625b870000b02901d890dfa54bmr5460354pfb.79.1613000781625;
        Wed, 10 Feb 2021 15:46:21 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Kees Cook <keescook@chromium.org>,
	Joe Perches <joe@perches.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH] xen: Replace lkml.org links with lore
Date: Wed, 10 Feb 2021 15:46:18 -0800
Message-Id: <20210210234618.2734785-1-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=dbcf4ca7bce2f2f2a80590b480a2765db93127bd; i=YSscTzp3lVgXfFntf8Kb5E2vpf2VUCH6pRlxS8sELt4=; m=kc8NgBcNkR1FdAUFoBcecPqIFWVDlhJwDI99K+gzg58=; p=VSpsoEkhhoc0b4MXqeePgJxef7V8SVFc1j/JqX3Kem4=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026; b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAmAkcEkACgkQiXL039xtwCbScw//f9b +LBIxQ3WQurWK0tZaB0GyM/Kpvjk0b47840okM1XwHAppPCijhOa3epm/1lpm/4c1mYH/aJdtmXM9 sy9eS2iLx+g/NFl3GZOqY+8tcMiIn7JFANfcHkw0YZfO4/9XuikNVkIsOmAdSIEHSoP0Uj32ZQs0Y yev7conmkSmWwsoT5pA8JRArJnXRqUqGp9CnJzFe951BtAiEhwxIljBmDYzEKr8GRerUZpFeJlhuz 13EuG6ZOM0TMYXmMHUQlgSKrXAJjnf7ZolvmpyLs9EfW/6Pi1jgCUxaTwEQrk1cnte++qGi5V5Xs7 rBkpzZ0dJahji64MOHxmUjd9duXSFIJZT2In3v3S+6b8364b2tfiOgMN4M3659LQkBEocxWpr+VRW Qn3qz5ni2MVf5bqfEi7Z0y6EQN4Mmol72DqYNcH61h6ZFzEhg4l5w9p7m7s5Bo7v6qZNDfZT45HsP 8ewiaKJoagZsZDdAaF1uQsoHMhlwaPzfPrwRhhtgLdyc7FdPYuUpqwyZpRwNKwkVkHaIPRKSw23TC kFvjFQJcqF3tgjxX6pMhCRO7Qq3bNsSKNgU27m14Lj1ZZKgPN4ByDIRl79Bd1OI4cg5iVZM83bh6m aFsn9Ua0YayuhndsTYVtLaFARcW9FmMHBNJI/6NL75LYmuGsUrx2cP6cfkvIdxtI=
Content-Transfer-Encoding: 8bit

As started by commit 05a5f51ca566 ("Documentation: Replace lkml.org
links with lore"), replace lkml.org links with lore to better use a
single source that's more likely to stay available long-term.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/xen/xen-acpi-processor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/xen-acpi-processor.c b/drivers/xen/xen-acpi-processor.c
index ce8ffb595a46..df7cab870be5 100644
--- a/drivers/xen/xen-acpi-processor.c
+++ b/drivers/xen/xen-acpi-processor.c
@@ -3,7 +3,8 @@
  * Copyright 2012 by Oracle Inc
  * Author: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
  *
- * This code borrows ideas from https://lkml.org/lkml/2011/11/30/249
+ * This code borrows ideas from
+ * https://lore.kernel.org/lkml/1322673664-14642-6-git-send-email-konrad.wilk@oracle.com
  * so many thanks go to Kevin Tian <kevin.tian@intel.com>
  * and Yu Ke <ke.yu@intel.com>.
  */
-- 
2.25.1


