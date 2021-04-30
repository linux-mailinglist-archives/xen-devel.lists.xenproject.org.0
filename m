Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B79C36F5F7
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 08:53:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120318.227555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcN0O-0000aJ-HT; Fri, 30 Apr 2021 06:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120318.227555; Fri, 30 Apr 2021 06:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcN0O-0000Zu-EI; Fri, 30 Apr 2021 06:52:04 +0000
Received: by outflank-mailman (input) for mailman id 120318;
 Fri, 30 Apr 2021 06:52:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T1Xz=J3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lcN0N-0000Zp-Cq
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 06:52:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e104fae-af50-41c8-93f9-5f61e539353f;
 Fri, 30 Apr 2021 06:52:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E754DAD5C;
 Fri, 30 Apr 2021 06:52:00 +0000 (UTC)
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
X-Inumbo-ID: 2e104fae-af50-41c8-93f9-5f61e539353f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619765521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JnBWD5NpQBfhTlzKaBLfUOVzN+GB18y/5f8KvuHQ73E=;
	b=oE56zIwZW4rPsJ8YkXgrTS1GqRAo5T4VClB9gBIWlhcbP8HDNV+0eGu6jnFl33gXgtgo6z
	WzOSoYnhCyhLhwuSsH7nhuM2jm9e4LUSRO7mMg3V/tYBAgAeI2DnuS54DNVvbtnfDzBn/I
	y6R+nZgQXGH4u0DelvbxOrEOyyI5UCI=
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.14.2 released
To: xen-announce@lists.xenproject.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <217ea779-8995-473b-17db-04170636c801@suse.com>
Date: Fri, 30 Apr 2021 08:51:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

All,

we're pleased to announce the release of Xen 4.14.2. This is available
immediately from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.14
(tag RELEASE-4.14.2) or from the XenProject download page
https://xenproject.org/downloads/xen-project-archives/xen-project-4-14-series/xen-project-4-14-2/
(where a list of changes can also be found).

We recommend all users of the 4.14 stable series to update to this
latest point release.

Regards, Jan

