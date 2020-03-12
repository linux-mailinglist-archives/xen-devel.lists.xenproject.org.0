Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3644E182EBE
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 12:14:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCLlC-0005OI-N8; Thu, 12 Mar 2020 11:12:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FfMj=45=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jCLlB-0005O0-5J
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 11:12:17 +0000
X-Inumbo-ID: 53432b1e-6452-11ea-b14b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 53432b1e-6452-11ea-b14b-12813bfff9fa;
 Thu, 12 Mar 2020 11:12:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 38724B1A3;
 Thu, 12 Mar 2020 11:12:13 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
References: <8a151dd0-d083-d242-566c-f1faee084ae2@citrix.com>
 <658ef23d-f6e1-dbf8-8805-b84e32ffb6fa@suse.com>
 <20200312105639.GG24458@Air-de-Roger.citrite.net>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7c1fea74-15eb-0006-a99c-53fb4c4a676f@suse.com>
Date: Thu, 12 Mar 2020 12:12:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200312105639.GG24458@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] nvmx deadlock with MSR bitmaps
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDMuMjAgMTE6NTYsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gVGh1LCBNYXIg
MTIsIDIwMjAgYXQgMDk6NTk6NDhBTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDEx
LjAzLjIwMjAgMTk6MDQsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+PiBTcGVjaWZpY2FsbHksIHRo
aXMgaXMgYSBzd2l0Y2ggZnJvbSBhbiBIVk0gdmNwdSwgdG8gYSBQViB2Y3B1LCB3aGVyZSB0aGUK
Pj4+IG1hcGNhY2hlIGNvZGUgdHJpZXMgdG8gYWNjZXNzIHRoZSBwZXItZG9tYWluIG1hcHBpbmdz
IG9uIHRoZSBIVk0gbW9uaXRvcgo+Pj4gdGFibGUuwqAgSXQgZW5kcyB1cCB0cnlpbmcgdG8gcmVj
dXJzaXZlbHkgYWNxdWlyZSB0aGUgbWFwY2FjaGUgbG9jayB3aGlsZQo+Pj4gdHJ5aW5nIHRvIHdh
bGsgJWNyMiB0byBpZGVudGlmeSB0aGUgc291cmNlIG9mIHRoZSBmYXVsdC4KPj4+Cj4+PiBGb3Ig
bnZteC0+bXNyX21lcmdlZCwgdGhpcyBuZWVkcyB0byBlaXRoZXIgYmUgYSB4ZW5oZWFwIHBhZ2Us
IG9yIGEKPj4+IGdsb2JhbGx5IG1hcHBlZCBkb21oZWFwIHBhZ2UuwqAgSSdsbCBkcmFmdCBhIHBh
dGNoIGluIGEgbW9tZW50Lgo+Pj4KPj4+IEZvciBtYXBfZG9tYWluX3BhZ2UoKSwgaXMgdGhlcmUg
YW55dGhpbmcgd2UgY2FuIHJhdGlvbmFsbHkgZG8gdG8gYXNzZXJ0Cj4+PiB0aGF0IGl0IGlzbid0
IGNhbGxlZCBpbiB0aGUgbWlkZGxlIG9mIGEgY29udGV4dCBzd2l0Y2g/wqAgVGhpcyBpcyB0aGUK
Pj4+IGtpbmQgb2YgdGhpbmcgd2hpY2ggbmVlZHMgdG8gYmxvdyB1cCByZWxpYWJseSBpbiBhIGRl
YnVnIGJ1aWxkLgo+Pgo+PiBXZWxsLCBpdCdzIG5vdCBpbmhlcmVudGx5IHVuc2FmZSB0byBkbywg
aXQncyBqdXN0IHRoYXQKPj4gbWFwY2FjaGVfY3VycmVudF92Y3B1KCkgd291bGQgbmVlZCB0byBh
dm9pZCB1c2luZyBjdXJyZW50IGZyb20KPj4gY29udGV4dF9zd2l0Y2goKSdzIGNhbGwgdG8gc2V0
X2N1cnJlbnQoKSB0aHJvdWdoIHRvCj4+IF9fY29udGV4dF9zd2l0Y2goKSdzIGNhbGwgdG8gd3Jp
dGVfcHRiYXNlKCkuIEEgcG9zc2libGUKPj4gZGV0ZWN0aW9uIChpZiB3ZSBkb24ndCB3YW50IHRv
IG1ha2UgdGhlIGNhc2Ugd29yaykgd291bGQKPj4gc2VlbSB0byBiZSBBU1NFUlQoY3VycmVudCA9
PSB0aGlzX2NwdShjdXJyX3ZjcHUpKS4gQnV0IG9mIGNvdXJzZQo+PiB0aGVyZSdzIGFsc28gdGhp
cyBleHRyYSBsb2dpYyBpbiBtYXBjYWNoZV9jdXJyZW50X3ZjcHUoKSB0byBkZWFsCj4+IHdpdGgg
YSBQViB2Q1BVIGhhdmluZyBhIG51bGwgdi0+YXJjaC5ndWVzdF90YWJsZSwgd2hpY2ggSSdtIG9u
Y2UKPj4gYWdhaW4gc3RydWdnbGluZyB0byBzZWUgdW5kZXIgd2hhdCBjb25kaXRpb25zIGl0IG1p
Z2h0IGhhcHBlbi4KPj4gVGhlIERvbTAgYnVpbGRpbmcgY2FzZSBjYW4ndCBiZSBtZWFudCB3aXRo
IHRoZXJlIGJlaW5nCj4+IG1hcGNhY2hlX292ZXJyaWRlX2N1cnJlbnQoKSBvbiB0aGF0IHBhdGgu
IEknbSB3b25kZXJpbmcgaWYgdGhlCj4+IGNvbW1lbnQgdGhlcmUgaXMgbWlzbGVhZGluZyBhbmQg
aXQncyByZWFsbHkgdG8gY292ZXIgdGhlIGNhc2UKPj4gd2hlcmUsIGNvbWluZyBmcm9tIGEgUFYg
dkNQVSwgY3VycmVudCB3YXMgYWxyZWFkeSBzZXQgdG8gdGhlCj4+IGlkbGUgdkNQVSBieSBjb250
ZXh0X3N3aXRjaCgpICh3aGljaCB3b3VsZCBoYXZlIGEgbnVsbAo+PiB2LT5hcmNoLmd1ZXN0X3Rh
YmxlKSAtIEkgd291bGRuJ3QgY2FsbCB0aGlzICJ3ZSBhcmUgcnVubmluZyBhCj4+IHBhcmF2aXJ0
dWFsaXNlZCBndWVzdCIuIEJ1dCBpbiBzdWNoIGEgY2FzZSB0aGUgbG9naWMgaGVyZSB3b3VsZAo+
PiBzaW1wbHkgYmUgYSAodG9vKSBzcGVjaWFsIGNhc2Ugb2Ygd2hhdCB5b3UncmUgZGVzY3JpYmlu
ZyBhcyB0aGUKPj4gaXNzdWUgd2l0aCBuVk1YLgo+IAo+IExvb2tpbmcgYXQgdGhlIGNvZGUgaW4g
Y29udGV4dF9zd2l0Y2ggYW5kIF9fY29udGV4dF9zd2l0Y2ggd291bGQgaXQgYmUKPiBwb3NzaWJs
ZSB0byBzZXQgY3VycmVudCB0byB0aGUgbmV4dCB2Q1BVIGFmdGVyIGFsbCB0aGUgZnJvbSBob29r
cyBoYXZlCj4gYmVlbiBjYWxsZWQ/Cj4gCj4gSWU6IHNldF9jdXJyZW50IGNvdWxkIGJlIG1vdmVk
IGludG8gX19jb250ZXh0X3N3aXRjaCBhZnRlciB0aGUgY2FsbCB0bwo+IHBkLT5hcmNoLmN0eHRf
c3dpdGNoLT5mcm9tKHApLgoKTm8sIHdvdWxkbid0IHdvcmsuIFdoZW4gc3dpdGNoaW5nIHRvIGlk
bGUgX19jb250ZXh0X3N3aXRjaCgpIGlzIG5vcm1hbGx5Cm5vdCBjYWxsZWQgaW4gb3JkZXIgdG8g
YXZvaWQgc3dpdGNoaW5nIHRoZSBhZGRyZXNzIHNwYWNlIGluIGNhc2UgdGhlCnNhbWUgdmNwdSB3
aWxsIGJlIHNjaGVkdWxlZCBhZ2FpbiBhZnRlciBpZGxlLiBUaGlzIGlzIHRoZSByZWFzb24gd2h5
CmN1cnJlbnQgYW5kIGN1cnJfdmNwdSBjYW4gYmUgZGlmZmVyZW50LgoKPiBJJ20gYWxzbyBub3Qg
c3VyZSBJIHVuZGVyc3RhbmQgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBjb250ZXh0X3N3aXRjaAo+
IGFuZCBfX2NvbnRleHRfc3dpdGNoLCBhbmQgaG93IGFyZSBjYWxsZXJzIHN1cHBvc2VkIHRvIHVz
ZSB0aGVtLgoKVGhhdCBpcyBzY2hlZHVsZXIgYmxhY2sgbWFnaWMuIDotKQoKCkp1ZXJnZW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
