Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C47684AA844
	for <lists+xen-devel@lfdr.de>; Sat,  5 Feb 2022 12:08:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265990.459626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGIuY-0001SI-Bx; Sat, 05 Feb 2022 11:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265990.459626; Sat, 05 Feb 2022 11:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGIuY-0001Pu-8r; Sat, 05 Feb 2022 11:07:22 +0000
Received: by outflank-mailman (input) for mailman id 265990;
 Sat, 05 Feb 2022 11:07:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yEFf=SU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nGIuW-0001Po-0q
 for xen-devel@lists.xenproject.org; Sat, 05 Feb 2022 11:07:20 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c84c5a77-8673-11ec-8eb8-a37418f5ba1a;
 Sat, 05 Feb 2022 12:07:18 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CF933210E8;
 Sat,  5 Feb 2022 11:07:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 981B013A6D;
 Sat,  5 Feb 2022 11:07:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SfUNI2Va/mEnGgAAMHmgww
 (envelope-from <jgross@suse.com>); Sat, 05 Feb 2022 11:07:17 +0000
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
X-Inumbo-ID: c84c5a77-8673-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1644059237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TRWuygi4XX00RZd4Z/flt6YuzTCY1qHucKFqYYdqECk=;
	b=RuNzHPxI03EkbNLga0ROpvLhex6+EwI/f1oiH6I+PBPNN2m1UcO4YqHpF3T6uAU1Fi1OpY
	oAdus1gzFGNMLaaWStuTvZ+CvOk1qE/ebm0xEuMc1rJJUymh4ot6Dxy1vWgQWpJUgxLpcO
	/7B+kno00KLPDeif8jdtBn7BLQ0VWmw=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.17-rc3
Date: Sat,  5 Feb 2022 12:07:17 +0100
Message-Id: <20220205110717.16946-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.17a-rc3-tag

xen: branch for v5.17-rc3

It contains the following patches:

- 3 documentation fixes related to Xen
- a patch for enabling x2apic mode when available when running as
  hardware virtualized guest under Xen
- a cleanup and fix for a corner case of vcpu enumeration when running
  a paravirtualized Xen guest

Thanks.

Juergen





