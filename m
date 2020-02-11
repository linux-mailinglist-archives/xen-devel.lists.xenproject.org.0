Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41234158BD6
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 10:25:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Rlb-0007G6-Gf; Tue, 11 Feb 2020 09:23:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lVjU=37=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j1RlZ-0007Fy-LO
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 09:23:37 +0000
X-Inumbo-ID: 2e8e060e-4cb0-11ea-b537-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e8e060e-4cb0-11ea-b537-12813bfff9fa;
 Tue, 11 Feb 2020 09:23:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 58753ACCE;
 Tue, 11 Feb 2020 09:23:36 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200203144340.4614-5-andrew.cooper3@citrix.com>
 <20200210173309.16521-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <02137e69-cbd0-05af-17c0-9c5cab1f0122@suse.com>
Date: Tue, 11 Feb 2020 10:23:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200210173309.16521-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 4/4] AMD/IOMMU: Treat head/tail pointers
 as byte offsets
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDIuMjAyMCAxODozMywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgTU1JTyByZWdp
c3RlcnMgYXMgYWxyZWFkeSBieXRlIG9mZnNldHMuICBVc2luZyB0aGVtIGluIHRoaXMgZm9ybSBy
ZW1vdmVzCj4gdGhlIG5lZWQgdG8gc2hpZnQgdGhlaXIgdmFsdWVzIGZvciB1c2UuCj4gCj4gSXQg
aXMgYWxzbyBpbmVmZmljaWVudCB0byBzdG9yZSBib3RoIGVudHJpZXMgYW5kIGFsbG9jX3NpemUg
KHdoaWNoIG9ubHkgZGlmZmVyCj4gYnkgZW50cnlfc2l6ZSkuICBSZW5hbWUgYWxsb2Nfc2l6ZSB0
byBzaXplLCBhbmQgZHJvcCBlbnRyaWVzIGVudGlyZWx5LCB3aGljaAo+IHNpbXBsaWZpZXMgdGhl
IGFsbG9jYXRpb24vZGVhbGxvY2F0aW9uIGhlbHBlcnMgc2xpZ2h0bHkuCj4gCj4gTWFyayBzZW5k
X2lvbW11X2NvbW1hbmQoKSBhbmQgaW52YWxpZGF0ZV9pb21tdV9hbGwoKSBhcyBzdGF0aWMsIGFz
IHRoZXkgaGF2ZQo+IG5vIGV4dGVybmFsIGRlY2xhcmF0aW9uIG9yIGNhbGxlcnMuCj4gCj4gU2ln
bmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJl
dmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cgo+IC0tLQo+IENDOiBK
YW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+Cj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+
Cj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IAo+IHYyOgo+
ICAqIE1hc2sgaGVhZC90YWlsIHBvaW50ZXJzCj4gICogRHJvcCB1bm5lY2Vzc2FyeSBjYXN0LgoK
VGhhbmtzIGZvciBhZGp1c3RpbmcgdGhlc2UuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
