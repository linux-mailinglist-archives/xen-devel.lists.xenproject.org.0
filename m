Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E48CD14EE3B
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 15:15:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixX2T-0000ch-AZ; Fri, 31 Jan 2020 14:12:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r7oN=3U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ixX2R-0000cc-BG
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 14:12:51 +0000
X-Inumbo-ID: c2f5663c-4433-11ea-8bce-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c2f5663c-4433-11ea-8bce-12813bfff9fa;
 Fri, 31 Jan 2020 14:12:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CA20DB1ED;
 Fri, 31 Jan 2020 14:12:48 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-9-liuwe@microsoft.com>
 <20200130120807.GJ4679@Air-de-Roger> <20200130122836.ccexm2c2j5i7umas@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d57ce32a-fd0e-e98d-4e97-335963f946c7@suse.com>
Date: Fri, 31 Jan 2020 15:12:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200130122836.ccexm2c2j5i7umas@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 08/12] x86/hyperv: provide Hyper-V
 hypercall functions
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <liuwe@microsoft.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDEuMjAyMCAxMzoyOCwgV2VpIExpdSB3cm90ZToKPiBPbiBUaHUsIEphbiAzMCwgMjAy
MCBhdCAwMTowODowN1BNICswMTAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pgo+Pj4gK30K
Pj4+ICsKPj4+ICAvKgo+Pj4gICAqIExvY2FsIHZhcmlhYmxlczoKPj4+ICAgKiBtb2RlOiBDCj4+
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUyBiL3hlbi9hcmNoL3g4Ni94ZW4u
bGRzLlMKPj4+IGluZGV4IDk3ZjljMDc4OTEuLjhlMDJiNGM2NDggMTAwNjQ0Cj4+PiAtLS0gYS94
ZW4vYXJjaC94ODYveGVuLmxkcy5TCj4+PiArKysgYi94ZW4vYXJjaC94ODYveGVuLmxkcy5TCj4+
PiBAQCAtMzI5LDYgKzMyOSwxMCBAQCBTRUNUSU9OUwo+Pj4gICAgZWZpID0gLjsKPj4+ICAjZW5k
aWYKPj4+ICAKPj4+ICsjaWZkZWYgQ09ORklHX0hZUEVSVl9HVUVTVAo+Pj4gKyAgaHZfaGNhbGxf
cGFnZSA9IEFCU09MVVRFKF9fZml4X3hfdG9fdmlydCgxKSk7Cj4+Cj4+IEkgYXNzdW1lIHRoZXJl
J3Mgbm8gd2F5IHRvIHVzZSBGSVhfWF9IWVBFUlZfSENBTEwgYmVjYXVzZSBpdCdzIGFuCj4+IGVu
dW0/Cj4+Cj4gCj4gWWVzLgo+IAo+IEFuZCB0aGUgdHJpY2sgdG8gZ2VuZXJhdGUgYSBzeW1ib2wg
ZGlkbid0IHdvcmsgZWl0aGVyLgoKSSBndWVzcyBJIG5lZWQgYW4gZXhwbGFuYXRpb24gaGVyZS4g
QWl1aSB5b3UgZG9uJ3QgcmVhbGx5IG5lZWQKdGhlIGRlZmluaXRpb24gdG8gYmUgaW4gdGhlIGxp
bmtlciBzY3JpcHQsIGFuZCBpdCBjb3VsZCBhcyB3ZWxsCmJlIGluIGUuZy4gYXNzZW1ibHkgY29k
ZS4gSG93IGRvZXMgdGhlIHNhbWUgLmVxdSBhcHByb2FjaCBub3QKd29yayBpbiB0aGlzIGNhc2U/
CgpBbHNvIEkgdGhpbmsgdGhlIGFib3ZlIHdpbGwgdHJpZ2dlciB0aGUgd2FybmluZ3MgQW5kcmV3
IGhhZAptZW50aW9uZWQgKG9uIGlyYz8pIGZyb20gdGhlIGNvZGUgZ2VuZXJhdGluZyB4ZW4uZWZp
J3MgcnVudGltZQpyZWxvY2F0aW9uIHRhYmxlLiBKdXN0IGxpa2UgaW4KCkFTU0VSVChfXzJNX3J3
ZGF0YV9lbmQgPD0gWEVOX1ZJUlRfRU5EIC0gWEVOX1ZJUlRfU1RBUlQgKyBfX1hFTl9WSVJUX1NU
QVJUIC0KICAgICAgICAgICAgICAgICAgICAgICAgICBOUl9DUFVTICogUEFHRV9TSVpFLAogICAg
ICAgIlhlbiBpbWFnZSBvdmVybGFwcyBzdHVicyBhcmVhIikKCkkgdGhpbmsgeW91IG5lZWQgdG8g
YWRqdXN0IGJ5IF9fWEVOX1ZJUlRfU1RBUlQgLSBYRU5fVklSVF9TVEFSVC4KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
