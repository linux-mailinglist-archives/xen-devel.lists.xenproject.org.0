Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E58DE1F40E4
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 18:30:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jih7x-0001AA-Be; Tue, 09 Jun 2020 16:29:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h0up=7W=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jih7v-00019z-R6
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 16:29:27 +0000
X-Inumbo-ID: 62d5c4da-aa6e-11ea-b7bb-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62d5c4da-aa6e-11ea-b7bb-bc764e2007e4;
 Tue, 09 Jun 2020 16:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FxzKaqjwqHv+BWtl18dHoTgwvh6fvBsKBrSkPMFtPTU=; b=x5heI+/OXIZeaoQjNx9ahJVdA7
 kKedph6R+iOhV4bySY2aL2hCMIOktUmG4n5YhKjkwb1to5P/oQHdWQfiH5t0A0PILk5pA/0ar3l8C
 Xh4Xkrd96aOI6wBFd3nC7sYjPJjtTvJnvAeGuiFj+fuuYDDXOfE9JCqcjp7QWrBznQIY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jih7u-0003Vt-O1; Tue, 09 Jun 2020 16:29:26 +0000
Received: from [54.239.6.185] (helo=CBG-R90WXYV0.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jih7u-0003N4-Dx; Tue, 09 Jun 2020 16:29:26 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH-for-4.14 0/2] CHANGELOG additions
Date: Tue,  9 Jun 2020 17:29:20 +0100
Message-Id: <20200609162922.14679-1-paul@xen.org>
X-Mailer: git-send-email 2.17.1
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
  CHANGELOG: add 'domid_policy' and domid preservation on migrate
  CHANGELOG: add revised kdd handshake (supporting Windows 7, 8, and 10)

 CHANGELOG.md | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.17.1


