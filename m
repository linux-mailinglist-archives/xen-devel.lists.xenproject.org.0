Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B24B963DC0C
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 18:33:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450102.707304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Qxk-0006CK-4y; Wed, 30 Nov 2022 17:33:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450102.707304; Wed, 30 Nov 2022 17:33:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Qxj-00065O-TE; Wed, 30 Nov 2022 17:33:35 +0000
Received: by outflank-mailman (input) for mailman id 450102;
 Wed, 30 Nov 2022 17:33:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7pd0=36=citrix.com=prvs=3269fc642=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p0Qxi-00053d-OK
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 17:33:34 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1be97799-70d5-11ed-91b6-6bf2151ebd3b;
 Wed, 30 Nov 2022 18:33:33 +0100 (CET)
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
X-Inumbo-ID: 1be97799-70d5-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669829613;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nRNYjN3h3CCOcy1einFYCiePqE0uvjAOH9wR0gDEFwk=;
  b=L8Fy8iTrQkDNdIthMQhwTx5EjiLbnU5vGWHMYkVElTqvwOx49SA6yIT5
   JUwZvrDzr6nSoEMY0w/2wEh8Krx9800ba1gP0gqh6mvUZ1LmGaWrNettm
   YbWYiPuyZjb7FYiBjGwOYBR6QBMJONZa5vYW9NArFNcNpfd3JciS88U9x
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 84930607
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:VRU5qKLn40two+x+FE+RxpUlxSXFcZb7ZxGr2PjKsXjdYENSg2cOz
 GMWC2rXOKyLNDCnKYp/atjko0sBvJbRndVrSAdlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5wdmPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c59OUwSx
 aQ7dAwXYzCN3biTwJGSGu5z05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpPE+ojx5nYz/7DLozkPmpgD/jdCdfq3qepLYt4niVxwt0uFToGIqJK4fSG50K9qqej
 mfXzlTJIB0FDuCkyjq9tVmDmOSVzRquDer+E5Xnr6U30TV/3Fc7Fxk+RVa95/6jhSaWV9tBJ
 mQO9yEprKx081akJvHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpVTA9nJZoH3pwj
 AbPxo63Q2w02FGIdZ6D3r2sgG+CYQtJEXUPRSFeFy4FwPCzp55m23ojUe1fOKKyi9T0HxT5z
 DaLsDUyit0vsCIb60mo1QuZ2mzx//AlWiZwv1yKBTz9smuVcab/P+SVBU7nAeGsxWpzZn2Ip
 zA6lseX94ji5rndxXXWEI3h8FxEjstp0QEwY3Y1R/HNFBz3oRZPmLy8BxkgTHqFyu5eJVfUj
 Lb74Gu9HqN7MnqwdrNQaImsEcksxqWIPY27CKGLMoQQP8YtKFHvEMRSiai4hTiFfK8EyPFXB
 HtmWZz0USZy5VpPk1JauNvxIZd0n3tjlAs/tLjwzgi90Kr2WZJmYe5tDbd6VchgtPnsiFyMo
 75i2z6il003vBvWPnOGrub+7DkicRAGOHwBg5UMJ7TafVo7QDhJ5j246epJRrGJVp99zo/gl
 kxRkGcDlzITWVWvxd22V01e
IronPort-HdrOrdr: A9a23:4k4Kzqq9ZxEBJIM7mHsaWaUaV5oReYIsimQD101hICG8cqSj9v
 xG+85rrCMc6QxhI03I9urwW5VoLUmyyXcx2/h0AV7AZniBhILLFvAB0WKK+VSJcEeSmtK1l5
 0QFJSWYOeAdWSS5vyb3ODXKbgdKaG8gcWVuds=
X-IronPort-AV: E=Sophos;i="5.96,207,1665460800"; 
   d="scan'208";a="84930607"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 4/5] tools/ocaml/libs/xb: add missing stdint.h
Date: Wed, 30 Nov 2022 17:32:36 +0000
Message-ID: <dc5a5277881e2121b86ac544050ad6d2e94e747b.1669829264.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1669829264.git.edvin.torok@citrix.com>
References: <cover.1669829264.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

xs_wire.h fails to compile without this, and a slight rearrangement of
header includes (e.g. by clang-format) could cause the file to fail to
compile.

Be more robust and include the needed header file.
---
 tools/ocaml/libs/xb/xenbus_stubs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/ocaml/libs/xb/xenbus_stubs.c b/tools/ocaml/libs/xb/xenbus_stubs.c
index e5206f64d4..ce6d33b23e 100644
--- a/tools/ocaml/libs/xb/xenbus_stubs.c
+++ b/tools/ocaml/libs/xb/xenbus_stubs.c
@@ -15,6 +15,7 @@
  */
 
 #include <unistd.h>
+#include <stdint.h>
 #include <stdlib.h>
 #include <sys/mman.h>
 #include <string.h>
-- 
2.34.1


