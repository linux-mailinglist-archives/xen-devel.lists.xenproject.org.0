Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2A92A4587
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 13:48:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18302.43289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZvjW-0006zS-6s; Tue, 03 Nov 2020 12:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18302.43289; Tue, 03 Nov 2020 12:48:18 +0000
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
	id 1kZvjW-0006z3-3I; Tue, 03 Nov 2020 12:48:18 +0000
Received: by outflank-mailman (input) for mailman id 18302;
 Tue, 03 Nov 2020 12:48:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kZvjU-0006ye-Ka
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 12:48:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 00b55428-4144-4d6d-aca8-6e0c8b08d64c;
 Tue, 03 Nov 2020 12:48:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1423EABF4;
 Tue,  3 Nov 2020 12:48:10 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kZvjU-0006ye-Ka
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 12:48:16 +0000
X-Inumbo-ID: 00b55428-4144-4d6d-aca8-6e0c8b08d64c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 00b55428-4144-4d6d-aca8-6e0c8b08d64c;
	Tue, 03 Nov 2020 12:48:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604407690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Bb6NVLYqpVmYabYL6BOTpVfhp2o8pN3uG0+yWcEyIQ8=;
	b=G+9iN9EGEt6TnbIECLM2YqgbvAzGk47zid855sfHF4PgqqmF5K3U27XrX2ujEMyQxVRXbD
	2flQS3sG8GFvMY1QnHtiiZ3ywL0vxOKTNlREXB9l3FCwXQd7purATD5WBZsmr+GIySmn4E
	9hBwVOfGMASJ3ANInbnFnhgALL68Pgc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1423EABF4;
	Tue,  3 Nov 2020 12:48:10 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.13.2 released
To: xen-announce@lists.xenproject.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <ed219f15-479b-5d06-c835-eb4f4c64db3a@suse.com>
Date: Tue, 3 Nov 2020 13:48:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

All,

I am pleased to announce the release of Xen 4.13.2. This is available
immediately from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.13
(tag RELEASE-4.13.2) or from the XenProject download page
https://xenproject.org/downloads/xen-project-archives/xen-project-4-13-series/xen-project-4-13-2/
(where a list of changes can also be found).

We recommend all users of the 4.13 stable series to update to this
latest point release.

Regards, Jan

