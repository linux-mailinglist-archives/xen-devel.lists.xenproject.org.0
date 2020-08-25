Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DA92517E6
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 13:41:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAXK0-00034u-FN; Tue, 25 Aug 2020 11:41:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=577d=CD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1kAXJy-00030Q-Nl
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 11:40:58 +0000
X-Inumbo-ID: 94d20758-0b0e-4002-9eee-c79009b49236
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 94d20758-0b0e-4002-9eee-c79009b49236;
 Tue, 25 Aug 2020 11:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598355652;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=rwWRXEC6We/jkqKgEfFKTqhfeAWnYjAzJRLNkGjEIRI=;
 b=Z7XVzjVOfRbz1/5SW1NV2Cy87W1KqpgrxvRrAxOV2KyRPIDGCYPIUNVV
 BMeuYWKS7btMyJsSnp+C+QeOCmLRld0Yj+3DHpA7/BdWZn16blnx/hRBd
 Taodcfco+3oJAugEIbvXP92sJ2l2RyGzsHIK1BOME2OLi9bQEFK6R4p5B w=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: kygFYLZqZJBqa7Qbz3vf597cUXJKpvpCaljMSIPoyGDrSgbItHL7Pg8gCngrgnpVJwXMbOaAZS
 lK2xd2w2BdXZujas5KR+i0onEpMunT+LetV/58lpQTKSQv1Q4Jvh7mBxjM8mQOCxwg9VRYXaau
 FKkjw/ZFjjUhVDSLMQ4wJuQGz/sDrMsn5jniSrzE03sdhdRXOt37TgJVYI7hZMqCa1jZpfF1/n
 4XiQ5yovL9HY9xOffBPP2a2D9StrS7mVxjsjjaBU2EzhcK26n/i8uJ55SWL9Ed3AudWgy819R3
 CjE=
X-SBRS: 2.7
X-MesageID: 25567115
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,352,1592884800"; d="scan'208";a="25567115"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>, Ian Jackson
 <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 02/12] Executive.pm planner: fix typo
Date: Tue, 25 Aug 2020 12:40:31 +0100
Message-ID: <20200825114041.16290-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200825114041.16290-1-ian.jackson@eu.citrix.com>
References: <20200825114041.16290-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain
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

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 Osstest/Executive.pm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Osstest/Executive.pm b/Osstest/Executive.pm
index 61a99bc3..4151aa6c 100644
--- a/Osstest/Executive.pm
+++ b/Osstest/Executive.pm
@@ -693,7 +693,7 @@ sub plan_search ($$$$) {
 
 	    next PERIOD if $endevt->{Time} <= $try_time;
             # this period is entirely before the proposed slot;
-            # it doesn't overlap, but most check subsequent periods
+            # it doesn't overlap, but must check subsequent periods
 
 	  CHECK:
 	    {
-- 
2.20.1


