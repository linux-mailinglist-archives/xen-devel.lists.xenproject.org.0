Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4136F646916
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 07:25:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456829.714658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3AKI-000184-0E; Thu, 08 Dec 2022 06:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456829.714658; Thu, 08 Dec 2022 06:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3AKH-00015A-TI; Thu, 08 Dec 2022 06:24:09 +0000
Received: by outflank-mailman (input) for mailman id 456829;
 Thu, 08 Dec 2022 06:24:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LnEJ=4G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p3AKG-000150-6x
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 06:24:08 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea812500-76c0-11ed-91b6-6bf2151ebd3b;
 Thu, 08 Dec 2022 07:24:06 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 84B6B22CBA;
 Thu,  8 Dec 2022 06:24:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4902213416;
 Thu,  8 Dec 2022 06:24:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id va4REAWDkWOZcwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 08 Dec 2022 06:24:05 +0000
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
X-Inumbo-ID: ea812500-76c0-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670480645; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=29KpDgd6vmC5js97aK76aYrAql01eNmTPz/ekUGfRs4=;
	b=F0LYyFjQtXywoA1/1sGPOqxk2VpkmI2fqNBBYOBsMXk75GEWew1vFZDMHayFnUvClHppbS
	EeueT7CxgmDyQSNq6nSNFlg/Pe2kJnRJ1h9r8OHiWmH8j/ANkX0Qlua5FIj5GjmOyHvBKv
	SXUV1+ql9niurNyvW8dlxoLgvHIYmYw=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.1-rc9b
Date: Thu,  8 Dec 2022 07:24:04 +0100
Message-Id: <20221208062404.29189-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-xsa-6.1-rc9b-tag

xen: branch for v6.1-rc9b

It contains a single fix for the recent security issue XSA-423.

Thanks.

Juergen

 drivers/net/xen-netback/netback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Juergen Gross (1):
      xen/netback: fix build warning

