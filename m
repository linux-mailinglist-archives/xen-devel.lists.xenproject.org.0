Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A271F3E99
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 16:49:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jifYe-0007Yb-7Z; Tue, 09 Jun 2020 14:48:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QMey=7W=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jifYd-0007YR-3M
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 14:48:55 +0000
X-Inumbo-ID: 56d7a418-aa60-11ea-b32b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56d7a418-aa60-11ea-b32b-12813bfff9fa;
 Tue, 09 Jun 2020 14:48:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CFEC0AD75;
 Tue,  9 Jun 2020 14:48:56 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH for-4.14 0/2] tools: two minor fixes for libxenhypfs
Date: Tue,  9 Jun 2020 16:48:48 +0200
Message-Id: <20200609144850.28619-1-jgross@suse.com>
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
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Two fixes for libxenhypfs:

- xenhypfs terminating with segfault when hypervisor doesn't have
  hypfs support
- wrong error reporting in case for access errors with xenhypfs

Juergen Gross (2):
  tools: fix error path of xenhypfs_open()
  tools: fix setting of errno in xenhypfs_read_raw()

 tools/libs/hypfs/core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

-- 
2.26.2


