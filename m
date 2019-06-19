Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 990B64B789
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 13:59:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdZCa-00084X-6i; Wed, 19 Jun 2019 11:56:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hdZCY-00084S-HF
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 11:56:30 +0000
X-Inumbo-ID: 44bc0f48-9289-11e9-925d-b723b1721237
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44bc0f48-9289-11e9-925d-b723b1721237;
 Wed, 19 Jun 2019 11:56:27 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 19 Jun 2019 05:56:26 -0600
Message-Id: <5D0A22E70200007800239A18@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 19 Jun 2019 05:56:23 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190619110250.18881-1-roger.pau@citrix.com>
 <20190619110250.18881-4-roger.pau@citrix.com>
 <cd4af737-de45-15a0-d0c6-90e7d9cc0185@citrix.com>
In-Reply-To: <cd4af737-de45-15a0-d0c6-90e7d9cc0185@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE5LjA2LjE5IGF0IDEzOjIwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTkvMDYvMjAxOSAxMjowMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+PiBOb3Rl
IHRoYXQgdGhlIC5yZWxvYyBzZWN0aW9uIGlzIG1vdmVkIGJlZm9yZSAuYnNzIGZvciB0d28gcmVh
c29uczogaW4KPj4gb3JkZXIgZm9yIHRoZSByZXN1bHRpbmcgYmluYXJ5IHRvIG5vdCBjb250YWlu
IGFueSBzZWN0aW9uIHdpdGggZGF0YQo+PiBhZnRlciAuYnNzLCBzbyB0aGF0IHRoZSBmaWxlIHNp
emUgY2FuIGJlIHNtYWxsZXIgdGhhbiB0aGUgbG9hZGVkCj4+IG1lbW9yeSBzaXplLCBhbmQgYmVj
YXVzZSB0aGUgZGF0YSBpdCBjb250YWlucyBpcyByZWFkLW9ubHksIHNvIGl0Cj4+IGJlbG9uZ3Mg
d2l0aCB0aGUgb3RoZXIgc2VjdGlvbnMgY29udGFpbmluZyByZWFkLW9ubHkgZGF0YS4KPiAKPiBU
aGUgY29udGVudCBvZiAucmVsb2NzIGlzIHRyYW5zZm9ybWVkIHZpYSBta3JlbG9jIHRvIGJlY29t
ZQo+IF9fYmFzZV9yZWxvY3Nfe3N0YXJ0LGVuZH0gYW5kIHNob3VsZG4ndCBleGlzdCBpbnRvIHRo
ZSBmaW5hbCBsaW5rZWQKPiBpbWFnZSBBRkFJQ1QuCgpUaGUgbGFiZWxzIGFyZSByZWZlcmVuY2Vk
IGZyb20gY29kZSwgYW5kIGhlbmNlIC4uLgoKPiBTaW5jZSB0aGUgTUIxL01CMiBidWlsZHMgYXJl
bid0IHJlbG9jYXRhYmxlLCBJIHRoaW5rIHdlIG1pZ2h0IGJlIGFibGUgdG8KPiBnZXQgYXdheSB3
aXRoIHNpbXBseSBleGNsdWRpbmcgdGhlbSBpbiB0aGUgbm9uLUVGSSBidWlsZC4KCi4uLiB0aGlz
IHdvbid0IGJlIHBvc3NpYmxlIHdpdGhvdXQgZnVydGhlciB0cmlja2VyeSwgSSdtIGFmcmFpZC4K
CkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
