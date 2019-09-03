Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A7AA64DC
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 11:13:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i54oH-0002xJ-24; Tue, 03 Sep 2019 09:09:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CRa/=W6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i54oF-0002xE-UD
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 09:09:07 +0000
X-Inumbo-ID: 7aae64d4-ce2a-11e9-8980-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7aae64d4-ce2a-11e9-8980-bc764e2007e4;
 Tue, 03 Sep 2019 09:09:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A4015AF98;
 Tue,  3 Sep 2019 09:09:04 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20190902153037.99845-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <773670ce-53bb-0677-8e07-69c84531847a@suse.com>
Date: Tue, 3 Sep 2019 11:09:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902153037.99845-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] vpci: honor read-only devices
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDkuMjAxOSAxNzozMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IC0tLSBhL3hlbi9k
cml2ZXJzL3ZwY2kvdnBjaS5jCj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMKPiBAQCAt
NDE4LDEzICs0MTgsMjEgQEAgdm9pZCB2cGNpX3dyaXRlKHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWdu
ZWQgaW50IHJlZywgdW5zaWduZWQgaW50IHNpemUsCj4gICAgICAgICAgcmV0dXJuOwo+ICAgICAg
fQo+ICAKPiAtICAgIC8qCj4gLSAgICAgKiBGaW5kIHRoZSBQQ0kgZGV2IG1hdGNoaW5nIHRoZSBh
ZGRyZXNzLgo+IC0gICAgICogUGFzc3Rocm91Z2ggZXZlcnl0aGluZyB0aGF0J3Mgbm90IHRyYXBw
ZWQuCj4gLSAgICAgKi8KPiArICAgIC8qIEZpbmQgdGhlIFBDSSBkZXYgbWF0Y2hpbmcgdGhlIGFk
ZHJlc3MuICovCj4gICAgICBwZGV2ID0gcGNpX2dldF9wZGV2X2J5X2RvbWFpbihkLCBzYmRmLnNl
Zywgc2JkZi5idXMsIHNiZGYuZGV2Zm4pOwo+ICAgICAgaWYgKCAhcGRldiApCj4gICAgICB7Cj4g
KyAgICAgICAgY29uc3QgdW5zaWduZWQgbG9uZyAqcm9fbWFwID0gcGNpX2dldF9yb19tYXAoc2Jk
Zi5zZWcpOwo+ICsKPiArICAgICAgICBpZiAoIHJvX21hcCAmJiB0ZXN0X2JpdChzYmRmLmJkZiwg
cm9fbWFwKSApCj4gKyAgICAgICAgICAgIC8qIElnbm9yZSB3cml0ZXMgdG8gcmVhZC1vbmx5IGRl
dmljZXMuICovCj4gKyAgICAgICAgICAgIHJldHVybjsKPiArCj4gKyAgICAgICAgLyoKPiArICAg
ICAgICAgKiBMZXQgdGhlIGhhcmR3YXJlIGRvbWFpbiBhY2Nlc3MgY29uZmlnIHNwYWNlIHJlZ2lv
bnMgZm9yIG5vbi1leGlzdGVudAo+ICsgICAgICAgICAqIGRldmljZXMuCj4gKyAgICAgICAgICog
VE9ETzogcmV2aXNpdCBmb3IgZG9tVSBzdXBwb3J0Lgo+ICsgICAgICAgICAqLwo+ICAgICAgICAg
IHZwY2lfd3JpdGVfaHcoc2JkZiwgcmVnLCBzaXplLCBkYXRhKTsKPiAgICAgICAgICByZXR1cm47
Cj4gICAgICB9Cj4gCgpJbiBwcmluY2lwbGUgSSdtIG9rYXkgd2l0aCB0aGUgY2hhbmdlLCBidXQg
SSBoYXZlIHR3byBtb3JlIHRoaW5ncwp0byBiZSBjb25zaWRlcmVkOgoKMSkgSSdkIHByZWZlciBp
ZiB0aGUgY2hlY2sgd2FzIGluZGVwZW5kZW50IG9mIHRoZSByZXR1cm4gdmFsdWUgb2YKcGNpX2dl
dF9wZGV2X2J5X2RvbWFpbigpLCB0byBiZSBtb3JlIHJvYnVzdCBhZ2FpbnN0IHRoZSByL28gbWFw
CmhhdmluZyBnb3QgdXBkYXRlZCBidXQgdGhlIG93bmVyIHN0aWxsIGJlaW5nIGh3ZG9tLgoKMikg
V291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIG1vdmUgdGhlIGNoZWNrIGludG8gdGhlIGNhbGxlcnMg
b2YKdnBjaV93cml0ZSgpLCB0byBhdm9pZCB0aGUgZHVwbGljYXRlIGxvb2t1cCBpbiB0aGUgcXdv
cmQtTUNGRy0Kd3JpdGUgY2FzZT8gVGhlIG1haW4gcXVlc3Rpb25hYmxlIHBvaW50IGhlcmUgaXMg
d2hlcmUsIGZvciBEb21VCnN1cHBvcnQsIHRoZSBTQkRGIHRyYW5zbGF0aW9uIGlzIGdvaW5nIHRv
IGxpdmUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
