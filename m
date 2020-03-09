Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCC117DF8A
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 13:10:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBHCV-0002uy-Kp; Mon, 09 Mar 2020 12:08:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=k1Ob=42=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBHCU-0002ul-Cf
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 12:08:02 +0000
X-Inumbo-ID: 9f9a7c5c-61fe-11ea-90c4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f9a7c5c-61fe-11ea-90c4-bc764e2007e4;
 Mon, 09 Mar 2020 12:08:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 01280AF48;
 Mon,  9 Mar 2020 12:08:00 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e0b6b003-18c6-56a0-f791-1ebd4172f5fc@suse.com>
Message-ID: <13b9e27d-ccc4-24a1-5f99-3c120430af38@suse.com>
Date: Mon, 9 Mar 2020 13:08:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e0b6b003-18c6-56a0-f791-1ebd4172f5fc@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 4/9] x86/HVM: reduce vpic.h include dependencies
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHJvcCBhbiAjaW5jbHVkZSBub3QgbmVlZGVkIGJ5IHRoZSBoZWFkZXIgaXRzZWxmLgoKU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9odm0vdnBpYy5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZwaWMu
aApAQCAtMjcsNyArMjcsOCBAQAogI2lmbmRlZiBfX0FTTV9YODZfSFZNX1ZQSUNfSF9fCiAjZGVm
aW5lIF9fQVNNX1g4Nl9IVk1fVlBJQ19IX18KIAotI2luY2x1ZGUgPHB1YmxpYy9odm0vc2F2ZS5o
Pgorc3RydWN0IGRvbWFpbjsKK3N0cnVjdCB2Y3B1OwogCiB2b2lkIHZwaWNfaXJxX3Bvc2l0aXZl
X2VkZ2Uoc3RydWN0IGRvbWFpbiAqZCwgaW50IGlycSk7CiB2b2lkIHZwaWNfaXJxX25lZ2F0aXZl
X2VkZ2Uoc3RydWN0IGRvbWFpbiAqZCwgaW50IGlycSk7CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
