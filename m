Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 906432EADE8
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 16:05:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62033.109553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwnuA-00051M-4X; Tue, 05 Jan 2021 15:05:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62033.109553; Tue, 05 Jan 2021 15:05:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwnuA-00050y-0q; Tue, 05 Jan 2021 15:05:50 +0000
Received: by outflank-mailman (input) for mailman id 62033;
 Tue, 05 Jan 2021 15:05:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YjHi=GI=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kwnu7-00050t-SG
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 15:05:47 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.50])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4aae6f7c-46a5-46b4-9fac-63bcd04126a4;
 Tue, 05 Jan 2021 15:05:47 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
 with ESMTPSA id h0968ex05F5c1Ws
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 5 Jan 2021 16:05:38 +0100 (CET)
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
X-Inumbo-ID: 4aae6f7c-46a5-46b4-9fac-63bcd04126a4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1609859146;
	s=strato-dkim-0002; d=aepfle.de;
	h=Message-Id:Date:Subject:Cc:To:From:From:Subject:Sender;
	bh=RCIeAMmsz1lC/d54ot/izHw5jg/Wf50eFkPMyZ2m3xc=;
	b=jOGfKHpJhOrnKcjG9gGxurs3y5PJ9nvJRBQb60JAxK7F+MK7qziTeLR/LtQJkojZ+m
	vBIgikAzprJYG71TffAgdeBqbDH6zUzJpt/xc2LdFP+fyGCIa+i90yMs4R0o/cq/4sby
	KHGVkDexVpW9PP1bXcFsv1TqmKW0seuvK1/UcprUhQJcmXrhMx1XFZ8GyOtBTX4ZRPhq
	VI2krlVm9j+ICzKL/4CiEjJuXgL2DropYll4vyIWmed8DWSKdOvX4uaBKo0jh79fjJ0c
	8CBjFEdkuyOCgtPOsMbkwCdHjXK8pWJ4yA6O7nzOSXtUuCmC9RHvdNbQXuw7TqqFq/0u
	Jaug==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS321Mjw=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1] tools: remove FOLD_CR3 from xg_save_restore.h
Date: Tue,  5 Jan 2021 16:05:36 +0100
Message-Id: <20210105150536.22797-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The last user was removed with commit b15bc4345e772df92e5ffdbc4c1e9ae2a6206617

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_save_restore.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/tools/libs/guest/xg_save_restore.h b/tools/libs/guest/xg_save_restore.h
index e4fe747c4e..a9c1a2dbe3 100644
--- a/tools/libs/guest/xg_save_restore.h
+++ b/tools/libs/guest/xg_save_restore.h
@@ -49,16 +49,6 @@
 #define M2P_SIZE(_m)    ROUNDUP(((_m) * sizeof(xen_pfn_t)), M2P_SHIFT)
 #define M2P_CHUNKS(_m)  (M2P_SIZE((_m)) >> M2P_SHIFT)
 
-#define UNFOLD_CR3(_c)                                                  \
-  ((uint64_t)((dinfo->guest_width == 8)                                 \
-              ? ((_c) >> 12)                                            \
-              : (((uint32_t)(_c) >> 12) | ((uint32_t)(_c) << 20))))
-
-#define FOLD_CR3(_c)                                                    \
-  ((uint64_t)((dinfo->guest_width == 8)                                 \
-              ? ((uint64_t)(_c)) << 12                                  \
-              : (((uint32_t)(_c) << 12) | ((uint32_t)(_c) >> 20))))
-
 #define MEMCPY_FIELD(_d, _s, _f, _w) do {                          \
     if ((_w) == 8)                                                 \
         memcpy(&(_d)->x64._f, &(_s)->x64._f,sizeof((_d)->x64._f)); \

