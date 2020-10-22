Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7F12962FF
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 18:45:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10562.28146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVdiT-0007Tm-7i; Thu, 22 Oct 2020 16:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10562.28146; Thu, 22 Oct 2020 16:45:29 +0000
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
	id 1kVdiT-0007Sl-07; Thu, 22 Oct 2020 16:45:29 +0000
Received: by outflank-mailman (input) for mailman id 10562;
 Thu, 22 Oct 2020 16:45:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kVdiR-0007J4-GJ
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:27 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da8692b0-de15-47c7-a238-7feafc4a7b64;
 Thu, 22 Oct 2020 16:45:15 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVdiF-0005K9-Ew
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:15 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVdiF-0007QV-Cy
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:15 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kVdiD-00059e-Hp; Thu, 22 Oct 2020 17:45:13 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kVdiR-0007J4-GJ
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:27 +0000
X-Inumbo-ID: da8692b0-de15-47c7-a238-7feafc4a7b64
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id da8692b0-de15-47c7-a238-7feafc4a7b64;
	Thu, 22 Oct 2020 16:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=4zhHPcchVTIPM4EA2n/U98DOT589YDrA8xIM57+zDDI=; b=LAGVWRMRgcfmBDzNKkrr6r5S9j
	CTKuR0R8IvBhuQjRcnnavDB7gG4jVj4NOlGkmdlW/Vx2RVqQpwWmyE//7Guad8lD3YxyVPE+6uO25
	Z/L5Dqe+gE6GpdCeYDnRxGxxxT1FmBKLXVVExIg0rO5ptfy7OfxBL5j9ayVDNp6so6OM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiF-0005K9-Ew
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:15 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiF-0007QV-Cy
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:15 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiD-00059e-Hp; Thu, 22 Oct 2020 17:45:13 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 00/16] Bugfixes
Date: Thu, 22 Oct 2020 17:44:50 +0100
Message-Id: <20201022164506.1552-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Many of these are fixes to host sharing.

I'm still doing a formal dev test but I expect to push these soon.

Ian Jackson (16):
  share in jobdb: Break out $checkconstraints and move call
  share in jobdb: Move out-of-flight special case higher up
  PDU/IPMI: Retransmit, don't just wait
  PDU/MSW: Warn that SNMP status is often not immediately updated
  PDU/MSW: Break out get()
  PDU/MSW: Break out action_value()
  PDU/MSW: Actually implement delayed-*
  PDU/MSW: Make show() return the value from get()
  PDU/MSU: Retransmit on/off until PDU has changed
  host reuse fixes: Fix running of steps adhoc
  host reuse fixes: Fix runvar entry for adhoc tasks
  Introduce guest_mk_lv_name
  Prefix guest LV names with the job name
  reporting: Minor fix to reporting of tasks with no subtask
  host reuse fixes: Do not break host-reuse if no host allocated
  starvation: Do not count more than half a flight as starved

 Osstest/Executive.pm        |  2 +-
 Osstest/JobDB/Executive.pm  | 46 +++++++++++++++++++++++--------------
 Osstest/PDU/ipmi.pm         |  5 ++--
 Osstest/TestSupport.pm      |  9 ++++++--
 pdu-msw                     | 37 +++++++++++++++++++++++++----
 ts-debian-fixup             | 22 ++++++++++++++++++
 ts-debian-install           |  2 +-
 ts-host-reuse               |  2 +-
 ts-hosts-allocate-Executive |  2 +-
 9 files changed, 97 insertions(+), 30 deletions(-)

-- 
2.20.1


