Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B939C6A78
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 09:19:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835091.1250946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB8an-0002bx-LL; Wed, 13 Nov 2024 08:19:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835091.1250946; Wed, 13 Nov 2024 08:19:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB8an-0002Zs-Ek; Wed, 13 Nov 2024 08:19:13 +0000
Received: by outflank-mailman (input) for mailman id 835091;
 Wed, 13 Nov 2024 08:19:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZFwE=SI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1tB8am-00024i-84
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 08:19:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3888d89-a197-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 09:19:07 +0100 (CET)
Received: from truciolo.bugseng.com (unknown [37.161.56.90])
 by support.bugseng.com (Postfix) with ESMTPSA id 4CDF14EE0747;
 Wed, 13 Nov 2024 09:19:06 +0100 (CET)
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
X-Inumbo-ID: f3888d89-a197-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE2Mi41NS4xMzEuNDciLCJoZWxvIjoic3VwcG9ydC5idWdzZW5nLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImYzODg4ZDg5LWExOTctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDg1OTQ3LjE4OTQ2OSwic2VuZGVyIjoiZmVkZXJpY28uc2VyYWZpbmlAYnVnc2VuZy5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1731485946; bh=k7eaQdpk1quR4T74tRcSKPFjVx4wAgBnMSptn9zpm7Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wsV/Q8EzqCGFyfSU4Eui3NDZtpd746iB0+3JRtZ/o6cBi44pxAt9UqD7ZGxgixGwA
	 dxX9xp+UxzxqmDT0XmqcKIkjbvrtdkP/tTSNy19wLzwZfwnRizekCNdJMYCuXujJg+
	 iAVED9MxqraAHslOsF3S+9ISofS8ZDMMtEZbvbNqR5EPNCwHPwHXxv6JqQVtI8iuIv
	 c9tAVqWewFUHsOsjMGl0x213cGQR1iGJQEbpjQAOdBS0UOfVzsxBozd721X6yXykNc
	 VSMy6ueAAW3zdCqPESfXT3xnWzdAs3zSHKJH2DG7o4PYPL5JipYjtG3WNqFNAq7+Ck
	 FnnZgxSYgjorg==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 3/3] automation/eclair: tag Rule 16.3 as clean
Date: Wed, 13 Nov 2024 09:17:28 +0100
Message-ID: <30ebf4ab10923dde132f0df60bc7445dc892affe.1731485149.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1731485149.git.federico.serafini@bugseng.com>
References: <cover.1731485149.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tag MISRA C:2012 Rule 16.3 as clean for both architectures:
new violations will cause a failure of the CI/CD pipeline.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
No changes from v1.
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


