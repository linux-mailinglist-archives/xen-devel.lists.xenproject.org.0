Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DaFKD6iymmx+gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 18:18:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C70F35E9DD
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 18:18:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267860.1557342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7FJB-0001XU-BT; Mon, 30 Mar 2026 16:17:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267860.1557342; Mon, 30 Mar 2026 16:17:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7FJB-0001QG-7H; Mon, 30 Mar 2026 16:17:45 +0000
Received: by outflank-mailman (input) for mailman id 1267860;
 Mon, 30 Mar 2026 16:17:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <edwin.torok@citrix.com>) id 1w7FJA-0001MP-JH
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 16:17:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7FJ9-008sKR-VO
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 18:17:43 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <edwin.torok@citrix.com>)
 id 69caa21b-bab6-0a2a0a5309dd-0a2a4505958c-20
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 18:17:43 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <edwin.torok@citrix.com>)
 id 69caa226-5aeb-0a2a45050019-a06583088046-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 18:17:43 +0200
Received: from localhost.localdomain (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTPS id 9BB8841B6C96;
 Mon, 30 Mar 2026 12:17:07 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 2/5] CI: drop Ubuntu 16.04
Date: Mon, 30 Mar 2026 17:17:25 +0100
Message-ID: <587eb0701db6e5852e9628d0cb9db90250424c4a.1774886602.git.edwin.torok@citrix.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774886602.git.edwin.torok@citrix.com>
References: <cover.1774886602.git.edwin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1774887463-2149C488-4B51C207/0/0
X-purgate-type: clean
X-purgate-size: 2023
X-Spamd-Result: default: False [3.42 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MIXED_CHARSET(0.91)[subject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	FROM_NEQ_ENVFROM(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:mid]
X-Rspamd-Queue-Id: 9C70F35E9DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ubuntu 16.04 is EoL on 2026-04-02.
It fails to build the emulator tests, probably due to a binutils that is too old:

```
gcc -m32 -march=i686 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wno-unused-but-set-variable -Wno-unused-local-typedefs -Werror -O2 -fomit-frame-pointer -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__ -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -mno-tls-direct-seg-refs -fno-pie -fno-exceptions -fno-asynchronous-unwind-tables -ffreestanding -nostdinc -I/builds/xen-project/people/edwintorok/xen/tools/tests/x86_emulator/../../../tools/firmware/include -fno-stack-protector -g0 -D_16 -mpclmul -mssse3 -mpclmul -ffixed-xmm0 -Os -DVEC_SIZE=16 -c ssse3-pclmul.c
/tmp/cchhD6n5.s: Assembler messages:
/tmp/cchhD6n5.s:202: Error: junk at end of line, first unrecognized character is `{'
/tmp/cchhD6n5.s:203: Error: junk at end of line, first unrecognized character is `{'
/tmp/cchhD6n5.s:205: Error: junk at end of line, first unrecognized character is `{'
```

Same test passes on Ubuntu 18.04.

Note: the minimum version of binutils might have to be updated.
Ubuntu 16.04 had version 2.26.1, which satisfies the >= 2.25 requirement
in the README, and yet it failed as shown above.

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
---
 automation/gitlab-ci/build.yaml | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index b69bad9202..41914cf898 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -615,16 +615,6 @@ fedora-41-x86_64-gcc-debug:
   variables:
     CONTAINER: fedora:41-x86_64
 
-ubuntu-16.04-x86_64-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: ubuntu:16.04-x86_64
-
-ubuntu-16.04-x86_64-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: ubuntu:16.04-x86_64
-
 ubuntu-18.04-x86_64-gcc:
   extends: .gcc-x86-64-build
   variables:
-- 
2.47.3


