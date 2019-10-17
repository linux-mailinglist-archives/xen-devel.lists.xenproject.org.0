Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F484DA836
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 11:23:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iL1xA-0004Um-6C; Thu, 17 Oct 2019 09:20:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=g/FX=YK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iL1x9-0004Uh-KR
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 09:20:15 +0000
X-Inumbo-ID: 52e4e04c-f0bf-11e9-beca-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 52e4e04c-f0bf-11e9-beca-bc764e2007e4;
 Thu, 17 Oct 2019 09:20:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E12C01684;
 Thu, 17 Oct 2019 02:20:12 -0700 (PDT)
Received: from [10.1.196.50] (unknown [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 378CA3F718;
 Thu, 17 Oct 2019 02:20:12 -0700 (PDT)
To: Brian Woods <brian.woods@xilinx.com>
References: <1570650447-3225-1-git-send-email-brian.woods@xilinx.com>
 <4da9c328-3968-5d46-6000-73e824b26962@arm.com>
 <20191011164325.GA18594@xilinx.com>
 <b623fddb-9ab6-d9ef-0d66-93e465ee64c6@arm.com>
 <20191011180612.GA19987@xilinx.com>
 <a3cf5b20-9a67-f3db-5a0d-1fb672b2bbe3@arm.com>
 <20191011190751.GB19987@xilinx.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <729fbca8-9a9c-8764-9f9d-c24140d9bb68@arm.com>
Date: Thu, 17 Oct 2019 10:20:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191011190751.GB19987@xilinx.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: add warning if memory modules
 overlap
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpTb3JyeSBmb3IgdGhlIGxhdGUgYW5zd2VyLgoKT24gMTEvMTAvMjAxOSAyMDowNywgQnJp
YW4gV29vZHMgd3JvdGU6Cj4gT24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMDc6MTc6MjlQTSArMDEw
MCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBUaGlzIGNvZGUgaXMgYWxzbyBvbmx5IGNhbGxlZCBh
dCBib290IHdoZXJlIHRoZXJlIGFyZSBiaWdnZXIgdGltZSBjb25zdW1pbmcKPj4gcGFydCAoc3Vj
aCBhcyBkb21oZWFwIGluaXRpYWxpemF0aW9uKS4gU28gSSB3b3VsZCBiZSBzdXJwcmlzZWQgaWYg
eW91IHNlZQo+PiBhbnkgaW1wcm92ZW1lbnQgKG90aGVyIHRoYW4gYSBjb3VwbGUgb2YgY3ljbGVz
KSBpbiBib290IHRpbWUgaGVyZS4KPj4KPj4gVGhlcmVmb3JlLCBJIHdvdWxkIGZhdm9yIGEgcmVh
ZGFibGUgc29sdXRpb24gb3ZlciBhIG1pY3JvLW9wdGltaXplZCBzb2x1dGlvbgo+PiBoZXJlLgo+
IAo+IFdoaWNoIGlzIHdoeSBJIHdhbnRlZCB0byBwdXQgaXQgd2hlcmUgaXQgd2FzIGluIHRoZSBw
YXRjaC4gIFdoZXJlIHRoZQo+IHVzZXIgd291bGQgc2VlIHRoZSB3YXJuaW5nIGFmdGVyIHRoZSBp
bmZvcm1hdGlvbiBhYm91dCB0aGUgbWVtb3J5Cj4gbW9kdWxlcyB3ZXJlIHByaW50ZWQgKGFuZCBm
YWlyIGVhcmx5KS4KCkkgaGFkIGEgdGhpbmsgYWJvdXQgaXQsIGR1bXBpbmcgdGhlIG1vZHVsZXMg
aW5mb3JtYXRpb25zIGJlZm9yZSBpcyB1c2VmdWwgaWYgeW91IAprbm93IHRoYXQgeW91IGhhdmUg
b25lIG1vZHVsZSBtYXggcGVyIGtpbmQuIFNvIHlvdSBhdm9pZCB0byBwcmludCB0aGUgbW9kdWxl
cyAKYWRkcmVzcy9zaXplIGluIHRoZSB3YXJuaW5nLgoKSG93ZXZlciwgaXQgaXMgcG9zc2libGUg
dG8gaGF2ZSBtdWx0aXBsZSBrZXJuZWwgbW9kdWxlIChhcyBsb25nIGFzIHRoZXkgZG9uJ3QgCmhh
dmUgdGhlIHNhbWUgc3RhcnQgYWRkcmVzcyksIHlvdSBjb3VsZCBlbmQgdXAgd2l0aCB0aGUgZm9s
bG93aW5nIG1lc3NhZ2U6CgoiV0FSTklORzogbW9kdWxlcyBLZXJuZWwgYW5kIEtlcm5lbCBvdmVy
bGFwIgoKVG8gbWFrZSB0aGUgbWVzc2FnZSBtb3JlIG1lYW5pbmdmdWwsIHdlIHdvdWxkIG5lZWQg
dG8gcHJpbnQgdGhlIG1vZHVsZXMgCmFkZHJlc3Mvc2l6ZS4gVGhlcmVmb3JlLCBJIGRvbid0IHZp
ZXcgdGhhdCBpdCBpcyBpbXBvcnRhbnQgdG8gY2hlY2sgb3ZlcmxhcHBpbmcgCmluIGVhcmx5X3By
aW50X2luZm8oKS4gSW4gdGhpcyBjYXNlIEkgd291bGQgZmF2b3IgYW55IGNvZGUgdGhhdCBkb24n
dCBhZGQgYSAKZG91YmxlIGZvciBsb29wLgoKV2hpbGUgdGhpbmtpbmcgYWJvdXQgdGhpcyBjYXNl
LCBpdCBtYWRlIG1lIHJlYWxpemUgdGhhdCB3ZSBvbmx5IGNoZWNrIHRoZSBzdGFydCAKYWRkcmVz
cyB0byBjb25zaWRlciBhIG1hdGNoLiBUaGlzIG1lYW5zIGlmIHRoZSBzaXplIGlzIGRpZmZlcmVu
dCwgdGhlbiBpdCB3aWxsIApiZSBpZ25vcmVkLiBJIHRoaW5rIHdlIG91Z2h0IHRvIHRocm93IGF0
IGxlYXN0IHdhcm5pbmcgZm9yIHRoaXMgY2FzZSBhcyB3ZWxsLgoKV291bGQgeW91IG1pbmQgdG8g
aGF2ZSBhIGxvb2s/Cgo+IAo+IEVpdGhlciB3YXksIHRha2UgeW91ciBwaWNrIG9mIGxvY2F0aW9u
IGFuZCBpZiBpdCdzIG9ubHkgZGVidWcgb3Igbm90IGFuZAo+IEkgY2FuIHdyaXRlIGl0IHVwIGFu
ZCB0ZXN0IGl0LgoKSSB3b3VsZCBzdGlsbCBwcmVmZXIgaW4gYWRkX2Jvb3RfbW9kdWxlKCkuIFNl
ZSB3aHkgYWJvdmUuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
