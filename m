Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F53BE0F0
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:12:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD8ux-0003M8-8F; Wed, 25 Sep 2019 15:09:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hlHO=XU=arm.com=robin.murphy@srs-us1.protection.inumbo.net>)
 id 1iD8uv-0003M2-09
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:09:21 +0000
X-Inumbo-ID: 72b6de2c-dfa6-11e9-9636-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 72b6de2c-dfa6-11e9-9636-12813bfff9fa;
 Wed, 25 Sep 2019 15:09:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19E381000;
 Wed, 25 Sep 2019 08:09:19 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A1433F59C;
 Wed, 25 Sep 2019 08:09:14 -0700 (PDT)
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Rob Herring <robh+dt@kernel.org>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
 <CAL_Jsq+v+svTyna7UzQdRVqfNc5Z_bgWzxNRXv7-Wqv3NwDu2g@mail.gmail.com>
 <d1a31a2ec8eb2f226b1fb41f6c24ffb47c3bf7c7.camel@suse.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <e404c65b-5a66-6f91-5b38-8bf89a7697b2@arm.com>
Date: Wed, 25 Sep 2019 16:09:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d1a31a2ec8eb2f226b1fb41f6c24ffb47c3bf7c7.camel@suse.de>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 00/11] of: Fix DMA configuration for non-DT
 masters
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
Cc: devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, etnaviv@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Stefan Wahren <wahrenst@gmx.net>, james.quinlan@broadcom.com,
 linux-pci@vger.kernel.org,
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
 xen-devel@lists.xenproject.org, Dan Williams <dan.j.williams@intel.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUvMDkvMjAxOSAxNTo1MiwgTmljb2xhcyBTYWVueiBKdWxpZW5uZSB3cm90ZToKPiBPbiBU
dWUsIDIwMTktMDktMjQgYXQgMTY6NTkgLTA1MDAsIFJvYiBIZXJyaW5nIHdyb3RlOgo+PiBPbiBU
dWUsIFNlcCAyNCwgMjAxOSBhdCAxOjEyIFBNIE5pY29sYXMgU2FlbnogSnVsaWVubmUKPj4gPG5z
YWVuemp1bGllbm5lQHN1c2UuZGU+IHdyb3RlOgo+Pj4gSGkgQWxsLAo+Pj4gdGhpcyBzZXJpZXMg
dHJpZXMgdG8gYWRkcmVzcyBvbmUgb2YgdGhlIGlzc3VlcyBibG9ja2luZyB1cyBmcm9tCj4+PiB1
cHN0cmVhbWluZyBCcm9hZGNvbSdzIFNUQiBQQ0llIGNvbnRyb2xsZXJbMV0uIE5hbWVseSwgdGhl
IGZhY3QgdGhhdAo+Pj4gZGV2aWNlcyBub3QgcmVwcmVzZW50ZWQgaW4gRFQgd2hpY2ggc2l0IGJl
aGluZCBhIFBDSSBidXMgZmFpbCB0byBnZXQgdGhlCj4+PiBidXMnIERNQSBhZGRyZXNzaW5nIGNv
bnN0cmFpbnRzLgo+Pj4KPj4+IFRoaXMgaXMgZHVlIHRvIHRoZSBmYWN0IHRoYXQgb2ZfZG1hX2Nv
bmZpZ3VyZSgpIGFzc3VtZXMgaXQncyByZWNlaXZpbmcgYQo+Pj4gRFQgbm9kZSByZXByZXNlbnRp
bmcgdGhlIGRldmljZSBiZWluZyBjb25maWd1cmVkLCBhcyBvcHBvc2VkIHRvIHRoZSBQQ0llCj4+
PiBicmlkZ2Ugbm9kZSB3ZSBjdXJyZW50bHkgcGFzcy4gVGhpcyBjYXVzZXMgdGhlIGNvZGUgdG8g
ZGlyZWN0bHkganVtcAo+Pj4gaW50byBQQ0kncyBwYXJlbnQgbm9kZSB3aGVuIGNoZWNraW5nIGZv
ciAnZG1hLXJhbmdlcycgYW5kIG1pc3Nlcwo+Pj4gd2hhdGV2ZXIgd2FzIHNldCB0aGVyZS4KPj4+
Cj4+PiBUbyBhZGRyZXNzIHRoaXMgSSBjcmVhdGUgYSBuZXcgQVBJIGluIE9GIC0gaW5zcGlyZWQg
ZnJvbSBSb2JpbiBNdXJwaHlzCj4+PiBvcmlnaW5hbCBwcm9wb3NhbFsyXSAtIHdoaWNoIGFjY2Vw
dHMgYSBidXMgRFQgbm9kZSBhcyBpdCdzIGlucHV0IGluCj4+PiBvcmRlciB0byBjb25maWd1cmUg
YSBkZXZpY2UncyBETUEgY29uc3RyYWludHMuIFRoZSBjaGFuZ2VzIGdvIGRlZXAgaW50bwo+Pj4g
b2YvYWRkcmVzcy5jJ3MgaW1wbGVtZW50YXRpb24sIGFzIGEgZGV2aWNlIGJlaW5nIGhhdmluZyBh
IERUIG5vZGUKPj4+IGFzc3VtcHRpb24gd2FzIHByZXR0eSBzdHJvbmcuCj4+Pgo+Pj4gT24gdG9w
IG9mIHRoaXMgd29yaywgSSBhbHNvIGNsZWFuZWQgdXAgb2ZfZG1hX2NvbmZpZ3VyZSgpIHJlbW92
aW5nIGl0cwo+Pj4gcmVkdW5kYW50IGFyZ3VtZW50cyBhbmQgY3JlYXRpbmcgYW4gYWx0ZXJuYXRp
dmUgZnVuY3Rpb24gZm9yIHRoZSBzcGVjaWFsCj4+PiBjYXNlcwo+Pj4gbm90IGFwcGxpY2FibGUg
dG8gZWl0aGVyIHRoZSBhYm92ZSBjYXNlIG9yIHRoZSBkZWZhdWx0IHVzYWdlLgo+Pj4KPj4+IElN
TyB0aGUgcmVzdWx0aW5nIGZ1bmN0aW9ucyBhcmUgbW9yZSBleHBsaWNpdC4gVGhleSB3aWxsIHBy
b2JhYmx5Cj4+PiBzdXJmYWNlIHNvbWUgaGFja3kgdXNhZ2VzIHRoYXQgY2FuIGJlIHByb3Blcmx5
IGZpeGVkIGFzIEkgc2hvdyB3aXRoIHRoZQo+Pj4gRFQgZml4ZXMgb24gdGhlIExheWVyc2NhcGUg
cGxhdGZvcm0uCj4+Pgo+Pj4gVGhpcyB3YXMgYWxzbyB0ZXN0ZWQgb24gYSBSYXNwYmVycnkgUGkg
NCB3aXRoIGEgY3VzdG9tIFBDSWUgZHJpdmVyIGFuZAo+Pj4gb24gYSBTZWF0dGxlIEFNRCBib2Fy
ZC4KPj4KPj4gSHVtbSwgSSd2ZSBiZWVuIHdvcmtpbmcgb24gdGhpcyBpc3N1ZSB0b28uIExvb2tz
IHNpbWlsYXIgdGhvdWdoIHlvdXJzCj4+IGhhcyBhIGxvdCBtb3JlIGNodXJuIGFuZCB0aGVyZSdz
IHNvbWUgb3RoZXIgYnVncyBJJ3ZlIGZvdW5kLgo+IAo+IFRoYXQncyBnb29kIG5ld3MsIGFuZCB5
ZXMgbm93IHRoYXQgSSBzZWUgaXQsIHNvbWUgc3R1ZmYgb24gbXkgc2VyaWVzIGlzIG92ZXJseQo+
IGNvbXBsaWNhdGVkLiBTcGVjaWFsbHkgYXJvdW5kIG9mX3RyYW5zbGF0ZV8qKCkuCj4gCj4gT24g
dG9wIG9mIHRoYXQsIHlvdSByZW1vdmVkIGluIG9mX2RtYV9nZXRfcmFuZ2UoKToKPiAKPiAtCS8q
Cj4gLQkgKiBBdCBsZWFzdCBlbXB0eSByYW5nZXMgaGFzIHRvIGJlIGRlZmluZWQgZm9yIHBhcmVu
dCBub2RlIGlmCj4gLQkgKiBETUEgaXMgc3VwcG9ydGVkCj4gLQkgKi8KPiAtCWlmICghcmFuZ2Vz
KQo+IC0JCWJyZWFrOwo+IAo+IFdoaWNoIEkgYXNzdW1lZCB3YXMgYm91bmQgdG8gdGhlIHN0YW5k
YXJkIGFuZCBtYWtlcyB0aGluZ3MgZWFzaWVyLgo+IAo+PiBDYW4geW91IHRlc3Qgb3V0IHRoaXMg
YnJhbmNoWzFdLiBJIGRvbid0IGhhdmUgYW55IGgvdyBuZWVkaW5nIHRoaXMsCj4+IGJ1dCB3cm90
ZSBhIHVuaXR0ZXN0IGFuZCB0ZXN0ZWQgd2l0aCBtb2RpZmllZCBRRU1VLgo+IAo+IEkgcmV2aWV3
ZWQgZXZlcnl0aGluZywgSSBkaWQgZmluZCBhIG1pbm9yIGlzc3VlLCBzZWUgdGhlIHBhdGNoIGF0
dGFjaGVkLgoKV1JUIHRoYXQgcGF0Y2gsIHRoZSBvcmlnaW5hbCBpbnRlbnQgb2YgImZvcmNlX2Rt
YSIgd2FzIHB1cmVseSB0byAKY29uc2lkZXIgYSBkZXZpY2UgRE1BLWNhcGFibGUgcmVnYXJkbGVz
cyBvZiB0aGUgcHJlc2VuY2Ugb2YgCiJkbWEtcmFuZ2VzIi4gRXhwZWN0aW5nIG9mX2RtYV9jb25m
aWd1cmUoKSB0byBkbyBhbnl0aGluZyBmb3IgYSBub24tT0YgCmRldmljZSBoYXMgYWx3YXlzIGJl
ZW4gYm9ndXMgLSBtYWdpYyBwYXJhdmlydCBkZXZpY2VzIHdoaWNoIGFwcGVhciBvdXQgCm9mIG5v
d2hlcmUgYW5kIGV4cGVjdCB0byBiZSB0cmVhdGVkIGFzIGdlbnVpbmUgRE1BIG1hc3RlcnMgYXJl
IGEgCnNlcGFyYXRlIHByb2JsZW0gdGhhdCB3ZSBoYXZlbid0IHJlYWxseSBhcHByb2FjaGVkIHll
dC4KClJvYmluLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
