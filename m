Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E987E2962FB
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 18:45:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10561.28133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVdiO-0007OM-OJ; Thu, 22 Oct 2020 16:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10561.28133; Thu, 22 Oct 2020 16:45:24 +0000
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
	id 1kVdiO-0007Ni-K7; Thu, 22 Oct 2020 16:45:24 +0000
Received: by outflank-mailman (input) for mailman id 10561;
 Thu, 22 Oct 2020 16:45:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kVdiM-0007J9-UC
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:22 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06f363db-1555-4fd7-92a8-8a5ce08226d0;
 Thu, 22 Oct 2020 16:45:17 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVdiH-0005Kf-DH
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:17 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVdiH-0007T1-CK
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:17 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kVdiF-00059e-Ka; Thu, 22 Oct 2020 17:45:15 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kVdiM-0007J9-UC
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:22 +0000
X-Inumbo-ID: 06f363db-1555-4fd7-92a8-8a5ce08226d0
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 06f363db-1555-4fd7-92a8-8a5ce08226d0;
	Thu, 22 Oct 2020 16:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=bFPgih86ZB+5E8DS2+fY36fGNFvkYHro0nXN3elXtQs=; b=mFv0ByEi14am0LJl3NtKkn8hzw
	93y3ookXVXDgNgILgqtiOMsaW1T5XgCZx8vN5vx+ScNCaN9IM7uVT3R7YSQ2ID0uEoH4NgsMovgye
	yIbmgnkSf4uneRQB1/et8pn0DgOORtB9sc7LRgYUPjw1GlX4GjcT3DzpD6teDnjqVKeY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiH-0005Kf-DH
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:17 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiH-0007T1-CK
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:17 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiF-00059e-Ka; Thu, 22 Oct 2020 17:45:15 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 08/16] PDU/MSW: Make show() return the value from get()
Date: Thu, 22 Oct 2020 17:44:58 +0100
Message-Id: <20201022164506.1552-9-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201022164506.1552-1-iwj@xenproject.org>
References: <20201022164506.1552-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No-one uses this return value yet, so NFC.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 pdu-msw | 1 +
 1 file changed, 1 insertion(+)

diff --git a/pdu-msw b/pdu-msw
index 196b6c45..2d4ec967 100755
--- a/pdu-msw
+++ b/pdu-msw
@@ -119,6 +119,7 @@ sub get () {
 sub show () {
     my $mean = get();
     printf "pdu-msw $dnsname: #%s \"%s\" = %s\n", $useport, $usename, $mean;
+    return $mean;
 }
 
 sub action_value () {
-- 
2.20.1


