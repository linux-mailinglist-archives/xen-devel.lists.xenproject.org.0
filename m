Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D84472A4AAD
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 17:03:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18426.43471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZymR-0000bm-Ow; Tue, 03 Nov 2020 16:03:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18426.43471; Tue, 03 Nov 2020 16:03:31 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZymR-0000bN-Lo; Tue, 03 Nov 2020 16:03:31 +0000
Received: by outflank-mailman (input) for mailman id 18426;
 Tue, 03 Nov 2020 16:03:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kZymQ-0000bH-Hc
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 16:03:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d58119f1-2a58-4dbe-8cfd-3b605b222a5a;
 Tue, 03 Nov 2020 16:03:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0700EB1FC;
 Tue,  3 Nov 2020 16:03:28 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kZymQ-0000bH-Hc
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 16:03:30 +0000
X-Inumbo-ID: d58119f1-2a58-4dbe-8cfd-3b605b222a5a
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id d58119f1-2a58-4dbe-8cfd-3b605b222a5a;
	Tue, 03 Nov 2020 16:03:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604419408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1n1R/+OcklHSrTdUTGvN7hl/2W4K85FsFtO5YTwnR5I=;
	b=No1yQy+kwToENzFVjviwHDwMFpAIfU/fVauQ6p3AonLyno+DK29O/UZ8WlaulrD/8ohNNC
	gxzuYPUZs6JJ9FKIyxZ/6UZdKMoEp6S2j4GNStKSu8jWzdqrTjbqD2TdsEQm3jGBfr4FwD
	Ki5cGCgxRHn3ERJHHXatWIbpgsF18Oo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0700EB1FC;
	Tue,  3 Nov 2020 16:03:28 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.12.4 released
To: xen-announce@lists.xenproject.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <4217a94f-2f8b-71f0-92d5-ff4662fc320c@suse.com>
Date: Tue, 3 Nov 2020 17:03:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

All,

I am pleased to announce the release of Xen 4.12.4. This is available
immediately from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.12
(tag RELEASE-4.12.4) or from the XenProject download page
https://xenproject.org/downloads/xen-project-archives/xen-project-4-12-series/xen-project-4-12-4/
(where a list of changes can also be found).

We recommend all users of the 4.12 stable series to update to this last
point release to be made by the XenProject team from this stable branch.

Regards, Jan

