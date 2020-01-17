Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8101405AA
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 09:56:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isNNn-0002DG-IN; Fri, 17 Jan 2020 08:53:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HJCJ=3G=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1isNNl-0002C8-5g
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 08:53:33 +0000
X-Inumbo-ID: d1e03218-3906-11ea-a2eb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1e03218-3906-11ea-a2eb-bc764e2007e4;
 Fri, 17 Jan 2020 08:53:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A21A2AEDC;
 Fri, 17 Jan 2020 08:53:23 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200109134825.31482-1-jgross@suse.com>
 <20200109134825.31482-2-jgross@suse.com>
 <f1e82975-0789-68b8-691b-02f557c27400@suse.com>
 <aacfae4e-39ca-b183-8b8a-b347415ba553@suse.com>
 <251bd26c-1937-e70b-3ec3-6ebb10e879dc@suse.com>
 <aedc415a-5a54-5f54-8daa-14685eb78276@citrix.com>
 <3be7b516-26f0-080a-f683-f9e0fe99e0ea@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <c69fd26d-15f8-6dc7-b86b-b2add6b133af@suse.com>
Date: Fri, 17 Jan 2020 09:53:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <3be7b516-26f0-080a-f683-f9e0fe99e0ea@suse.com>
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
 IanJackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDEuMjAgMDk6MzksIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE2LjAxLjIwMjAgMTk6
NTQsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDE0LzAxLzIwMjAgMTY6MTIsIEphbiBCZXVs
aWNoIHdyb3RlOgo+Pj4gT24gMTQuMDEuMjAyMCAxNzowMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToK
Pj4+PiBPbiAxNC4wMS4yMCAxNjo0NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDA5LjAx
LjIwMjAgMTQ6NDgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+PiAtLS0gYS94ZW4vS2NvbmZp
Zy5kZWJ1Zwo+Pj4+Pj4gKysrIGIveGVuL0tjb25maWcuZGVidWcKPj4+Pj4+IEBAIC04MSw2ICs4
MSwxMiBAQCBjb25maWcgUEVSRl9BUlJBWVMKPj4+Pj4+ICAgIAktLS1oZWxwLS0tCj4+Pj4+PiAg
ICAJICBFbmFibGVzIHNvZnR3YXJlIHBlcmZvcm1hbmNlIGNvdW50ZXIgYXJyYXkgaGlzdG9ncmFt
cy4KPj4+Pj4+ICAgIAo+Pj4+Pj4gK2NvbmZpZyBERUJVR19CVUdWRVJCT1NFCj4+Pj4+PiArCWJv
b2wgIlZlcmJvc2UgQlVHX09OIG1lc3NhZ2VzIgo+Pj4+Pj4gKwlkZWZhdWx0IERFQlVHCj4+Pj4+
PiArCS0tLWhlbHAtLS0KPj4+Pj4+ICsJICBJbiBjYXNlIGEgQlVHX09OIHRyaWdnZXJzIGFkZGl0
aW9uYWxseSBwcmludCB0aGUgdHJpZ2dlcmluZwo+Pj4+Pj4gKwkgIGNvbmRpdGlvbiBvbiB0aGUg
Y29uc29sZS4KPj4+Pj4+ICAgIAo+Pj4+Pj4gICAgY29uZmlnIFZFUkJPU0VfREVCVUcKPj4+Pj4g
V2hpbGUgSSBjYW4gc2VlIHJlYXNvbnMgdG8gcHV0IHRoaXMgaGVyZSwgZG9pbmcgc28gbWVhbnMg
dGhlIG9wdGlvbgo+Pj4+PiB3aWxsIGJlIHVuYXZhaWxhYmxlIGluIG5vbi1FWFBFUlQgcmVsZWFz
ZSBidWlsZHMuIElzIGl0IGludGVuZGVkIHRvCj4+Pj4+IGJlIHRoYXQgd2F5Pwo+Pj4+IEkgY2Fu
IG1vdmUgaXQgZWl0aGVyIHRvIHhlbi9LY29uZmlnIG9yIGluIEtjb25maWcuZGVidWcgb3V0IG9m
IHRoZQo+Pj4+ICJpZiBleHBlcnQiIHNlY3Rpb24gaWYgeW91IHdhbnQuCj4+PiBJIHRoaW5rIHRo
aXMgd291bGQgYmUgYmV0dGVyLCBidXQgZ2l2ZSBvdGhlcnMgYSBjaGFuY2UgdG8gdm9pY2UKPj4+
IG9waW5pb25zLgo+Pgo+PiBUQkgsIEkgZG9uJ3QgdGhpbmsgYW55b25lIHdpbGwgYmUgaW50ZXJl
c3RlZCBpbiBub3QgaGF2aW5nIHRoZSBzdHJpbmdzLgo+PiBUaGUgY2hhbmdlIGlzIHdoYXQ/IGEg
Y291cGxlIG9mIGh1bmRyZWQgYnl0ZXM/wqAgVGhhdCBpcyBhIGZyYWN0aW9uIG9mCj4+IHRoZSBz
aXplIG9mIHNvbWUgZnVuY3Rpb25zIHdlIGhhdmUuCj4gCj4gV2VsbCwgaXQncyBhIGNvdXBsZSB0
aG91c2FuZCAoYWJvdXQgN2sgYWNjb3JkaW5nIHRvIG15IHNpbXBsaXN0aWMKPiBlc3RpbWF0aW9u
LCBidXQgdGhpcyBpcyB0YWtpbmcgQXJtIGFuZCB4ODYgdG9nZXRoZXIpLiBJdCdzIG5vdCB0aGUK
PiBlbmQgb2YgdGhlIHdvcmxkLCBidXQgaW4gcGFydGljdWxhciBlbWJlZGRlZCB1c2VycyBtYXkg
d2FudCB0byBnZXQKPiByaWQgb2YgdGhpcy4gVGhlcmUncyBhIHJlYXNvbiBhZnRlciBhbGwgKEkg
YXNzdW1lKSB0aGF0IExpbnV4IGhhcwo+IHRoZSBvcHRpb24uCgpUaGUgbmVlZGVkIGNvZGUgY2h1
cm4gaXMgcmF0aGVyIGxpbWl0ZWQsIHNvIEkgdGhpbmsgd2Ugc2hvdWxkIGtlZXAgdGhlCmNvbmZp
ZyBvcHRpb24uCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
