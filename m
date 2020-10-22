Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AE2295C3D
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 11:49:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10310.27421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVXDs-0004hu-B4; Thu, 22 Oct 2020 09:49:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10310.27421; Thu, 22 Oct 2020 09:49:28 +0000
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
	id 1kVXDs-0004h1-7C; Thu, 22 Oct 2020 09:49:28 +0000
Received: by outflank-mailman (input) for mailman id 10310;
 Thu, 22 Oct 2020 09:49:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dfvK=D5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kVXDq-0004UF-Qi
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 09:49:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07e93d5b-33d8-42b6-bf18-f0670b67f9c7;
 Thu, 22 Oct 2020 09:49:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2A7AAAE3B;
 Thu, 22 Oct 2020 09:49:11 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dfvK=D5=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kVXDq-0004UF-Qi
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 09:49:26 +0000
X-Inumbo-ID: 07e93d5b-33d8-42b6-bf18-f0670b67f9c7
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 07e93d5b-33d8-42b6-bf18-f0670b67f9c7;
	Thu, 22 Oct 2020 09:49:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603360151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Crg06KGGfBCWdVR6siqyRllme38SLEsgnrcw++z2EXs=;
	b=ntkw3Oa1P44/sgDd0FbtwXok4p2xU0vrbQGLG4PPE9rd1nOYQw27Ptor1TwPnXkxR18tKM
	ry1Zlp/JBcMLyM9Aux5JT3P9ciKA7Tdnn+EJKLeFFQV6SrPeC5bYYGXpA2ToqOzp4trx4+
	93O6GQYNhH18xBfwGqp33Jge1+eOrf0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2A7AAAE3B;
	Thu, 22 Oct 2020 09:49:11 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 5/5] Documentation: add xen.fifo_events kernel parameter description
Date: Thu, 22 Oct 2020 11:49:07 +0200
Message-Id: <20201022094907.28560-6-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201022094907.28560-1-jgross@suse.com>
References: <20201022094907.28560-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel boot parameter xen.fifo_events isn't listed in
Documentation/admin-guide/kernel-parameters.txt. Add it.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 02d4adbf98d2..526d65d8573a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5978,6 +5978,13 @@
 			After which time (jiffies) the event handling loop
 			should start to delay EOI handling. Default is 2.
 
+	xen.fifo_events=	[XEN]
+			Boolean parameter to disable using fifo event handling
+			even if available. Normally fifo event handling is
+			preferred over the 2-level event handling, as it is
+			fairer and the number of possible event channels is
+			much higher. Default is on (use fifo events).
+
 	nopv=		[X86,XEN,KVM,HYPER_V,VMWARE]
 			Disables the PV optimizations forcing the guest to run
 			as generic guest with no PV drivers. Currently support
-- 
2.26.2


