Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0AE63DB1E
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 17:55:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450018.707149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0QMb-0002HY-Bl; Wed, 30 Nov 2022 16:55:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450018.707149; Wed, 30 Nov 2022 16:55:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0QMb-0002FN-6X; Wed, 30 Nov 2022 16:55:13 +0000
Received: by outflank-mailman (input) for mailman id 450018;
 Wed, 30 Nov 2022 16:55:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kvFK=36=citrix.com=prvs=3260afb21=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p0QMY-00028d-Ux
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 16:55:10 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be61cc1a-70cf-11ed-91b6-6bf2151ebd3b;
 Wed, 30 Nov 2022 17:55:09 +0100 (CET)
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
X-Inumbo-ID: be61cc1a-70cf-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669827309;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=m3N373zQMCSuoA562ubDzuK9w6uDDTqYPMgngEFce1I=;
  b=fms+vslK6IKOD+vkSNBLLioGfyhTLfrwEvxo1CvEI/Igfp9Ls6mRBysg
   BFEp+i0wA0dK0Erm4Dw0L21L6cIYrmk0oZ8SZsCX41VEDIneOv7jZKJJc
   d7WTL4GfUtoR0XFnl1Ex9m+GsErQGTlxk+b/oCFZUfr2tLCNRvyg1BU+N
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 85447238
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:q9OwQK/7JjS3R8cTsVQoDrUDjX6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 2dMXziFPPiIZzegeY12YYvioUsA6MPWzoViSgdkr3o8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnPKsT5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklw1
 dwgKxpQbyytnqWP0qyDesI1g9YaeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGM0Yn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZUIwhrH/
 DmWl4j/Kk8/b+SG0TGXyGK1h6zdjD/2dK42BaLto5aGh3XMnzdOWXX6T2CTrfCnh2akVtlYK
 khS/TAhxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxO4QfZmcfMpp87pZwHGF0k
 A/S9z/0OdBxmIO1aUqe3OqVkR2rfhEHM1cyTnYBXzJQtrEPv7oPph7IS99iFou8gdv0BSz8z
 li2kcQuu1kApZVVjvvmpDgrlxrp/8GUFVBtum07S0r/tmtEiJiZi5tEALQxxdJJN86nQ1aIp
 xDocODOvblVXflheMFgKdjh/Y1FBd7faFUwYnY1RfHNEghBHFb9Fb28GBkkeC9U3j8sIFcFm
 nP7twJL/4N0N3C3d6JxaI/ZI510k/m/SYq7C66IMoQmjn1NmOmvpnkGiam4hjCFraTRuftnZ
 cfznTiEUh729piLPBLpHrxAgNfHNwg1xH/JRICT8vhU+eP2WZJhcp9caAHmRrlgvMu5TPD9r
 4432z2il08OD4UTo0D/reYuELz9BSFgVMqv9JwKLrfrz8gPMDhJNsI9CIgJI+RN95m5XM+Ul
 p1hcie0EGbCuEA=
IronPort-HdrOrdr: A9a23:y9w/SqAHcX70Ak3lHemd55DYdb4zR+YMi2TDj3oBLSC9Afbo8P
 xG/c5rrSMc5wxwZJhNo7290ey7MBbhHP1OkPIs1NWZLWrbUQKTRekIh7cKgQeQeREWndQz6U
 4USclD4arLY2SS4/yX3ODyKadH/DDOytHQudvj
X-IronPort-AV: E=Sophos;i="5.96,207,1665460800"; 
   d="scan'208";a="85447238"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Edwin Torok
	<edvin.torok@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>
Subject: [PATCH v2 2/6] tools/oxenstored: Bind the DOM_EXC VIRQ in in Event.init()
Date: Wed, 30 Nov 2022 16:54:51 +0000
Message-ID: <20221130165455.31125-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221130165455.31125-1-andrew.cooper3@citrix.com>
References: <20221130165455.31125-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Xenstored always needs to bind the DOM_EXC VIRQ.

Instead of doing it shortly after the call to Event.init(), do it in the
init() call itself.  This removes the need for the field to be a mutable
option.

It will also simplify a future change to restore both parts from the live
update record, rather than re-initialising them from scratch.

Rename the field from virq_port (which could be any VIRQ) to it's proper name.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Torok <edvin.torok@citrix.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>

v2:
 * New.
---
 tools/ocaml/xenstored/event.ml     | 9 ++++++---
 tools/ocaml/xenstored/xenstored.ml | 4 +---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/tools/ocaml/xenstored/event.ml b/tools/ocaml/xenstored/event.ml
index ccca90b6fc4f..a3be296374ff 100644
--- a/tools/ocaml/xenstored/event.ml
+++ b/tools/ocaml/xenstored/event.ml
@@ -17,12 +17,15 @@
 (**************** high level binding ****************)
 type t = {
 	handle: Xeneventchn.handle;
-	mutable virq_port: Xeneventchn.t option;
+	domexc: Xeneventchn.t;
 }
 
-let init () = { handle = Xeneventchn.init (); virq_port = None; }
+let init () =
+	let handle = Xeneventchn.init () in
+	let domexc = Xeneventchn.bind_dom_exc_virq handle in
+	{ handle; domexc }
+
 let fd eventchn = Xeneventchn.fd eventchn.handle
-let bind_dom_exc_virq eventchn = eventchn.virq_port <- Some (Xeneventchn.bind_dom_exc_virq eventchn.handle)
 let bind_interdomain eventchn domid port = Xeneventchn.bind_interdomain eventchn.handle domid port
 let unbind eventchn port = Xeneventchn.unbind eventchn.handle port
 let notify eventchn port = Xeneventchn.notify eventchn.handle port
diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index c5dc7a28d082..55071b49eccb 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -397,7 +397,6 @@ let _ =
 	if cf.restart && Sys.file_exists Disk.xs_daemon_database then (
 		let rwro = DB.from_file store domains cons Disk.xs_daemon_database in
 		info "Live reload: database loaded";
-		Event.bind_dom_exc_virq eventchn;
 		Process.LiveUpdate.completed ();
 		rwro
 	) else (
@@ -413,7 +412,6 @@ let _ =
 
 		if cf.domain_init then (
 			Connections.add_domain cons (Domains.create0 domains);
-			Event.bind_dom_exc_virq eventchn
 		);
 		rw_sock
 	) in
@@ -451,7 +449,7 @@ let _ =
 			let port = Event.pending eventchn in
 			debug "pending port %d" (Xeneventchn.to_int port);
 			finally (fun () ->
-				if Some port = eventchn.Event.virq_port then (
+				if port = eventchn.Event.domexc then (
 					let (notify, deaddom) = Domains.cleanup domains in
 					List.iter (Store.reset_permissions store) deaddom;
 					List.iter (Connections.del_domain cons) deaddom;
-- 
2.11.0


