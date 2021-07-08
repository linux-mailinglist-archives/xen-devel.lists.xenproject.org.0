Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D30FD3C158A
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 16:57:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153192.283020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1VS6-00040r-TP; Thu, 08 Jul 2021 14:56:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153192.283020; Thu, 08 Jul 2021 14:56:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1VS6-0003y3-QP; Thu, 08 Jul 2021 14:56:34 +0000
Received: by outflank-mailman (input) for mailman id 153192;
 Thu, 08 Jul 2021 14:56:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Di/c=MA=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m1VS5-0003xx-KQ
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 14:56:34 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.54])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae7f1dc2-dffc-11eb-858b-12813bfff9fa;
 Thu, 08 Jul 2021 14:56:32 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx68EuUb33
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 8 Jul 2021 16:56:30 +0200 (CEST)
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
X-Inumbo-ID: ae7f1dc2-dffc-11eb-858b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625756190;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=GqJyxamRDB5rxjDIiXc2b/W8Owo3jcxpls/DUmsB3sA=;
    b=Wr4CAdfmpOsIdifcb/JZ2AqXxqmzCNwQGlxXQKBRWUFqH4WoXyidB5akftXQRbkw9T
    vPsyqoaMBagoYoXwfYrFnHzTEd7pRe7LDAe0eg784N9/p48uDjnNCy/66DHdpbolbY+P
    J5FLXeMEW5Locri258PcR6NWFeHrdIxd3OiB1boiRFnUhjeGRzxVuJ6znhK+JMKabv5M
    uBfTzZ7jQvAVenpO6LK2UNBxgrgUMtdyBoiR1mRQ2CnCdIlPQn0KmqdmjgdiuiL3QjJN
    piH2EHUhtwY02egkROWOjMDuyukCHMbKIxK1oQc7qNZhLoVH1B/0evPznMyxqoeSMwdd
    fp8A==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs3rVb2Qcstn6hLmi/A5ONQi+eEunNNoWD5g0T8"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v1] automation: document how to refresh a container
Date: Thu,  8 Jul 2021 16:56:28 +0200
Message-Id: <20210708145628.8902-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Tumbleweed container should be updated often.
Describe the neccessary steps how to refresh and test it before
pushing the new image to gitlab.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 automation/build/README.md | 13 +++++++++++++
 1 file changed, 13 insertions(+)

I did not actually run the "PUSH" command.

diff --git a/automation/build/README.md b/automation/build/README.md
index e1fb3124de..7f33ea077b 100644
--- a/automation/build/README.md
+++ b/automation/build/README.md
@@ -91,5 +91,18 @@ you have access to do so and have your Docker logged into the registry.
 To login you must run `docker login registry.gitlab.com`. For more
 information see the [registry help].
 
+This example shows how to refresh a container for a rolling release
+such as openSUSE Tumbleweed. Login with the gitlab.com credentials.
+
+```
+docker login registry.gitlab.com/xen-project/xen
+make -C automation/build suse/opensuse-tumbleweed
+docker image ls
+env CONTAINER_NO_PULL=1 \
+  CONTAINER=tumbleweed \
+  automation/scripts/containerize bash -exc './configure && make'
+make -C automation/build suse/opensuse-tumbleweed PUSH=1
+```
+
 [registry]: https://gitlab.com/xen-project/xen/container_registry
 [registry help]: https://gitlab.com/help/user/project/container_registry

