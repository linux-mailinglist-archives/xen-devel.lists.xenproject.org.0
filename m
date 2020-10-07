Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8C2286717
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:28:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3743.11243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEB2-0005nP-NM; Wed, 07 Oct 2020 18:28:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3743.11243; Wed, 07 Oct 2020 18:28:36 +0000
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
	id 1kQEB1-0005hm-Fx; Wed, 07 Oct 2020 18:28:35 +0000
Received: by outflank-mailman (input) for mailman id 3743;
 Wed, 07 Oct 2020 18:28:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE4I-00072Q-LE
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:21:38 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8753e621-b9c0-488d-8e4f-27cb8b4ac0a2;
 Wed, 07 Oct 2020 18:20:14 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDkA-0007CF-QM; Wed, 07 Oct 2020 19:00:50 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE4I-00072Q-LE
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:21:38 +0000
X-Inumbo-ID: 8753e621-b9c0-488d-8e4f-27cb8b4ac0a2
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8753e621-b9c0-488d-8e4f-27cb8b4ac0a2;
	Wed, 07 Oct 2020 18:20:14 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDkA-0007CF-QM; Wed, 07 Oct 2020 19:00:50 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 71/82] resource reporting, nfc: split a here document
Date: Wed,  7 Oct 2020 19:00:13 +0100
Message-Id: <20201007180024.7932-72-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-flight | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sg-report-flight b/sg-report-flight
index 281361c0..a1f424c5 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -1213,6 +1213,9 @@ END
 <tr><td>Status:</td><td>$ji->{status}</td></tr>
 </table>
 <p>
+END
+
+    print H <<END;
 <h2>Logfiles etc.</h2>
 For main test script logfiles, see entries in steps table.
 <p>
-- 
2.20.1


