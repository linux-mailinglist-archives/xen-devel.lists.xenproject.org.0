Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BB8109E7B
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 14:05:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZaTN-0000I3-8k; Tue, 26 Nov 2019 13:01:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/0/a=ZS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iZaTL-0000Hy-QB
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 13:01:39 +0000
X-Inumbo-ID: e1b65902-104c-11ea-a3a0-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e1b65902-104c-11ea-a3a0-12813bfff9fa;
 Tue, 26 Nov 2019 13:01:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4AF59B1B8;
 Tue, 26 Nov 2019 13:01:37 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>
References: <20191125145915.106589-1-anthony.perard@citrix.com>
 <166a5c3f-a096-9d35-670f-e7f50da847ef@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <56566adc-5f06-6171-b495-4c7a711538c2@suse.com>
Date: Tue, 26 Nov 2019 14:01:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <166a5c3f-a096-9d35-670f-e7f50da847ef@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2] x86/domctl: have
 XEN_DOMCTL_getpageframeinfo3 preemptible
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
 AndrewCooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMTEuMTkgMTc6MjIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI1LjExLjIwMTkgMTU6
NTksIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+PiBUaGlzIGh5cGVyY2FsbCBjYW4gdGFrZSBhIGxv
bmcgdGltZSB0byBmaW5pc2ggYmVjYXVzZSBpdCBhdHRlbXB0cyB0bwo+PiBncmFiIHRoZSBgaG9z
dHAybScgbG9jayB1cCB0byAxMDI0IHRpbWVzLiBUaGUgYWNjdW11bGF0ZWQgd2FpdCBmb3IgdGhl
Cj4+IGxvY2sgY2FuIHRha2Ugc2V2ZXJhbCBzZWNvbmRzLgo+Pgo+PiBUaGlzIGNhbiBlYXNpbHkg
aGFwcGVuIHdpdGggYSBndWVzdCB3aXRoIDMyIHZjcHVzIGFuZCBwbGVudHkgb2YgUkFNLAo+PiBk
dXJpbmcgbG9jYWxob3N0IG1pZ3JhdGlvbi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQ
RVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gCj4gQXMgaW5kaWNhdGVkIG9uIHYx
IGFscmVhZHksIHRoaXMgYmVpbmcgYSB3b3JrYXJvdW5kIHJhdGhlciB0aGFuIGEgZml4Cj4gc2hv
dWxkIGJlIHN0YXRlZCBjbGVhcmx5IGluIHRoZSBkZXNjcmlwdGlvbi4gRXNwZWNpYWxseSBpZiBt
b3JlIHN1Y2gKPiBvcGVyYXRpb25zIHR1cm4gdXAsIGl0J2xsIGJlY29tZSBpbmNyZWFzaW5nbHkg
b2J2aW91cyB0aGF0IHRoZSByb290Cj4gb2YgdGhlIHByb2JsZW0gd2lsbCBuZWVkIGRlYWxpbmcg
d2l0aCByYXRoZXIgdGhhbiBwYXBlcmluZyBvdmVyIHNvbWUKPiBvZiB0aGUgc3ltcHRvbXMuIFdp
dGggdGhpcyB0YWtlbiBjYXJlIG9mIEknZCBiZSAoc3RpbGwgaGVzaXRhbnRseSkKPiB3aWxsaW5n
IHRvIGdpdmUgbXkgYWNrIGZvciB0aGlzIGFzIGEgc2hvcnQgdGVybSAic29sdXRpb24iLgo+IAo+
PiAtLS0gYS94ZW4vYXJjaC94ODYvZG9tY3RsLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2RvbWN0
bC5jCj4+IEBAIC00MjUsNiArNDI1LDI2IEBAIGxvbmcgYXJjaF9kb19kb21jdGwoCj4+ICAgICAg
ICAgICAgICAgICAgIHJldCA9IC1FRkFVTFQ7Cj4+ICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+
PiAgICAgICAgICAgICAgIH0KPj4gKwo+PiArICAgICAgICAgICAgLyoKPj4gKyAgICAgICAgICAg
ICAqIEF2b2lkIGNoZWNraW5nIGZvciBwcmVlbXB0aW9uIHdoZW4gdGhlIGBob3N0cDJtJyBsb2Nr
IGlzbid0Cj4+ICsgICAgICAgICAgICAgKiBpbnZvbHZlLCBpLmUuIG5vbi10cmFuc2xhdGVkIGd1
ZXN0LCBhbmQgYXZvaWQgcHJlZW1wdGlvbiBvbgo+PiArICAgICAgICAgICAgICogdGhlIGxhc3Qg
aXRlcmF0aW9uLgo+PiArICAgICAgICAgICAgICovCj4+ICsgICAgICAgICAgICBpZiAoIHBhZ2lu
Z19tb2RlX3RyYW5zbGF0ZShkKSAmJgo+PiArICAgICAgICAgICAgICAgICBsaWtlbHkoKGkgKyAx
KSA8IG51bSkgJiYgaHlwZXJjYWxsX3ByZWVtcHRfY2hlY2soKSApCj4+ICsgICAgICAgICAgICB7
Cj4+ICsgICAgICAgICAgICAgICAgZG9tY3RsLT51LmdldHBhZ2VmcmFtZWluZm8zLm51bSA9IG51
bSAtIGkgLSAxOwo+PiArICAgICAgICAgICAgICAgIGRvbWN0bC0+dS5nZXRwYWdlZnJhbWVpbmZv
My5hcnJheS5wID0KPj4gKyAgICAgICAgICAgICAgICAgICAgZ3Vlc3RfaGFuZGxlICsgKChpICsg
MSkgKiB3aWR0aCk7Cj4+ICsgICAgICAgICAgICAgICAgaWYgKCBfX2NvcHlfdG9fZ3Vlc3QodV9k
b21jdGwsIGRvbWN0bCwgMSkgKQo+PiArICAgICAgICAgICAgICAgIHsKPj4gKyAgICAgICAgICAg
ICAgICAgICAgcmV0ID0gLUVGQVVMVDsKPj4gKyAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4+
ICsgICAgICAgICAgICAgICAgfQo+PiArICAgICAgICAgICAgICAgIHJldHVybiBoeXBlcmNhbGxf
Y3JlYXRlX2NvbnRpbnVhdGlvbihfX0hZUEVSVklTT1JfZG9tY3RsLAo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiaCIsIHVfZG9tY3RsKTsK
Pj4gKyAgICAgICAgICAgIH0KPj4gICAgICAgICAgIH0KPj4gICAKPj4gICAgICAgICAgIGJyZWFr
Owo+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oIGIveGVuL2luY2x1
ZGUvcHVibGljL2RvbWN0bC5oCj4+IGluZGV4IGEwM2U4MGU1OTg0YS4uMWI2OWViNzVjYjIwIDEw
MDY0NAo+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgKPj4gKysrIGIveGVuL2lu
Y2x1ZGUvcHVibGljL2RvbWN0bC5oCj4+IEBAIC0xNjMsNiArMTYzLDEwIEBAIERFRklORV9YRU5f
R1VFU1RfSEFORExFKHhlbl9kb21jdGxfZ2V0ZG9tYWluaW5mb190KTsKPj4gICAjZGVmaW5lIFhF
Tl9ET01DVExfUEZJTkZPX0xUQUJfTUFTSyAoMHhmVTw8MjgpCj4+ICAgCj4+ICAgLyogWEVOX0RP
TUNUTF9nZXRwYWdlZnJhbWVpbmZvMyAqLwo+PiArLyoKPj4gKyAqIEJvdGggdmFsdWUgYG51bScg
YW5kIGBhcnJheScgYXJlIG1vZGlmaWVkIGJ5IHRoZSBoeXBlcmNhbGwgdG8gYWxsb3cKPj4gKyAq
IHByZWVtcHRpb24uCj4gCj4gcy9hcmUvbWF5IGJlLyA/Cj4gCj4gSWYgSnVlcmdlbiB3YW50cyB0
byBzdGlsbCBhbGxvdyB0aGlzIGluLCBJJ2QgYmUgZmluZSB0YWtpbmcgY2FyZSBvZiBib3RoCj4g
cmVtYXJrcyB3aGlsZSBjb21taXR0aW5nLgoKU29ycnksIHdhcyBvbmx5IHNjYW5uaW5nIGZvciBh
biBBY2suCgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
