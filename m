Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5986B7A956E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 17:05:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606498.944435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjLFJ-0002Dm-LO; Thu, 21 Sep 2023 15:05:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606498.944435; Thu, 21 Sep 2023 15:05:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjLFJ-0002BW-Hw; Thu, 21 Sep 2023 15:05:37 +0000
Received: by outflank-mailman (input) for mailman id 606498;
 Thu, 21 Sep 2023 15:05:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iWz/=FF=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qjLFJ-0002BQ-1w
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 15:05:37 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50d47f41-5890-11ee-9b0d-b553b5be7939;
 Thu, 21 Sep 2023 17:05:35 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-82-50-59-70.retail.telecomitalia.it [82.50.59.70])
 by support.bugseng.com (Postfix) with ESMTPSA id 4FEAF4EE073F;
 Thu, 21 Sep 2023 17:05:34 +0200 (CEST)
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
X-Inumbo-ID: 50d47f41-5890-11ee-9b0d-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] xen/emul-i8254: address a violation of MISRA C:2012 Rule 8.3
Date: Thu, 21 Sep 2023 17:05:28 +0200
Message-Id: <be245ab9b3805cdb1ba93695b95eeab24d432d6a.1695308350.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make function declaration and definition consistent.
No fuctional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/emul-i8254.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/emul-i8254.c b/xen/arch/x86/emul-i8254.c
index 41ec4a1ef1..c48a3606a2 100644
--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -572,7 +572,7 @@ static uint32_t speaker_ioport_read(
 }
 
 static int cf_check handle_speaker_io(
-    int dir, unsigned int port, uint32_t bytes, uint32_t *val)
+    int dir, unsigned int port, unsigned int bytes, uint32_t *val)
 {
     struct PITState *vpit = vcpu_vpit(current);
 
-- 
2.34.1


