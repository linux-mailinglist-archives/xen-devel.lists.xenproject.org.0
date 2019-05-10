Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAFB19A35
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 11:03:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP1OX-0007Dl-U2; Fri, 10 May 2019 09:00:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Iy1x=TK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hP1OW-0007Dg-Lr
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 09:00:44 +0000
X-Inumbo-ID: 16bc0edd-7302-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 16bc0edd-7302-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 09:00:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1958AAF5F;
 Fri, 10 May 2019 09:00:41 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: =?UTF-8?B?PDIwMTkwNTA2MDY1NjQ0Ljc0MTXvv70x77+9amdyb3NzQHN1c2Uu?=
 =?UTF-8?B?Y29tPiA8MjAxOTA1MDYwNjU2NDQuNzQxNe+/vTQ277+9amdyb3NzQHN1c2UuY29t?=
 =?UTF-8?Q?=3e_=3c5CCFF6F1020000780022C12B=40suse=2ecom=3e_=3cac57c420?=
 =?UTF-8?B?77+9YTcyZe+/vTc1NzDvv71kYjhm77+9MjdlNDY5M2MyNzU1QHN1c2UuY29tPiA8?=
 =?UTF-8?Q?5CD005E7020000780022C1B5=40prv1=ef=bf=bdmh=2eprovo=2enovell=2ecom?=
 =?UTF-8?Q?=3e_=3cf7692c11-ab14-4d7d-4b7a-72e9c58e8f30=40suse=2ecom=3e_=3c5C?=
 =?UTF-8?Q?D53C1C020000780022D706=40suse=2ecom=3e?=
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <46968660-ea39-1ee0-2aee-c4a22f135ddb@suse.com>
Date: Fri, 10 May 2019 11:00:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC V2 45/45] xen/sched: add scheduling
 granularity enum
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMDUvMjAxOSAxMDo1MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDguMDUuMTkg
YXQgMTY6MzYsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAwNi8wNS8yMDE5IDEyOjAx
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDA2LjA1LjE5IGF0IDExOjIzLCA8amdyb3Nz
QHN1c2UuY29tPiB3cm90ZToKPj4+PiBBbmQgdGhhdCB3YXMgbWVudGlvbmVkIGluIHRoZSBjb3Zl
ciBsZXR0ZXI6IGNwdSBob3RwbHVnIGlzIG5vdCB5ZXQKPj4+PiBoYW5kbGVkIChoZW5jZSB0aGUg
UkZDIHN0YXR1cyBvZiB0aGUgc2VyaWVzKS4KPj4+Pgo+Pj4+IFdoZW4gY3B1IGhvdHBsdWcgaXMg
YmVpbmcgYWRkZWQgaXQgbWlnaHQgYmUgYXBwcm9wcmlhdGUgdG8gc3dpdGNoIHRoZQo+Pj4+IHNj
aGVtZSBhcyB5b3Ugc3VnZ2VzdGVkLiBSaWdodCBub3cgdGhlIGN1cnJlbnQgc29sdXRpb24gaXMg
bXVjaCBtb3JlCj4+Pj4gc2ltcGxlLgo+Pj4KPj4+IEkgc2VlIChJIGRpZCBub3RpY2UgdGhlIGNv
dmVyIGxldHRlciByZW1hcmssIGJ1dCBtYW5hZ2VkIHRvIG5vdAo+Pj4gaG9ub3IgaXQgd2hlbiB3
cml0aW5nIHRoZSByZXBseSksIGJ1dCBJJ20gdW5jb252aW5jZWQgaWYgaW5jdXJyaW5nCj4+PiBt
b3JlIGNvZGUgY2h1cm4gYnkgbm90IGRlYWxpbmcgd2l0aCB0aGluZ3MgdGhlICJkeW5hbWljIiB3
YXkKPj4+IHJpZ2h0IGF3YXkgaXMgaW5kZWVkIHRoZSAibW9yZSBzaW1wbGUiIChvdmVyYWxsKSBz
b2x1dGlvbi4KPj4KPj4gSSBoYXZlIHN0YXJ0ZWQgdG8gYWRkcmVzcyBjcHUgb24vb2ZmbGluaW5n
IG5vdy4KPj4KPj4gVGhlcmUgYXJlIG11bHRpcGxlIGRlc2lnbiBkZWNpc2lvbnMgdG8gdGFrZS4K
Pj4KPj4gMS4gSW50ZXJhY3Rpb24gYmV0d2VlbiBzY2hlZC1ncmFuIGFuZCBzbXQgYm9vdCBwYXJh
bWV0ZXJzCj4+IDIuIEludGVyYWN0aW9uIGJldHdlZW4gc2NoZWQtZ3JhbiBhbmQgeGVuLWhwdG9v
bCBzbXQgc3dpdGNoaW5nCj4+IDMuIEludGVyYWN0aW9uIGJldHdlZW4gc2NoZWQtZ3JhbiBhbmQg
c2luZ2xlIGNwdSBvbi9vZmZsaW5pbmcKPj4KPj4gUmlnaHQgbm93IGFueSBndWVzdCB3b24ndCBz
ZWUgYSBkaWZmZXJlbmNlIHJlZ2FyZGluZyBzY2hlZC1ncmFuCj4+IHNlbGVjdGlvbi4gVGhpcyBt
ZWFucyB3ZSBkb24ndCBoYXZlIHRvIHRoaW5rIGFib3V0IHBvdGVudGlhbCBtaWdyYXRpb24KPj4g
cmVzdHJpY3Rpb25zLiBUaGlzIG1pZ2h0IGNoYW5nZSBpbiBmdXR1cmUgd2hlbiB3ZSB3YW50IHRv
IGVuYWJsZSB0aGUKPj4gZ3Vlc3QgdG8gZS5nLiB1c2UgY29yZSBzY2hlZHVsaW5nIHRoZW1zZWx2
ZXMgaW4gb3JkZXIgdG8gbWl0aWdhdGUKPj4gYWdhaW5zdCBzaWRlIGNoYW5uZWwgYXR0YWNrcyB3
aXRoaW4gdGhlIGd1ZXN0Lgo+Pgo+PiBUaGUgbW9zdCBzaW1wbGUgc29sdXRpb24gd291bGQgYmUg
KGFuZCBJJ2QgbGlrZSB0byBzZW5kIG91dCBWMSBvZiBteQo+PiBzZXJpZXMgd2l0aCB0aGF0IGlt
cGxlbWVudGVkKToKPj4KPj4gc2NoZWQtZ3Jhbj1jb3JlIGFuZCBzY2hlZC1ncmFuPXNvY2tldCBk
b24ndCBhbGxvdyBkeW5hbWljYWwgc3dpdGNoaW5nCj4+IG9mIHNtdCB2aWEgeGVuLWhwdG9vbC4K
Pj4KPj4gV2l0aCBzY2hlZC1ncmFuPWNvcmUgb3Igc2NoZWQtZ3Jhbj1zb2NrZXQgb2ZmbGluaW5n
IGEgc2luZ2xlIGNwdSByZXN1bHRzCj4+IGluIG1vdmluZyB0aGUgY29tcGxldGUgY29yZSBvciBz
b2NrZXQgdG8gY3B1cG9vbF9mcmVlX2NwdXMgYW5kIHRoZW4KPj4gb2ZmbGluaW5nIGZyb20gdGhl
cmUuIE9ubHkgY29tcGxldGUgY29yZXMvc29ja2V0cyBjYW4gYmUgbW92ZWQgdG8gYW55Cj4+IGNw
dXBvb2wuIFdoZW4gb25saW5pbmcgYSBjcHUgaXQgaXMgYWRkZWQgdG8gY3B1cG9vbF9mcmVlX2Nw
dXMgYW5kIGlmCj4+IHRoZSBjb3JlL3NvY2tldCBpcyBjb21wbGV0ZWx5IG9ubGluZSBpdCB3aWxs
IGF1dG9tYXRpY2FsbHkgYmUgYWRkZWQgdG8KPj4gUG9vbC0wIChhcyB0b2RheSBhbnkgc2luZ2xl
IG9ubGluZWQgY3B1KS4KPiAKPiBXZWxsLCB0aGlzIGlzIGluIGxpbmUgd2l0aCB3aGF0IHdhcyBk
aXNjdXNzZWQgb24gdGhlIGNhbGwgeWVzdGVyZGF5LCBzbwo+IEkgdGhpbmsgaXQncyBhbiBhY2Nl
cHRhYmxlIGluaXRpYWwgc3RhdGUgdG8gZW5kIHVwIGluLiBBbGJlaXQsIGp1c3QgZm9yCj4gY29t
cGxldGVuZXNzLCBJJ20gbm90IGNvbnZpbmNlZCB0aGVyZSdzIG5vIHVzZSBmb3IgInNtdC17ZGlz
LGVufWFibGUiCj4gYW55bW9yZSB3aXRoIGNvcmUtYXdhcmUgc2NoZWR1bGluZyBpbXBsZW1lbnRl
ZCBqdXN0IGluIFhlbiAtIGl0Cj4gbWF5IHN0aWxsIGJlIGNvbnNpZGVyZWQgdXNlZnVsIGFzIGxv
bmcgYXMgd2UgZG9uJ3QgZXhwb3NlIHByb3Blcgo+IHRvcG9sb2d5IHRvIGd1ZXN0cywgZm9yIHRo
ZW0gdG8gYmUgYWJsZSB0byBkbyBzb21ldGhpbmcgc2ltaWxhci4KCkFzIHRoZSBleHRyYSBjb21w
bGV4aXR5IGZvciBzdXBwb3J0aW5nIHRoYXQgaXMgc2lnbmlmaWNhbnQgSSdkIGxpa2UgdG8KYXQg
bGVhc3QgcG9zdHBvbmUgaXQuIEFuZCB3aXRoIHRoZSAobGF0ZXIpIGludHJvZHVjdGlvbiBvZiBw
ZXItY3B1cG9vbApzbXQgb24vb2ZmIEkgZ3Vlc3MgdGhpcyB3b3VsZCBiZSBldmVuIGxlc3MgaW1w
b3J0YW50LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
