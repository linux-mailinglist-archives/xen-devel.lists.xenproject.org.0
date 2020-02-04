Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 441FA1519F9
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 12:38:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iywUs-0004kW-O4; Tue, 04 Feb 2020 11:36:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fS9R=3Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iywUq-0004kQ-Dm
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 11:36:00 +0000
X-Inumbo-ID: 83547ee8-4742-11ea-ad98-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83547ee8-4742-11ea-ad98-bc764e2007e4;
 Tue, 04 Feb 2020 11:35:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F2DFCADE4;
 Tue,  4 Feb 2020 11:35:57 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: George Dunlap <George.Dunlap@eu.citrix.com>
References: <96522871-eea2-a9ce-c89d-aebefe6225d1@suse.com>
Message-ID: <c19ba56c-a251-f76a-7ca4-e36f7cdc9fea@suse.com>
Date: Tue, 4 Feb 2020 12:36:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <96522871-eea2-a9ce-c89d-aebefe6225d1@suse.com>
Content-Language: en-US
Subject: [Xen-devel] Ping: [PATCH 0/2] x86/p2m: PoD accounting adjustments
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDEuMjAyMCAxMjo0OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gMTogZml4IFBvRCBhY2Nv
dW50aW5nIGluIGd1ZXN0X3BoeXNtYXBfYWRkX2VudHJ5KCkKPiAyOiBhZGp1c3Qgbm9uLVBvRCBh
Y2NvdW50aW5nIGluIHAybV9wb2RfZGVjcmVhc2VfcmVzZXJ2YXRpb24oKQoKR2VvcmdlPwoKVGhh
bmtzLCBKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
