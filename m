Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5459742FA
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 21:06:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795997.1205544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so6Bu-0007Ad-0o; Tue, 10 Sep 2024 19:06:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795997.1205544; Tue, 10 Sep 2024 19:06:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so6Bt-00076s-Td; Tue, 10 Sep 2024 19:06:17 +0000
Received: by outflank-mailman (input) for mailman id 795997;
 Tue, 10 Sep 2024 19:06:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUAX=QI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1so6Br-0006Mx-LD
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 19:06:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd76932b-6fa7-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 21:06:10 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-37-206-90.retail.telecomitalia.it [79.37.206.90])
 by support.bugseng.com (Postfix) with ESMTPSA id 838DC4EE07CD;
 Tue, 10 Sep 2024 21:06:09 +0200 (CEST)
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
X-Inumbo-ID: bd76932b-6fa7-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725995169; bh=q5mzpFQzwdwg96yKMBtbX1/P+X+oQ4B1AoLli8MGdLw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GbzXMgT2EVlfoUpwJDqBh7Jc08t+BSRw3MUzOmqKlAo1ImhMqHmKmklT4VrUq3DRL
	 8ZoddCwSSdw0Qm3fREIQykjP8l+teAVCBI2BvHD8hqKRNT2KtPcgbJUDCxC/FMM6S8
	 M/zNH710KJG6ypD6kEi542cmL0Ea4Ee8M0hUwRZAtottHPHKWRiZOnSMzoC7KlRS1N
	 spC3aBdlpJ9J6Bd2kTXMEKN6dOSzhusSuqv4B0gMPjPabAR451WR7ulVMfneuGJXpy
	 KXOYQgIFlicXyl7SqJM/xWxUERLpeWLq+P70/5/U5qyxaQu/2DzzCugxJfr5Olv4Df
	 U54TQWB0pWwAw==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 3/3] automation/eclair: tag Rule 13.6 as clean
Date: Tue, 10 Sep 2024 21:06:02 +0200
Message-Id: <5d95cef297b3f18f96e9261394046b4c741486c9.1725994633.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725994633.git.federico.serafini@bugseng.com>
References: <cover.1725994633.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update ECLAIR configuration to consider Rule 13.6 as clean:
introducing violations of this rule will cause a failure of the CI pipeline.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/tagging.ecl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index b8448938e6..76032b1fe1 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -60,6 +60,7 @@ MC3R1.R11.6||
 MC3R1.R11.7||
 MC3R1.R11.9||
 MC3R1.R12.5||
+MC3R1.R13.6||
 MC3R1.R14.1||
 MC3R1.R14.3||
 MC3R1.R14.4||
-- 
2.34.1


