Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4130927AED8
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 15:13:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMsxs-0004KS-6T; Mon, 28 Sep 2020 13:13:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FkWq=DF=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kMsxq-0004DB-RY
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 13:13:10 +0000
X-Inumbo-ID: 5e450bfe-2943-43d5-ad51-83a23db6441a
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e450bfe-2943-43d5-ad51-83a23db6441a;
 Mon, 28 Sep 2020 13:12:47 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kMsxS-0007vv-Im; Mon, 28 Sep 2020 14:12:46 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 5/5] Update TftpDiVersion_buster
Date: Mon, 28 Sep 2020 14:12:41 +0100
Message-Id: <20200928131241.30278-6-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200928131241.30278-1-iwj@xenproject.org>
References: <20200928131241.30278-1-iwj@xenproject.org>
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

From: Ian Jackson <ian.jackson@eu.citrix.com>

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 production-config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/production-config b/production-config
index 0c135bcb..6f85a4df 100644
--- a/production-config
+++ b/production-config
@@ -91,7 +91,7 @@ TftpNetbootGroup osstest
 TftpDiVersion_wheezy 2016-06-08
 TftpDiVersion_jessie 2018-06-26
 TftpDiVersion_stretch 2020-09-24
-TftpDiVersion_buster 2020-05-19
+TftpDiVersion_buster 2020-09-28
 
 DebianSnapshotBackports_jessie http://snapshot.debian.org/archive/debian/20190206T211314Z/
 
-- 
2.20.1


