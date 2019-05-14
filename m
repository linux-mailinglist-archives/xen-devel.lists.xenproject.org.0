Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCA91C6EB
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 12:21:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQUWc-0002wt-3x; Tue, 14 May 2019 10:19:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O8Y9=TO=citrix.com=prvs=0309661e3=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hQUWa-0002wo-9w
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 10:19:08 +0000
X-Inumbo-ID: b3c02450-7631-11e9-8980-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b3c02450-7631-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 10:19:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,468,1549929600"; d="scan'208";a="89714596"
Date: Tue, 14 May 2019 12:18:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190514101856.6otetd56n72t42bm@Air-de-Roger>
References: <20190514072741.11760-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514072741.11760-1-olaf@aepfle.de>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v1] libxl: add helper function to set
 device_model_version
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDk6Mjc6NDFBTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW4gdXBjb21pbmcgY2hhbmdlIHdpbGwgc2V0IHRoZSB2YWx1ZSBvZiBkZXZpY2VfbW9k
ZWxfdmVyc2lvbiBwcm9wZXJseQo+IGFsc28gZm9yIHRoZSBub24tSFZNIGNhc2UuCj4gCj4gTW92
ZSBleGlzdGluZyBjb2RlIHRvIG5ldyBmdW5jdGlvbiBsaWJ4bF9fZG9tYWluX3NldF9kZXZpY2Vf
bW9kZWwuCj4gTW92ZSBhbHNvIGluaXRpYWxpemF0aW9uIGZvciBkZXZpY2VfbW9kZWxfc3R1YmRv
bWFpbiB0byB0aGF0IGZ1bmN0aW9uLgo+IE1ha2Ugc3VyZSBsaWJ4bF9fZG9tYWluX2J1aWxkX2lu
Zm9fc2V0ZGVmYXVsdCBpcyBjYWxsZWQgd2l0aAo+IGRldmljZV9tb2RlbF92ZXJzaW9uIHNldC4K
PiAKPiBVcGRhdGUgbGlieGxfX3NwYXduX3N0dWJfZG0oKSBhbmQgaW5pdGlhdGVfZG9tYWluX2Ny
ZWF0ZSgpIHRvIGNhbGwgdGhlCj4gbmV3IGZ1bmN0aW9uIHByaW9yIGxpYnhsX19kb21haW5fYnVp
bGRfaW5mb19zZXRkZWZhdWx0KCkgYmVjYXVzZQo+IGRldmljZV9tb2RlX3ZlcnNpb24gaXMgZXhw
ZWN0ZWQgdG8gYmUgaW5pdGlhbHplZC4KClRoYXQncyBhbGwgZmluZSwgYnV0IHRoaXMganVzdCBk
ZXNjcmliZXMgdGhlIGNoYW5nZXMgcGVyZm9ybWVkIGJlbG93CndpdGhvdXQgcHJvdmlkaW5nIGEg
cmVhc29uaW5nIG9uIHdoeSB0aG9zZSBjaGFuZ2VzIGFyZSBuZWVkZWQuIFdoeSBpcwppdCBub3Qg
ZmluZSB0byBzZXQgdGhlIGRldmljZSBtb2RlbCB2ZXJzaW9uIGluCmxpYnhsX19kb21haW5fYnVp
bGRfaW5mb19zZXRkZWZhdWx0PwoKPiBAQCAtOTM4LDYgKzk1MiwxMiBAQCBzdGF0aWMgdm9pZCBp
bml0aWF0ZV9kb21haW5fY3JlYXRlKGxpYnhsX19lZ2MgKmVnYywKPiAgICAgICAgICBnb3RvIGVy
cm9yX291dDsKPiAgICAgIH0KPiAgCj4gKyAgICByZXQgPSBsaWJ4bF9fZG9tYWluX3NldF9kZXZp
Y2VfbW9kZWwoZ2MsIGRfY29uZmlnKTsKPiArICAgIGlmIChyZXQpIHsKPiArICAgICAgICBMT0dE
KEVSUk9SLCBkb21pZCwgIlVuYWJsZSB0byBzZXQgZG9tYWluIGRldmljZSBtb2RlbCIpOwo+ICsg
ICAgICAgIGdvdG8gZXJyb3Jfb3V0Owo+ICsgICAgfQoKQ2FuIHlvdSBwbGFjZSB0aGUgY2FsbCB0
byBsaWJ4bF9fZG9tYWluX3NldF9kZXZpY2VfbW9kZWwgYXQgdGhlIHRvcAoob3IgYSBzdWl0YWJs
ZSBwbGFjZSkgb2YgbGlieGxfX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1bHQgaW5zdGVhZApv
ZiBhZGRpbmcgYSBjYWxsIGluIGluaXRpYXRlX2RvbWFpbl9jcmVhdGU/Cgo+ICsKPiAgICAgIHJl
dCA9IGxpYnhsX19kb21haW5fY3JlYXRlX2luZm9fc2V0ZGVmYXVsdChnYywgJmRfY29uZmlnLT5j
X2luZm8pOwo+ICAgICAgaWYgKHJldCkgewo+ICAgICAgICAgIExPR0QoRVJST1IsIGRvbWlkLCAi
VW5hYmxlIHRvIHNldCBkb21haW4gY3JlYXRlIGluZm8gZGVmYXVsdHMiKTsKPiBkaWZmIC0tZ2l0
IGEvdG9vbHMvbGlieGwvbGlieGxfZG0uYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKPiBpbmRl
eCAyZjE5Nzg2YmRkLi4wODZlNTY2MzExIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhs
X2RtLmMKPiArKysgYi90b29scy9saWJ4bC9saWJ4bF9kbS5jCj4gQEAgLTIxNjgsNiArMjE2OCw4
IEBAIHZvaWQgbGlieGxfX3NwYXduX3N0dWJfZG0obGlieGxfX2VnYyAqZWdjLCBsaWJ4bF9fc3R1
Yl9kbV9zcGF3bl9zdGF0ZSAqc2RzcykKPiAgICAgIGRtX2NvbmZpZy0+Y19pbmZvLnJ1bl9ob3Rw
bHVnX3NjcmlwdHMgPQo+ICAgICAgICAgIGd1ZXN0X2NvbmZpZy0+Y19pbmZvLnJ1bl9ob3RwbHVn
X3NjcmlwdHM7Cj4gIAo+ICsgICAgcmV0ID0gbGlieGxfX2RvbWFpbl9zZXRfZGV2aWNlX21vZGVs
KGdjLCBkbV9jb25maWcpOwo+ICsgICAgaWYgKHJldCkgZ290byBvdXQ7Cj4gICAgICByZXQgPSBs
aWJ4bF9fZG9tYWluX2NyZWF0ZV9pbmZvX3NldGRlZmF1bHQoZ2MsICZkbV9jb25maWctPmNfaW5m
byk7Cj4gICAgICBpZiAocmV0KSBnb3RvIG91dDsKPiAgICAgIHJldCA9IGxpYnhsX19kb21haW5f
YnVpbGRfaW5mb19zZXRkZWZhdWx0KGdjLCAmZG1fY29uZmlnLT5iX2luZm8pOwoKU2FtZSBoZXJl
LCBBRkFJQ1QgdGhlIGNhbGwgdG8gbGlieGxfX2RvbWFpbl9zZXRfZGV2aWNlX21vZGVsIGNvdWxk
IGJlCnBsYWNlZCBpbnNpZGUgb2YgbGlieGxfX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1bHQ/
CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
