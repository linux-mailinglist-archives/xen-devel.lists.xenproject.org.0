Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E28B93DEC7
	for <lists+xen-devel@lfdr.de>; Sat, 27 Jul 2024 12:47:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765909.1176520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXevz-0007hi-OH; Sat, 27 Jul 2024 10:45:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765909.1176520; Sat, 27 Jul 2024 10:45:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXevz-0007fv-LO; Sat, 27 Jul 2024 10:45:55 +0000
Received: by outflank-mailman (input) for mailman id 765909;
 Sat, 27 Jul 2024 10:45:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sXevy-0007fp-Cj
 for xen-devel@lists.xenproject.org; Sat, 27 Jul 2024 10:45:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sXevx-00007E-RX; Sat, 27 Jul 2024 10:45:53 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sXevx-0007qL-DL; Sat, 27 Jul 2024 10:45:53 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=j7Wjq4qGEyEv6tB906bN7P4FQ5GbMlh4dm+qV8ztyEs=; b=bG3vF9
	E1tC5FLCS6zU7QFrdJJLaUzQTAIHsik2JrMdpF0mYBMvmzRuZJsvlUQy/GZ0jddQvYxKza63e4Tt7
	Pi44JMrTPFRRQAVSulDMlkIOkjTkEHmr1+UhsDiUjZ3kMbhjgvT1PgJrwAInXMLAJkArCZRzTen4g
	1XQVaURbCT0=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN for-4.19] SUPPORT.md: Define support lifetime
Date: Sat, 27 Jul 2024 11:45:46 +0100
Message-Id: <20240727104546.94312-1-julien@xen.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 SUPPORT.md | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 77d2a7a7db1a..8b998d9bc7b7 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -9,13 +9,13 @@ for the definitions of the support status levels etc.
 
 # Release Support
 
-    Xen-Version: 4.19-rc
-    Initial-Release: n/a
-    Supported-Until: TBD
-    Security-Support-Until: Unreleased - not yet security-supported
+    Xen-Version: 4.19
+    Initial-Release: 2024-07-29
+    Supported-Until: 2026-01-29
+    Security-Support-Until: 2027-07-29
 
 Release Notes
-: <a href="https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes">RN</a>
+: <a href="https://wiki.xenproject.org/wiki/Xen_Project_4.19_Release_Notes">RN</a>
 
 # Feature Support
 
-- 
2.40.1


