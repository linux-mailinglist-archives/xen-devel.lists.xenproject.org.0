Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F942322A
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 13:20:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSgId-0005fC-SC; Mon, 20 May 2019 11:17:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MORj=TU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hSgIb-0005f7-Vo
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 11:17:46 +0000
X-Inumbo-ID: e3449ed2-7af0-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e3449ed2-7af0-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 11:17:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D16ECAECB;
 Mon, 20 May 2019 11:17:42 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Wei Liu <wei.liu2@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>
References: <E1hSRQF-0006xk-BS@osstest.test-lab.xenproject.org>
 <23778.34168.78221.110803@mariner.uk.xensource.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <206f5d20-f48f-abfe-4418-37b7e3612465@suse.com>
Date: Mon, 20 May 2019 13:17:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <23778.34168.78221.110803@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Linux 3.18 no longer boots under Xen, please fix
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Lars Kurth <lars.kurth@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAvMDUvMjAxOSAxMjo0NiwgSWFuIEphY2tzb24gd3JvdGU6Cj4gVGhpcyBoYXMgYmVlbiB0
cnVlIGZvciBzb21lIHRpbWUuICBvc3N0ZXN0IGhhcyBiZWVuIHNlbmRpbmcgYXV0b21hdGljCj4g
bWFpbHMgaW5jbHVkaW5nIGJpc2VjdGlvbiByZXBvcnRzIGxpa2UgdGhlIG9uZSBiZWxvdywgZm9y
IGFib3V0IGEKPiBtb250aC4KPiAKPiBvc3N0ZXN0J3MgInRlc3RlZCBhbmQgZ29vZCIgYnJhbmNo
IG9mIGxpbnV4LTMuMTggaXMgMTkwIGRheXMgYmVoaW5kCj4gdGhlIHVwc3RyZWFtIHRpcC4KPiAK
PiBEbyB3ZSBjYXJlIGFib3V0IHRoaXMgYXQgYWxsID8KPiAKPiBOb3RlIHRoYXQgdGhlIFhlbiBQ
cm9qZWN0IGRvZXMgbm90IGhhdmUgYSBkZWRpY2F0ZWQgdGVhbSBvZiBRQQo+IGVuZ2luZWVycyB3
aG8gZG8gdHJpYWdlIG9mIHRlc3QgcmVwb3J0cy4gIEl0IGlzIHVwIHRvIGV2ZXJ5IG1haW50YWlu
ZXIKPiBvZiBldmVyeSBYZW4tcmVsYXRlZCBjb21wb25lbnQgdG8ga2VlcCBhbiBleWUgb24gdGhl
c2UgdGVzdCByZXBvcnRzCj4gYW5kIGludmVzdGlnYXRlIGZhaWx1cmVzLgo+IAo+IEZvciB0aGUg
YXZvaWRhbmNlIG9mIGFueSBkb3VidCwgb3NzdGVzdCdzICJiaXNlY3Rpb24gY29tcGxldGUiIHJl
cG9ydHMKPiBjYW4gYWx3YXlzIGJlIHJlbGllZCBvbiB0byBhY2N1cmF0ZWx5IGlkZW50aWZ5IGEg
cmVhbCwgcmVwZWF0YWJsZSwKPiByZWdyZXNzaW9uLiAgb3NzdGVzdCB3aWxsIG9ubHkgbWFrZSBz
dWNoIGEgcmVwb3J0IGlmIGl0IGhhcyByZXByb2R1Y2VkCj4gc2V2ZXJhbCB0aW1lcyBib3RoIHRo
ZSBmYWlsdXJlIGF0IHRoZSBjb21taXQgaXQgYmxhbWVzLCBhbmQgdGhlCj4gc3VjY2VzcyBhdCB0
aGUgY29tbWl0IGl0IHNheXMgaXMgT0suICAoSW4gdHJlZXMgd2l0aCBhIGxvdCBvZiBtZXJnaW5n
LAo+IHRoZSBjb21taXQgdGhhdCBpcyBibGFtZWQgaXMgc2FkbHkgb2Z0ZW4gYSBtZXJnZSwgYnV0
IG9uZSBvZiBpdHMKPiBwYXJlbnRzIHdpbGwgYmUgaWRlbnRpZmllZCBhcyBnb29kLikKPiAKPiBJ
biB0aGlzIGNhc2Ugb3NzdGVzdCBoYXMgc2VudCBhIHNpZ25pZmljYW50IG51bWJlciBvZiBmdW5j
dGlvbmFsbHkKPiBpZGVudGljYWwgcmVwb3J0cyBzYXlpbmcgaXQgaGFzIGlkZW50aWZpZWQgYSBy
ZWdyZXNzaW9uIGluIGxvdHMgb2YKPiBkaWZmZXJlbnQgdGVzdHMuICBCdXQgdGhpcyBoYXMgbm90
IHJlc3VsdGVkIGluIGFueSBhY3Rpb24gQUZBSUFBLgo+IAo+IFBsZWFzZSB3b3VsZCBzb21lb25l
IGludm9sdmVkIHdpdGggdGhlIExpbnV4IGtlcm5lbCBlbmQgb2YgdGhpbmdzIHBpY2sKPiB0aGlz
IHVwLgo+IAo+IFRoYW5rcywKPiBJYW4uCj4gCj4gb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRl
cyAoIltsaW51eC0zLjE4IGJpc2VjdGlvbl0gY29tcGxldGUgdGVzdC1hbWQ2NC1hbWQ2NC14bCIp
Ogo+PiBicmFuY2ggeGVuLXVuc3RhYmxlCj4+IHhlbmJyYW5jaCB4ZW4tdW5zdGFibGUKPj4gam9i
IHRlc3QtYW1kNjQtYW1kNjQteGwKPj4gdGVzdGlkIHhlbi1ib290Cj4+Cj4+IFRyZWU6IGxpbnV4
IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGlu
dXgtc3RhYmxlLmdpdAo+PiBUcmVlOiBsaW51eGZpcm13YXJlIGdpdDovL3hlbmJpdHMueGVuLm9y
Zy9vc3N0ZXN0L2xpbnV4LWZpcm13YXJlLmdpdAo+PiBUcmVlOiBvdm1mIGdpdDovL3hlbmJpdHMu
eGVuLm9yZy9vc3N0ZXN0L292bWYuZ2l0Cj4+IFRyZWU6IHFlbXUgZ2l0Oi8veGVuYml0cy54ZW4u
b3JnL3FlbXUteGVuLXRyYWRpdGlvbmFsLmdpdAo+PiBUcmVlOiBxZW11dSBnaXQ6Ly94ZW5iaXRz
Lnhlbi5vcmcvcWVtdS14ZW4uZ2l0Cj4+IFRyZWU6IHhlbiBnaXQ6Ly94ZW5iaXRzLnhlbi5vcmcv
eGVuLmdpdAo+Pgo+PiAqKiogRm91bmQgYW5kIHJlcHJvZHVjZWQgcHJvYmxlbSBjaGFuZ2VzZXQg
KioqCj4+Cj4+ICAgQnVnIGlzIGluIHRyZWU6ICBsaW51eCBnaXQ6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LXN0YWJsZS5naXQKPj4gICBCdWcg
aW50cm9kdWNlZDogIDZiMWFlNTI3YjFmZGVlODZlODFkYTBjYjI2Y2VkNzU3MzFjNmMwZmEKClRo
YXQgd2FzIHRoZSBjb21taXQgZm9yIDMuMTguMTQwCgo+PiAgIEJ1ZyBub3QgcHJlc2VudDogYmE2
OTg0ZmMwMTYyZjI0YTUxMGViYzM0ZTg4MWI1NDZiNjljNTUzYgoKYW5kIHRoYXQgdGhlIG9uZSBm
b3IgMy4xOC4xMjEKClRoZXJlIGFyZSAxMzUyIGNvbW1pdHMgYmV0d2VlbiB0aGUgdHdvIGNvbW1p
dHMuIEEgYmlzZWN0b3IgdGVsbGluZyBtZQpzdWNoIGEgcmVzdWx0IGlzIG5leHQgdG8gdXNlbGVz
cy4KCk5vdCBzdXJlIHdoZW4gSSdsbCBiZSBhYmxlIHRvIHBpY2sgaXQgdXAuCgoKSnVlcmdlbgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
