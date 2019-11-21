Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 739D7104E1F
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 09:38:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXhv7-0003Lq-PT; Thu, 21 Nov 2019 08:34:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXhv7-0003Ll-1u
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 08:34:33 +0000
X-Inumbo-ID: bd52d7dc-0c39-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd52d7dc-0c39-11ea-9631-bc764e2007e4;
 Thu, 21 Nov 2019 08:34:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2137EB22C;
 Thu, 21 Nov 2019 08:34:31 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <7e28eb9e-f15a-af61-aad5-1ea80876fbe3@suse.com>
 <41a60a35-3413-5e33-47ea-60a8864224e1@suse.com>
 <4c2222e1-23b7-609d-1a72-7ee193182815@suse.com>
 <cb0c6279-278f-e037-53ef-e5514742842e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8149ffd4-3b6f-df12-3de5-8e64419e3b78@suse.com>
Date: Thu, 21 Nov 2019 09:34:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <cb0c6279-278f-e037-53ef-e5514742842e@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Ping: [PATCH v2] build: provide option to
 disambiguate symbol names
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradWilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMTEuMjAxOSAxODoxMywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMC8xMS8yMDE5
IDE2OjQwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+PiBPbiAyMC4xMS4xOSAxNzozMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAwOC4xMS4yMDE5IDEyOjE4LCBKYW4gQmV1bGljaCB3cm90ZToK
Pj4+PiBUaGUgLmZpbGUgYXNzZW1ibGVyIGRpcmVjdGl2ZXMgZ2VuZXJhdGVkIGJ5IHRoZSBjb21w
aWxlciBkbyBub3QgaW5jbHVkZQo+Pj4+IGFueSBwYXRoIGNvbXBvbmVudHMgKGdjYykgb3IganVz
dCB0aGUgb25lcyBzcGVjaWZpZWQgb24gdGhlIGNvbW1hbmQKPj4+PiBsaW5lCj4+Pj4gKGNsYW5n
LCBhdCBsZWFzdCB2ZXJzaW9uIDUpLCBhbmQgaGVuY2UgbXVsdGlwbGUgaWRlbnRpY2FsbHkgbmFt
ZWQKPj4+PiBzb3VyY2UKPj4+PiBmaWxlcyAoaW4gZGlmZmVyZW50IGRpcmVjdG9yaWVzKSBtYXkg
cHJvZHVjZSBpZGVudGljYWxseSBuYW1lZCBzdGF0aWMKPj4+PiBzeW1ib2xzIChpbiB0aGVpciBr
YWxsc3ltcyByZXByZXNlbnRhdGlvbikuIFRoZSBiaW5hcnkgZGlmZmluZwo+Pj4+IGFsZ29yaXRo
bQo+Pj4+IHVzZWQgYnkgeGVuLWxpdmVwYXRjaCwgaG93ZXZlciwgZGVwZW5kcyBvbiBoYXZpbmcg
dW5pcXVlIHN5bWJvbHMuCj4+Pj4KPj4+PiBNYWtlIHRoZSBFTkZPUkNFX1VOSVFVRV9TWU1CT0xT
IEtjb25maWcgb3B0aW9uIGNvbnRyb2wgdGhlIChidWlsZCkKPj4+PiBiZWhhdmlvciwgYW5kIGlm
IGVuYWJsZWQgdXNlIG9iamNvcHkgdG8gcHJlcGVuZCB0aGUgKHJlbGF0aXZlIHRvIHRoZQo+Pj4+
IHhlbi8gc3ViZGlyZWN0b3J5KSBwYXRoIHRvIHRoZSBjb21waWxlciBpbnZva2VkIFNUVF9GSUxF
IHN5bWJvbHMuIE5vdGUKPj4+PiB0aGF0IHRoaXMgYnVpbGQgb3B0aW9uIGlzIG1hZGUgbm8gbG9u
Z2VyIGRlcGVuZCBvbiBMSVZFUEFUQ0gsIGJ1dAo+Pj4+IG1lcmVseQo+Pj4+IGRlZmF1bHRzIHRv
IGl0cyBzZXR0aW5nIG5vdy4KPj4+Pgo+Pj4+IENvbmRpdGlvbmFsaXplIGV4cGxpY2l0IC5maWxl
IGRpcmVjdGl2ZSBpbnNlcnRpb24gaW4gQyBmaWxlcyB3aGVyZSBpdAo+Pj4+IGV4aXN0cyBqdXN0
IHRvIGRpc2FtYmlndWF0ZSBuYW1lcyBpbiBhIGxlc3MgZ2VuZXJpYyBtYW5uZXI7IG5vdGUgdGhh
dAo+Pj4+IGF0IHRoZSBzYW1lIHRpbWUgdGhlIHJlZHVuZGFudCBlbWlzc2lvbiBvZiBTVFRfRklM
RSBzeW1ib2xzIGdldHMKPj4+PiBzdXBwcmVzc2VkIGZvciBjbGFuZy4gQXNzZW1ibGVyIGZpbGVz
IGFzIHdlbGwgYXMgbXVsdGlwbHkgY29tcGlsZWQgQwo+Pj4+IG9uZXMgdXNpbmcgX19PQkpFQ1Rf
RklMRV9fIGFyZSBsZWZ0IGFsb25lIGZvciB0aGUgdGltZSBiZWluZy4KPj4+Pgo+Pj4+IFNpbmNl
IHdlIG5vdyBleHBlY3QgdGhlcmUgbm90IHRvIGJlIGFueSBkdXBsaWNhdGVzIGFueW1vcmUsIGFs
c28gZG9uJ3QKPj4+PiBmb3JjZSB0aGUgc2VsZWN0aW9uIG9mIHRoZSBvcHRpb24gdG8gJ24nIGFu
eW1vcmUgaW4gYWxscmFuZG9tLmNvbmZpZy4KPj4+PiBTaW1pbGFybHkgQ09WRVJBR0Ugbm8gbG9u
Z2VyIHN1cHByZXNzZXMgZHVwbGljYXRlIHN5bWJvbCB3YXJuaW5ncyBpZgo+Pj4+IGVuZm9yY2Vt
ZW50IGlzIGluIGVmZmVjdCwgd2hpY2ggaW4gdHVybiBhbGxvd3MKPj4+PiBTVVBQUkVTU19EVVBM
SUNBVEVfU1lNQk9MX1dBUk5JTkdTIHRvIHNpbXBseSBkZXBlbmQgb24KPj4+PiAhRU5GT1JDRV9V
TklRVUVfU1lNQk9MUy4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPj4+Cj4+PiBJJ3ZlIGdvdCBhY2tzIGZyb20gS29ucmFkIGFuZCBXZWks
IGJ1dCBzdGlsbCBuZWVkIGFuIHg4NiBhbmQgYSByZWxlYXNlCj4+PiBvbmUgaGVyZS4gQW5kcmV3
PyBPciBhbHRlcm5hdGl2ZWx5IC0gSsO8cmdlbiwgd291bGQgeW91IHJhdGhlciBub3Qgc2VlCj4+
PiB0aGlzIGdvIGluIGFueW1vcmU/Cj4+Cj4+IEluIGNhc2UgdGhlIG5lZWRlZCB4ODYgQWNrIGlz
IGNvbWluZyBpbiBiZWZvcmUgUkMzIEknbSBmaW5lIHRvIGdpdmUgbXkKPj4gUmVsZWFzZS1hY2ss
IGJ1dCBJJ20gaGVzaXRhbnQgdG8gdGFrZSBpdCBsYXRlci4KPiAKPiBIYXMgYW55b25lIGFjdHVh
bGx5IHRyaWVkIGJ1aWxkaW5nIGEgbGl2ZXBhdGNoIHdpdGggdGhpcyBjaGFuZ2UgaW4gcGxhY2U/
CgpBY3R1YWxseSAtIHdoYXQgaXMgeW91ciBjb25jZXJuIGhlcmU/IFRoZSBleGFjdCBzcGVsbGlu
ZyBvZiBzeW1ib2xzCm5hbWVzIHNob3VsZCBiZSBvZiBubyBpbnRlcmVzdCB0byB0aGUgdG9vbC4g
QWZ0ZXIgYWxsIHRoZSBjb21waWxlciBpcwpmcmVlIHRvIGludmVudCBhbGwgc29ydHMgb2YgbmFt
ZXMgZm9yIGl0cyBsb2NhbCBzeW1ib2xzLCBpbmNsdWRpbmcKdGhlIG9uZXMgd2Ugd291bGQgcHJv
ZHVjZSB3aXRoIHRoaXMgY2hhbmdlIGluIHBsYWNlLiBBbGwgdGhlIHRvb2wKY2FyZXMgYWJvdXQg
aXMgdGhhdCB0aGUgbmFtZXMgYmUgdW5hbWJpZ3VvdXMuIEhlbmNlIGFueSAodGhlb3JldGljYWwp
CnJlZ3Jlc3Npb24gaGVyZSB3b3VsZCBiZSBhIGJ1ZyBpbiB0aGUgdG9vbHMsIHdoaWNoIGltbyBp
cyBubyByZWFzb24KdG8gZGVsYXkgdGhpcyBjaGFuZ2UgYW55IGZ1cnRoZXIuIChHcmFudGVkIEkg
c2hvdWxkIGhhdmUgZ290IHRvIGl0CmVhcmxpZXIsIGJ1dCBpdCBoYWQgYmVlbiBjb250aW51aW5n
IHRvIGdldCBkZWZlcnJlZC4pCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
