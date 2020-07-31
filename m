Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDAA2347B4
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 16:26:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Vz7-00045U-Th; Fri, 31 Jul 2020 14:26:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S/xS=BK=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k1Vz6-00045J-Qb
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 14:26:08 +0000
X-Inumbo-ID: c63e343c-d339-11ea-abc3-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c63e343c-d339-11ea-abc3-12813bfff9fa;
 Fri, 31 Jul 2020 14:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AP1vBeaCfx9AP7a24e34n/oJJkJNPvuMBU2kMllpL5g=; b=hqK3dbOBOpsHdb8/jm0f/wWaDY
 mUW4jWn0L+NpK83xAwILRtEFrpxQArNFr4MnDQXBSQtbDwYLZgkNdSZtnHPCCgVgXIU7EcpP8MVdq
 0bPnVsZfc92nkJ7JRylyLu6JeFCmK2rZ0hzyGF32gbKDZz3RiMKV2ssrJ/ZiDSSiERGk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k1Vz5-0003Zv-HQ; Fri, 31 Jul 2020 14:26:07 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k1Vz5-0005vI-7r; Fri, 31 Jul 2020 14:26:07 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 0/2] epte_get_entry_emt() modifications
Date: Fri, 31 Jul 2020 15:26:02 +0100
Message-Id: <20200731142604.30149-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

Paul Durrant (2):
  x86/hvm: set 'ipat' in EPT for special pages
  x86/hvm: simplify 'mmio_direct' check in epte_get_entry_emt()

 xen/arch/x86/hvm/mtrr.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>
-- 
2.20.1


