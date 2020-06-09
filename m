Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F93F1F40E2
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 18:30:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jih81-0001Af-Rh; Tue, 09 Jun 2020 16:29:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h0up=7W=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jih80-00019z-Ke
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 16:29:32 +0000
X-Inumbo-ID: 64b1e3b0-aa6e-11ea-bca7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64b1e3b0-aa6e-11ea-bca7-bc764e2007e4;
 Tue, 09 Jun 2020 16:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CFfR8OPlKnnlTFL8namRQAlsqp9E0KgFPJ1Ttff1kYg=; b=Y7AjTfYl+205kCb99lwmI4Xsl8
 uWp62PQZ2antftiVrdy37WpIvELgo5pE/YXhKxcDTGfTsx75hLIwraA+v6f5ARJnOnSqitkWBzOf4
 O0h2ykRrfquM6Yol5LmiOmIT5uWwlm2NhxNAdV8xOZcZ67ExyMGw9pvuM2zgV2U3h9+Y=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jih7w-0003W1-MX; Tue, 09 Jun 2020 16:29:28 +0000
Received: from [54.239.6.185] (helo=CBG-R90WXYV0.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jih7w-0003N4-Bh; Tue, 09 Jun 2020 16:29:28 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH-for-4.14 2/2] CHANGELOG: add revised kdd handshake (supporting
 Windows 7, 8, and 10)
Date: Tue,  9 Jun 2020 17:29:22 +0100
Message-Id: <20200609162922.14679-3-paul@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200609162922.14679-1-paul@xen.org>
References: <20200609162922.14679-1-paul@xen.org>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Community Manager <community.manager@xenproject.org>,
 Paul Durrant <pdurrant@amazon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
--
Cc: Community Manager <community.manager@xenproject.org>
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index cb1566ea5b..43fd260156 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -20,6 +20,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - libxl support for running qemu-xen device model in a linux stubdomain.
  - New 'domid_policy', allowing domain-ids to be randomly chosen.
  - Option to preserve domain-id across migrate or save+restore.
+ - Support in kdd for initial KD protocol handshake for Win 7, 8 and 10 (64 bit).
 
 ## [4.13.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.13.0) - 2019-12-17
 
-- 
2.17.1


