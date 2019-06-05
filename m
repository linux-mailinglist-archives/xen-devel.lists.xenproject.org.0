Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EC435AA5
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 12:47:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYTPi-00074Q-Sd; Wed, 05 Jun 2019 10:45:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=af5Q=UE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYTPh-00074K-IA
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 10:45:01 +0000
X-Inumbo-ID: f7851446-877e-11e9-99e5-fb4fd08b39a0
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f7851446-877e-11e9-99e5-fb4fd08b39a0;
 Wed, 05 Jun 2019 10:45:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFE8415AB;
 Wed,  5 Jun 2019 03:44:59 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F52A3F690;
 Wed,  5 Jun 2019 03:44:58 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190603160350.29806-1-julien.grall@arm.com>
 <20190603160350.29806-12-julien.grall@arm.com>
 <5CF79CD8020000780023574C@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <940211e0-87ff-d56a-78d3-b82353312a37@arm.com>
Date: Wed, 5 Jun 2019 11:44:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF79CD8020000780023574C@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 11/14] xen/x86: p2m: Remove duplicate
 error message in p2m_pt_audit_p2m()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMDUvMDYvMjAxOSAxMTo0MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MDMuMDYuMTkgYXQgMTg6MDMsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IHAybV9w
dF9hdWRpdF9wMm0oKSBoYXMgb25lIHBsYWNlIHdoZXJlIHRoZSBzYW1lIG1lc3NhZ2UgbWF5IGJl
IHByaW50ZWQKPj4gdHdpY2UgdmlhIHByaW50ayBhbmQgUDJNX1BSSU5USy4KPj4KPj4gUmVtb3Zl
IHRoZSBvbmUgcHJpbnRlZCB1c2luZyBwcmludGsgdG8gc3RheSBjb25zaXN0ZW50IHdpdGggdGhl
IHJlc3Qgb2YKPj4gdGhlIGNvZGUuCj4+Cj4+IFRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIHJlZmxv
dyB0aGUgZm9ybWF0IG9mIFAyTV9QUklOVEsuCj4gCj4gSG1tLCB5ZXMsIGJ1dCAuLi4KClRoaXMg
aXMgYSBtaXN0YWtlIHdoZW4gSSB3cm90ZSB0aGUgcGF0Y2gvcmViYXNlLgoKPiAKPj4gLS0tIGEv
eGVuL2FyY2gveDg2L21tL3AybS1wdC5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0tcHQu
Ywo+PiBAQCAtMTA0MSw5ICsxMDQxLDggQEAgbG9uZyBwMm1fcHRfYXVkaXRfcDJtKHN0cnVjdCBw
Mm1fZG9tYWluICpwMm0pCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCBtMnBmbiAh
PSAoZ2ZuICsgaTIpICkKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICB7Cj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBtYmFkKys7Cj4+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgUDJNX1BSSU5USygibWlzbWF0Y2g6IGdmbiAlI2x4IC0+IG1mbiAlI2x4Igo+PiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiAtPiBnZm4gJSNseFxuIiwgZ2Zu
K2kyLCBtZm4raTIsCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBt
MnBmbik7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgUDJNX1BSSU5USygibWlzbWF0
Y2g6IGdmbiAlI2x4IC0+IG1mbiAlI2x4IC0+IGdmbiAlI2x4XG4iLAo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2ZuICsgaTIsIG1mbiArIGkyLCBtMnBmbik7Cj4g
Cj4gLi4uIHlvdSByZS1mbG93IGFuIHVucmVsYXRlZCAoYnV0IHNpbWlsYXIpIG9uZSB3aGlsZSAu
Li4KPiAKPj4gQEAgLTExMDgsOCArMTEwNyw2IEBAIGxvbmcgcDJtX3B0X2F1ZGl0X3AybShzdHJ1
Y3QgcDJtX2RvbWFpbiAqcDJtKQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIXAy
bV9pc19zaGFyZWQodHlwZSkgKQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgIHsKPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcG1iYWQrKzsKPj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwcmludGsoIm1pc21hdGNoOiBnZm4gJSNseCAtPiBtZm4gJSNseCIKPj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiAtPiBnZm4gJSNseFxuIiwgZ2ZuLCBt
Zm4sIG0ycGZuKTsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUDJNX1BSSU5USygi
bWlzbWF0Y2g6IGdmbiAlI2x4IC0+IG1mbiAlI2x4Igo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICIgLT4gZ2ZuICUjbHhcbiIsIGdmbiwgbWZuLCBtMnBmbik7Cj4g
Cj4gLi4uIHlvdSBsZWF2ZSBhbG9uZSB0aGlzIG9uZS4gSSBkb24ndCBtaW5kIHRvdWNoaW5nIHRo
ZSBvdGhlcgo+IG9uZSwgYnV0IHRoaXMgb25lIHN1cmVseSB3YW50cyB0b3VjaGluZyB0aGVuIGFz
IHdlbGwuIEFuZCBpZgo+IHlvdSB0b3VjaCB0aGF0IG90aGVyIG9uZSwgdGhlbiBJIHRoaW5rIGZv
ciBjb25zaXN0ZW5jeSB5b3UKPiBzaG91bGQgYWxzbyB0b3VjaCB0aGUgM3JkIG9uZSAoYmV0d2Vl
biB0aGUgdHdvKS4KCkkgd2lsbCBvbmx5IHJlLWZsb3cgdGhpcyBtZXNzYWdlLgoKQ2hlZXJzLAoK
LS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
