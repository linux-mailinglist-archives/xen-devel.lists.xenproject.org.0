Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0AE347DF9
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 17:44:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101102.193146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6ce-0001GJ-Ns; Wed, 24 Mar 2021 16:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101102.193146; Wed, 24 Mar 2021 16:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6ce-0001FH-Ie; Wed, 24 Mar 2021 16:44:44 +0000
Received: by outflank-mailman (input) for mailman id 101102;
 Wed, 24 Mar 2021 16:44:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hwg6=IW=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lP6cd-0000tK-7s
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 16:44:43 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8b9bb53-14d3-40e0-83b8-30db28edc8ce;
 Wed, 24 Mar 2021 16:44:18 +0000 (UTC)
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
X-Inumbo-ID: b8b9bb53-14d3-40e0-83b8-30db28edc8ce
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616604258;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HQKmSZbFHLlD6mdZiLQiH7gZyoPJGO1tQ6hBSalifes=;
  b=JYvq87y0d5GDUooPKQFVPF4nuEMcWG2nkt6sIuAODNwoVH5DBwIYxNCC
   TstAI/RyWJJBrE+CaIxh5vUoIRbbWB219DkZnmLJb1wxVdBLnB4HH9jTC
   HYSUi6WqYXTiHxSqUfpSebOVJ6/8m4a2KoXdCGuacSJgne03GrKYF4cOP
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 4V+mfC6D+jk8A++6gCRyvS18VOqoP2x3MSvf7pV64XG0VgHsHwf3L5pXzg7eMSOrgnBO/xNZN9
 RtfYt5g/Vj2EVCqXbSFu13CQ3h1wH9lFAEoQRCR9nt2fLMTx6Am3p4xls2Qn4V+kwvOVwwe8LK
 PK2oZJXmukBALL8NFz8kqrb8ZkrpLDYwQStkEsjKRSnWzWknajaW6dzHnkXfj9CeenxankQmJ3
 EhzS6pH3la+wULjkaj9U+rvJWo2nVIkfs8UrN1rSqSduEE3vPrachOoggznooesFhA8d/C2Q/a
 CMk=
X-SBRS: 5.1
X-MesageID: 40025050
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:dqKNcatkDk0MV/m0rT+KzPX47skD8dV00zAX/kB9WHVpW+az/v
 rOoN0w0xjohDENHEw6kdebN6WaBV/a/5h54Y4eVI3SJTXOkm2uMY1k8M/e0yTtcheOjdJ1+K
 98f8FFeb7NJHdgi8KS2maFOvYmhOKK6aW5wdrZpk0dKT1CT4FFw0NHBh2AEktwLTM2Y6YRMJ
 aH/MJIq36BVB0sH6aGL0IIVeTCuNHH/aiOCXVtanIawTKDgj+y5LnxHwLw5GZ4bxp1zao/6m
 +AqgTl58yYwomG4yXB3Gze5Yk+orvc4+ZEbfbjtuElbhHligOlf+1aKti/gAw=
X-IronPort-AV: E=Sophos;i="5.81,275,1610427600"; 
   d="scan'208";a="40025050"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Manuel Bouyer
	<bouyer@netbsd.org>, Ian Jackson <ian.jackson@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: [PATCH 4/6] CHANGELOG.md: NetBSD lib/gnttab support
Date: Wed, 24 Mar 2021 16:44:05 +0000
Message-ID: <20210324164407.302062-4-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324164407.302062-1-george.dunlap@citrix.com>
References: <20210324164407.302062-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
CC: Manuel Bouyer <bouyer@netbsd.org>
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 354f213e81..3f4eed1d98 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -13,6 +13,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - Intel Processor Trace support (Tech Preview)
  - Named PCI devices for xl/libxl
  - Support for zstd-compressed dom0 kernels
+ - Library improvements from NetBSD ports upstreamed
 
 ## Removed / support downgraded
 
-- 
2.30.2


