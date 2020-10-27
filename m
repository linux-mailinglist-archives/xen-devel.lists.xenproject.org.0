Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4FE29ADB2
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 14:44:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12858.33299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXPH2-0001qZ-8i; Tue, 27 Oct 2020 13:44:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12858.33299; Tue, 27 Oct 2020 13:44:28 +0000
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
	id 1kXPH2-0001pt-4M; Tue, 27 Oct 2020 13:44:28 +0000
Received: by outflank-mailman (input) for mailman id 12858;
 Tue, 27 Oct 2020 13:44:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=txzK=EC=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kXPH0-0001b2-7W
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:26 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 711c59bb-aa35-4855-b496-b03771642e22;
 Tue, 27 Oct 2020 13:44:04 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kXPGe-0007w6-JZ
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:04 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kXPGe-00024r-If
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:04 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kXPGc-0002Uo-Td; Tue, 27 Oct 2020 13:44:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=txzK=EC=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kXPH0-0001b2-7W
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:26 +0000
X-Inumbo-ID: 711c59bb-aa35-4855-b496-b03771642e22
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 711c59bb-aa35-4855-b496-b03771642e22;
	Tue, 27 Oct 2020 13:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=ht5aMArUMsbRZegTrAAwD7lR0CIO4rForYrTexZof/g=; b=6No575w7BLbLgwxOa+OluzfAhV
	eSOnAue4Va2681FC/CaJB3Z3jKGahvAu4JKegrHsj7GkzaGMVK2F6OVM3PPaeYF/GcOTz7zlSTvwR
	xVHz3Y9wyCMxKVmCCVfFfXzGJg2bsGjtaiyz7rq8UTE9qlfJAl6hV7qNiuPsVGn5Gx6I=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kXPGe-0007w6-JZ
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:04 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kXPGe-00024r-If
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:04 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kXPGc-0002Uo-Td; Tue, 27 Oct 2020 13:44:02 +0000
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 5/7] pdu-snmp: Support ServerTech PDUs "Pro 1/2" aka "Sentry4"
Date: Tue, 27 Oct 2020 13:43:52 +0000
Message-Id: <20201027134354.25561-6-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201027134354.25561-1-iwj@xenproject.org>
References: <20201027134354.25561-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Values from Sentry4.mib, from
  https://www.servertech.com/support/sentry-mib-oid-tree-downloads

Useful runes used when developing and testing, with "Sentry.mib" from
the Servertech zipfile renamed to "mibs/Sentry4-MIB":
  snmpwalk -On -m Sentry4-MIB -M +:mibs/ -Ci -v 2c -c private pdu1 iso.3.6.1.4.1.1718.4
  snmpwalk -m Sentry4-MIB -M +:mibs/ -Ci -v 2c -c private pdu1 iso.3.6.1.4.1.1718.4
  snmptranslate -Td -m Sentry4-MIB -M +:mibs/ Sentry4-MIB::st4OutletControlAction.1.1.2

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 pdu-snmp | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/pdu-snmp b/pdu-snmp
index 74244145..61380766 100755
--- a/pdu-snmp
+++ b/pdu-snmp
@@ -44,6 +44,13 @@ sub model_apc6 () {
     $baseoid_write= '.1.3.6.1.4.1.318.1.1.12.3.3.1.1.4';
 }
 
+sub model_sentry4 () {
+    $baseoid = ".1.3.6.1.4.1.1718.4.1.8";
+    $baseoid_name = "$baseoid.2.1.3.1.1"; # st4OutletName.1.1
+    $baseoid_read = "$baseoid.3.1.1.1.1"; # st4OutletState.1.1
+    $baseoid_write= "$baseoid.5.1.2.1.1"; # st4OutletControlAction.1.1
+}
+
 my $model_name = 'msw';
 
 while (@ARGV && $ARGV[0] =~ m/^-/) {
-- 
2.20.1


