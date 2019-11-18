Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AC110018A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 10:41:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWdUX-00036R-KR; Mon, 18 Nov 2019 09:38:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2ywg=ZK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iWdUW-00036M-HN
 for xen-devel@lists.xen.org; Mon, 18 Nov 2019 09:38:40 +0000
X-Inumbo-ID: 32a3cd16-09e7-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32a3cd16-09e7-11ea-9631-bc764e2007e4;
 Mon, 18 Nov 2019 09:38:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 64FE1AFE8;
 Mon, 18 Nov 2019 09:38:37 +0000 (UTC)
To: Rishi <2rushikeshj@gmail.com>
References: <CAO9XypWibNu0iDnJsZXkQ+=Ecd6eThnu+td4O3VVLMe+qJ80eQ@mail.gmail.com>
 <76a91fb3-d2b0-dd23-7e99-0015fbee5990@suse.com>
 <CAO9XypVpBAPk8Hakqt7jJ08pCUhR_GzNxDWh2D-CGfp0+tfaAA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3b8d187e-c4d5-a7a5-76c2-874db47440ee@suse.com>
Date: Mon, 18 Nov 2019 10:38:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAO9XypVpBAPk8Hakqt7jJ08pCUhR_GzNxDWh2D-CGfp0+tfaAA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen hiding thermal capabilities from Dom0
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
Cc: xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTEuMjAxOSAyMDoxOSwgUmlzaGkgd3JvdGU6Cj4gT24gVGh1LCBOb3YgMTQsIDIwMTkg
YXQgMTA6MDUgUE0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPj4KPj4g
T24gMTQuMTEuMjAxOSAxNzowNywgUmlzaGkgd3JvdGU6Cj4+PiBJbiBzb21lIG9mIG91ciBob3N0
cywgWGVuIGlzIG5vdCBjb3JyZWN0bHkgZXhwb3NpbmcgcHJvY2Vzc29yIHRoZXJtYWwKPj4+IGNh
cGFiaWxpdGllcyB0byBEb20wLgo+Pj4gUGxlYXNlIHJlZmVyOiBodHRwczovL2J1Z3ppbGxhLmtl
cm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIwNTM0Nwo+Pj4KPj4+IFRoZSBmbGFnCj4+PiAvKiBU
aGVybWFsIGFuZCBQb3dlciBNYW5hZ2VtZW50IExlYWYsIENQVUlEIGxldmVsIDB4MDAwMDAwMDYg
KEVBWCksIHdvcmQgMTQgKi8KPj4+IFg4Nl9GRUFUVVJFX0RUSEVSTSAoMTQqMzIrIDApCj4+Pgo+
Pj4gaXMgcmV0dXJuZWQgMCB2aWEgUFZPUF9WQ0FMTDQgdnMgcmV0dXJucyAxIHZpYSBuYXRpdmVf
Y3B1aWQoKSBjYWxsIGZyb20gRG9tMC4KPj4+Cj4+PiBTYW1wbGUgb3V0cHV0IHZpYSBQVkNBTEwg
dnMgTmF0aXZlIGNhbGwuCj4+PiBbNjMyOTEuNjg4NzU1XSBjcHVpZF9lYXggNiA6ICBhIDAKPj4+
IFs2MzI5MS42ODg3NTldIG5hdGl2ZV9jcHVpZCA6IGEgNzcKPj4+Cj4+PiBJcyB0aGlzIGEgYnVn
IG9yIG5lZWRzIHNvbWUgc3BlY2lhbCBmZWF0dXJlIHRvIGJlIGVuYWJsZWQgZnJvbSBYZW4gY29t
bWFuZCBsaW5lPwo+Pgo+PiBFeHBvc2luZyB0aGlzIHRvIGd1ZXN0cyAoaW5jbHVkaW5nIERvbTAp
IHdvdWxkIGltcGx5IHByb3Blcmx5Cj4+IHZpcnR1YWxpemluZyB0aGUgcmVzcGVjdGl2ZSBiZWhh
dmlvci4gSW4KPj4geGVuL2FyY2gveDg2L2NwdWlkLmM6cmVjYWxjdWxhdGVfbWlzYygpIHdlIHNw
ZWNpZmljYWxseSBoYXZlCj4+Cj4+ICAgICBwLT5iYXNpYy5yYXdbMHg2XSA9IEVNUFRZX0xFQUY7
IC8qIFRoZXJtL1Bvd2VyIG5vdCBleHBvc2VkIHRvIGd1ZXN0cy4gKi8KPj4KPj4gSWYgeW91IHdh
bnRlZCB0aGlzIGV4cG9zZWQsIHlvdSdkIGZpcnN0IG9mIGFsbCBuZWVkIHRvIGNvbWUgdXAKPj4g
d2l0aCBhIHNhbmUgdmlydHVhbGl6YXRpb24gbW9kZWwgb2YgdGhpcyBmdW5jdGlvbmFsaXR5LiBT
aW1wbHkKPj4gZXhwb3NpbmcgdGhlIENQVUlEIGJpdHMgaXMgbm90IGdvaW5nIHRvIGJlIGFuIG9w
dGlvbi4KPiAKPiBJcyBpdCBkdWUgdG8gYW55IHNlY3VyaXR5IHJpc2tzPyBJZiBzbywgYXJlIHRo
ZXJlIGFueSBhZHZpc29yaWVzIGFyb3VuZCBpdD8KCk5vLCBpdCdzIGJlY2F1c2Ugb2YgdGhlIHNw
bGl0IG9mIHJlc3BvbnNpYmlsaXRpZXM6IEl0J3MgWGVuIHRvIG1hbmFnZQp0aGUgQ1BVcy4KCj4g
U2hvdWxkIGl0IGJlIGFsbG93ZWQgdGhhdCBYZW4gaXMgaGlkaW5nIENQVSBmbGFncyAoaW4gdGhp
cyBjYXNlCj4gVGhlcm0pLCB5ZXQgYSBtb2RpZmljYXRpb24gdG8gRG9tMCBrZXJuZWwgYWxsb3dz
IHRoZW0gdG8gYmUgYnJvdWdodAo+IGJhY2s/CgpZZXMsIGEgUFYga2VybmVsIGlzIHN1cHBvc2Vk
IHRvIGRvIHRoaW5ncyB0aGUgUFYgd2F5LCBpLmUuIGluCnBhcnRpY3VsYXIgdXNlIHRoZSBQViBm
b3JtIG9mIENQVUlELiAoTm90ZSB0aGF0IG9uIGhhcmR3YXJlIHN1cHBvcnRpbmcKQ1BVSUQgZmF1
bHRpbmcgeW91IGNhbid0ICJicmluZyBiYWNrIiB0aGUgZmxhZ3MgdmlhIGEga2VybmVsIGNoYW5n
ZSwKc2luY2UgdGhlbiBfYWxsXyBDUFVJRCBpbnZvY2F0aW9ucyB3aWxsIGJlIGhhbmRsZWQgYnkg
WGVuIGluc3RlYWQgb2YKYnkgYmFyZSBoYXJkd2FyZS4gU28gX25vdF8gZG9pbmcgdGhpbmdzIHRo
ZSBQViB3YXkgaW4gdGhlIGtlcm5lbCBzZXRzCnlvdSB1cCBmb3Igc3VycHJpc2VzLikKCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
