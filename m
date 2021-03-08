Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC671330A33
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 10:22:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94712.178264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJC4M-0001vr-T9; Mon, 08 Mar 2021 09:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94712.178264; Mon, 08 Mar 2021 09:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJC4M-0001vZ-KY; Mon, 08 Mar 2021 09:20:54 +0000
Received: by outflank-mailman (input) for mailman id 94712;
 Mon, 08 Mar 2021 09:20:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mI6H=IG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJC4K-0001vU-7z
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 09:20:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b627013-9c27-483c-99fc-8c32e21ba96e;
 Mon, 08 Mar 2021 09:20:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F2755ACBF;
 Mon,  8 Mar 2021 09:20:49 +0000 (UTC)
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
X-Inumbo-ID: 6b627013-9c27-483c-99fc-8c32e21ba96e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615195250; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LIwEkBsM2st3pyBXXt8Lpc7E0hAhJaLbFVIrJwEUDe0=;
	b=YIw4NROJd93ktcDabx5+H6YN87+U+t5w/LUmymJSffDa6Vv+n41qrYEIIFoVd06sdhXW4a
	QgtN2rzGwy03zlL1p09bJCRg0Uldtx77sDGzrtz5GVwUXuI6SSUS6XZCScDMBVCO1Yr+PK
	3cmqbraGbmduxsbB/cUuzWsg4jx8d5g=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] tools/x86: adjust populating of tools/include/xen/
Message-ID: <d08ec3ba-dff1-cb1c-9103-949e15774fd5@suse.com>
Date: Mon, 8 Mar 2021 10:20:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While the first change is a possible 4.15 candidate, the second is pure
cleanup (but could, should patch 1 end up being controversial, also be
re-based ahead).

1: don't rebuild cpuid-autogen.h every time
2: move arch-specific include/xen/ population into arch-specific rule

Jan

