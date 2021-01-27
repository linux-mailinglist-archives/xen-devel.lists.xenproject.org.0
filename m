Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 760CE3060BB
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 17:13:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76233.137475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4nR5-0007Z9-Dx; Wed, 27 Jan 2021 16:12:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76233.137475; Wed, 27 Jan 2021 16:12:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4nR5-0007Yk-Ak; Wed, 27 Jan 2021 16:12:51 +0000
Received: by outflank-mailman (input) for mailman id 76233;
 Wed, 27 Jan 2021 16:12:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4nR4-0007Yf-4J
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 16:12:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 535f0a9d-6f75-40a0-ad5b-bb2d70213c83;
 Wed, 27 Jan 2021 16:12:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BAB8CAAC6;
 Wed, 27 Jan 2021 16:12:47 +0000 (UTC)
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
X-Inumbo-ID: 535f0a9d-6f75-40a0-ad5b-bb2d70213c83
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611763967; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RLYaX2uBFS02n8F0ItXYo4/tpuz9p98GWPGhfgLHXB4=;
	b=Ms4C+Cx+ErZ3L3N2GajJGOVk6MfSZVi3F4Hsde4YryVfdRBg/lgFa+GQp8TWIJZquunfHH
	bNHQG/HH76+o/yOIczovEfm9qprmO8RqPamkUckFCp0lbLEClkjWSGoxUfUctleULPE3HZ
	kw/CkWYnO3gm61CjxvfYIYm1My6oUhk=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] MAINTAINERS: correct split libxl paths
Message-ID: <c76fdb98-e9b6-81cf-63ca-57d5c18bd0d2@suse.com>
Date: Wed, 27 Jan 2021 17:12:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The other half of the originally combined code lives in tools/libs/util/,
not tools/libs/guest/ (which was split off of libxc).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -363,8 +363,8 @@ M:	Ian Jackson <iwj@xenproject.org>
 M:	Wei Liu <wl@xen.org>
 M:	Anthony PERARD <anthony.perard@citrix.com>
 S:	Supported
-F:	tools/libs/guest/
 F:	tools/libs/light/
+F:	tools/libs/util/
 F:	tools/xl/
 
 LIVEPATCH

