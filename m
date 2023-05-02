Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 280B66F4B1B
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 22:15:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528818.822447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptwOs-0005pc-Sv; Tue, 02 May 2023 20:15:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528818.822447; Tue, 02 May 2023 20:15:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptwOs-0005nh-Pz; Tue, 02 May 2023 20:15:02 +0000
Received: by outflank-mailman (input) for mailman id 528818;
 Tue, 02 May 2023 20:15:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d5QU=AX=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1ptwOr-0005nb-3W
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 20:15:01 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.218]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03a698ed-e926-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 22:15:00 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz42KEleXg
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 2 May 2023 22:14:47 +0200 (CEST)
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
X-Inumbo-ID: 03a698ed-e926-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1683058487; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Ds0jttF+aKpnyizFvLwPcgYyQRhFfzMmVaTRFZFNctH8VH0kFLcpAqsfezmvXBRCYz
    KdHcAvL8a5xQxKV3oJ4eFsD9UpZKLkQJ0B3RifRzgEJCB9MSttCR6Vzo64PXAldLsrBc
    Wz07E2ECscbZkA5fovapg8KST8mN89S1n52mNib0tFWFXVUOeBmSxH7SET4Q7MgUQom3
    tu8yYbmqek/+H7PJCALNsWv/K6qdJ1Ujd203jQM7vnuFJ5NkoPZnCZ+Bw+Fk2eRpNA6E
    B2Q2wMD/a10MG4miOUoWb362pgJ0ynvRiq1jXFXazKxDb3PnokK50/j+CXGvKi4BnALs
    JmfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683058487;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=HaTckfyLjqk40qDuyIqmlzT69DZDd16J9hzv/RfFXdw=;
    b=dsxLrTGvJ23T0cLr9YlQYcXuwdqpEWfDYiLJ94z/QIJ6twmuzGXMtrvyN6ftwhIIYG
    cfYul3FNjCmKCe/qiQMwMckCgNWTmJ8WSpOXPjJp/77pGtBy0vUu1VM6YQvDHcdQI247
    Ng8R0AEne0dExBspNBKkpofLCNvuCXph5HkmY1aSB2iE/T7J3Onbc2wGrBCKFMJAEtKy
    52eKKRcbrln15szUJw+GSGCZiSKSPQUJEe0xD749jR3H52DVyaISMj+5qlzfGVI8zXyU
    EJC4xpoRO9h6WzGmNluT2N/aEl8wYKCuxPtym6chdTBQHnK/+HYHHty1aF3Fm/Kb0KBa
    hqVA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683058487;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=HaTckfyLjqk40qDuyIqmlzT69DZDd16J9hzv/RfFXdw=;
    b=OXtbbvbKPXlMkGJF8ZaYajgpWeNfBs5y3Qf140/IE3LzHJPYCTOyQS3fS780NHuQ5j
    wKE5wO7VZgpvTzvymXqXSFRv2IFmMJ2lMH5CK9QJgEOu/c91IdiILy331uVW7b8XwSu6
    PMHFbPeI78m579EtlPF1iiCxl01o5b0/00uJQybU4YdMj+POgy+n6QqXVbbCSjEI9Sm0
    Aq3Gz5e041ng0qtZ7WMw4XXgRPtyx05VRzPaRGno9mNg9Q0S5azvMnIPXA+wqMmaUnp8
    ZClndfo8k0LLVapdnt19BAbUxbNGI0cTeZpys1u70TOiw40CosQ6wvChDjtgtmxQCx8V
    858w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683058487;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=HaTckfyLjqk40qDuyIqmlzT69DZDd16J9hzv/RfFXdw=;
    b=L5mt69J7gmNxWp5lL7WZVDPa68NiGMEPAUz+f0Z9EBN68KWNTHWFAEWe3zLIl2gfLE
    P6ezV3ZGiZBn8qyoISDA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4wqVv7FZ8tH5EUSbMVU80kUr7f4QlYaI60OjHt/Q=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1] automation: provide example for downloading an existing container
Date: Tue,  2 May 2023 20:14:44 +0000
Message-Id: <20230502201444.6532-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 automation/build/README.md | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/automation/build/README.md b/automation/build/README.md
index 2d07cafe0e..8ad89a259a 100644
--- a/automation/build/README.md
+++ b/automation/build/README.md
@@ -12,6 +12,12 @@ can be pulled with Docker from the following path:
 docker pull registry.gitlab.com/xen-project/xen/DISTRO:VERSION
 ```
 
+This example shows how to pull the existing container for Tumbleweed:
+
+```
+docker pull registry.gitlab.com/xen-project/xen/suse:opensuse-tumbleweed
+```
+
 To see the list of available containers run `make` in this
 directory. You will have to replace the `/` with a `:` to use
 them.

