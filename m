Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DA217BB1
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 16:38:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hONgS-0007RD-Ft; Wed, 08 May 2019 14:36:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=d3I2=TI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hONgR-0007R7-8t
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 14:36:35 +0000
X-Inumbo-ID: ac8fffc8-719e-11e9-819f-47a674d21a37
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ac8fffc8-719e-11e9-819f-47a674d21a37;
 Wed, 08 May 2019 14:36:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C5F13AD05;
 Wed,  8 May 2019 14:36:31 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-46-jgross@suse.com> <5CCFF6F1020000780022C12B@suse.com>
 <ac57c420-a72e-7570-db8f-27e4693c2755@suse.com>
 <5CD005E7020000780022C1B5@prv1-mh.provo.novell.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <f7692c11-ab14-4d7d-4b7a-72e9c58e8f30@suse.com>
Date: Wed, 8 May 2019 16:36:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CD005E7020000780022C1B5@prv1-mh.provo.novell.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYvMDUvMjAxOSAxMjowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDYuMDUuMTkg
YXQgMTE6MjMsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBBbmQgdGhhdCB3YXMgbWVudGlv
bmVkIGluIHRoZSBjb3ZlciBsZXR0ZXI6IGNwdSBob3RwbHVnIGlzIG5vdCB5ZXQKPj4gaGFuZGxl
ZCAoaGVuY2UgdGhlIFJGQyBzdGF0dXMgb2YgdGhlIHNlcmllcykuCj4+Cj4+IFdoZW4gY3B1IGhv
dHBsdWcgaXMgYmVpbmcgYWRkZWQgaXQgbWlnaHQgYmUgYXBwcm9wcmlhdGUgdG8gc3dpdGNoIHRo
ZQo+PiBzY2hlbWUgYXMgeW91IHN1Z2dlc3RlZC4gUmlnaHQgbm93IHRoZSBjdXJyZW50IHNvbHV0
aW9uIGlzIG11Y2ggbW9yZQo+PiBzaW1wbGUuCj4gCj4gSSBzZWUgKEkgZGlkIG5vdGljZSB0aGUg
Y292ZXIgbGV0dGVyIHJlbWFyaywgYnV0IG1hbmFnZWQgdG8gbm90Cj4gaG9ub3IgaXQgd2hlbiB3
cml0aW5nIHRoZSByZXBseSksIGJ1dCBJJ20gdW5jb252aW5jZWQgaWYgaW5jdXJyaW5nCj4gbW9y
ZSBjb2RlIGNodXJuIGJ5IG5vdCBkZWFsaW5nIHdpdGggdGhpbmdzIHRoZSAiZHluYW1pYyIgd2F5
Cj4gcmlnaHQgYXdheSBpcyBpbmRlZWQgdGhlICJtb3JlIHNpbXBsZSIgKG92ZXJhbGwpIHNvbHV0
aW9uLgoKSSBoYXZlIHN0YXJ0ZWQgdG8gYWRkcmVzcyBjcHUgb24vb2ZmbGluaW5nIG5vdy4KClRo
ZXJlIGFyZSBtdWx0aXBsZSBkZXNpZ24gZGVjaXNpb25zIHRvIHRha2UuCgoxLiBJbnRlcmFjdGlv
biBiZXR3ZWVuIHNjaGVkLWdyYW4gYW5kIHNtdCBib290IHBhcmFtZXRlcnMKMi4gSW50ZXJhY3Rp
b24gYmV0d2VlbiBzY2hlZC1ncmFuIGFuZCB4ZW4taHB0b29sIHNtdCBzd2l0Y2hpbmcKMy4gSW50
ZXJhY3Rpb24gYmV0d2VlbiBzY2hlZC1ncmFuIGFuZCBzaW5nbGUgY3B1IG9uL29mZmxpbmluZwoK
UmlnaHQgbm93IGFueSBndWVzdCB3b24ndCBzZWUgYSBkaWZmZXJlbmNlIHJlZ2FyZGluZyBzY2hl
ZC1ncmFuCnNlbGVjdGlvbi4gVGhpcyBtZWFucyB3ZSBkb24ndCBoYXZlIHRvIHRoaW5rIGFib3V0
IHBvdGVudGlhbCBtaWdyYXRpb24KcmVzdHJpY3Rpb25zLiBUaGlzIG1pZ2h0IGNoYW5nZSBpbiBm
dXR1cmUgd2hlbiB3ZSB3YW50IHRvIGVuYWJsZSB0aGUKZ3Vlc3QgdG8gZS5nLiB1c2UgY29yZSBz
Y2hlZHVsaW5nIHRoZW1zZWx2ZXMgaW4gb3JkZXIgdG8gbWl0aWdhdGUKYWdhaW5zdCBzaWRlIGNo
YW5uZWwgYXR0YWNrcyB3aXRoaW4gdGhlIGd1ZXN0LgoKVGhlIG1vc3Qgc2ltcGxlIHNvbHV0aW9u
IHdvdWxkIGJlIChhbmQgSSdkIGxpa2UgdG8gc2VuZCBvdXQgVjEgb2YgbXkKc2VyaWVzIHdpdGgg
dGhhdCBpbXBsZW1lbnRlZCk6CgpzY2hlZC1ncmFuPWNvcmUgYW5kIHNjaGVkLWdyYW49c29ja2V0
IGRvbid0IGFsbG93IGR5bmFtaWNhbCBzd2l0Y2hpbmcKb2Ygc210IHZpYSB4ZW4taHB0b29sLgoK
V2l0aCBzY2hlZC1ncmFuPWNvcmUgb3Igc2NoZWQtZ3Jhbj1zb2NrZXQgb2ZmbGluaW5nIGEgc2lu
Z2xlIGNwdSByZXN1bHRzCmluIG1vdmluZyB0aGUgY29tcGxldGUgY29yZSBvciBzb2NrZXQgdG8g
Y3B1cG9vbF9mcmVlX2NwdXMgYW5kIHRoZW4Kb2ZmbGluaW5nIGZyb20gdGhlcmUuIE9ubHkgY29t
cGxldGUgY29yZXMvc29ja2V0cyBjYW4gYmUgbW92ZWQgdG8gYW55CmNwdXBvb2wuIFdoZW4gb25s
aW5pbmcgYSBjcHUgaXQgaXMgYWRkZWQgdG8gY3B1cG9vbF9mcmVlX2NwdXMgYW5kIGlmCnRoZSBj
b3JlL3NvY2tldCBpcyBjb21wbGV0ZWx5IG9ubGluZSBpdCB3aWxsIGF1dG9tYXRpY2FsbHkgYmUg
YWRkZWQgdG8KUG9vbC0wIChhcyB0b2RheSBhbnkgc2luZ2xlIG9ubGluZWQgY3B1KS4KClRoZSBu
ZXh0IHN0ZXBzIChmb3IgZnV0dXJlIHBhdGNoZXMpIGNvdWxkIGJlOgoKLSBwZXItY3B1cG9vbCBz
bXQgc2V0dGluZ3MgKHN0YXRpYyBhdCBjcHVwb29sIGNyZWF0aW9uLCBtb3ZpbmcgYSBkb21haW4K
ICBiZXR3ZWVuIGNwdXBvb2xzIHdpdGggZGlmZmVyZW50IHNtdCBzZXR0aW5ncyBub3Qgc3VwcG9y
dGVkKQoKLSBzdXBwb3J0IG1vdmluZyBkb21haW5zIGJldHdlZW4gY3B1cG9vbHMgd2l0aCBkaWZm
ZXJlbnQgc210IHNldHRpbmdzCiAgKGEgZ3Vlc3Qgc3RhcnRlZCB3aXRoIHNtdD0wIHdvdWxkIG9u
bHkgZXZlciB1c2UgMSB0aHJlYWQgcGVyIGNvcmUpCgotIHN1cHBvcnQgcGVyLWNwdXBvb2wgc2No
ZWR1bGluZyBncmFudWxhcml0eQoKVGhvdWdodHM/CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
