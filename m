Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F21283C05
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 18:06:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3052.8826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPSze-0004Zw-DA; Mon, 05 Oct 2020 16:05:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3052.8826; Mon, 05 Oct 2020 16:05:42 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPSze-0004ZX-9i; Mon, 05 Oct 2020 16:05:42 +0000
Received: by outflank-mailman (input) for mailman id 3052;
 Mon, 05 Oct 2020 16:05:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fzGi=DM=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kPSzc-0004ZN-D5
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 16:05:40 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e39f64f3-d2b4-4e74-a08e-109a9fa05756;
 Mon, 05 Oct 2020 16:05:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C443F11D4;
 Mon,  5 Oct 2020 09:05:38 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.198.23])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0E753F66B;
 Mon,  5 Oct 2020 09:05:37 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=fzGi=DM=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kPSzc-0004ZN-D5
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 16:05:40 +0000
X-Inumbo-ID: e39f64f3-d2b4-4e74-a08e-109a9fa05756
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id e39f64f3-d2b4-4e74-a08e-109a9fa05756;
	Mon, 05 Oct 2020 16:05:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C443F11D4;
	Mon,  5 Oct 2020 09:05:38 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com [10.1.198.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0E753F66B;
	Mon,  5 Oct 2020 09:05:37 -0700 (PDT)
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 0/2] tools: solve gcc 10 compilation issues
Date: Mon,  5 Oct 2020 17:02:47 +0100
Message-Id: <cover.1601913536.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1

Solve various issues in tools when compiling using a gcc version 10.0 or
greater.

Bertrand Marquis (2):
  tools: use memcpy instead of strncpy in getBridge
  tool/libx: Fix libxenlight gcc warning

 tools/libs/stat/xenstat_linux.c | 9 +++++++--
 tools/libxl/libxl_mem.c         | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

-- 
2.17.1


