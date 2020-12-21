Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7856A2DF9C9
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 09:14:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57306.100244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krGKq-00055H-R3; Mon, 21 Dec 2020 08:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57306.100244; Mon, 21 Dec 2020 08:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krGKq-00054s-Nq; Mon, 21 Dec 2020 08:14:28 +0000
Received: by outflank-mailman (input) for mailman id 57306;
 Mon, 21 Dec 2020 08:14:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DEM5=FZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1krGKo-00054U-Lv
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 08:14:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 648089ca-1edb-4fc2-8a44-6254df8a2611;
 Mon, 21 Dec 2020 08:14:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A8745AD2D;
 Mon, 21 Dec 2020 08:14:19 +0000 (UTC)
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
X-Inumbo-ID: 648089ca-1edb-4fc2-8a44-6254df8a2611
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608538459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=k1CVJF3Sk2QqVmwE2sP6B1lIgUt4I6fNKccFw5kHOwA=;
	b=uU0bld4WoPlJbSQ1qW1nTC/6t/YGkD59SV3fqm/S5QKOEIouYAa9oMPq4VaVKxL8/u6hp3
	YY4R+bzeVkB0KQ2cP0I/HMBpN4plkuLOHIQrlhJCYmBv86rmmggAcf647DFaWqb+Fhuoc0
	xL2Z99MARad0o7VjmLZjsBhBco5aP68=
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.14.1 released
To: xen-announce@lists.xenproject.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <f00d676e-6fb5-1417-7c16-845171bab6b5@suse.com>
Date: Mon, 21 Dec 2020 09:14:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

All,

we're pleased to announce the release of Xen 4.14.1. This is available
immediately from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.14
(tag RELEASE-4.14.1) or from the XenProject download page
https://xenproject.org/downloads/xen-project-archives/xen-project-4-14-series/xen-project-4-14-1/
(where a list of changes can also be found).

We recommend all users of the 4.14 stable series to update to this
first point release.

Regards, Jan

