Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EB5195E47
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 20:08:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHuIu-00010X-5Y; Fri, 27 Mar 2020 19:06:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FIC2=5M=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jHuIr-0000zi-Uk
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 19:06:01 +0000
X-Inumbo-ID: ff52fcb0-705d-11ea-8a1a-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff52fcb0-705d-11ea-8a1a-12813bfff9fa;
 Fri, 27 Mar 2020 19:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A5/yRqpDle8l763oaT8smryDNkJY/BvcZwORzqmqDmY=; b=Ur+czrQkdLOCxj9Mxh6pTs6Hno
 CC2Kx4x97v5KOrsLaMfY42q3+SWB7eWkejt96cq4X9/d5W5tF4a5tWMe8Og7lnBXNxjSLZlhKc6YQ
 Vt2FiU1vJJsEmewCbgH83Rj/yJBSHpvgVc+GstS4VUl2/Th6b3iTOKyo6GRdTzK7s1PA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jHuIp-0000HS-Vd; Fri, 27 Mar 2020 19:05:59 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jHuIp-0008GW-Lg; Fri, 27 Mar 2020 19:05:59 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Fri, 27 Mar 2020 19:05:43 +0000
Message-Id: <20200327190546.21580-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH 0/3] xen/x86: Simplify ioapic_init()
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
Cc: julien@xen.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

Hi all,

The main goal of this small series is to simplify ioapic_init().

Cheers,

Julien Grall (3):
  xen/x86: ioapic: Use true/false in bad_ioapic_register()
  xen/x86: ioapic: Rename init_ioapic_mappings() to init_ioapic()
  xen/x86: ioapic: Simplify ioapic_init()

 xen/arch/x86/apic.c           |  2 +-
 xen/arch/x86/io_apic.c        | 67 +++++++++++++++++------------------
 xen/include/asm-x86/io_apic.h |  2 +-
 3 files changed, 34 insertions(+), 37 deletions(-)

-- 
2.17.1


