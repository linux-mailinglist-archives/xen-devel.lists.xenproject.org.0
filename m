Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5070ABC82D
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 22:12:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990253.1374214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH6qh-0001lx-2O; Mon, 19 May 2025 20:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990253.1374214; Mon, 19 May 2025 20:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH6qg-0001jJ-VS; Mon, 19 May 2025 20:12:34 +0000
Received: by outflank-mailman (input) for mailman id 990253;
 Mon, 19 May 2025 20:12:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wD6k=YD=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uH6qf-0001j7-QL
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 20:12:33 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 989019db-34ed-11f0-a2fa-13f23c93f187;
 Mon, 19 May 2025 22:12:32 +0200 (CEST)
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
X-Inumbo-ID: 989019db-34ed-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747685550; x=1747944750;
	bh=E9iBDYrfKj31LI0uBbyEOTVIbFv75/GYvzBsSvZRX6M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=W4aXddIKmLxBxELdx09Z2dBeF7rH0rw2NXlcL9s4ggfuIh8DPqEXlkXltpF4faT78
	 /K6f2Yo08fnd0EfM9tUg20+XdcJnZ6f6gKbQOksDRfQG7khfNDGVnGtXmOUpqnJHrS
	 sxU3/XtGOMn4FjVKV3f4DobqWPZ2wsxrlbjfPtyyoI8Bw1vaagkTvCFdlPIWl7fkAm
	 u0qQ5tHxtJ3ms37MEYeefnLiK4nUKcKHoiJlkjqNpXhTdMyOnRqYL0rWXcyTaBgDJz
	 hG5/lJJQFA2cT9sCgrugsfxQ4odmaURi8a7Apue8uBCdG2fwXkW5rB1axIilXkcJa8
	 nHBYqMAUv4uBw==
Date: Mon, 19 May 2025 20:12:27 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3 1/5] xen/console: rename switch_serial_input() to console_switch_input()
Message-ID: <20250519201211.1366244-2-dmukhin@ford.com>
In-Reply-To: <20250519201211.1366244-1-dmukhin@ford.com>
References: <20250519201211.1366244-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 2c7c174c17b8e55ae7bf60ddc31c94b0ac5dabf3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Update the function name as per naming notation in the console driver.

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v2:
- rebased
- Link to v2: https://lore.kernel.org/xen-devel/20250331230508.440198-5-dmu=
khin@ford.com/
---
 xen/drivers/char/console.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index c3150fbdb7..c8dde38376 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -487,7 +487,7 @@ void console_put_domain(struct domain *d)
         rcu_unlock_domain(d);
 }
=20
-static void switch_serial_input(void)
+static void console_switch_input(void)
 {
     unsigned int next_rx =3D console_rx;
=20
@@ -581,7 +581,7 @@ static void cf_check serial_rx(char c)
         /* We eat CTRL-<switch_char> in groups of 3 to switch console inpu=
t. */
         if ( ++switch_code_count =3D=3D 3 )
         {
-            switch_serial_input();
+            console_switch_input();
             switch_code_count =3D 0;
         }
         return;
@@ -1125,7 +1125,7 @@ void __init console_endboot(void)
                             "toggle host/guest log level adjustment", 0);
=20
     /* Serial input is directed to DOM0 by default. */
-    switch_serial_input();
+    console_switch_input();
 }
=20
 int __init console_has(const char *device)
--=20
2.34.1



