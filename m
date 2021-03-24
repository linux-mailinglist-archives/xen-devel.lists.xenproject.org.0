Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E818347DF5
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 17:44:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101095.193095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6cL-0000wy-7m; Wed, 24 Mar 2021 16:44:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101095.193095; Wed, 24 Mar 2021 16:44:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6cL-0000vu-2y; Wed, 24 Mar 2021 16:44:25 +0000
Received: by outflank-mailman (input) for mailman id 101095;
 Wed, 24 Mar 2021 16:44:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hwg6=IW=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lP6cJ-0000tK-7J
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 16:44:23 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd8a576e-bffc-4142-a06d-66bd92ffbff7;
 Wed, 24 Mar 2021 16:44:17 +0000 (UTC)
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
X-Inumbo-ID: cd8a576e-bffc-4142-a06d-66bd92ffbff7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616604257;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HNnD1ifZG7hjYa3HYfpM+QU5Aly2XM1Az6oLBD+L1c0=;
  b=CsvjfrACZe9xeZIi3Qw98JRd3RENe2tit/3Thgm4zPeIw/ql+CK39B4V
   WxxSVP4EKD7ti4eiADrAWsiFAjm5Vo8SGCrCGnqMwH2n8PYP7Dgzvy1us
   yY3eL7VuOsm9eXmZRaVLWjCZ0FSJ+S9IZVM9LGOiOUvqRyAwUydAOSenh
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: PPq1jVeQZFpMdVmFuc7zLN3wW/CXZT5AZen1WyoSNpU5+e7os/bA52KC77bUyhTQA3vyLhXdPq
 mkfj/EAH3k3mlHogb30/L3mFAqPIK7B20XX9g24sv+wa1n3D1oNBK0Oln9dA/z/W4svjbtf8Z0
 kxm8SQrLRB1Cn3y/4GkkF7S38w3mZaNXiGJIZdRejhmcViHjJXNTUTJjwNVA7/5aTNOYmso9qC
 SFAIud8qEGhluQUs4azgJxDmMjxiWcgjZ8DJvTltnJ29QxTXK2W+uQlCXazDeFh7o3l8fGqIxW
 yEU=
X-SBRS: 5.1
X-MesageID: 40025049
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:P50lxqFyTAMRJKMXpLqEb8eALOonbusQ8zAX/mpaICY1TuWzkc
 eykPMHkSLugDEKV3063fyGMq+MQXTTnKQFmLU5F7GkQQXgpS+UPJhvhLGSuAHINiXi+odmpM
 RdWodkDtmYNzdHpOb8pDK1CtMxhOSAmZrY4dv261dIYUVUZ7p77wF/YzzrdHFeYAVdH5I2GN
 69y6N81lidUE8aZMi6GXUJNtKrz7ag+f7bSCULCBI95A6FgSnA0s+cLzGi0goDSDQK+L8+8A
 H+4nTEz5++uPK2wAK07Q/uxqlR8eGO9vJzQOiFis0YMVzX+2OVWLg=
X-IronPort-AV: E=Sophos;i="5.81,275,1610427600"; 
   d="scan'208";a="40025049"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Ian Jackson <ian.jackson@citrix.com>
Subject: [PATCH 3/6] CHANGELOG.md: Add dom0 zstd compression support
Date: Wed, 24 Mar 2021 16:44:04 +0000
Message-ID: <20210324164407.302062-3-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324164407.302062-1-george.dunlap@citrix.com>
References: <20210324164407.302062-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <ian.jackson@citrix.com>
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 8c89212f14..354f213e81 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -12,6 +12,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - ARM SMMUv3 (Tech Preview)
  - Intel Processor Trace support (Tech Preview)
  - Named PCI devices for xl/libxl
+ - Support for zstd-compressed dom0 kernels
 
 ## Removed / support downgraded
 
-- 
2.30.2


