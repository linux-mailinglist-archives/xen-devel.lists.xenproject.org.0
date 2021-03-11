Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9B63375DD
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 15:39:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96636.183033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKMSm-0006o2-KA; Thu, 11 Mar 2021 14:38:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96636.183033; Thu, 11 Mar 2021 14:38:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKMSm-0006ng-Gf; Thu, 11 Mar 2021 14:38:56 +0000
Received: by outflank-mailman (input) for mailman id 96636;
 Thu, 11 Mar 2021 14:38:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QJ7d=IJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKMSl-0006nZ-JO
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 14:38:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0fe43c90-c399-405a-9246-858e7ec2af97;
 Thu, 11 Mar 2021 14:38:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A142BAB8C;
 Thu, 11 Mar 2021 14:38:53 +0000 (UTC)
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
X-Inumbo-ID: 0fe43c90-c399-405a-9246-858e7ec2af97
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615473533; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+F8YCQYwFfAAno7kXAzb0wMUytT5f6bAGDvirWF6wV4=;
	b=VerFM3hJ3x49p9SW5dtlrcLMCWx6vjnFF1g/z2HqtP8P9E17mbEgy0XHchH9jSpdW35nNQ
	JzBwCaFFt1SwUstTK6RXfFxoHcAvT7ZZ72icSIPKfLpRtqXSHWyOpBzo9+rCC1vkeYLjXe
	ef398TDr5qaQB7BH2h3q6O/b2MU4Epw=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] tools/x86: adjust populating of tools/include/xen/
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <1365013b-1e90-aeb2-3c80-7a5c6284c46a@suse.com>
Date: Thu, 11 Mar 2021 15:38:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While the first change is a possible 4.15 candidate, the second is pure
cleanup (but could, should patch 1 end up being controversial, also go
in independently).

1: don't rebuild cpuid-autogen.h every time
2: move arch-specific include/xen/ population into arch-specific rule

Jan

