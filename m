Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AF6786F45
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 14:40:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590064.922158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ9cq-0006Dd-Je; Thu, 24 Aug 2023 12:39:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590064.922158; Thu, 24 Aug 2023 12:39:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ9cq-0006B2-Fo; Thu, 24 Aug 2023 12:39:48 +0000
Received: by outflank-mailman (input) for mailman id 590064;
 Thu, 24 Aug 2023 12:39:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+mH=EJ=citrix.com=prvs=593bb07b7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qZ9cp-0006Aw-Ep
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 12:39:47 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c9c96b0-427b-11ee-9b0c-b553b5be7939;
 Thu, 24 Aug 2023 14:39:44 +0200 (CEST)
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
X-Inumbo-ID: 4c9c96b0-427b-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692880784;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1nu28532BfRIrajeoQzfDkbZBy2s+1lnODaCk3/8+fk=;
  b=MVBXLaMjftw1ECBijVXyWHde22Pl0b5hHPF2hkY24c6dpq12SxE4jsuU
   iksAu1vJzz5m8xqK+gm5FFTnJEkY+fDrrcITWTZAuB7vyN2X8ob/ItQ7a
   hSoqSX4G6uDT6Dhqi4EaJddTNKvKhimc0W55bVuhJFBqZzfZHLZWyUj6K
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 120939999
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:6xQP4K4mD8hwrVXN8OZBawxRtEbHchMFZxGqfqrLsTDasY5as4F+v
 msbXT+BMquMZmejL94naoqzoxsP78CAmtdkGwdu/i42Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35pwehBtC5gZlPaAR5weH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m3
 tU/M3MONBq5oaGbg+zgUdteq/QFFZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xxzA9
 zmXrjWoav0cHNiN8ybayXGuuszClzrZddgcCbGb19c/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM+e8CMVjtlvLkPCNpV/EWC5dFGUphMEaWNEebhUNz
 RyKxdnTI39C8+POUkCv24eylGbnUcQKFlMqaSgBRAoDxtDspoAvkx7CJupe/L6JYs7dQm+pn
 W3TxMQqr/BK1JNQif3nlbzSq2j0zqUlWDLZ8ek+soiNygpiLLCoaIWzgbQwxaYRdd3JJrVtU
 ZVtpiR/0AzsJcvS/MBuaL9XdF1M2xpiGGSH6WOD57F7q1yQF4eLJOi8Gg1WKkZzKdojcjT0e
 kLVsg45zMYNbSH6NPIrM9vgVJ9CIU3c+TLNDKu8gj1mOMQZSeN61Hs2OR74M57FzSDAbp3Ty
 b/EKJ3xXB72+IxszSasRvd17FPY7nlW+I8nfriil07P+ePHNBaopUItbAPmghYRsPnV/204M
 r93a6O39vmoeLeiPXmKq9dLcQhiwLpSLcmelvG7v9WremJOcFzNwdeIqV/9U+SJR5hoq9o=
IronPort-HdrOrdr: A9a23:80igwq7vq6rTr0zmzwPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-Talos-CUID: 9a23:EeR902NGVUZGvu5DcwBA7w0XQMofVD7wjymLOH2KJFZPcejA
X-Talos-MUID: =?us-ascii?q?9a23=3AW9ZqKwyCrFd0HErjwuXUzT6EevyaqKC8MlxSqpY?=
 =?us-ascii?q?Eh+qJPzVSFm2TkTiUY6Zyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.02,195,1688443200"; 
   d="scan'208";a="120939999"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	Rob Hoes <Rob.Hoes@citrix.com>
Subject: [PATCH] tools/oxenstored: Additional debugging commands
Date: Thu, 24 Aug 2023 13:39:39 +0100
Message-ID: <20230824123939.1297171-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Edwin Török <edwin.torok@cloud.com>

These were added to aid security development, and are useful generally for
debugging.

Signed-off-by: Edwin Török <edwin.torok@cloud.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: Edwin Török <edwin.torok@cloud.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>

I found this hiding down the back of the patchqueue.
---
 tools/ocaml/xenstored/process.ml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tools/ocaml/xenstored/process.ml b/tools/ocaml/xenstored/process.ml
index 2e62c7a10e7a..432d66321cbb 100644
--- a/tools/ocaml/xenstored/process.ml
+++ b/tools/ocaml/xenstored/process.ml
@@ -235,6 +235,23 @@ let do_debug con t _domains cons data =
     | "watches" :: _ ->
       let watches = Connections.debug cons in
       Some (watches ^ "\000")
+    | "compact" :: _ ->
+      Gc.compact ();
+      Some "Compacted"
+    | "trim" :: _ ->
+      History.trim ();
+      Some "trimmed"
+    | "txn" :: domid :: _ ->
+      let domid = int_of_string domid in
+      let con = Connections.find_domain cons domid in
+      let b = Buffer.create 128 in
+      let () = con.transactions |> Hashtbl.iter @@ fun id tx ->
+        Printf.bprintf b "paths: %d, operations: %d, quota_reached: %b\n"
+          (List.length tx.Transaction.paths)
+          (List.length tx.Transaction.operations)
+          tx.Transaction.quota_reached
+      in
+      Some (Buffer.contents b)
     | "xenbus" :: domid :: _ ->
       let domid = int_of_string domid in
       let con = Connections.find_domain cons domid in

base-commit: b0cd7499ddd281033548a702c6d61ab13fdd1f67
-- 
2.30.2


