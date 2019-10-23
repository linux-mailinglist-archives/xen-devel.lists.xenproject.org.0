Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CE3E1566
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 11:09:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNCbd-0006lj-Kc; Wed, 23 Oct 2019 09:07:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Og4R=YQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iNCbc-0006lF-BZ
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 09:07:00 +0000
X-Inumbo-ID: 77b8d69e-f574-11e9-bbab-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77b8d69e-f574-11e9-bbab-bc764e2007e4;
 Wed, 23 Oct 2019 09:06:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E9C12B67F;
 Wed, 23 Oct 2019 09:06:57 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20191023085739.43585-1-roger.pau@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <70488c4e-f690-8494-a16f-ce167b076c6a@suse.com>
Date: Wed, 23 Oct 2019 11:06:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191023085739.43585-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/tsc: update vcpu time info on
 guest TSC adjustments
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
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTAuMTkgMTA6NTcsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiBJZiBhIEhWTS9QVkgg
Z3Vlc3Qgd3JpdGVzIHRvIE1TUl9JQTMyX1RTQ3tfQURKVVNUfSBhbmQgdGh1cyBjaGFuZ2VzCj4g
dGhlIHZhbHVlIG9mIHRoZSB0aW1lIHN0YW1wIGNvdW50ZXIgdGhlIHZjcHUgdGltZSBpbmZvIG11
c3QgYWxzbyBiZQo+IHVwZGF0ZWQsIG9yIHRoZSB0aW1lIGNhbGN1bGF0ZWQgYnkgdGhlIGd1ZXN0
IHVzaW5nIHRoZSBYZW4gUFYgY2xvY2sKPiBpbnRlcmZhY2Ugd2lsbCBiZSBza2V3ZWQuCj4gCj4g
VXBkYXRlIHRoZSB2Y3B1IHRpbWUgaW5mbyB3aGVuIHRoZSBndWVzdCB3cml0ZXMgdG8gZWl0aGVy
IE1TUl9JQTMyX1RTQwo+IG9yIE1TUl9JQTMyX1RTQ19BREpVU1QuIFRoaXMgZml4ZXMgbG9ja3Vw
cyBzZWVuIHdoZW4gcnVubmluZyB0aGUKPiBwdi1zaGltIG9uIEFNRCBoYXJkd2FyZSwgc2luY2Ug
dGhlIHNoaW0gd2lsbCBhZ2dyZXNzaXZlbHkgdHJ5IHRvIGtlZXAKPiBUU0NzIGluIHN5bmMgYnkg
cGVyaW9kaWNhbGx5IHdyaXRpbmcgdG8gTVNSX0lBMzJfVFNDIGlmIHRoZSBUU0MgaXMgbm90Cj4g
cmVsaWFibGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
