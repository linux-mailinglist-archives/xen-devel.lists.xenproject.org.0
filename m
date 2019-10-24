Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98218E2CD2
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 11:07:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNZ3d-0005KP-Tv; Thu, 24 Oct 2019 09:05:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D++P=YR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iNZ3d-0005KK-4n
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 09:05:25 +0000
X-Inumbo-ID: 69418d80-f63d-11e9-9498-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 69418d80-f63d-11e9-9498-12813bfff9fa;
 Thu, 24 Oct 2019 09:05:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 96204BA9A;
 Thu, 24 Oct 2019 09:05:22 +0000 (UTC)
To: Julien Grall <julien.grall@arm.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1571220487-6582-1-git-send-email-olekstysh@gmail.com>
 <eea875c2-5d6e-5a49-b1c5-1248d447edbb@arm.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a0e71d6d-eeda-8f69-d4fb-ea6cf6ee49d7@suse.com>
Date: Thu, 24 Oct 2019 11:05:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <eea875c2-5d6e-5a49-b1c5-1248d447edbb@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v3] xen/arm: domain_build: Don't
 expose IOMMU specific properties to hwdom
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org, volodymyr_babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMTAuMTkgMTA6NTcsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSBPbGVrc2FuZHIsCj4g
Cj4gT24gMTAvMTYvMTkgMTE6MDggQU0sIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOgo+PiBG
cm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+
Cj4+Cj4+IFdlIGFsd2F5cyBza2lwIHRoZSBJT01NVSBkZXZpY2Ugd2hlbiBjcmVhdGluZyBEVCBm
b3IgaHdkb20gaWYgdGhlcmUgaXMKPj4gYW4gYXBwcm9wcmlhdGUgZHJpdmVyIGZvciBpdCBpbiBY
ZW4gKGRldmljZV9nZXRfY2xhc3MoaW9tbXVfbm9kZSkKPj4gcmV0dXJucyBERVZJQ0VfSU9NTVUp
LiBTbywgZXZlbiBpZiBpdCBpcyBub3QgdXNlZCBieSBYZW4gaXQgd2lsbCBiZSAKPj4gc2tpcHBl
ZC4KPj4KPj4gV2Ugc2hvdWxkIGFsc28gc2tpcCB0aGUgSU9NTVUgc3BlY2lmaWMgcHJvcGVydGll
cyBvZiB0aGUgbWFzdGVyIGRldmljZQo+PiBiZWhpbmQgdGhhdCBJT01NVSBpbiBvcmRlciB0byBh
dm9pZCBleHBvc2luZyBhbiBoYWxmIGNvbXBsZXRlIElPTU1VCj4+IGJpbmRpbmdzIHRvIGh3ZG9t
Lgo+Pgo+PiBBY2NvcmRpbmcgdG8gdGhlIExpbnV4J3MgZG9jczoKPj4gMS4gRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11L2lvbW11LnR4dAo+PiAyLiBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcGNpL3BjaS1pb21tdS50eHQKPj4KPj4gU2lnbmVkLW9mZi1i
eTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgo+
IAo+IEFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IAo+IEBK
dWVyZ2VuOiB3aGlsZSB0aGUgZHJpdmVyIHJlbHlpbmcgb24gdGhvc2UgYmluZGluZ3MgaXMgZXhw
ZXJpbWVudGFsIGZvciAKPiBYZW4gNC4xMywgaXQgd291bGQgYmUgZ29vZCB0byBhdm9pZCBleHBv
c2luZyBoYWxmIHRoZSBiaW5kaW5ncyBvZiBJT01NVS4KPiAKPiBUaGUgYmluZGluZ3MgYXJlIGdl
bmVyaWMgYnV0IGl0IGlzIG5vdCB1c2VkIGJ5IHRoZSBTTU1VIGRyaXZlciB5ZXQgYW5kIAo+IHRo
ZXJlZm9yZSBzaG91bGQgbm90IGFmZmVjdCBwbGF0Zm9ybSB1c2luZyBTTU1Vcy4KClRoYW5rcyBm
b3IgdGhlIGJhY2tncm91bmQgaW5mby4gV2l0aCB0aGF0OgoKUmVsZWFzZS1hY2tlZC1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
