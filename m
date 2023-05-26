Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D17747120F4
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 09:30:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539984.841405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2RtQ-0003tH-0D; Fri, 26 May 2023 07:29:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539984.841405; Fri, 26 May 2023 07:29:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2RtP-0003mO-RL; Fri, 26 May 2023 07:29:43 +0000
Received: by outflank-mailman (input) for mailman id 539984;
 Fri, 26 May 2023 07:29:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xc68=BP=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1q2RtO-0003Ci-GV
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 07:29:42 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13aa6cd4-fb97-11ed-8611-37d641c3527e;
 Fri, 26 May 2023 09:29:40 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz4Q7Ta64Y
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 26 May 2023 09:29:36 +0200 (CEST)
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
X-Inumbo-ID: 13aa6cd4-fb97-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1685086176; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=RAqu1yHSHxgRyjWc+mh6lftf8lCD1fl4SAElcfkzB2KkjlTPYR1UmDbkHSJbibZKn4
    CSxDWsO2eMx2cmAMEOmbT3svp/tOC+mxaa89Y06r2FOUS3vJvRAYWhEOTzjHaBCFbM59
    xQ8flx0m89L7ZEphGyRlsg26r/7nwmEmJpWjJ4fLTOE55tYrdCPGQgSPmnUFkURKI3Zj
    4RHcbMpsc+h6z3UquEe2k7UCECE/rB9U664p5n6zozLaDUP/45qpKb1lqSLxWXOZUsfR
    OKtkanyZLfXuI/2sCkgYozt3kRIJAdGmMIzB9cZjvB6raihuvzT6TuEPm4458avyXb80
    PtVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1685086176;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=S9fPMSqhE3ipoGZSZM4sNJyNsCfbZYCsqL8IUbcARXw=;
    b=aDOvrs9KzVLHyoDJ3Z+DvNde7Ddzq5Va3a1UbIrTZHuLnM4MzMrsvGQyUsYeJ/jNul
    wIrsTMXKxX2XLQ/uM9ZV/dP5KxiJEW48CjkFU5cQzU25D9n4YFDRoTsz3Q3EZlWu+f8X
    PMxJY/SsqTTXNwlz0ZaQ8UcgSTLnGoDURmAISgI4lQNFR3ZwI4nRXXXyqDZ9mnM98Cu8
    6IqzBa2zq2du2jWpLLAe8qaFeaLuCnRdhh3L5jdOkyCPAEvXtXeZtn81NSmh2xAcS21d
    LdSoljnzprqbMT1KzGgdCHvF9N5fSxdszYqKweq59DxOM4N5rAWDwHn15WbKA/MgLDq2
    2Tzg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1685086176;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=S9fPMSqhE3ipoGZSZM4sNJyNsCfbZYCsqL8IUbcARXw=;
    b=pWnFatpRSi7NIG8u86l6nkWRr1ZTeC1IktYz6Lrb/tHwg4aBAL2ByevDmk3W1lwhQ7
    C8MTIUtirgzlEZrd/oQb/Zn7tKOjqyGeNRwog0TC4Ja6uLaHdyft9aS1NHFuGLymZiCL
    4RMeycPNWCTlTFx1kRIBkXsAFXPs6IwX3AGj9RE7iJmxx5jop2CY3XiVHuxbZpWwsK5t
    jy55ihCzo41wr6gOuUESWAeDNFajU8r/psIlvKfC7ZXuabxrzKfyY7n6xL/thBOpTEJx
    ld78/uoFw4DYow7Hj3pSAzw+NN2gMW1cJEaPSW1YOxiCpwESAAXvfhrWusf1nHk996ra
    Gq8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1685086176;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=S9fPMSqhE3ipoGZSZM4sNJyNsCfbZYCsqL8IUbcARXw=;
    b=hPVQ0e7hJGk5SflODIvVj8uOgvQm0ZnSqnb4EW2uECxsL0FLB2rPLHYhunnkxtAd9l
    KczprFLs/MSbHqociQAw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4xqFv7EJ0tgRX/vKfT/e8Ig6v0dNw4QAWpzMWrRQ=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 3/3] xentrace: close output file in the function which opened it
Date: Fri, 26 May 2023 09:29:16 +0200
Message-Id: <20230526072916.7424-4-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230526072916.7424-1-olaf@aepfle.de>
References: <20230526072916.7424-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/xentrace/xentrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xentrace/xentrace.c b/tools/xentrace/xentrace.c
index a073cab26d..3548255123 100644
--- a/tools/xentrace/xentrace.c
+++ b/tools/xentrace/xentrace.c
@@ -794,7 +794,6 @@ static void monitor_tbufs(void)
     free(meta);
     free(data);
     /* don't need to munmap - cleanup is automatic */
-    close(outfd);
 }
 
 
@@ -1225,6 +1224,7 @@ int main(int argc, char **argv)
 
     monitor_tbufs();
 
+    close(outfd);
     return 0;
 }
 

