Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B2746B50
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 22:55:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbtC4-0000Lu-TJ; Fri, 14 Jun 2019 20:53:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PuWx=UN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hbtC3-0000Lp-49
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 20:53:03 +0000
X-Inumbo-ID: 661b08d4-8ee6-11e9-b789-abc3369ff57b
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 661b08d4-8ee6-11e9-b789-abc3369ff57b;
 Fri, 14 Jun 2019 20:53:02 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 390DC2073F;
 Fri, 14 Jun 2019 20:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560545581;
 bh=9vs4w72GkUlTMfqhFoIWo/4IlaJibWASkSyzZ+j7z8o=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Xbu81GvBJe17PaLqCQmozoHuGbNBIiUDkiSCVXKc6qJkEEeh19ILIUFswgqs1V/r/
 zqMr7EoP71i3rW39qnQv3iRleoADZIoW5mEFTJ2rnrR4Cs11jObCFXRJmihVc/K2ww
 3bJqVoqKHXC2bZYMrAyq4hip4voAF5Ehz51gMZK0=
Date: Fri, 14 Jun 2019 13:53:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <dca4af7b-6591-cb01-8e75-32438097f65a@arm.com>
Message-ID: <alpine.DEB.2.21.1906141343510.2072@sstabellini-ThinkPad-T480s>
References: <59199da7-40ad-6513-2000-7e10fdbb564b@gmail.com>
 <28b298ba-9acb-5d3b-b4ba-4ef72f4db4be@gmail.com>
 <65e7d353-b587-516e-d167-aa59a1e94f73@gmail.com>
 <alpine.DEB.2.21.1906101329140.8691@sstabellini-ThinkPad-T480s>
 <ba65a0e3-d7c4-f007-1a34-be28561804e5@gmail.com>
 <22ab207e-ae22-2002-35e0-f28177e29c30@arm.com>
 <f3034c36-cb04-b698-5a0e-1d4af3ac8f84@gmail.com>
 <alpine.DEB.2.21.1906110907220.13737@sstabellini-ThinkPad-T480s>
 <4db25be4-195e-6187-e9b8-c1a212429659@gmail.com>
 <987d8bb6-31a1-6d5e-2514-7498423c8c53@gmail.com>
 <alpine.DEB.2.21.1906111515000.13737@sstabellini-ThinkPad-T480s>
 <dca4af7b-6591-cb01-8e75-32438097f65a@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] How to boot domU and dom0 from a device tree
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
Cc: Iain Hunter <drhunter95@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Hunyue Yau <hy-gsoc@hy-research.com>, Denis Obrezkov <denisobrezkov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxMiBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IChNb3ZpbmcgZnJvbSB4
ZW4tdXNlcnMgdG8geGVuLWRldmVsKS4KPiAKPiBPbiAxMS8wNi8yMDE5IDIzOjE4LCBTdGVmYW5v
IFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBJIG1hbmFnZWQgdG8gcmVwcm9kdWNlZCB0aGUgaXNzdWUs
IGFuZCBJIGtub3cgaG93IHRvIGdldCBwYXN0IGl0LiAgVHJ5Cj4gPiB1c2luZyB0aGUgcmF3IGtl
cm5lbCBJbWFnZSAoYXJjaC9hcm02NC9ib290L0ltYWdlKSBpbnN0ZWFkIG9mIEltYWdlLmd6Cj4g
PiBmb3IgZG9tMCBhbmQgZG9tVS4gVGhhdCBmaXhlZCBpdCBmb3IgbWUuCj4gPiAKPiA+IEp1bGll
biwgSSBkaWRuJ3QgbWFuYWdlIHRvIGZpZ3VyZSBvdXQgd2hhdCB0aGUgaXNzdWUgaXMgZXhhY3Rs
eSwgYnV0IGl0Cj4gPiBsb29rcyBsaWtlIEltYWdlLmd6IGxvYWRpbmcgaXMgYnJva2VuIGF0IHRo
ZSBtb21lbnQuCj4gCj4gRG8geW91IG1lYW4gSW1hZ2UuZ3ogaXMgYnJva2VuIGZyb20gRG9tVT8g
QmVjYXVzZSBwZXIgdGhlIGxvZyBwcm92aWRlZCBieQo+IERlbmlzLCB0aGlzIGlzIHdvcmtpbmcg
cGVyZmVjdGx5IGZvciBEb20wIGFzIHdlIGRvbid0IGNyZWF0ZSBkb21haW4gaW4KPiBwYXJhbGxl
bC4KPiAKPiBCeSByZWFkaW5nIHRoZSBjb2RlIEkgY2FuIGFscmVhZHkgc3BvdCB0aGUgcmVhc29u
IG9mIHRoZSBmaXJzdCBpc3N1ZSByZXBvcnRlZAo+IGJ5IERlbmlzLiBGb3IgcmVtaW5kZXIsIHRo
aXMgaXMgd2hlbiBEb20wIGFuZCBEb21VIGFyZSB1c2luZyB0aGUgc2FtZSBtb2R1bGUKPiBhZGRy
ZXNzIGZvciB0aGUgZ3ppcCBJbWFnZS4KPiAKPiBUaGlzIGlzIGJlY2F1c2Ugd2hlbiBwcm9iaW5n
IHRoZSBrZXJuZWwgZm9yIERvbTAsIHRoZSBtb2R1bGUgd2lsbCBnZXQKPiB1bmNvbXByZXNzZWQg
YW5kIHRoZSBtb2R1bGUgc3RhcnQvZW5kIHdpbGwgYmUgdXBkYXRlZCB0byBwb2ludCB0byB0aGUK
PiB1bmNvbXByZXNzIHZlcnNpb24uIEJlY2F1c2Ugb2YgdGhhdCwgdGhlIHByb2JlIGZvciBEb21V
IGtlcm5lbCB3aWxsIG5vdCBiZQo+IGFibGUgdG8gZmluZCB0aGUgbW9kdWxlICh0aGUgc3RhcnQg
YWRkcmVzc2VkIGNoYW5nZWQpLgo+IAo+IEluIHRoaXMgY2FzZSwgSSB0aGluayB3ZSBvbmx5IHdh
bnQgdG8gdW5jb21wcmVzcyB0aGUgbW9kdWxlIG9uZSB0aW1lIHRvIGF2b2lkCj4gd2FzdGluZyBt
ZW1vcnkuIFRoZSBzb2x1dGlvbiBJIGhhdmUgaW4gbWluZCByZXF1aXJlcyBzb21lIHJld29yayBp
biBYZW4sIEkKPiB3b3VsZCBhY3R1YWxseSBzdGFydCBieSBwcm9iaW5nIHRoZSBpbmZvcm1hdGlv
biBmb3IgYWxsIHRoZSBkb21haW5zLCB0aGVuCj4gdW5jb21wcmVzcyB0aGUga2VybmVscyBtb2R1
bGVzLCBhbmQgdGhlbiBmaW5pc2ggdG8gYnVpbGQgdGhlIGRvbWFpbi4KPiAKPiBGb3IgdGhlIG91
dCBvZiBtZW1vcnkgcHJvYmxlbSBkaXNjdXNzZWQgaW4gdGhpcyBlLW1haWwsIEkgdGhpbmsgdGhl
IHByb2JsZW0gaXMKPiBub3QgYmVjYXVzZSBvZiBsYWNrIG9mIG1lbW9yeSBpbiBEb21VLiBUaGUg
cHJvYmxlbSBpcyByZWxhdGVkIHRvIHRoZQo+IGluZmxhdGUvZ3VuemlwIHRoZSBjb2RlLiBUaGUg
Y29kZSBpcyB1c2luZyBhbiBoZWFwIChzZWUgcGVyZm9ybV9ndW56aXApIHdoZXJlCj4gaXQgYWxs
b2NhdGVzIG1lbW9yeSBmcm9tLgo+IAo+IEkgYW0gYXNzdW1pbmcgdGhlIGtlcm5lbHMgZm9yIERv
bTAgYW5kIERvbVUgYXJlIGV4YWN0bHkgdGhlIHNhbWUgYnV0IHRoZXkgYXJlCj4gY29taW5nIGZy
b20gZGlmZmVyZW50IGFkZHJlc3MuIEFtIEkgY29ycmVjdD8gSWYgc28sIEkgYW0gYSBiaXQgdW5z
dXJlIHRoaXMKPiB3b3JrZWQgdGhlIGZpcnN0IHRpbWUgYW5kIG5vdCB0aGUgc2Vjb25kIHRpbWUu
IFRoaXMgcHJvYmFibHkgd2FudCBzb21lCj4gZGVidWdnaW5nIHRvIHVuZGVyc3RhbmQgdGhlIHBy
b2JsZW0uIERlbmlzLCBTdGVmYW5vLCBjYW4gb25lIG9mIHlvdSBsb29rIGF0Cj4gaXQ/CgpJIGNv
dWxkbid0IGZpbmQgZXhhY3RseSB0aGUgcm9vdCBjYXVzZSB5ZXQsIGJ1dCBJIGNhbiByZXByb2R1
Y2UgdGhlCmlzc3VlIGV2ZW4gd2l0aCBEb20wIG9ubHkgKG5vIGRvbVVzLCBubyBkb20wbGVzcyk6
CgooWEVOKSAqKiogTE9BRElORyBET01BSU4gMCAqKioKKFhFTikgREVCVUcga2VybmVsX3Byb2Jl
IDQ0NQooWEVOKSBMb2FkaW5nIGQwIGtlcm5lbCBmcm9tIGJvb3QgbW9kdWxlIEAgMDAwMDAwMDA0
NzAwMDAwMAooWEVOKSBMb2FkaW5nIHJhbWRpc2sgZnJvbSBib290IG1vZHVsZSBAIDAwMDAwMDAw
NDIwMDAwMDAKKFhFTikgREVCVUcga2VybmVsX2RlY29tcHJlc3MgMjY4CihYRU4pIERFQlVHIGtl
cm5lbF9kZWNvbXByZXNzIDI3MgooWEVOKSBERUJVRyBrZXJuZWxfZGVjb21wcmVzcyAyNzkKKFhF
TikgREVCVUcga2VybmVsX2RlY29tcHJlc3MgMjg0CihYRU4pIERFQlVHIGtlcm5lbF9kZWNvbXBy
ZXNzIDI5MSBrZXJuZWxfb3JkZXJfb3V0PTUyIG91dHB1dF9zaXplPTAKKFhFTikgCihYRU4pICoq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKKFhFTikgUGFuaWMgb24gQ1BV
IDA6CihYRU4pIENvdWxkIG5vdCBzZXQgdXAgRE9NMCBndWVzdCBPUwooWEVOKSAqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCihYRU4pIAooWEVOKSBSZWJvb3QgaW4gZml2
ZSBzZWNvbmRzLi4uCgoKVGhlIGlzc3VlIHNlZW1zIHRvIGJlIHRoYXQgb3V0cHV0X3NpemUsIHJl
dHVybmVkIGJ5IG91dHB1dF9sZW5ndGgoaW5wdXQsCnNpemUpIGlzIDAuIFRoZW4sIGtlcm5lbF9v
cmRlcl9vdXQgaXMgc2V0IHRvIDUyIHdoaWNoIGlzIHRvbyBsYXJnZS4gQXMgYQpjb25zZXF1ZW5j
ZSBrZXJuZWxfZGVjb21wcmVzcyByZXR1cm5zIHdpdGggLUVOT01FTS4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
