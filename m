Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B02AEB2B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 15:11:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7ftC-00065X-KM; Tue, 10 Sep 2019 13:08:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6bdU=XF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7ftB-00065R-Gf
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 13:08:57 +0000
X-Inumbo-ID: 19d49014-d3cc-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19d49014-d3cc-11e9-b299-bc764e2007e4;
 Tue, 10 Sep 2019 13:08:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C5415B6AA;
 Tue, 10 Sep 2019 13:08:36 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <67f6d8cc-05cf-ac8e-38c0-55578f9f595a@suse.com>
 <427a5562-e2f1-0572-7e74-18425bf01126@suse.com>
Message-ID: <2501fd7a-70c2-0231-8788-e9589ab50f58@suse.com>
Date: Tue, 10 Sep 2019 15:08:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <427a5562-e2f1-0572-7e74-18425bf01126@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/3] x86/apic: include the LDR when clearing
 out APIC registers
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDkuMjAxOSAxNjowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQWx0aG91Z2ggQVBJQyBp
bml0aWFsaXphdGlvbiB3aWxsIHR5cGljYWxseSBjbGVhciBvdXQgdGhlIExEUiBiZWZvcmUKPiBz
ZXR0aW5nIGl0LCB0aGUgQVBJQyBjbGVhbnVwIGNvZGUgc2hvdWxkIHJlc2V0IHRoZSBMRFIuCj4g
Cj4gVGhpcyB3YXMgZGlzY292ZXJlZCB3aXRoIGEgMzItYml0IEtWTSBndWVzdCBqdW1waW5nIGlu
dG8gYSBrZHVtcAo+IGtlcm5lbC4gVGhlIHN0YWxlIGJpdHMgaW4gdGhlIExEUiB0cmlnZ2VyZWQg
YSBidWcgaW4gdGhlIEtWTSBBUElDCj4gaW1wbGVtZW50YXRpb24gd2hpY2ggY2F1c2VkIHRoZSBk
ZXN0aW5hdGlvbiBtYXBwaW5nIGZvciBWQ1BVcyB0byBiZQo+IGNvcnJ1cHRlZC4KPiAKPiBOb3Rl
IHRoYXQgdGhpcyBpc24ndCBpbnRlbmRlZCB0byBwYXBlciBvdmVyIHRoZSBLVk0gQVBJQyBidWcu
IFRoZSBrZXJuZWwKPiBoYXMgdG8gY2xlYXIgdGhlIExEUiB3aGVuIHJlc2V0dGluZyB0aGUgQVBJ
QyByZWdpc3RlcnMgZXhjZXB0IHdoZW4gWDJBUElDCj4gaXMgZW5hYmxlZC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBCYW5kYW4gRGFzIDxic2RAcmVkaGF0LmNvbT4KPiBbTGludXggY29tbWl0IDU1ODY4
MmI1MjkxOTM3YTcwNzQ4ZDM2ZmQ5YmE3NTdmYjI1Yjk5YWVdCj4gU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKRlRSLCBjb21taXQgOTUwYjA3YzE0ZThjNTk0
NDRlMjM1OWYxNWZkNzBlZDUxMTJlMTFhMCByZXZlcnRzCnRoaXMgaW4gTGludXgsIGJ1dCBvbmx5
IGZvciBicmVha2luZyBvZmZsaW5pbmcgYW5kIHRoZW4gcmUtCm9ubGluaW5nIHRoZSBCU1AuIFNp
bmNlIHdlIGRvbid0IHN1cHBvcnQgdGhpcyAoeWV0KSwgSSBkb24ndApzZWUgYSByZWFzb24gZm9y
IHVzIHRvIHJldmVydCBhcyB3ZWxsLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
