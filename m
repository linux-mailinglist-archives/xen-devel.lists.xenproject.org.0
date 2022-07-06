Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE34568A23
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 15:53:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362254.592213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o95Su-00073K-LY; Wed, 06 Jul 2022 13:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362254.592213; Wed, 06 Jul 2022 13:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o95Su-00071J-Ie; Wed, 06 Jul 2022 13:53:16 +0000
Received: by outflank-mailman (input) for mailman id 362254;
 Wed, 06 Jul 2022 13:53:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R25+=XL=citrix.com=prvs=1793071f0=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1o95St-00071D-OX
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 13:53:15 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9a77d89-fd32-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 15:53:14 +0200 (CEST)
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
X-Inumbo-ID: f9a77d89-fd32-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657115594;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8PUQhGIEdViSZ8UN1+9n2akq3Ms/dOJCQVsz0k3zrAg=;
  b=WGhtt4W7GwvNeetrW9Hr3QsgiDcsVbx0huGE/FFuOt3m8HpgwG8/EM9o
   bk5a9LCSYyU1JQjQ+XtTWybyclNSgvhUzRvV02BC6DjqtNhBlnDQ7QmmO
   Qr/nKy9bNKnFgqTrMe2Vb5SLddz/VsvL4AaRBxMfz8F5HxU8TlaUaJYiK
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 75190483
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LxY8Tq0zikgrNele/fbD5cxxkn2cJEfYwER7XKvMYLTBsI5bpzVRx
 jNJW2+PbquIZzTxL992PonipkNUvsWAzNZiTQtupC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1Ek/NtTo5w7Rj2tEw34Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1cidvzSRgQEJeds+o/UEV3Gix4ZYdZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHEMYQFtXwm4SzfCf8+aZvCX7/L9ZlT2zJYasVmQquHN
 pJFOWEHgBLoSE1kfXU1DM4F29ynvljvcw9KqluXqv9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0z7HxUbOdq32TeDtHW2iYfnkTvgXYMOFJWx7vNwnECI3WsXFQEXUl2g5/K+jyaWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8U44gyQzqvf4y6CG3MJCDVGbbQOr9QqTDYn0
 luImdLBBjF1trCRD3WH+d+pQSiaYHZPazVYPGldEFVDs4KLTJwPYgznX+okU66qt/PPSBr+4
 TPWgyEzge05kptev0mkxmwrkw5At7CQEFNqv12PDj//hu9qTNX7PtL1sDA3+d4Fdd/EFQfZ4
 RDojuDEtIgz4YexeDthqQnnNJWg/L67PTLVmjaD9LFxpm32qxZPkW29iQySxXuF0e5eIFcFm
 GeJ5WtsCGZ7ZRNGl5NfbYOrENgNxqP9D9njXf28RoMQP8cpKFHdpno3Ox74M4XRfK8EyPhXB
 HtmWZz0USZy5VpPllJauNvxIZd0n3tjlAs/tLjwzgi90Kr2WUN5vYwtaQPUBshgtfvsiFyMr
 753aprRoz0CAbKWX8Ui2dNKRbz8BSNjVc6eRg0+XrPrHzeK70l9UqCPmuJ8INM090mX/8+Rl
 kyAtoZj4AKXrRX6xc+iMxiPtJuHsU5DkE8G
IronPort-HdrOrdr: A9a23:qRREpqivthd/jDXY17Sszl1GpXBQXtQji2hC6mlwRA09TySZ//
 rOoB19726StN9xYgBYpTnuAtjifZqxz/FICOoqTNOftWvdyQmVxehZhOOIqVCNJ8SXzJ866U
 4KSchD4bPLY2SS9fyKhTWFLw==
X-IronPort-AV: E=Sophos;i="5.92,250,1650945600"; 
   d="scan'208";a="75190483"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH] MAINTAINERS: Make Daniel P. Smith sole XSM maintainer
Date: Wed, 6 Jul 2022 14:52:45 +0100
Message-ID: <20220706135245.64915-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

While mail hasn't been bouncing, Daniel De Graaf has not been
responding to patch submissions or otherwise interacting with the
community for several years.  Daniel Smith has at least been working
with the code, and is a regular member of our community; and he has
agreed to step up into the role.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
CC: Wei Liu <wl@xen.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8a99526784..e12c499a28 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -649,8 +649,7 @@ F:	xen/common/trace.c
 F:	xen/include/xen/trace.h
 
 XSM/FLASK
-M:	Daniel De Graaf <dgdegra@tycho.nsa.gov>
-R:	Daniel P. Smith <dpsmith@apertussolutions.com>
+M:	Daniel P. Smith <dpsmith@apertussolutions.com>
 S:	Supported
 F:	tools/flask/
 F:	xen/include/xsm/
-- 
2.25.1


