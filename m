Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA6763DB1B
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 17:55:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450016.707127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0QMW-0001jq-Lq; Wed, 30 Nov 2022 16:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450016.707127; Wed, 30 Nov 2022 16:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0QMW-0001hH-Iw; Wed, 30 Nov 2022 16:55:08 +0000
Received: by outflank-mailman (input) for mailman id 450016;
 Wed, 30 Nov 2022 16:55:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kvFK=36=citrix.com=prvs=3260afb21=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p0QMU-0001h8-VT
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 16:55:07 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb6406d4-70cf-11ed-8fd2-01056ac49cbb;
 Wed, 30 Nov 2022 17:55:05 +0100 (CET)
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
X-Inumbo-ID: bb6406d4-70cf-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669827304;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=z/izcCZYLALenFQZc+ciAhdGz2w/UXtld5npiWlVuFM=;
  b=Is2DDria1i3/f5QVBpl0lXRZsUP1aLpd3ze/2RYCWwu2cS5uykoC81sl
   wR4+5CKW+jvuz1+aRUKxJ/AYS/ySvVxZ+Dx0rUxdeL+nwjfvx3vk1/Toi
   6F+b7q89NvC/uRBjWkKKlBrTbkfrMbYuo4r26F4YEfUylzs06Yebwo3jq
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 85899572
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rw8Izay4JRXhP7MlDNZ6t+c6xirEfRIJ4+MujC+fZmUNrF6WrkUOz
 2MfWGCDOfaINmbwLdEjaYvg9h8Fu8WBzIIxTgo/pCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVnPqgT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KU9s9
 80aIShcVTGotse4/6+/b9BNr/12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKQOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiFZgFzxfF+
 TiuE2LRHQ4nKN2SmTW/ryi8g/3kjCHYCaE4LejtnhJtqALKnTFCYPEMbnO3qOe0olSzUNVeL
 woT4CVGhbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6k6nMsF2AbLoZ87YlvGGJsh
 gThc87V6SJHnp+XeHCU7uavjBiDHCYqMGsnXA4tdF5QizX8m70bghXKR9dlNae6iNzpBD39q
 wy3QDgCa6Y71pBSifjilbzTq3f1/8WSEFZpjunCdjj9hj6VcrJJcGBBBbLzyf9bZLiUQVCa1
 JTvs5jPtbteZX1hecHkfQnsIF1Lz6zdWNE/qQQ1d3XEy9hK0yDLQGyoyGsiTHqFy+5dEdMTX
 GfduBlK+LhYN2awYKl8buqZUpp0nPe8S4q4CKyIMLKih6SdkifdpEmCgmbJjwjQfLUEy/lja
 f93j+7zZZrlNUiX5GXvHLpMuVPa7is/2XnSVfjGI+ePiNKjiIquYe5dajOmN7lphJ5oVS2Jq
 76zwePWkUQAOAA/CwGLmbMuwacidCNqX8mp+5EPL4Zu4GNOQQkcNhMY+pt5E6QNokifvrqgE
 q2VMqOA9GfCuA==
IronPort-HdrOrdr: A9a23:oRJkH6y0SElKDWwFRqXxKrPwLL1zdoMgy1knxilNoRw8SKOlfq
 GV7ZImPHDP6Qr5NEtMpTnEAtjjfZq+z+8T3WByB9eftWDd0QPCRr2Kr7GSpgEIcxeOktK1vp
 0PT0ERMrHN5CBB/KXH3DU=
X-IronPort-AV: E=Sophos;i="5.96,207,1665460800"; 
   d="scan'208";a="85899572"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Edwin Torok
	<edvin.torok@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>
Subject: [PATCH v2 1/6] tools/oxenstored: Style fixes to Domain
Date: Wed, 30 Nov 2022 16:54:50 +0000
Message-ID: <20221130165455.31125-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221130165455.31125-1-andrew.cooper3@citrix.com>
References: <20221130165455.31125-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

This file has some style problems so severe that they interfere with the
readability of the subsequent bugfix patches.

Fix these issues ahead of time, to make the subsequent changes more readable.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Torok <edvin.torok@citrix.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>

v2:
 * New
---
 tools/ocaml/xenstored/domain.ml | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/tools/ocaml/xenstored/domain.ml b/tools/ocaml/xenstored/domain.ml
index 81cb59b8f1a2..ab08dcf37f62 100644
--- a/tools/ocaml/xenstored/domain.ml
+++ b/tools/ocaml/xenstored/domain.ml
@@ -57,17 +57,16 @@ let is_paused_for_conflict dom = dom.conflict_credit <= 0.0
 let is_free_to_conflict = is_dom0
 
 let string_of_port = function
-| None -> "None"
-| Some x -> string_of_int (Xeneventchn.to_int x)
+	| None -> "None"
+	| Some x -> string_of_int (Xeneventchn.to_int x)
 
 let dump d chan =
 	fprintf chan "dom,%d,%nd,%d\n" d.id d.mfn d.remote_port
 
-let notify dom = match dom.port with
-| None ->
-	warn "domain %d: attempt to notify on unknown port" dom.id
-| Some port ->
-	Event.notify dom.eventchn port
+let notify dom =
+	match dom.port with
+	| None -> warn "domain %d: attempt to notify on unknown port" dom.id
+	| Some port -> Event.notify dom.eventchn port
 
 let bind_interdomain dom =
 	begin match dom.port with
@@ -84,8 +83,7 @@ let close dom =
 	| None -> ()
 	| Some port -> Event.unbind dom.eventchn port
 	end;
-	Xenmmap.unmap dom.interface;
-	()
+	Xenmmap.unmap dom.interface
 
 let make id mfn remote_port interface eventchn = {
 	id = id;
-- 
2.11.0


