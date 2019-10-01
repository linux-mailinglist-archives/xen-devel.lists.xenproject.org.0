Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE26C2EEE
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 10:34:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFDZL-0008Lc-0h; Tue, 01 Oct 2019 08:31:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hN/W=X2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iFDZJ-0008LX-Nj
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 08:31:37 +0000
X-Inumbo-ID: e15c9992-e425-11e9-8628-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id e15c9992-e425-11e9-8628-bc764e2007e4;
 Tue, 01 Oct 2019 08:31:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 41857AE61;
 Tue,  1 Oct 2019 08:31:35 +0000 (UTC)
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
References: <20191001082818.34233-1-paul.durrant@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <b248f77a-d6de-05b8-025d-c2d4e7a61cb3@suse.com>
Date: Tue, 1 Oct 2019 10:31:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001082818.34233-1-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH-for-4.13] x86/mm: don't needlessly veto
 migration
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTAuMTkgMTA6MjgsIFBhdWwgRHVycmFudCB3cm90ZToKPiBOb3cgdGhhdCB4bC5jZmcg
aGFzIGFuIG9wdGlvbiB0byBleHBsaWNpdGx5IGVuYWJsZSBJT01NVSBtYXBwaW5ncyBmb3IgYQo+
IGRvbWFpbiwgbWlncmF0aW9uIG1heSBiZSBuZWVkbGVzc2x5IHZldG9lZCBkdWUgdG8gdGhlIGNo
ZWNrIG9mCj4gaXNfaW9tbXVfZW5hYmxlZCgpIGluIHBhZ2luZ19sb2dfZGlydHlfZW5hYmxlKCku
Cj4gVGhlcmUgaXMgYWN0dWFsbHkgbm8gbmVlZCB0byBwcmV2ZW50IGxvZ2RpcnR5IGZyb20gYmVp
bmcgZW5hYmxlZCB1bmxlc3MKPiBkZXZpY2VzIGFyZSBhc3NpZ25lZCB0byBhIGRvbWFpbiBhbmQg
dGhhdCBkb21haW4gaXMgc2hhcmluZyBIQVAgbWFwcGluZ3MKPiB3aXRoIHRoZSBJT01NVSAoaW4g
d2hpY2ggY2FzZSBkaXNhYmxpbmcgd3JpdGUgcGVybWlzc2lvbnMgaW4gdGhlIFAyTSBtYXkKPiBj
YXVzZSBETUEgZmF1bHRzKS4KPiAKPiBUaGlzIHBhdGNoIHRoZXJlZm9yZSByZXZlcnRzIGNvbW1p
dCAzNzIwMWM2MiAibWFrZSBsb2dkaXJ0eSBhbmQgaW9tbXUKPiBtdXR1YWxseSBleGNsdXNpdmUi
IGFuZCByZXBsYWNlcyBpdCB3aXRoIGNoZWNrcyB0byBlbnN1cmUgdGhhdCwgaWYKPiBpb21tdV91
c2VfaGFwX3B0KCkgaXMgdHJ1ZSwgdGhhdCBsb2dkaXJ0eSBhbmQgZGV2aWNlIGFzc2lnbm1lbnQg
YXJlIG11dHVhbGx5Cj4gZXhjbHVzaXZlLgo+IAo+IE5PVEU6IFdoaWxlIGluIHRoZSBuZWlnaGJv
dXJob29kLCB0aGUgYm9vbF90IHBhcmFtZXRlciB0eXBlIGluCj4gICAgICAgIHBhZ2luZ19sb2df
ZGlydHlfZW5hYmxlKCkgaXMgcmVwbGFjZWQgd2l0aCBhIGJvb2wgYW5kIHRoZSBmb3JtYXQKPiAg
ICAgICAgb2YgdGhlIGNvbW1lbnQgaW4gYXNzaWduX2RldmljZSgpIGlzIGZpeGVkLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CgpSZWxl
YXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
