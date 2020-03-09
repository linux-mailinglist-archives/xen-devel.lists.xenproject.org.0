Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5004817E241
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 15:09:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBJ2r-0005xq-Se; Mon, 09 Mar 2020 14:06:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FVsd=42=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jBJ2q-0005xi-Nf
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 14:06:12 +0000
X-Inumbo-ID: 2180a772-620f-11ea-ac3d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2180a772-620f-11ea-ac3d-12813bfff9fa;
 Mon, 09 Mar 2020 14:06:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DE8F9ACA1;
 Mon,  9 Mar 2020 14:06:10 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200226124705.29212-1-jgross@suse.com>
 <20200226124705.29212-2-jgross@suse.com>
 <d3b83513-8fc2-634c-fa89-00df84c5c4fb@xen.org>
 <471c2f88-2ac2-823d-546f-6fc817e34ec8@suse.com>
 <f101fc47-329c-e704-86cd-0411b6a15f99@suse.com>
 <daec17e3-3964-f189-6974-bdf86689f235@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <4052bb30-9ec4-18c3-c3a8-addcb9e2afb2@suse.com>
Date: Mon, 9 Mar 2020 15:06:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <daec17e3-3964-f189-6974-bdf86689f235@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 01/12] xen: allow only sizeof(bool)
 variables for boolean_param()
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDMuMjAgMTQ6MDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjAzLjIwMjAgMTQ6
MDEsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDA5LjAzLjIwIDEyOjU1LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDA5LjAzLjIwMjAgMTI6NDMsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+
PiBPbiAyNi8wMi8yMDIwIDEyOjQ2LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+PiBAQCAtNDYs
NyArNDgsOCBAQCBleHRlcm4gY29uc3Qgc3RydWN0IGtlcm5lbF9wYXJhbSBfX3BhcmFtX3N0YXJ0
W10sIF9fcGFyYW1fZW5kW107Cj4+Pj4+ICAgICAgICAgX19rcGFyYW0gX19zZXR1cF8jI192YXIg
PSBcCj4+Pj4+ICAgICAgICAgICAgIHsgLm5hbWUgPSBfX3NldHVwX3N0cl8jI192YXIsIFwKPj4+
Pj4gICAgICAgICAgICAgICAudHlwZSA9IE9QVF9CT09MLCBcCj4+Pj4+IC0gICAgICAgICAgLmxl
biA9IHNpemVvZihfdmFyKSwgXAo+Pj4+PiArICAgICAgICAgIC5sZW4gPSBzaXplb2YoX3Zhcikg
KyBcCj4+Pj4+ICsgICAgICAgICAgICAgICAgIEJVSUxEX0JVR19PTl9aRVJPKHNpemVvZihfdmFy
KSAhPSBzaXplb2YoYm9vbCkpLCBcCj4+Pj4KPj4+PiAgICBGcm9tIG15IHVuZGVyc3RhbmRpbmcs
IHNpemVvZihib29sKSBpcyBub3QgbmVjZXNzYXJpbHkgMSAoaXQgY2FuIGJlCj4+Pj4gZ3JlYXRl
cikuIFdoaWxlIHRoaXMgaXMgZmluZSB0byB1c2UgaXQgaW4gWGVuLCBJIHRoaW5rIHdlIHdhbnQg
aXQgdG8KPj4+PiBhbHdheXMgYmUgb25lIHdoZW4gZXhwb3NlZCBpbiB0aGUgaHlwZnMuCj4+Pgo+
Pj4gSSBkb24ndCB0aGluayBzbzogV2Ugd2FudCB2YXJpYWJsZSBvZiB0eXBlICdib29sJyB0byBi
ZSB1cGRhdGVkCj4+PiBjb25zaXN0ZW50bHkgKGkuZS4gYnkgYSB3cml0ZSB0byB0aGUgZnVsbCB2
YXJpYWJsZSkuIEhlbmNlIEkKPj4+IHRoaW5rIHNpemVvZihib29sKSBpcyBjb3JyZWN0IGhlcmUu
IEkgY2FuIHNlZSB0aG91Z2ggdGhhdCB0aGUKPj4+IGh5cGVyY2FsbCBpbnRlcmZhY2UgdGhlbiBn
YWlucyBhIGRlcGVuZGVuY3kgb24gdGhlIGh5cGVydmlzb3Incwo+Pj4gcmVwcmVzZW50YXRpb24g
b2YgJ2Jvb2wnLCBidXQgSSB0aGluayBzdWNoIG91Z2h0IHRvIGJlIHRha2VuCj4+PiBjYXJlIG9m
IGluIHRoZSBmdW5jdGlvbiBjYXJyeWluZyBvdXQgdGhlIHdyaXRlLCBub3QgaW4gdGhlCj4+PiBt
YWNybyBoZXJlLgo+Pgo+PiBTbyB5b3UgdGhpbmsgSSBzaG91bGQgc3BlY2lhbCBjYXNlIGJvb2wg
ZW50cmllcyB3aGVuIHJldHVybmluZyB0aGUKPj4gc2l6ZSBpbmZvcm1hdGlvbj8gT3IgZG8geW91
IHRoaW5rIGl0cyBmaW5lIHRvIGhhdmUgdGhlIGh5cGVydmlzb3Incwo+PiBzaXplIHJlcG9ydGVk
IGFuZCBsZXQgdGhlIGxpYiBkbyB0aGUgc2l6ZSBoYW5kbGluZyBjb3JyZWN0bHk/Cj4gCj4gRWl0
aGVyIHdheSB3b3VsZCBiZSBmaW5lIGJ5IG1lLCBidXQgSSB0aGluayBub3QgaGF2aW5nIGNhbGxl
cnMgaGF2ZQo+IGEgKHJlcXVpcmVkKSB3YXkgdG8ga25vdyB0aGUgaHlwZXJ2aXNvcidzIHNpemVv
Zihib29sKSB3b3VsZCBiZSBhCj4gbW9yZSBjbGVhbiBpbnRlcmZhY2Ugb3ZlcmFsbC4KClRoZSBz
aXplIGlzIHJlcG9ydGVkIHZpYSB0aGUgZGlyZW50LCBzbyB0aGlzIGlzIGZpbmUuIEFuZCB3aGVu
IHlvdSBoYXZlCmEgbG9vayBpbnRvIHBhdGNoIDUgeW91J2xsIHNlZSB0aGF0IHRoZSB3cml0aW5n
IG9mIHRoZSBib29sIGlzIG1lcmdlZAp3aXRoIHRoZSB1aW50IHdyaXRpbmcgaW4gdGhlIGxpYiBj
b2RlLiBJIHNob3VsZCByZW1vdmUgdGhlIHNhZmV0eSBjaGVjawpyZWdhcmRpbmcgc2l6ZW9mKGJv
b2wpIG1hdGNoaW5nIHRoZSBzaXplIHJlcG9ydGVkIGluIHRoZSBkaXJlbnQsIGhvd2V2ZXIKKHRo
aXMgaXMgYSBsZWZ0b3ZlciBJIGZvcmdvdCB0byByZW1vdmUpLgoKCkp1ZXJnZW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
