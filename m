Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61834675FDE
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 23:00:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482186.747573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIzQk-0002Bj-SU; Fri, 20 Jan 2023 22:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482186.747573; Fri, 20 Jan 2023 22:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIzQk-00029F-OJ; Fri, 20 Jan 2023 22:00:14 +0000
Received: by outflank-mailman (input) for mailman id 482186;
 Fri, 20 Jan 2023 22:00:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vlkl=5R=citrix.com=prvs=3778cfab1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pIzQj-000297-0E
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 22:00:13 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce1235cb-990d-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 23:00:11 +0100 (CET)
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
X-Inumbo-ID: ce1235cb-990d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674252011;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=BMNzXhVJVhIQdPw7Pe3ULx8YFfeG4MP+Aq00oYn5wLU=;
  b=P8uyxF1a9uEPq+iipJtK3qiq8cnhDZOxbPqE8TbTlrXrbtzvPj4gl4hH
   3n3SgPdPFbkLbQtLq6njUp9x2vJ2M5qvSPIGx9W8ks+SDrclurCCPurgE
   XF90y5xbOvi6h/IzIaWRsLpzPp89yO6JtsKTpk5QlugxcNQXyxIzvRB16
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 93551029
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:EaV9mqCBQPy3vhVW/+Pjw5YqxClBgxIJ4kV8jS/XYbTApDkm0GcOm
 2McCm2AaPfeajagLdBwaNzi908PuZ7Rx9cwQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GpC5gRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwxshSE35Mr
 qwiLQswQSmGoeSa4O2+Vbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9K4fXGJwNxBfwS
 mTu1XvAX0hCNP+k0WC4zW2Qnc3VwzmnV9dHfFG/3qEz2wDCroAJMzUJUXOrrP//jVSxM/pEM
 FAd8Ccqqak09WSoQ8P7Uhn+p2SL1jY8VtxKAqsF4QeC4qPO5kCSAW1sZjxcbN0rsucmSDps0
 UWG9/v5CDoqvLCLRHa18raPsSj0KSUTNXUFZyIPUU0C+daLiKMZgw/LT91jOLWoldCzEjb1q
 w1mtwBn2e9V15RSkfzmoxae2WnESoX1ohAd2ivyTH2ntVNDYbWYSLWtz173zalFM9PMJrWeh
 0Qsl8+b5eEIKJiCki2RXekAdI2UC+a53C702gA2QcR4n9i50zv6JN0LvmkiTKt8GpxcEQIFd
 nM/ru+4CHV7GHKxJZF6bIuqYyjB5fixTI+1Phw4gzcnX3SQSONk1Hs0DaJ144wLuBJ0+ZzTw
 b/BLa6R4Y8yUMyLNgaeSeYHyqMMzSsj327VTp2T5035jubEPy/IEOdZaAPmggUFAEWs+l29H
 zF3bpvi9vmieLemPnm/HXA7czjm0kTX9bip8pcKJ4Zv0yJtGX07Cu+5/F/SU9UNokihrc+Rp
 ivVchYBmDLCaYjvdV3ihoZLNOm+Av6SbBsTYUQRALpf8yN8Odr2t/pFLctfkHtO3LUL8MOYh
 sItI62oasmjgByek9jBRfERdLBfSSk=
IronPort-HdrOrdr: A9a23:kH8cS6inl64t8KHUV6NY8qS5lHBQXiwji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPk3I/OrrBEDuexzhHPJOj7X5eI3SPjUO21HYS72Kj7GSoAEIcheWnoJgPO
 VbAs1D4bXLZmSS5vyKhDVQfexA/DGGmprY+ts3zR1WPH9Xg3cL1XYJNu6ZeHcGNDWvHfACZe
 OhDlIsnUvcRZwQBP7LfkUtbqz4iPDgsonpWhICDw5P0njzsdv5gISKaCRxx30lIkly/Ys=
X-IronPort-AV: E=Sophos;i="5.97,233,1669093200"; 
   d="scan'208";a="93551029"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH] Changelog: Add details about new features for SPR
Date: Fri, 20 Jan 2023 22:00:04 +0000
Message-ID: <20230120220004.7456-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Henry Wang <Henry.Wang@arm.com>

A reminder to everyone, write the changelog as it happens, rather than
scrambling to remember 8 months of development just as the release is
happening.
---
 CHANGELOG.md | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 675413971360..b116163b62c5 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -6,6 +6,14 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
 ## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
 
+### Added
+ - On x86, support for features new in Intel Sapphire Rapids CPUs:
+   - PKS (Protection Key Supervisor) available to HVM/PVH guests.
+   - VM-Notify used by Xen to mitigate certain micro-architectural pipeline
+     livelocks, instead of crashing the entire server.
+   - Bus-lock detection, used by Xen to mitigate (by rate-limiting) the system
+     wide impact of a guest misusing atomic instructions.
+
 ## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.17.0) - 2022-12-12
 
 ### Changed
-- 
2.11.0


