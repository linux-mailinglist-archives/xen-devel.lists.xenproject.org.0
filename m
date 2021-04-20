Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10360365A8D
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 15:49:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113713.216697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYqkZ-0006q3-VU; Tue, 20 Apr 2021 13:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113713.216697; Tue, 20 Apr 2021 13:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYqkZ-0006pf-SO; Tue, 20 Apr 2021 13:49:11 +0000
Received: by outflank-mailman (input) for mailman id 113713;
 Tue, 20 Apr 2021 13:49:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lYqkY-0006pY-HU
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 13:49:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYqkX-0001yX-Ea; Tue, 20 Apr 2021 13:49:09 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYqkX-0003sG-3j; Tue, 20 Apr 2021 13:49:09 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=UMfFUcXT9PoQDQURdoKJRKEJgWnC85ePJlkRv0ojMaI=; b=Kij/ZwsYxB8MdGldcHsX9ROvPr
	1fz0fCsSDO1xEy6rU/wkXwN27VzJl9OMuMViMoIBxYNQSr3himd/h5lRuNYfnb8gzMlQmSZrgR6b7
	hs3CCl1C7A7rjcYSTL0LTDEeS4kGdOXl2frvOAJ/TCn/o4+YmohXadt+HytcgAHmUmQ4=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/xenstored: Remove unused prototype
Date: Tue, 20 Apr 2021 14:49:06 +0100
Message-Id: <20210420134906.10910-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

A prototype for dump_conn() has been present for quite a long time
but there are no implementation. Even, AFAICT in the patch that
introduced it. So drop it.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index d54a6042a9f7..591b28e4552f 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2085,7 +2085,6 @@ static struct option options[] = {
 #endif
 	{ NULL, 0, NULL, 0 } };
 
-extern void dump_conn(struct connection *conn); 
 int dom0_domid = 0;
 int dom0_event = 0;
 int priv_domid = 0;
-- 
2.17.1


