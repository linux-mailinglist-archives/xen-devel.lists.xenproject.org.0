Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFE428F628
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 17:50:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7516.19673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT5WV-0006KM-CI; Thu, 15 Oct 2020 15:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7516.19673; Thu, 15 Oct 2020 15:50:35 +0000
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
	id 1kT5WV-0006Jp-8q; Thu, 15 Oct 2020 15:50:35 +0000
Received: by outflank-mailman (input) for mailman id 7516;
 Thu, 15 Oct 2020 15:50:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kT5WU-0006GM-0o
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:34 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 733865e4-7403-49ce-adca-e4676c5d0d6c;
 Thu, 15 Oct 2020 15:50:28 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5WO-00087l-DE
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:28 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5WO-0005EZ-B1
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:28 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kT5WM-0000oB-Fn; Thu, 15 Oct 2020 16:50:26 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kT5WU-0006GM-0o
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:34 +0000
X-Inumbo-ID: 733865e4-7403-49ce-adca-e4676c5d0d6c
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 733865e4-7403-49ce-adca-e4676c5d0d6c;
	Thu, 15 Oct 2020 15:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=Ib9u1KozgEMCg0jCGLWPWL8C4aZzOGRCjREpAAS7g4Y=; b=5uRoQMzX8oU6XFYbtTezweKWbT
	rbMo9yOrAT5Pxnp+T9kmCHM10GgixrtLQ/Lr53QdVadPIXx2+ryUcYpracwnk6PdJ86qH6O7RfuMF
	o3tRVc4O8qdjJ0q/8TPh6sMfIwwR8O2qCLF9zoS9V+ZjIjP+DAQxJ7MVmCtaEE3Pk+5c=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WO-00087l-DE
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:28 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WO-0005EZ-B1
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:28 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WM-0000oB-Fn; Thu, 15 Oct 2020 16:50:26 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH v2 01/17] Honour OSSTEST_SIMULATE=2 to actually run dummy flight
Date: Thu, 15 Oct 2020 16:50:03 +0100
Message-Id: <20201015155019.20705-2-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201015155019.20705-1-iwj@xenproject.org>
References: <20201015155019.20705-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 cri-args-hostlists | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/cri-args-hostlists b/cri-args-hostlists
index 994e00c0..6cdff53f 100644
--- a/cri-args-hostlists
+++ b/cri-args-hostlists
@@ -68,8 +68,8 @@ fi
 
 execute_flight () {
         case "x$OSSTEST_SIMULATE" in
-        x|x0)   ;;
-        *)      echo SIMULATING - NOT EXECUTING $1 $2
+        x|x0|x2)   ;;
+        *)      echo SIMULATING $OSSTEST_SIMULATE - NOT EXECUTING $1 $2
                 return
                 ;;
         esac
-- 
2.20.1


