Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3248A25477
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 17:49:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hT6yd-0007Cq-MH; Tue, 21 May 2019 15:46:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7C/d=TV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hT6yb-0007Cl-E9
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 15:46:53 +0000
X-Inumbo-ID: a679fc7c-7bdf-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a679fc7c-7bdf-11e9-8980-bc764e045a96;
 Tue, 21 May 2019 15:46:51 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 21 May 2019 09:46:50 -0600
Message-Id: <5CE41D6802000078002310DF@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 21 May 2019 09:46:48 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B82BF020000780021F1C7@prv1-mh.provo.novell.com>
 <f23432bc-ab78-6de9-60ab-57767896b380@citrix.com>
In-Reply-To: <f23432bc-ab78-6de9-60ab-57767896b380@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v8 19/50] x86emul: support AVX512F
 floating-point conversion insns
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIxLjA1LjE5IGF0IDEzOjMzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTUvMDMvMjAxOSAxMDo0NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEBAIC05MzEy
LDcgKzkzODYsOCBAQCB4ODZfZW11bGF0ZSgKPj4gIAo+PiAgICAgICAgICBpZiAoIGVhLnR5cGUg
PT0gT1BfTUVNICkKPj4gICAgICAgICAgewo+PiAtICAgICAgICAgICAgcmMgPSBvcHMtPndyaXRl
KGVhLm1lbS5zZWcsIGVhLm1lbS5vZmYsIG1tdmFscCwgOCA8PCB2ZXgubCwgY3R4dCk7Cj4+ICsg
ICAgICAgICAgICByYyA9IG9wcy0+d3JpdGUoZWEubWVtLnNlZywgdHJ1bmNhdGVfZWEoZWEubWVt
Lm9mZiArIGZpcnN0X2J5dGUpLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICh2b2lk
ICopbW12YWxwICsgZmlyc3RfYnl0ZSwgb3BfYnl0ZXMsIGN0eHQpOwo+PiAgICAgICAgICAgICAg
aWYgKCByYyAhPSBYODZFTVVMX09LQVkgKQo+PiAgICAgICAgICAgICAgewo+PiAgICAgICAgICAg
ICAgICAgIGFzbSB2b2xhdGlsZSAoICJsZG14Y3NyICUwIiA6OiAibSIgKG14Y3NyKSApOwo+IAo+
IFRoaXMgaHVuayBkb2Vzbid0IGFwcGVhciB0byBmaXQgd2l0aCB0aGUgcmVzdCBvZiB0aGUgcGF0
Y2gsIGJlY2F1c2UgaXQKPiBpc24ndCB0aGUgZmlyc3QgdXNlIG9mIGZpcnN0X2J5dGUuCj4gCj4g
SGF2ZSB3ZSBiZWVuIHN1YnRseSBicm9rZW4gYmVmb3JlPwoKSSBkb24ndCB0aGluayBzbywgbm8s
IGJ1dCBJIGFkbWl0IEknbSBub3Qgc3VyZSBJIHVuZGVyc3RhbmQgd2hhdAp5b3UncmUgc2F5aW5n
IGFib3ZlLiBUaGUgdXNlIG9mIGZpcnN0X2J5dGUgaGVyZSBpcyBvZiBjb3Vyc2Ugbm90CnRoZSBm
aXJzdCB1c2UgLSBpdCBnZXRzIHNldCBpbiB0aGUgaHVuayBmdXJ0aGVyIHVwLiBUaGUgQVZYIGZv
cm0gb2YKVkNWVFBTMlBIIGRvZXMgbm90IHN1cHBvcnQgZmF1bHQgc3VwcHJlc3Npb24gKGFzIHRo
YXQncyBhbgpBVlg1MTIgZmVhdHVyZSksIGFuZCBoZW5jZSBubyBzdWNoIGFkanVzdG1lbnQgd2Fz
IG5lZWRlZApoZXJlIGJlZm9yZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
