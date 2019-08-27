Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C57E69E3D1
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 11:19:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2XbT-0007iS-LV; Tue, 27 Aug 2019 09:17:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=72vU=WX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2XbR-0007iL-Qm
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 09:17:25 +0000
X-Inumbo-ID: 7af82f9e-c8ab-11e9-951b-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7af82f9e-c8ab-11e9-951b-bc764e2007e4;
 Tue, 27 Aug 2019 09:17:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 85DE5AE49;
 Tue, 27 Aug 2019 09:17:23 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20190726133331.91482-1-roger.pau@citrix.com>
 <20190726133331.91482-3-roger.pau@citrix.com>
 <f46656a6-22f7-bece-30c2-9be66ab36ef4@suse.com>
 <20190820075806.ukodfbsyg3u5winm@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8722ee9d-aa68-2871-06d9-e4eedd7797dc@suse.com>
Date: Tue, 27 Aug 2019 11:17:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820075806.ukodfbsyg3u5winm@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/3] build: allow picking the env values for
 compiler variables
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 JulienGrall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDguMjAxOSAwOTo1OCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gTW9uLCBK
dWwgMjksIDIwMTkgYXQgMDM6MzU6MzZQTSArMDAwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDI2LjA3LjIwMTkgMTU6MzMsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+IERvbid0IGZvcmNl
IHRoZSB1c2FnZSBvZiB0aGUgaGFyZGNvZGVkIGNvbXBpbGVyIHZhbHVlcyBpZiB0aG9zZSBhcmUK
Pj4+IGFscmVhZHkgc2V0IG9uIHRoZSBlbnZpcm9ubWVudC4gVGhpcyBhbGxvd3MgdGhlIFhlbiBi
dWlsZCBzeXN0ZW0gdG8KPj4+IGNvcnJlY3RseSBwaWNrIENDL0NYWCB2YWx1ZXMgcHJlc2VudCBv
biB0aGUgZW52aXJvbm1lbnQsIGFuZCBmaXhlcyB0aGUKPj4+IHVzYWdlIG9mIHRob3NlIGJ5IHRo
ZSBHaXRsYWIgQ0kgdGVzdCBzeXN0ZW0uCj4+Pgo+Pj4gTm90ZSB0aGF0IHdpdGhvdXQgdGhpcyBm
aXggdGhlIFhlbiBidWlsZCBzeXN0ZW0gd2lsbCBjb21wbGV0ZWx5IGlnbm9yZQo+Pj4gYW55IEND
IG9yIENYWCB2YWx1ZXMgc2V0IG9uIHRoZSBlbnZpcm9ubWVudCwgYW5kIHRoZSBvbmx5IHdheSB0
byBwYXNzCj4+PiBhIGRpZmZlcmVudCBDQyBvciBDWFggaXMgdG8gb3ZlcndyaXRlIGl0IG9uIHRo
ZSBtYWtlIGNvbW1hbmQgbGluZS4KPj4KPj4gTm93IHRoZSBxdWVzdGlvbiBpczogRG8gd2UgcG9z
c2libHkgd2FudCBpdCB0byBiZSB0aGF0IHdheT8gSSd2ZSBhbHdheXMKPj4gYmVlbiBvZiB0aGUg
b3BpbmlvbiB0aGF0IGluaGVyaXRpbmcgc29tZXRoaW5nIHRoYXQgaGFwcGVucyB0byBiZSAobGVm
dD8pCj4+IHNldCBpbiB0aGUgZW52aXJvbm1lbnQgaXMgbm90IGEgZ29vZCBpZGVhLgo+IAo+IFRo
ZW4gd2hhdCdzIHRoZSBwb2ludCBpbiBoYXZpbmcgYW4gZW52aXJvbm1lbnQgd2l0aCBzdHVmZiBh
bnl3YXkgaWYKPiBYZW4gYnVpbGQgaXMganVzdCBnb2luZyB0byBpZ25vcmUgaXQ/Cj4gCj4gSSBk
b24ndCBoYXZlIHRoaW5ncyAnbGVmdCcgaW4gdGhlIGVudmlyb25tZW50LCBuZWl0aGVyIGhhdmUg
bW9zdCBidWlsZAo+IHN5c3RlbXMgQUZBSUsuIEkgZG8gaGF2ZSB0aGluZ3Mgc2V0IHRoYXQgSSB3
YW50IHRoZSBidWlsZCB0bwo+IGFja25vd2xlZGdlLCBpbnN0ZWFkIG9mIGZpZ2h0IGFnYWluc3Qg
aXQuCgpNeSB2aWV3IGlzIHRoaXM6IFhFTl8qIHRoaW5ncyBjb21pbmcgZnJvbSB0aGUgZW52aXJv
bm1lbnQgYXJlIGZpbmUuCkdlbmVyaWMgKGkuZS4gcHJvamVjdCBhZ25vc3RpYykgdmFyaWFibGVz
IChsaWtlIENDKSBvdG9oIHdvdWxkCmJldHRlciBiZSBpZ25vcmVkLCBhcyBpdCdzIG5vdCBjbGVh
ciBmb3Igd2hhdCBwdXJwb3NlIHRoZXkndmUgYmVlbgpzZXQuIChJc3RyIGEgY2FzZSB3aGVyZSBz
b21lIEZPUlRJRlkgb3B0aW9uIHdhcyBzZXQgYnkgUlBNIGJ1aWxkCmVudmlyb25tZW50cywgYnJl
YWtpbmcgb3VyIGJ1aWxkLikgVGhleSBtYXkgd2VsbCBoYXZlIGJlZW4gbWVhbnQKZm9yIHNvbWUg
b3RoZXIgcHJvamVjdC4KClF1ZXN0aW9uIGlzIHdoZXRoZXIgdG8gdGFrZSB0aGUgYWJvdmUganVz
dCBmb3IgdGhlIGh5cGVydmlzb3IgcGFydApvZiB0aGUgYnVpbGQsIG9yIGFsc28gdGhlIHRvb2wg
c3RhY2sgZXRjIG9uZXMuCgo+PiBIZW5jZSBJJ3ZlIGJlZW4gd2VsY29taW5nIGFsbAo+PiBjaGFu
Z2VzIHRoYXQgcmVtb3ZlZCBkZXBlbmRlbmNpZXMgb24gc2V0dGluZ3MgcG9zc2libHkgY29taW5n
IGZyb20gdGhlCj4+IGVudmlyb25tZW50LiAoRXhjZXB0aW9ucyBvZiBjb3Vyc2UgYXJlIFhFTl8q
IGVudmlyb25tZW50IHZhcmlhYmxlcyB3ZQo+PiBzcGVjaWZpY2FsbHkgZXZhbHVhdGUuKQo+Pgo+
PiBBcyBhIHJlc3VsdCBJJ20gaW5jbGluZWQgdG8gbmFrIHRoaXMgcGF0Y2gsIGJ1dCBJJ20gb3Bl
biB0byBhcmd1bWVudHMuCj4gCj4gSU1PIGRvaW5nIHRoaW5ncyBsaWtlIHRoaXMgaXMgZ29pbmcg
dG8gbWFrZSBYZW4gaGFyZGVyIHRvIHBhY2thZ2UgZm9yCj4gZXZlcnlvbmUsIHNpbmNlIGRpc3Ry
byBidWlsZCBzeXN0ZW1zIGFuZCB0ZXN0IHN5c3RlbXMgKGxpa2UgVHJhdmlzIG9yCj4gR2l0bGFi
KSBleHBlY3QgdGhlIGJ1aWxkIHN5c3RlbSB0byBwaWNrIHRoZSByZWxldmFudAo+IGNvbXBpbGVy
L3Rvb2xjaGFpbiB2YXJpYWJsZXMgZnJvbSB0aGUgZW52aXJvbm1lbnQuIE5vdCBkb2luZyBpdCB0
aGlzCj4gd2F5IG1lYW5zIHdlIG5lZWQgdG8gYWRhcHQgZWFjaCBidWlsZCBzeXN0ZW0gdG8gd29y
ayB3aXRoIFhlbi4KCldlbGwsIHdoYXQgeW91IGRlc2NyaWJlIG1lYW5zIGN1c3RvbWl6aW5nIHRo
ZSBlbnZpcm9ubWVudC4gV2hhdCBJCnN1Z2dlc3QgbWVhbnMgY3VzdG9taXppbmcgdGhlIG1ha2Ug
Y29tbWFuZCBsaW5lLiBCdXQgaXQncyBjdXN0b21pemF0aW9uCmluIGVpdGhlciBjYXNlLiBJdCBf
bWF5XyBoYXBwZW4gdGhhdCBjdXN0b21pemluZyB0aGUgZW52aXJvbm1lbnQgZm9yClhlbiBtZWFu
cyBkb2luZyBub3RoaW5nLCBhbmQgdGhlIHNhbWUgc2V0dGluZ3MgYmVpbmcgdXNlZnVsIGZvciBv
dGhlcgpwcm9qZWN0cyBhcyB3ZWxsLiBCdXQgdGhpcyBkb2Vzbid0IGhhdmUgdG8gYmUgdGhpcyB3
YXkgYW5kLCBhcyBzYWlkCmFib3ZlLCBoYXMgYmVlbiBjYXVzaW5nIHByb2JsZW1zLgoKRnVydGhl
cm1vcmUgLSB3aGF0IGRvIHlvdSBkbyBpZiBkaWZmZXJlbnQgcGFydHMgb2YgdGhlIHRyZWUgKHhl
bi8sCnRvb2xzLywgc3R1YmRvbS8pIHdhbnQgdG8gaGF2ZSBkaWZmZXJlbnQgc2V0dGluZ3MgaW4g
ZWZmZWN0PyBUbyBtZQppdCdzIHF1aXRlIGEgYml0IG1vcmUgbmF0dXJhbCB0byBoYXZlIHRocmVl
IGRpZmZlcmVudCBidXQgc3BlY2lmaWMKbWFrZSBpbnZvY2F0aW9ucywgcmF0aGVyIHRoYW4gZmlk
ZGxpbmcgd2l0aCB2YXJpb3VzIGVudiB2YXJzIGJldHdlZW4KYW55IHR3byBvZiB0aGVtLgoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
