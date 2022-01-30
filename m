Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FB84A387F
	for <lists+xen-devel@lfdr.de>; Sun, 30 Jan 2022 20:23:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262547.454793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEFnB-0005dV-GX; Sun, 30 Jan 2022 19:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262547.454793; Sun, 30 Jan 2022 19:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEFnB-0005aZ-DI; Sun, 30 Jan 2022 19:23:17 +0000
Received: by outflank-mailman (input) for mailman id 262547;
 Sun, 30 Jan 2022 19:23:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QEBh=SO=infradead.org=rdunlap@srs-se1.protection.inumbo.net>)
 id 1nEFnA-0005aR-F2
 for xen-devel@lists.xenproject.org; Sun, 30 Jan 2022 19:23:16 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10e8e1f6-8202-11ec-8f75-fffcc8bd4f1a;
 Sun, 30 Jan 2022 20:23:13 +0100 (CET)
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEFn0-007IEV-FQ; Sun, 30 Jan 2022 19:23:06 +0000
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
X-Inumbo-ID: 10e8e1f6-8202-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=6JCRszUXCuHkWzFCeUDmfWFeE8dA8Y++bCAg/sv5fgM=; b=QA0Eo4Vc8aruhtBHUOjuqPrwd9
	N9UKhLv8lJCOxIPI8/XYa4azFIF0ccqJ8PV83rSxGf+WUK8JrY2VrTNRFljCG/ncr1PGmehq6SRuB
	VSvuFR7bFdXFhXcT2f786K7OLItdnLtbmOYy9PxB0bS54iHsaPGNnYy6sFa2ThSI+IrhX7LodlKTO
	wqe4lSBCWZ7GLn8jE2o/+IiLZG720SaxWVHsT6iNg1fOtlPX33IaKztWlrOFlEWOTsx7FoTJFpRJu
	XrZJiYiyztcrdhgVhpg6JdKmE29dH9JyOY0GUWeBtueRGA7ezWspIzs0CZgfkelGkOdBbsRvdkfZe
	0m9Ti9eQ==;
From: Randy Dunlap <rdunlap@infradead.org>
To: patches@lists.linux.dev
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH] xen: update missing ioctl magic numers documentation
Date: Sun, 30 Jan 2022 11:23:05 -0800
Message-Id: <20220130192305.14523-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing ioctl "magic numbers" for various Xen interfaces
(xenbus_dev.h, gntalloc.h, gntdev.h, and privcmd.h).

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
---
 Documentation/userspace-api/ioctl/ioctl-number.rst |    3 +++
 1 file changed, 3 insertions(+)

--- linux-next-20220128.orig/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ linux-next-20220128/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -115,6 +115,7 @@ Code  Seq#    Include File
 'B'   00-1F  linux/cciss_ioctl.h                                     conflict!
 'B'   00-0F  include/linux/pmu.h                                     conflict!
 'B'   C0-FF  advanced bbus                                           <mailto:maassen@uni-freiburg.de>
+'B'   00-0F  xen/xenbus_dev.h                                        conflict!
 'C'   all    linux/soundcard.h                                       conflict!
 'C'   01-2F  linux/capi.h                                            conflict!
 'C'   F0-FF  drivers/net/wan/cosa.h                                  conflict!
@@ -134,6 +135,7 @@ Code  Seq#    Include File
 'F'   80-8F  linux/arcfb.h                                           conflict!
 'F'   DD     video/sstfb.h                                           conflict!
 'G'   00-3F  drivers/misc/sgi-gru/grulib.h                           conflict!
+'E'   00-0F  xen/gntalloc.h, xen/gntdev.h                            conflict!
 'H'   00-7F  linux/hiddev.h                                          conflict!
 'H'   00-0F  linux/hidraw.h                                          conflict!
 'H'   01     linux/mei.h                                             conflict!
@@ -176,6 +178,7 @@ Code  Seq#    Include File
 'P'   60-6F  sound/sscape_ioctl.h                                    conflict!
 'P'   00-0F  drivers/usb/class/usblp.c                               conflict!
 'P'   01-09  drivers/misc/pci_endpoint_test.c                        conflict!
+'P'   00-0F  xen/privcmd.h                                           conflict!
 'Q'   all    linux/soundcard.h
 'R'   00-1F  linux/random.h                                          conflict!
 'R'   01     linux/rfkill.h                                          conflict!

