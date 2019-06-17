Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E8A47A27
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 08:42:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hclJd-00049i-52; Mon, 17 Jun 2019 06:40:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hclJc-00049d-7e
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 06:40:28 +0000
X-Inumbo-ID: ca43940c-90ca-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ca43940c-90ca-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 06:40:26 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 17 Jun 2019 00:40:25 -0600
Message-Id: <5D0735D20200007800238B1B@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 17 Jun 2019 00:40:18 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <5D03853F0200007800238448@prv1-mh.provo.novell.com>
 <5D0386DC0200007800238470@prv1-mh.provo.novell.com>
 <6c6fcf56-f6d1-e6b7-dcf8-3889a772d03e@arm.com>
In-Reply-To: <6c6fcf56-f6d1-e6b7-dcf8-3889a772d03e@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/3] x86/ACPI: re-park previously parked
 CPUs upon resume from S3
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
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE0LjA2LjE5IGF0IDE4OjUyLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IFRoZSB0aXRsZSBhbmQgY29tbWl0IG1lc3NhZ2UgYXJlIGEgYml0IG9kZCB0byByZWFkIGJlY2F1
c2UgeW91IGFyZSBtb2RpZnlpbmcgCj4gY29tbW9uIGNvZGUgYnV0IGV2ZXJ5dGhpbmcgaXMgZ2Vh
cmVkIHRvd2FyZHMgeDg2LgoKSW5kZWVkLiBUaGVyZSdzIG5vIGNhbGxlciBvZiB7ZW4sZGlzfWFi
bGVfbm9uYm9vdF9jcHVzKCkgaW4gQXJtIGNvZGUKYXQgcHJlc2VudCwgYWZhaWNzLiBIZW5jZSB0
aGUgY29kZSBjaGFuZ2VkIChidXQgbm90IHRoZSBmaWxlKSBpcyB0cnVseQp4ODYtc3BlY2lmaWMg
YXQgdGhlIG1vbWVudC4gSSd2ZSBleHBsaWNpdGx5IHRob3VnaHQgYWJvdXQgdGhlCiJpbmNvbnNp
c3RlbmN5IiBiZXR3ZWVuIHRpdGxlIGFuZCBjb250ZW50cywgYnV0IEkndmUgZGVsaWJlcmF0ZWx5
IHB1dCBpdAphcyBpczogVGhlIGNoYW5nZSBfaXNfIHg4NiAvIEFDUEkgb25seSwgX2Rlc3BpdGVf
IHRvdWNoaW5nIGNvbW1vbgpjb2RlIChhbmQgaGVuY2UgbmVlZGluZyBhIFJFU1QgbWFpbnRhaW5l
ciBhY2spLgoKPj4gLS0tIGEveGVuL2NvbW1vbi9jcHUuYwo+PiArKysgYi94ZW4vY29tbW9uL2Nw
dS5jCj4+IEBAIC0xMDUsNyArMTA1LDcgQEAgaW50IGNwdV9kb3duKHVuc2lnbmVkIGludCBjcHUp
Cj4+ICAgICAgIGlmICggZXJyICkKPj4gICAgICAgICAgIGdvdG8gZmFpbDsKPj4gICAKPj4gLSAg
ICBpZiAoIHVubGlrZWx5KHN5c3RlbV9zdGF0ZSA8IFNZU19TVEFURV9hY3RpdmUpICkKPj4gKyAg
ICBpZiAoIHN5c3RlbV9zdGF0ZSA8IFNZU19TVEFURV9hY3RpdmUgfHwgc3lzdGVtX3N0YXRlID09
IFNZU19TVEFURV9yZXN1bWUgKQo+IAo+IFNvIHRoaXMgY2hhbmdlIGhlcmUgaXMgbmVjZXNzYXJ5
IGJlY2F1c2UgZW5hYmxlX25vbmJvb3RfY3B1cygpIG1heSBjYWxsIAo+IGNwdV9kb3duKCksIGFt
IEkgcmlnaHQ/CgpZZXMgKGFsYmVpdCBsaWtlbHkgcy9uZWNlc3Nhcnkvd2FudGVkLykuCgo+IElm
IHNvLCBjb3VsZCB5b3UgcGxlYXNlIG1lbnRpb24gaXQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlPwoK
SG1tLCBJIGNvdWxkLiBCdXQgdGhpcyBpcyBqdXN0IHBhcmFsbGVsaW5nIHdoYXQgd2UncmUgYWxy
ZWFkeSBkb2luZyBmb3IKdGhlIGJvb3QgcGF0aCwgc28gaXQgZGlkbid0IHNlZW0gaW1wZXJhdGl2
ZSB0byBtZSB0byBjYWxsIGl0IG91dC4gQnV0CmFueXdheSwgSSd2ZSBhZGRlZCBhIHNlbnRlbmNl
LgoKPj4gQEAgLTIwNywxNSArMjA3LDE5IEBAIHZvaWQgZW5hYmxlX25vbmJvb3RfY3B1cyh2b2lk
KQo+PiAgIAo+PiAgICAgICBwcmludGsoIkVuYWJsaW5nIG5vbi1ib290IENQVXMgIC4uLlxuIik7
Cj4+ICAgCj4+IC0gICAgZm9yX2VhY2hfY3B1ICggY3B1LCAmZnJvemVuX2NwdXMgKQo+PiArICAg
IGZvcl9lYWNoX3ByZXNlbnRfY3B1ICggY3B1ICkKPj4gICAgICAgewo+PiArICAgICAgICBpZiAo
IHBhcmtfb2ZmbGluZV9jcHVzID8gY3B1ID09IHNtcF9wcm9jZXNzb3JfaWQoKQo+IAo+IHBhcmtf
b2ZmbGluZV9jcHVzIGlzIHg4NiBzcGVjaWZpYywgc28gaXQgd2lsbCBub3QgYnVpbGQgb24gQXJt
LgoKQW5kIHRoYXQncyBpbnRlbnRpb25hbCwgZXZlbiBtb3JlIHNvIHRoYXQgKGFzIHNhaWQgYWJv
dmUpIEFybSBkb2Vzbid0CmNhbGwgaGVyZSBpbiB0aGUgZmlyc3QgcGxhY2UuIEFuZCBldmVuIGlm
IGl0IGRpZCAtIHdoZXRoZXIgdG8gZG8gdGhpbmdzIHRoZQoibmV3IiB3YXkgd291bGQgdGhlbiBz
dGlsbCAoaW50ZW50aW9uYWxseSkgZGVwZW5kIG9uIHdoZXRoZXIgQXJtIGhhZAphbnkgd2F5IG9m
IHBhcmtfb2ZmbGluZV9jcHVzIGJlaW5nICJ0cnVlIi4KCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
