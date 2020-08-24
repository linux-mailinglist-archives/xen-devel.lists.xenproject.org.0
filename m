Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C3024FD12
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 13:57:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAB5V-00009T-Pe; Mon, 24 Aug 2020 11:56:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kAB5U-00009O-RG
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 11:56:32 +0000
X-Inumbo-ID: a35e16c5-2894-43ad-9cea-adce3c2e4411
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a35e16c5-2894-43ad-9cea-adce3c2e4411;
 Mon, 24 Aug 2020 11:56:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C3C39B605;
 Mon, 24 Aug 2020 11:57:00 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/4] x86: build adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <088c088d-d463-05c6-1d17-d682a878e149@suse.com>
Date: Mon, 24 Aug 2020 13:56:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a in part just loosely connected set of changes in particular
aiming at further shim size binary reduction.

Review feedback for v2 addressed for 1 and 2; 3 and 4 unchanged. One
patch was dropped.

1: x86/EFI: sanitize build logic
2: x86: don't build with EFI support in shim-exclusive mode
3: bitmap: move to/from xenctl_bitmap conversion helpers
4: x86: don't include domctl and alike in shim-exclusive builds

Jan

