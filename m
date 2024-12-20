Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6FE9F971F
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 17:59:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861885.1273916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOgLB-0008Ex-Mz; Fri, 20 Dec 2024 16:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861885.1273916; Fri, 20 Dec 2024 16:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOgLB-0008CT-KR; Fri, 20 Dec 2024 16:59:05 +0000
Received: by outflank-mailman (input) for mailman id 861885;
 Fri, 20 Dec 2024 16:59:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MWOG=TN=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tOgL9-0008Bw-9w
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2024 16:59:04 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b52dad4b-bef3-11ef-99a3-01e77a169b0f;
 Fri, 20 Dec 2024 17:59:00 +0100 (CET)
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
 by drago1i.eurecom.fr with ESMTP; 20 Dec 2024 17:58:59 +0100
Received: from localhost.localdomain (88-183-119-157.subs.proxad.net
 [88.183.119.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtps.eurecom.fr (Postfix) with ESMTPSA id EAAAF249B;
 Fri, 20 Dec 2024 17:58:58 +0100 (CET)
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
X-Inumbo-ID: b52dad4b-bef3-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734713940; x=1766249940;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6ayZlOYbibzJJ0P/4FSByg1LP3Aw1qXMWugsZckGMwU=;
  b=IOJEdC2Ae8pEQA48j2xpeetc99fUgKsHN5SizhRSahKRJJpnjyokln3S
   OJqzX0nsXZp+NT9lzBmlpjUXvK9A3scHUMdEHfMrhSOeV46b2Efw2e548
   51gDpz/lh5vP32Ur9Frf7VZCUtNt61ZgSGzVKySJqE1W8oIH9cRumgOQG
   E=;
X-CSE-ConnectionGUID: ABl+VTsURsqIcznGdeA1sg==
X-CSE-MsgGUID: pyKCtXeXQrKPT36fqiP3Bg==
X-IronPort-AV: E=Sophos;i="6.12,251,1728943200"; 
   d="scan'208";a="28280238"
From: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
To: xen-devel@lists.xenproject.org
Cc: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>,
	Doug Goldstein <cardoe@cardoe.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 0/2] tools/libs,xen/tools: remove dead code
Date: Fri, 20 Dec 2024 17:55:00 +0100
Message-ID: <20241220165837.937976-1-Ariel.Otilibili-Anieli@eurecom.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This series addresses the Coverity IDs 1056148, 1056149, & 1458052.

Thank you,

Ariel Otilibili (2):
  tools/libs: remove dead code
  xen/tools: remove dead code

 tools/libs/light/libxl_create.c | 1 -
 tools/libs/light/libxl_device.c | 1 -
 xen/tools/kconfig/expr.c        | 2 --
 3 files changed, 4 deletions(-)

-- 
2.47.1


