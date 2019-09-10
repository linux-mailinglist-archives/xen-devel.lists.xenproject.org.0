Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDEFAEB97
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 15:30:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7gCc-000867-O5; Tue, 10 Sep 2019 13:29:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6bdU=XF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7gCb-00085y-AP
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 13:29:01 +0000
X-Inumbo-ID: f26fb884-d3ce-11e9-ac1e-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f26fb884-d3ce-11e9-ac1e-12813bfff9fa;
 Tue, 10 Sep 2019 13:29:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1CF81ABF1;
 Tue, 10 Sep 2019 13:28:59 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7a37466e-4bb8-2358-f940-42aa5426bdcb@suse.com>
Date: Tue, 10 Sep 2019 15:28:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190903161428.7159-2-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 01/11] ioreq: fix
 hvm_all_ioreq_servers_add_vcpu fail path cleanup
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDkuMjAxOSAxODoxNCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vaW9yZXEuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYwo+IEBA
IC0xMTk1LDcgKzExOTUsNyBAQCBpbnQgaHZtX2FsbF9pb3JlcV9zZXJ2ZXJzX2FkZF92Y3B1KHN0
cnVjdCBkb21haW4gKmQsIHN0cnVjdCB2Y3B1ICp2KQo+ICAgICAgcmV0dXJuIDA7Cj4gIAo+ICAg
ZmFpbDoKPiAtICAgIHdoaWxlICggaWQtLSAhPSAwICkKPiArICAgIHdoaWxlICggaWQrKyAhPSBN
QVhfTlJfSU9SRVFfU0VSVkVSUyApCj4gICAgICB7Cj4gICAgICAgICAgcyA9IEdFVF9JT1JFUV9T
RVJWRVIoZCwgaWQpOwoKV2l0aCBQYXVsJ3MgUi1iIEkgd2FzIGFib3V0IHRvIGNvbW1pdCB0aGlz
LCBidXQgZG9lc24ndCB0aGlzCm5lZWQgdG8gYmUgKytpZD8gKElmIHNvLCBJJ2xsIGJlIGhhcHB5
IHRvIGZpeCB3aGlsZSBjb21taXR0aW5nLikKCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
