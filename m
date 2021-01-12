Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3B92F37F5
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 19:10:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65817.116598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzO7C-0002e9-Hx; Tue, 12 Jan 2021 18:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65817.116598; Tue, 12 Jan 2021 18:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzO7C-0002dk-ER; Tue, 12 Jan 2021 18:09:58 +0000
Received: by outflank-mailman (input) for mailman id 65817;
 Tue, 12 Jan 2021 18:09:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=whw0=GP=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kzO7B-0002d9-3J
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 18:09:57 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa2a91a4-012e-4ef1-8a3c-cc5686e4d274;
 Tue, 12 Jan 2021 18:09:50 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 10CI9dt0018159;
 Tue, 12 Jan 2021 19:09:40 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id D7F99281D; Tue, 12 Jan 2021 19:09:39 +0100 (CET)
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
X-Inumbo-ID: fa2a91a4-012e-4ef1-8a3c-cc5686e4d274
Date: Tue, 12 Jan 2021 19:09:39 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: new (mostly) NetBSD patches
Message-ID: <20210112180939.GA7912@antioche.eu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1100:a00:20ff:fe1c:276e]); Tue, 12 Jan 2021 19:09:40 +0100 (MET)

Hello,
I'm about to send a new batch of patches which are mostly NetBSD-related
fixes. They replace the patches I sent in december.

As my git repo became a mess, I just started again from scratch,
hopefully getting things in a better state now. Also I followed
advices using the Xen scripts, so the required fields will hopefully be there.
I threat all of them as independant (which they are), so that I can
work on the problematic ones without the need to resend the whole set.

Roger, as this is from a new git repo, I didn't add any Reviewed-by
tag as they're not strictly the same.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

