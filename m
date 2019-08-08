Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC6385ED2
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 11:39:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hver0-0005KW-Qb; Thu, 08 Aug 2019 09:37:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YRw2=WE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hveqz-0005KR-2z
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 09:37:01 +0000
X-Inumbo-ID: 103938c8-b9c0-11e9-b472-e33be9fd16e9
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 103938c8-b9c0-11e9-b472-e33be9fd16e9;
 Thu, 08 Aug 2019 09:36:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DEDCFAD29;
 Thu,  8 Aug 2019 09:36:55 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20190807143119.8360-1-jgross@suse.com>
 <bc9954e7-ef0a-aeaf-668b-eedcc78645d4@citrix.com>
 <3a8e76fd-ec10-9020-7f34-40c62dab0e6c@suse.com>
 <c1d979d8-eece-0065-c4a1-5f3d47a217ea@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <f600730d-744d-bbd4-57c2-801d6b9eb380@suse.com>
Date: Thu, 8 Aug 2019 11:36:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c1d979d8-eece-0065-c4a1-5f3d47a217ea@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 0/4] enhance lock debugging
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDguMTkgMTA6MzMsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMDgvMDgvMjAxOSAw
NTo1MCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMDcuMDguMTkgMjA6MTEsIEFuZHJldyBD
b29wZXIgd3JvdGU6Cj4+Pgo+Pj4gPHNuaXA+Cj4+PiBJdHMgbm90IGV4YWN0bHkgdGhlIGVhc2ll
c3QgdG8gZHVtcCB0byBmb2xsb3cuCj4+Pgo+Pj4gRmlyc3Qgb2YgYWxsIC0gSSBkb24ndCBzZWUg
d2h5IHRoZSBob2xkL2Jsb2NrIHRpbWUgYXJlIHByaW50ZWQgbGlrZQo+Pj4gdGhhdC7CoCBJdAo+
Pj4gbWlnaHQgYmUgYSBob2xkb3ZlciBmcm9tIHRoZSAzMmJpdCBidWlsZCwgcHJlIFBSSWQ2NCBz
dXBwb3J0LsKgIFRoZXkKPj4+IHNob3VsZAo+Pj4gcHJvYmFibHkgdXNlIFBSSV9zdGltZSBhbnl3
YXkuCj4+Cj4+IEZpbmUgd2l0aCBtZS4KPj4KPj4+IFRoZSBkb21pZCByZW5kZXJpbmcgaXMgdW5m
b3J0dW5hdGUuwqAgSWRlYWxseSB3ZSdkIHVzZSAlcGQgYnV0IHRoYXQgd291bGQKPj4+IGludm9s
dmUgcmVhcnJhbmdpbmcgdGhlIGxvZ2ljIHRvIGdldCBhIHN0cnVjdCBkb21haW4qIGluIGhhbmQu
Cj4+PiBTZWVpbmcgYXMKPj4+IHlvdSdyZSB0aGUgbGFzdCBwZXJzb24gdG8gbW9kaWZ5IHRoaXMg
Y29kZSwgaG93IGhhcmQgd291bGQgdGhhdCBiZSB0bwo+Pj4gZG8/Cj4+Cj4+IEl0IHdvdWxkIGNv
bXBsZXRlbHkgYnJlYWsgdGhlIHN0cnVjdCB0eXBlIGFnbm9zdGljIGRlc2lnbi4KPiAKPiBPay7C
oCBBcyBhbiBhbHRlcm5hdGl2ZWx5LCBob3cgYWJvdXQgJXBkciB3aGljaCB0YWtlcyBhIHJhdyBk
b21pZD/CoCBJdAo+IHdvdWxkIGJlIGEgdHJpdmlhbCBhZGp1c3RtZW50IGluIHRoZSB2c25wcmlu
dGYgY29kZSwgYW5kIGNvdWxkIHBsYXVzaWJseQo+IGJlIHVzZWZ1bCBlbHNld2hlcmUgd2hlcmUg
d2UgaGF2ZSBhIGRvbWlkIGFuZCBub3QgYSBkb21haW4gcG9pbnRlci4KCkxvY2sgcHJvZmlsaW5n
IGhhcyBubyBrbm93bGVkZ2UgdGhhdCBpdCBpcyB3b3JraW5nIG9uIGEgc3RydWN0IGRvbWFpbi4K
SXQgaXMganVzdCB3b3JraW5nIG9uIGEgbG9jayBpbiBhIHN0cnVjdCBhbmQgYW4gaW5kZXggdG8g
ZGlmZmVyZW50aWF0ZQp0aGUgc3RydWN0IGluc3RhbmNlLiBVc2luZyB0aGUgZG9taWQgYXMgdGhl
IGluZGV4IGlzIGp1c3QgZm9yIG1ha2luZyBpdAptb3JlIGVhc3kgdG8gdW5kZXJzdGFuZCB0aGUg
cHJpbnRvdXQuCgpJIHdvdWxkbid0IHdhbnQgZS5nLiBhIHBlci1ldmVudCBsb2NrIHRvIGJlIG5h
bWVkICJJRExFIiBqdXN0IGJlY2F1c2UKaXQgaGFwcGVucyB0byBiZSBpbmRleCAzMjc2Ny4KCj4g
Cj4+Cj4+IEkgaGF2ZSBhIGRlYnVnIHBhdGNoIGFkZGluZyBjcmVkaXQyIHJ1bi1xdWV1ZSBsb2Nr
LiBJdCByZXF1aXJlcyB0byBqdXN0Cj4+IGFkZCA1IGxpbmVzIG9mIGNvZGUgKGFuZCB0aGlzIGlu
Y2x1ZGVzIG1vdmluZyB0aGUgc3BpbmxvY2tfaW5pdCgpIG91dCBvZgo+PiBhbiBpcnEtb2ZmIHNl
Y3Rpb24pLiBJdCB3aWxsIHByb2R1Y2U6Cj4+Cj4+IChYRU4pIGNyZWRpdDItcnVucSAwIGxvY2s6
IGFkZHI9ZmZmZjgzMDQxMzM1MTAxMCwgbG9ja3ZhbD1kZTAwZGRmLCBjcHU9Ngo+PiAoWEVOKcKg
wqAgbG9jazogODk2Mjg3KDAwMDAwMDAwOjAwRkFBNkIyKSwgYmxvY2s6wqAgODE5KDAwMDAwMDAw
OjAwMDA5QzgwKQo+IAo+IFdoYXQgaXMgdGhlIDAgaGVyZT8KClRoZSBydW5xIG51bWJlci4KCj4g
Cj4+Cj4+PiBXZSBoYXZlIHNldmVyYWwgZ2xvYmFsIGxvY2tzIGNhbGxlZCBsb2NrOgo+Pj4KPj4+
ICDCoMKgIChYRU4pIEdsb2JhbCBsb2NrOiBhZGRyPWZmZmY4MmQwODA4MTgxZTAsIGxvY2t2YWw9
MTAwMDEsIGNwdT00MDk1Cj4+PiAgwqDCoCAoWEVOKcKgwqAgbG9jazrCoMKgwqDCoMKgwqDCoMKg
wqDCoCAxKDAwMDAwMDAwOjAxMzIyMTY1KSwgYmxvY2s6Cj4+PiAwKDAwMDAwMDAwOjAwMDAwMDAw
KQo+Pj4gIMKgwqAgKFhFTikgR2xvYmFsIGxvY2s6IGFkZHI9ZmZmZjgyZDA4MDgxN2NjMCwgbG9j
a3ZhbD0xMDAwMTAsIGNwdT00MDk1Cj4+PiAgwqDCoCAoWEVOKcKgwqAgbG9jazrCoMKgwqDCoMKg
wqDCoMKgwqDCoCAwKDAwMDAwMDAwOjAwMDAwMDAwKSwgYmxvY2s6Cj4+PiAwKDAwMDAwMDAwOjAw
MDAwMDAwKQo+Pj4gIMKgwqAgKFhFTikgR2xvYmFsIGxvY2s6IGFkZHI9ZmZmZjgyZDA4MDgxNzgw
MCwgbG9ja3ZhbD0wMDAwLCBjcHU9NDA5NQo+Pj4gIMKgwqAgKFhFTinCoMKgIGxvY2s6wqDCoMKg
wqDCoMKgwqDCoMKgwqAgMCgwMDAwMDAwMDowMDAwMDAwMCksIGJsb2NrOgo+Pj4gMCgwMDAwMDAw
MDowMDAwMDAwMCkKPj4+ICDCoMKgIChYRU4pIEdsb2JhbCBsb2NrOiBhZGRyPWZmZmY4MmQwODA4
MTc3ODAsIGxvY2t2YWw9MDAwMCwgY3B1PTQwOTUKPj4+ICDCoMKgIChYRU4pwqDCoCBsb2NrOsKg
wqDCoMKgwqDCoMKgwqDCoMKgIDAoMDAwMDAwMDA6MDAwMDAwMDApLCBibG9jazoKPj4+IDAoMDAw
MDAwMDA6MDAwMDAwMDApCj4+PiAgwqDCoCAoWEVOKSBHbG9iYWwgbG9jazogYWRkcj1mZmZmODJk
MDgwODE3NTEwLCBsb2NrdmFsPTAwMDAsIGNwdT00MDk1Cj4+PiAgwqDCoCAoWEVOKcKgwqAgbG9j
azrCoMKgwqDCoMKgwqDCoMKgwqDCoCAwKDAwMDAwMDAwOjAwMDAwMDAwKSwgYmxvY2s6Cj4+PiAw
KDAwMDAwMDAwOjAwMDAwMDAwKQo+Pj4KPj4+IFRoZSBzZWNvbmQgb25lIGluIHBhcnRpY3VsYXIg
aGFzIGNvcnJ1cHQgZGF0YSwgc2VlaW5nIGhhcyBpdCBoYXMgYmVlbgo+Pj4gdGFrZW4KPj4+IGFu
ZCByZWxlYXNlZCBzZXZlcmFsIHRpbWVzIHdpdGhvdXQgbG9ja19jbnQgaW5jcmVhc2luZy4KPj4K
Pj4gVGhlIGxvY2sgbWlnaHQgaGF2ZSBiZWVuIHRha2VuL3JlbGVhc2VkIGJlZm9yZSBsb2NrIHBy
b2ZpbGluZyBoYXMgYmVlbgo+PiBpbml0aWFsaXplZC4KPiAKPiBXaGF0IGlzIHRoZXJlIHRvIGlu
aXRpYWxpc2U/wqAgSXQgYWxsIGxvb2tzIHN0YXRpY2FsbHkgc2V0IHVwLgoKbG9jay0+cHJvZmls
ZSBpcyBzZXQgb25seSBpbiBsb2NrX3Byb2ZfaW5pdCgpLgoKPiAKPj4KPj4+IEZvciBzYW5pdHkg
c2FrZSwgd2Ugc2hvdWxkIGVuZm9yY2UgdW5pcXVlIG5hbWluZyBvZiBhbnkgbG9jawo+Pj4gcmVn
aXN0ZXJlZCBmb3IKPj4+IHByb2ZpbGluZy4KPj4KPj4gVGhpcyB3b3VsZCBiZSBldmVyeSBsb2Nr
IGluaXRlZCB2aWEgREVGSU5FX1NQSU5MT0NLKCkuIEkgY2FuIGRvIGEKPj4gZm9sbG93dXAgcGF0
Y2ggZm9yIHRoYXQgcHVycG9zZS4KPiAKPiBJIHdhcyB3b25kZXJpbmcgaG93IHRvIGRvIHRoaXMu
wqAgT25lIG9wdGlvbiB3aGljaCBjb21lcyB0byBtaW5kIGlzIHRvCj4gcHV0IGFuIG5vbi1zdGF0
aWMgb2JqZWN0IGludG8gLmRpc2NhcmQubG9ja19wcm9maWxlIG9yIHNvbWV0aGluZywgc28gdGhl
Cj4gbGlua2VyIHdpbGwgb2JqZWN0IHRvIHJlcGVhdGVkIHN5bWJvbCBuYW1lcyBhbmQgdGhlbiB0
aHJvdyBhbGwgb2YgdGhlbSBhd2F5LgoKSSBjb3VsZCBqdXN0IGRyb3AgdGhlICJzdGF0aWMiIGlu
IHRoZSBfTE9DS19QUk9GSUxFX1BUUigpIG1hY3JvLgpBdCB0aGUgc2FtZSB0aW1lIEkgc2hvdWxk
IG1vdmUgdGhlICIubG9ja3Byb2ZpbGUuZGF0YSIgc2VjdGlvbiBpbiB0aGUKbGlua2VyIHNjcmlw
dHMgdG8gdGhlIGluaXQgcGFydCBtYXliZS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
