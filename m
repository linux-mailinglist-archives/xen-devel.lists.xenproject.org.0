Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFBD1B966
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 17:02:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQCR6-0005hp-JH; Mon, 13 May 2019 15:00:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KEM8=TN=citrix.com=prvs=029c3005f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hQCR5-0005hg-Ad
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 15:00:15 +0000
X-Inumbo-ID: cea7a8b4-758f-11e9-8991-af786aadafb1
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cea7a8b4-758f-11e9-8991-af786aadafb1;
 Mon, 13 May 2019 15:00:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,465,1549929600"; d="scan'208";a="89709510"
Date: Mon, 13 May 2019 17:00:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190513150003.y4l76s54d2ae5zrw@Air-de-Roger>
References: <20190510152047.17299-1-olaf@aepfle.de>
 <20190513143733.2xodq4nexe7n6er2@Air-de-Roger>
 <20190513164521.19e65e5d.olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190513164521.19e65e5d.olaf@aepfle.de>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v4] libxl: fix migration of PV and PVH domUs
 with and without qemu
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDQ6NDU6MjFQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gTW9uLCAxMyBNYXkgMjAxOSAxNjozNzozMyArMDIwMAo+IHNjaHJpZWIgUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ogo+IAo+ID4gRlRSIEkgd291bGQgaGF2
ZSBwcmVmZXJyZWQgYSBwcmUtcGF0Y2ggdGhhdCBkaWQgdGhlIG1vdmUgb2YgdGhpcyBjaHVuawo+
ID4gb2YgY29kZSBpbnRvIGxpYnhsX19kb21haW5fc2V0X2RldmljZV9tb2RlbCB3aXRob3V0IGFu
eSBmdW5jdGlvbmFsCj4gPiBjaGFuZ2UsIGFuZCB0aGVuIGEgc2Vjb25kIHBhdGNoIHRoYXQgaW50
cm9kdWNlcyB0aGUgbmV3IGZ1bmN0aW9uYWxpdHkuCj4gCj4gSWYgdGhhdCBuZWVkcyB0byBiZSBk
b25lLCBJIGNhbiBkbyBpdC4KCklmZiB5b3UgaGF2ZSB0byByZXNlbmQgYW55d2F5LCBhbmQgaXQn
cyBub3QgdG9vIG11Y2ggZnVzcyB0aGVuIEkgd291bGQKc2F5IHllcy4KClRoYW5rcywgUm9nZXIu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
