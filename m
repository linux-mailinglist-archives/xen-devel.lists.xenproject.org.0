Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EC02A8579
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 18:58:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19984.45553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kajWr-0000xY-OK; Thu, 05 Nov 2020 17:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19984.45553; Thu, 05 Nov 2020 17:58:33 +0000
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
	id 1kajWr-0000x9-LL; Thu, 05 Nov 2020 17:58:33 +0000
Received: by outflank-mailman (input) for mailman id 19984;
 Thu, 05 Nov 2020 17:58:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aWoZ=EL=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1kajWp-0000x3-Ph
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 17:58:31 +0000
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22d79325-16cd-4ab9-a26b-e15f256cb57f;
 Thu, 05 Nov 2020 17:58:31 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p19so1628514wmg.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 09:58:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l16sm3421423wrr.83.2020.11.05.09.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 09:58:29 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BDA3B1FF9A;
 Thu,  5 Nov 2020 17:51:54 +0000 (GMT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aWoZ=EL=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
	id 1kajWp-0000x3-Ph
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 17:58:31 +0000
X-Inumbo-ID: 22d79325-16cd-4ab9-a26b-e15f256cb57f
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 22d79325-16cd-4ab9-a26b-e15f256cb57f;
	Thu, 05 Nov 2020 17:58:31 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p19so1628514wmg.0
        for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 09:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e1CT0XOx8Vvy8O4jAkV/r0nsAlwbNsoMSDp0qZ+mwlI=;
        b=IHQhRMPbEglYB1FwSKkG+NGlzWF9RwV19ldmzO/oohRLPXz1nJLWx5YunHxGWGRPxo
         /Aqz0lTJ/nD7arDBcf0sbMwranwxpNdfVLle85fnpiHqG1927kcijKhgq1httip10pAa
         KdTz6HLhjzWm0b0qNDlogU0/nN1mAGqhYE2bd3V5QGsXt52QdnSO9PaAy82oAt43TSN+
         IX8ENd//l1b1wJ2d9sbQ3iK8byU9/O/Q37z6PNy87kYYDQnEJtW9ygaJU0DTlRjf22vW
         toaG/0eERqixQ/tBJ3vBkMO1QSBse5bEngAD3ByWZ3P4n9rTt9XiI6N7lU+jtJE3csbr
         9Iwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e1CT0XOx8Vvy8O4jAkV/r0nsAlwbNsoMSDp0qZ+mwlI=;
        b=a4+ggfAL34+oul7gwx2mrE6zW/SQblJsMruScPHMoE/1qspwATGLJLRKx0lIzBEk6Z
         vLCJHSrNEzaDD5RRC6la87SwzZLtpYlTJrOai42F/xyW0XCtcyUwtiJGAS9d7VyPOKps
         jWYR359P0AmUX+FRUg5rBb0HLZrEZxJqsbN4JOfSvGR9prfdaymeH/1g4kxu/ZXDrMb/
         4rnRYJ0qOAImdB1A5EDoYqRsyhz2sj++BMnCyVQTEPtdO49Ol9viilHjrcTtrUCN8yxB
         606TXkj0xM/FhvSXx9/WaCtJkjNtOfr+Kg4es28Tt4gSB9CVmExAjuSh80jUsuwh8Qn9
         bD+A==
X-Gm-Message-State: AOAM530dy7QEbNWhRwPxMtrES/r+6aKzGyRP0P1WAPLwaBgM5hcc01yZ
	TBuxqlwSnYNqFSihuwLBuqXizg==
X-Google-Smtp-Source: ABdhPJzeGNAWfHzipdSqUYwax9p+jCiQ9HF7pckIJMTgj1GksFvaLT2Ts2O4bY3gUQ2QwqxRyqJ0jg==
X-Received: by 2002:a1c:9d08:: with SMTP id g8mr3981235wme.171.1604599110309;
        Thu, 05 Nov 2020 09:58:30 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id l16sm3421423wrr.83.2020.11.05.09.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 09:58:29 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id BDA3B1FF9A;
	Thu,  5 Nov 2020 17:51:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: julien@xen.org,
	stefano.stabellini@linaro.org,
	stefano.stabellini@xilinx.com,
	masami.hiramatsu@linaro.org,
	takahiro.akashi@linaro.org,
	andre.przywara@arm.com,
	stratos-dev@op-lists.linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [RFC PATCH  11/15] include/hw/xen.h: drop superfluous struct
Date: Thu,  5 Nov 2020 17:51:49 +0000
Message-Id: <20201105175153.30489-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201105175153.30489-1-alex.bennee@linaro.org>
References: <20201105175153.30489-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Chardev is already a typedef'ed struct.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/xen/xen.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index 1406648ca5..0f9962b1c1 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -28,7 +28,7 @@ int xen_is_pirq_msi(uint32_t msi_data);
 
 qemu_irq *xen_interrupt_controller_init(void);
 
-void xenstore_store_pv_console_info(int i, struct Chardev *chr);
+void xenstore_store_pv_console_info(int i, Chardev *chr);
 
 void xen_register_framebuffer(struct MemoryRegion *mr);
 
-- 
2.20.1


