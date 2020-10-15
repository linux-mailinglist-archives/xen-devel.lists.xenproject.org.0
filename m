Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C7328F668
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 18:09:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7545.19811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT5of-0000fS-1Z; Thu, 15 Oct 2020 16:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7545.19811; Thu, 15 Oct 2020 16:09:21 +0000
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
	id 1kT5oe-0000ei-Tj; Thu, 15 Oct 2020 16:09:20 +0000
Received: by outflank-mailman (input) for mailman id 7545;
 Thu, 15 Oct 2020 16:09:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kT5od-0000WV-S0
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:19 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad5d6dd0-5b63-453f-b297-7a399c91773d;
 Thu, 15 Oct 2020 16:09:16 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5oa-0000gP-23
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:16 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5oa-0006d2-18
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:16 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kT5WQ-0000oB-Fn; Thu, 15 Oct 2020 16:50:30 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kT5od-0000WV-S0
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:19 +0000
X-Inumbo-ID: ad5d6dd0-5b63-453f-b297-7a399c91773d
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ad5d6dd0-5b63-453f-b297-7a399c91773d;
	Thu, 15 Oct 2020 16:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=uF93lLE6Hujj9HHD1uOcz9Kb2G0DNm7aSbOO3mDjPxk=; b=ucPB9WYIV0ZAF7oH+CGrjitn7Y
	jOM9r+VrJwVBV1a9GkeV4ypM3hBlEDHCtcji9kMc+BcJ/m1a8iuBWL7WgCbFmfVkX4sPSs3DMMZfU
	7SVRFn3zPiEKWwyCWOFTkHzmIwiiEa0UhArz6L3LRjp/ZqfpJn+j2RySJ9vrI9Awsg0E=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5oa-0000gP-23
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:16 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5oa-0006d2-18
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:09:16 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WQ-0000oB-Fn; Thu, 15 Oct 2020 16:50:30 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: [OSSTEST PATCH v2 15/17] cr-daily-branch: Do not do immediate retry of failing xtf flights
Date: Thu, 15 Oct 2020 16:50:17 +0100
Message-Id: <20201015155019.20705-16-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201015155019.20705-1-iwj@xenproject.org>
References: <20201015155019.20705-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CC: Andrew Cooper <Andrew.Cooper3@citrix.com>
Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 cr-daily-branch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/cr-daily-branch b/cr-daily-branch
index 3e58d465..9b1961bd 100755
--- a/cr-daily-branch
+++ b/cr-daily-branch
@@ -484,6 +484,7 @@ default_immediate_retry=$wantpush
 case "$branch" in
 *smoke*)	default_immediate_retry=false ;;
 osstest)	default_immediate_retry=false ;;
+xtf*)		default_immediate_retry=false ;;
 *)		;;
 esac
 
-- 
2.20.1


