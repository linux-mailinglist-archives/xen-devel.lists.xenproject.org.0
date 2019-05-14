Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF561C72F
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 12:45:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQUtX-00069F-PJ; Tue, 14 May 2019 10:42:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O8Y9=TO=citrix.com=prvs=0309661e3=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hQUtX-000699-0t
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 10:42:51 +0000
X-Inumbo-ID: 034608f4-7635-11e9-aca3-070749b25603
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 034608f4-7635-11e9-aca3-070749b25603;
 Tue, 14 May 2019 10:42:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,468,1549929600"; d="scan'208";a="89714887"
Date: Tue, 14 May 2019 12:42:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190514104239.wasngivmlmnnez5u@Air-de-Roger>
References: <20190513165321.464fdeaf.olaf@aepfle.de>
 <20190513152005.jojtolhh5wdguvg6@Air-de-Roger>
 <20190514123406.72eda0f8.olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514123406.72eda0f8.olaf@aepfle.de>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] how to disable build of pv-shim?
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMTI6MzQ6MDZQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gTW9uLCAxMyBNYXkgMjAxOSAxNzoyMDowNSArMDIwMAo+IHNjaHJpZWIgUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ogo+IAo+ID4gZW5hYmxlZCBieSBkZWZh
dWx0Cj4gCj4gRG9lcyBhbnlvbmUgYWN0dWFsbHkgcmVxdWlyZSBpdCBhdCBhbGw/CgpIbSwgdGhh
dCdzIHRoZSBkZWZhdWx0IGJlaGF2aW9yIHNvIGZhciAoZW5hYmxlZCBvbiB4ODYpLCBzbyBJIHdv
dWxkCmxpa2UgdG8ga2VlcCBpdCBhcy1pcy4KCj4gVGhvc2Ugd2hvIGRvIHBhc3MgLS1lbmFibGUt
cHZzaGltIHRvIGNvbmZpZ3VyZS4gTm8gbmVlZCBmb3IgKGluY29ycmVjdCkgaG9zdF9jcHUgY2hl
Y2tzLgoKVXNpbmcgdGFyZ2V0X2NwdSBzaG91bGQgYmUgZmluZSBJIHRoaW5rLgoKVGhhbmtzLCBS
b2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
