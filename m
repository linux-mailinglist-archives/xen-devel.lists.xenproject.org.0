Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A15531BF85B
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 14:44:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU8Xe-0001sN-3O; Thu, 30 Apr 2020 12:43:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ng0l=6O=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jU8Xb-0001s3-US
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 12:43:47 +0000
X-Inumbo-ID: 3b1bef31-8ae0-11ea-9a3e-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b1bef31-8ae0-11ea-9a3e-12813bfff9fa;
 Thu, 30 Apr 2020 12:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rb4tS9NJ8SZ1ohKOUTAAEEo8r3jML2X8FNBVDKVIVCs=; b=QlXevOI90bsWZ6a7NQ7g8ECkab
 4nVn+X/d1jNT2D8e63D3Qh+reGVDcA/kKWGtW7zo8S4fuJfkKuXg9+P+D3M/6a8eRrxdnKve1vwFc
 5dDENMVTOn9PV8ImE6Oj+XUvKpKnoDpI2a7CLTUOKaA541UBNwL/G/OFXElInGnpyNrw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jU8XZ-0002qD-PL; Thu, 30 Apr 2020 12:43:45 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jU8XZ-0001dc-En; Thu, 30 Apr 2020 12:43:45 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 0/2] xen: Allow EXPERT mode to be selected from the menuconfig
 directly
Date: Thu, 30 Apr 2020 13:43:41 +0100
Message-Id: <20200430124343.29886-1-julien@xen.org>
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
Cc: Julien Grall <jgrall@amazon.com>, julien@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

Hi all,

This small series is meant to make easier to experiment when using Xen.
See patch #2 for more details.

Cheers,

Julien Grall (2):
  xen/Kconfig: define EXPERT a bool rather than a string
  xen: Allow EXPERT mode to be selected from the menuconfig directly

 xen/Kconfig                     | 11 +++++++++--
 xen/Kconfig.debug               |  2 +-
 xen/Makefile                    |  1 -
 xen/arch/arm/Kconfig            | 10 +++++-----
 xen/arch/x86/Kconfig            |  6 +++---
 xen/common/Kconfig              | 14 +++++++-------
 xen/common/sched/Kconfig        |  2 +-
 xen/drivers/passthrough/Kconfig |  2 +-
 8 files changed, 27 insertions(+), 21 deletions(-)

-- 
2.17.1


