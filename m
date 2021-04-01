Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A13351108
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 10:43:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104166.198902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRsun-00061o-O0; Thu, 01 Apr 2021 08:42:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104166.198902; Thu, 01 Apr 2021 08:42:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRsun-00061S-Kt; Thu, 01 Apr 2021 08:42:57 +0000
Received: by outflank-mailman (input) for mailman id 104166;
 Thu, 01 Apr 2021 08:42:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRsul-00061K-Ez
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 08:42:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2611743-2902-4a0b-9f3c-89f79843af36;
 Thu, 01 Apr 2021 08:42:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 87D8DAEFB;
 Thu,  1 Apr 2021 08:42:52 +0000 (UTC)
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
X-Inumbo-ID: d2611743-2902-4a0b-9f3c-89f79843af36
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617266572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UR99GWV6w+2q0MVEXspBRN36LxCrMHtPwkQFye7fZwA=;
	b=P7Iuk6XST4U71Ju1Ih12WwbfoK+xfwNqrWPPabqhrHcp2bcZfCXc6Jch8toeN6tQVrEWNz
	wT1kumXvux1m3Ho+AOPkbE2Au0kR6yul+N/aEUIIdNSSsMGCBz2qBH+9r9dnyZS2Mtz2/6
	2CPl0Q0vtAMhz/p+YflX54VmdPyWJKs=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/6] VT-d: assorted cleanup
Message-ID: <157e4a65-6d0b-7ea8-1c23-cd393c8c0d7f@suse.com>
Date: Thu, 1 Apr 2021 10:42:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This is effectively the other "half" of what was submitted as 4.15
candidates in "[PATCH 0/4][4.15?] VT-d: mostly S3 related corrections".

1: improve save/restore of registers across S3
2: don't open-code dmar_readl()
3: bring print_qi_regs() in line with print_iommu_regs()
4: qinval indexes are only up to 19 bits wide
5: avoid pointless use of 64-bit constants
6: drop unused #define-s

Jan

