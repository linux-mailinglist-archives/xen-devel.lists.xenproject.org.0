Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49895366914
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 12:20:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114333.217884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9y6-0008GS-F6; Wed, 21 Apr 2021 10:20:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114333.217884; Wed, 21 Apr 2021 10:20:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9y6-0008Fw-Bb; Wed, 21 Apr 2021 10:20:26 +0000
Received: by outflank-mailman (input) for mailman id 114333;
 Wed, 21 Apr 2021 10:20:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZ9y4-0008Fe-JN
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 10:20:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1fbc1e2-e025-4de5-89ed-03fceb920eff;
 Wed, 21 Apr 2021 10:20:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ED37CAEE7;
 Wed, 21 Apr 2021 10:20:22 +0000 (UTC)
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
X-Inumbo-ID: a1fbc1e2-e025-4de5-89ed-03fceb920eff
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619000423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ijMg3o2VxfvgdYZVqP7rVwQobEaLDOu3WLhnZL+eup4=;
	b=svejwh6Rr7CcOx7NKiP/T2naN9h6O1gsjwYSm2nJxCQYjhzr7mOxt3DePht9PDGX2TV6LS
	ixuf5IGA5boyc2ZrXBeu5RXvmbV/pz9qeJHodRdaO8Ga8GSkHM3lwtzmN26DdnsJvTO5YV
	Z/3zkducI1iEFd0+sYf/lGPvGHK2GBQ=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 0/3] zstd decompression fallout / consolidation
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Message-ID: <12054cba-4386-0dbf-46fd-41ace0344f8e@suse.com>
Date: Wed, 21 Apr 2021 12:20:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

1: unzstd: replace INIT{,DATA} and STATIC
2: xen/decompress: drop STATIC and INIT
3: unzstd: make helper symbols static

Jan

