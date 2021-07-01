Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B283D3B901E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 11:57:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148353.274243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRU-0007wa-Vt; Thu, 01 Jul 2021 09:57:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148353.274243; Thu, 01 Jul 2021 09:57:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRU-0007rS-QB; Thu, 01 Jul 2021 09:57:08 +0000
Received: by outflank-mailman (input) for mailman id 148353;
 Thu, 01 Jul 2021 09:57:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lytRT-0004r4-Fz
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:57:07 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05bcbd22-3dea-4a3b-a0ca-18bda5380d99;
 Thu, 01 Jul 2021 09:56:54 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx619uh5Mn
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 11:56:43 +0200 (CEST)
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
X-Inumbo-ID: 05bcbd22-3dea-4a3b-a0ca-18bda5380d99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625133403;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=+KbVruLtdIEtwG93Soc7D+UJBCIYv9cMILQskmOXes4=;
    b=D7SisCzfa2rafDqJS+Cmj1d+KIdVX6sD5wo/ADBI8YzE11YqWd4yX3vfLjVoUlZz7t
    D+JpnF79BDH8B8kztS+G+l95eXmYfQTfZF5WjWSLWJmH/Q0gfRaDOKbbOikCdMgX4yDG
    46MaGdrgIep0sk9B/gYuRl/tg0ygFUZuzOUnK/X/4Wgp0fZXtDveil6JgzMfdQtQem8P
    f+k6PAwPyg+ZJlN1kEJsoWTOzHYhaxQ6SmhcXEFSFMmcPPPPiBLgT58+El2Qb0ZtCU83
    taMYjCtjJx8tRQQwNAjSvtc/AYJdDlHRikICCtf/mpzPsNc3z5bLy/4Hy0nqF9Bl0+rt
    kMJQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5lqlz7EsstGyDcxK3Mbajr+SQKopp1Cb0CyyaZQQ=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210701 08/40] MAINTAINERS: add myself as saverestore maintainer
Date: Thu,  1 Jul 2021 11:56:03 +0200
Message-Id: <20210701095635.15648-9-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210701095635.15648-1-olaf@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I touched it last.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8a52a03969..36dc634958 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -381,6 +381,12 @@ R:	Juergen Gross <jgross@suse.com>
 S:	Supported
 F:	tools/libs/
 
+LIBSAVERESTORE:
+M:	Olaf Hering <olaf@aepfle.de>
+S:	Supported
+F:	tools/include/xensaverestore.h
+F:	tools/libs/saverestore/
+
 LIBXENLIGHT
 M:	Ian Jackson <iwj@xenproject.org>
 M:	Wei Liu <wl@xen.org>

