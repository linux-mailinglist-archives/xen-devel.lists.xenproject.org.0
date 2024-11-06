Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E339BE1B0
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 10:06:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830622.1245697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8byt-0002QO-I7; Wed, 06 Nov 2024 09:05:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830622.1245697; Wed, 06 Nov 2024 09:05:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8byt-0002LI-D3; Wed, 06 Nov 2024 09:05:39 +0000
Received: by outflank-mailman (input) for mailman id 830622;
 Wed, 06 Nov 2024 09:05:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w0tz=SB=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1t8bys-0001ya-FA
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 09:05:38 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 493dd53d-9c1e-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 10:05:36 +0100 (CET)
Received: from truciolo.bugseng.com (unknown [78.210.84.32])
 by support.bugseng.com (Postfix) with ESMTPSA id C49D14EE0758;
 Wed,  6 Nov 2024 10:05:34 +0100 (CET)
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
X-Inumbo-ID: 493dd53d-9c1e-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE2Mi41NS4xMzEuNDciLCJoZWxvIjoic3VwcG9ydC5idWdzZW5nLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjQ5M2RkNTNkLTljMWUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODgzOTM2LjU5NzY2Nywic2VuZGVyIjoiZmVkZXJpY28uc2VyYWZpbmlAYnVnc2VuZy5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1730883936; bh=WaAA3OoEOEbFSloOEWY4Sj5LACBV6phGN2xiIDD6990=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aXWAPO5OBZ6looPpQRywTLMA/Ja3ydbFMhT44yV8sZRIbdH4CoX9+nBHrFdFcahnh
	 veWhMBE4HbLaLY6cvxxMfNyvW6s24Utn7NYk4154MFR2xeXibX7vftv6N6q5QtHwwZ
	 Lxv9fXNngMAEVPqdugM6qaa/uS5aOj5yYh8usuLtIylTm1owpZVh2A8vrNNnqUW5Ro
	 jcE9KNd5qXH6TT5TJ8uUGsg0AKx2vsseZ63KzLYQNi1k6/6t3QrfC3f9fDWBbBx4j5
	 v6WEJGqo3IVWmMhLcpCJTigArsp+w1snhspSX9eRTyRPVI8LGJgue3cp6A/Dj0b4yl
	 61ky1RCEe46vA==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 3/3] automation/eclair: tag Rule 16.3 as clean
Date: Wed,  6 Nov 2024 10:04:47 +0100
Message-ID: <4ab02498ab368964302b247341b1401eb53faa63.1730880832.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730880832.git.federico.serafini@bugseng.com>
References: <cover.1730880832.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tag MISRA C:2012 Rule 16.3 as clean for both architectures:
new violations will cause a failure of the CI/CD pipeline.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/tagging.ecl | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index e1d4ed012a..cb7d5743d2 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -64,6 +64,7 @@ MC3R1.R14.1||
 MC3R1.R14.3||
 MC3R1.R14.4||
 MC3R1.R16.2||
+MC3R1.R16.3||
 MC3R1.R16.7||
 MC3R1.R17.1||
 MC3R1.R17.3||
@@ -112,7 +113,7 @@ if(string_equal(target,"x86_64"),
 )
 
 if(string_equal(target,"arm64"),
-    service_selector({"additional_clean_guidelines","MC3R1.R2.1||MC3R1.R5.3||MC3.R11.2||MC3R1.R16.3||MC3R1.R16.6||MC3R1.R20.7"})
+    service_selector({"additional_clean_guidelines","MC3R1.R2.1||MC3R1.R5.3||MC3.R11.2||MC3R1.R16.6||MC3R1.R20.7"})
 )
 
 -reports+={clean:added,"service(clean_guidelines_common||additional_clean_guidelines)"}
-- 
2.43.0


