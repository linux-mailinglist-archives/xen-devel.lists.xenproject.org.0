Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7696C2472A8
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 20:46:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7k9C-00078V-8R; Mon, 17 Aug 2020 18:46:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mm75=B3=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1k7k9B-00078A-26
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 18:46:17 +0000
X-Inumbo-ID: 9b6d90a8-2d7c-4e21-ab6a-bf90ac4dd1b8
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b6d90a8-2d7c-4e21-ab6a-bf90ac4dd1b8;
 Mon, 17 Aug 2020 18:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597689976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SMCBsmOzak2flXbv7Zo/YlQyvKHgExmZi0mtL3kNGOc=;
 b=cIq3l84AtlaXBcns9tUHIJrRJPwBntUl9aJ9HeYukt3AO4Nl1Z0HY20G
 hRxJ20YrG58gdDyLrxQBVBlsRW4jJ4E6S/y36KrVcPZa4mqBSLz9VZ0Ct
 pDaCG4HizKCNltLaRFvhMsJ2oN59qIrTZWAFfiQACYwWbPewWH1nijVkt E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Oo9Q+gwuBsz93EG+HoHYIsT/w/DVjp4IHoJK3wfYXeHkbeLTuj70e5a5mrQK2ctFSy8kPd+vef
 P5ja9z7Pn+wXS83A0+WTTVbb7AYGIKpQQujDWebHce2lR4Nq5fCF5pb48TnBnrvjaS4b69fMS+
 OsaLH9tKLdwQxQxnic34WIr2DUHAgJn9sZim/ZfsSvPw/3Wbg00jJmMaGgua/8yiY/M1c8TuFS
 h5N793j38N8AJvuJ1BSAHB+StqOf8q2hPyqVu23jZrZLKWc3CEttqWPgQSGAvUehT4A9rG62Ho
 IO4=
X-SBRS: 2.7
X-MesageID: 24725992
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,324,1592884800"; d="scan'208";a="24725992"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
Subject: [PATCH v3 1/6] tools/ocaml/libs/xc: Fix ambiguous documentation
 comment
Date: Mon, 17 Aug 2020 19:45:44 +0100
Message-ID: <2ed1526e3f369f843871fcf166bf3e14ced36dfb.1597689796.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1597689796.git.edvin.torok@citrix.com>
References: <cover.1597689796.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/libs/xc/xenctrl.mli | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index 26ec7e59b1..f7f6ec570d 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -132,8 +132,10 @@ external interface_close : handle -> unit = "stub_xc_interface_close"
  * interface_open and interface_close or with_intf although mixing both
  * is possible *)
 val with_intf : (handle -> 'a) -> 'a
+
 (** [get_handle] returns the global handle used by [with_intf] *)
 val get_handle: unit -> handle option
+
 (** [close handle] closes the handle maintained by [with_intf]. This
  * should only be closed before process exit. It must not be called from
  * a function called directly or indirectly by with_intf as this
-- 
2.25.1


