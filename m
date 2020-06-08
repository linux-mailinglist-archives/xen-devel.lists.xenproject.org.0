Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B87AF1F1D89
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:39:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKoF-0001zE-2y; Mon, 08 Jun 2020 16:39:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=53kk=7V=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jiKoC-0001z9-W5
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:39:37 +0000
X-Inumbo-ID: a3a310f8-a9a6-11ea-b298-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3a310f8-a9a6-11ea-b298-12813bfff9fa;
 Mon, 08 Jun 2020 16:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Reply-To:Message-Id:Date:Subject:To:From:Sender:Cc:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6Kc+B0L0LNrarCLVqtqHFeGwaR1j4Y9ArTtJJdoAKvU=; b=6Zb5AwabTtDWFnPSJg18nGm64Q
 beT+tLAaEiXNzwioiF5qsVURGj8Pp+Dyl1xRJXhYocfYFkJb0cfns42u3vDMRGRCQiiAQYthFjh6C
 90sjAjiMCxCHBWaEsUSpdbwrwc61mMyZbq9vZP0Su65SSVfbvbWAVX3l/YpRQxlno5X4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jiKoC-0003WP-7X; Mon, 08 Jun 2020 16:39:36 +0000
Received: from [54.239.6.186] (helo=CBG-R90WXYV0.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jiKoB-0004WR-UD; Mon, 08 Jun 2020 16:39:36 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org,
 xen-announce@lists.xenproject.org
Subject: Xen 4.14 RC1
Date: Mon,  8 Jun 2020 17:39:34 +0100
Message-Id: <20200608163934.313-1-paul@xen.org>
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
Reply-To: xen-devel@lists.xenproject.org, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi all,

Xen 4.14 RC1 is tagged. You can check that out from xen.git:

git://xenbits.xen.org/xen.git 4.14.0-rc1

For your convenience there is also a tarball at:
https://downloads.xenproject.org/release/xen/4.14.0-rc1/xen-4.14.0-rc1.tar.gz

And the signature is at:
https://downloads.xenproject.org/release/xen/4.14.0-rc1/xen-4.14.0-rc1.tar.gz.sig

Please send bug reports and test reports to xen-devel@lists.xenproject.org.
When sending bug reports, please CC relevant maintainers and me (paul@xen.org).

As a reminder, there will be a Xen Test Day. Please see the test day schedule at
https://wiki.xenproject.org/wiki/Xen_Project_Test_Days and test instructions at
https://wiki.xenproject.org/wiki/Xen_4.14_RC_test_instructions.

  Paul Durrant


