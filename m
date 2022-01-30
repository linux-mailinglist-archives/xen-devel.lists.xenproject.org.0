Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 239C74A387C
	for <lists+xen-devel@lfdr.de>; Sun, 30 Jan 2022 20:17:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262531.454770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEFhQ-0003eM-JI; Sun, 30 Jan 2022 19:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262531.454770; Sun, 30 Jan 2022 19:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEFhQ-0003cT-GA; Sun, 30 Jan 2022 19:17:20 +0000
Received: by outflank-mailman (input) for mailman id 262531;
 Sun, 30 Jan 2022 19:17:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QEBh=SO=infradead.org=rdunlap@srs-se1.protection.inumbo.net>)
 id 1nEFhN-0003cN-Lw
 for xen-devel@lists.xenproject.org; Sun, 30 Jan 2022 19:17:18 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a44b9ca-8201-11ec-8eb8-a37418f5ba1a;
 Sun, 30 Jan 2022 20:17:15 +0100 (CET)
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEFhC-007HdB-F2; Sun, 30 Jan 2022 19:17:06 +0000
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
X-Inumbo-ID: 3a44b9ca-8201-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=A0VUqk6Uu5zpKHFm4isWfDeVPU3lINMy6Ho5GR6DJdw=; b=i/4aEZchvtYzjU2kwjtDdKrwls
	9/M/wbAS7k80Ku48OZQJlOoTemmWe1UIxt3/Khs4kn32EtYTol/p/qbPEwruwuKgTI+N79dfHVnTx
	bv3ANkHol4cq6LYBzyCqthQ3KyPo5zG+m6HN1GwrtYrWLi0n0WJTQ786XoTkzgVSt3OK7+o0bw++l
	/4JjdPftggSokWefTIJstam8BONF8bpzv4JRXIvd9bqvtbmbjK82mt/4T761qC3n5LjQ/zMp77IXr
	JJ8bkx52sYBdGKjh0SPiq4PhZVCgRKJr9Mo94GE3uhL0DC/GOx7pUVV7f7qUOLxSua6LrNxpXQ3YL
	TQnbfj1A==;
From: Randy Dunlap <rdunlap@infradead.org>
To: patches@lists.linux.dev
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH] xen: xenbus_dev.h: delete incorrect file name
Date: Sun, 30 Jan 2022 11:17:05 -0800
Message-Id: <20220130191705.24971-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is better/preferred not to include file names in source files
because (a) they are not needed and (b) they can be incorrect,
so just delete this incorrect file name.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
---
 include/xen/xenbus_dev.h |    1 -
 1 file changed, 1 deletion(-)

--- linux-next-20220128.orig/include/xen/xenbus_dev.h
+++ linux-next-20220128/include/xen/xenbus_dev.h
@@ -1,5 +1,4 @@
 /******************************************************************************
- * evtchn.h
  *
  * Interface to /dev/xen/xenbus_backend.
  *

