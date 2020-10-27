Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F73429ADAD
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 14:44:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12855.33263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXPGn-0001dj-9L; Tue, 27 Oct 2020 13:44:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12855.33263; Tue, 27 Oct 2020 13:44:13 +0000
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
	id 1kXPGn-0001cx-37; Tue, 27 Oct 2020 13:44:13 +0000
Received: by outflank-mailman (input) for mailman id 12855;
 Tue, 27 Oct 2020 13:44:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=txzK=EC=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kXPGl-0001b2-6z
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:11 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 09414b3a-96fd-4658-97f5-58c34c5343a6;
 Tue, 27 Oct 2020 13:44:03 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kXPGd-0007vr-Kn
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:03 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kXPGd-000234-Ib
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:03 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kXPGb-0002Uo-K4; Tue, 27 Oct 2020 13:44:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=txzK=EC=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kXPGl-0001b2-6z
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:11 +0000
X-Inumbo-ID: 09414b3a-96fd-4658-97f5-58c34c5343a6
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 09414b3a-96fd-4658-97f5-58c34c5343a6;
	Tue, 27 Oct 2020 13:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=BgQgKZzhbqKo+V2i8b0wx7lVtbj5VfAzFi4byRnMZ84=; b=TJ9614qkxEA6MdlJYojOU8Q/PX
	BVOHQS8xNlSeTDKmzF9pmnLzDVTFFrjtoJtt6bRJGg+n8Jtw46Kq2wH4uvBx6Y6WqDbgC6wU6sC8S
	hhwi6PGVAgy6dDCPsi70ummYDqeDVJZgepFqJ+3aeKQiM6kW4DDdHctJlKPjWZ2myM8k=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kXPGd-0007vr-Kn
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:03 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kXPGd-000234-Ib
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:44:03 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kXPGb-0002Uo-K4; Tue, 27 Oct 2020 13:44:01 +0000
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 0/7] Prepare for ServerTech PDUs
Date: Tue, 27 Oct 2020 13:43:47 +0000
Message-Id: <20201027134354.25561-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have taken delivery of two Servertech PDUs which do
(near-)zero-crossing switching.  We hope these will not suffer from
the relays welding shut like our APC PDUs do.

We will control these PDUs via SNMP, as we do for the APC PDUs, but
each PDU manufacturer uses their own SNMP range, so adjustments to the
code and configuration are needed.

These new arrangements have been tested successfully in a mockup
environment.

Ian Jackson (7):
  README: Fix a typo
  pdu-snmp: Rename from pdu-msw
  pdu-snmp: Centralise base OIDs
  pdu-snmp: Refactor model handling
  pdu-snmp: Support ServerTech PDUs "Pro 1/2" aka "Sentry4"
  PDU::snmp, PDU::msw: Rename from msw to snmp
  pdu-snmp: Fix sleeping

 Osstest/PDU/msw.pm  | 14 +-------------
 Osstest/PDU/snmp.pm | 39 +++++++++++++++++++++++++++++++++++++++
 README              |  9 ++++++---
 pdu-msw => pdu-snmp | 45 +++++++++++++++++++++++++++++++++++----------
 4 files changed, 81 insertions(+), 26 deletions(-)
 create mode 100644 Osstest/PDU/snmp.pm
 rename pdu-msw => pdu-snmp (78%)

-- 
2.20.1


