Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 131D442B9A4
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 09:52:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208009.364030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maZ3h-0001HZ-AJ; Wed, 13 Oct 2021 07:52:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208009.364030; Wed, 13 Oct 2021 07:52:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maZ3h-0001FC-68; Wed, 13 Oct 2021 07:52:17 +0000
Received: by outflank-mailman (input) for mailman id 208009;
 Wed, 13 Oct 2021 07:52:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=quvz=PB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1maZ3f-0001Eb-TX
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 07:52:15 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7aa30fdc-2bfa-11ec-8160-12813bfff9fa;
 Wed, 13 Oct 2021 07:52:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E5C88222C1;
 Wed, 13 Oct 2021 07:52:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BD79513E64;
 Wed, 13 Oct 2021 07:52:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8HwkLS2QZmEjfwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 13 Oct 2021 07:52:13 +0000
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
X-Inumbo-ID: 7aa30fdc-2bfa-11ec-8160-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634111533; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=po+hf+FNagQm6i1f8al0BNtylY1+PBG7DwkLS/oaAWs=;
	b=mddxD0CD/4UuclYtMsHxMsipqzzcIolby96n8sagPPPa1soKyWpYO0BVx1ufBskC7UUWWc
	4Th5pE9aLhfLjHDvK/lfrBXTpRp6qbLqyy5nRdScdU7wBrJCDej3KGBDE5M7YSxrbLkkAd
	ZjJQdUQyjRC3VV/+Avt8b7V+T8FugGY=
From: Juergen Gross <jgross@suse.com>
To: linux-usb@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Konrad Rzeszutek Wilk <Konrad.wilk@oracle.com>
Subject: [PATCH v6 3/3] xen: add Xen pvUSB maintainer
Date: Wed, 13 Oct 2021 09:52:07 +0200
Message-Id: <20211013075207.13910-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211013075207.13910-1-jgross@suse.com>
References: <20211013075207.13910-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add myself as maintainer for the Xen pvUSB stuff.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Konrad Rzeszutek Wilk <Konrad.wilk@oracle.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e0bca0de0df7..7c211195be7e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20535,6 +20535,14 @@ F:	drivers/scsi/xen-scsifront.c
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


