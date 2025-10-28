Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9803FC17582
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 00:29:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152458.1483030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDt7F-0004L4-5q; Tue, 28 Oct 2025 23:28:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152458.1483030; Tue, 28 Oct 2025 23:28:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDt7F-0004Ix-2v; Tue, 28 Oct 2025 23:28:37 +0000
Received: by outflank-mailman (input) for mailman id 1152458;
 Tue, 28 Oct 2025 23:28:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zQG5=5F=raptorengineering.com=tpearson@srs-se1.protection.inumbo.net>)
 id 1vDt7E-0004IX-7Q
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 23:28:36 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce83d335-b455-11f0-980a-7dc792cee155;
 Wed, 29 Oct 2025 00:28:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A5FFD7791AD6
 for <xen-devel@lists.xenproject.org>; Tue, 28 Oct 2025 18:28:27 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 440a_A0GZZ7n for <xen-devel@lists.xenproject.org>;
 Tue, 28 Oct 2025 18:28:27 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4939E7791B68
 for <xen-devel@lists.xenproject.org>; Tue, 28 Oct 2025 18:28:27 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id WkQLK4HxPb5t for <xen-devel@lists.xenproject.org>;
 Tue, 28 Oct 2025 18:28:27 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 327757791AD6
 for <xen-devel@lists.xenproject.org>; Tue, 28 Oct 2025 18:28:27 -0500 (CDT)
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
X-Inumbo-ID: ce83d335-b455-11f0-980a-7dc792cee155
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 4939E7791B68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1761694107; bh=WpO2DZ2tNa6+GLzIjlLEndiBR1obE2jahGZf0m+E97s=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=rqZtAFGk+i7qHBEWe2HYPY5D4nqjFyPfW5Cwbm1XD7abhS4cvDSmadX2/DgOmvvko
	 67qpozCxCBK7f1OoN9ixZ9dcx1ALiv/xfkxT+m+U32te/iVNrwozFG91ho6NIDFHVX
	 Ur+q3qelsJB1UMQQvtpDIxjY7NQ0scffabuIVj4A=
X-Virus-Scanned: amavisd-new at rptsys.com
Date: Tue, 28 Oct 2025 18:28:27 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <1669204635.4117.1761694107160.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH] MAINTAINERS: Remove Shawn Anastasio as PPC64 reviewer
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC141 (Linux)/8.5.0_GA_3042)
Thread-Index: Ar5ULJ2oPHPz2c8WwbRXUaZ20T4lig==
Thread-Topic: MAINTAINERS: Remove Shawn Anastasio as PPC64 reviewer

Shawn is no longer with Raptor Engineering.  For now, add myself as PPC64
maintainer.
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ecd3f40df8..c8764a8c5f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -472,7 +472,7 @@ F:	xen/drivers/cpufreq/
 F:	xen/include/acpi/cpufreq/
 
 PPC64
-M:	Shawn Anastasio <sanastasio@raptorengineering.com>
+M:	Timothy Pearson <tpearson@raptorengineering.com>
 F:	xen/arch/ppc/
 
 PUBLIC I/O INTERFACES AND PV DRIVERS DESIGNS
-- 
2.39.5

