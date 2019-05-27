Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E782B8A8
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 18:01:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVI1d-0000rD-5u; Mon, 27 May 2019 15:59:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7auh=T3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVI1c-0000r8-11
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 15:59:00 +0000
X-Inumbo-ID: 54bda71a-8098-11e9-b5b7-c35dcafa723a
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54bda71a-8098-11e9-b5b7-c35dcafa723a;
 Mon, 27 May 2019 15:58:56 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 27 May 2019 09:58:54 -0600
Message-Id: <5CEC093A0200007800232D0A@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 27 May 2019 09:58:50 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190510161056.48648-1-roger.pau@citrix.com>
 <20190510161056.48648-5-roger.pau@citrix.com>
 <5CE7C93A0200007800231F24@prv1-mh.provo.novell.com>
 <20190527154819.e4mp2uh4i32j3auq@Air-de-Roger>
In-Reply-To: <20190527154819.e4mp2uh4i32j3auq@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 4/5] print: introduce a format specifier for
 pci_sbdf_t
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI3LjA1LjE5IGF0IDE3OjQ4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIEZyaSwgTWF5IDI0LCAyMDE5IGF0IDA0OjM2OjQyQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiBTaW5jZSB3ZSBjYW4ndAo+PiB1c2UgZW50aXJlbHkgbmV3IGZvcm1hdCBzcGVjaWZp
ZXJzLCBkaWQgeW91IGNvbnNpZGVyIChhYil1c2luZyBvbmUKPj4gd2UgcmFyZWx5IHVzZSwgbGlr
ZSAlbywgc3VmZml4ZWQgc2ltaWxhcmx5IGxpa2Ugd2UgZG8gZm9yICVwPyBUaGUKPj4gZXh0ZW5z
aW9uIGNvdWxkIGJlIHJlc3RyaWN0ZWQgdG8gYXBwbHkgb25seSB3aGVuIG5laXRoZXIgZmllbGQg
d2lkdGgKPj4gbm9yIHByZWNpc2lvbiBub3IgYW55IGZsYWdzIHdlcmUgc3BlY2lmaWVkLCBpLmUu
IG9ubHkgdG8gcGxhaW4gJW8gKGF0Cj4+IGxlYXN0IGluaXRpYWxseSkuCj4+IAo+PiBXZSdkIHRo
ZW4gaGF2ZSBzb21ldGhpbmcgYWxvbmcgdGhlIGxpbmVzIG9mCj4+IAo+PiAjZGVmaW5lIFBSSV9z
YmRmICJvcCIKPj4gI2RlZmluZSBQUklfU0JERih2KSAoKHYpLnNiZGYpCj4+IAo+PiBhbmQKPj4g
Cj4+ICAgICBwcmludGsoIiUiIFBSSV9zYmRmICI6IC4uLlxuIiwgUFJJX1NCREYocGRldi0+c2Jk
ZiksIC4uLik7Cj4gCj4gSSBoYXZlIHRvIGFkbWl0IHRoaXMgbG9va3MgbW9yZSBoYWNreSB0aGFu
IG15IGN1cnJlbnQgc3VnZ2VzdGlvbiBJTU8uCgpIbW0sIGEgbWF0dGVyIG9mIHRhc3RlIHBlcmhh
cHMuIEkgY2VydGFpbmx5IGNvbnNpZGVyIGNvbnN0cnVjdHMKbGlrZSAiJlBDSV9TQkRGMl9UKHNl
ZywgYmRmKSIgdWdseS9oYWNreSBlbm91Z2guIFRha2luZwpBbmRyZXcncyBwb3NpdGlvbiBvZiB3
YW50aW5nIGZ1bmN0aW9uLXN0eWxlIG1hY3JvcyB0byBiZWhhdmUKZnVuY3Rpb24tbGlrZSwgdGhp
cyBpc24ndCBldmVuIGxlZ2FsIEMgdGhlbiAoYmVjYXVzZSB5b3UgY2FuJ3QKdGFrZSB0aGUgYWRk
cmVzcyBvZiB0aGUgcmVzdWx0IG9mIGEgZnVuY3Rpb24gY2FsbCkuCgo+IFRoZSAlcCBmb3JtYXR0
ZXIgb3ZlcmxvYWRpbmcgc2VlbXMgbW9yZSBzdGFuZGFyZCBhbmQgZXhwZWN0ZWQgcmF0aGVyCj4g
dGhhbiBvdmVybG9hZGluZyAlby4KCldlbGwsIGl0IGxvb2tlZCBvZGQgKHRvIG1lIGF0IGxlYXN0
KSBmb3IgJXAgaW4gdGhlIGJlZ2lubmluZyB0b28sIHNvCnBlcmhhcHMgaXQncyBqdXN0IGEgbWF0
dGVyIG9mIGdldHRpbmcgdXNlZCB0byBpdC4KCj4gUGx1cywgb25lIHRoaW5nIEkgZGlkbid0IHJl
YWxpemUsIEkgdGhpbmsgWGVuIGNvdWxkIGV2ZW4gdXNlICVwY2kgdG8KPiBwcmludCBhbmQgU0JE
Riwgd2hpY2ggd2lsbCBtYWtlIGl0IGV2ZW4gY2xlYXJlci4KCkRvY3VtZW50YXRpb24td2lzZSAt
IG5pY2UuIEJ1dCBtYWtpbmcgZXZlcnkgaW52b2x2ZWQgc3RyaW5nIGxpdGVyYWwKb25lIGNoYXJh
Y3RlciBsb25nZXIgYWdhaW4uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
