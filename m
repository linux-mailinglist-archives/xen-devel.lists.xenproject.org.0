Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A6226A985
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 18:18:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIDer-0001Wu-9c; Tue, 15 Sep 2020 16:18:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2OlW=CY=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kIDeq-0001Sm-JA
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 16:18:16 +0000
X-Inumbo-ID: fefc4ebd-cad3-4a11-afd7-ad881786b514
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fefc4ebd-cad3-4a11-afd7-ad881786b514;
 Tue, 15 Sep 2020 16:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=Q48nB/F4uU8xPjTIE8qhVPPBlboQ5C2A8+ikvUg0FYs=; b=2iDx526W5Fjk+pNOQ4I2hC649A
 gLHy2sE3DscrPYQq0omFLsn0KjM+JXNGRwRSOub79O8XbxyA8pZsV7MkN5aryvXSOKv1zS6LPGSil
 BBXABxGAxKSVH/FkIYfY6j2jX4FGtaOedqYpGW3KBQwlEgeeKvQLMgJTul5Ua+q7fkyk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kIDej-000757-6F; Tue, 15 Sep 2020 16:18:09 +0000
Received: from host86-176-94-160.range86-176.btcentralplus.com
 ([86.176.94.160] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kIDei-0000cN-Uw; Tue, 15 Sep 2020 16:18:09 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Subject: [PATCH v8 4/8] docs/specs: add missing definitions to
 libxc-migration-stream
Date: Tue, 15 Sep 2020 17:17:56 +0100
Message-Id: <20200915161800.1384-5-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200915161800.1384-1-paul@xen.org>
References: <20200915161800.1384-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

The STATIC_DATA_END, X86_CPUID_POLICY and X86_MSR_POLICY record types have
sections explaining what they are but their values are not defined. Indeed
their values are defined as "Reserved for future mandatory records."

Also, the spec revision is adjusted to match the migration stream version
and an END record is added to the description of a 'typical save record for
and x86 HVM guest.'

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Fixes: 6f71b5b1506 ("docs/migration Specify migration v3 and STATIC_DATA_END")
Fixes: ddd273d8863 ("docs/migration: Specify X86_{CPUID,MSR}_POLICY records")
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>

v7:
 - New in v7
---
 docs/specs/libxc-migration-stream.pandoc | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/docs/specs/libxc-migration-stream.pandoc b/docs/specs/libxc-migration-stream.pandoc
index 6b0c49e97a..8aeab3b11b 100644
--- a/docs/specs/libxc-migration-stream.pandoc
+++ b/docs/specs/libxc-migration-stream.pandoc
@@ -3,7 +3,7 @@
   Andrew Cooper <<andrew.cooper3@citrix.com>>
   Wen Congyang <<wency@cn.fujitsu.com>>
   Yang Hongyang <<hongyang.yang@easystack.cn>>
-% Revision 2
+% Revision 3
 
 Introduction
 ============
@@ -227,7 +227,13 @@ type         0x00000000: END
 
              0x0000000F: CHECKPOINT_DIRTY_PFN_LIST (Secondary -> Primary)
 
-             0x00000010 - 0x7FFFFFFF: Reserved for future _mandatory_
+             0x00000010: STATIC_DATA_END
+
+             0x00000011: X86_CPUID_POLICY
+
+             0x00000012: X86_MSR_POLICY
+
+             0x00000013 - 0x7FFFFFFF: Reserved for future _mandatory_
              records.
 
              0x80000000 - 0xFFFFFFFF: Reserved for future _optional_
@@ -732,6 +738,7 @@ A typical save record for an x86 HVM guest image would look like:
 * X86_TSC_INFO
 * HVM_PARAMS
 * HVM_CONTEXT
+* END record
 
 HVM_PARAMS must precede HVM_CONTEXT, as certain parameters can affect
 the validity of architectural state in the context.
-- 
2.20.1


