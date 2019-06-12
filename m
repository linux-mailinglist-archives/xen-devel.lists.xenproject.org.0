Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7DE42BA0
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 18:01:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hb5dq-0006qI-Uk; Wed, 12 Jun 2019 15:58:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uepN=UL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hb5do-0006qA-Tp
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 15:58:24 +0000
X-Inumbo-ID: e6e346a6-8d2a-11e9-8c17-c76f932882be
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e6e346a6-8d2a-11e9-8c17-c76f932882be;
 Wed, 12 Jun 2019 15:58:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 174DB2B;
 Wed, 12 Jun 2019 08:58:21 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 731393F73C;
 Wed, 12 Jun 2019 08:58:20 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190514123125.29086-1-julien.grall@arm.com>
 <20190514123125.29086-7-julien.grall@arm.com>
 <alpine.DEB.2.21.1906111710110.13737@sstabellini-ThinkPad-T480s>
 <a1921f46-f042-f167-4461-72b903a9418d@arm.com>
 <alpine.DEB.2.21.1906120853050.13737@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <0ac90607-49b3-1b9d-0796-daab8d6e0c02@arm.com>
Date: Wed, 12 Jun 2019 16:58:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906120853050.13737@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART3 v2 06/12] xen/arm: mm: Sanity check
 any update of Xen page tables
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
Cc: xen-devel@lists.xenproject.org, Andrii Anisov <Andrii_Anisov@epam.com>,
 Oleksandr_Tyshchenko@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMi8wNi8yMDE5IDE2OjU0LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
V2VkLCAxMiBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiAxMi8wNi8yMDE5IDAx
OjEwLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+PiBPbiBUdWUsIDE0IE1heSAyMDE5LCBK
dWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBJIHVuZGVyc3RhbmQgd2UgY291bGQgc2tpcCB0aGUgdmFs
aWQgY2hlY2sgb24gUkVNT1ZFLCBidXQgc2hvdWxkIHdlIHNraXAKPj4+IGl0IG9uIE1PRElGWSB0
b28/IElzIHRoYXQgYWxzbyBnb2luZyB0byBiZSBoZWxwZnVsIGluIGZ1dHVyZSBjaGFuZ2VzPwo+
Pgo+PiBIbW1tLCBJIGNhbid0IGV4YWN0bHkgcmVtZW1iZXIgd2h5IEkgZGlkbid0IGNoZWNrIHRo
ZSB2YWxpZCBiaXQgaGVyZS4KPj4KPj4gSSBkaWQgaXQgZm9yIFJFTU9WRSBhcyBmb3IgdGhlIGVh
cmx5IEZEVCBtYXBwaW5nIGl0IGlzIG1vcmUgY29udmVuaWVudCB0bwo+PiByZW1vdmUgdGhlIGZ1
bGwgcG9zc2libGUgcmFuZ2Ugb3ZlciBrZWVwaW5nIHRyYWNrIG9mIHRoZSBleGFjdCBzdGFydC9z
aXplLgo+Pgo+PiBJIHdvdWxkIGFzc3VtZSB0aGUgc2FtZSB3b3VsZCBob2xkIGZvciBNT0RJRlks
IGJ1dCBJIGRvbid0IGhhdmUgYSBjb25jcmV0ZQo+PiBleGFtcGxlIGhlcmUuIEkgYW0gaGFwcHkg
dG8gYWRkIHRoZSB2YWxpZCBjaGVjayBhbmQgZGVmZXIgdGhlIGRlY2lzaW9uIHRvCj4+IHJlbW92
ZSBpdCBpZiBpdCBpcyBkZWVtIHRvIGJlIHVzZWZ1bCBpbiB0aGUgZnV0dXJlLgo+IAo+IFllcywg
aXQgd291bGQgYmUgYmV0dGVyCgpJIHdpbGwgdXBkYXRlIGl0IGluIHRoZSBuZXh0IHZlcnNpb24u
CgpbLi4uXQoKPj4+PiAgICBzdGF0aWMgaW50IHhlbl9wdF91cGRhdGVfZW50cnkoZW51bSB4ZW5t
YXBfb3BlcmF0aW9uIG9wLCB1bnNpZ25lZCBsb25nCj4+Pj4gYWRkciwKPj4+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgbWZuX3QgbWZuLCB1bnNpZ25lZCBpbnQgZmxhZ3MpCj4+
Pj4gICAgewo+Pj4+ICAgICAgICBscGFlX3QgcHRlLCAqZW50cnk7Cj4+Pj4gICAgICAgIGxwYWVf
dCAqdGhpcmQgPSBOVUxMOwo+Pj4+ICAgICsgICAgLyogX1BBR0VfUE9QVUxBVEUgYW5kIF9QQUdF
X1BSRVNFTlQgc2hvdWxkIG5ldmVyIGJlIHNldCB0b2dldGhlci4KPj4+PiAqLwo+Pj4+ICsgICAg
QVNTRVJUKChmbGFncyAmIChfUEFHRV9QT1BVTEFURXxfUEFHRV9QUkVTRU5UKSkgIT0KPj4+PiAo
X1BBR0VfUE9QVUxBVEV8X1BBR0VfUFJFU0VOVCkpOwo+Pj4KPj4+IG92ZXIgODAgY2hhcnM/Cj4+
Cj4+IEl0IGlzIDg3IGNoYXJzLCBJIHdhcyBob3BpbmcgeW91IGRpZG4ndCBub3RpY2UgaXQgOiku
IFRoZSBsaW5lIHNwbGl0dGluZwo+PiByZXN1bHQgdG8gbmFzdHkgY29kZS4gQWx0ZXJuYXRpdmVs
eSwgSSBjb3VsZCBpbnRyb2R1Y2UgYSBkZWZpbmUgZm9yCj4+IF9QQUdFX1BPUFVMQVRFfF9QQUdF
X1BSRVNFTlQsIG1heWJlIEVYQ0xVU0lWRV9GTEFHUz8KPj4KPj4gQW55IHByZWZlcmVuY2U/Cj4g
Cj4gSSBkb24ndCBjYXJlIHNvIG11Y2ggYWJvdXQgODAgY2hhcnMgbGltaXQuCj4gQW55dGhpbmcg
YnV0IGFub3RoZXIgbWFjcm8gOi0pCgpPayBJIHdpbGwga2VlcCB0aGUgODAgbGluZXMgdGhlbiEK
CkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
