Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B95F2D45EB
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 16:55:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48403.85594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn1o1-0000P7-Uk; Wed, 09 Dec 2020 15:55:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48403.85594; Wed, 09 Dec 2020 15:55:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn1o1-0000OX-Qq; Wed, 09 Dec 2020 15:55:05 +0000
Received: by outflank-mailman (input) for mailman id 48403;
 Wed, 09 Dec 2020 15:55:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0kem=FN=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kn1o0-0000O7-7s
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 15:55:04 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.216])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33b82ef4-bbf4-4c02-a086-fc70b1815583;
 Wed, 09 Dec 2020 15:55:02 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.6.3 DYNA|AUTH)
 with ESMTPSA id 007720wB9Fsv0b9
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 9 Dec 2020 16:54:57 +0100 (CET)
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
X-Inumbo-ID: 33b82ef4-bbf4-4c02-a086-fc70b1815583
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1607529301;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=DKL6ewFHEenBMo6vG4Fk2Fh+oKBRcf8oXazH6dWBh0w=;
	b=qTbLOn0LUJEyKmdhsn8RRZ3dC2L6b50tQtlFBRwsUKsDe7iE+FGqIx24SHulLvoDGS
	Hy7Ig8qIxbLnmQK8zcAMNBkAU994dgOByIXDOKSEL7qoCK32oJzyFfZprjuB4HndjLYQ
	/PGTV2ANwi6DofIhZXvRRgbzMH/QPNG4htS3eLcv2XR8q2ITWXwj6lYuSMfg9Lq8Dk5n
	FmIRfXkfxPl9BanVwxI0OpscY9gxBmqQbiqiaCwSemqJglNEtQlUu225O/87uISW7ti5
	v4guYrkdGgZZCdxY0chtRmp3UuvC//SG+FX/zA7IuRyosOeYpXY3dnuRyhClkmA3kD20
	AB4g==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuz7MdiQehTvc3KJf+TWodQ=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 2/3] tools: remove unused ORDER_LONG
Date: Wed,  9 Dec 2020 16:54:50 +0100
Message-Id: <20201209155452.28376-2-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201209155452.28376-1-olaf@aepfle.de>
References: <20201209155452.28376-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are no users left, xenpaging has its own variant.
The last user was removed with commit 11d0044a168994de85b9b328452292852aedc871

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/ctrl/xc_bitops.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/libs/ctrl/xc_bitops.h b/tools/libs/ctrl/xc_bitops.h
index d6c5ea5138..f0bac4a071 100644
--- a/tools/libs/ctrl/xc_bitops.h
+++ b/tools/libs/ctrl/xc_bitops.h
@@ -6,9 +6,7 @@
 #include <stdlib.h>
 #include <string.h>
 
-/* Needed by several includees, but no longer used for bitops. */
 #define BITS_PER_LONG (sizeof(unsigned long) * 8)
-#define ORDER_LONG (sizeof(unsigned long) == 4 ? 5 : 6)
 
 #define BITMAP_ENTRY(_nr,_bmap) ((_bmap))[(_nr) / 8]
 #define BITMAP_SHIFT(_nr) ((_nr) % 8)

