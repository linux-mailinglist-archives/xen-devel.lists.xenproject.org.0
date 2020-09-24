Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C099277698
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 18:23:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLU0w-0008B5-0r; Thu, 24 Sep 2020 16:22:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jbFt=DB=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1kLU0v-0008AZ-5A
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 16:22:33 +0000
X-Inumbo-ID: c6f09028-6270-41b8-9d1f-16266d4ac6fb
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c6f09028-6270-41b8-9d1f-16266d4ac6fb;
 Thu, 24 Sep 2020 16:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From;
 bh=A28/4ldAK8nZtP5YsukmkB9qMtAfTpyWJiDxn2yzZj8=; b=BgSI83HFXk/TdnwW+q8qS/qW34
 kR9fOuPW7tM7hGByh0xsJlJ4OoWUB/oYpj91XGFjsx61VqJH9GhdbsrHc2qL6zdmEPkKOA7Pj5Bdb
 OhYA9zBqv1QylhZMiAAh6ZmD8mQjUHtc92OErSzZu25MP4jKxJqdGHTTJisHVTGScAPA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1kLU0t-0002tO-68; Thu, 24 Sep 2020 16:22:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1kLU0s-0003Sd-US; Thu, 24 Sep 2020 16:22:30 +0000
Received: from iwj by osstest.test-lab.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1kLU0s-0003TH-Tx; Thu, 24 Sep 2020 16:22:30 +0000
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [OSSTEST PATCH] TftiDiVersion: Update to latest installer for stretch
Date: Thu, 24 Sep 2020 16:22:24 +0000
Message-Id: <20200924162224.12994-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
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

The stretch (Debian oldstable) kernel has been updated, causing our
Xen 4.10 tests (which are still using stretch) to break.  This update
seems to fix it.

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 production-config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/production-config b/production-config
index 6055bd18..0c135bcb 100644
--- a/production-config
+++ b/production-config
@@ -90,7 +90,7 @@ TftpNetbootGroup osstest
 # Update with ./mg-debian-installer-update(-all)
 TftpDiVersion_wheezy 2016-06-08
 TftpDiVersion_jessie 2018-06-26
-TftpDiVersion_stretch 2020-02-10
+TftpDiVersion_stretch 2020-09-24
 TftpDiVersion_buster 2020-05-19
 
 DebianSnapshotBackports_jessie http://snapshot.debian.org/archive/debian/20190206T211314Z/
-- 
2.20.1


