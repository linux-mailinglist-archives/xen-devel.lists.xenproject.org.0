Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D46210AE4
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 14:17:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqbfP-00058g-Lm; Wed, 01 Jul 2020 12:16:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T2yc=AM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jqbfO-00058b-DD
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 12:16:42 +0000
X-Inumbo-ID: b8857786-bb94-11ea-8701-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b8857786-bb94-11ea-8701-12813bfff9fa;
 Wed, 01 Jul 2020 12:16:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0E133ADE0;
 Wed,  1 Jul 2020 12:16:41 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com
Subject: [PATCH v2 0/2] xen/xenbus: some cleanups
Date: Wed,  1 Jul 2020 14:16:36 +0200
Message-Id: <20200701121638.19840-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Avoid allocating large amount of data on the stack in
xenbus_map_ring_valloc() and some related return value cleanups.

Juergen Gross (2):
  xen/xenbus: avoid large structs and arrays on the stack
  xen/xenbus: let xenbus_map_ring_valloc() return errno values only

 drivers/xen/xenbus/xenbus_client.c | 167 ++++++++++++++---------------
 1 file changed, 81 insertions(+), 86 deletions(-)

-- 
2.26.2


