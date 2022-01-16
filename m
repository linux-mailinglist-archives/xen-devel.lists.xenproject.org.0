Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D78A848FEDA
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 21:41:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257938.443584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9CKh-0006O8-DM; Sun, 16 Jan 2022 20:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257938.443584; Sun, 16 Jan 2022 20:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9CKh-0006M7-9Z; Sun, 16 Jan 2022 20:40:59 +0000
Received: by outflank-mailman (input) for mailman id 257938;
 Sun, 16 Jan 2022 20:40:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=53EP=SA=hawrylko.pl=lukasz@srs-se1.protection.inumbo.net>)
 id 1n9CKf-00061S-2N
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 20:40:57 +0000
Received: from hawrylko.pl (hawrylko.pl [54.37.138.145])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a8f47ff-770c-11ec-a115-11989b9578b4;
 Sun, 16 Jan 2022 21:40:56 +0100 (CET)
Received: from shaman-lnx.home.arpa (apn-31-1-6-41.dynamic.gprs.plus.pl
 [31.1.6.41]) by hawrylko.pl (Postfix) with ESMTPSA id 9E7393F96C;
 Sun, 16 Jan 2022 21:21:28 +0100 (CET)
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
X-Inumbo-ID: 9a8f47ff-770c-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hawrylko.pl;
	s=201812; t=1642364489;
	bh=QBdhab4vXaZQVdeUPhHxFZZ2mB7N3+8xGrptWMQzV7M=;
	h=From:To:Cc:Subject:Date:From;
	b=usnR0qk5c+JMF1XInxlxv723OGTaAXxvaAbqAeBOBxm4mENCisyvlRqJAWw4ZrBs+
	 OEygC+k5LhzpHfP6IpdyziqGCWz0STaviXiGWmeZciaEsT/fqDUwctStWa6PoTZuz+
	 igWLA+CxVeNOjMkqMaJFrLomHVwQvVLKPN59tWIXaIzyqyfRGvPZKfvbyRQPYgvTsZ
	 e2ujgHj/gcyP2k7/eNzfbsr6LJVEk0AHsczcHQjm+yVgedIY5m+xvOOK8WwClEF3cp
	 WH+D62PxpBFG71/SozXiepjyuTq2wyFgFNenWMVzQcDCyi5AbtGILHlElKjL4CDgDT
	 3y/OrUJy7NcJw==
From: Lukasz Hawrylko <lukasz@hawrylko.pl>
To: xen-devel@lists.xenproject.org
Cc: Lukasz Hawrylko <lukasz@hawrylko.pl>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH] MAINTAINERS: Email address update in TXT section
Date: Sun, 16 Jan 2022 21:20:31 +0100
Message-Id: <20220116202031.19598-1-lukasz@hawrylko.pl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As I am not working for Intel anymore, I would like to update my email address
to my private one.

Signed-off-by: Lukasz Hawrylko <lukasz@hawrylko.pl>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4a2884dfa7..899569f950 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -316,7 +316,7 @@ F:	xen/common/hypfs.c
 F:	xen/include/xen/hypfs.h
 
 INTEL(R) TRUSTED EXECUTION TECHNOLOGY (TXT)
-R:	Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>
+R:	Lukasz Hawrylko <lukasz@hawrylko.pl>
 R:	Daniel P. Smith <dpsmith@apertussolutions.com>
 S:	Odd Fixes
 F:	xen/arch/x86/include/asm/tboot.h
-- 
2.34.1


