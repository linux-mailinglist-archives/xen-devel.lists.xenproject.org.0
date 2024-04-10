Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 594C489FBC7
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 17:37:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703374.1099021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rua0I-0007bB-38; Wed, 10 Apr 2024 15:36:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703374.1099021; Wed, 10 Apr 2024 15:36:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rua0H-0007Yg-Vc; Wed, 10 Apr 2024 15:36:49 +0000
Received: by outflank-mailman (input) for mailman id 703374;
 Wed, 10 Apr 2024 15:36:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRyK=LP=localhost=root@srs-se1.protection.inumbo.net>)
 id 1rua0H-0007KL-Ff
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 15:36:49 +0000
Received: from localhost (ip-201.net-81-220-136.rev.numericable.fr
 [81.220.136.201]) by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 25484fe0-f750-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 17:36:49 +0200 (CEST)
Received: by localhost (Postfix, from userid 0)
 id E1467E3200; Wed, 10 Apr 2024 17:36:48 +0200 (CEST)
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
X-Inumbo-ID: 25484fe0-f750-11ee-b907-491648fe20b8
From: Andrei Semenov <andrei.semenov@vates.fr>
To: xen-devel@lists.xenproject.org
Cc: Andrei Semenov <andrei.semenov@vates.fr>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 0/2] AMD SEV initial work
Date: Wed, 10 Apr 2024 17:36:35 +0200
Message-Id: <cover.1712759753.git.andrei.semenov@vates.fr>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1712759753.git.andrei.semenov@vates.fr>
References: <cover.1712759753.git.andrei.semenov@vates.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

///HERE YOU GO

Andrei Semenov (2):
  Implemented AMD SEV discovery and enabling.
  Implemented Amd Secure Processor device driver

 xen/arch/x86/cpu/amd.c                 |  53 ++
 xen/arch/x86/hvm/svm/Makefile          |   1 +
 xen/arch/x86/hvm/svm/sev.c             |   4 +
 xen/arch/x86/include/asm/cpufeature.h  |   3 +
 xen/arch/x86/include/asm/cpufeatures.h |   2 +
 xen/arch/x86/include/asm/msr-index.h   |   1 +
 xen/arch/x86/include/asm/psp-sev.h     | 655 ++++++++++++++++++++
 xen/arch/x86/include/asm/sev.h         |  11 +
 xen/drivers/Kconfig                    |   2 +
 xen/drivers/Makefile                   |   1 +
 xen/drivers/crypto/Kconfig             |  10 +
 xen/drivers/crypto/Makefile            |   1 +
 xen/drivers/crypto/asp.c               | 808 +++++++++++++++++++++++++
 xen/include/xen/types.h                |   2 +-
 14 files changed, 1553 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/x86/hvm/svm/sev.c
 create mode 100644 xen/arch/x86/include/asm/psp-sev.h
 create mode 100644 xen/arch/x86/include/asm/sev.h
 create mode 100644 xen/drivers/crypto/Kconfig
 create mode 100644 xen/drivers/crypto/Makefile
 create mode 100644 xen/drivers/crypto/asp.c

-- 
2.35.3


