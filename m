Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D202F1CC0
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:43:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65102.115223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1DB-0002af-0p; Mon, 11 Jan 2021 17:42:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65102.115223; Mon, 11 Jan 2021 17:42:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1DA-0002aG-QK; Mon, 11 Jan 2021 17:42:36 +0000
Received: by outflank-mailman (input) for mailman id 65102;
 Mon, 11 Jan 2021 17:42:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1D9-0002a6-1B
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:42:35 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.164])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2367c118-b084-4797-933d-c71a713d7d1b;
 Mon, 11 Jan 2021 17:42:34 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgSM3H
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 11 Jan 2021 18:42:28 +0100 (CET)
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
X-Inumbo-ID: 2367c118-b084-4797-933d-c71a713d7d1b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386953;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=K200fMdhQvOaSArgwIO6LGZZROIpb6XT6yWd/g5GUvE=;
	b=W7ZlDbpVhUIld+tfoDtqnNZKRbG7Zh/fHfkMR61JuJ4oalLQozdu1Zj3IveAosKnEz
	NTvvG4ZCD+kCppJEDJudwMJnkyRbIKpBuPgUXemE01/izRTYiwGS6YPS+D09iQvaHaF7
	WtXjkzxBHpup8zP4jB1vhJjQHychI8nudxhjCL6RyolTJrqN20pwdGNuBoJCeeCqRKi/
	UK+h41jtGgl728BskYYSKv41an0U9jJgxgLUeQa1IPGsz9ADM76X9hI0KH7VkVqsrzmv
	wcVvV92YsY4OS0hhEo28K6ziqhMtIlxtU8ZapWuZx/mFzIKbrxbx+abYvBlvF7QpNR1G
	Kznw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210111 03/39] docs: remove stale create example from xl.1
Date: Mon, 11 Jan 2021 18:41:48 +0100
Message-Id: <20210111174224.24714-4-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Maybe xm create had a feature to create a domU based on a configuration
file. xl create requires the '-f' option to refer to a file.
There is no code to look into XEN_CONFIG_DIR, so remove the example.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 docs/man/xl.1.pod.in | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index af31d2b572..c7b2fcc927 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -171,13 +171,6 @@ B<EXAMPLES>
 
 =over 4
 
-=item I<with config file>
-
-  xl create DebianLenny
-
-This creates a domain with the file /etc/xen/DebianLenny, and returns as
-soon as it is run.
-
 =item I<with extra parameters>
 
   xl create hvm.cfg 'cpus="0-3"; pci=["01:05.1","01:05.2"]'

