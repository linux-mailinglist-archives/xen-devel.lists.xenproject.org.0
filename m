Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F7528F626
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 17:50:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7518.19698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT5Wb-0006RM-1f; Thu, 15 Oct 2020 15:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7518.19698; Thu, 15 Oct 2020 15:50:40 +0000
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
	id 1kT5Wa-0006Qb-Sj; Thu, 15 Oct 2020 15:50:40 +0000
Received: by outflank-mailman (input) for mailman id 7518;
 Thu, 15 Oct 2020 15:50:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kT5WZ-0006GM-11
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:39 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39964fa8-4653-494f-9ed6-c44f232c5b55;
 Thu, 15 Oct 2020 15:50:29 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5WP-00087x-7D
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:29 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5WP-0005FQ-6O
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:29 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kT5WN-0000oB-GH; Thu, 15 Oct 2020 16:50:27 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kT5WZ-0006GM-11
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:39 +0000
X-Inumbo-ID: 39964fa8-4653-494f-9ed6-c44f232c5b55
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 39964fa8-4653-494f-9ed6-c44f232c5b55;
	Thu, 15 Oct 2020 15:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=02bnAe8Pk+WQt+MbpE+lK1JlJkiQs50S4+SkvCn1WvQ=; b=sOco/NYNjydGO2EzHcka/1MPPg
	V80yd2kaHgCE8uDjurbLWMIQ5GUy60sKXV6nxpbq6lHuN2OmXx2r/gP5AwQvmz3Tf9+rxHHPfpHqc
	8eaI7mYQ7ol9nV2c12KuyQ+Ej9z3Zft1UdVFW0F8p49Zn4FiX9t/CzZeTDd7/o5YAfgI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WP-00087x-7D
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:29 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WP-0005FQ-6O
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:29 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WN-0000oB-GH; Thu, 15 Oct 2020 16:50:27 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH v2 05/17] sg-report-job-history: eval $DAILY_BRANCH_PREEXEC_HOOK
Date: Thu, 15 Oct 2020 16:50:07 +0100
Message-Id: <20201015155019.20705-6-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201015155019.20705-1-iwj@xenproject.org>
References: <20201015155019.20705-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

Put the call to this debugging/testing variable inside an eval.  This
allows a wider variety of stunts.  The one in-tree reference is
already compatible with this new semantics.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 cr-daily-branch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/cr-daily-branch b/cr-daily-branch
index b8f221ee..23060588 100755
--- a/cr-daily-branch
+++ b/cr-daily-branch
@@ -472,7 +472,7 @@ sgr_args+=" $EXTRA_SGR_ARGS"
 
 date >&2
 : $flight $branch $OSSTEST_BLESSING $sgr_args
-$DAILY_BRANCH_PREEXEC_HOOK
+eval "$DAILY_BRANCH_PREEXEC_HOOK"
 execute_flight $flight $OSSTEST_BLESSING
 date >&2
 
-- 
2.20.1


