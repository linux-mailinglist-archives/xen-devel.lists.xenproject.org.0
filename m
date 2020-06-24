Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFE0207329
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 14:18:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo4MY-00066w-MT; Wed, 24 Jun 2020 12:18:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b8vz=AF=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jo4MW-00066p-VV
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 12:18:45 +0000
X-Inumbo-ID: d90c4848-b614-11ea-b7bb-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d90c4848-b614-11ea-b7bb-bc764e2007e4;
 Wed, 24 Jun 2020 12:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zRTBeYXTSwlmZB/k4eGzkfc2asK1YgI6BdQ2WNKm/8A=; b=QSZD9KM0BvHwUs7/kFXiG4Dxyx
 ncWAyDnn0bX1HmOIvII3iyDAzHfGs3sqfJAAo/KPNTiOUvdk93iZFskhETuXDupiHhfvS6gln1AxH
 PJA+r+ldLXPnb8G8n2G5FSf5P/AA/+N30yxTtDaWitT1Yb6vTM3/8xdzcn0yXTJ0VBVs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jo4MW-0000g8-5m; Wed, 24 Jun 2020 12:18:44 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=u2f063a87eabd5f.cbg10.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jo4MV-0005fi-Sx; Wed, 24 Jun 2020 12:18:44 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] fix assertion failures when using Xen
Date: Wed, 24 Jun 2020 13:18:39 +0100
Message-Id: <20200624121841.17971-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Paul Durrant <pdurrant@amazon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

Paul Durrant (2):
  xen: fix legacy 'xen-sysdev' and 'xen-backend' bus types
  xen: cleanup unrealized flash devices

 hw/i386/pc_piix.c           | 9 ++++++---
 hw/i386/pc_sysfw.c          | 2 +-
 hw/xen/xen-legacy-backend.c | 4 ++--
 include/hw/i386/pc.h        | 1 +
 4 files changed, 10 insertions(+), 6 deletions(-)

-- 
2.20.1


