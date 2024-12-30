Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C999FEAC7
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2024 22:01:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863550.1274940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tSMt2-0007L5-H2; Mon, 30 Dec 2024 21:01:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863550.1274940; Mon, 30 Dec 2024 21:01:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tSMt2-0007JL-BC; Mon, 30 Dec 2024 21:01:16 +0000
Received: by outflank-mailman (input) for mailman id 863550;
 Mon, 30 Dec 2024 21:01:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rjPe=TX=daemonizer.de=maxi@srs-se1.protection.inumbo.net>)
 id 1tSMt0-0006nk-PH
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2024 21:01:14 +0000
Received: from mx1.somlen.de (breeze.somlen.de [2a00:1828:a019::100:0])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33ed3423-c6f1-11ef-99a4-01e77a169b0f;
 Mon, 30 Dec 2024 22:01:13 +0100 (CET)
Received: by mx1.somlen.de with ESMTPSA id 0508D5030C1;
 Mon, 30 Dec 2024 22:01:12 +0100 (CET)
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
X-Inumbo-ID: 33ed3423-c6f1-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daemonizer.de;
	s=202303; t=1735592473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y3IPyDYbEqLp9/TJelGNbhXNC7AXR4cBfozsJVQEaMM=;
	b=Cu1TnrCjzNMcMG3z7LLfOXIEO6ZD0EyWx3B5a41x/hzz8iigBwQOmrSaRxWC8gv3f/Ltfu
	0MdDmylqkefNg3VjuHLGsb1kRemVTdPiUPMJz7AOsRSH7XwiTakb1WI5u4u7aVXFPyM98M
	S0E4e076NgwXZXcGzQOFT+8BKmXM9Flnb8oGTzc1fZ7twkmG24oSqfZEI7MoMHe8r6j/9K
	GAY3kMMwungU4b7SrUIu21DgLV5irBxYjqZG7dW1cEz1BG2qRu1Kd7r/AYBmQQfuWnGvwR
	TBz3UsFu0r7wL+GiK9cbid+I2UnpxgQsgRm3UTmbMIaN5KWkLatwqhHV1KhPSg==
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Maximilian Engelhardt <maxi@daemonizer.de>
Subject: [XEN PATCH 1/5] docs/man/xen-vbd-interface.7: Provide properly-formatted NAME section
Date: Mon, 30 Dec 2024 22:00:29 +0100
Message-Id: <9514c20c6982d65afc8ee53c4027f435d46d8056.1735585600.git.maxi@daemonizer.de>
In-Reply-To: <cover.1735585600.git.maxi@daemonizer.de>
References: <cover.1735585600.git.maxi@daemonizer.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@citrix.com>

This manpage was omitted from
   docs/man: Provide properly-formatted NAME sections
   (423c4def1f7a01eeff56fa70564180640ef3af43)
because I was previously building with markdown not installed.

Signed-off-by: Ian Jackson <ian.jackson@citrix.com>
Tested-by: Maximilian Engelhardt <maxi@daemonizer.de>
---
 docs/man/xen-vbd-interface.7.pandoc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/man/xen-vbd-interface.7.pandoc b/docs/man/xen-vbd-interface.7.pandoc
index ba0d159dfa..2f18d5b72e 100644
--- a/docs/man/xen-vbd-interface.7.pandoc
+++ b/docs/man/xen-vbd-interface.7.pandoc
@@ -1,3 +1,8 @@
+Name
+----
+
+xen-vbd-interface - Xen paravirtualised block device protocol
+
 Xen guest interface
 -------------------
 
-- 
2.39.5


