Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 271A813AEF1
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 17:15:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irOoC-0002dl-SP; Tue, 14 Jan 2020 16:12:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZPm=3D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irOoB-0002dX-DD
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 16:12:47 +0000
X-Inumbo-ID: aedb31fc-36e8-11ea-b89f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aedb31fc-36e8-11ea-b89f-bc764e2007e4;
 Tue, 14 Jan 2020 16:12:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8DCD8AAC3;
 Tue, 14 Jan 2020 16:12:37 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200109134825.31482-1-jgross@suse.com>
 <20200109134825.31482-2-jgross@suse.com>
 <f1e82975-0789-68b8-691b-02f557c27400@suse.com>
 <aacfae4e-39ca-b183-8b8a-b347415ba553@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <251bd26c-1937-e70b-3ec3-6ebb10e879dc@suse.com>
Date: Tue, 14 Jan 2020 17:12:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <aacfae4e-39ca-b183-8b8a-b347415ba553@suse.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDEuMjAyMCAxNzowMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxNC4wMS4yMCAx
Njo0NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA5LjAxLjIwMjAgMTQ6NDgsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiAtLS0gYS94ZW4vS2NvbmZpZy5kZWJ1Zwo+Pj4gKysrIGIveGVuL0tj
b25maWcuZGVidWcKPj4+IEBAIC04MSw2ICs4MSwxMiBAQCBjb25maWcgUEVSRl9BUlJBWVMKPj4+
ICAgCS0tLWhlbHAtLS0KPj4+ICAgCSAgRW5hYmxlcyBzb2Z0d2FyZSBwZXJmb3JtYW5jZSBjb3Vu
dGVyIGFycmF5IGhpc3RvZ3JhbXMuCj4+PiAgIAo+Pj4gK2NvbmZpZyBERUJVR19CVUdWRVJCT1NF
Cj4+PiArCWJvb2wgIlZlcmJvc2UgQlVHX09OIG1lc3NhZ2VzIgo+Pj4gKwlkZWZhdWx0IERFQlVH
Cj4+PiArCS0tLWhlbHAtLS0KPj4+ICsJICBJbiBjYXNlIGEgQlVHX09OIHRyaWdnZXJzIGFkZGl0
aW9uYWxseSBwcmludCB0aGUgdHJpZ2dlcmluZwo+Pj4gKwkgIGNvbmRpdGlvbiBvbiB0aGUgY29u
c29sZS4KPj4+ICAgCj4+PiAgIGNvbmZpZyBWRVJCT1NFX0RFQlVHCj4+Cj4+IFdoaWxlIEkgY2Fu
IHNlZSByZWFzb25zIHRvIHB1dCB0aGlzIGhlcmUsIGRvaW5nIHNvIG1lYW5zIHRoZSBvcHRpb24K
Pj4gd2lsbCBiZSB1bmF2YWlsYWJsZSBpbiBub24tRVhQRVJUIHJlbGVhc2UgYnVpbGRzLiBJcyBp
dCBpbnRlbmRlZCB0bwo+PiBiZSB0aGF0IHdheT8KPiAKPiBJIGNhbiBtb3ZlIGl0IGVpdGhlciB0
byB4ZW4vS2NvbmZpZyBvciBpbiBLY29uZmlnLmRlYnVnIG91dCBvZiB0aGUKPiAiaWYgZXhwZXJ0
IiBzZWN0aW9uIGlmIHlvdSB3YW50LgoKSSB0aGluayB0aGlzIHdvdWxkIGJlIGJldHRlciwgYnV0
IGdpdmUgb3RoZXJzIGEgY2hhbmNlIHRvIHZvaWNlCm9waW5pb25zLgoKPj4+IC0tLSBhL3hlbi9p
bmNsdWRlL3hlbi9saWIuaAo+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2xpYi5oCj4+PiBAQCAt
OCw3ICs4LDEyIEBACj4+PiAgICNpbmNsdWRlIDx4ZW4vc3RyaW5nLmg+Cj4+PiAgICNpbmNsdWRl
IDxhc20vYnVnLmg+Cj4+PiAgIAo+Pj4gKyNkZWZpbmUgQlVHX09OX1ZFUkJPU0UocCkgZG8geyBp
ZiAodW5saWtlbHkocCkpIEJVR19WRVJCT1NFKCNwKTsgIH0gd2hpbGUgKDApCj4+PiArI2lmZGVm
IENPTkZJR19ERUJVR19CVUdWRVJCT1NFCj4+PiArI2RlZmluZSBCVUdfT04ocCkgIEJVR19PTl9W
RVJCT1NFKHApCj4+Cj4+IExvb2tzIGxpa2UgdGhpcyB3aWxsIGZhaWwgdG8gYnVpbGQgb24gQXJt
PyBBbHNvIC0gYW55IHBhcnRpY3VsYXIKPiAKPiBVaCwgc2hhbWUgb24gbWUhCj4gCj4+IHJlYXNv
biBmb3IgdGhlIGludHJvZHVjdGlvbiBvZiB0aGUgc2VwYXJhdGUgQlVHX09OX1ZFUkJPU0UoKSwK
Pj4gd2hlbiBCVUdfT04oKSBjb3VsZCBkaXJlY3RseSB1c2UgQlVHX1ZFUkJPU0UoKT8gSSBkb24n
dCB0aGluayB3ZQo+PiB3YW50IHRvIGVuY291cmFnZSB1c2Ugb2YgQlVHX09OX1ZFUkJPU0UoKSBl
bHNld2hlcmUgLi4uCj4gCj4gSSB3YW50ZWQgdG8gb2ZmZXIgdGhhdCBvcHRpb24uIElmIHlvdSB3
YW50IG1lIHRvIHJlbW92ZSBpdCBJIHdvdWxkbid0Cj4gbWluZC4KCkFzIGFib3ZlIC0gdW5sZXNz
IHRoZXJlIGFyZSBnb29kIHJlYXNvbnMgKG1ha2luZyBvdGhlcnMgdG8gYWdyZWUKd2l0aCB5b3Ug
dG8gaGF2ZSBpdCksIEknZCBwcmVmZXIgdG8gbm90IHNlZSBpdCBiZWluZyBpbmRlcGVuZGVudGx5
CnVzYWJsZSwgYXQgbGVhc3QgZm9yIHRoZSB0aW1lIGJlaW5nLgoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
