Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C062C41773A
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 17:04:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195456.348170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTmkY-0007vC-D4; Fri, 24 Sep 2021 15:04:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195456.348170; Fri, 24 Sep 2021 15:04:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTmkY-0007sh-5z; Fri, 24 Sep 2021 15:04:30 +0000
Received: by outflank-mailman (input) for mailman id 195456;
 Fri, 24 Sep 2021 15:04:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VJv2=OO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mTmkW-0007sV-6u
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 15:04:28 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5e813c8-1d48-11ec-bae9-12813bfff9fa;
 Fri, 24 Sep 2021 15:04:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 891232243C;
 Fri, 24 Sep 2021 15:04:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 62B2513C0A;
 Fri, 24 Sep 2021 15:04:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 25YzFvroTWHvWwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 24 Sep 2021 15:04:26 +0000
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
X-Inumbo-ID: b5e813c8-1d48-11ec-bae9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632495866; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HQBiBcdcCvlRqPJN3Rt7DD3yXpK+oxbfPfUN/MgrAX4=;
	b=kHf9WiHLhYIbQZXBGb5fIfXQ80vYkOCHNwpoD3yXIsVKPAZ5t5Qj++D5huwubmewKKqrEK
	3BJ7GxsRjRiRJePOmXVyLTpwmHAnCNJfvjUVsDseVfrQ7sco2BgHXnKnirVfdjC57QdK7p
	RpJJj+5gjjGlT/RYmdxbOQOCue1j8No=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/2] include/public: update usbif.h
Date: Fri, 24 Sep 2021 17:04:22 +0200
Message-Id: <20210924150424.10047-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add some missing defines and documentation to the pvUSB header file.

Juergen Gross (2):
  include/public: add possible status values to usbif.h
  include/public: add better interface description to usbif.h

 xen/include/public/io/usbif.h | 171 ++++++++++++++++++++++++++++++++++
 1 file changed, 171 insertions(+)

-- 
2.26.2


