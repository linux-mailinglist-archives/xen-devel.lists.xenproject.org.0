Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA5B1F40E3
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 18:30:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jih80-0001AN-Jb; Tue, 09 Jun 2020 16:29:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h0up=7W=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jih7y-0001AG-NQ
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 16:29:30 +0000
X-Inumbo-ID: 63a4ea08-aa6e-11ea-b33d-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63a4ea08-aa6e-11ea-b33d-12813bfff9fa;
 Tue, 09 Jun 2020 16:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=StNDX8utJEcCGoq3Fv0On8l7NyjDJ1rRRdFjlc8H5Oo=; b=0C7PLJdUmzmJaKbfJwcqULq5hN
 zJqDO23MbXjEblVW024d5sOB3JvqaECqi/c6lwv/fZmHELhhWqdMu5C/EEBmeCnlsQAQuBLlkk4UW
 NKTUCUAfs/vvbwE3MGYgP7+jtZmKJ8NHdv1Uk4RdQzQwRppelxyHeoW7dxS0M6Bzx43M=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jih7v-0003Vx-M7; Tue, 09 Jun 2020 16:29:27 +0000
Received: from [54.239.6.185] (helo=CBG-R90WXYV0.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jih7v-0003N4-Bj; Tue, 09 Jun 2020 16:29:27 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH-for-4.14 1/2] CHANGELOG: add 'domid_policy' and domid
 preservation on migrate
Date: Tue,  9 Jun 2020 17:29:21 +0100
Message-Id: <20200609162922.14679-2-paul@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200609162922.14679-1-paul@xen.org>
References: <20200609162922.14679-1-paul@xen.org>
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
 Paul Durrant <pdurrant@amazon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Community Manager <community.manager@xenproject.org>
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 8786c51cb4..cb1566ea5b 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -18,6 +18,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - Initial support to run on Hyper-V.
  - Initial hypervisor file system (hypfs) support.
  - libxl support for running qemu-xen device model in a linux stubdomain.
+ - New 'domid_policy', allowing domain-ids to be randomly chosen.
+ - Option to preserve domain-id across migrate or save+restore.
 
 ## [4.13.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.13.0) - 2019-12-17
 
-- 
2.17.1


