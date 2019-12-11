Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E42C11A838
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 10:50:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieya9-0007GX-P2; Wed, 11 Dec 2019 09:46:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bHGM=2B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ieya8-0007GS-Ne
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 09:46:56 +0000
X-Inumbo-ID: 2a5bd8b2-1bfb-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a5bd8b2-1bfb-11ea-88e7-bc764e2007e4;
 Wed, 11 Dec 2019 09:46:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 234D1AC46;
 Wed, 11 Dec 2019 09:46:54 +0000 (UTC)
To: Eslam Elnikety <elnikety@amazon.com>
References: <20191209084119.87563-1-elnikety@amazon.com>
 <180013ce-7b18-335a-f04b-1db0d4f2adf4@citrix.com>
 <eca670cd-7f8c-a662-320a-43981ba60c9a@amazon.com>
 <5bdb27b7-f827-23bd-a1dd-a0cec039ce54@suse.com>
 <e25e1ae4-d5b1-7ce8-348f-f2d1809d0635@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eb8beed3-3b9e-25f9-94bf-c6fe56a397f5@suse.com>
Date: Wed, 11 Dec 2019 10:47:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <e25e1ae4-d5b1-7ce8-348f-f2d1809d0635@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/microcode: Support builtin CPU microcode
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMTIuMjAxOSAyMzo0MCwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4gT24gMTAuMTIuMTkg
MTA6MjEsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAwOS4xMi4yMDE5IDIyOjQ5LCBFc2xhbSBF
bG5pa2V0eSB3cm90ZToKPj4+IE9uIDA5LjEyLjE5IDE2OjE5LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IE9uIDA5LzEyLzIwMTkgMDg6NDEsIEVzbGFtIEVsbmlrZXR5IHdyb3RlOgo+Pj4+PiAt
LS0gL2Rldi9udWxsCj4+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUvTWFrZWZpbGUK
Pj4+Pj4gQEAgLTAsMCArMSw0MCBAQAo+Pj4+PiArIyBDb3B5cmlnaHQgKEMpIDIwMTkgQW1hem9u
LmNvbSwgSW5jLiBvciBpdHMgYWZmaWxpYXRlcy4KPj4+Pj4gKyMgQXV0aG9yOiBFc2xhbSBFbG5p
a2V0eSA8ZWxuaWtldHlAYW1hem9uLmNvbT4KPj4+Pj4gKyMKPj4+Pj4gKyMgVGhpcyBwcm9ncmFt
IGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkK
Pj4+Pj4gKyMgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGlj
ZW5zZSBhcyBwdWJsaXNoZWQgYnkKPj4+Pj4gKyMgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlv
bjsgZWl0aGVyIHZlcnNpb24gMiBvZiB0aGUgTGljZW5zZSwgb3IKPj4+Pj4gKyMgKGF0IHlvdXIg
b3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KPj4+Pj4gKyMKPj4+Pj4gKyMgVGhpcyBwcm9ncmFt
IGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCj4+Pj4+
ICsjIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdh
cnJhbnR5IG9mCj4+Pj4+ICsjIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJ
Q1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUKPj4+Pj4gKyMgR05VIEdlbmVyYWwgUHVibGljIExpY2Vu
c2UgZm9yIG1vcmUgZGV0YWlscy4KPj4+Pj4gKwo+Pj4+PiArb2JqLXkgKz0gYnVpbHRpbl91Y29k
ZS5vCj4+Pj4+ICsKPj4+Pj4gKyMgRGlyZWN0b3J5IGhvbGRpbmcgdGhlIG1pY3JvY29kZSB1cGRh
dGVzLgo+Pj4+PiArVUNPREVfRElSPSQocGF0c3Vic3QgIiUiLCUsJChDT05GSUdfQlVJTFRJTl9V
Q09ERV9ESVIpKQo+Pj4+PiArYW1kLWJsb2JzIDo9ICQod2lsZGNhcmQgJChVQ09ERV9ESVIpL2Ft
ZC11Y29kZS8qKQo+Pj4+PiAraW50ZWwtYmxvYnMgOj0gJCh3aWxkY2FyZCAkKFVDT0RFX0RJUikv
aW50ZWwtdWNvZGUvKikKPj4+Pgo+Pj4+IFRoaXMgaXMgYSBsaXR0bGUgZGFuZ2Vyb3VzLsKgIEkg
Y2FuIHNlZSB3aHkgeW91IHdhbnQgdG8gZG8gaXQgbGlrZSB0aGlzLAo+Pj4+IGFuZCBJIGNhbid0
IHByb3ZpZGUgYW55IG9idmlvdXMgc3VnZ2VzdGlvbnMsIGJ1dCBpZiB0aGlzIGdsb2IgcGlja3Mg
dXAKPj4+PiBhbnl0aGluZyB3aGljaCBpc24ndCBhIG1pY3JvY29kZSBmaWxlLCBpdCB3aWxsIGJy
ZWFrIHRoZSBsb2dpYyB0byBzZWFyY2gKPj4+PiBmb3IgdGhlIHJpZ2h0IGJsb2IuCj4+Pj4KPj4+
Cj4+PiBXZSBjYW4gbGltaXQgdGhlIGFtZC1ibG9icyBhbmQgaW50ZWwtYmxvYiB0byBiaW5hcmll
cyBmb2xsb3dpbmcgdGhlCj4+PiBuYW1pbmcgY29udmVudGlvbiBBdXRoZW50aWNBTUQuYmluIGFu
ZCBHZW51aW5lSW50ZWwuYmluIGZvciBhbWQgYW5kCj4+PiBpbnRlbCwgcmVzcGVjdGl2ZWx5LiBZ
ZXQsIHRoaXMgd291bGQgYmUgaW1wb3NpbmcgYW4gdW5uZWNlc3NhcnkKPj4+IHJlc3RyaWN0aW9u
IG9uIGFkbWluaXN0cmF0b3JzIHdobyBtYXkgd2FudCB0byBiZSBpbm5vdmF0aXZlIHdpdGggbmFt
aW5nCj4+PiAob3Igd2FudCB0byB1c2UgdGhlIG5hbWluZyBtaWNyb2NvZGVfYW1kXyouYmluIG9y
IEZGLU1NLVNTIGluc3RlYWQpLgo+Pj4KPj4+IEFsdGVybmF0aXZlbHksIHdlIGNhbiBpbnRyb2R1
Y2UgQ09ORklHX0JVSUxUSU5fVUNPREVfSU5URUwgYW5kCj4+PiBDT05GSUdfQlVJTFRJTl9VQ09E
RV9BTUQuIEJvdGggZGVmYXVsdCB0byBlbXB0eSBzdHJpbmdzLiBUaGVuLCBhbgo+Pj4gYWRtaW5p
c3RyYXRvciBjYW4gc3BlY2lmeSBleGFjdGx5IHRoZSBtaWNyb2NvZGVzIHRvIGluY2x1ZGUgcmVs
YXRpdmUgdG8KPj4+IHRoZSBDT05GSUdfQlVJTFRJTl9VQ09ERV9ESVIuIEZvciBleGFtcGxlOgo+
Pj4gQ09ORklHX0JVSUxUSU5fVUNPREVfSU5URUw9ImludGVsLXVjb2RlLzA2LTNhLTA5Igo+Pj4g
Q09ORklHX0JVSUxUSU5fVUNPREVfQU1EPSJhbWQtdWNvZGUvbWljcm9jb2RlX2FtZF9mYW0xNWgu
YmluIgo+Pgo+PiBUaGlzIHdvdWxkIG1ha2UgdGhlIGZlYXR1cmUgZXZlbiBsZXNzIGdlbmVyaWMg
LSBJIGFscmVhZHkgbWVhbnQgdG8KPiAKPiBJIGRvIG5vdCBmb2xsb3cgdGhlIHBvaW50IGFib3V0
IGJlaW5nIGxlc3MgZ2VuZXJpYy4gKEkgaG9wZSBteSBleGFtcGxlIAo+IGRpZCBub3QgZ2l2ZSB0
aGUgZmFsc2UgaW1wcmVzc2lvbiB0aGF0IENPTkZJR19CVUlMVElOX1VDT0RFX3tBTUQsSU5URUx9
IAo+IGFsbG93IGZvciBvbmx5IGEgc2luZ2xlIG1pY3JvY29kZSBibG9iIGZvciBhIHNpbmdsZSBz
aWduYXR1cmUpLgoKV2VsbCwgdGhlIGV4YW1wbGUgaW5kZWVkIGhhcyBnaXZlbiB0aGlzIGltcHJl
c3Npb24gdG8gbWUuIEknbQpoYXZpbmcgYSBoYXJkIHRpbWUgc2VlaW5nIGhvdywgYmV5b25kIHZl
cnkgbmFycm93IHNwZWNpYWwgY2FzZXMsCmVpdGhlciBvZiB0aGUgZXhhbXBsZXMgY291bGQgYmUg
dXNlZnVsIHRvIGFueW9uZS4gWWV0IEkgdGhpbmsKZXhhbXBsZXMgc2hvdWxkIGJlIGdlbmVyYWxs
eSB1c2VmdWwuCgo+PiBhc2sgd2hldGhlciBidWlsZGluZyB1Y29kZSBpbnRvIGJpbmFyaWVzIGlz
IHJlYWxseSBhIHVzZWZ1bCB0aGluZwo+PiB3aGVuIHdlIGFscmVhZHkgaGF2ZSBtb3JlIGZsZXhp
YmxlIHdheXMuIEkgY291bGQgc2VlIHRoaXMgYmVpbmcKPj4gdXNlZnVsIGlmIHRoZXJlIHdhcyBu
byBvdGhlciB3YXkgdG8gbWFrZSB1Y29kZSBhdmFpbGFibGUgYXQgYm9vdAo+PiB0aW1lLgo+IAo+
IEl0IGlzIHVzZWZ1bCBpbiBhZGRpdGlvbiB0byB0aGUgZXhpc3Rpbmcgd2F5cyB0byBkbyBlYXJs
eSBtaWNyb2NvZGUgCj4gdXBkYXRlcy4gRmlyc3QsIHdoZW4gb3BlcmF0aW5nIG1hbnkgaG9zdHMs
IHVzaW5nIGJvb3QgbW9kdWxlcyAoZWl0aGVyIGEgCj4gZGlzdGluY3QgbWljcm9jb2RlIG1vZHVs
ZSBvciB3aXRoaW4gYW4gaW5pdHJkKSBiZWNvbWVzIGludm9sdmVkLiBGb3IgCj4gaW5zdGFuY2Us
IHRvb2xzIHRvIHVwZGF0ZSBib290IGVudHJpZXMgKGUuZy4sIAo+IGh0dHBzOi8vbGludXguZGll
Lm5ldC9tYW4vOC9ncnViYnkpIGRvIG5vdCBzdXBwb3J0IGFkZGluZyBhcmJpdHJhcnkgCj4gKG1p
Y3JvY29kZSkgbW9kdWxlcy4KCkkuZS4geW91IHN1Z2dlc3QgdG8gd29yayBhcm91bmQgdG9vbHMg
c2hvcnRjb21pbmdzIGJ5IGV4dGVuZGluZwpYZW4/IFdvdWxkbid0IHRoZSBtb3JlIGFwcHJvcHJp
YXRlIHdheSB0byBkZWFsIHdpdGggdGhpcyBiZSB0bwptYWtlIHRoZSB0b29scyBtb3JlIGNhcGFi
bGU/Cgo+IFNlY29uZCwgdGhlcmUgaXMgb2Z0ZW4gbmVlZCB0byBjb3VwbGUgYSBYZW4gYnVpbGQg
d2l0aCBhIG1pbmltdW0gCj4gbWljcm9jb2RlIHBhdGNoIGxldmVsLiBIYXZpbmcgdGhlIG1pY3Jv
Y29kZSBidWlsdCB3aXRoaW4gdGhlIFhlbiBpbWFnZSAKPiBpdHNlbGYgaXMgYSBzdHJlYW1saW5l
ZCwgbmF0dXJhbCB3YXkgb2YgYWNoaWV2aW5nIHRoYXQuCgpPa2F5LCBJIGNhbiBhY2NlcHQgdGhp
cyBhcyBhIHJlYXNvbiwgdG8gc29tZSBkZWdyZWUgYXQgbGVhc3QuIFlldAphcyBzYWlkIGVsc2V3
aGVyZSwgSSBkb24ndCB0aGluayB5b3Ugd2FudCB0aGVuIHRvIG92ZXJyaWRlIGEKcG9zc2libGUg
ImV4dGVybmFsIiB1Y29kZSBtb2R1bGUgd2l0aCB0aGUgYnVpbHRpbiBibG9icy4gSW5zdGVhZAp0
aGUgbmV3ZXN0IG9mIGV2ZXJ5dGhpbmcgdGhhdCdzIGF2YWlsYWJsZSBzaG91bGQgdGhlbiBiZSBs
b2FkZWQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
