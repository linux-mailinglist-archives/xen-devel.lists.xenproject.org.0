Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F1F4B631
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 12:29:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdXnM-0007Tv-HK; Wed, 19 Jun 2019 10:26:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hb7b=US=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hdXnK-0007Tq-Sh
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 10:26:22 +0000
X-Inumbo-ID: aca525a2-927c-11e9-944a-8f92d90bfdf8
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id aca525a2-927c-11e9-944a-8f92d90bfdf8;
 Wed, 19 Jun 2019 10:26:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CEFA2CFC;
 Wed, 19 Jun 2019 03:26:17 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 726403F738;
 Wed, 19 Jun 2019 03:28:03 -0700 (PDT)
To: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20190611184541.7281-1-volodymyr_babchuk@epam.com>
 <20190611184541.7281-3-volodymyr_babchuk@epam.com>
 <686a7564-5c8b-937f-1e14-671e7b08a18b@arm.com>
 <1a81a53d-91e3-37e0-79df-8f59a0dc6a2a@arm.com>
 <alpine.DEB.2.21.1906170926150.2072@sstabellini-ThinkPad-T480s>
 <3274e117-4e51-5360-8f94-ece7a6981998@arm.com>
 <alpine.DEB.2.21.1906171026050.2072@sstabellini-ThinkPad-T480s>
 <FFA82A74-1DD5-48EE-B326-E298BDC23B1D@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f64b8514-bbfa-6cc6-21bb-0dc928ddf385@arm.com>
Date: Wed, 19 Jun 2019 11:26:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <FFA82A74-1DD5-48EE-B326-E298BDC23B1D@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 02/10] xen/arm: optee: add OP-TEE header
 files
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgTGFycywKCk9uIDE5LzA2LzIwMTkgMDk6MjAsIExhcnMgS3VydGggd3JvdGU6Cj4gCj4gCj4g
77u/T24gMTcvMDYvMjAxOSwgMTg6MjgsICJTdGVmYW5vIFN0YWJlbGxpbmkiIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPiB3cm90ZToKPiAKPiAgICAgIE9uIE1vbiwgMTcgSnVuIDIwMTksIEp1bGll
biBHcmFsbCB3cm90ZToKPiAgICAgID4gT24gMTcvMDYvMjAxOSAxNzoyOCwgU3RlZmFubyBTdGFi
ZWxsaW5pIHdyb3RlOgo+ICAgICAgPiA+IExvb2tpbmcgYXQgaHR0cHM6Ly93d3cuZ251Lm9yZy9s
aWNlbnNlcy9saWNlbnNlLWxpc3QuZW4uaHRtbCBhbmQgYWxzbwo+ICAgICAgPiA+IGxvb2tpbmcg
YXQgdGhlIHVzYWdlIGluIHRoZSBMaW51eCBrZXJuZWwsIEkgYW0gcHJldHR5IHN1cmUgaXQgaXMK
PiAgICAgID4gPiBjb21wYXRpYmxlLiBIb3dldmVyLCBnaXZlbiB0aGF0IHRoZSBYZW4gaHlwZXJ2
aXNvciBhcyBhIHdob2xlIGlzIEdQTHYyLAo+ICAgICAgPiA+IEkgdGhpbmsgaXQgd291bGQgYmUg
bW9yZSBwcmVjaXNlIHRvIHNheToKPiAgICAgID4gPgo+ICAgICAgPiA+IFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiAgICAgID4KPiAgICAg
ID4gV2VsbCwgdGhpcyBpcyBpbXBvcnRlZCBmcm9tIE9QLVRFRS4gU28gSSBkb24ndCB0aGluayB3
ZSBoYXZlIHRoZSBmcmVlZG9tIHRvCj4gICAgICA+IGNoYW5nZSB0aGlzIGNvcHlyaWdodCBoZWFk
ZXIgaGVyZS4uLgo+ICAgICAgCj4gICAgICBJbnRlcmVzdGluZyBwb2ludDogSSB3b3VsZCBoYXZl
IHRob3VnaHQgdGhhdCBnaXZlbiB0aGF0IHRoaXMgaXMgYSBHUEx2Mgo+ICAgICAgcHJvamVjdCwg
aWYgd2Ugd2VudCB3aXRoIFNQRFgsIGFsbCBmaWxlcyB3b3VsZCBuZWVkIHRvIGhhdmUgYQo+ICAg
ICAgR1BMLTIuMC1vbmx5IHRhZyBvbiB0aGVtLCBwbHVzLCBvcHRpb25hbGx5LCBhbiBPUiBYWFgg
Y2xhdXNlLgo+ICAgICAgCj4gICAgICBTb21ldGhpbmcgZm9yIExhcnMgdG8gaW52ZXN0aWdhdGUu
Cj4gCj4gVGhhdCBpcyBub3QgcmVhbGx5IGhvdyB0aGlzIHdvcmtzLiBUaGUgcmVzdWx0aW5nIFhl
biBiaW5hcnkgd291bGQgYmUgR1BMIDIuMCwgd2hpbGUgaW5kaXZpZHVhbCBwYXJ0cyBvZiB0aGUg
c291cmNlIHRyZWUgY2FuIGJlIG9mIGRpZmZlcmVudCBsaWNlbnNlcy4KPiAgICAgIAo+ICAgICAg
PiBXaGF0IEkgd2FzIGFza2luZyBpcyB3aGV0aGVyIHRoaXMgaXMgT0sgdG8gaW1wb3J0IEJTRC0y
LUNsYXVzZSBjb2RlIGluIFhlbi4KPiAgICAgID4gWW91IHNlZW0gdG8gYWdyZWUgdGhhdCBpdCBz
aG91bGQgYmUgcG9zc2libGUuCj4gICAgICAKPiAgICAgIFllcC4gVGhlIHByb2JsZW1hdGljIEJT
RCBsaWNlbnNlIGlzIHRoZSBCU0QtNC1DbGF1c2UuCj4gICAgICAKPiBJdCBpcyBkZWZpbml0ZWx5
IE9LOiBzZWUgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWJsb2I7
Zj1DT05UUklCVVRJTkcKClRoYW5rIHlvdSBmb3IgdGhlIGlucHV0ISBJIHdpbGwgYWRkIGEgd29y
ZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2U6CgoiTm90ZSB0aGUgaW1wb3J0ZWQgaGVhZGVyIGlzIGxp
Y2Vuc2VkIEJTRC0yLWNsYXVzZS4gVGhpcyBpcyBmaW5lIGFzIGl0IGlzIApjb21wYXRpYmxlIHdp
dGggR1BMdjItb25seSIuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
