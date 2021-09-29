Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD51C41C014
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 09:46:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198726.352370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVUIL-0005OM-AS; Wed, 29 Sep 2021 07:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198726.352370; Wed, 29 Sep 2021 07:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVUIL-0005MX-7L; Wed, 29 Sep 2021 07:46:25 +0000
Received: by outflank-mailman (input) for mailman id 198726;
 Wed, 29 Sep 2021 07:46:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=17VY=OT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mVUIK-0005MR-5w
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 07:46:24 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5759d530-20f9-11ec-bcdf-12813bfff9fa;
 Wed, 29 Sep 2021 07:46:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 58885224FB;
 Wed, 29 Sep 2021 07:46:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2B41513A81;
 Wed, 29 Sep 2021 07:46:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9FUICc4ZVGFRdwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 29 Sep 2021 07:46:22 +0000
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
X-Inumbo-ID: 5759d530-20f9-11ec-bcdf-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632901582; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1Tc7GaYAsTN7KMj95qPWPS6UvvWEuv9iFEBZxd/LJPY=;
	b=MryowTe2ECgIzvHCnP/meR5mUTgV4qbfb+zerpwhOKS6bgOAIM0Q2wXJfxtlw2fp7/NA0h
	LKYQ27zK8mW7dRCp78Dd4Ub9TIno1X/NVrbvkbifEB8F2R79tGLu6C0YnVo0/pBkI7F3bC
	wpeiZqleBJTS94O32zuD/8/qBteJ8M0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 0/3] include/public: update usbif.h
Date: Wed, 29 Sep 2021 09:46:17 +0200
Message-Id: <20210929074620.28495-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add some missing defines and documentation to the pvUSB header file.

Changes in V2:
- add patch 3
- minor fixes in patch 1

Juergen Gross (3):
  include/public: add possible status values to usbif.h
  include/public: add better interface description to usbif.h
  include/public: fix style of usbif.h

 xen/include/public/io/usbif.h | 377 ++++++++++++++++++++++++----------
 1 file changed, 274 insertions(+), 103 deletions(-)

-- 
2.26.2


