Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EDC63DB19
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 17:55:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450021.707170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0QMc-0002gS-SF; Wed, 30 Nov 2022 16:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450021.707170; Wed, 30 Nov 2022 16:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0QMc-0002Vl-Jo; Wed, 30 Nov 2022 16:55:14 +0000
Received: by outflank-mailman (input) for mailman id 450021;
 Wed, 30 Nov 2022 16:55:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kvFK=36=citrix.com=prvs=3260afb21=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p0QMa-00028d-Mr
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 16:55:12 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c03f4542-70cf-11ed-91b6-6bf2151ebd3b;
 Wed, 30 Nov 2022 17:55:10 +0100 (CET)
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
X-Inumbo-ID: c03f4542-70cf-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669827310;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=5iFdPLx5Ne+VS5VelIwx4FrDJLK/XUFQknR4+A17ij0=;
  b=YqGvEO7i6oa3ke2P3GX4m7jo/8fokxWZxbtK/AFGJQbTa+d7qYULTwda
   eVzsOn7RkHAL226qlXwS1OAacL7yx/OuP5txnMgRdQ5AXpu0zzyaepwSN
   hAR+y5iVFpKMe0A2xj1LCmX/xmHCzmk95SYpwKe4uQqboCiu5W3yf7jJ7
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 85447248
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:U5sKI62u7wZwXFuKhvbD5d5xkn2cJEfYwER7XKvMYLTBsI5bpzUFm
 GEaWTiGO/fZZDSnLYskaonn9xwE6JHTmNZqGgJlpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wVlPagQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfAnlV1
 qEZAS80aBXS3bmPwI2lYdl2v5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKkSbC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TaGJkJwRzE9
 goq+UzyHDNDFuHB4wCH43mTmsnskSH6B9I7QejQGvlC3wTImz175ActfVeyv/SRkEO1XNNbb
 UsO9UIGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbizt1HUBdEGQHMoZ/8pZrG3p6j
 Tdlgu8FGxRsqKa2FHO06Y6SqGLoYhEVEnEpVTU9GF5tD8bYnKk/iRfGT9BGGaGzj8HoFTyY/
 w1mvBTSlJ1I05dVivzTEUTvxmv1+8OXFlJdChD/BDrN0+9vWGKyi2VEA3D/5O0IEouWR0LpU
 JMsy5nHt7Bm4X1geUWwrAQx8FOBva7t3N702wQH83wdG9OFpRaekXh4um0WGauQGp9slcXVS
 EHSoxhNw5RYIWGna6R6C6roVZp7kvS+S4m7CqyKBjarXnSXXFXflM2JTRfAt10BbWB2yf1vU
 XtlWZnE4Ykm5VRPk2PtGrZ1PU4DzSEi32LDLa0XPDz+uYdykEW9EO9fWHPXN7BR0U9xiFmNm
 zqpH5fQmko3vSyXSnW/zLP/2nhTdilhXM+m9pQOHgNBSyI/cFwc5zbq6etJU+RYc259z48kI
 lnVtpdk9WfC
IronPort-HdrOrdr: A9a23:B5XRNaO4lEXGs8BcTvCjsMiBIKoaSvp037By7TEUdfUnSL3+qy
 nOpoVi6faaslYssR0b9OxofZPwJE80lqQFmrX5X43SPzUO0VHAROoJ0WKh+UyDJ8SUzIFgPN
 JbEpSWf+efMbEVt6rHCUKDYrAdKZG8gdmVuds=
X-IronPort-AV: E=Sophos;i="5.96,207,1665460800"; 
   d="scan'208";a="85447248"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Edwin Torok
	<edvin.torok@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>
Subject: [PATCH v2 4/6] tools/oxenstored: Implement Domain.rebind_evtchn
Date: Wed, 30 Nov 2022 16:54:53 +0000
Message-ID: <20221130165455.31125-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221130165455.31125-1-andrew.cooper3@citrix.com>
References: <20221130165455.31125-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Generally speaking, the event channel local/remote port is fixed for the
lifetime of the associated domain object.  The exception to this is a
secondary XS_INTRODUCE (defined to re-bind to a new event channel) which pokes
around at the domain object's internal state.

We need to refactor the evtchn handling to support live update, so start by
moving the relevant manipulation into Domain.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Torok <edvin.torok@citrix.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>

Note: This change deliberately doesn't reuse Domain.bind_interdomain, which is
removed by the end of the refactoring.

v2:
 * New.
---
 tools/ocaml/xenstored/domain.ml  | 12 ++++++++++++
 tools/ocaml/xenstored/process.ml |  6 ++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/tools/ocaml/xenstored/domain.ml b/tools/ocaml/xenstored/domain.ml
index ab08dcf37f62..d59a9401e211 100644
--- a/tools/ocaml/xenstored/domain.ml
+++ b/tools/ocaml/xenstored/domain.ml
@@ -63,6 +63,18 @@ let string_of_port = function
 let dump d chan =
 	fprintf chan "dom,%d,%nd,%d\n" d.id d.mfn d.remote_port
 
+let rebind_evtchn d remote_port =
+	begin match d.port with
+	| None -> ()
+	| Some p -> Event.unbind d.eventchn p
+	end;
+	let local = Event.bind_interdomain d.eventchn d.id remote_port in
+	debug "domain %d rebind (l %s, r %d) => (l %d, r %d)"
+	      d.id (string_of_port d.port) d.remote_port
+	      (Xeneventchn.to_int local) remote_port;
+	d.remote_port <- remote_port;
+	d.port <- Some (local)
+
 let notify dom =
 	match dom.port with
 	| None -> warn "domain %d: attempt to notify on unknown port" dom.id
diff --git a/tools/ocaml/xenstored/process.ml b/tools/ocaml/xenstored/process.ml
index b2973aca2a82..2ea940d7e2d5 100644
--- a/tools/ocaml/xenstored/process.ml
+++ b/tools/ocaml/xenstored/process.ml
@@ -567,11 +567,9 @@ let do_introduce con t domains cons data =
 	let dom =
 		if Domains.exist domains domid then
 			let edom = Domains.find domains domid in
-			if (Domain.get_mfn edom) = mfn && (Connections.find_domain cons domid) != con then begin
+			if (Domain.get_mfn edom) = mfn && (Connections.find_domain cons domid) != con then
 				(* Use XS_INTRODUCE for recreating the xenbus event-channel. *)
-				edom.remote_port <- remote_port;
-				Domain.bind_interdomain edom;
-			end;
+				Domain.rebind_evtchn edom remote_port;
 			edom
 		else try
 			let ndom = Domains.create domains domid mfn remote_port in
-- 
2.11.0


