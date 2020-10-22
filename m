Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 052662962FD
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 18:45:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10560.28121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVdiN-0007MV-Er; Thu, 22 Oct 2020 16:45:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10560.28121; Thu, 22 Oct 2020 16:45:23 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVdiN-0007Lx-B8; Thu, 22 Oct 2020 16:45:23 +0000
Received: by outflank-mailman (input) for mailman id 10560;
 Thu, 22 Oct 2020 16:45:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kVdiM-0007J4-Fr
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:22 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f992d3f-b987-4b7f-9091-d96978f70784;
 Thu, 22 Oct 2020 16:45:16 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVdiG-0005KL-Ac
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:16 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVdiG-0007RX-9l
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:16 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kVdiE-00059e-Jn; Thu, 22 Oct 2020 17:45:14 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kVdiM-0007J4-Fr
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:22 +0000
X-Inumbo-ID: 3f992d3f-b987-4b7f-9091-d96978f70784
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 3f992d3f-b987-4b7f-9091-d96978f70784;
	Thu, 22 Oct 2020 16:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=C+1e1LkAwGgC5IFexQaEraHAaghkz1YDhSurK5LkpAI=; b=05HUeVddBmvdon7uTzWT8QgIbQ
	g+PurN72ldhACXhYkec8QhHh7S6syxyIKF5W7+t9wsMQKWti+wgMHe6tYCD9dxg7RfQOetmcbK4O4
	4y8OSFgonK3LnFStk52FNjCTl8Tm/lLYkDjf7kU/OusOkEBB0VNAikSAgrND3zp/pPRg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiG-0005KL-Ac
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:16 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiG-0007RX-9l
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:16 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiE-00059e-Jn; Thu, 22 Oct 2020 17:45:14 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 04/16] PDU/MSW: Warn that SNMP status is often not immediately updated
Date: Thu, 22 Oct 2020 17:44:54 +0100
Message-Id: <20201022164506.1552-5-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201022164506.1552-1-iwj@xenproject.org>
References: <20201022164506.1552-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If you don't know this, it's very confusing.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 pdu-msw | 1 +
 1 file changed, 1 insertion(+)

diff --git a/pdu-msw b/pdu-msw
index d2691567..04b03a22 100755
--- a/pdu-msw
+++ b/pdu-msw
@@ -133,4 +133,5 @@ if (!defined $action) {
     print "was: "; show();
     set();
     print "now: "; show();
+    print "^ note, PDUs often do not update returned info immediately\n";
 }
-- 
2.20.1


