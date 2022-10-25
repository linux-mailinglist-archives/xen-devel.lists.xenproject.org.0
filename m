Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1D960CABC
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 13:17:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429778.681005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onHvj-0007bv-OO; Tue, 25 Oct 2022 11:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429778.681005; Tue, 25 Oct 2022 11:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onHvj-0007Zq-LI; Tue, 25 Oct 2022 11:17:11 +0000
Received: by outflank-mailman (input) for mailman id 429778;
 Tue, 25 Oct 2022 11:17:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EPr6=22=citrix.com=prvs=290a5f0d7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1onHvh-0007Zd-VY
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 11:17:09 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f1b0ab4-5456-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 13:17:08 +0200 (CEST)
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
X-Inumbo-ID: 8f1b0ab4-5456-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666696628;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VV43RUwpriwNLLfb83Bf2O9iMtUov5Ahc0lEQEZwlGk=;
  b=UsWNxIaUZ4k4GumloEsXNxvlE5nMZg7uLQObbgHINHby1URm1sTg7Rs6
   y5DhCntRlohgPOcPoNPj4cizoAZQEe1MNsGAz7RQftv4mYs/CUGQOaUoi
   5jQEn3Z2KQmI6EDz9RXU/rRjVvIhMOBVuppR6LxU399RBKbdhIOBtXBbK
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 83065978
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:XcBU3a1+jSHf6WjkiPbD5fJxkn2cJEfYwER7XKvMYLTBsI5bpzJWy
 DdKW2HSP66JZWTzKNl+a4i+9koDvpDXztJmHQZupC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNJg06/gEk35q6r4GlF5gVWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqU92OwpOWpxq
 cceCzQ9R1etu9i/77aSH7wEasQLdKEHPasas3BkizrYEewnUdbIRKCiCd1whWlqwJoURLCHO
 pRfOWEHgBfoOnWjPn8eDo4+m+G5wGHyaTRCpHqepLYt4niVxwt0uFToGIqOIoLXFJoF9qqej
 mmW8GW+Uh1EDs6C7gej8l3zmMDTjTyuDer+E5Xnr6U30TV/3Fc7Fxk+RVa95/6jhSaWWd1FL
 FcP0jEztqV0/0uuJvHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQPwrstUnAwMj0
 FChlsnsQzdotdWopWm1r+nO62noYG5McDFENXRsoRY5D8fLhaM50CrEcYpYFo2xvvSyNw3Ky
 h+OhX1r71kMtvIj26K+9FHBpjujoJnVUwI4jjnqsnKZAhBRP9D8OdHxgbTPxbMZddvCEAHd1
 JQRs5LGhN3iG61hg8BkrA8lOLiyr8iIPzTH6bKEN8lwrm/9k5JPkG053d2fGKuLGpxbEdMKS
 BWJ0e+02HO0FCLzBZKbm6rrV6wXIVHITLwJrMz8YNtUeYRWfwSa5ixobkP49zmzzhZyyv9iY
 M3BIZzE4ZMm5UNPlWTeegvg+eVzmnBWKZ37GfgXMChLIZLBPSXIGN/pwXOFb/wj7bPsnekm2
 483Cid+8D0GCLeWSnCOqeY7dAlaRUXX8Lir8qS7gMbYeVE4cIzgYteMqY4cl3tNw/wMyLiVp
 C3hCye1CjPX3BX6FOlDUVg7AJuHYHq1hShT0fAEVbpw50UeXA==
IronPort-HdrOrdr: A9a23:qGZGoay9mWvhdCj3IIQtKrPwJr1zdoMgy1knxilNoRw8SKOlfq
 eV7ZEmPH7P+VEssR4b+OxoVJPsfZq+z+8W3WByB9eftWDd0QPCRr2KhbGSpwEIcBeRygcy78
 tdmtBFeb7NMWQ=
X-IronPort-AV: E=Sophos;i="5.95,211,1661832000"; 
   d="scan'208";a="83065978"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, Henry Wang
	<Henry.Wang@arm.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH for-4.17] libs/light: Fix build, fix missing _libxl_types_json.h
Date: Tue, 25 Oct 2022 12:16:32 +0100
Message-ID: <20221025111632.36286-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Make may not have copied "_libxl_types_json.h" into $(XEN_INCLUDE)
before starting to build the different objects.

Make sure that the generated headers are copied into $(XEN_INCLUDE)
before using them. This is achieved by telling make about which
headers are needed to use "libxl_internal.h" which use "libxl_json.h"
which uses "_libxl_types_json.h". "libxl_internal.h" also uses
"libxl.h" so add it to the list.

This also prevent `gcc` from using a potentially installed headers
from a previous version of Xen.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

This is part of in review patch "libs/light: Rework targets
prerequisites", but that much smaller patch should be enough to fix
potential build issues.

This patch fix for example `make _libxl_types.o`, when libxl generated
headers aren't generated yet, and tools/light is clean.

For 4.17:
    build fix.
---
 tools/libs/light/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index d681269229..374be1cfab 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -209,6 +209,7 @@ _libxl_save_msgs_helper.h _libxl_save_msgs_callout.h: \
 
 $(XEN_INCLUDE)/libxl.h: $(XEN_INCLUDE)/_libxl_types.h
 $(XEN_INCLUDE)/libxl_json.h: $(XEN_INCLUDE)/_libxl_types_json.h
+libxl_internal.h: $(XEN_INCLUDE)/libxl.h $(XEN_INCLUDE)/libxl_json.h
 libxl_internal.h: _libxl_types_internal.h _libxl_types_private.h _libxl_types_internal_private.h
 libxl_internal_json.h: _libxl_types_internal_json.h
 
-- 
Anthony PERARD


