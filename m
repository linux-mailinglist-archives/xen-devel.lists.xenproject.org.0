Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3195CB7AA
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 11:52:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGKDO-0004tk-JM; Fri, 04 Oct 2019 09:49:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IEoo=X5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iGKDN-0004tf-GW
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 09:49:33 +0000
X-Inumbo-ID: 42db3c6a-e68c-11e9-9747-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 42db3c6a-e68c-11e9-9747-12813bfff9fa;
 Fri, 04 Oct 2019 09:49:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8AD715A1;
 Fri,  4 Oct 2019 02:49:29 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FDB93F706;
 Fri,  4 Oct 2019 02:49:29 -0700 (PDT)
To: Brian Woods <brian.woods@xilinx.com>
References: <b02aeec5-b90f-d330-a504-0ab0e6ff86c9@arm.com>
 <20191002185617.GA2644@xilinx.com>
 <75d64b52-7bea-3349-e45f-44c8bce86d6e@arm.com>
 <20191002212249.GB2644@xilinx.com> <20191002232017.GC2644@xilinx.com>
 <ade177bc-003f-edcc-47fe-d1014d638990@arm.com>
 <20191003181547.GA13953@xilinx.com>
 <c2ea24d9-6bd0-a5b2-9ea1-b3bfe5e30a02@arm.com>
 <20191003202457.GA4040@xilinx.com>
 <3764ed03-e2a8-31e4-0e73-0bd3d88434ca@arm.com>
 <20191004002502.GA9033@xilinx.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <edb70263-f98c-da0b-0e6a-859d6808b438@arm.com>
Date: Fri, 4 Oct 2019 10:49:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191004002502.GA9033@xilinx.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Errors with Loading Xen at a Certain Address
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQnJpYW4sCgpPbiAwNC8xMC8yMDE5IDAxOjI1LCBCcmlhbiBXb29kcyB3cm90ZToKPiBPbiBU
aHUsIE9jdCAwMywgMjAxOSBhdCAxMDoyMDozNlBNICswMTAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6
Cj4+IEhpIEJyaWFuLAo+Pgo+PiBPbiAxMC8zLzE5IDk6MjQgUE0sIEJyaWFuIFdvb2RzIHdyb3Rl
Ogo+Pj4gT24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMDc6MjM6MjNQTSArMDAwMCwgSnVsaWVuIEdy
YWxsIHdyb3RlOgo+Pj4gVGhlcmUncyBhIFdBUk5fT04oKSBiZXR3ZWVuIHRoZSB0d28gZGVidWcg
cHJpbnRrcyBjYWxscyBJIHNoYXJlZCBhYm92ZS4KPj4KPj4gTG9va2luZyBhdCB0aGUgbG9nLCB0
aGUgTUZOIHNlZW1zIHRvIGNvcnJlc3BvbmQgdG8gdGhlIG9uZSByaWdodCBhZnRlciBYZW4KPj4g
KDAwMDAwMDAwMDE0MDAwMDAgLSAwMDAwMDAwMDAxNTMyOGYxKSBpbiBtZW1vcnkuCj4+Cj4+IFNv
IGl0IGlzIG5vcm1hbCB0byBoYXZlIHRoZSBwYWdlIGdpdmVuIHRvIHRoZSBib290IGFsbG9jYXRv
ci4gSG93ZXZlciwgSSBhbQo+PiBub3QgZW50aXJlbHkgc3VyZSB3aGljaCBiaXQgb2YgaW5pdF9k
b25lKCkgaXMgZ2l2aW5nIHRoZSBwYWdlIGFnYWluIHRvCj4+IHhlbmhlYXAuCj4+Cj4+IEl0IGlz
IHVubGlrZWx5IHRvIGJlIGZyZWVfaW5pdF9tZW1vcnkoKSBiZWNhdXNlIGl0IGRlYWwgd2l0aCB0
aGUgaW5pdAo+PiBzZWN0aW9uIHRoYXQgaXMgbm90IGF0IHRoZSBlbmQgb2YgdGhlIGJpbmFyeS4K
Pj4KPj4gVGhpcyB3b3VsZCBsZWF2ZSBkaXNjYXJkX2luaXRpYWxfbW9kdWxlcygpIGJ1dCB0aGVy
ZSBhcmUgYSBjaGVjayB0byBza2lwIFhlbgo+PiBtb2R1bGUuCj4+Cj4+IFRoZSBjYWxsIHN0YWNr
IG9ubHkgcHJpbnQgdGhlIGFkZHJlc3MgYW5kIG5vdCB0aGUgc3ltYm9sIGJlY2F1c2UgaXQKPj4g
dW5yZWdpc3RlcmVkIHRoZSBzeW1ib2xzIGZvciBpbml0LiBTZWUgdW5yZWdpc3Rlcl9pbml0X3Zp
cnR1YWxfbWVtb3J5KCkuCj4+Cj4+IChYRU4pIFhlbiBjYWxsIHRyYWNlOgo+PiAoWEVOKSAgICBb
PDAwMDAwMDAwMDAyMWMxYTg+XSBwYWdlX2FsbG9jLmMjZnJlZV9oZWFwX3BhZ2VzKzB4MWE4LzB4
NjE0IChQQykKPj4gKFhFTikgICAgWzwwMDAwMDAwMDAwMjFjMWE4Pl0gcGFnZV9hbGxvYy5jI2Zy
ZWVfaGVhcF9wYWdlcysweDFhOC8weDYxNCAoTFIpCj4+IChYRU4pICAgIFs8MDAwMDAwMDAwMDIx
ZTkwMD5dIHBhZ2VfYWxsb2MuYyNpbml0X2hlYXBfcGFnZXMrMHgzZDQvMHg1NjQKPj4gKFhFTikg
ICAgWzwwMDAwMDAwMDAwMjFlYjI0Pl0gaW5pdF9kb21oZWFwX3BhZ2VzKzB4OTQvMHg5Ywo+PiAo
WEVOKSAgICBbPDAwMDAwMDAwMDAyYjgzZWM+XSAwMDAwMDAwMDAwMmI4M2VjCj4+IChYRU4pICAg
IFs8MDAwMDAwMDAwMDJiODkwND5dIDAwMDAwMDAwMDAyYjg5MDQKPj4gKFhFTikgICAgWzwwMDAw
MDAwMDAwMjYwYTNjPl0gc2V0dXAuYyNpbml0X2RvbmUrMHgxMC8weDIwCj4+IChYRU4pICAgIFs8
MDAwMDAwMDAwMDJiOTlhYz5dIDAwMDAwMDAwMDAyYjk5YWMKPj4KPj4gWW91IHNob3VsZCBiZSBh
YmxlIHRvIHVzZSBhZGRyMmxpbmUgb24gdGhlIGFkZHJlc3Mgd2l0aCBYZW4gYmluYXJ5Lgo+PiBJ
IGhhdmUgdGhlIGZlZWxpbmcgdGhpcyB3aWxsIHBvaW50IHRvIGRpc2NhcmRfaW5pdGlhbF9tb2R1
bGVzKCkgYXMgdGhpcyBpcwo+PiBhbiBpbml0IGZ1bmN0aW9uIGFuZCB0aGUgc3ltYm9sIHNob3Vs
ZCBub3QgYmUgcHJpbnRlZC4KPj4KPj4gQnV0LCBJIGNhbid0IHNlZSBhbnl0aGluZyBvYnZpb3Vz
bHkgd3JvbmcgaW4gdGhlIGZ1bmN0aW9uLi4uIFNvIEkgYW0gbm90Cj4+IGVudGlyZWx5IHN1cmUg
d2hhdCBjb3VsZCBiZSB0aGUgbmV4dCBzdGVwcy4KPj4KPj4gQ2hlZXJzLAo+Pgo+PiAtLSAKPj4g
SnVsaWVuIEdyYWxsCj4gCj4gSW4gdGhlIGxvZywgdGhlcmUnczoKPiAoWEVOKSBNT0RVTEVbMF06
IDAwMDAwMDAwMDE0MDAwMDAgLSAwMDAwMDAwMDAxNTMyOGYxIFhlbgo+IChYRU4pIE1PRFVMRVsx
XTogMDAwMDAwMDAwNzZkMjAwMCAtIDAwMDAwMDAwMDc2ZGMwODAgRGV2aWNlIFRyZWUKPiAoWEVO
KSBNT0RVTEVbMl06IDAwMDAwMDAwMDc2ZGYwMDAgLSAwMDAwMDAwMDA3ZmZmMzY0IFJhbWRpc2sK
PiAoWEVOKSBNT0RVTEVbM106IDAwMDAwMDAwMDAwODAwMDAgLSAwMDAwMDAwMDAzMTgwMDAwIEtl
cm5lbAo+IChYRU4pICBSRVNWRFswXTogMDAwMDAwMDAwNzZkMjAwMCAtIDAwMDAwMDAwMDc2ZGMw
MDAKPiAoWEVOKSAgUkVTVkRbMV06IDAwMDAwMDAwMDc2ZGYwMDAgLSAwMDAwMDAwMDA3ZmZmMzY0
Cj4gCj4gTGludXgga2VybmVsCS0+ICAgOF8wMDAwIC0gMzE4XzAwMDAKPiBYZW4JCS0+IDE0MF8w
MDAwIC0gMTUzXzI4ZjEKPiAKPiBUaGVyZSdzIHNvbWV0aGluZyBub3QgcXVpdGUgcmlnaHQgaGVy
ZS4uLiBJJ20gZ3Vlc3NpbmcgWGVuIHdhcyB3b3JraW5nCj4gYXQgdGhlIGFkZHJlc3MgYmVmb3Jl
IGJlY2F1c2UgaXQgd2FzIG91dCBvZiB0aGUgInJhbmdlIiBvZiB0aGUgTGludXgKPiBrZXJuZWwu
ICBOb3cgSSBndWVzcyBJIG5lZWQgdG8gbG9vayBpbnRvIGlmIGl0J3MgYSBYZW4gb3IgdS1ib290
IGlzc3VlLgoKVGhlIGxvYWRpbmcgYWRkcmVzcyB5b3Ugd3JvdGUgbWF0Y2ggdGhlIG9uZXMgeW91
IHNlZW0gdG8gaGF2ZSByZXF1ZXN0ZWQgaW4gVS1ib290OgoKRmlsZW5hbWUgJ3lvY3RvLUltYWdl
Jy4KTG9hZCBhZGRyZXNzOiAweDgwMDAwCgpGaWxlbmFtZSAneGVuLWN1c3RvbS51YicuCkxvYWQg
YWRkcmVzczogMHgxNDAwMDAwCgpCdXQgdGhlIHNpemUgZG9lcyBub3QgbWF0Y2ggdGhlIG9uZSB5
b3UgcHJvdmlkZWQgaW4gdGhlIERldmljZS1UcmVlOgoKQnl0ZXMgdHJhbnNmZXJyZWQgPSAxODIx
NTQyNCAoMTE1ZjIwMCBoZXgpCgp2cwoKMHgwMDAwMDAwMDAzMTgwMDAwIC0gMHgwMDAwMDAwMDAw
MDgwMDAwID0gMHgzMTAwMDAwCgpUaGlzIGlzIGFsd2F5cyBhIHJpc2sgd2hlbiB5b3Ugd3JpdGUg
aW4gYWR2YW5jZSB0aGUgc2l6ZSBvZiB0aGUgYmluYXJpZXMgYW5kIApsb2NhdGlvbiBpbiB0aGUg
RGV2aWNlLVRyZWUuIElmIHlvdSBhcmUgdXNpbmcgdGZ0cC9sb2FkIGZyb20gRlMsIGl0IGlzIG11
Y2ggbGVzcyAKcmlza3kgdG8gcHJvdmlkZSBhIFUtYm9vdCBzY3JpcHQgdGhhdCB3aWxsIGdlbmVy
YXRlIHRoZSBYZW4gRFQgbm9kZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
