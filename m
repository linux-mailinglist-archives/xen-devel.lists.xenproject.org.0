Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D29FE316CE3
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 18:36:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83680.156377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9tPs-0006HN-7S; Wed, 10 Feb 2021 17:36:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83680.156377; Wed, 10 Feb 2021 17:36:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9tPs-0006Gg-0H; Wed, 10 Feb 2021 17:36:40 +0000
Received: by outflank-mailman (input) for mailman id 83680;
 Wed, 10 Feb 2021 17:36:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l9tPq-0006G8-AY
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 17:36:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l9tPq-0006Tw-9V
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 17:36:38 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l9tPq-0007oV-8B
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 17:36:38 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1l9tPo-0000Wv-H8; Wed, 10 Feb 2021 17:36:36 +0000
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
	bh=pcXf+OQ/1Tk4x0BUm1rv3F8ihe0S6K2hiU6TMoIlEeg=; b=1nW9fTfhXr9JBRjeAtAm3Dd1x3
	t8H7B3qP85HcJa6ctyCVFqS+8y9/qgpNrkUuRgGtKMuY9XG54qTP+IuvjQP5j4VEpLPF/nK7IPMQE
	QueXpeBwYigM172D8R/OgQDRtq5viA3rwCes+AZ9/xzrIs1FAlKMdfCSurmxpMsY+u6Q=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 2/3] production-config: Update d-i version to older Debian snapshot
Date: Wed, 10 Feb 2021 17:36:28 +0000
Message-Id: <20210210173629.4788-2-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210210173629.4788-1-iwj@xenproject.org>
References: <20210210173629.4788-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 production-config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/production-config b/production-config
index d89257e5..81582ec0 100644
--- a/production-config
+++ b/production-config
@@ -91,7 +91,7 @@ TftpNetbootGroup osstest
 TftpDiVersion_wheezy 2016-06-08
 TftpDiVersion_jessie 2018-06-26
 TftpDiVersion_stretch 2020-09-24
-TftpDiVersion_buster 2021-02-09
+TftpDiVersion_buster 2021-02-10
 
 DebianMirror_buster_armhf http://snapshot.debian.org/archive/debian/20210124T203726Z/
 
-- 
2.20.1


