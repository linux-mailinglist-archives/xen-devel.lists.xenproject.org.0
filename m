Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF144324F5A
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 12:44:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89676.169101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFF3L-0006QE-GU; Thu, 25 Feb 2021 11:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89676.169101; Thu, 25 Feb 2021 11:43:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFF3L-0006Pp-Cv; Thu, 25 Feb 2021 11:43:31 +0000
Received: by outflank-mailman (input) for mailman id 89676;
 Thu, 25 Feb 2021 11:43:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Rz4=H3=cert.pl=hubert.jasudowicz@srs-us1.protection.inumbo.net>)
 id 1lFF3J-0006Pk-Pa
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 11:43:29 +0000
Received: from mx.nask.net.pl (unknown [195.187.55.89])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80125619-04d0-4355-a5be-3c82ee34f9dc;
 Thu, 25 Feb 2021 11:43:28 +0000 (UTC)
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
X-Inumbo-ID: 80125619-04d0-4355-a5be-3c82ee34f9dc
From: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: [PATCH][4.15] tools: Fix typo in xc_vmtrace_set_option comment
Date: Thu, 25 Feb 2021 12:43:07 +0100
Message-Id: <3e81757428750eb351ea9d938bf0770026be4c33.1614253079.git.hubert.jasudowicz@cert.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
---
 tools/include/xenctrl.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 0efcdae8b4..318920166c 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1644,7 +1644,7 @@ int xc_vmtrace_get_option(xc_interface *xch, uint32_t domid,
                           uint32_t vcpu, uint64_t key, uint64_t *value);
 
 /**
- * Set platform specific vntvmtrace options.
+ * Set platform specific vmtrace options.
  *
  * @parm xch a handle to an open hypervisor interface
  * @parm domid domain identifier
-- 
2.30.1


