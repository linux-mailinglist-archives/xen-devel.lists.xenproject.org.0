Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E74622427F2
	for <lists+xen-devel@lfdr.de>; Wed, 12 Aug 2020 11:56:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5nTb-0000Vu-Ik; Wed, 12 Aug 2020 09:55:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rnXN=BW=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1k5nTZ-0000Vp-Td
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2020 09:55:17 +0000
X-Inumbo-ID: 33706cb2-ac72-40a4-85f4-06659d873dea
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33706cb2-ac72-40a4-85f4-06659d873dea;
 Wed, 12 Aug 2020 09:55:16 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id 88so1441360wrh.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2020 02:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tVOHhHr3o885IpPYVJM4uZwCLiEXm2Y3E8ipvZuyt24=;
 b=fpAlrZjzq1tDTqFWd75tc9jBAlRr7suMYwSzUJVZ4LpLJtRq8uXQruy/Vuv0NjtYoN
 6AEn0YLJPtnINU7pqjko95Op2fyIPfXWFBS+oN/BrRn0QtGv99mlqkSAnX0CVyrX7DkD
 wYhmPTAHYshXaw+yW7IRq7exk2R/49FK6DWwFP90xeEfqGQyPihq1qcQk6e6cZGrAzLx
 YD88XsO4WqCkekcliA0QrQc4A9iTzGVrXlmbkhF81HG8JmDsj6ppp2xD7FTX6hE4O3wt
 fBOIJ20ZYzGsIWYs0bj4egbnk0x2DpMw4zKXJNpeN5W8+cSf9iQXZl/IrDVpM7kzrhjl
 WqFg==
X-Gm-Message-State: AOAM533OuNp6Qqt1o1mqfcGPpu+7vewOBHMxfox/3Kl/QjbwfrXaoTeh
 eVYP3ETBQLJjIdnVjaOLhaYeDTzL
X-Google-Smtp-Source: ABdhPJxuJab11xDlRDMZ9s3JR7LHbRKrpQE/vV2AqhSZJ0Q+9ucWGW4shHOzawJszZGBOsCT5noaxA==
X-Received: by 2002:adf:ee83:: with SMTP id b3mr32515697wro.163.1597226115471; 
 Wed, 12 Aug 2020 02:55:15 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id q19sm3184053wrf.48.2020.08.12.02.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 02:55:13 -0700 (PDT)
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] Config.mk: update OVMF changeset
Date: Wed, 12 Aug 2020 09:55:11 +0000
Message-Id: <20200812095511.107277-1-wl@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Signed-off-by: Wei Liu <wl@xen.org>
---
 Config.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index 4093dcb9e366..3603cf4ca58d 100644
--- a/Config.mk
+++ b/Config.mk
@@ -244,7 +244,7 @@ QEMU_TRADITIONAL_URL ?= git://xenbits.xen.org/qemu-xen-traditional.git
 SEABIOS_UPSTREAM_URL ?= git://xenbits.xen.org/seabios.git
 MINIOS_UPSTREAM_URL ?= git://xenbits.xen.org/mini-os.git
 endif
-OVMF_UPSTREAM_REVISION ?= 20d2e5a125e34fc8501026613a71549b2a1a3e54
+OVMF_UPSTREAM_REVISION ?= a3741780fe3535e19e02efa869a7cac481891129
 QEMU_UPSTREAM_REVISION ?= master
 MINIOS_UPSTREAM_REVISION ?= master
 
-- 
2.20.1


