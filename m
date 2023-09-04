Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 751A279128F
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 09:51:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595003.928471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd4Lr-0002nE-4J; Mon, 04 Sep 2023 07:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595003.928471; Mon, 04 Sep 2023 07:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd4Lr-0002kH-0J; Mon, 04 Sep 2023 07:50:27 +0000
Received: by outflank-mailman (input) for mailman id 595003;
 Mon, 04 Sep 2023 07:50:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tTqt=EU=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1qd4Lq-0002kB-6W
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 07:50:26 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.220]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b42ac553-4af7-11ee-8783-cb3800f73035;
 Mon, 04 Sep 2023 09:50:23 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.8.2 AUTH)
 with ESMTPSA id jfc75bz847oBZYD
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 4 Sep 2023 09:50:11 +0200 (CEST)
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
X-Inumbo-ID: b42ac553-4af7-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; t=1693813811; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=d+fsvdg7mLPRwfJHnuJYWdGchcBAzedIMUyodNw1ZIhUM2xg7A8vFTNXgirJyfNs1V
    zzim4fEs+k2LPOMBQSe64Bx5EaOl8LiGk/gD9NBeAnUUM+qu7CsAsON/IqK3UlTgHyIu
    tPQTjhtevfV7pFSDwwpBsYAuo6Si5whbFy8Vfi7/DETsm7xpp9Z2xQEn3iP7ke9tQymm
    9Vt+cZxLdaDeCdzk9N1vZaZFp5Qph/fwNm2O6VIoPs1Pm8rkC50T1hwoVGsBtfvzHlGn
    V5Rr+cEgPYNT9m+CdMPX5uKakwA/hbGeMKbHfKwUbz+7+G0M8FQiJ27SI5LiOvWWtnWC
    rjtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1693813811;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=j4vHCbUNWtJmIeF4inWFPx/sQq3nAuoXCYUyC3yjMLo=;
    b=B9+/A+On5mP5S7xllAlDV5b8biWZO4HQgVq/0y6VtEH1zr5a39FPIjsVfFhijiac0v
    TLdxF+kIpOff/WjV+rrFYQV+JufbbFP6dZCpsj/2He+cuugyDS+WrLBscYfZGP2RK0/6
    Ylrt+XBQBWfOWZAVG4DnJgT/LEiYiBvCNYOupn5d7gBgKCqhiIEMNYHBYJO/q4dDCCrb
    C9HsMV/+DCPpqx7QXE3n3f290Opgjlj3VEV9r88ZqJgKvNuUXjQrMz+//PEa1RooaTjn
    A+tFJB4YcWXFwXU8WtFqhS2mxDoLfb7EbgQp3ZvDwLs0J5QF/4MXEVNkPD7Fw6y2glRu
    u+QA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1693813811;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=j4vHCbUNWtJmIeF4inWFPx/sQq3nAuoXCYUyC3yjMLo=;
    b=Itg3HkgNa0L0GKw38gry3/YJF47xLKGu2yAqcGY9HnApDQ5IN5bheJrxeoSxfI0Cf1
    NBU34w8evkQrR1zvN8JVb6Acvhu72dn/g0TpwHCaKVL/NUxTYGSKTgigavd4dO7jTTqC
    afz/qt5tVAPeJkJtHQT9M7F3WjiC/3zIACrp+bkfCvzhTSApHGkZm19wQ8ZgwRLojXU/
    zqzJ41g/Ih3lgcHU/kLczw/yiZI8YhrJHNiRNr+hb9RU5bMIjd4WRlHAsljN5RpMLcaH
    jd53ItnixQd3B6GuxedOHbq79TG0dB5/8OogiUoZJOF2E8Jm9idA8z/6I4u4Anw+fqyg
    3uEA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1693813811;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=j4vHCbUNWtJmIeF4inWFPx/sQq3nAuoXCYUyC3yjMLo=;
    b=7Yzc/nesnvK6n8LbN3kr+Vlqdof/t227lFUJ2S0SMc9NegQ0zp0e1mMhH7T2te8Jr5
    fF7uD103f0CDB+0DY5Cw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4xrVn7F5otYd+QgnvMgMBBq+8hhN3EzOMmjnoZDw=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1] automation: add awk to opensuse images
Date: Mon,  4 Sep 2023 09:50:08 +0200
Message-Id: <20230904075008.2049-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Some awk binary is used in many places during build,
make sure it is part of the image.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 automation/build/suse/opensuse-leap.dockerfile       | 1 +
 automation/build/suse/opensuse-tumbleweed.dockerfile | 1 +
 2 files changed, 2 insertions(+)

diff --git a/automation/build/suse/opensuse-leap.dockerfile b/automation/build/suse/opensuse-leap.dockerfile
index 79de83ac20..98ee42970d 100644
--- a/automation/build/suse/opensuse-leap.dockerfile
+++ b/automation/build/suse/opensuse-leap.dockerfile
@@ -21,6 +21,7 @@ RUN zypper install -y --no-recommends \
         diffutils \
         discount \
         flex \
+        gawk \
         gcc \
         gcc-c++ \
         git \
diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
index abb25c8c84..aed81f0240 100644
--- a/automation/build/suse/opensuse-tumbleweed.dockerfile
+++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
@@ -21,6 +21,7 @@ RUN zypper install -y --no-recommends \
         diffutils \
         discount \
         flex \
+        gawk \
         gcc \
         gcc-c++ \
         git \

