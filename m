Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1784E108C52
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 11:53:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZBxa-0006Zk-8I; Mon, 25 Nov 2019 10:51:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZBxZ-0006Zf-I9
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 10:51:13 +0000
X-Inumbo-ID: 7ed58a64-0f71-11ea-a38d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ed58a64-0f71-11ea-a38d-12813bfff9fa;
 Mon, 25 Nov 2019 10:51:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A9607AC0C;
 Mon, 25 Nov 2019 10:51:11 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.com>
References: <62a3d98f-8173-1b13-f20e-9bd000f0923f@suse.com>
 <db8a9729-8408-c4a2-e28b-042c72bae186@suse.com>
 <0380ff3e991e4857b7c77e9d97edbcf4@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bc008f88-6630-a42e-9de8-3816c42a6c92@suse.com>
Date: Mon, 25 Nov 2019 11:51:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <0380ff3e991e4857b7c77e9d97edbcf4@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/3] introduce GFN notification for
 translated domains
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Sander Eikelenboom <linux@eikelenboom.it>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMTEuMjAxOSAxMTozNywgIER1cnJhbnQsIFBhdWwgIHdyb3RlOgo+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxp
c3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuCj4+IEJldWxpY2gKPj4gU2VudDog
MjUgTm92ZW1iZXIgMjAxOSAwOTo1OAo+Pgo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5j
Cj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPj4gQEAgLTQzMDQsOSArNDMwNCwxNyBA
QCBzdGF0aWMgaW50IGh2bW9wX3NldF9wYXJhbSgKPj4gICAgICAgICAgaWYgKCBhLnZhbHVlID4g
U0hVVERPV05fTUFYICkKPj4gICAgICAgICAgICAgIHJjID0gLUVJTlZBTDsKPj4gICAgICAgICAg
YnJlYWs7Cj4+ICsKPj4gICAgICBjYXNlIEhWTV9QQVJBTV9JT1JFUV9TRVJWRVJfUEZOOgo+PiAt
ICAgICAgICBkLT5hcmNoLmh2bS5pb3JlcV9nZm4uYmFzZSA9IGEudmFsdWU7Cj4+ICsgICAgICAg
IGlmICggZC0+YXJjaC5odm0ucGFyYW1zW0hWTV9QQVJBTV9OUl9JT1JFUV9TRVJWRVJfUEFHRVNd
ICkKPj4gKyAgICAgICAgICAgIHJjID0gbm90aWZ5X2dmbigKPj4gKyAgICAgICAgICAgICAgICAg
ICAgIGQsCj4+ICsgICAgICAgICAgICAgICAgICAgICBfZ2ZuKGEudmFsdWUgKyBkLT5hcmNoLmh2
bS5wYXJhbXMKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFtIVk1fUEFS
QU1fTlJfSU9SRVFfU0VSVkVSX1BBR0VTXSAtCj4+IDEpKTsKPiAKPiBJSVJDIHRoZSBQRk4gaXMg
dHlwaWNhbGx5IHNldCBieSB0aGUgdG9vbHN0YWNrIGJlZm9yZSB0aGUgbnVtYmVyIG9mCj4gcGFn
ZXMsIHNvIHRoZSBub3RpZnkgd2lsbCBiZSBmb3IgYS52YWx1ZSAtIDEsIGkuZS4gdGhlIHByZXZp
b3VzIGdmbi4KPiBJcyB0aGF0IGEgcHJvYmxlbT8KClRoZXJlJ3MgYW4gaWYoKSBhcm91bmQgdGhl
IGludm9jYXRpb24gdG8gYXZvaWQgdGhpcyBzaXR1YXRpb24sIHNvIEknbQphZnJhaWQgSSBkb24n
dCB1bmRlcnN0YW5kIHRoZSBxdWVzdGlvbi4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
