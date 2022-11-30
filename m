Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3694563DC08
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 18:33:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450097.707276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0QxU-0005L6-27; Wed, 30 Nov 2022 17:33:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450097.707276; Wed, 30 Nov 2022 17:33:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0QxT-0005JG-VJ; Wed, 30 Nov 2022 17:33:19 +0000
Received: by outflank-mailman (input) for mailman id 450097;
 Wed, 30 Nov 2022 17:33:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7pd0=36=citrix.com=prvs=3269fc642=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p0QxS-00053d-Es
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 17:33:18 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 124fa896-70d5-11ed-91b6-6bf2151ebd3b;
 Wed, 30 Nov 2022 18:33:17 +0100 (CET)
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
X-Inumbo-ID: 124fa896-70d5-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669829597;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Kvmroc4UWt6I3gO1OX/SxhaVKAh4s5W8paVaKox+rwU=;
  b=FQz3h5nVOWo208fSSwDlzo/0MF7T7PKxzO8Xxlrm4RCT0evwNg5xp6FF
   i8e9emupr6hgeLGpv+gcS/bCf8uNMPbVXEtrqXYLG1qKzUKjP/ZXhLcft
   QS6z2CB2vtUEQYmMgaPDZJI6GKpe5JhvPJEKSutffFCcNX6fREBI2bj7/
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 85454977
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+mcOrqy7MRCREOvezwh6t+cJxirEfRIJ4+MujC+fZmUNrF6WrkUCz
 DNNXDjXPfaONjSnc9p3YNu39h8C65bQzIVnTVNuqCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVnPqgT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUV29
 vkgMi00VSiojemsmvXge8lV2/12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKQOHWjOX9OYH46tOqkmHj5NSFfslWWjaE2/3LS3Ep6172F3N/9KoHWGJkEwRnwS
 mTu/G7TXQkFLP2jyGCU/EiovOPd2g/ER9dHfFG/3qEz2wDCroAJMzUUSF+6rP+RmkO4HdVFJ
 CQ85S4GvaU0skuxQbHVRAakqXSJuhodXdt4EOAg7gyJjK3O7G6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+Wpz6vPSkeLUcZeDQJCwAC5rHeTJob10yVCIw5Sejs04OzSWqYL
 y22QDYWo40QiPYRypyAxXvNiCj24cP4bjdo31CCNo661T9RaImgbo2uzFHU6/dcMYqUJmW8U
 Gg4d9u2t75XU8zU/MCZaKBURezyua7ZWNHJqQQ3d6TN4QhB7JJKkWp4xDhlbHlkPc8fEdMCS
 B+C4FgBjHO/0ZbDUEOWX25TI55ypUQDPY6/PhwxUjapSsYZSeN/1HsyDXN8Jki0+KTWrYkxO
 I2AbeGnBmsABKJswVKeHrlDgOB3mH5jmz+PG/gXKihLN5LEPBZ5rp9cYDOzgh0RtvvY8G05D
 f4AXyd19/mveLKnOXSGmWLiBVsLMWI6FfjLRz9/L4a+zv5dMDh5UZf5mOpxE7GJaowJzo8kC
 FnhAB4HoLc+7FWbQTi3hodLMei+B88g/S9jZETB/z+AghAeXGpm149HH7NfQFXt3LULISJcJ
 xXdR/i9Pw==
IronPort-HdrOrdr: A9a23:q/St6qBmJ7YcpE/lHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-IronPort-AV: E=Sophos;i="5.96,207,1665460800"; 
   d="scan'208";a="85454977"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v1 1/5] CODING-STYLE: add .editorconfig to clarify indentation uses spaces
Date: Wed, 30 Nov 2022 17:32:33 +0000
Message-ID: <cafa078bf48d3094c1bed8b1a99b596cd65f9f50.1669829264.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1669829264.git.edvin.torok@citrix.com>
References: <cover.1669829264.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Add an .editorconfig to make it easier to keep patches compatible with
Xen's coding style, and to reemphasize what Xen's coding style is.

I thought that Xen demands tabs rather than spaces (which is more
difficult with OCaml because indentation tools use spaces,
and the use of tabs requires changing editor settings),
however CODING-STYLE says it is spaces.

Document this explicitly by adding a .editorconfig file (see editorconfig.org),
which is an editor agnostic format for specifying basic style properties like
indentation, either with native support in editors or via plugins.

It is safer than modelines because it only supports controlling a
restricted set of editor properties and not arbitrary commands as Vim
modelines would have, and works with editors other than Vim too.
(Vim has a deny list for modeline sandboxing, which is error-prone
because every time a new command gets added it needs to be added to the
deny list, which has been the source of a few CVEs in the past
and I disable Vim modelines everywhere as a precaution).

This file is added as a convenience for those who might have an editor
that supports it, and its presence should have no impact on those that
do not (want to) use it.
It also won't cause re-indentation of existing files when edited, only
newly added lines would follow the convention.

No functional change.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 .editorconfig | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 .editorconfig

diff --git a/.editorconfig b/.editorconfig
new file mode 100644
index 0000000000..cb2f27c581
--- /dev/null
+++ b/.editorconfig
@@ -0,0 +1,20 @@
+# See ./CODING_STYLE
+root = true
+
+[*]
+end_of_line = lf
+indent_style = space
+charset = utf-8
+max_line_length = 79
+trim_trailing_whitespace = true
+insert_final_newline = true
+
+# Makefiles must use tabs, otherwise they don't work
+[{Makefile,*.mk,Makefile.rules}]
+indent_style = tabs
+
+[*.{c,h}]
+indent_size = 4
+
+[*.{ml,mli}]
+indent_size = 2
-- 
2.34.1


