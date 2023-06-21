Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C219D738C7E
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 19:00:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553031.863362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC1Bl-0005jN-DC; Wed, 21 Jun 2023 17:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553031.863362; Wed, 21 Jun 2023 17:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC1Bl-0005hP-8B; Wed, 21 Jun 2023 17:00:13 +0000
Received: by outflank-mailman (input) for mailman id 553031;
 Wed, 21 Jun 2023 17:00:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gfgj=CJ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qC1Bj-0005SN-L4
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 17:00:11 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12efd67c-1055-11ee-b236-6b7b168915f2;
 Wed, 21 Jun 2023 19:00:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id D9B18828673F
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jun 2023 12:00:06 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id xXoXG9L_JIrM; Wed, 21 Jun 2023 12:00:06 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id EAFC882856E5;
 Wed, 21 Jun 2023 12:00:05 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3xDgSFe4fRPK; Wed, 21 Jun 2023 12:00:05 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 9D0AE8285AEB;
 Wed, 21 Jun 2023 12:00:05 -0500 (CDT)
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
X-Inumbo-ID: 12efd67c-1055-11ee-b236-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com EAFC882856E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1687366806; bh=uVhDIk325qNoo5nm4Qbpq6QRiPFSopA6RAWCihnIJyI=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=oYOJbmzL2vTT942zWzruEfy55JuecYbwZBdAApT9u8IVb7sXAv6R4Mn7r0njohCFI
	 x5IgfPrpT+mcCRIk/NlYXWOBvns+zQnmIoINuI1IO9FrezAzf3hKmjODZNqZtlZqjK
	 2Xdd7FafYLauSncxE0tDMGG6fDQb0HKu86auAIMw=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 1/4] automation: Add QEMU to bullseye-ppc64le
Date: Wed, 21 Jun 2023 11:59:50 -0500
Message-Id: <e07442f76aac05398cd0115d90db8036337462e9.1687366665.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1687366665.git.sanastasio@raptorengineering.com>
References: <cover.1687366665.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add qemu-system-ppc package to the bullseye-ppc64le container to allow
running smoke tests in CI.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 automation/build/debian/bullseye-ppc64le.dockerfile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/automation/build/debian/bullseye-ppc64le.dockerfile b/automa=
tion/build/debian/bullseye-ppc64le.dockerfile
index 8a87631b52..8fad26e903 100644
--- a/automation/build/debian/bullseye-ppc64le.dockerfile
+++ b/automation/build/debian/bullseye-ppc64le.dockerfile
@@ -22,6 +22,8 @@ RUN apt-get update && \
         gcc-powerpc64le-linux-gnu \
         make \
         python3-minimal \
+        # for test phase
+        qemu-system-ppc \
         && \
         apt-get autoremove -y && \
         apt-get clean && \
--=20
2.30.2


