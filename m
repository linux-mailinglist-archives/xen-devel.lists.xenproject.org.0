Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C379E6252
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 01:38:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849367.1263968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJMLE-0007zs-Az; Fri, 06 Dec 2024 00:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849367.1263968; Fri, 06 Dec 2024 00:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJMLE-0007xy-6d; Fri, 06 Dec 2024 00:37:08 +0000
Received: by outflank-mailman (input) for mailman id 849367;
 Fri, 06 Dec 2024 00:04:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbYF=S7=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tJLpp-0004eF-Jt
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 00:04:42 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afaaf2ec-b365-11ef-99a3-01e77a169b0f;
 Fri, 06 Dec 2024 01:04:39 +0100 (CET)
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
 by drago1i.eurecom.fr with ESMTP; 06 Dec 2024 01:04:38 +0100
Received: from localhost.localdomain (88-183-119-157.subs.proxad.net
 [88.183.119.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtps.eurecom.fr (Postfix) with ESMTPSA id 7DC922FE2;
 Fri,  6 Dec 2024 01:04:38 +0100 (CET)
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
X-Inumbo-ID: afaaf2ec-b365-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1733443479; x=1764979479;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Tbs/cru7vG9b5aNG/B4oTjXsxhug6sFN01k8JSOtV1s=;
  b=nT/ppDDi+uds5hW8QgMDyCXnSW7FAeKKjVp4nbmuAm7IpW8E+m6IvwX7
   cTHANhxFXHRv6BHm3ditAtfXGTA7ShZkhaX2mwFkXgS8cOz/0KH1qmSP8
   wefGLv9t0ZSRATFjBfgieWgPqZhp6Z2nIQTKpoPOVrwA8J2XcTD4BinQQ
   g=;
X-CSE-ConnectionGUID: +O3iwYlSSMStF0/1kk67AA==
X-CSE-MsgGUID: FTBKlSlpRWCs1Sc9S8JWeA==
X-IronPort-AV: E=Sophos;i="6.12,211,1728943200"; 
   d="scan'208";a="28052174"
From: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
Subject: [PATCH 0/1] tools/libacpi: clear out compilation warnings
Date: Fri,  6 Dec 2024 01:00:43 +0100
Message-ID: <20241206000422.331015-1-Ariel.Otilibili-Anieli@eurecom.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This is my first patch to the list; your feedback is much appreciated.

I am new to Xen; my aim is to improve my knowledge of virtualization.

While compiling from scratch, I came across these warnings. If this patch makes
sense, I will have a look at other ASL warnings I spotted.

Thank you,

Ariel Otilibili (1):
  tools/libacpi: clear out compilation warnings

 tools/libacpi/mk_dsdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.47.1


