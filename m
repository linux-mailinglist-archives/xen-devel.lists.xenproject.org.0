Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 786D4338AD9
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 12:01:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96999.184059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKfXz-0003Yo-QS; Fri, 12 Mar 2021 11:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96999.184059; Fri, 12 Mar 2021 11:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKfXz-0003YP-NC; Fri, 12 Mar 2021 11:01:35 +0000
Received: by outflank-mailman (input) for mailman id 96999;
 Fri, 12 Mar 2021 11:01:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F/Rg=IK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKfXy-0003YF-7W
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 11:01:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d4fba7e1-acb5-48dd-9c7d-7bafa3bd2947;
 Fri, 12 Mar 2021 11:01:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 803B1B02F;
 Fri, 12 Mar 2021 11:01:32 +0000 (UTC)
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
X-Inumbo-ID: d4fba7e1-acb5-48dd-9c7d-7bafa3bd2947
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615546892; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ODUPWDssY7gs7fhSJKuuSqxZQG4EVlFROeOzHNfA6IQ=;
	b=hXIXCKZ1q2wMP/M9PQCzflE+Yi8djezQLYsGC/ihq5w4OHGQZdR29A/onb1tX43zoSYcjZ
	jDTwO4jezD99YOGunulGdUyYz5LL5Bw+MirjyJxsZNyUJXZPbMkwt1NTSZ/wxBPbxGqm+W
	qj/YzYucBmnFsx6vQR5m2paRhGRCp30=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 0/2][4.15] x86: guest MSR access handling tweaks
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
Message-ID: <9c2e5e0e-041f-03e3-3c08-7abcc82d63c7@suse.com>
Date: Fri, 12 Mar 2021 12:01:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Largely to re-base patch 1.

1: PV: conditionally avoid raising #GP for early guest MSR reads
2: AMD: expose HWCR.TscFreqSel to guests

Jan

