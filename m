Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7024310D70B
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 15:32:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iahIO-0002OF-SP; Fri, 29 Nov 2019 14:30:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iahIN-0002O4-FG
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 14:30:55 +0000
X-Inumbo-ID: d9920d2e-12b4-11ea-a3e7-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9920d2e-12b4-11ea-a3e7-12813bfff9fa;
 Fri, 29 Nov 2019 14:30:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A6D51BA2D;
 Fri, 29 Nov 2019 14:30:53 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20191121185049.16666-1-liuwe@microsoft.com>
 <20191121185049.16666-8-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1a0165e1-7905-7482-6551-12e55099b6b5@suse.com>
Date: Fri, 29 Nov 2019 15:31:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191121185049.16666-8-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 7/8] x86: be more verbose when running on
 a hypervisor
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <liuwe@microsoft.com>, Michael Kelley <mikelley@microsoft.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTEuMjAxOSAxOTo1MCwgV2VpIExpdSB3cm90ZToKPiBAQCAtNzYzLDcgKzc2NCw3IEBA
IHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApCj4g
ICAgICAgKiBhbGxvY2luZyBhbnkgeGVuaGVhcCBzdHJ1Y3R1cmVzIHdhbnRlZCBpbiBsb3dlciBt
ZW1vcnkuICovCj4gICAgICBrZXhlY19lYXJseV9jYWxjdWxhdGlvbnMoKTsKPiAgCj4gLSAgICBo
eXBlcnZpc29yX3Byb2JlKCk7Cj4gKyAgICBydW5uaW5nX29uX2h5cGVydmlzb3IgPSAhIWh5cGVy
dmlzb3JfcHJvYmUoKTsKCk5vIG5lZWQgZm9yICEhIEkgdGhpbms/Cgo+IEBAIC03ODgsNiArNzg5
LDggQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlf
cCkKPiAgICAgIHByaW50aygiQ29tbWFuZCBsaW5lOiAlc1xuIiwgY21kbGluZSk7Cj4gIAo+ICAg
ICAgcHJpbnRrKCJYZW4gaW1hZ2UgbG9hZCBiYXNlIGFkZHJlc3M6ICUjbHhcbiIsIHhlbl9waHlz
X3N0YXJ0KTsKPiArICAgIGlmICggcnVubmluZ19vbl9oeXBlcnZpc29yICkKPiArICAgICAgICBw
cmludGsoIlJ1bm5pbmcgb24gJXNcbiIsIGh5cGVydmlzb3JfcHJvYmUoKS0+bmFtZSk7CgpJbnZv
a2luZyBoeXBlcnZpc29yX3Byb2JlKCkgdHdpY2Ugc2VlbXMgb2RkIHRvIG1lLiBJIHJlYWxpemUK
dGhlIGZ1bmN0aW9uIGNvcGVzLCBidXQgd2h5IGRvIGV2ZXJ5dGhpbmcgYSAybmQgdGltZSB3aGVu
Cm5vdCBydW5uaW5nIG9uIGFueSBoeXBlcnZpc29yPyBGdXJ0aGVybW9yZSBpZiB0aGlzIHVzZSBp
cwp0aGUgb25seSByZWFzb24gd2h5IHN0cnVjdCBoeXBlcnZpc29yX29wcyBjYW4ndCBiZSBsb2Nh
bCB0bwp4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jLCB0aGVuIEkgdGhpbmsgb25jZSBh
Z2Fpbgp0aGF0IHRoZSBuYW1lIHNob3VsZCBiZSByZXR1cm4gZnJvbSBoeXBlcnZpc29yX3Byb2Jl
KCkuIFRoZQppbml0aWFsIGlmKCkgaW4gdGhlcmUgdGhlbiBjb3VsZCBhbHNvIGdvIGF3YXkuCgpK
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
