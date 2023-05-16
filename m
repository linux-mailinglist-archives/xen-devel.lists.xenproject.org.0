Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B270705274
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 17:42:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535393.833080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pywo8-0002Ug-IR; Tue, 16 May 2023 15:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535393.833080; Tue, 16 May 2023 15:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pywo8-0002Rd-Ff; Tue, 16 May 2023 15:41:48 +0000
Received: by outflank-mailman (input) for mailman id 535393;
 Tue, 16 May 2023 15:41:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tkax=BF=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1pywo6-0002RX-J6
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 15:41:46 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28b18ef3-f400-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 17:41:44 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz4GFfZY7Z
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 16 May 2023 17:41:35 +0200 (CEST)
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
X-Inumbo-ID: 28b18ef3-f400-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1684251695; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ESkjUTCfm2BXPpE2ST2+T4JIo9QE6syo75Ajhv6NnU0fYbMl/SYsErXI/7r6OVkb1u
    qZpb9/LesThBR4KrYKoLjkr5ArkTZ2fosP9na7fkBvNE0IJ4Y4i4rHVWaneLQOCuFITC
    L1I3LmL8axkHErGhe3yWMGnmXeK0c9dqedklRfhVrOgv8hORY4TeiruoiLdH70+DTYDh
    MIWoYZSQFqPVnm5a+og8mkPWpeCNchh4Zaft+QLfl3H9D1Er3MUySkVzF4MGA2aRRorJ
    1DC9ipf5G0G+uYz35E0Js/33GKA8VT9KQAdxrb4rxEQLZ13KddiWYcmF8Tq9paS3SAWX
    6/xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1684251695;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=S4Dal8qF6Ltkztx7Q4K2kzVp9CzmK+IBPCjFoEOJkgQ=;
    b=LV0LRMi3qfDSFGDQyMcoGbj+BCCSNQpqzbxuUcMyj+S4Th+rb+kuXcnrSc+Xgs5ppy
    +FDAQEFXNBiR3sLM4Xj2HCrgbw70aXdfsoDm4Nt60AfgRvPTdripDaaJ4XpmU2dPLudG
    QxeHrK/irB6Fvtg7yTsEioa49SlgZBpvlqWCHSma27+qNmvljvccRca6OSxlyQbv3k6e
    it56BYn3XHmbz6m7okiuC7PvwoxKoz4RpGRHHuRPWgAizcIdGCMoYLfvXwjLbrL+QO8E
    ONFbwOjVkthrPLQRtAorDECC7qC8BnWyoksQ14Ngn/PT7Owwx5NMQOavM31cho2hUbir
    BOfw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1684251695;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=S4Dal8qF6Ltkztx7Q4K2kzVp9CzmK+IBPCjFoEOJkgQ=;
    b=G8agVF/GMIVsVcgOXVX9cPIqvk43n8jHda50Kd/QqeYO43VHLFNBOmrg9UYwq0H7A3
    YXs1HTjfxkaHJB37iLMADNgQXZN30jwTsO9evWi4TBUEc2XUZ+RKot65uM1w+TXSEOQd
    4VxaLFr1g7U+pHxrl57bDoI0fDi2Hixf8rYvrRuA2g2+f6mlAl/Ghn0U+RZe2yvRW1j9
    jrnZEsQ2AqBpmriXw5W//4rlB50UFFA2uIzCvbQ/FpF2xIpS/PDTuycn1fy+QfNmfpKi
    4kWSwGR//9/sHQfvmS6X0LkaWlxO0f1+cemcExZnLo1vUM2lMjQLxZyUJCSLd25LFlaD
    eRGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1684251695;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=S4Dal8qF6Ltkztx7Q4K2kzVp9CzmK+IBPCjFoEOJkgQ=;
    b=HYm53ipprvzopY8/Zxr9mYa4TIFFFrH8lc3ocyOfZfVAsuSYt9Rwe9rjgjQuQ0fHZW
    aWbJMpQysGNjShyWLACw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuznLRsvx4Sq0NeWsWjIFVg=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1] automation: update documentation about how to build a container
Date: Tue, 16 May 2023 15:41:27 +0000
Message-Id: <20230516154127.11622-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

The command used in the example is different from the command used in
the Gitlab CI pipelines. Adjust it to simulate what will be used by CI.
This is essentially the build script, which is invoked with a number of
expected environment variables such as CC, CXX and debug.

In addition the input should not be a tty, which disables colors from
meson and interactive questions from kconfig.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 automation/build/README.md | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/automation/build/README.md b/automation/build/README.md
index 2d07cafe0e..1c040533fd 100644
--- a/automation/build/README.md
+++ b/automation/build/README.md
@@ -96,7 +96,8 @@ docker login registry.gitlab.com/xen-project/xen
 make -C automation/build suse/opensuse-tumbleweed
 env CONTAINER_NO_PULL=1 \
   CONTAINER=tumbleweed \
-  automation/scripts/containerize bash -exc './configure && make'
+  CONTAINER_ARGS='-e CC=gcc -e CXX=g++ -e debug=y' \
+  automation/scripts/containerize automation/scripts/build < /dev/null
 make -C automation/build suse/opensuse-tumbleweed PUSH=1
 ```
 

