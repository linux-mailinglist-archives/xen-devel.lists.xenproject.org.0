Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6A7347DF4
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 17:44:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101094.193082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6cF-0000to-So; Wed, 24 Mar 2021 16:44:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101094.193082; Wed, 24 Mar 2021 16:44:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6cF-0000tP-Pi; Wed, 24 Mar 2021 16:44:19 +0000
Received: by outflank-mailman (input) for mailman id 101094;
 Wed, 24 Mar 2021 16:44:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hwg6=IW=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lP6cE-0000tK-9B
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 16:44:18 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe3c2d2f-ee37-440e-86e5-56f21fca31a0;
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
X-Inumbo-ID: fe3c2d2f-ee37-440e-86e5-56f21fca31a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616604256;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4C4OgRiFuuJLkcoqPkh43cejHpfFvgEUCcVuNhnuUcc=;
  b=d1oW4l0nFL8HDeBlmxNAQS0Qc1WUHTCUNqSXCx7ZMyci2TAGHmFE9NY9
   1iy/DWWMZ/C/8y9lc5iNId3iZ4fMcXmGUuZeKimuRKB7bB1wTs8NeYiUh
   4FH/JynxlgMwyuhg/nIRQHLQygOdjbmlB8U7jqmCsYJihaYnxGnjHMNFy
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 72Mkk4St9jViuPz78rtfz6TM6I6eKt8KZIl013QVGgP17ydrzEiXnXlOO1elZxsa3fVpHUuW5m
 Glp0Qq6VD6AIaA01m6yuvxal37EghsvW1MJFV0rPpux3q9Lvu7b3Po5i7j64tBJoJoBwfHzYcV
 abLpBBtLWF/m+fqPI3YRdqijHwJ3vvaN5/snWjyEkv22O+JpUMfgoSqh6QeuBarq1uxrdXi1G4
 4CLg3mixfNrWXqO8bQnzpb9sdtcSz2PL5ukh7K7huzfgCIclNNjaivo9c88p9HbLxgaDmBeFGf
 saw=
X-SBRS: 5.1
X-MesageID: 41481705
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:4WA9Q6x8Fj8kelO1QWKZKrPwqb1zdoIgy1knxilNYDZ+G/b3q+
 mFmvMH2RjozAsLUHY7ltyafIWGS3XQ9Zl6iLNhW4uKdg/gpWeuMcVe/ZLvqgeQYxHW2+ZB2c
 5bE5RWJ8b3CTFB4frSwA79KNo4xcnCzabAv5a6815IbSVHL55t9B14DAHzKDwQeCBjCYAiHJ
 SRouprzgDQGkg/VciwCnkbU+WrnbSi//iKXTc8CxEq8wWIhz+zgYSKdySw5RsCTyhJhY4r7G
 mtqX2B2oyYr/q5xhXAvlWz071qnrLapedrNYipgsgRJi6EsHfLWLhc
X-IronPort-AV: E=Sophos;i="5.81,275,1610427600"; 
   d="scan'208";a="41481705"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, George Dunlap
	<george.dunlap@citrix.coM>, Ian Jackson <ian.jackson@citrix.com>, "Paul
 Durrant" <paul@xen.org>
Subject: [PATCH 2/6] CHANGELOG.md: Add named PCI devices
Date: Wed, 24 Mar 2021 16:44:03 +0000
Message-ID: <20210324164407.302062-2-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324164407.302062-1-george.dunlap@citrix.com>
References: <20210324164407.302062-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: George Dunlap <george.dunlap@citrix.coM>
---
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Paul Durrant <paul@xen.org>
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 7f03e85bd7..8c89212f14 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -11,6 +11,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - Renesas IPMMU-VMSA (Supported, not security supported; was Tech Preview)
  - ARM SMMUv3 (Tech Preview)
  - Intel Processor Trace support (Tech Preview)
+ - Named PCI devices for xl/libxl
 
 ## Removed / support downgraded
 
-- 
2.30.2


