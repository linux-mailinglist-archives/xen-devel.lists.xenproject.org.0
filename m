Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F2B330A80
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 10:49:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94742.178380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJCWC-0004me-8X; Mon, 08 Mar 2021 09:49:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94742.178380; Mon, 08 Mar 2021 09:49:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJCWC-0004m8-52; Mon, 08 Mar 2021 09:49:40 +0000
Received: by outflank-mailman (input) for mailman id 94742;
 Mon, 08 Mar 2021 09:49:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mI6H=IG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJCWB-0004lr-8c
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 09:49:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b73bc831-c621-4ecc-aa00-8229458990d7;
 Mon, 08 Mar 2021 09:49:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A4954AD21;
 Mon,  8 Mar 2021 09:49:37 +0000 (UTC)
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
X-Inumbo-ID: b73bc831-c621-4ecc-aa00-8229458990d7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615196977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ASjIB1WECxkvx4naN608qGCch8AhKNLNoM+9i6cEs7c=;
	b=OBtOPGJnfGc+bFZWqsmbYj7G0IO0h+rUhKtA5xuOxTWff9Kd6S7jDEGomRtupVGkW4nbzE
	ZiSrBY+kLMZjjRtfYEKS5tlUpT0cG54EAZ6VicGsD0BFptZ9/0h/ZhcuSAGIoxYVs2yzRc
	aCyUh5Zl3UiJavhlr0gio40DP/20+xg=
From: Jan Beulich <jbeulich@suse.com>
Subject: preparations for 4.13.3
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Message-ID: <5373f9d5-fc03-1967-8181-d77bbdaf25b9@suse.com>
Date: Mon, 8 Mar 2021 10:49:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

All,

the release is overdue (my apologies). Please point out backports
you find missing from the respective staging branches, but which
you consider relevant.

Ones that I have queued already, but which hadn't passed the push
gate to master yet when doing a swipe late last week, are

c6ad5a701b9a crypto: adjust rijndaelEncrypt() prototype for gcc11
9318fdf757ec x86/shadow: suppress "fast fault path" optimization without reserved bits
60c0444fae21 x86/shadow: suppress "fast fault path" optimization when running virtualized

Jan

