Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A7B296301
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 18:45:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10565.28181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVdid-0007l3-F5; Thu, 22 Oct 2020 16:45:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10565.28181; Thu, 22 Oct 2020 16:45:39 +0000
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
	id 1kVdid-0007k7-6K; Thu, 22 Oct 2020 16:45:39 +0000
Received: by outflank-mailman (input) for mailman id 10565;
 Thu, 22 Oct 2020 16:45:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kVdib-0007J4-GJ
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:37 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ac949d06-cb98-42ec-8bf9-e6ec95e409e3;
 Thu, 22 Oct 2020 16:45:16 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVdiG-0005KO-L0
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:16 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVdiG-0007Rs-J3
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:16 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kVdiE-00059e-S2; Thu, 22 Oct 2020 17:45:14 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kVdib-0007J4-GJ
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:37 +0000
X-Inumbo-ID: ac949d06-cb98-42ec-8bf9-e6ec95e409e3
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ac949d06-cb98-42ec-8bf9-e6ec95e409e3;
	Thu, 22 Oct 2020 16:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=pa077BjlAALhun+Yyi8NReU98V341OBBWUC/iUdKDE4=; b=cvdEr3Hk5nzZwKzhmrsJJqzop0
	eskRHXJOZsEttWed1bDYUDVmuFyd2YHS4pFQ3qIy4u6KCqjt+qRk/0fIcdRmlFrHIRSkhiRxRUtgN
	ejryRhn/AW3zWK4IZFWxysj4Av/5rMczWeTOclFVZPR7xdb0VZ57mOsb4UhANBdYBDnA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiG-0005KO-L0
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:16 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiG-0007Rs-J3
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:16 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiE-00059e-S2; Thu, 22 Oct 2020 17:45:14 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 05/16] PDU/MSW: Break out get()
Date: Thu, 22 Oct 2020 17:44:55 +0100
Message-Id: <20201022164506.1552-6-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201022164506.1552-1-iwj@xenproject.org>
References: <20201022164506.1552-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is going to be useful in a moment.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 pdu-msw | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/pdu-msw b/pdu-msw
index 04b03a22..58c33952 100755
--- a/pdu-msw
+++ b/pdu-msw
@@ -106,13 +106,18 @@ my @map= (undef, qw(
                     delayed-off
                     delayed-reboot));
 
-sub show () {
+sub get () {
     my $got= $session->get_request($read_oid);
     die "SNMP error reading $read_oid ".$session->error()." " unless $got;
     my $val= $got->{$read_oid};
     die unless $val;
     my $mean= $map[$val];
     die "$val ?" unless defined $mean;
+    return $mean;
+}
+
+sub show () {
+    my $mean = get();
     printf "pdu-msw $dnsname: #%s \"%s\" = %s\n", $useport, $usename, $mean;
 }
 
-- 
2.20.1


