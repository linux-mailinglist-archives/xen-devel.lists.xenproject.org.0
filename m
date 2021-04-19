Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD3636459A
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 16:02:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112938.215368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYUTe-0006SZ-PW; Mon, 19 Apr 2021 14:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112938.215368; Mon, 19 Apr 2021 14:02:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYUTe-0006Rv-KY; Mon, 19 Apr 2021 14:02:14 +0000
Received: by outflank-mailman (input) for mailman id 112938;
 Mon, 19 Apr 2021 14:02:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3l5R=JQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lYUTc-0006QM-Bo
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 14:02:12 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b13ecffd-e884-429d-bb22-b875312286bf;
 Mon, 19 Apr 2021 14:02:11 +0000 (UTC)
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
X-Inumbo-ID: b13ecffd-e884-429d-bb22-b875312286bf
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618840931;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u6xZF4AS6Juh0CnMhBXmEKwxg8OoZ/J9DOH4kfOLJfA=;
  b=c53hk5+W4kVJ8d4ZUrD7cWHx8i8edF5z4sXmuXo4rGBz++MYLy+RwJn5
   Y/ZI8lIix7D9I9dsdVoGpqG8gXotvRLIofGryHP+YGj2bSNs1snLhD6iu
   XfF4SkKCv2lO4X209PSgpO5PDdQoNbNqSJc5YWv9v3YfFEnzIqx2aMmyq
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: NU+hIBYOJW1NTGbSS7SOmO7OVY1i25GCM83QCTxO9ZPCfx8JHafeLE4RGDGTRu8x/LCCSx629+
 oAxidGLERL13DGoEsuDuWD4s6YDieuMHtsrGSFtAj9iTeRSboSq7AKde4UNaC42Kqy7Vh5zg/5
 qAQ11u/sPWlf1rKj3dPp612g1TRUYn62DsTxrxNUmpX77ZZKRjKorgXexZsuw5oL7mLfpMvBDH
 2p+q4KfJPf6HvfTC1+D7vm+LCTK//C7ZgDfMvM47e1MRcwD8sXULqx7s4CHveQ5MZfrLrvFUZG
 4sE=
X-SBRS: 5.1
X-MesageID: 42017041
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:HA/5Oativ8mr/VQn9PmpCrD17skD89V00zAX/kB9WHVpW+az/v
 rBoN0w0xjohDENHEw6kdebN6WaBV/a/5h54Y4eVI3SJTXOkm2uMY1k8M/e0yTtcheOkNJ1+K
 98f8FFaOHYIkN9ia/BjDWQM9Fl+9Wf9bDtuOG29QYJcShPS4VNqzh0ERyaFEoefnggObMcGI
 CH7sRK4xqMEE5nDfiTPXUOU+jdq9CjrvuPCnRqOzcd5AaDlj+u4rLheiLouis2aD9T3awktV
 HMjg2R3NTaj9iA1hTe22XPhq42pPLdzLJ4a/Cku4wwIjXohh3AXvUCZ4G/
X-IronPort-AV: E=Sophos;i="5.82,234,1613451600"; 
   d="scan'208";a="42017041"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 3/7] x86/sysctl: Make arch_do_sysctl() compile at -Og
Date: Mon, 19 Apr 2021 15:01:28 +0100
Message-ID: <20210419140132.16909-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210419140132.16909-1-andrew.cooper3@citrix.com>
References: <20210419140132.16909-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

When compiling at -Og:

  sysctl.c: In function ‘arch_do_sysctl’:
  sysctl.c:197:19: error: ‘hcpu’ may be used uninitialized in this function[-Werror=maybe-uninitialized]
               ret = continue_hypercall_on_cpu(0, fn, hcpu);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  sysctl.c: In function ‘arch_do_sysctl’:
  sysctl.c:197:19: error: ‘fn’ may be used uninitialized in this function[-Werror=maybe-uninitialized]
               ret = continue_hypercall_on_cpu(0, fn, hcpu);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

These look to be caused by insufficient analysis around the !ret conditionals.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/sysctl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index aff52a13f3..6ac09bac79 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -150,8 +150,8 @@ long arch_do_sysctl(
         unsigned int cpu = sysctl->u.cpu_hotplug.cpu;
         unsigned int op  = sysctl->u.cpu_hotplug.op;
         bool plug;
-        long (*fn)(void *);
-        void *hcpu;
+        long (*fn)(void *) = NULL;
+        void *hcpu = NULL;
 
         switch ( op )
         {
-- 
2.11.0


