Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CACCAAC74D1
	for <lists+xen-devel@lfdr.de>; Thu, 29 May 2025 02:09:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999641.1380301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKQq8-0002mj-Lx; Thu, 29 May 2025 00:09:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999641.1380301; Thu, 29 May 2025 00:09:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKQq8-0002kp-Hq; Thu, 29 May 2025 00:09:44 +0000
Received: by outflank-mailman (input) for mailman id 999641;
 Thu, 29 May 2025 00:09:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VQJb=YN=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uKQq7-0001DA-3I
 for xen-devel@lists.xenproject.org; Thu, 29 May 2025 00:09:43 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37f7b94e-3c21-11f0-a2fe-13f23c93f187;
 Thu, 29 May 2025 02:09:42 +0200 (CEST)
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
X-Inumbo-ID: 37f7b94e-3c21-11f0-a2fe-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ghqaxxcv45cl7fyiznlbczu2yy.protonmail; t=1748477380; x=1748736580;
	bh=JV3YAPhRyMLPMXyY36U8GAXKlkqRXgyfF9gHz3Sj7r8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=JkdCKkwAap68hjfQUGsajp7vqjGabcQCW2ufFZX7tEvrwejogKRPzad3cJp2viM3o
	 g4Jbv1wTU9sxneHrALz9Xwwx1VCp6MXLoy6s9BSUhCiqLNN1etiOdi+ZEzlNNQlEvb
	 Rv6aeDf+J7/t26GU1vuSpwldKI+TjXK2Y9VQ1HaU9hbWusTmFgR1iBda8fbvd0o4Dn
	 724PuqWNQindRpgHrEddrTexKhNVPOK360GIgS4Gn3O/uFa4emeMfOC8r/NYttLbLK
	 IkM5aAaHQ3ImPvSFBIVMZ8zmAKwg3KRHmIV7JMj2GjNioKJan1+vi5+WkHCTpnT7ws
	 XamyBnW1T0sng==
Date: Thu, 29 May 2025 00:09:34 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, Denis Mukhin <dmkhn@proton.me>
Subject: [PATCH v4 4/4] xen/console: rename console_rx to console_domid
Message-ID: <20250529000848.2675903-5-dmukhin@ford.com>
In-Reply-To: <20250529000848.2675903-1-dmukhin@ford.com>
References: <20250529000848.2675903-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: a91093b0d86f4203b791c35811867f46e38c951d
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmkhn@proton.me>

From: Denis Mukhin <dmukhin@ford.com>

Update the symbol name to match the code better.

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v3:
- rebased
---
 xen/drivers/char/console.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 37289d5558..5797f29d31 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -503,11 +503,11 @@ static void cf_check conring_dump_keyhandler(unsigned=
 char key)
 #define switch_code (opt_conswitch[0]-'a'+1)
=20
 /* Console owner domain identifier. */
-static domid_t __read_mostly console_rx =3D DOMID_XEN;
+static domid_t __read_mostly console_domid =3D DOMID_XEN;
=20
 struct domain *console_get_domain(void)
 {
-    struct domain *d =3D rcu_lock_domain_by_id(console_rx);
+    struct domain *d =3D rcu_lock_domain_by_id(console_domid);
=20
     if ( !d )
         return NULL;
@@ -533,7 +533,7 @@ static void console_set_domid(domid_t domid)
     else
         printk("*** Serial input to DOM%u", domid);
=20
-    console_rx =3D domid;
+    console_domid =3D domid;
=20
     if ( switch_code )
         printk(" (type 'CTRL-%c' three times to switch input)",
@@ -549,10 +549,10 @@ static void console_switch_input(void)
 {
     domid_t hint;
=20
-    if ( console_rx =3D=3D DOMID_XEN )
+    if ( console_domid =3D=3D DOMID_XEN )
         hint =3D get_initial_domain_id();
     else
-        hint =3D console_rx + 1;
+        hint =3D console_domid + 1;
=20
     hint =3D domid_find_with_input_allowed(hint);
=20
@@ -564,7 +564,7 @@ static void __serial_rx(char c)
     struct domain *d;
     int rc =3D 0;
=20
-    if ( console_rx =3D=3D DOMID_XEN )
+    if ( console_domid =3D=3D DOMID_XEN )
         return handle_keypress(c, false);
=20
     d =3D console_get_domain();
--=20
2.34.1



