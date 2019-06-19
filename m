Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB344C36E
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2019 00:11:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdikY-0004yx-FQ; Wed, 19 Jun 2019 22:08:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hb7b=US=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hdikW-0004yq-E4
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 22:08:12 +0000
X-Inumbo-ID: ba35f9f8-92de-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id ba35f9f8-92de-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 22:08:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7ADB6344;
 Wed, 19 Jun 2019 15:08:11 -0700 (PDT)
Received: from [10.37.8.153] (unknown [10.37.8.153])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19FA63F738;
 Wed, 19 Jun 2019 15:08:09 -0700 (PDT)
To: Denis Obrezkov <denisobrezkov@gmail.com>,
 Andrii Anisov <andrii.anisov@gmail.com>
References: <287117b9-952c-1a92-26e0-9597df936c27@gmail.com>
 <747dd124-3511-f010-dac7-b9b23d7b44ad@gmail.com>
 <CALC81-tewzAtaaH94U1nVc-UiacR_YvqhaYcPXtXcviTFHAG8A@mail.gmail.com>
 <ecb2cf41-51e5-2ff2-5e61-72be64399e40@arm.com>
 <AM6PR0302MB32215CD7FAED139C682D92A386EA0@AM6PR0302MB3221.eurprd03.prod.outlook.com>
 <ef82a028-9e4e-9976-d205-42cbc4bfc8ac@arm.com>
 <AM6PR0302MB3221D649900B54C2FFA7003A86EA0@AM6PR0302MB3221.eurprd03.prod.outlook.com>
 <AM6PR03MB49190A0828A49569B64611B4E6EA0@AM6PR03MB4919.eurprd03.prod.outlook.com>
 <07a7084a-b798-0cc7-cca4-3fe58ea95835@arm.com>
 <666fc807-af6a-231c-9d7e-48ecabb07371@gmail.com>
 <2c0cced8-27ec-a3bb-b2bf-c037176a162a@arm.com>
 <4a2ae4d4-493a-d5f6-64da-1da313db3962@gmail.com>
 <CAGPpAzUpeFEmFX9FMkQDn+2gWnL1GmyEsL49DPLxWKBQ=_W0Eg@mail.gmail.com>
 <8f6fafd5-6cab-b57c-b68b-ceb0ec88cfb2@arm.com>
 <45406dbd-4aa1-8852-475e-1c37c93a7fa3@gmail.com>
 <04e2ff99-1276-a99b-b86c-825cf8cea858@arm.com>
 <fbe53d36-7027-2a97-72eb-2776e8fd6700@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a8949a16-0522-d7cc-8ed0-fe5eeaf7a616@arm.com>
Date: Wed, 19 Jun 2019 23:08:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <fbe53d36-7027-2a97-72eb-2776e8fd6700@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Starting to port xen on beagleboard-x15 (GSoC 2019
 project)
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
Cc: Hunyue Yau <hy-gsoc@hy-research.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Iain Hunter <drhunter95@gmail.com>, Andre Przywara <andre.przywara@arm.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA2LzE5LzE5IDEwOjUxIFBNLCBEZW5pcyBPYnJlemtvdiB3cm90ZToKPiBIaSwKPiAK
PiBPbiA2LzE5LzE5IDU6MzIgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGksCj4+Cj4+IE9u
IDE5LzA2LzIwMTkgMTY6MjcsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4+Pgo+Pj4KPj4+IE9uIDE5
LjA2LjE5IDE4OjA2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4gTGFzdGx5LCBwbGVhc2UgY2xl
YW4tdXAgdGhlIGNvZGUgYW5kIHNlbmQgdGhlIHBhdGNoIG9uIHhlbi1kZXZlbC4gSQo+Pj4+IHdp
bGwgaGF2ZSBhIGNsb3NlciBsb29rIGF0IHRoYXQgdGltZS4gRmVlbCBmcmVlIHRvIHBpbmcgbWUg
b24gSVJDIGlmCj4+Pj4geW91IGhhdmUgYW55IGRvdWJ0IGhvdyB0byBwcm9jZWVkLgo+Pj4KPj4+
IEFib3V0IHRoZSBjb2RlOiBJIHRoaW5rIG9tYXA1X2luaXRfc2Vjb25kYXJ5KCkgbXVzdCBiZSBt
b3ZlZCB0byB0aGUKPj4+IHBsYXRmb3JtIGNvZGUgKG9tYXA1LmMpLgo+Pgo+PiBXZWxsIG9tYXA1
LmMgaXMgQyBjb2RlLi4uIFlvdSBjYW4ndCBjYWxsIEMgaW4gdGhlIGJvb3QgcHJvY2VzcyBhdCBs
ZWFzdAo+PiB1bnRpbCB0aGUgTU1VIGlzIG9uIGFuZCB3ZSBmdWxseSBzZXR1cCB0aGUgcHJvY2Vz
c29yLgo+IEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGlzIHNpbmNlIGluaXRfc2Vjb25kYXJ5IGlzIGlu
c3RhbGxlZCBpbiBDIGNvZGUsCj4gaXNuJ3QgaXQ/IChpbiBvbWFwNS5jOm9tYXA1X3NtcF9pbml0
KCkpCgppbml0X3NlY29uZGFyeSBpcyBpbnN0YWxsZWQgYnkgdGhlIGJvb3QgQ1BVLiBCdXQgaW5p
dF9zZWNvbmRhcnkgaXMKZXhlY3V0ZWQgb24gdGhlIHNlY29uZGFyeSBDUFUuCgpZb3UgY2FuJ3Qg
ZXhlY3V0ZSBDIGNvZGUgdGhhdCBlYXJseSBmb3IgYSBmZXcgcmVhc29uczoKICAgIDEpIFlvdSBk
b24ndCBrbm93IHRoZSBzdGF0ZSBvZiB0aGUgcmVnaXN0ZXJzLiBTbyB5b3UgbmVlZCB0byBzZXQg
CnRoZW0gdXAgaW4gYSBzYW5lIHN0YXRlLgogICAgMikgWGVuIGlzIGNvbXBpbGVkIHBvc2l0aW9u
IGRlcGVuZCBzbyBmYXIuIFRoaXMgbWVhbnMgc29tZSBvZiB0aGUgQyAKY29kZSB1c2UgaGFyZGNv
ZGVkIGFkZHJlc3MgdG8gYWNjZXNzIGRhdGEgb3IganVtcCB0byBvdGhlciBmdW5jdGlvbi4gVGhl
IApoYXJkY29kZWQgYWRkcmVzcyBhcmUgdmlydHVhbC4gSW4gbW9zdCBvZiB0aGUgY2FzZXMsIFhl
biB3aWxsIG5vdCBiZSAKbG9hZGVkIGF0IGF0IHZpcnR1YWwgYWRkcmVzcyA9PSBwaHlzaWNhbCBh
ZGRyZXNzLiBTbyB5b3UgbmVlZCB0byBzZXR1cCAKdGhlIE1NVSBmaXJzdC4KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
