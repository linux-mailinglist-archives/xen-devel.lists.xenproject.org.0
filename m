Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EDE4AEA6
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 01:19:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdNKH-00046k-NV; Tue, 18 Jun 2019 23:15:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PyOf=UR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hdNKG-00046f-1U
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 23:15:40 +0000
X-Inumbo-ID: fb6a2e02-921e-11e9-8bb3-83ef7db65fd3
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb6a2e02-921e-11e9-8bb3-83ef7db65fd3;
 Tue, 18 Jun 2019 23:15:38 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1DF7720873;
 Tue, 18 Jun 2019 23:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560899737;
 bh=NvjwRpW6ezK/iIA25ZGYM2CCqvJ2GwVkrB4rAdoczhU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=WWyvIuHYwlTTh0yoGok2ZaF8Oru30OZuH3ncLpAq7ZQK/zAY7Cus0gaJu4f5X8Fg4
 gDpgbA/T27BA9+g9bPuqvQa6C0Jc6ydkuLD3rdUgQJ3zLPE+XhvarZm8uU3Fsg1cZR
 aOCxSNnGgKaoUqqNFw1t3yrGAXv11C4nSAQbqxnU=
Date: Tue, 18 Jun 2019 16:15:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <alpine.DEB.2.21.1906181330330.2072@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.1906181612230.2072@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-3-git-send-email-sstabellini@kernel.org>
 <5CCB08C4020000780022B59A@prv1-mh.provo.novell.com>
 <alpine.DEB.2.21.1906171428080.2072@sstabellini-ThinkPad-T480s>
 <5D08A7E70200007800239282@prv1-mh.provo.novell.com>
 <alpine.DEB.2.21.1906181330330.2072@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 03/10] xen: extend
 XEN_DOMCTL_memory_mapping to handle memory policy
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
 Julien Grall <julien.grall@arm.com>, Stefano Stabellini <stefanos@xilinx.com>,
 Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxOCBKdW4gMjAxOSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IE9uIFR1ZSwg
MTggSnVuIDIwMTksIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gPj4+IE9uIDE3LjA2LjE5IGF0IDIz
OjI4LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+IE9uIFRodSwgMiBNYXkg
MjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiA+PiA+Pj4gT24gMzAuMDQuMTkgYXQgMjM6MDIs
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4+ID4gLS0tIGEveGVuL2luY2x1
ZGUvcHVibGljL2RvbWN0bC5oCj4gPiA+PiA+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21j
dGwuaAo+ID4gPj4gPiBAQCAtNTcxLDEyICs1NzEsMjQgQEAgc3RydWN0IHhlbl9kb21jdGxfYmlu
ZF9wdF9pcnEgewo+ID4gPj4gPiAgKi8KPiA+ID4+ID4gICNkZWZpbmUgRFBDSV9BRERfTUFQUElO
RyAgICAgICAgIDEKPiA+ID4+ID4gICNkZWZpbmUgRFBDSV9SRU1PVkVfTUFQUElORyAgICAgIDAK
PiA+ID4+ID4gKy8qCj4gPiA+PiA+ICsgKiBEZWZhdWx0IG1lbW9yeSBwb2xpY3kuIENvcnJlc3Bv
bmRzIHRvOgo+ID4gPj4gPiArICogQXJtOiBNRU1PUllfUE9MSUNZX0FSTV9ERVZfbkdSRQo+ID4g
Pj4gPiArICogeDg2OiBNRU1PUllfUE9MSUNZX1g4Nl9VQwo+ID4gPj4gPiArICovCj4gPiA+PiA+
ICsjZGVmaW5lIE1FTU9SWV9QT0xJQ1lfREVGQVVMVCAgICAwCj4gPiA+PiA+ICsvKiB4ODYgb25s
eS4gTWVtb3J5IHR5cGUgVU5DQUNIQUJMRSAqLwo+ID4gPj4gPiArI2RlZmluZSBNRU1PUllfUE9M
SUNZX1g4Nl9VQyAgICAgMAo+ID4gPj4gCj4gPiA+PiBJJ20gYWZyYWlkIHRoaXMgbWF5IGVuZCB1
cCBtaXNsZWFkaW5nLCBhcyBvbiBOUFQgYW5kIGluCj4gPiA+PiBzaGFkb3cgbW9kZSB3ZSB1c2Ug
VUMtIGluc3RlYWQgb2YgVUMgYWZhaWNzLiBBbmRyZXcsCj4gPiA+PiBkbyB5b3UgaGF2ZSBhbiBv
cGluaW9uIGVpdGhlciB3YXkgd2hhdCBleGFjdGx5IHNob3VsZAo+ID4gPj4gYmUgc3RhdGVkIGhl
cmU/Cj4gPiA+IAo+ID4gPiBQaW5nPwo+ID4gCj4gPiBUbyBtZT8gSSd2ZSBzdGF0ZWQgbXkgb3Bp
bmlvbi4KPiAKPiBJIGNhbm5vdCBuYW1lIHRoZSBtYWNybyAiTUVNT1JZX1BPTElDWV9YODZfVUMt
IiBiZWNhdXNlIGl0IGNhbm5vdCBlbmQKPiB3aXRoIGEgIi0iLiBJbnN0ZWFkLCBJIGNhbiBuYW1l
IGl0IE1FTU9SWV9QT0xJQ1lfWDg2X1VDX01JTlVTIHRoYXQgc2VlbXMKPiB0byBiZSB3aGF0IExp
bnV4IGRvZXMuIEknbGwgcmVuYW1lIHRoZSBvcHRpb25hbCB4bCBwYXJhbWV0ZXIgdG9vIGZyb20K
PiAieDg2X3VjIiB0byAieDg2X3VjX21pbnVzIi4KCkkgY2hhdHRlZCB3aXRoIEFuZHJldyBvbiBJ
UkMgYW5kIGhlIHN1Z2dlc3RlZCB0byBnZXQgcmlkIG9mIHRoZSBvcHRpb24KZW50aXJlbHkgLS0g
dGhlcmUgaXMganVzdCBvbmUgb24geDg2IGFuZCBkb2Vzbid0IG5lY2Vzc2FyaWx5IG5lZWQgdG8g
YmUKZXhwbGljaXRseSB2aXNpYmxlLiBXZSBjb3VsZCBvbmx5IGhhdmUgTUVNT1JZX1BPTElDWV9E
RUZBVUxULCBhbmQgYWxzbwpyZW1vdmUgdGhlIHg4Nl91YyBzZXR0aW5nIGZyb20gbGlieGwveGwu
CgpJIGFtIE9LIHdpdGggdGhpcy4gSG93ZXZlciwgZ2l2ZW4gdGhhdCBJIGhhdmUgYWxyZWFkeSBt
YWRlIGFsbCB0aGUKY2hhbmdlcyB0byBoYXZlIE1FTU9SWV9QT0xJQ1lfWDg2X1VDX01JTlVTIGFu
ZCB4ODZfdWNfbWludXMgZXZlcnl3aGVyZSwKSSdsbCBzZW5kIGFuIHVwZGF0ZSBvZiB0aGUgc2Vy
aWVzIHdpdGggdGhlbS4KClRoZW4geW91IGNhbiBkZWNpZGUgd2hldGhlciB5b3Ugd2FudCB0byBr
ZWVwIHRoaW5ncyBsaWtlIHRoYXQgb3IgZ2V0IHJpZApvZiBpdC4gT2YgY291cnNlIHJlbW92aW5n
IGNvZGUgaXMgZWFzeSAtLSBJIGFtIGFsd2F5cyBoYXBweSB0byBkbyBpdCBpZgp0aGF0J3Mgd2hh
dCB5b3Ugd2FudC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
