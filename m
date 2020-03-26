Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C86F194577
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 18:31:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHWJY-0001ej-CG; Thu, 26 Mar 2020 17:29:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6lDd=5L=gmail.com=raistlin.df@srs-us1.protection.inumbo.net>)
 id 1jHWJX-0001ed-EG
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 17:29:07 +0000
X-Inumbo-ID: 4a6f787d-6f87-11ea-8829-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a6f787d-6f87-11ea-8829-12813bfff9fa;
 Thu, 26 Mar 2020 17:29:06 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id 31so8858844wrs.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2020 10:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:date:message-id:user-agent
 :mime-version:content-transfer-encoding;
 bh=yHyMDLd7j3CIFfOzQyTQFZ+Y/3qKamtGh1jjRRogwwk=;
 b=rJN4Me0oqnZpzhl0w4M2qb21f1sQzUHMBOe+VJnHuwmk+zZWLF4tVbYOTELHrs0ikQ
 jiaL4PbwnwzILVmspyfrz3T/knMlqfK8exyS6uRyJCBzzTcqZtHYn0F6QIdEITJP4QQm
 caJPIoXGhz4ZKyprCu85OE8N5YiHRHC18V1Mzs7wSAaU8mAIG0QSJLaPa2O35MRP1TTe
 lASisksoVltCbDTUd61k4hNGdhBLyVgKOLJ1R3oxWeZIqbh1C7d5ZJ8Icu//ioc71Etj
 BW0QPudU/9TZ48an6ctmPrf/en+aQu4FedmoEj4BeggXeGR0qAXye8Hy/ws6P2qfAoOa
 MOpw==
X-Gm-Message-State: ANhLgQ3+GD7ogztFmd09auLYryGHW4l3Bzv+ovUnDSgmpzBwbWik82SM
 c8jsbCesQzbcrw0g+DXi2/PYt9cU
X-Google-Smtp-Source: ADFU+vvRHrT9Lqk2brbZidPeb5KAyVYxU/W/ieGu14tbX3i6l1nUVROBIPjV3c36YFzgZZgA4OC77Q==
X-Received: by 2002:a5d:4fce:: with SMTP id h14mr9943104wrw.243.1585243745128; 
 Thu, 26 Mar 2020 10:29:05 -0700 (PDT)
Received: from [192.168.0.35] (87.78.186.89.cust.ip.kpnqwest.it.
 [89.186.78.87])
 by smtp.gmail.com with ESMTPSA id r17sm4447037wrx.46.2020.03.26.10.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 10:29:03 -0700 (PDT)
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 26 Mar 2020 18:29:02 +0100
Message-ID: <158524374263.32448.13098482060302794023.stgit@Palanthas>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: [Xen-devel] [PATCH] automation: update openSUSE Tumbleweed building
 dependencies
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Doug Goldstein <cardoe@cardoe.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

We need python3 (and the respective -devel package), these days.

Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
---
Cc: Doug Goldstein <cardoe@cardoe.com>
---
 .../build/suse/opensuse-tumbleweed.dockerfile      |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
index 2676a87c85..e80d773a79 100644
--- a/automation/build/suse/opensuse-tumbleweed.dockerfile
+++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
@@ -54,8 +54,8 @@ RUN zypper install -y --no-recommends \
         pandoc \
         patch \
         pkg-config \
-        python \
-        python-devel \
+        python3 \
+        python3-devel \
         systemd-devel \
         tar \
         transfig \


