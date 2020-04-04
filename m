Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF1819E521
	for <lists+xen-devel@lfdr.de>; Sat,  4 Apr 2020 15:10:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKiZD-0005kF-U4; Sat, 04 Apr 2020 13:10:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7qE9=5U=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jKiZC-0005k8-97
 for xen-devel@lists.xenproject.org; Sat, 04 Apr 2020 13:10:30 +0000
X-Inumbo-ID: a85a84d2-7675-11ea-be20-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a85a84d2-7675-11ea-be20-12813bfff9fa;
 Sat, 04 Apr 2020 13:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4VwITlkqRN4GqzEgtdlKqEdC4RiRaC+guw213SFaL9U=; b=snZrxGQbIXL9cpzFkiSijBvmUG
 TvkFKypJEF94cqef1WB9f6dhMJUnZVnxIwQjF+d+MxGMmBP6mX1+j7AjyI1t1U+WNNkND3DxS9lZu
 DWKG6ZHcWt2tXyjT3KUpCGn5Qrn235G1jhBx8pjRqxStOg/vCMAGClk0AMlt1y8whKS8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKiZA-0008FW-Po; Sat, 04 Apr 2020 13:10:28 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKiZA-0007rM-Gd; Sat, 04 Apr 2020 13:10:28 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 1/7] xen/guest_access: Add missing emacs magics
Date: Sat,  4 Apr 2020 14:10:11 +0100
Message-Id: <20200404131017.27330-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404131017.27330-1-julien@xen.org>
References: <20200404131017.27330-1-julien@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

Add missing emacs magics for xen/guest_access.h and
asm-x86/guest_access.h.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/include/asm-x86/guest_access.h | 8 ++++++++
 xen/include/xen/guest_access.h     | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/xen/include/asm-x86/guest_access.h b/xen/include/asm-x86/guest_access.h
index 0b58f2baee..9ee275d01f 100644
--- a/xen/include/asm-x86/guest_access.h
+++ b/xen/include/asm-x86/guest_access.h
@@ -175,3 +175,11 @@
 })
 
 #endif /* __ASM_X86_GUEST_ACCESS_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xen/guest_access.h b/xen/include/xen/guest_access.h
index 09989df819..ef9aaa3efc 100644
--- a/xen/include/xen/guest_access.h
+++ b/xen/include/xen/guest_access.h
@@ -33,3 +33,11 @@ char *safe_copy_string_from_guest(XEN_GUEST_HANDLE(char) u_buf,
                                   size_t size, size_t max_size);
 
 #endif /* __XEN_GUEST_ACCESS_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.17.1


