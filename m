Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C41BE1CD69C
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 12:32:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jY5j6-0005LB-Jg; Mon, 11 May 2020 10:32:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AmMB=6Z=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jY5j5-0005L6-Mk
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 10:31:59 +0000
X-Inumbo-ID: a3d56d36-9372-11ea-a1fe-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3d56d36-9372-11ea-a1fe-12813bfff9fa;
 Mon, 11 May 2020 10:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589193118;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZK+6clCz3pAtg+4NKrRjeCXG99veStf7aGxOGbS5Yvo=;
 b=KGDRHPy2wk2BbD1C546nwiqGnyAXBG9DgwGdvHmyZA38/CkMofiqsiAU
 PyDfUt6QDurZccKD9svfGrn9KRIQaJtMglIOCjjdlH/lWEIL0YiQsjEo8
 4LyrNGOtXQaGxu0+3OjpLgOtdrzjI77C/KnsKzqp++uoSR8lT3GCXJJNN A=;
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: 3IjGuaCHeywdi6HXrhDLnTrVtwNziCdCwERsjbo0ezf/ozYLrC7sdAFVwtHoI1EiHbCsREhaKt
 Let24G9jtgRMe1GOGK61Ej/KnG/de66pMWavl9Lm62OiJtIc2XHC06S7mcFGkQjXtKuM0t6sJF
 R7aS4S/9aaLhU31RSrlMItl5tCVyF8cT+A4N+CH5TGNwsx8d5m3Fg6gkSTfCRhsGitYObyRKqf
 CLLgqIsyXO7ZbaDw80EELZgwUK10r++J8LpQF9/pgV+tMP3jOiwhhZQZkYOaDUHRHz6NtVDcaC
 oy8=
X-SBRS: 2.7
X-MesageID: 17219151
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,379,1583211600"; d="scan'208";a="17219151"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH] changelog: add relevant changes during 4.14 development window
Date: Mon, 11 May 2020 12:31:45 +0200
Message-ID: <20200511103145.37098-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Cc: Community Manager <community.manager@xenproject.org>,
 Paul Durrant <paul@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add entries for the relevant changes I've been working on during the
4.14 development time frame. Mostly performance improvements related
to pvshim scalability issues when running with high number of vCPUs.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 CHANGELOG.md | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index b11e9bc4e3..554eeb6a12 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -8,6 +8,12 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
 ### Added
  - This file and MAINTAINERS entry.
+ - Use x2APIC mode whenever available, regardless of interrupt remapping
+   support.
+ - Performance improvements to guest assisted TLB flushes, either when using
+   the Xen hypercall interface or the viridian one.
+ - Assorted pvshim performance and scalability improvements plus some bug
+   fixes.
 
 ## [4.13.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.13.0) - 2019-12-17
 
-- 
2.26.2


