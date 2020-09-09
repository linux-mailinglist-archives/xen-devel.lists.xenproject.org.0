Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17819262D72
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 12:52:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFxiC-0006xu-Sj; Wed, 09 Sep 2020 10:52:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M6/y=CS=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kFxiB-0006wW-3q
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 10:52:23 +0000
X-Inumbo-ID: a30529c8-bacd-4d85-95f4-428c041b4804
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.54])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a30529c8-bacd-4d85-95f4-428c041b4804;
 Wed, 09 Sep 2020 10:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1599648741;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=FhyA4BoOMJmqC4tc/rafzb7eGx45kAf1zpws6i1NIAU=;
 b=WM7ZCE/eRivDMZASfTLI65W4bAAbNUVKvK7O2hhPZfXdy6zCkgSbtZBhO90Xg6m4hA
 iR2JnV/qZrsErGICSsjKZ3+ganwxHywfu/ko05+6uILMAUhT6hG7NOhXyTPBkwRcx0rJ
 uBrx9kAOb5ewuJzjjaFzJP4xFkdUveswiKRT9EslMfThK8tAkn/wLA5YJ/o9hU5sTOgq
 GotJXIgjHUH5RNauDl52ga34UdyCG2RTor71CjC4f3pXUgGYSoIAfTyru8Uw7P3XI56Y
 ZHYz+xFJ1EX8lB4nb8icyPliTkkY6UySXZYH5A8CVXgmsNDC9axt6i9jk29pVWdnukgY
 FfxQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS32hIjw=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.10.7 SBL|AUTH)
 with ESMTPSA id 60ad29w89AqHLQp
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 9 Sep 2020 12:52:17 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Subject: [PATCH v1] docs: remove stale README.incompatibilities
Date: Wed,  9 Sep 2020 12:52:13 +0200
Message-Id: <20200909105213.23112-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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

It mentions just stale and obsolete distributions.
They are not suitable to build current Xen, since a couple of years.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/examples/Makefile                 |  1 -
 tools/examples/README.incompatibilities | 38 -------------------------
 2 files changed, 39 deletions(-)
 delete mode 100644 tools/examples/README.incompatibilities

diff --git a/tools/examples/Makefile b/tools/examples/Makefile
index f86ed3a271..2a6c5444d4 100644
--- a/tools/examples/Makefile
+++ b/tools/examples/Makefile
@@ -3,7 +3,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 # Xen configuration dir and configs to go there.
 XEN_READMES = README
-XEN_READMES += README.incompatibilities
 
 XEN_CONFIGS += xlexample.hvm
 XEN_CONFIGS += xlexample.pvlinux
diff --git a/tools/examples/README.incompatibilities b/tools/examples/README.incompatibilities
deleted file mode 100644
index bb067bd419..0000000000
--- a/tools/examples/README.incompatibilities
+++ /dev/null
@@ -1,38 +0,0 @@
-Command Incompatibilities
-=========================
-
-Known incompatibilities with various commands on various distributions, and
-the workarounds we use.
-
-
-brctl
------
-
-brctl show <bridge> fails on SLES9 SP2.  Workaround is to use brctl show
-without arguments, and grep, though this would be difficult were you to need
-to check for a specific bridge-interface pair, since brctl does not show the 
-bridge name on every line.
-
-
-ifup / ifdown
--------------
-
-SuSE requires an extra parameter to ifup, which is created by calling getcfg
-appropriately.  See xen-network-common.sh for details.
-
-Gentoo doesn't have ifup/ifdown; appropriate alternatives are defined in
-xen-network-common.sh.
-
-
-ip
---
-
-Newer ip commands (from iproute2) do not accept the abbreviated syntax "ip r a
-..." etc.  "ip route add ..." must be used instead.
-
-
-sed
----
-
-\s is not supported in regexps on Debian etch (sed 4.1.2), Ubuntu 4.10.  We
-hand-craft character classes instead.

