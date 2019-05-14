Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D94961C7BE
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 13:22:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQVTQ-0000Mv-Uj; Tue, 14 May 2019 11:19:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O8Y9=TO=citrix.com=prvs=0309661e3=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hQVTP-0000Mm-8d
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 11:19:55 +0000
X-Inumbo-ID: 30b4fb88-763a-11e9-9579-db28bea31db1
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 30b4fb88-763a-11e9-9579-db28bea31db1;
 Tue, 14 May 2019 11:19:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,468,1549929600"; d="scan'208";a="89715295"
Date: Tue, 14 May 2019 13:19:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190514111942.6h3rrvxkpz7nlqet@Air-de-Roger>
References: <20190514080558.14540-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514080558.14540-1-olaf@aepfle.de>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v5] libxl: fix migration of PV and PVH domUs
 with and without qemu
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMTA6MDU6NThBTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gSWYgYSBkb21VIGhhcyBhIHFlbXUteGVuIGluc3RhbmNlIGF0dGFjaGVkLCBpdCBpcyBy
ZXF1aXJlZCB0byBjYWxsIHFlbXVzCj4gInhlbi1zYXZlLWRldmljZXMtc3RhdGUiIG1ldGhvZC4g
V2l0aG91dCBpdCwgdGhlIHJlY2VpdmluZyBzaWRlIG9mIGEgUFYgb3IKPiBQVkggbWlncmF0aW9u
IG1heSBiZSB1bmFibGUgdG8gbG9jayB0aGUgaW1hZ2U6Cj4gCj4geGVuIGJlOiBxZGlzay01MTcx
MjogeGVuIGJlOiBxZGlzay01MTcxMjogZXJyb3I6IEZhaWxlZCB0byBnZXQgIndyaXRlIiBsb2Nr
Cj4gZXJyb3I6IEZhaWxlZCB0byBnZXQgIndyaXRlIiBsb2NrCj4geGVuIGJlOiBxZGlzay01MTcx
MjogeGVuIGJlOiBxZGlzay01MTcxMjogaW5pdGlhbGlzZSgpIGZhaWxlZAo+IGluaXRpYWxpc2Uo
KSBmYWlsZWQKPiAKPiBUbyBmaXggdGhpcyBidWcsIGxpYnhsX19kb21haW5fc3VzcGVuZF9kZXZp
Y2VfbW9kZWwoKSBhbmQKPiBsaWJ4bF9fZG9tYWluX3Jlc3VtZV9kZXZpY2VfbW9kZWwoKSBoYXZl
IHRvIGJlIGNhbGxlZCBub3Qgb25seSBmb3IgSFZNLAo+IGJ1dCBhbHNvIGlmIHRoZSBhY3RpdmUg
ZGV2aWNlX21vZGVsIGlzIFFFTVVfWEVOLgo+IAo+IFVuZm9ydHVuYXRlbHksIGxpYnhsX19kb21h
aW5fYnVpbGRfaW5mb19zZXRkZWZhdWx0KCkgdXNlZCB0byBoYXJkY29kZQo+IGJfaW5mby0+ZGV2
aWNlX21vZGVsX3ZlcnNpb24gdG8gUUVNVV9YRU4gaWYgaXQgZG9lcyBub3Qga25vdyBpdCBhbnkK
PiBiZXR0ZXIuIEFzIGEgcmVzdWx0IGxpYnhsX19kZXZpY2VfbW9kZWxfdmVyc2lvbl9ydW5uaW5n
KCkgd2lsbCByZXR1cm4KPiBpbmNvcnJlY3QgdmFsdWVzLiBUaGlzIGJyZWFrcyBkb21VcyB3aXRo
b3V0IGEgZGV2aWNlX21vZGVsLgo+IGxpYnhsX19xbXBfc3RvcCgpIHdvdWxkIHdhaXQgMTAgc2Vj
b25kcyBpbiBxbXBfb3BlbigpIGZvciBhIHFlbXUgdGhhdAo+IHdpbGwgbmV2ZXIgYXBwZWFyLiBE
dXJpbmcgdGhpcyBsb25nIHRpbWVmcmFtZSB0aGUgZG9tVSByZW1haW5zIGluIHN0YXRlCj4gcGF1
c2VkIG9uIHRoZSBzZW5kaW5nIHNpZGUuIEFzIGEgcmVzdWx0IG5ldHdvcmsgY29ubmVjdGlvbnMg
bWF5IGJlCj4gZHJvcHBlZC4gT25jZSB0aGlzIGJ1ZyBpcyBmaXhlZCBhcyB3ZWxsLCBieSBqdXN0
IHJlbW92aW5nIHRoZSBhc3N1bXB0aW9uCj4gdGhhdCBldmVyeSBkb21VIGhhcyBhIFFFTVVfWEVO
LCB0aGVyZSBpcyBubyBjb2RlIHRvIGFjdHVhbGx5IGluaXRpYWxpc2UKPiBiX2luZm8tPmRldmlj
ZV9tb2RlbF92ZXJzaW9uLgo+IAo+IFRoZXJlIGlzIGEgaGVscGVyIGZ1bmN0aW9uIGxpYnhsX19u
ZWVkX3hlbnB2X3FlbXUoKSwgd2hpY2ggaXMgdXNlZCBpbgo+IHZhcmlvdXMgcGxhY2VzIHRvIGRl
Y2lkZSBpZiBhIGRldmljZV9tb2RlbCBoYXMgdG8gYmUgc3Bhd25lZC4gVGhpcwo+IGZ1bmN0aW9u
IGNhbiBub3QgYmUgdXNlZCBhcyBpcywganVzdCB0byBmaWxsIGRldmljZV9tb2RlbF92ZXJzaW9u
LAo+IGJlY2F1c2Ugc3RvcmVfbGlieGxfZW50cnkoKSB3YXMgYWxyZWFkeSBjYWxsZWQgZWFybGll
ci4KPiAKPiBJbnRyb2R1Y2UgTElCWExfREVWSUNFX01PREVMX1ZFUlNJT05fTk9ORSBmb3IgUFYg
YW5kIFBWSCB0aGF0IGhhdmUgbm8KPiBuZWVkIGZvciBhIGRldmljZV9tb2RlbCB0byBtYWtlIHRo
ZSBzdGF0ZSBleHBsaWNpdC4gSW5kaWNhdGUgdGhpcyBuZXcKPiBzdGF0ZSB2aWEgTElCWExfSEFW
RSBtYWNybyBpbiBsaWJ4bC5oLgo+IAo+IHYwNToKPiAtIG1vdmUgaW5pdGlhbGl6YXRpb24gb2Yg
ZGV2aWNlX21vZGVsX3ZlcnNpb24gdG8gZXh0cmEgY29tbWl0Cj4gLSByZXR1cm4gZXJyb3IgZnJv
bSBsaWJ4bF9fbmVlZF94ZW5wdl9xZW11Cj4gLSBhZGQgTElCWExfSEFWRV9ERVZJQ0VfTU9ERUxf
VkVSU0lPTl9OT05FCj4gdjA0Ogo+IC0gbWFrZSBzdXJlIGRldmljZV9tb2RlbF9zdHViZG9tYWlu
IGlzIGluaXRpYWxpemVkCj4gdjAzOgo+IC0gcmVhcnJhbmdlIGNvZGUgdG8gbWFrZSBzdXJlIGRl
dmljZV9tb2RlbF92ZXJzaW9uIGlzIGluaXRpYWxpemVkIGJlZm9yZQo+ICAgc3RvcmVfbGlieGxf
ZW50cnkoKSBpcyBjYWxsZWQKPiB2MDI6Cj4gLSB1cGRhdGUgd29yZGluZyBpbiBhIGNvbW1lbnQK
PiAtIHJlbW92ZSBzdGFsZSBnb3RvIGluIGRvbWNyZWF0ZV9sYXVuY2hfZG0KPiAtIGluaXRpYWxp
emUgcmV0IGluIGxpYnhsX19uZWVkX3hlbnB2X3FlbXUKPiAKPiBTaWduZWQtb2ZmLWJ5OiBPbGFm
IEhlcmluZyA8b2xhZkBhZXBmbGUuZGU+CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
