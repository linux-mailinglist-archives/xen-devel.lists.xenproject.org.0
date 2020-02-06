Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE5C15412C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 10:30:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izdS7-0006Hj-Dd; Thu, 06 Feb 2020 09:28:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ya+N=32=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izdS5-0006Hb-Iq
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 09:28:01 +0000
X-Inumbo-ID: f7a34afa-48c2-11ea-94cb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7a34afa-48c2-11ea-94cb-bc764e2007e4;
 Thu, 06 Feb 2020 09:28:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C66E4AEF9;
 Thu,  6 Feb 2020 09:27:59 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200205165056.11734-1-andrew.cooper3@citrix.com>
 <20200205165056.11734-7-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9c7f9930-02d7-13d3-88ab-bad236993e31@suse.com>
Date: Thu, 6 Feb 2020 10:28:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200205165056.11734-7-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 6/6] xen/public: Obsolete
 HVM_PARAM_PAE_ENABLED
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <Ian.Jackson@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDIuMjAyMCAxNzo1MCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gYS90b29scy9s
aWJ4Yy94Y19zcl9yZXN0b3JlX3g4Nl9odm0uYwo+ICsrKyBiL3Rvb2xzL2xpYnhjL3hjX3NyX3Jl
c3RvcmVfeDg2X2h2bS5jCj4gQEAgLTcyLDYgKzcyLDE2IEBAIHN0YXRpYyBpbnQgaGFuZGxlX2h2
bV9wYXJhbXMoc3RydWN0IHhjX3NyX2NvbnRleHQgKmN0eCwKPiAgICAgICAgICBjYXNlIEhWTV9Q
QVJBTV9CVUZJT1JFUV9QRk46Cj4gICAgICAgICAgICAgIHhjX2NsZWFyX2RvbWFpbl9wYWdlKHhj
aCwgY3R4LT5kb21pZCwgZW50cnktPnZhbHVlKTsKPiAgICAgICAgICAgICAgYnJlYWs7Cj4gKwo+
ICsgICAgICAgIGNhc2UgSFZNX1BBUkFNX1BBRV9FTkFCTEVEOgo+ICsgICAgICAgICAgICAvKgo+
ICsgICAgICAgICAgICAgKiBUaGlzIEhWTV9QQVJBTSBvbmx5IGV2ZXIgZXhpc3RlZCBhIG5vbi1z
dGFuZGFyZCBjYWxsaW5nIEFCSSBmb3IKPiArICAgICAgICAgICAgICogeGNfY3B1aWRfYXBwbHlf
cG9saWN5KCkuICBJdCBoYXMgbm93IGJlZW4gdXBkYXRlZCB0byB1c2UgYQo+ICsgICAgICAgICAg
ICAgKiByZWd1bGFyIGNhbGxpbmcgY29udmVudGlvbiwgbWFraW5nIHRoZSBwYXJhbSBvYnNvbGV0
ZS4KPiArICAgICAgICAgICAgICoKPiArICAgICAgICAgICAgICogRGlzY2FyZCBpZiB3ZSBmaW5k
IGl0IGluIGFuIG9sZCBtaWdyYXRpb24gc3RyZWFtLgo+ICsgICAgICAgICAgICAgKi8KPiArICAg
ICAgICAgICAgY29udGludWU7CgpIYXZpbmcgYWxzbyBsb29rZWQgYXQgdGhlIHByZXZpb3VzIHBh
dGNoICh0aGUgb25seSBvbmUgaW4gdGhpcyBzZXJpZXMKcmVsZXZhbnQgdG8gdGhlIGFkanVzdG1l
bnRzIGRvbmUgaGVyZSBhZmFpY3QpIEkgd29uZGVyIHdoZXRoZXIgc2ltcGx5Cmlnbm9yaW5nIGl0
IChpLmUuIG5vdCBldmVuIHdhcm5pbmcgYW55d2hlcmUgd2hlbiBvdXQgb2Ygc3luYyB3aXRoCndo
YXRldmVyIGluZm8tPnUuaHZtLnBhZSBnZXRzIHBvcHVsYXRlZCBmcm9tKSBpcyBhIGdvb2QgYXBw
cm9hY2guIEJ1dApvZiBjb3Vyc2UgSSBtYXkgYmUgZWFzaWx5IG1pc3NpbmcgYXNwZWN0cyBoZXJl
IHRoYXQgbWFrZSB0aGlzIHF1aXRlCmZpbmUuCgo+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9o
dm0vcGFyYW1zLmgKPiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL3BhcmFtcy5oCj4gQEAg
LTg2LDcgKzg2LDcgQEAKPiAgI2RlZmluZSBIVk1fUEFSQU1fU1RPUkVfUEZOICAgIDEKPiAgI2Rl
ZmluZSBIVk1fUEFSQU1fU1RPUkVfRVZUQ0hOIDIKPiAgCj4gLSNkZWZpbmUgSFZNX1BBUkFNX1BB
RV9FTkFCTEVEICA0Cj4gKyNkZWZpbmUgSFZNX1BBUkFNX1BBRV9FTkFCTEVEICA0IC8qIE9ic29s
ZXRlLiAgRG8gbm90IHVzZS4gKi8KCkkgdGhpbmsgdGhpcyBzaG91bGQgYmUgbW92ZWQgdXAgaW4g
dGhlIGRlcHJlY2F0ZWQgc2VjdGlvbi4gV2l0aCB0aGlzCmh5cGVydmlzb3IgcGFydHMKUmV2aWV3
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFzIGFuIGFzaWRlIEkgYWxz
byB0aGluayB0aGF0IHNlY3Rpb24gc2hvdWxkIGNoZWNrIGZvciBqdXN0IF9fWEVOX18sCm5vdCBh
bHNvIF9fWEVOX1RPT0xTX18uCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
