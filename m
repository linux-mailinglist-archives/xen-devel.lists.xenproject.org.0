Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3C4296361
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 19:09:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10601.28303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVe5e-0002a6-Fd; Thu, 22 Oct 2020 17:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10601.28303; Thu, 22 Oct 2020 17:09:26 +0000
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
	id 1kVe5e-0002ZE-B4; Thu, 22 Oct 2020 17:09:26 +0000
Received: by outflank-mailman (input) for mailman id 10601;
 Thu, 22 Oct 2020 17:09:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kVe5c-0002Xb-7U
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:24 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0cc435bc-f243-4d0d-abd9-0c2707d32535;
 Thu, 22 Oct 2020 17:09:23 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVe5b-0005tz-Eb
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:23 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVe5b-0005ZN-Dn
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:23 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kVdiH-00059e-4G; Thu, 22 Oct 2020 17:45:17 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kVe5c-0002Xb-7U
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:24 +0000
X-Inumbo-ID: 0cc435bc-f243-4d0d-abd9-0c2707d32535
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0cc435bc-f243-4d0d-abd9-0c2707d32535;
	Thu, 22 Oct 2020 17:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=dXejovIZMPj7AL5cM5Q0Y7OBdfs/GA2ayGeb8CLSfew=; b=PE56Vwgb/z5+PpFiMI/wQa0TlL
	TwX6Xaoao/AJEczGPuOvS1D+WwwQZBJsrs8Aam1fEy6cFHTGh+uX3Y1ZR5g46H4n9sHERRYaZavvN
	Okc7kReR21rkhA9pbsw5nIgoL//gZS1q67JV/D9g7nBohHKz4gTuqZSb7QUV7bfK8odI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVe5b-0005tz-Eb
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:23 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVe5b-0005ZN-Dn
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:23 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiH-00059e-4G; Thu, 22 Oct 2020 17:45:17 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 14/16] reporting: Minor fix to reporting of tasks with no subtask
Date: Thu, 22 Oct 2020 17:45:04 +0100
Message-Id: <20201022164506.1552-15-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201022164506.1552-1-iwj@xenproject.org>
References: <20201022164506.1552-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

subtask can be NULL.  If so, do not include it.

This change fixes a warning and a minor cosmetic defect.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 Osstest/Executive.pm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Osstest/Executive.pm b/Osstest/Executive.pm
index e3ab1dc3..d95d848d 100644
--- a/Osstest/Executive.pm
+++ b/Osstest/Executive.pm
@@ -427,7 +427,7 @@ sub report_rogue_task_description ($) {
     my $info= "rogue task ";
     $info .= " $arow->{type} $arow->{refkey}";
     $info .= " ($arow->{comment})" if defined $arow->{comment};
-    $info .= " $arow->{subtask}";
+    $info .= " $arow->{subtask}" if defined $arow->{subtask};
     $info .= " (user $arow->{username})";
     return $info;
 }
-- 
2.20.1


