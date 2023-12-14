Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99590812F0F
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 12:44:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654486.1021393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDk8V-0000wh-Px; Thu, 14 Dec 2023 11:44:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654486.1021393; Thu, 14 Dec 2023 11:44:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDk8V-0000ua-Mx; Thu, 14 Dec 2023 11:44:15 +0000
Received: by outflank-mailman (input) for mailman id 654486;
 Thu, 14 Dec 2023 11:44:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=57RS=HZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rDk8V-0000uU-3f
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 11:44:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a912ab2-9a76-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 12:44:14 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id D6C814EE073A;
 Thu, 14 Dec 2023 12:44:12 +0100 (CET)
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
X-Inumbo-ID: 1a912ab2-9a76-11ee-98e9-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 0/5] address remaining violations of MISRA C:2012 Rule 11.9
Date: Thu, 14 Dec 2023 12:44:05 +0100
Message-Id: <cover.1702553835.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

this series resolves violations of MISRA C:2012 Rule 11.9. After this series is
applied the rule has no violations on both ARM and x86.

Nicola Vetrini (5):
  xen/hvm: use NULL as a null pointer constant
  x86/ioapic: use NULL as a null pointer constant
  xen/acpi: Use NULL as a null pointer constant
  x86/hvm: dom0: use helper to get sizeof struct field
  xen/wait: address violations of MISRA C Rule 11.9

 xen/arch/x86/hvm/dom0_build.c      | 3 +--
 xen/arch/x86/include/asm/hvm/irq.h | 2 +-
 xen/arch/x86/io_apic.c             | 4 ++--
 xen/common/wait.c                  | 4 ++--
 xen/include/acpi/acmacros.h        | 2 +-
 xen/include/public/hvm/save.h      | 8 ++++----
 6 files changed, 11 insertions(+), 12 deletions(-)

-- 
2.34.1

