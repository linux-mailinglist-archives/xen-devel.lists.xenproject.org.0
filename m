Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE765405B35
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 18:47:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183405.331565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mONCl-0005Fj-GY; Thu, 09 Sep 2021 16:47:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183405.331565; Thu, 09 Sep 2021 16:47:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mONCl-0005Cm-92; Thu, 09 Sep 2021 16:47:15 +0000
Received: by outflank-mailman (input) for mailman id 183405;
 Thu, 09 Sep 2021 16:47:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mONCj-00059b-I2
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 16:47:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mONCj-0002Mn-HE
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 16:47:13 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mONCj-0001RE-G5
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 16:47:13 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mONCh-0006u8-Kh; Thu, 09 Sep 2021 17:47:11 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=Pjp5XstcArsqNKuCQ700S1r/NZU8YkJaIMSB03Glj6s=; b=is/HxYZ5tdD/4XdLtxcfsSUD4V
	m/f5Z8WweG28os7M9w/987JUgAV+36MSfdEnX4m5vX1YJQ6QTOvXU4yknmn7cJBXKAXghjNmaqZ/V
	NXHItVLbxFO8H3sou0HmuCTsahhbB92HewKsxc3nOx7NDBVAS5Wvgj9nNRh/d3wi7CaI=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 2/4] mfi-common: Change dom0arch list order (nfc)
Date: Thu,  9 Sep 2021 17:47:01 +0100
Message-Id: <20210909164703.19426-2-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210909164703.19426-1-iwj@xenproject.org>
References: <20210909164703.19426-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the order to match fmtarches_outer in do_pv_debian_tests.

We are going to want to add an indirection here but not change
anything.

No change to output from standalone-generate-dump-flight-runvars.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 mfi-common | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mfi-common b/mfi-common
index 70e17f7a..02278420 100644
--- a/mfi-common
+++ b/mfi-common
@@ -644,7 +644,7 @@ test_matrix_iterate () {
       esac
 
       dom0arches=''
-      for dom0arch in i386 amd64 armhf arm64; do
+      for dom0arch in i386 armhf amd64 arm64; do
 
         case ${xenarch}_${dom0arch} in
             amd64_amd64) ;;
-- 
2.20.1


