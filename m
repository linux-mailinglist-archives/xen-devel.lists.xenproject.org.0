Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B6824830A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 12:31:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7ytF-00065T-4s; Tue, 18 Aug 2020 10:30:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pr8P=B4=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k7ytD-0005zI-Fv
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 10:30:47 +0000
X-Inumbo-ID: 9c319070-5a32-4881-ad6b-0ca37fb04855
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c319070-5a32-4881-ad6b-0ca37fb04855;
 Tue, 18 Aug 2020 10:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=Q48nB/F4uU8xPjTIE8qhVPPBlboQ5C2A8+ikvUg0FYs=; b=38xHLYP4EgnuuyRVwsdfJGaudc
 jUx1E4+GfNq9ma2ubdK7PhwL6ldSe4Umw6AY6qFquyWcNgHRY2c6GXnN0X00CVYNSLXvfmVNz/eag
 csYkoO1ITnaHyubSiTJ5m+JTBSy+CJ+OVmsq/0p4j1HiNEpNcjFu8bVBza9sXDJslZso=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k7yt6-00013i-Mc; Tue, 18 Aug 2020 10:30:40 +0000
Received: from host31-48-92-96.range31-48.btcentralplus.com ([31.48.92.96]
 helo=u2f063a87eabd5f.home) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k7yt6-0003Rw-Db; Tue, 18 Aug 2020 10:30:40 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Subject: [PATCH v7 4/9] docs/specs: add missing definitions to
 libxc-migration-stream
Date: Tue, 18 Aug 2020 11:30:27 +0100
Message-Id: <20200818103032.3050-5-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200818103032.3050-1-paul@xen.org>
References: <20200818103032.3050-1-paul@xen.org>
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


