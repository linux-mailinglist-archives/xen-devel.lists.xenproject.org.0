Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C45B56B520B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Mar 2023 21:38:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508584.783390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pajUf-0007Xa-GJ; Fri, 10 Mar 2023 20:37:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508584.783390; Fri, 10 Mar 2023 20:37:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pajUf-0007VI-CA; Fri, 10 Mar 2023 20:37:37 +0000
Received: by outflank-mailman (input) for mailman id 508584;
 Fri, 10 Mar 2023 20:37:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cIIN=7C=citrix.com=prvs=426914f36=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pajUd-0007G2-N9
 for xen-devel@lists.xenproject.org; Fri, 10 Mar 2023 20:37:35 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62b1d4d7-bf83-11ed-956e-85ef70e17bfa;
 Fri, 10 Mar 2023 21:37:33 +0100 (CET)
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
X-Inumbo-ID: 62b1d4d7-bf83-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678480653;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=plUTz7rrczk3uU3kKwhqf3alUilBWCQy881X2SDvNt0=;
  b=Ol9mHhSEvW9JCmJap39IT7nXksFSYLuhPHw6OFNr+CxAZLdAIwLBu/rO
   4YIjHEOAlBPe4mIdZf2yzkg/1WxZ6aR45JlrcuVINlP5+1oMZmbGuK+2d
   cxxiobvjQQ+9FKz+qtM6I+z1I4cKrhmyTz/qD9DOMuqV2rPtNe85UjIgx
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100282290
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Byig962i4jmbRXrsIfbD5cJxkn2cJEfYwER7XKvMYLTBsI5bpzwHx
 mUYCj3TPfqMNjCnKIhwb4618ktVvcPSnN5lHVRqpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdnPagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfXV4Q9
 t9Gcw02VxXfjqHx7fW2EO82iZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiHJ0NxBbC/
 DOel4j/KhQRG92vmGbfy2zvoczUrQPbSIxRHbLto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jY+cddNF+wx6CmW17HZpQ2eAwAsUTppeNEg8sgsSlQXO
 kShxo2zQ2Y16fvMFCzbr+3Pxd+vBcQLBTM9OywnE1A42ODm/IhwyT+IQ4xlSqHg27UZBgrM6
 zyNqSE/gZAagsgKy7i38Dj7vt68mnTaZlVrv1uKBwpJ+is8Pdf4PNLwtTA3+N4adO6kok+9U
 G/ociR0xMQHFtmzmSOEW43h95n5tq/eYFUwbbOCdqTNFghBGVb5Iei8Axkkfi+F1/ronhe4C
 HI/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvK1/bo3o0NBDNgzmFfK0QfUYXY
 8vzTCpRJSxCVfQPIMSeHY/xLoPHNghhnDiOFPgXPjys0KaEZW79dFv2GALmUwzN14vd+F+92
 48GZ6O3J+B3DLWWjt//rdRCcjjn7BETWfjLliCgXrXYe1Y4Rjl/V6e5LHFIU9UNopm5X9zgp
 hmVMnK0AnKm1RUr9S3ihqhfVY7S
IronPort-HdrOrdr: A9a23:S3q4iKAxRtO4WZTlHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo7v
 xG/c5rsyMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 9dmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.98,250,1673931600"; 
   d="scan'208";a="100282290"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH 1/3] tools/xen-cpuid: Support dash as a bitmap delimiter
Date: Fri, 10 Mar 2023 20:37:10 +0000
Message-ID: <20230310203712.1431387-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230310203712.1431387-1-andrew.cooper3@citrix.com>
References: <20230310203712.1431387-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Xapi chose to render its featureset bitmaps with dashes rather than colongs as
a separator.  Have xen-cpuid support both forms, for convenience.

Fix a trivial style issue in the vacinity while here.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/misc/xen-cpuid.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 868054ab96a6..361102d8cfb1 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -607,9 +607,10 @@ int main(int argc, char **argv)
                 if ( i == nr_features )
                     break;
 
-                if ( *ptr == ':' )
+                if ( *ptr == ':' || *ptr == '-' )
                 {
-                    ptr++; continue;
+                    ptr++;
+                    continue;
                 }
                 break;
             }
-- 
2.30.2


