Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B7B2E945A
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 12:53:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61153.107341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwOPe-0000sy-Tk; Mon, 04 Jan 2021 11:52:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61153.107341; Mon, 04 Jan 2021 11:52:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwOPe-0000sZ-QD; Mon, 04 Jan 2021 11:52:38 +0000
Received: by outflank-mailman (input) for mailman id 61153;
 Mon, 04 Jan 2021 11:52:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RuZS=GH=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kwOPc-0000sT-Fs
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 11:52:37 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.162])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id adfcf999-0afb-45e8-af69-283516671105;
 Mon, 04 Jan 2021 11:52:34 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.10.7 DYNA|AUTH)
 with ESMTPSA id N09c26x04BqRQ7D
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 4 Jan 2021 12:52:27 +0100 (CET)
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
X-Inumbo-ID: adfcf999-0afb-45e8-af69-283516671105
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1609761153;
	s=strato-dkim-0002; d=aepfle.de;
	h=Message-Id:Date:Subject:Cc:To:From:From:Subject:Sender;
	bh=nOdnhHQz8spfHd1Op4s5uZ4IVKUQVT3PNBGft1GM2p0=;
	b=bfPafi1xkvaCxQZyS02lkBNY/pef8qNQSeM7T3NX1SWIy4/l7yrQWfRahMzFx96Sjb
	ODWwy7gB74+BUxhQlUtNST2TC7W8tXTB4EHgFY13hYYsjPZBdbjFzgoaZVqeN1V+p673
	HvUFR4PBBebxP/FqQjHz9Zp0q729N+6uZJErAYXa5yhokP6cfcPbENe2gr2lVq8EmZ5+
	yVe0kPUgko4arCvUK/sB075EGJFieLpamE9RdvCm3XkP6Q3anp65R4XXuXk6ho6haV8p
	lpRmmJJpCJ2SXXQ7nlwuWO9lH3kFg/Z2B5ZsDUrh0S+xaj+4MzXS9P2rEuyePPrZpCfr
	jN3Q==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS321Mjw=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1] tools: ipxe: update for fixing build with GCC10
Date: Mon,  4 Jan 2021 12:52:23 +0100
Message-Id: <20210104115223.25403-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update to v1.21.1 to fix build in Tumbleweed, which has been broken
since months due to lack of new release.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/firmware/etherboot/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/firmware/etherboot/Makefile b/tools/firmware/etherboot/Makefile
index 0de30599bf..ed9e11305f 100644
--- a/tools/firmware/etherboot/Makefile
+++ b/tools/firmware/etherboot/Makefile
@@ -10,7 +10,7 @@ else
 IPXE_GIT_URL ?= git://git.ipxe.org/ipxe.git
 endif
 
-IPXE_GIT_TAG := 1dd56dbd11082fb622c2ed21cfaced4f47d798a6
+IPXE_GIT_TAG := 988d2c13cdf0f0b4140685af35ced70ac5b3283c
 
 IPXE_TARBALL_URL ?= $(XEN_EXTFILES_URL)/ipxe-git-$(IPXE_GIT_TAG).tar.gz
 

