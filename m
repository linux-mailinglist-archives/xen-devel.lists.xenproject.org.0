Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB24947A976
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 13:23:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249774.430179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzHhD-0003rh-NX; Mon, 20 Dec 2021 12:23:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249774.430179; Mon, 20 Dec 2021 12:23:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzHhD-0003pu-KX; Mon, 20 Dec 2021 12:23:15 +0000
Received: by outflank-mailman (input) for mailman id 249774;
 Mon, 20 Dec 2021 12:23:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqEV=RF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mzHhC-0003po-0O
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 12:23:14 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99847ef8-618f-11ec-85d3-df6b77346a89;
 Mon, 20 Dec 2021 13:23:12 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4F75A1F381;
 Mon, 20 Dec 2021 12:23:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0AA2913B73;
 Mon, 20 Dec 2021 12:23:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vTU6AbB1wGGcXgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Dec 2021 12:23:12 +0000
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
X-Inumbo-ID: 99847ef8-618f-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1640002992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=YRYWL+pcD9RCGtbrKXaiFbyVniio1feA2fOKmPxZ3iY=;
	b=nQd2+JVoUWop9K8BDkEhZIiYLy5SauFYtCAtUsYTGRuKhza6fuKDAHcNcZTSA5lCYxd01P
	H7INbl5kLwTl1jlmRChW2c2xm4vPdCyeTKNEGSFB9KCGDm2d6xqFKQMmQSzK9W9KRjE72i
	ctOglbmxdK7DrFmsRqNaGg8zv/NJX2w=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] SUPPORT.md: limit support statement for Linux and Windows frontends
Date: Mon, 20 Dec 2021 13:22:48 +0100
Message-Id: <20211220122248.18332-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the support state of Linux and Windows pv frontends from
"supported" to "supported with caveats" in order to reflect that the
frontends can probably be harmed by their respective backends.

Some of the Linux frontends have been hardened already.

This is XSA-376

Signed-off-by: Juergen Gross <jgross@suse.com>
---
As there is no immediate fix associated with this XSA it was decided
to send the patch modifying the support statement once again to
xen-devel before applying it, allowing the community to discuss the
modified support.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 SUPPORT.md | 57 +++++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 48 insertions(+), 9 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 3a1fd1ba39..32fb0aa8de 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -417,7 +417,11 @@ Guest-side driver capable of speaking the Xen PV block protocol
     Status, FreeBSD: Supported, Security support external
     Status, NetBSD: Supported, Security support external
     Status, OpenBSD: Supported, Security support external
-    Status, Windows: Supported
+    Status, Windows: Supported, with caveats
+
+Windows frontend currently trusts the backend;
+bugs in the frontend which allow backend to cause mischief will not be
+considered security vulnerabilities.
 
 ### Netfront
 
@@ -427,20 +431,32 @@ Guest-side driver capable of speaking the Xen PV networking protocol
     Status, FreeBSD: Supported, Security support external
     Status, NetBSD: Supported, Security support external
     Status, OpenBSD: Supported, Security support external
-    Status, Windows: Supported
+    Status, Windows: Supported, with caveats
+
+Windows frontend currently trusts the backend;
+bugs in the frontend which allow backend to cause mischief will not be
+considered security vulnerabilities.
 
 ### PV Framebuffer (frontend)
 
 Guest-side driver capable of speaking the Xen PV Framebuffer protocol
 
-    Status, Linux (xen-fbfront): Supported
+    Status, Linux (xen-fbfront): Supported, with caveats
+
+Linux frontend currently trusts the backend;
+bugs in the frontend which allow backend to cause mischief will not be
+considered security vulnerabilities.
 
 ### PV display (frontend)
 
 Guest-side driver capable of speaking the Xen PV display protocol
 
-    Status, Linux: Supported (outside of "backend allocation" mode)
-    Status, Linux: Experimental (in "backend allocation" mode)
+    Status, Linux, outside of "backend allocation" mode: Supported, with caveats
+    Status, Linux, "backend allocation" mode: Experimental
+
+Linux frontend currently trusts the backend;
+bugs in the frontend which allow backend to cause mischief will not be
+considered security vulnerabilities.
 
 ### PV Console (frontend)
 
@@ -449,7 +465,11 @@ Guest-side driver capable of speaking the Xen PV console protocol
     Status, Linux (hvc_xen): Supported
     Status, FreeBSD: Supported, Security support external
     Status, NetBSD: Supported, Security support external
-    Status, Windows: Supported
+    Status, Windows: Supported, with caveats
+
+Windows frontend currently trusts the backend;
+bugs in the frontend which allow backend to cause mischief will not be
+considered security vulnerabilities.
 
 ### PV keyboard (frontend)
 
@@ -457,11 +477,19 @@ Guest-side driver capable of speaking the Xen PV keyboard protocol.
 Note that the "keyboard protocol" includes mouse / pointer /
 multi-touch support as well.
 
-    Status, Linux (xen-kbdfront): Supported
+    Status, Linux (xen-kbdfront): Supported, with caveats
+
+Linux frontend currently trusts the backend;
+bugs in the frontend which allow backend to cause mischief will not be
+considered security vulnerabilities.
 
 ### PV USB (frontend)
 
-    Status, Linux: Supported
+    Status, Linux: Supported, with caveats
+
+Linux frontend currently trusts the backend;
+bugs in the frontend which allow backend to cause mischief will not be
+considered security vulnerabilities.
 
 ### PV SCSI protocol (frontend)
 
@@ -470,6 +498,10 @@ multi-touch support as well.
 NB that while the PV SCSI frontend is in Linux and tested regularly,
 there is currently no xl support.
 
+Linux frontend currently trusts the backend;
+bugs in the frontend which allow backend to cause mischief will not be
+considered security vulnerabilities.
+
 ### PV TPM (frontend)
 
 Guest-side driver capable of speaking the Xen PV TPM protocol
@@ -492,7 +524,11 @@ Guest-side driver capable of making pv system calls
 
 Guest-side driver capable of speaking the Xen PV sound protocol
 
-    Status, Linux: Supported
+    Status, Linux: Supported, with caveats
+
+Linux frontend currently trusts the backend;
+bugs in the frontend which allow backend to cause mischief will not be
+considered security vulnerabilities.
 
 ## Virtual device support, host side
 
@@ -993,6 +1029,9 @@ are given the following labels:
 
     This feature is security supported
     by a different organization (not the XenProject).
+    The extent of support is defined by that organization.
+    It might be limited, e.g. like described in **Supported, with caveats**
+    below.
     See **External security support** below.
 
   * **Supported, with caveats**
-- 
2.26.2


