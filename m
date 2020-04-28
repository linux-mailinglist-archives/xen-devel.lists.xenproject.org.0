Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D37991BBC52
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 13:24:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTOLG-0004Ku-3R; Tue, 28 Apr 2020 11:23:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v0V7=6M=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jTOLE-0004Kc-JR
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 11:23:56 +0000
X-Inumbo-ID: bb7bcb86-8942-11ea-984c-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bb7bcb86-8942-11ea-984c-12813bfff9fa;
 Tue, 28 Apr 2020 11:23:49 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id u16so2415473wmc.5;
 Tue, 28 Apr 2020 04:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CrEIeTB9JLvrBJcFHNug+oMluBW3s7BuIXlpN/mb6aE=;
 b=tw/IHPfSD3J4Y/AwII5qXgvdD5vcAKFLT7GfpBx7XgaQXrNgpkStRDlNAedsAxMWPp
 IRV5+XQzp+LvV+H4iQxVSYIbaDuiam12wF+JGPXWZWPhVSzeQ9Au33Nuyy9WhFtpHKtw
 VhxBViKzVTX0qyEmbTl9Bg7pCGzjtKabTtuibAh/6QEHtjVEG5whQWui010MsPtJs4AY
 OyN678VlvkFSnrrLVGRLt7cw+aef+LYyQ+XlGvyn6+OJIsX2aiAY26d91zj4FwCPtzMO
 DCr2OLj+CehwW/BQUPOUJVO1yeuY5sIJ5I2I+ewcyfq9ZdJb5WnrRtnDrgUsFlk800JM
 WAtQ==
X-Gm-Message-State: AGi0PuYnwXsSicXoMNQVGL2N88po4JY5Pt+xp9STXFDRXYOoO3TWn4/g
 S+2akllt3wm1zaLIUYmEiw07cu5GZT4=
X-Google-Smtp-Source: APiQypLgZ7cCFOMPURfhADdu5tVLrztIKA+SKGQ94G0JDKXnx19Tkt7i0G2ASZR6dlPCRBnAneHiuQ==
X-Received: by 2002:a1c:2e07:: with SMTP id u7mr4077683wmu.74.1588073028875;
 Tue, 28 Apr 2020 04:23:48 -0700 (PDT)
Received: from localhost.localdomain (44.142.6.51.dyn.plus.net. [51.6.142.44])
 by smtp.gmail.com with ESMTPSA id
 h17sm2871913wmm.6.2020.04.28.04.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 04:23:48 -0700 (PDT)
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Subject: [PATCH] MAINTAINERS: list myself as mini-os reviewer
Date: Tue, 28 Apr 2020 12:23:46 +0100
Message-Id: <20200428112346.10498-1-wl@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, minios-devel@lists.xenproject.org,
 Jan Beulich <jbeulich@suse.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

I probably don't have much time to actually review patches, but I do
want to be CC'ed such that I can commit patches in a timely manner.

Signed-off-by: Wei Liu <wl@xen.org>
---
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: minios-devel@lists.xenproject.org
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8a4c869704b0..e3748167550c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -374,6 +374,7 @@ F:	xen/test/livepatch/*
 
 MINI-OS
 M:	Samuel Thibault <samuel.thibault@ens-lyon.org>
+R:	Wei Liu <wl@xen.org>
 S:	Supported
 L:	minios-devel@lists.xenproject.org
 T:	git https://xenbits.xenproject.org/git-http/mini-os.git
-- 
2.20.1


