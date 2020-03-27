Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC845195859
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 14:49:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHpJP-0005p7-1J; Fri, 27 Mar 2020 13:46:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KiP0=5M=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jHpJN-0005p1-G0
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 13:46:13 +0000
X-Inumbo-ID: 52a2d836-7031-11ea-b34e-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 52a2d836-7031-11ea-b34e-bc764e2007e4;
 Fri, 27 Mar 2020 13:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tdmx+9E7vh3yHnI8ivQ4yzcldCtwIVLFcPK/MQg50QM=; b=16KZ2GZTqLM7MML7Qz1yz7CpHk
 4z6Nb87sKnJCEkzAJ2ug0o7M0foCL5UAq8U7ghGOdRrheFVIShA0ibSXBEoBg7EfcQUpG0OsqyLmy
 DEmfOOewn/nOwYOPpv2GSBXybO3zhaHwVqELxWj45p5FKIzSpiZrtaefL6mMFvuiw1wM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <paul@xen.org>)
 id 1jHpJM-0001I9-Sj; Fri, 27 Mar 2020 13:46:12 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=u2f063a87eabd5f.cbg10.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <paul@xen.org>)
 id 1jHpJM-00066v-Je; Fri, 27 Mar 2020 13:46:12 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Date: Fri, 27 Mar 2020 13:46:08 +0000
Message-Id: <20200327134610.23387-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH v8 0/2] docs: Migration design documents
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Paul Durrant (2):
  docs/designs: Add a design document for non-cooperative live migration
  docs/designs: Add a design document for migration of xenstore data

 docs/designs/non-cooperative-migration.md | 280 ++++++++++++++++++++++
 docs/designs/xenstore-migration.md        | 256 ++++++++++++++++++++
 docs/misc/xenstore.txt                    |   6 +-
 3 files changed, 539 insertions(+), 3 deletions(-)
 create mode 100644 docs/designs/non-cooperative-migration.md
 create mode 100644 docs/designs/xenstore-migration.md

-- 
2.20.1


