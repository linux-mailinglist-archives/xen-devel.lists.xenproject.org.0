Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C374471C45
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 17:56:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpx6c-0008GM-I4; Tue, 23 Jul 2019 15:53:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bPW/=VU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hpx6b-0008GH-4o
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 15:53:33 +0000
X-Inumbo-ID: 045e055c-ad62-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 045e055c-ad62-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 15:53:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CD7A2B127;
 Tue, 23 Jul 2019 15:53:29 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20190723092056.15045-1-jgross@suse.com>
 <20190723092056.15045-3-jgross@suse.com>
 <eb7d7c8a-9bb1-f264-b72e-7e4c96087568@suse.com>
 <4c6a7888-d697-1b2c-cdbf-7127ae00bc4f@suse.com>
 <779077d6-5f07-9801-49e6-58fcd1fe31b4@suse.com>
 <e28384ea-4c85-e1c2-efce-01ec354d4ab3@suse.com>
 <fd38498a-2918-8cb1-3575-044ecbdd423e@suse.com>
 <0da102f5-6f61-4a14-5c07-3ac92f4db68c@suse.com>
 <1ac4a860-4bde-5566-18b8-2e435ee85bb1@suse.com>
 <9f8fd17b-0f13-a207-9718-be37832c667b@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <818e264f-be0a-eaf6-db52-0ee3d7961608@suse.com>
Date: Tue, 23 Jul 2019 17:53:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <9f8fd17b-0f13-a207-9718-be37832c667b@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 2/2] xen: merge temporary vcpu pinning
 scenarios
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 IanJackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDcuMTkgMTc6MjksIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMjMvMDcvMjAxOSAx
NjoyMiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMjMuMDcuMTkgMTc6MDQsIEphbiBCZXVs
aWNoIHdyb3RlOgo+Pj4gT24gMjMuMDcuMjAxOSAxNjoyOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToK
Pj4+PiBPbiAyMy4wNy4xOSAxNjoxNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDIzLjA3
LjIwMTkgMTY6MDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMjMuMDcuMjAxOSAxNTo0
NCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4+PiBPbiAyMy4wNy4xOSAxNDo0MiwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+Pj4+Pj4+IHYtPnByb2Nlc3NvciBnZXRzIGxhdGNoZWQgaW50byBzdC0+
cHJvY2Vzc29yIGJlZm9yZSByYWlzaW5nIHRoZQo+Pj4+Pj4+PiBzb2Z0aXJxLAo+Pj4+Pj4+PiBi
dXQgY2FuJ3QgdGhlIHZDUFUgYmUgbW92ZWQgZWxzZXdoZXJlIGJ5IHRoZSB0aW1lIHRoZSBzb2Z0
aXJxCj4+Pj4+Pj4+IGhhbmRsZXIKPj4+Pj4+Pj4gYWN0dWFsbHkgZ2FpbnMgY29udHJvbD8gSWYg
dGhhdCdzIG5vdCBwb3NzaWJsZSAoYW5kIGlmIGl0J3Mgbm90Cj4+Pj4+Pj4+IG9idmlvdXMKPj4+
Pj4+Pj4gd2h5LCBhbmQgYXMgeW91IGNhbiBzZWUgaXQncyBub3Qgb2J2aW91cyB0byBtZSksIHRo
ZW4gSSB0aGluayBhCj4+Pj4+Pj4+IGNvZGUKPj4+Pj4+Pj4gY29tbWVudCB3YW50cyB0byBiZSBh
ZGRlZCB0aGVyZS4KPj4+Pj4+Pgo+Pj4+Pj4+IFlvdSBhcmUgcmlnaHQsIGl0IG1pZ2h0IGJlIHBv
c3NpYmxlIGZvciB0aGUgdmNwdSB0byBtb3ZlIGFyb3VuZC4KPj4+Pj4+Pgo+Pj4+Pj4+IE9UT0gg
aXMgaXQgcmVhbGx5IGltcG9ydGFudCB0byBydW4gdGhlIHRhcmdldCB2Y3B1IGV4YWN0bHkgb24g
dGhlCj4+Pj4+Pj4gY3B1Cj4+Pj4+Pj4gaXQgaXMgZXhlY3V0aW5nIChvciBoYXMgbGFzdCBleGVj
dXRlZCkgYXQgdGhlIHRpbWUgdGhlIE5NSS9NQ0UgaXMKPj4+Pj4+PiBiZWluZwo+Pj4+Pj4+IHF1
ZXVlZD8gVGhpcyBpcyBpbiBubyB3YXkgcmVsYXRlZCB0byB0aGUgY3B1IHRoZSBNQ0Ugb3IgTk1J
IGhhcyBiZWVuCj4+Pj4+Pj4gaGFwcGVuaW5nIG9uLiBJdCBpcyBqdXN0IGEgcmFuZG9tIGNwdSwg
YW5kIHNvIGl0IHdvdWxkIGJlIGlmIHdlJ2QKPj4+Pj4+PiBkbyB0aGUKPj4+Pj4+PiBjcHUgc2Vs
ZWN0aW9uIHdoZW4gdGhlIHNvZnRpcnEgaGFuZGxlciBpcyBydW5uaW5nLgo+Pj4+Pj4+Cj4+Pj4+
Pj4gT25lIHF1ZXN0aW9uIHRvIHVuZGVyc3RhbmQgdGhlIGlkZWEgbmVoaW5kIGFsbCB0aGF0OiBf
d2h5XyBpcyB0aGUKPj4+Pj4+PiB2Y3B1Cj4+Pj4+Pj4gcGlubmVkIHVudGlsIGl0IGRvZXMgYW4g
aXJldD8gSSBjb3VsZCB1bmRlcnN0YW5kIGlmIGl0IHdvdWxkIGJlCj4+Pj4+Pj4gcGlubmVkCj4+
Pj4+Pj4gdG8gdGhlIGNwdSB3aGVyZSB0aGUgTk1JL01DRSB3YXMgaGFwcGVuaW5nLCBidXQgdGhp
cyBpcyBub3QgdGhlCj4+Pj4+Pj4gY2FzZS4KPj4+Pj4+Cj4+Pj4+PiBUaGVuIGl0IHdhcyBuZXZl
ciBmaW5pc2hlZCBvciBnb3QgYnJva2VuLCBJIHdvdWxkIGd1ZXNzLgo+Pj4+Pgo+Pj4+PiBPaCwg
bm8uIFRoZSAjTUMgc2lkZSB1c2UgaGFzIGdvbmUgYXdheSBpbiAzYTkxNzY5ZDZlLCB3aXRob3V0
IGNsZWFuaW5nCj4+Pj4+IHVwIG90aGVyIGNvZGUuIFNvIHRoZXJlIGRvZXNuJ3Qgc2VlbSB0byBi
ZSBhbnkgc3VjaCByZXF1aXJlbWVudAo+Pj4+PiBhbnltb3JlLgo+Pj4+Cj4+Pj4gU28ganVzdCB0
byBiZSBzdXJlOiB5b3UgYXJlIGZpbmUgZm9yIG1lIHJlbW92aW5nIHRoZSBwaW5uaW5nIGZvciBO
TUlzPwo+Pj4KPj4+IE5vLCBub3QgdGhlIHBpbm5pbmcgYXMgYSB3aG9sZS4gVGhlIGZvcmNlZCBD
UFUwIGFmZmluaXR5IHNob3VsZCBzdGlsbAo+Pj4gcmVtYWluLiBJdCdzIGp1c3QgdGhhdCB0aGVy
ZSdzIG5vIGNvcnJlbGF0aW9uIGFueW1vcmUgYmV0d2VlbiB0aGUgQ1BVCj4+PiBhIHZDUFUgd2Fz
IHJ1bm5pbmcgb24gYW5kIHRoZSBDUFUgaXQgaXMgdG8gYmUgcGlubmVkIHRvICh0ZW1wb3Jhcmls
eSkuCj4+Cj4+IEkgZG9uJ3QgZ2V0IGl0LiBUb2RheSB2Y3B1MCBvZiB0aGUgaGFyZHdhcmUgZG9t
YWluIGlzIHBpbm5lZCB0byB0aGUgY3B1Cj4+IGl0IHdhcyBsYXN0IHJ1bm5pbmcgb24gd2hlbiB0
aGUgTk1JIGhhcHBlbmVkLiBXaHkgaXMgdGhhdCBpbXBvcnRhbnQ/Cj4+IE9yIGRvIHlvdSB3YW50
IHRvIGNoYW5nZSB0aGUgbG9naWMgYW5kIHBpbiB2Y3B1MCBmb3IgTk1JIGhhbmRsaW5nIGFsd2F5
cwo+PiB0byBDUFUwPwo+IAo+IEl0cyAoYWxsZWdlZGx5KSBmb3Igd2hlbiBkb20wIGtub3dzIHNv
bWUgc3lzdGVtLXNwZWNpZmljIHdheSBvZiBnZXR0aW5nCj4gZXh0cmEgaW5mb3JtYXRpb24gb3V0
IG9mIHRoZSBwbGF0Zm9ybSwgdGhhdCBoYXBwZW5zIHRvIGJlIGNvcmUtc3BlY2lmaWMuCj4gCj4g
VGhlcmUgYXJlIHJhcmUgY2FzZXMgd2hlcmUgU01JJ3MgbmVlZCB0byBiZSBleGVjdXRlZCBvbiBD
UFUwLCBhbmQgSQo+IHdvdWxkbid0IHB1dCBpdCBwYXN0IGhhcmR3YXJlIGRlc2lnbmVycyB0byBo
YXZlIHNpbWlsYXIgYXNwZWN0cyBmb3IgTk1Jcy4KClVuZGVyc3Rvb2QuIEJ1dCB0b2RheSB2Y3B1
MCBpcyBfbm90XyBib3VuZCB0byBDUFUwLCBidXQgdG8gYW55IGNwdSBpdApoYXBwZW5lZCB0byBy
dW4gb24uCgo+IAo+IFRoYXQgc2FpZCwgYXMgc29vbiBhcyB0aGUgZ2FwaW5nIHNlY3VyaXR5IGhv
bGUgd2hpY2ggaXMgdGhlCj4gZGVmYXVsdC1yZWFkaWJpbGl0eSBvZiBhbGwgTVNScywgSSBiZXQg
dGhlIHV0aWxpdHkgb2YgdGhpcyBwaW5uaW5nCj4gbWVjaGFuaXNtIHdpbGwgYmUgMC4KCkFuZCBt
eSByZWFzb25pbmcgaXMgdGhhdCB0aGlzIGlzIHRoZSBjYXNlIHRvZGF5IGFscmVhZHksIGFzIHRo
ZXJlIGlzCm5vIHBpbm5pbmcgdG8gQ1BVMCBkb25lLCBhdCBsZWFzdCBub3Qgb24gcHVycG9zZS4K
CgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
