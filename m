Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E2645A3A8
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 14:21:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229581.397007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpVjD-0002qU-C9; Tue, 23 Nov 2021 13:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229581.397007; Tue, 23 Nov 2021 13:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpVjD-0002nq-8L; Tue, 23 Nov 2021 13:20:55 +0000
Received: by outflank-mailman (input) for mailman id 229581;
 Tue, 23 Nov 2021 13:20:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yj1i=QK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mpVjB-0002Xw-Cx
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 13:20:53 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e06a899-4c60-11ec-a9d2-d9f7a1cc8784;
 Tue, 23 Nov 2021 14:20:51 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4E28321954;
 Tue, 23 Nov 2021 13:20:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2401413E08;
 Tue, 23 Nov 2021 13:20:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8J6vB7PqnGH9CgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 23 Nov 2021 13:20:51 +0000
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
X-Inumbo-ID: 2e06a899-4c60-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1637673651; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ydq29op3Uut8kGUc+uMZHwfZgLUyDFkJcJa0BA/hp2o=;
	b=aE2lIQcvn8yWSfbm78fERFlbWdgumlWSpB0YoGZ7L/CIcN/LI4T9kEzzbVgNcrqrqvpWZx
	w1nQqngyJ2tp7D8IOWuMF6PnxBMO4Q66+jAZhkS673UjP59gjXs0HGzPMrHRHQc9dfy6IP
	rxr/pcv+pVL9A9WYShqOMfI28e3/hNU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Konrad Rzeszutek Wilk <Konrad.wilk@oracle.com>
Subject: [PATCH v7 3/3] xen: add Xen pvUSB maintainer
Date: Tue, 23 Nov 2021 14:20:48 +0100
Message-Id: <20211123132048.5335-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211123132048.5335-1-jgross@suse.com>
References: <20211123132048.5335-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add myself as maintainer for the Xen pvUSB stuff.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Konrad Rzeszutek Wilk <Konrad.wilk@oracle.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5250298d2817..da7fd3d32dc4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20831,6 +20831,14 @@ F:	drivers/scsi/xen-scsifront.c
 F:	drivers/xen/xen-scsiback.c
 F:	include/xen/interface/io/vscsiif.h
 
+XEN PVUSB DRIVER
+M:	Juergen Gross <jgross@suse.com>
+L:	xen-devel@lists.xenproject.org (moderated for non-subscribers)
+L:	linux-usb@vger.kernel.org
+S:	Supported
+F:	divers/usb/host/xen*
+F:	include/xen/interface/io/usbif.h
+
 XEN SOUND FRONTEND DRIVER
 M:	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
 L:	xen-devel@lists.xenproject.org (moderated for non-subscribers)
-- 
2.26.2


