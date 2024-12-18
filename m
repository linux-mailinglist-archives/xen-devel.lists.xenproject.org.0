Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A99779F70EC
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 00:39:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860749.1272736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tO3cE-0007fA-41; Wed, 18 Dec 2024 23:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860749.1272736; Wed, 18 Dec 2024 23:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tO3cE-0007cm-0o; Wed, 18 Dec 2024 23:38:06 +0000
Received: by outflank-mailman (input) for mailman id 860749;
 Wed, 18 Dec 2024 23:38:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v9KU=TL=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tO3cB-0007cb-HN
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 23:38:03 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e509b66-bd99-11ef-a0d7-8be0dac302b0;
 Thu, 19 Dec 2024 00:38:01 +0100 (CET)
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
 by drago1i.eurecom.fr with ESMTP; 19 Dec 2024 00:38:00 +0100
Received: from localhost.localdomain (88-183-119-157.subs.proxad.net
 [88.183.119.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtps.eurecom.fr (Postfix) with ESMTPSA id 0DFCB220D;
 Thu, 19 Dec 2024 00:37:59 +0100 (CET)
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
X-Inumbo-ID: 1e509b66-bd99-11ef-a0d7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734565081; x=1766101081;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TbLPYOCWNBMuc69GXdHkTQIYIZddX/mOQ08vzXVrC4o=;
  b=y/Fd2gGY1l5DQTx/ROQamhbsYu+UC4xV/iNfrSfaBWai7S7a6HLE2uem
   HVGnfcg4GZ6yZM0/QdjGKfTXu0Lpt74Souqc/J2TEPORBNbq5DeMdJzBU
   WsOKFqZXVuX8Rqr9r5UPsCZ/j0PbL0WR2S0Dvj7QLkYxSEEIYXxzJkbVQ
   I=;
X-CSE-ConnectionGUID: lDmKyavMS2elcNs3yReexA==
X-CSE-MsgGUID: xeM/ET2ETRGL25cnclu7KA==
X-IronPort-AV: E=Sophos;i="6.12,246,1728943200"; 
   d="scan'208";a="28246236"
From: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
To: xen-devel@lists.xenproject.org
Cc: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/1] xen/common: Remove dead code
Date: Thu, 19 Dec 2024 00:34:51 +0100
Message-ID: <20241218233659.573195-2-Ariel.Otilibili-Anieli@eurecom.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This patch fixes Coverity-ID 1055253. Its history says a fix was required.

Thank you,

Link: https://scan5.scan.coverity.com/#/project-view/63598/10426?selectedIssue=1055253

Ariel Otilibili (1):
  xen/common: Remove dead code

 xen/common/gzip/inflate.c | 2 --
 1 file changed, 2 deletions(-)

-- 
2.47.1


