Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1C455156
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 16:15:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfmAh-0000JC-4Y; Tue, 25 Jun 2019 14:11:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xfxB=UY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hfmAf-0000J7-Vd
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 14:11:42 +0000
X-Inumbo-ID: 26e94da1-9753-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 26e94da1-9753-11e9-8980-bc764e045a96;
 Tue, 25 Jun 2019 14:11:40 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 25 Jun 2019 08:11:39 -0600
Message-Id: <5D122B95020000780023AF96@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 25 Jun 2019 08:11:33 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190619110250.18881-1-roger.pau@citrix.com>
 <20190619110250.18881-4-roger.pau@citrix.com>
 <5D0A31210200007800239AC0@prv1-mh.provo.novell.com>
 <20190619150631.5dhiozx4bybqjbrl@MacBook-Air-de-Roger.local>
 <5D0C7A650200007800239F04@prv1-mh.provo.novell.com>
 <20190624112402.thhrmu7tynfnjujw@tomti.i.net-space.pl>
 <20190625081034.n7bvsd4zdcdqsfua@MacBook-Air-de-Roger.local>
 <5D11E6D6020000780023ADDF@prv1-mh.provo.novell.com>
 <20190625110849.lo7zxh3p5ico4rdd@MacBook-Air-de-Roger.local>
In-Reply-To: <20190625110849.lo7zxh3p5ico4rdd@MacBook-Air-de-Roger.local>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/4] x86/linker: add a reloc section to ELF
 binary
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
 Daniel Kiper <daniel.kiper@oracle.com>, WeiLiu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI1LjA2LjE5IGF0IDEzOjA4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFNvcnJ5IGZvciBub3QgYmVpbmcgY2xlYXIuIEJ5IHJlbW92ZSBJIG1lYW4gYGdpdCBybQo+IHhl
bi9hcmNoL3g4Ni9lZmkvcmVsb2NzLWR1bW15LlNgIGFuZCBmaXggdGhlIGJ1aWxkLCBsaWtlIHRo
ZSBkaWZmCj4gYXBwZW5kZWQgYmVsb3cuCj4gCj4gSXMgdGhlcmUgYW55IHJlYXNvbiB3ZSBzaG91
bGQga2VlcCB0aGUgZHVtbXkgLnJlbG9jIGluIHRoZSBFTEYKPiBvdXRwdXQ/CgpZZXMsIHRoZXJl
IGlzLiBBbmQgeWVzLCBJIHdhcyBhZnJhaWQgeW91J2QgbWVhbiB0aGlzLgoKPiAtLS0gYS94ZW4v
YXJjaC94ODYvZWZpL2VmaS1ib290LmgKPiArKysgYi94ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290
LmgKPiBAQCAtMzksNiArMzksNyBAQCBleHRlcm4gY29uc3QgaW50cHRlX3QgX19wYWdlX3RhYmxl
c19zdGFydFtdLCBfX3BhZ2VfdGFibGVzX2VuZFtdOwo+ICAjZGVmaW5lIFBFX0JBU0VfUkVMT0Nf
SElHSExPVyAgMwo+ICAjZGVmaW5lIFBFX0JBU0VfUkVMT0NfRElSNjQgICAxMAo+ICAKPiArI2lm
ZGVmIFhFTl9CVUlMRF9QRQoKVGhpcyBpcyBhbiBpZGVudGlmaWVyIGF2YWlsYWJsZSB0byBNYWtl
ZmlsZXMgb25seS4gWW91IGFsc28gY2FuJ3QgcHJvcGFnYXRlCml0IHRvIC5jIGZpbGVzLCBhcyB0
aGVzZSBnZXQgY29tcGlsZWQganVzdCBvbmNlIHRvIHByb2R1Y2UgX2JvdGhfIFBFIGFuZApFTEYg
YmluYXJ5LiBTbyB3aGlsZSB3aGF0IHlvdSBzdWdnZXN0IG1heSBidWlsZCwgaXQnbGwgcmVzdWx0
IGluIGEgYnJva2VuCnhlbi5lZmkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
