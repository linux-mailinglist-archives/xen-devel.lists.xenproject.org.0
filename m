Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F7A13AE48
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 17:03:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irOby-00014B-T5; Tue, 14 Jan 2020 16:00:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2XF3=3D=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1irObx-00013t-Ly
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 16:00:09 +0000
X-Inumbo-ID: ed64c994-36e6-11ea-83eb-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ed64c994-36e6-11ea-83eb-12813bfff9fa;
 Tue, 14 Jan 2020 16:00:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7E739ADE7;
 Tue, 14 Jan 2020 16:00:03 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200109134825.31482-1-jgross@suse.com>
 <20200109134825.31482-2-jgross@suse.com>
 <f1e82975-0789-68b8-691b-02f557c27400@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <aacfae4e-39ca-b183-8b8a-b347415ba553@suse.com>
Date: Tue, 14 Jan 2020 17:00:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <f1e82975-0789-68b8-691b-02f557c27400@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/2] xen: add config option to include
 failing condition in BUG_ON() message
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDEuMjAgMTY6NDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjAxLjIwMjAgMTQ6
NDgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9LY29uZmlnLmRlYnVnCj4+ICsr
KyBiL3hlbi9LY29uZmlnLmRlYnVnCj4+IEBAIC04MSw2ICs4MSwxMiBAQCBjb25maWcgUEVSRl9B
UlJBWVMKPj4gICAJLS0taGVscC0tLQo+PiAgIAkgIEVuYWJsZXMgc29mdHdhcmUgcGVyZm9ybWFu
Y2UgY291bnRlciBhcnJheSBoaXN0b2dyYW1zLgo+PiAgIAo+PiArY29uZmlnIERFQlVHX0JVR1ZF
UkJPU0UKPj4gKwlib29sICJWZXJib3NlIEJVR19PTiBtZXNzYWdlcyIKPj4gKwlkZWZhdWx0IERF
QlVHCj4+ICsJLS0taGVscC0tLQo+PiArCSAgSW4gY2FzZSBhIEJVR19PTiB0cmlnZ2VycyBhZGRp
dGlvbmFsbHkgcHJpbnQgdGhlIHRyaWdnZXJpbmcKPj4gKwkgIGNvbmRpdGlvbiBvbiB0aGUgY29u
c29sZS4KPj4gICAKPj4gICBjb25maWcgVkVSQk9TRV9ERUJVRwo+IAo+IFdoaWxlIEkgY2FuIHNl
ZSByZWFzb25zIHRvIHB1dCB0aGlzIGhlcmUsIGRvaW5nIHNvIG1lYW5zIHRoZSBvcHRpb24KPiB3
aWxsIGJlIHVuYXZhaWxhYmxlIGluIG5vbi1FWFBFUlQgcmVsZWFzZSBidWlsZHMuIElzIGl0IGlu
dGVuZGVkIHRvCj4gYmUgdGhhdCB3YXk/CgpJIGNhbiBtb3ZlIGl0IGVpdGhlciB0byB4ZW4vS2Nv
bmZpZyBvciBpbiBLY29uZmlnLmRlYnVnIG91dCBvZiB0aGUKImlmIGV4cGVydCIgc2VjdGlvbiBp
ZiB5b3Ugd2FudC4KCj4gCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9saWIuaAo+PiArKysgYi94
ZW4vaW5jbHVkZS94ZW4vbGliLmgKPj4gQEAgLTgsNyArOCwxMiBAQAo+PiAgICNpbmNsdWRlIDx4
ZW4vc3RyaW5nLmg+Cj4+ICAgI2luY2x1ZGUgPGFzbS9idWcuaD4KPj4gICAKPj4gKyNkZWZpbmUg
QlVHX09OX1ZFUkJPU0UocCkgZG8geyBpZiAodW5saWtlbHkocCkpIEJVR19WRVJCT1NFKCNwKTsg
IH0gd2hpbGUgKDApCj4+ICsjaWZkZWYgQ09ORklHX0RFQlVHX0JVR1ZFUkJPU0UKPj4gKyNkZWZp
bmUgQlVHX09OKHApICBCVUdfT05fVkVSQk9TRShwKQo+IAo+IExvb2tzIGxpa2UgdGhpcyB3aWxs
IGZhaWwgdG8gYnVpbGQgb24gQXJtPyBBbHNvIC0gYW55IHBhcnRpY3VsYXIKClVoLCBzaGFtZSBv
biBtZSEKCj4gcmVhc29uIGZvciB0aGUgaW50cm9kdWN0aW9uIG9mIHRoZSBzZXBhcmF0ZSBCVUdf
T05fVkVSQk9TRSgpLAo+IHdoZW4gQlVHX09OKCkgY291bGQgZGlyZWN0bHkgdXNlIEJVR19WRVJC
T1NFKCk/IEkgZG9uJ3QgdGhpbmsgd2UKPiB3YW50IHRvIGVuY291cmFnZSB1c2Ugb2YgQlVHX09O
X1ZFUkJPU0UoKSBlbHNld2hlcmUgLi4uCgpJIHdhbnRlZCB0byBvZmZlciB0aGF0IG9wdGlvbi4g
SWYgeW91IHdhbnQgbWUgdG8gcmVtb3ZlIGl0IEkgd291bGRuJ3QKbWluZC4KCgpKdWVyZ2VuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
