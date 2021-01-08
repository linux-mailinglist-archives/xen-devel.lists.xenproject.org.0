Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF65F2EF348
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 14:42:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63433.112614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxs1d-0008Gx-Gp; Fri, 08 Jan 2021 13:41:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63433.112614; Fri, 08 Jan 2021 13:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxs1d-0008GY-Dm; Fri, 08 Jan 2021 13:41:57 +0000
Received: by outflank-mailman (input) for mailman id 63433;
 Fri, 08 Jan 2021 13:41:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tJ2=GL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kxs1c-0008GT-3G
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 13:41:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ff35720-6889-48d7-86aa-ff5bb14f8632;
 Fri, 08 Jan 2021 13:41:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C4F86AD18;
 Fri,  8 Jan 2021 13:41:53 +0000 (UTC)
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
X-Inumbo-ID: 4ff35720-6889-48d7-86aa-ff5bb14f8632
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610113313; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xx7cbeEzBBmBQ5njkJe9+8b2273IMAwIwmTtWvBOrtM=;
	b=fBCPsjqQQn9R+0R09eEK/FoHSJml340e7SvQnjLz0bpN/7jECguikRLjt6QpI4rUnu04d5
	PjDcnXfbGrJaBAwKq0ocSrBP7U+ZuN+S+Q3OABz40g00G306u+cJQHvNFi8SN1PlSaX7YN
	/fgm6l1XLr/aHejCPrUNH6yjXTxpYKk=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/4] x86/ACPI: less verbose logging by default & more
Message-ID: <9432d21a-004b-c764-25f4-73ff12fd171a@suse.com>
Date: Fri, 8 Jan 2021 14:41:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

1: ACPI: reduce verbosity by default
2: x86/ACPI: don't overwrite FADT
3: ACPI: replace casts by container_of()
4: x86: drop fake CONFIG_{HPET,X86_PM}_TIMER

Jan

