Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E963621880
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 16:39:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440163.694292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQhT-0007a4-5e; Tue, 08 Nov 2022 15:39:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440163.694292; Tue, 08 Nov 2022 15:39:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQhT-0007Xg-2R; Tue, 08 Nov 2022 15:39:43 +0000
Received: by outflank-mailman (input) for mailman id 440163;
 Tue, 08 Nov 2022 15:39:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5OwR=3I=citrix.com=prvs=304cef38d=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1osQhR-0007Fx-Kr
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 15:39:41 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8dd69aaf-5f7b-11ed-91b5-6bf2151ebd3b;
 Tue, 08 Nov 2022 16:39:40 +0100 (CET)
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
X-Inumbo-ID: 8dd69aaf-5f7b-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667921980;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MmumC61ho15DndrHDcqanqMqkMI1LHqlie4LwBB5is0=;
  b=EK2C/i+u0+btJIOV2JQqFc7r35+r3X58Hjvapob6+gGoQd6QkQxKAgJV
   /oWGOL7/HGt4Pcovpy2fTmj00ykH2Jf55PrF66F2MYAABS90KtAj4+SMf
   rSWT60/cCXg6C3BIfLlLT3tNcxypl80W7ZMBLXAA/1VfttjPOtYlpgb6i
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 84398664
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tas1CaIGkPgQGR05FE+R3ZUlxSXFcZb7ZxGr2PjKsXjdYENShmEBy
 TRMDTrQP/3cZGr3ct5xPd7loB8OsJ+Am9RrTQBlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5wRuPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c52OWty9
 +QELwwBbyvSi7yo75Cie+xj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpPE+ojx5nYz/7DLozkPmpgD/jdCdfq3qepLYt4niVxwt0uFToGIqJIY3aG5sJ9qqej
 jyYuHbTXy03DYa01SSq4G2mm92VpCyuDer+E5Xnr6U30TV/3Fc7BBQIWHOhrPK+i0r4XMhQQ
 2QL/gI+oK5081akJvHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQPwrstUnAwMj0
 FChlsnsQzdotdWopWm1r+nO62noYG5McDFENXRsoRY5D8fLobk5shDXUtFfHK+O39GrBx7S2
 gGPo31r71kMtvIj26K+9FHBpjujoJnVUwI4jjnqsnKZAhBRP9D8OdHxgbTPxbMZddvCEAHd1
 JQRs5LGhN3iG61hg8BkrA8lOLiyr8iIPzTH6bKEN8lwrm/9k5JPkG053d2fGKuLGpxaEdMKS
 BWJ0e+02HO0FCrCUEOPS9jtY/nGNIC5fTklP9iNBja0XrB/dRWc4AZlblOK0mbmnSAEyP9hZ
 sfHL5/0VSxEWcyLKQZaoM9Ej9cWKt0WnzuPFfgXMTz7uVZhWJJlYehcawbfBgzIxKiFvB/U4
 75i2ziikn1ivSyXSne/zLP/2nhTfCVkX8ut85wOHgNBSyI/cFwc5zbq6etJU+RYc259zI8kI
 lnVtpdk9WfC
IronPort-HdrOrdr: A9a23:6bKEcKqAQOq+VSc39qigHrIaV5oReYIsimQD101hICG8cqSj9v
 xG+85rrSMc6QxhIU3I9urwW5VoLUmyyXcx2/h0AV7AZniBhILLFvAB0WKK+VSJcEeSmtK1l5
 0QFJSWYOeAdmSS5vyb3ODXKbgdKaG8gcWVuds=
X-IronPort-AV: E=Sophos;i="5.96,148,1665460800"; 
   d="scan'208";a="84398664"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?=
	<edvin.torok@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH for-4.17 v3 11/15] tools/ocaml/xenstored: do not rebind event channels after live update
Date: Tue, 8 Nov 2022 15:34:03 +0000
Message-ID: <003537c5db4682b9a5f632d61cb15b332e0778bf.1667920496.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667920496.git.edvin.torok@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

See explanation in previous commit.
This introduces a new field into the live update stream to retain both
ports, and handles the missing value in a backward compatible way.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
Reason for inclusion 4.17:
- fixes a bug in oxenstored live update, needed to make live updates
  with future 4.17 security fixes possible/more reliable

Changes since v2:
- new in v3
---
 tools/ocaml/libs/eventchn/xeneventchn.ml  |  5 +++++
 tools/ocaml/libs/eventchn/xeneventchn.mli |  5 +++++
 tools/ocaml/xenstored/domain.ml           |  6 +++++-
 tools/ocaml/xenstored/domains.ml          | 13 +++++++++----
 tools/ocaml/xenstored/event.ml            |  1 +
 tools/ocaml/xenstored/xenstored.ml        | 11 +++++++----
 6 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/tools/ocaml/libs/eventchn/xeneventchn.ml b/tools/ocaml/libs/eventchn/xeneventchn.ml
index 34f7391f5e..7ccf7a99f0 100644
--- a/tools/ocaml/libs/eventchn/xeneventchn.ml
+++ b/tools/ocaml/libs/eventchn/xeneventchn.ml
@@ -43,6 +43,11 @@ type virq_t =
 
 external notify: handle -> int -> unit = "stub_eventchn_notify"
 external bind_interdomain: handle -> int -> int -> int = "stub_eventchn_bind_interdomain"
+
+let restore_interdomain handle _domid _remote_port local_port =
+  notify handle local_port;
+  local_port
+
 external bind_virq: handle -> virq_t -> int = "stub_eventchn_bind_virq"
 let bind_dom_exc_virq handle = bind_virq handle Dom_exc
 external unbind: handle -> int -> unit = "stub_eventchn_unbind"
diff --git a/tools/ocaml/libs/eventchn/xeneventchn.mli b/tools/ocaml/libs/eventchn/xeneventchn.mli
index 3965b29621..7407031b9e 100644
--- a/tools/ocaml/libs/eventchn/xeneventchn.mli
+++ b/tools/ocaml/libs/eventchn/xeneventchn.mli
@@ -68,6 +68,11 @@ val bind_interdomain : handle -> int -> int -> t
     channel connected to domid:remote_port. On error it will
     throw a Failure exception. *)
 
+val restore_interdomain : handle -> int -> int -> int -> t
+(** [restore_interdomain h domid remote_port local_port] returns a local event
+    channel connected to domid:remote_port. On error it will
+    throw a Failure exception. *)
+
 val bind_dom_exc_virq : handle -> t
 (** Binds a local event channel to the VIRQ_DOM_EXC
     (domain exception VIRQ). On error it will throw a Failure
diff --git a/tools/ocaml/xenstored/domain.ml b/tools/ocaml/xenstored/domain.ml
index 4e62a48e8e..5dad298614 100644
--- a/tools/ocaml/xenstored/domain.ml
+++ b/tools/ocaml/xenstored/domain.ml
@@ -61,7 +61,7 @@ let string_of_port = function
   | Some x -> string_of_int (Xeneventchn.to_int x)
 
 let dump d chan =
-  fprintf chan "dom,%d,%nd,%d\n" d.id d.mfn d.remote_port
+  fprintf chan "dom,%d,%nd,%d,%s\n" d.id d.mfn d.remote_port (string_of_port d.port)
 
 let notify dom = match dom.port with
   | None ->
@@ -77,6 +77,10 @@ let bind_interdomain dom =
   dom.port <- Some (Event.bind_interdomain dom.eventchn dom.id dom.remote_port);
   debug "bound domain %d remote port %d to local port %s" dom.id dom.remote_port (string_of_port dom.port)
 
+let restore_interdomain dom localport =
+  assert (dom.port = None);
+  dom.port <- Some (Event.restore_interdomain dom.eventchn dom.id dom.remote_port localport);
+  debug "restored interdomain %d remote port %d to local port %s" dom.id dom.remote_port (string_of_port dom.port)
 
 let close dom =
   debug "domain %d unbound port %s" dom.id (string_of_port dom.port);
diff --git a/tools/ocaml/xenstored/domains.ml b/tools/ocaml/xenstored/domains.ml
index d5c452d26c..af9fecf2f7 100644
--- a/tools/ocaml/xenstored/domains.ml
+++ b/tools/ocaml/xenstored/domains.ml
@@ -123,17 +123,22 @@ let cleanup doms =
 let resume _doms _domid =
   ()
 
-let create doms domid mfn port =
+let maybe_bind_interdomain restore_localport dom =
+  match restore_localport with
+  | None -> Domain.bind_interdomain dom
+  | Some p -> Domain.restore_interdomain dom p
+
+let create doms domid mfn ?restore_localport port =
   let interface = Xenctrl.map_foreign_range xc domid (Xenmmap.getpagesize()) mfn in
   let dom = Domain.make domid mfn port interface doms.eventchn in
   Hashtbl.add doms.table domid dom;
-  Domain.bind_interdomain dom;
+  maybe_bind_interdomain restore_localport dom;
   dom
 
 let xenstored_kva = ref ""
 let xenstored_port = ref ""
 
-let create0 doms =
+let create0 ?restore_localport doms =
   let port, interface =
     (
       let port = Utils.read_file_single_integer !xenstored_port
@@ -147,7 +152,7 @@ let create0 doms =
   in
   let dom = Domain.make 0 Nativeint.zero port interface doms.eventchn in
   Hashtbl.add doms.table 0 dom;
-  Domain.bind_interdomain dom;
+  maybe_bind_interdomain restore_localport dom;
   Domain.notify dom;
   dom
 
diff --git a/tools/ocaml/xenstored/event.ml b/tools/ocaml/xenstored/event.ml
index 190ca6fcbf..3debe8731d 100644
--- a/tools/ocaml/xenstored/event.ml
+++ b/tools/ocaml/xenstored/event.ml
@@ -29,6 +29,7 @@ let init ?fd () =
 let fd eventchn = Xeneventchn.fd eventchn.handle
 let bind_dom_exc_virq eventchn = eventchn.virq_port <- Some (Xeneventchn.bind_dom_exc_virq eventchn.handle)
 let bind_interdomain eventchn domid port = Xeneventchn.bind_interdomain eventchn.handle domid port
+let restore_interdomain eventchn domid port local_port = Xeneventchn.restore_interdomain eventchn.handle domid port local_port
 let unbind eventchn port = Xeneventchn.unbind eventchn.handle port
 let notify eventchn port = Xeneventchn.notify eventchn.handle port
 let pending eventchn = Xeneventchn.pending eventchn.handle
diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index cdd5b5ac67..d4ff24b440 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -169,10 +169,13 @@ module DB = struct
             event_f ~eventfd
           | "socket" :: fd :: [] ->
             socket_f ~fd:(int_of_string fd)
-          | "dom" :: domid :: mfn :: port :: []->
+          | "dom" :: domid :: mfn :: port :: rest ->
             domain_f (int_of_string domid)
               (Nativeint.of_string mfn)
               (int_of_string port)
+              (match rest with
+               | [] -> None (* backward compat: old version didn't have it *)
+               | localport :: _ -> Some (int_of_string localport))
           | "watch" :: domid :: path :: token :: [] ->
             watch_f (int_of_string domid)
               (unhexify path) (unhexify token)
@@ -232,13 +235,13 @@ module DB = struct
       else
         warn "Ignoring invalid socket FD %d" fd
     in
-    let domain_f domid mfn port =
+    let domain_f domid mfn port restore_localport =
       let doms = require_doms () in
       let ndom =
         if domid > 0 then
-          Domains.create doms domid mfn port
+          Domains.create doms domid mfn ?restore_localport port
         else
-          Domains.create0 doms
+          Domains.create0 ?restore_localport doms
       in
       Connections.add_domain cons ndom;
     in
-- 
2.34.1


