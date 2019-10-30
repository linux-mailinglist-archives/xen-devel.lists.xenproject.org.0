Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28195E9AB4
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2019 12:24:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPm2V-0002s8-Ko; Wed, 30 Oct 2019 11:21:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iUym=YX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iPm2U-0002s3-D9
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2019 11:21:22 +0000
X-Inumbo-ID: 664b1a6e-fb07-11e9-9521-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 664b1a6e-fb07-11e9-9521-12813bfff9fa;
 Wed, 30 Oct 2019 11:21:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 72B98B01D;
 Wed, 30 Oct 2019 11:21:20 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
 <20191023135812.21348-6-andrew.cooper3@citrix.com>
 <36bbdcf7-28c3-b924-3d3a-145b6282bd0f@suse.com>
 <1f0bd38c-d1c4-fa45-d13e-55615be4188e@citrix.com>
 <ffa68df2-0f4c-da6c-cd57-29746ae5f889@suse.com>
 <fa559690-4a22-59ac-c81c-3ee6183ef212@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4807c501-871a-2bf6-f34c-4ddd2567ffd5@suse.com>
Date: Wed, 30 Oct 2019 12:21:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <fa559690-4a22-59ac-c81c-3ee6183ef212@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 5/7] x86/livepatch: Fail the build if
 duplicate symbols exist
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Norbert Manthey <nmanthey@amazon.de>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMTAuMjAxOSAxMTozNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAzMC8xMC8yMDE5
IDA4OjQxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjkuMTAuMjAxOSAxODowNiwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDI0LzEwLzIwMTkgMTM6MDMsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IE9uIDIzLjEwLjIwMTkgMTU6NTgsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+IC0t
LSBhL3hlbi9jb21tb24vS2NvbmZpZwo+Pj4+PiArKysgYi94ZW4vY29tbW9uL0tjb25maWcKPj4+
Pj4gQEAgLTM2MSw5ICszNjEsMjMgQEAgY29uZmlnIEZBU1RfU1lNQk9MX0xPT0tVUAo+Pj4+PiAg
Cj4+Pj4+ICAJICBJZiB1bnN1cmUsIHNheSBZLgo+Pj4+PiAgCj4+Pj4+ICtjb25maWcgRU5GT1JD
RV9VTklRVUVfU1lNQk9MUwo+Pj4+PiArCWJvb2wgIkVuZm9yY2UgdW5pcXVlIHN5bWJvbHMiIGlm
IExJVkVQQVRDSAo+Pj4+PiArCWRlZmF1bHQgeSBpZiBMSVZFUEFUQ0gKPj4+PiBJbnN0ZWFkIG9m
IHR3byBpZGVudGljYWwgImlmIiwgd2h5IG5vdCAiZGVwZW5kcyBvbiBMSVZFUEFUQ0giPwo+Pj4+
Cj4+Pj4+ICsJLS0taGVscC0tLQo+Pj4+PiArCSAgTXVsdGlwbGUgc3ltYm9scyB3aXRoIHRoZSBz
YW1lIG5hbWUgYXJlbid0IGdlbmVyYWxseSBhIHByb2JsZW0KPj4+Pj4gKwkgIHVubGVzcyBMaXZl
IHBhdGNoaW5nIGlzIHRvIGJlIHVzZWQuCj4+Pj4+ICsKPj4+Pj4gKwkgIExpdmVwYXRjaCBsb2Fk
aW5nIGludm9sdmVzIHJlc29sdmluZyByZWxvY2F0aW9ucyBhZ2FpbnN0IHN5bWJvbAo+Pj4+PiAr
CSAgbmFtZXMsIGFuZCBhdHRlbXB0aW5nIHRvIGEgZHVwbGljYXRlIHN5bWJvbCBpbiBhIGxpdmVw
YXRjaCB3aWxsCj4+Pj4+ICsJICByZXN1bHQgaW4gaW5jb3JyZWN0IGxpdmVwYXRjaCBhcHBsaWNh
dGlvbi4KPj4+Pj4gKwo+Pj4+PiArCSAgVGhpcyBvcHRpb24gc2hvdWxkIGJlIHVzZWQgdG8gZW5z
dXJlIHRoYXQgYSBidWlsZCBvZiBYZW4gY2FuIGhhdmUgYQo+Pj4+PiArCSAgbGl2ZXBhdGNoIGJ1
aWxkIGFuZCBhcHBseSBjb3JyZWN0bHkuCj4+Pj4+ICsKPj4+Pj4gIGNvbmZpZyBTVVBQUkVTU19E
VVBMSUNBVEVfU1lNQk9MX1dBUk5JTkdTCj4+Pj4+IC0JYm9vbCAiU3VwcHJlc3MgZHVwbGljYXRl
IHN5bWJvbCB3YXJuaW5ncyIgaWYgIUxJVkVQQVRDSAo+Pj4+PiAtCWRlZmF1bHQgeSBpZiAhTElW
RVBBVENICj4+Pj4+ICsJYm9vbCAiU3VwcHJlc3MgZHVwbGljYXRlIHN5bWJvbCB3YXJuaW5ncyIg
aWYgIUVORk9SQ0VfVU5JUVVFX1NZTUJPTFMKPj4+Pj4gKwlkZWZhdWx0IHkgaWYgIUVORk9SQ0Vf
VU5JUVVFX1NZTUJPTFMKPj4+PiBTaW1pbGFybHkgaGVyZSB0aGVuLiBXaXRoIHRoaXMgY2hhbmdl
ZCwgb3Igd2l0aCBhIHByb3BlciByZWFzb24KPj4+PiBzdXBwbGllZAo+Pj4+IFJldmlld2VkLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+PiBUaGF0J3MgYSBxdWVzdGlvbiBm
b3IgdGhlIGF1dGhvciBvZiBjL3MgMDY0YTI2NTIyMzMgdG8gYW5zd2VyLi4uwqAgSSdtCj4+PiBt
ZXJlbHkgZm9sbG93aW5nIHRoZSBwcmV2YWlsaW5nIHN0eWxlLgo+PiAiUHJldmFpbGluZyBzdHls
ZSIgc2VlbXMgYSBsaXR0bGUgYm9sZCBjb25zaWRlcmluZyB0aGF0IGFjY29yZGluZyB0bwo+PiBt
eSBncmVwLWluZyB0aGVyZSdzIGV4YWN0bHkgb24gb3RoZXIgc3VjaCBpbnN0YW5jZSAoVkdBKS4g
SS5lLiB5b3UnZAo+PiBncm93IHRoZSAiYmFkbmVzcyIgYnkgNTAlIHdoZW4geW91IGNvdWxkIGVx
dWFsbHkgd2VsbCBzaHJpbmsgaXQgYnkKPj4gdGhpcyBzYW1lIHBlcmNlbnRhZ2UuCj4gCj4gQWxs
b3cgbWUgdG8gYmUgbGVzcyBzdWJ0bGUuCj4gCj4gKllvdSogYXJlIHRoZSBhdXRob3Igb2YgdGhl
IGNvZGUsIGluIHRoaXMgZm9ybS4KCkknbSBzb3JyeSBmb3Igbm90IHJlY2FsbGluZy4KCj4gQXMg
YSBjb25zZXF1ZW5jZSwgSSBleHBlY3QgdGhlcmUgaXMgYSBkZWxpYmVyYXRlIHJlYXNvbi4KPiAK
PiBBbmQgc2VlaW5nIGFzIEkndmUgaGFkIHRvIHJldmVyc2UgZW5naW5lZXIgdGhlIHJlYXNvbiBt
eXNlbGYsIGl0IGxvb2tzCj4gdG8gYmUgcmVsYXRlZCB0byB0aGUgZmFjdCB0aGF0IG90aGVyIG9w
dGlvbnMgaW4gdGhlIGJ1aWxkIHNlbGVjdCB0aGVzZSwKPiBzbyB0aGV5IG5lZWQgbm90IHRvIGJl
IGRlcGVuZGVudCBvbiBsaXZlcGF0Y2hpbmcgaW4gdGhlIGZpcnN0IHBsYWNlLgoKSXQgd2Fzbid0
IHdpdGhvdXQgcmVhc29uIHRoYXQgSSBkaWQgc2F5ICJvciB3aXRoIGEgcHJvcGVyIHJlYXNvbgpz
dXBwbGllZCIgLSB0aGUgc2VsZWN0IGluIHhlbi9LY29uZmlnLmRlYnVnIGlzIGEgcHJvcGVyIHJl
YXNvbiBmb3IKU1VQUFJFU1NfRFVQTElDQVRFX1NZTUJPTF9XQVJOSU5HUyBzdGF5aW5nIGFzIGl0
IGlzLCBpbmRlZWQuIEJ1dAppdCdzIHRoZW4gc3RpbGwgbm90IGEgcmVhc29uIGZvciBFTkZPUkNF
X1VOSVFVRV9TWU1CT0xTIHRvIGJlCnRoaXMgc2FtZSB3YXksIGFzIHRoZXJlJ3Mgbm8gc2ltaWxh
ciBzZWxlY3QgZm9yIGl0IGFueXdoZXJlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
