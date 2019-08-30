Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75339A392B
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 16:24:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3hm4-0001xu-Mh; Fri, 30 Aug 2019 14:21:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3hm3-0001xp-5Q
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 14:21:11 +0000
X-Inumbo-ID: 67c23fea-cb31-11e9-ae8a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67c23fea-cb31-11e9-ae8a-12813bfff9fa;
 Fri, 30 Aug 2019 14:21:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1179EAE50;
 Fri, 30 Aug 2019 14:21:06 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190830083225.10397-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <43d293e5-40b8-fae9-4d27-0b6bd6afcbda@suse.com>
Date: Fri, 30 Aug 2019 16:21:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190830083225.10397-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: add macro for defining variable length
 array in public headers
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDguMjAxOSAxMDozMiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vaW5j
bHVkZS9wdWJsaWMveGVuLmgKPiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMveGVuLmgKPiBAQCAt
NTMsNiArNTMsMTUgQEAgREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUodWludDY0X3QpOwo+ICBERUZJ
TkVfWEVOX0dVRVNUX0hBTkRMRSh4ZW5fcGZuX3QpOwo+ICBERUZJTkVfWEVOX0dVRVNUX0hBTkRM
RSh4ZW5fdWxvbmdfdCk7Cj4gIAo+ICsvKiBEZWZpbmUgYSB2YXJpYWJsZSBsZW5ndGggYXJyYXkg
KGRlcGVuZHMgb24gY29tcGlsZXIpLiAqLwo+ICsjaWYgZGVmaW5lZChfX1NURENfVkVSU0lPTl9f
KSAmJiBfX1NURENfVkVSU0lPTl9fID49IDE5OTkwMUwKPiArI2RlZmluZSBfX1hFTl9WQVJMRU5f
QVJSQVlfU0laRQo+ICsjZWxpZiBkZWZpbmVkKF9fR05VQ19fKQo+ICsjZGVmaW5lIF9fWEVOX1ZB
UkxFTl9BUlJBWV9TSVpFICAwCj4gKyNlbHNlCj4gKyNkZWZpbmUgX19YRU5fVkFSTEVOX0FSUkFZ
X1NJWkUgIDEgLyogdmFyaWFibGUgc2l6ZSAqLwo+ICsjZW5kaWYKClRvIGJlIGluIGxpbmUgd2l0
aCB0aGUgaW50ZW50aW9ucywgdGhlIEM5MCBzdGFuZGFyZCwgYW5kIGlvL3JpbmcuaApJJ2Qgc3Vn
Z2VzdCB0byB1c2UgRkxFWCBpbnN0ZWFkIG9mIFZBUkxFTi4gRnVydGhlcm1vcmUsIGVzcGVjaWFs
bHkKaW4gYSBwdWJsaWMgaGVhZGVyLCB0d28gZG91YmxlIGxlYWRpbmcgdW5kZXJzY29yZXMgbmVl
ZCB0byBnbyBhd2F5LgoKQW5kIHRoZW4sIHdpdGggRkxFWCBpbiB0aGUgbmFtZSwgU0laRSBpc24n
dCByZWFsbHkgYXBwcm9wcmlhdGUKYW55bW9yZS4gVGhlcmVmb3JlIEkgc2VlIHRocmVlIHBvc3Np
YmxlIG5hbWVzOiBYRU5fRkxFWElCTEVfQVJSQVksClhFTl9GTEVYX0FSUkFZX0RJTUVOU0lPTiAo
cG9zc2libHkganVzdCBfRElNIGF0IGl0cyBlbmQpLCBvcgpYRU5fRkxFWF9BUlJBWV9ERVNJR05B
VE9SLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
