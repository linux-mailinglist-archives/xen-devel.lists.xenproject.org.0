Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F4D29ADB7
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 14:44:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12861.33322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXPHB-000220-W4; Tue, 27 Oct 2020 13:44:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12861.33322; Tue, 27 Oct 2020 13:44:37 +0000
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
	id 1kXPHB-000212-RN; Tue, 27 Oct 2020 13:44:37 +0000
Received: by outflank-mailman (input) for mailman id 12861;
 Tue, 27 Oct 2020 13:44:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=txzK=EC=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kXPHA-0001b2-7X
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:36 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af43575d-5cd1-4af6-bb2d-3a86862fcf7c;
 Tue, 27 Oct 2020 13:44:05 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kXPGf-0007wE-45
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:05 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kXPGf-00025a-2Y
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:05 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kXPGd-0002Uo-CI; Tue, 27 Oct 2020 13:44:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=txzK=EC=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kXPHA-0001b2-7X
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:36 +0000
X-Inumbo-ID: af43575d-5cd1-4af6-bb2d-3a86862fcf7c
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id af43575d-5cd1-4af6-bb2d-3a86862fcf7c;
	Tue, 27 Oct 2020 13:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=DE/eoGAmQvD+pJdKoW0UhbHdlhrfKgbDNu4rZs20/uA=; b=KlFM8E9wKq0F2iUIWL+fguCwQj
	cD64qTWKnBO0zJ//jOJarmRAjQpJ/L8nlLnmUZkONYdseez/s+svFoBQ1Bkw8bczaqc4wiCLyr2bS
	X8NcKnn9hZUr/9NPkFBEQDNx2LhuF/KEka11c7GUOLkIRZI8u1NZgL4Vaj1yGRWBHp9s=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kXPGf-0007wE-45
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:05 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kXPGf-00025a-2Y
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:05 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kXPGd-0002Uo-CI; Tue, 27 Oct 2020 13:44:03 +0000
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 7/7] pdu-snmp: Fix sleeping
Date: Tue, 27 Oct 2020 13:43:54 +0000
Message-Id: <20201027134354.25561-8-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201027134354.25561-1-iwj@xenproject.org>
References: <20201027134354.25561-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sleep takes only an integer.  We have to use select to sleep for
fractions of a second.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 pdu-snmp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pdu-snmp b/pdu-snmp
index 61380766..79d22e1f 100755
--- a/pdu-snmp
+++ b/pdu-snmp
@@ -172,7 +172,7 @@ if (!defined $action) {
     my $retries = 0;
     for (;;) {
 	set($valset);
-	sleep $retries * 0.1;
+	select undef,undef,undef, $retries * 0.1;
 	print "now: "; my $got = show();
 	if ($got eq $map[$valset]) { last; }
 	if ($map[$valset] !~ m{^(?:off|on)$}) {
-- 
2.20.1


