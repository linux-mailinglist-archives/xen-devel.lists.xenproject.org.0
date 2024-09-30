Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8836B98A377
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 14:50:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807351.1218772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svFqc-0006KO-TL; Mon, 30 Sep 2024 12:49:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807351.1218772; Mon, 30 Sep 2024 12:49:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svFqc-0006Dh-PR; Mon, 30 Sep 2024 12:49:54 +0000
Received: by outflank-mailman (input) for mailman id 807351;
 Mon, 30 Sep 2024 12:49:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LvNS=Q4=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1svFqb-0005M5-31
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 12:49:53 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c7aae3a-7f2a-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 14:49:52 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [37.161.44.57])
 by support.bugseng.com (Postfix) with ESMTPSA id 0C6974EE0745;
 Mon, 30 Sep 2024 14:49:50 +0200 (CEST)
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
X-Inumbo-ID: 7c7aae3a-7f2a-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1727700592; bh=5nXjp14WwdGFVxbaAzt/3eS1ERiyeHcNMStdfmx1zgg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nqGFUTUSTT/aL7/3B2Tgkz6MPCGQl7p9PYF06zX2IyD6KF7rFlbP+kHmkYIdGwsIr
	 OUzOBrpFzJG85chMJLyMds/H2Yy8qXfaIZ7qER+UONMfD4T6IGphsIMOmaQyUM24xb
	 SfPOADVxJwntUT+Mb5yJ0yJSJjkeodb/6flflVwvWDpzt+58/bE+91zjoq7TLLnrr8
	 hrMK69OF40Wuz3DMPJazRC/KRrKCFB6rYfK5HFgmG0EmK7A1khjB3x/tdVyKYJlk6n
	 vjaHizzrnlI4YSdLybUMZIFtmM/Qs9OxkUGSDplxJCv58ywLZ+6YwvmpQSJb6/569k
	 UakNOa0fS1rMg==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 3/3] automation/eclair: tag Rule 13.6 as clean
Date: Mon, 30 Sep 2024 14:49:17 +0200
Message-ID: <8fc4fe3f0ef744ef0c379bf76b8425deac40088c.1727690180.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1727690180.git.federico.serafini@bugseng.com>
References: <cover.1727690180.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update ECLAIR configuration to consider Rule 13.6 as clean:
new violations of this rule will cause a failure of the CI pipeline.

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
2.43.0


