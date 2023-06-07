Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9817263ED
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 17:16:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544855.850934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6ut2-0005HI-Mn; Wed, 07 Jun 2023 15:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544855.850934; Wed, 07 Jun 2023 15:15:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6ut2-0005DM-GJ; Wed, 07 Jun 2023 15:15:48 +0000
Received: by outflank-mailman (input) for mailman id 544855;
 Wed, 07 Jun 2023 15:06:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/iFR=B3=anastas.io=shawn@srs-se1.protection.inumbo.net>)
 id 1q6ukP-0003y0-T5
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 15:06:53 +0000
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef1ac626-0544-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 17:06:53 +0200 (CEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id F3BA63F089;
 Wed,  7 Jun 2023 08:06:50 -0700 (PDT)
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
X-Inumbo-ID: ef1ac626-0544-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anastas.io; s=mail;
	t=1686150411; bh=l1qqAGFyMyk7B24/OER4BemZKz0tyFRaVZ+91zT92kg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YEYkaS+YpSJGJ3G6VP8YsIMlwG802JU0ekWnglk6ZzsiW3NGY0JM790pAPbCVItIs
	 u9blG88k0ulXvy4+sv6/IPrCnsUrhdgvUG8AstC/RXWAbVyw/gw8eaAPMHi6a4jrEr
	 nZ79GxAT3R+h9ZUmVopkNMrWVB5OL4CeipuGURURJ2s0eYEJZZjGBJvfhKWrcBak59
	 FLnE40UgT1KJ3w/ZrHMbrZYzBc+l0t0/Svq2NGlALasqkl0h+i6U5m9ddTiq7wrzFk
	 5X7bmi3aFLq4Zk6PrZOcSgrw7UgB+z1MkWA7aqvDseDrpVjCcc6+YeQRAttRd7s/yY
	 nHfAfCSd+guFA==
From: Shawn Anastasio <shawn@anastas.io>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Shawn Anastasio <shawn@anastas.io>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Shawn Anastasio <shawnanastasio@raptorengineering.com>
Subject: [PATCH 3/3] maintainers: Add PPC64 maintainer
Date: Wed,  7 Jun 2023 10:06:34 -0500
Message-Id: <2ec38b52d944919934b2326a1924200aa954008d.1686148363.git.shawn@anastas.io>
In-Reply-To: <cover.1686148363.git.shawn@anastas.io>
References: <cover.1686148363.git.shawn@anastas.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Shawn Anastasio <shawnanastasio@raptorengineering.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1bb7a6a839..bcd36f9019 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -451,6 +451,9 @@ M:	Wei Liu <wl@xen.org>
 S:	Supported
 T:	git https://xenbits.xenproject.org/git-http/ovmf.git
 
+PPC64
+M:	Shawn Anastasio <sanastasio@raptorengineering.com>
+
 POWER MANAGEMENT
 M:	Jan Beulich <jbeulich@suse.com>
 S:	Supported
-- 
2.30.2


