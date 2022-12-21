Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BF5652F04
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 10:58:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467687.726717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7vrI-0006Hd-BF; Wed, 21 Dec 2022 09:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467687.726717; Wed, 21 Dec 2022 09:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7vrI-0006Fq-8Q; Wed, 21 Dec 2022 09:57:56 +0000
Received: by outflank-mailman (input) for mailman id 467687;
 Wed, 21 Dec 2022 09:57:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VCPi=4T=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1p7vrG-0006Ds-RB
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 09:57:54 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id efcef5d0-8115-11ed-91b6-6bf2151ebd3b;
 Wed, 21 Dec 2022 10:57:54 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F281AD7;
 Wed, 21 Dec 2022 01:58:34 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D6C03F71E;
 Wed, 21 Dec 2022 01:57:51 -0800 (PST)
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
X-Inumbo-ID: efcef5d0-8115-11ed-91b6-6bf2151ebd3b
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 0/2] cppcheck rule 20.7 fixes
Date: Wed, 21 Dec 2022 09:57:40 +0000
Message-Id: <20221221095742.54859-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

In this serie there are some fixes for the rule 20.7.

The analysed build is arm64, to reproduce the reports here the command:

./xen/scripts/xen-analysis.py --cppcheck-misra --run-cppcheck -- CROSS_COMPILE="aarch64-linux-gnu-" XEN_TARGET_ARCH="arm64" O=/path/to/artifacts_folder


Luca Fancellu (2):
  public: misra rule 20.7 fix on errno.h
  public: misra rule 20.7 fix on memory.h

 xen/include/public/errno.h  | 2 +-
 xen/include/public/memory.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.17.1


