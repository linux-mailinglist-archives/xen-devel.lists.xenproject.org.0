Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C234557556D
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 20:54:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367775.598901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oC3y5-0007eu-Jm; Thu, 14 Jul 2022 18:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367775.598901; Thu, 14 Jul 2022 18:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oC3y5-0007co-HB; Thu, 14 Jul 2022 18:53:45 +0000
Received: by outflank-mailman (input) for mailman id 367775;
 Thu, 14 Jul 2022 18:53:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4joA=XT=citrix.com=prvs=1872ec3d0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oC3y4-0007ci-4z
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 18:53:44 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46c2b0b5-03a6-11ed-bd2d-47488cf2e6aa;
 Thu, 14 Jul 2022 20:53:42 +0200 (CEST)
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
X-Inumbo-ID: 46c2b0b5-03a6-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657824822;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=PYjZibqlUc5HapZ3z5TXoIsV/PSL5eJB/GaF84eWiGU=;
  b=Vr3UTERrfbmbRFn7dnav6nlLl7aVHt3q3T8dyiA92SZfnuhz2TgZea0R
   rEXmuOibRh2PovipcyJg44LUhePFv+Kt6qUKIqhBYVDkhlc0O52ofxiUA
   rJ627iVenQ7hB9krUp9e73ttxwiOyROAWiJXmQAk2enunv2y5KmSecdwo
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 78398029
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Fl4eR6mFWdlN1vXnvjcAwKTo5gynJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOXmyFb6mMZDD1KNx3YNvl9B9V78PdxtVqSAU5/Ck0EiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8uWo4ow/jb8kk3462u4GhwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2k3ZYZEqtd3Dlps3
 tBFJBsPdU6J3dyflefTpulE3qzPLeHuNYIb/Hph0SvYHbAtRpWrr6fivIECmm1q34YXQKiYN
 5FxhTlHNXwsZzVmPFsNBY14t+CvnnTlKBVTqU6PpLpx6G/WpOB0+Oe9a4uFIobbLSlTtm2Zg
 3Lp3Wb5OTAXOdnY7BOVrUuRisaayEsXX6pNTeblp5aGmma72Wg7GBAQE1yhrpGRiFO6Wt9ZA
 1wZ/Gwpt6da3FewUtD3Uhm8oXiFlh0RQdxdF6s98g7l4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9a1iQ67OVpjOaIjUOICkJYipscOcey4C9+sdp1EuJF4s9Vv7u5jHoJd3u6
 zHSp3RutrUctuwg+/i31lLc3Tj2mLGcG2bZ+T7rsnKZAhJRPdD4ONH5sQWCtZ6sP67CEADf4
 SFsd9y2qblXUMrTzHHlrPAlRunB2hqTDNHLbbeD9bEF/i/lxXOsdJs4DNpWdBYwaZZsldMEj
 SbuVeJtCHx7ZiLCgVdfOd7ZNijT5fGI+S7Zfv7VdMFSRZN6aRWK+ipjDWbJgT2yzxNzzflgY
 8/AGSpJMZr9If09pAdaus9HieN7rszA7Tm7qW/HI+SPjuPFOS/9pUYtO1qSdOEphJ65TPHu2
 48HbaOikkwHOMWnO3m/2dNCdjgicClkba0aXuQKL4Zv1CI9Qzp/YxIQqJt8E7FYc1N9zbqSp
 C3iBxcIlzISRxTvcG23V5yqU5u3Nb4XkJ7xFXBE0YqAs5T7XbuS0Q==
IronPort-HdrOrdr: A9a23:F6a1K66YsO7U24MI0wPXwMrXdLJyesId70hD6qhwISY6TiX4rb
 HWoB1173/JYVoqNE3I3OrwXZVoIkmsk6Kdg7NhXotKNTOO0ADDQb2Kr7GSpwEIcxeOkdK1vp
 0AT0ERMrLN5CBB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.92,272,1650945600"; 
   d="scan'208";a="78398029"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 3/2] README: State POSIX compatibility as a requirement for AWK
Date: Thu, 14 Jul 2022 19:53:05 +0100
Message-ID: <20220714185305.29507-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220714143907.25938-1-anthony.perard@citrix.com>
References: <20220714143907.25938-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

In particular, we support FreeBSD and NetBSD build environments, and some
Linux build environments use MAWK over GAWK anyway.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
---
 README | 1 +
 1 file changed, 1 insertion(+)

diff --git a/README b/README
index 5e55047ffd9e..89a1d0b43c4c 100644
--- a/README
+++ b/README
@@ -48,6 +48,7 @@ provided by your OS distributor:
       - For ARM 64-bit:
         - GCC 5.1 or later
         - GNU Binutils 2.24 or later
+    * POSIX compatible awk
     * Development install of zlib (e.g., zlib-dev)
     * Development install of Python 2.6 or later (e.g., python-dev)
     * Development install of curses (e.g., libncurses-dev)
-- 
2.11.0


