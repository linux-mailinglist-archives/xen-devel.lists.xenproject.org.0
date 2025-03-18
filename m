Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B51D2A680C6
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 00:37:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919886.1324229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tugUE-0004GB-9W; Tue, 18 Mar 2025 23:36:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919886.1324229; Tue, 18 Mar 2025 23:36:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tugUE-0004DT-5N; Tue, 18 Mar 2025 23:36:42 +0000
Received: by outflank-mailman (input) for mailman id 919886;
 Tue, 18 Mar 2025 23:36:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6oY5=WF=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tugUC-0003zY-M0
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 23:36:40 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d72418e2-0451-11f0-9abc-95dc52dad729;
 Wed, 19 Mar 2025 00:36:40 +0100 (CET)
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
X-Inumbo-ID: d72418e2-0451-11f0-9abc-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742340998; x=1742600198;
	bh=QtdLXYxNwzbKQmZe/6N+UHeOHnwW7yUtlmw52BzQ2+Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=iau+V0ryMHpEWMABNwtTh4Jyv7bidE5fCdIKIGjB6m2DFyBT7BctXQaCa3w08/pw7
	 NozMugX8QQsXzUSNz23k9kjxOYVt6OKE1CuIQscDSN6E1IRsS9+jGidgErLuY5Cl7q
	 O+N7ecgnc9b5wcWwWSHXLwhBktUcB/MDcxDeULlTKjs/L9XmyK2ibjlIEyjal2Q48M
	 uvSupxnbuHZB61yP3vb9uc43l+p6RdMO8D7LIGXblrCWZcMvswTm6p9BpJrHV8TsTl
	 Sx/t3saCZK5cYONg2PQu8ZRapMRxT6QmKjoSwdZsz57p3bQTTt5aapHaLgFIizy0NW
	 kJyrA+TQIzBiw==
Date: Tue, 18 Mar 2025 23:36:34 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 1/8] xen/console: fix trailing whitespaces
Message-ID: <20250318233617.849903-2-dmukhin@ford.com>
In-Reply-To: <20250318233617.849903-1-dmukhin@ford.com>
References: <20250318233617.849903-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: ea03fa4e2f7a43ce4ce55988ca7f5e32dfdf1a42
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Remove trailing whitespaces in the console driver.

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/console.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index ba428199d2..c3150fbdb7 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -1,8 +1,8 @@
 /*************************************************************************=
*****
  * console.c
- *=20
+ *
  * Emergency console I/O for Xen and the domain-0 guest OS.
- *=20
+ *
  * Copyright (c) 2002-2004, K A Fraser.
  *
  * Added printf_ratelimit
@@ -811,7 +811,7 @@ static int printk_prefix_check(char *p, char **pp)
     return ((atomic_read(&print_everything) !=3D 0) ||
             (loglvl < lower_thresh) ||
             ((loglvl < upper_thresh) && printk_ratelimit()));
-}=20
+}
=20
 static int cf_check parse_console_timestamps(const char *s)
 {
--=20
2.34.1



