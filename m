Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1B2732F7
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 17:44:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqJOV-0006Od-Ki; Wed, 24 Jul 2019 15:41:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UCFt=VV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hqJOU-0006OY-Cg
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 15:41:30 +0000
X-Inumbo-ID: 7fdf2d74-ae29-11e9-8710-5b63c086a8ee
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7fdf2d74-ae29-11e9-8710-5b63c086a8ee;
 Wed, 24 Jul 2019 15:41:27 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jNK2nIXvwZ74PzLSIro7WF/w8KOCWLxzV6h5pH8Y4Y6lRZKa+06Q2QpN7+QBJR2u7n+ojca8IN
 Ig16kBOA3VEHJkJgpS5au48K/aGnoWh7C43uG8Ys1qb09DB5wAvtUclGSvLk6Dl6kS/dK9M7D9
 7hp8UK9uadWPv0SuM6nC0Y/oIuUr8YOYX+vTd8dAzWtfmaffdhufs9TQaANkt2XNvPwgXEE1e9
 t691odgNgGnh4PJ9qB953J+bDzScnY6viPhxWL8HFT68vzorlmO0jwaQnDgTzrqMygA8j2KyfB
 YR4=
X-SBRS: 2.7
X-MesageID: 3375483
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,303,1559534400"; 
   d="scan'208";a="3375483"
Date: Wed, 24 Jul 2019 17:41:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Fredy P. <fredy.pulido@savoirfairelinux.com>
Message-ID: <20190724154118.ourqzsecc6cylypd@Air-de-Roger>
References: <e23a10a75ea7a1bee33a8721d9bee209b736dee8.camel@savoirfairelinux.com>
 <20190724143643.lpg576p6psxqelrg@Air-de-Roger>
 <cc9a1959af91dc812553b700fee308573c5dea5d.camel@savoirfairelinux.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cc9a1959af91dc812553b700fee308573c5dea5d.camel@savoirfairelinux.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] CPU frequency throttling based on the temperature
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMTE6MjU6NTVBTSAtMDQwMCwgRnJlZHkgUC4gd3JvdGU6
Cj4gSGVsbG8sIGFuc3dlcmluZyBiZXR3ZWVuIGxpbmVzCj4gT24gV2VkLCAyMDE5LTA3LTI0IGF0
IDE2OjM2ICswMjAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4gT24gV2VkLCBKdWwgMjQs
IDIwMTkgYXQgMTA6MDE6NDBBTSAtMDQwMCwgRnJlZHkgUC4gd3JvdGU6Cj4gPiA+IElmIHRoZSBh
bnN3ZXIgZm9yIGZpcnN0IHF1ZXN0aW9uIGlzIG5vdCwgdGhlbiB0aGVyZSBpcyBhbnkgd2F5IHRv
Cj4gPiA+IGdldAo+ID4gPiB0aGUgQ1BVIHRlbXBlcmF0dXJlIGZyb20gRG9tMD8gKHRoaXMgd2F5
IHdlIGNvdWxkIHVzZSBJbnRlbCdzCj4gPiA+IHRoZXJtYWxkCj4gPiA+IGFuZCBtb2RpZnkgaXQg
dG8gdXNlIHhlbnBtIHRvIGNoYW5nZSB0aGUgY3B1ZnJlcSkuCj4gPiAKPiA+IFdoYXQgaGFyZHdh
cmUgaW50ZXJmYWNlIGRvZXMgdGhlcm1hbGQgKG9yIHRoZSBkcml2ZXIgaW4gTGludXggaWYKPiA+
IHRoZXJlJ3Mgb25lKSB1c2UgdG8gZ2V0IHRoZSB0ZW1wZXJhdHVyZSBkYXRhPwo+IAo+IFRoYXQg
aXMgdGhlIG1haW4gcHJvYmxlbSwgaW4gYSBQT0Mgd2UgZGlkIHllYXJzIGFnbyBmb3Igb3VyIGNs
aWVudAo+IHVzaW5nIFhlbiA0LjgueCB3ZSB0b29rIGl0IGZyb20gL3N5cy9jbGFzcy9od21vbiBi
dXQgdGhhdCB3YXMgbm90Cj4gYWNjdXJhdGUgYW5kIFhlbiByZW1vdmVzIGl0IG9uIDQuOS54LiB0
aGlzIGlzIHRoZSBxdWVzdGlvbiBJJ20gZG9pbmcKPiBoZXJlLgo+IAo+ID4gSXMgaXQgZXhwb3Nl
ZCBpbiBhIG1taW8gcmVnaW9uIHNvbWV3aGVyZT8gT3IgbWF5YmUgZXhwb3NlZCBhcyBhIHBjaQo+
ID4gZGV2aWNlPwoKWW91IGhhdmVuJ3QgYW5zd2VyZWQgdGhpcywgd2hpY2ggSSB0aGluayBpdCdz
IHF1aXRlIHJlbGV2YW50IGluIG9yZGVyCnRvIGtub3cgaG93IHRvIG1vdmUgZm9yd2FyZC4gSG93
IGlzIHRoZSB0ZW1wZXJhdHVyZSBkYXRhIGV4cG9zZWQgYnkKdGhlIGhhcmR3YXJlIHdpbGwgbGlr
ZWx5IGRldGVybWluZSBob3cgdG8gcmVhZCBpdCwgYW5kIHdoZXRoZXIgWGVuIG9yCmRvbTAgc2hv
dWxkIGFjY2VzcyBpdC4KCklmIHN1Y2ggZGF0YSAob3IgcGFydCBvZiBpdCkgY29tZXMgZnJvbSBB
Q1BJIGR5bmFtaWMgdGFibGVzIHRoZW4gaXQKbXVzdCBiZSBkb20wIHRoZSBvbmUgdGhhdCByZWFk
cyBpdCwgaWYgaXQgaXMgb3RoZXJ3aXNlIGV4cG9zZWQgYXMgYQpQQ0kgZGV2aWNlIG9yIG1heWJl
IGFzIGEgbW1pbyByZWdpb24gc29tZXdoZXJlIGl0IGNvdWxkIGJlIFhlbiB0aGUKb25lIHRvIHJl
YWQgc3VjaCBpbmZvcm1hdGlvbi4KCj4gPiA+IElmIG9uZSBhbmQgdHdvIGFyZSBub3QsIGRvIHlv
dSB0aGluayB0aGF0IHRoZSByaWdodCBwYXRoIGlzIHRvCj4gPiA+IG1vZGlmeQo+ID4gPiAgbGlu
dXgvZHJpdmVycy94ZW4veGVuLWFjcGktcHJvY2Vzc29yLmMgb3IgeW91IGhhdmUgYW55IG90aGVy
Cj4gPiA+IGlkZWFzPwo+ID4gCj4gPiBJIHRoaW5rIGl0IGRlcGVuZHMgb24gaG93IHRoaXMgZGF0
YSBpcyBleHBvc2VkIGJ5IHRoZSBoYXJkd2FyZS4KPiAKPiBJcyBhIEludGVsKFIpIENvcmUoVE0p
IGk1LTUzNTBVIENQVSBAIDEuODBHSHogcHJvY2Vzc29yLCB3aGVuIHlvdSBzYXkKPiB0aGUgaGFy
ZHdhcmUgaXMgdGhlIGJvYXJkIGl0c2VsZj8gb3IgdGhlIHByb2Nlc3Nvcj8KClRoZSBtb2RlbCBp
dHNlbGYgaXMgbm90IHRoYXQgcmVsZXZhbnQsIGJ1dCByYXRoZXIgaG93IGlzIHRoZQp0ZW1wZXJh
dHVyZSBleHBvc2VkIGJ5IHRoZSBDUFUsIHNlZSBteSBjb21tZW50IGFib3ZlLgoKVGhhbmtzLCBS
b2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
