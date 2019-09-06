Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B047ABA19
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 15:59:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6Ejn-0005d3-JT; Fri, 06 Sep 2019 13:57:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i6Ejm-0005cx-Eq
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 13:57:18 +0000
X-Inumbo-ID: 3c7bfa74-d0ae-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c7bfa74-d0ae-11e9-a337-bc764e2007e4;
 Fri, 06 Sep 2019 13:57:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A5939AE8D;
 Fri,  6 Sep 2019 13:57:16 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <67f6d8cc-05cf-ac8e-38c0-55578f9f595a@suse.com>
Date: Fri, 6 Sep 2019 15:57:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH 0/3] x86: (largely) LAPIC related cleanup
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

VGhlIGxhdHRlciB0d28gcGF0Y2hlcyBhcmUgZGVyaXZlZCBmcm9tIExpbnV4IG9uZXMsIHdoaWNo
IGNhdWdodApteSBhdHRlbnRpb24uIFRoZSBmaXJzdCBvbmUgaXMgc2ltcGx5IHNvbWUgZXh0cmEg
Y29kZSByZWR1Y3Rpb24KcG90ZW50aWFsIEkgbm90aWNlZCB3aGlsZSBldmFsdWF0aW5nIHdoZXRo
ZXIgdGhvc2UgTGludXggY2hhbmdlcwphcmUgYXBwbGljYWJsZSB0byBvdXIgdHJlZS4KCjE6IHg4
NjogZHJvcCBDT05GSUdfWDg2X01DRV9USEVSTUFMCjI6IHg4Ni9hcGljOiBpbmNsdWRlIHRoZSBM
RFIgd2hlbiBjbGVhcmluZyBvdXQgQVBJQyByZWdpc3RlcnMKMzogeDg2L2FwaWM6IGRvIG5vdCBp
bml0aWFsaXplIExEUiBhbmQgREZSIGZvciBiaWdzbXAKCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
