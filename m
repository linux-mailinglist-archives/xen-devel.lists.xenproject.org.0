Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD0C4D53DF
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 22:48:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288617.489481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSQd2-0005n6-4E; Thu, 10 Mar 2022 21:47:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288617.489481; Thu, 10 Mar 2022 21:47:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSQd2-0005k7-0Z; Thu, 10 Mar 2022 21:47:24 +0000
Received: by outflank-mailman (input) for mailman id 288617;
 Thu, 10 Mar 2022 21:47:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AS8o=TV=citrix.com=prvs=0616ffc5a=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nSQd0-0005k1-7S
 for xen-devel@lists.xen.org; Thu, 10 Mar 2022 21:47:22 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a74445ca-a0bb-11ec-8eba-a37418f5ba1a;
 Thu, 10 Mar 2022 22:47:19 +0100 (CET)
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
X-Inumbo-ID: a74445ca-a0bb-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646948839;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=F0ajbJVK25pe+VkSUwxWniOGGKx/gjVYAmZB4qZdk/Y=;
  b=Zs3yqJQTff/8VD2Q5Otiba5tIroUB9jyJI3EkG/gou726hVGhJXz4gvq
   1jf4gFCqFkFOoH3xFYPhoUeXzBd4jfdlWTZvi1eZfpeug3uETqwFO8NRY
   6U1VxaN7RZ34nweXWDh6Y8yJpzdKIa8vAtbGdq0OVjSTVji9s2KzxfF93
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65959406
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:krvzH6qd2z7sQBN1NnWJywlNDadeBmIoZRIvgKrLsJaIsI4StFCzt
 garIBmHO66OMGSkL4gnPIrg8UoOvcXVx9BlSAdqrSszRXgV+ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvW4
 Iuq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBPajCgcgCYhViDzh6MYlH+e/jPUqZrpnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI4jzeF/krB7zeRaHD/fdT3Ssqh9AIFvHbD
 yYcQWQyPUmRP0URUrsRIMJlu7ekomDOTxZ3q3+vg+1u22Li8RMkhdABN/KKI4fXFK25hH2wv
 Xna9m70BhUbMt23yjef9H+owOjVkkvTR4Y6BLC+sPlwjzW7xHEXCRAQfUu2p7++kEHWc8JSL
 QkY9zQjqYA29Ve3VZ/tUhv+p2SL1jY8VtxKAqsF4QeC4qPO5kCSAW1sZjxLZcEitcQ2bSc3z
 VLPlNTsbQGDq5XMFyjbrO3N62rvZ25FdgfueBPoUyMG5tf6jJ4CgijTV9JvNK+03vnpKxfvl
 mXiQDcFu50fissC1qOe9F/Bgi6xqpWhcjPZ9jk7TUr+sFonOdfNi5iArAGCsK0edNrxokyp4
 SBc8/Vy+tziGn1keMalZOwWVI+k6P+eWNE3qQ4+RsJxn9hBFpPKQGyx3N2cDBs4WirnUWWwC
 KM2he+3zMYCVJdNRfUrC79d8+xwkcDd+S3ND5g4lOZmbJlrbxOg9ypzf0OW1G2FuBFyzf9uY
 sjEIZ70VChy5UFbINyeHrZ1PVgDnH1W+I8ubcqjk0TPPUS2OBZ5tovpwHPRN7tkvctoUS3e8
 spFNtvi9vmseLaWX8UjyqZKdQpiBSFiXfje8pULHsbeclsOMDxwUJf5nOJ+E7GJaowIz48kC
 FnmARQGoLc+7FWaQTi3hodLM+q+A8wg8SplYUTB/z+AghAeXGpm149HH7NfQFXt3LYLISJcJ
 xXdR/i9Pw==
IronPort-HdrOrdr: A9a23:p50QfK/oPW3OS6xNGHxuk+DcI+orL9Y04lQ7vn2ZLiYlFfBw9v
 re+MjzsCWetN9/Yh0dcLy7V5VoIkm9yXcW2+cs1N6ZNWGN1VdAR7sC0aLShxHmBi3i5qp8+M
 5bAs1D4QTLfDtHZBDBkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.90,171,1643691600"; 
   d="scan'208";a="65959406"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xen.org>
CC: George Dunlap <george.dunlap@citrix.com>, Henry Wang <Henry.Wang@arm.com>,
	Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: [PATCH] MAINTAINERS: Propose Henry Wang as the new release manager
Date: Thu, 10 Mar 2022 21:46:55 +0000
Message-ID: <20220310214655.14510-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

ARM has proposed Henry Wang as a release manager for 4.17.  Signify
this by giving him maintainership over CHANGELOG.md.

Below is an introduction given by Bertrand Marquis:

Henry Wang is an open-source software engineer at Arm focusing on the
hypervisor and virtualization technology. Before joining the
AIS-Hypervisor team, he was one of the leading Arm contributors of the
Rust-VMM and the Cloud Hypervisor community.  He is the Arm reviewer
of the Cloud Hypervisor project. His work includes basic project
enabling on Arm platform, Arm device emulation, advanced features
support on Arm and bug fixes.

After joining the AIS-Hypervisor team at Arm, he has been involved in Xen feature
development on Arm in various areas, including:

1. Xen Arm MPAM extension research and PoC: Ongoing, the design will
share in xen-devel soon.

2. Port of Xen to Arm MPU systems: Working together with Penny Zheng
on coding and testing, will be soon sent to xen-devel.

3. Static Xen heap on Arm: Work done but depend on the direct mapping
series from Penny Zheng, will be upstreamed in the next weeks.

4. Virtio PoC for Xen on Arm using kvmtool as the Xen virtio backend:
Work done, including the enabling of the virtio and the virtio
performance tuning.

5. Participated in code reviews and discussions in xen-devel,
including the foreign memory mapping series from EPAM, etc.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
CC: Henry Wang <Henry.Wang@arm.com>
 CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d4b06f5bfb..6a097b43eb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -255,6 +255,7 @@ S:	Supported
 F:	xen/drivers/passthrough/arm/smmu-v3.c
 
 Change Log
+M:	Henry Wang <Henry.Wang@arm.com>
 R:	Community Manager <community.manager@xenproject.org>
 S:	Maintained
 F:	CHANGELOG.md
-- 
2.35.1


