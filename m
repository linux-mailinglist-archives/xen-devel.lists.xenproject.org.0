Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A84C344BD0
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 17:39:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100375.191201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lONa1-00057B-Gl; Mon, 22 Mar 2021 16:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100375.191201; Mon, 22 Mar 2021 16:39:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lONa1-00056o-Cv; Mon, 22 Mar 2021 16:39:01 +0000
Received: by outflank-mailman (input) for mailman id 100375;
 Mon, 22 Mar 2021 16:39:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FSIZ=IU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lONa0-00056j-7f
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 16:39:00 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d72de622-c353-4c4c-b21b-b292c001eaba;
 Mon, 22 Mar 2021 16:38:59 +0000 (UTC)
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
X-Inumbo-ID: d72de622-c353-4c4c-b21b-b292c001eaba
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616431139;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=HoxMUdfnY8hP4fqC/GeGi36qJO4A5BdcIq5ysDQMYoE=;
  b=LjEnRKwabYGeZ5j7TtYGoqtmfn7JtbSO1lI9XB0JskJSQmZLAXHVtIZE
   bYrpGjZnHaryEzzSbq+njtvXD0Ki0umLkdJaj+84NOF3X8WYPMsIWXvYf
   i9KoZD7kt3vN7er3fbAqd2OyxdvMbdFxUF45uk8zlgOWahT+viaZWEgcC
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 1f7+OmeiNStR+oW8+BG228YJKuGMKyEwCYbzKm1Lt4vRN/r7I83St//su36Fvjxn6MCmiPO8Mq
 W0fO+wZdDnwBLR1PSk6SFTiAdZbYsN/+MIAi/xUExgpzTMmwqclmR/ZbB8IqeANMAPaFQAFR7+
 GhFd6B031Cc+D8RVWCIystDiOmIWtU5b6K5u//0M9NFrNpWqzH2vtH37s8Gcsu9jcpgx4522nw
 QHfxllLHHYSiYcjYCijKsMHeoueUvC4Gi49UDlTrLEHSWSTgKyHC0Ak/fnuu3o3sy/ST8Xdk5H
 I7k=
X-SBRS: 5.1
X-MesageID: 39825042
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:dFzSnqMKtuQJUcBcTlujsMiAIKoaSvp033AA0UdtRRtJNvGCn8
 e1k/gBkTPygjAdWHYv8OrwW5Woa3Xa6JJz/M0tLa6vNTOHhEKEJJxvhLGN/xTOACv7n9Qw6Y
 5FU4xTTOL9FkJ7i8GS2mSFOvIt2sOO/qztpeq29R1QZDpnYa1h8At1YzzzeiZLbTNbDpk0Ho
 f03Kt6jgenEE55Uu2LQl8YQuPEu9rH0LXhbBJuPW9D1CC+yRW19bX9Dx+Umi07bgoK67Ij/W
 /Z+jaJhJmejw==
X-IronPort-AV: E=Sophos;i="5.81,269,1610427600"; 
   d="scan'208";a="39825042"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	Jan Beulich <JBeulich@suse.com>
Subject: [PATCH v2 for-4.14] tools: Fix pkg-config file for libxenstore
Date: Mon, 22 Mar 2021 16:38:47 +0000
Message-ID: <20210322163847.23941-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210322162013.12639-1-andrew.cooper3@citrix.com>
References: <20210322162013.12639-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

There are no dependenices on evtchn, ctrl or gnttab.

Fixes: 1b008e99 ("tools: provide pkg-config file for libxenstore")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Juergen Gross <jgross@suse.com>
CC: Jan Beulich <JBeulich@suse.com>

v2:
 * Drop xenevtchn and xengnttab as well

This has been fixed in Xen 4.15 by the uselibs.mk logic, but 4.14 and older
cause everything linking against libxenstore to also try linking against
libxenctrl.  It also causes RPM to create unexpected dependencies between
subpackages, which is a problem when trying to separate the stable and
unstable libs.
---
 tools/xenstore/xenstore.pc.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xenstore/xenstore.pc.in b/tools/xenstore/xenstore.pc.in
index 2f64a6b824..2a278b4395 100644
--- a/tools/xenstore/xenstore.pc.in
+++ b/tools/xenstore/xenstore.pc.in
@@ -8,4 +8,4 @@ Version: @@version@@
 Cflags: -I${includedir} @@cflagslocal@@
 Libs: @@libsflag@@${libdir} -lxenstore
 Libs.private: -ldl
-Requires.private: xenevtchn,xencontrol,xengnttab,xentoolcore
+Requires.private: xentoolcore
-- 
2.11.0


