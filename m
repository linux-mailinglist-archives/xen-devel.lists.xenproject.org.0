Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 088956187D7
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 19:44:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436989.691280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqfBg-0003s4-D6; Thu, 03 Nov 2022 18:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436989.691280; Thu, 03 Nov 2022 18:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqfBg-0003pW-9b; Thu, 03 Nov 2022 18:43:36 +0000
Received: by outflank-mailman (input) for mailman id 436989;
 Thu, 03 Nov 2022 18:43:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/+MZ=3D=citrix.com=prvs=2997fa3e9=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1oqfBe-0003pQ-LD
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 18:43:34 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 689c9811-5ba7-11ed-8fd0-01056ac49cbb;
 Thu, 03 Nov 2022 19:43:31 +0100 (CET)
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
X-Inumbo-ID: 689c9811-5ba7-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667501012;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oyPCAImnaj09tKU7y54YtIG3O9iSVzO1A8cCcxhoV8M=;
  b=AyH6yFNhfeS10ZgWOAlnBHQcHG2aDIzc88R7VKhGol3lAoFbkqQe/SD6
   WbY1n8McRF74WlRsjmC2572KUj1TSMvghVKRwffddmaN+2Qe9tH8cjCj3
   3m10Nbonbr9PEIb+UUUL9VDmaCwTDcPZv2o0oUret+dv9a2FQ+Iqsw3Yf
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 84124329
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:IOXL+aChEiGSChVW/zbjw5YqxClBgxIJ4kV8jS/XYbTApD4i02QOy
 TNKXmmAPfvbYjakeNEkPdiz8UkEsZLWztMwQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WpA5QRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw0+h4Ez8N+
 eAkCg8vNy293uKz44qGY7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2o0BPjDS0Qn1lM/BZ4gneHumn7ldD5wo1OJv6snpWPUyWSd1ZC9bIOPJofQFK25mG6nv
 DKBo2bQLygjD/vcwiGUw1utnNDmyHaTtIU6S+Tjq68CbEeo7mAaFhA+T1awpvi9zEmkVLp3N
 Eg86ico668o+ySDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZhZdo8pYkJTDol/
 laTmpXiAjkHjVGOYSvDrPHO92r0YHVLaz9ZDcMZcecby/Dtr5NtzR7TcvRcMveIsIT1HBLI/
 hnf+UDSmI4vpcIM0qy6+3XOjDStuoXFQ2YJ2+nHYo62xlgnPdD4PuRE/XCetK8dd9jBEjFtq
 VBew6CjAPYy4YZhfcBnaMEEB/mX6vmMK1UwanY/TsB6p1xBF5NOFL28AQ2Sxm8zb67omhezO
 ic/XD+9A7cKZROXgVdfOd7ZNijT5fGI+S7Zfv7VdMFSRZN6aRWK+ipjDWbJgT6yzBFwyPpiY
 8nEGSpJMZr9If05pAdaus9HieN7rszA7T67qW/HI+SPjuPFOS/9pUYtO1qSdOEphJ5oUy2Mm
 +uzw/CikkwHONASlwGNrub/23hWciVgbX03wuQLHtO+zv1ORzp9VqaBmuN6E2Gn9owM/tr1E
 riGchcw4DLCabfvcG1mtlgLhGvTYKtC
IronPort-HdrOrdr: A9a23:uQCQZKOQN43/T8BcTs+jsMiBIKoaSvp037Eqv3oRdfUzSL3/qy
 nOpoV96faaskdzZJhNo7+90cq7MBfhHPxOkOss1N6ZNWGM0gbFEGgL1/qa/9SKIU3DH4Bmu5
 uIC5IObeHNMQ==
X-IronPort-AV: E=Sophos;i="5.96,134,1665460800"; 
   d="scan'208";a="84124329"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?=
	<edvin.torok@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [[PATCH for-4.17 v1]] tools/ocaml/xenstored/store.ml: fix build error
Date: Thu, 3 Nov 2022 18:42:50 +0000
Message-ID: <5a453393dad1de8286fe5db16504d3db2906eef8.1667500970.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Building with Dune in release mode fails with:
```
File "ocaml/xenstored/store.ml", line 464, characters 13-32:
Warning 18: this type-based record disambiguation is not principal.
File "ocaml/xenstored/store.ml", line 1:
Error: Some fatal warnings were triggered (1 occurrences)
```

This is a warning to help keep the code futureproof, quoting from its
documentation:
> Check information path during type-checking, to make sure that all types are
> derived in a principal way. When using labelled arguments and/or polymorphic
> methods, this flag is required to ensure future versions of the compiler will
> be able to infer types correctly, even if internal algorithms change. All
> programs accepted in -principal mode are also accepted in the default mode with
> equivalent types, but different binary signatures, and this may slow down type
> checking; yet it is a good idea to use it once before publishing source code.

Fixes: db471408edd46 "tools/ocaml/xenstored: Fix quota bypass on domain shutdown"

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/xenstored/store.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/ocaml/xenstored/store.ml b/tools/ocaml/xenstored/store.ml
index 14ec404988..38a4945372 100644
--- a/tools/ocaml/xenstored/store.ml
+++ b/tools/ocaml/xenstored/store.ml
@@ -461,7 +461,7 @@ let reset_permissions store domid =
       | Some perms ->
         if perms <> node.perms then
           Logging.debug "store|node" "Changed permissions for node %s" (Node.get_name node);
-        Some { node with perms }
+        Some { node with Node.perms }
     ) store.root
 
 type ops = {
-- 
2.34.1


