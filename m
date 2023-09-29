Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C13857B2D53
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 09:59:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610251.949587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm8Ot-0001Ya-7S; Fri, 29 Sep 2023 07:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610251.949587; Fri, 29 Sep 2023 07:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm8Ot-0001Vf-3m; Fri, 29 Sep 2023 07:59:03 +0000
Received: by outflank-mailman (input) for mailman id 610251;
 Fri, 29 Sep 2023 07:59:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qm8Or-0001VT-Aj
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 07:59:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qm8Oq-00007U-Up; Fri, 29 Sep 2023 07:59:00 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qm8Oq-0002Zh-L0; Fri, 29 Sep 2023 07:59:00 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=iO+ntqZZAhDsHeLWQe9395Aok6MQcB2166OXkuds7pY=; b=sHjfwF
	uU0A2ZILwQ4ED65jkKApLEZE5sMNveoukDnz9Vbud3JXK2NkVKMkE+5CHM0B+khTgRHZ126Vm9Suo
	hKVywek62GZ3qss0s3XrOR/4Y8NqZanloVwUa6P66oGvm6Qkjk+fuhNTfDICArSP3MQocbJELIaT2
	Ni1tIWcCyEk=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 0/2] Prepare the tree for Xen 4.18 RC1
Date: Fri, 29 Sep 2023 08:58:55 +0100
Message-Id: <20230929075857.87092-1-julien@xen.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Hi all,

This small series is to prepare the tree for Xen 4.18 RC1.

Cheers,

Julien Grall (2):
  Config.mk pin QEMU_UPSTREAM_REVISION (prep for Xen 4.18 RC1)
  Update Xen version to 4.18-rc

 Config.mk    |  2 +-
 README       | 16 ++++++++--------
 SUPPORT.md   |  2 +-
 xen/Makefile |  2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

-- 
2.40.1


