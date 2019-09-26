Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3436BBF4D7
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 16:14:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDUUx-0006IO-6B; Thu, 26 Sep 2019 14:11:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOM6=XV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDUUv-0006ID-Ed
 for xen-devel@lists.xen.org; Thu, 26 Sep 2019 14:11:57 +0000
X-Inumbo-ID: 98cb5d10-e067-11e9-9655-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 98cb5d10-e067-11e9-9655-12813bfff9fa;
 Thu, 26 Sep 2019 14:11:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E02041596;
 Thu, 26 Sep 2019 07:11:55 -0700 (PDT)
Received: from [10.37.8.90] (unknown [10.37.8.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 983B93F534;
 Thu, 26 Sep 2019 07:11:54 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1909251146261.24909@sstabellini-ThinkPad-T480s>
 <20190925184924.21691-7-sstabellini@kernel.org>
 <f801e6ad-442a-c297-603c-19b2a0f6a438@arm.com>
 <alpine.DEB.2.21.1909251821330.14358@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8254d124-f051-9447-7f74-44da7a03ee43@arm.com>
Date: Thu, 26 Sep 2019 15:11:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1909251821330.14358@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 7/8] xen/arm: introduce nr_spis
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
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Achin Gupta <Achin.Gupta@arm.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, nd <nd@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDkvMjYvMTkgMjoyNSBBTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IE9uIFdlZCwgMjUgU2VwIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGksCj4+Cj4+
IE9uIDI1LzA5LzIwMTkgMTk6NDksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+IFdlIGRv
bid0IGhhdmUgYSBjbGVhciB3YXkgdG8ga25vdyBob3cgbWFueSB2aXJ0dWFsIFNQSXMgd2UgbmVl
ZCBmb3IgdGhlCj4+PiBkb20wLWxlc3MgZG9tYWlucy4gSW50cm9kdWNlIGEgbmV3IG9wdGlvbiB1
bmRlciB4ZW4sZG9tYWluIHRvIHNwZWNpZnkKPj4+IHRoZSBudW1iZXIgb2YgU1BJcyB0byBhbGxv
Y2F0ZSBmb3IgYSBkb21haW4uCj4+Pgo+Pj4gVGhlIHByb3BlcnR5IGlzIG9wdGlvbmFsLiBXaGVu
IGFic2VudCwgd2UnbGwgdXNlIHRoZSBwaHlzaWNhbCBudW1iZXIgb2YKPj4+IEdJQyBsaW5lcyBm
b3IgZG9tMC1sZXNzIGRvbWFpbnMsIGp1c3QgbGlrZSBmb3IgZG9tMC4KPj4KPj4gQmFzZWQgb24g
dGhlIGNvZGUgYmVsb3csIHRoaXMgaXMgbm90IGNvcnJlY3Qgd2hlbiB1c2luZyB2cGwwMTEuCj4g
Cj4gSSdsbCB3cml0ZToKPiAKPiBUaGUgcHJvcGVydHkgaXMgb3B0aW9uYWwuIFdoZW4gYWJzZW50
LCB3ZSdsbCB1c2UgdGhlIHBoeXNpY2FsIG51bWJlciBvZgo+IEdJQyBsaW5lcyBmb3IgZG9tMC1s
ZXNzIGRvbWFpbnMsIG9yIEdVRVNUX1ZQTDAxMV9TUEkrMSBpZiB2cGwwMTEgaXMKPiByZXF1ZXN0
ZWQsIHdoaWNoZXZlciBpcyBncmVhdGVyLgoKU291bmRzIGdvb2QgdG8gbWUuCgo+IAo+IAo+Pj4K
Pj4+IFJlbW92ZSB0aGUgb2xkIHNldHRpbmcgb2YgbnJfc3BpcyBiYXNlZCBvbiB0aGUgcHJlc2Vu
Y2Ugb2YgdGhlIHZwbDAxMS4KPj4+Cj4+PiBUaGUgaW1wbGljYXRpb24gb2YgdGhpcyBjaGFuZ2Ug
aXMgdGhhdCB3aXRob3V0IG5yX3NwaXMgZG9tMGxlc3MgZG9tYWlucwo+Pj4gZ2V0IHRoZSBzYW1l
IGFtb3VudCBvZiBTUEkgYWxsb2NhdGVkIGFzIGRvbTAsIHJlZ2FyZGxlc3Mgb2YgaG93IG1hbnkK
Pj4+IHBoeXNpY2FsIGRldmljZXMgdGhleSBoYXZlIGFzc2lnbmVkLCBhbmQgcmVnYXJkbGVzcyBv
ZiB3aGV0aGVyIHRoZXkgaGF2ZQo+Pj4gYSB2aXJ0dWFsIHBsMDExICh3aGljaCBhbHNvIG5lZWRz
IGFuIGVtdWxhdGVkIFNQSSkuIEZvciBpbnN0YW5jZSwgd2UKPj4+IGNvdWxkIGVuZCB1cCBleHBv
c2luZyAyNTYgU1BJcyBmb3IgZWFjaCBkb20wbGVzcyBkb21haW4gd2l0aG91dCBhCj4+PiBucl9z
cGlzIHByb3BlcnR5LiBJZiB3ZSBoYXZlIDQgZG9tMGxlc3MgZG9tYWlucyB3aXRob3V0IG5yX3Nw
aXMsIGl0Cj4+PiB3b3VsZCByZXN1bHQgaW4gODBLIG9mIGFkZGl0aW9uYWwgbWVtb3J5IGJlaW5n
IHVzZWQuCj4+Cj4+IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0IHlvdSBhcmUgdHJ5aW5nIHRvIGlt
cGx5IHdpdGggeW91ciBleGFtcGxlLiBPaywKPj4gdGhpcyB0ZWxsIHlvdSBob3cgbXVjaCBtZW1v
cnkgeW91IGFyZSBnb2luZyB0byB3YXN0ZS4uLiBidXQgdGhpcyBkb2VzCj4+IHN0aWxsIG5vdCBl
eHBsYWluIHdoeSB0aGUgbnJfc3BpcyBhcmUgaW5jcmVhc2VkIGluIHRoZSBkZWZhdWx0IGNhc2Uu
Cj4gCj4gSSBtaXN1bmRlcnN0b29kIHdoYXQgeW91IHdhbnRlZCBtZSB0byBhZGQgdG8gdGhlIGNv
bW1pdCBtZXNzYWdlLgoKU29ycnkgZm9yIHRoZSBjb25mdXNpb24sIG15IG1haW4gcG9pbnQgaXMg
eW91IGNhbid0IHJlYWxseSBzYXkgdGhpcyBpcyAKbG93IGZvb3RwcmludCBhcyB0aGlzIGlzIHZl
cnkgc3ViamVjdGl2ZS4gUGVyc29uYWxseSwgSSBmZWVsIGl0IGlzIGEgbG90IApiZWNhdXNlIGlm
IHlvdSB0YWtlIHRoZSBleGFtcGxlLCB0aGlzIGlzIHJvdWdobHkgOCUgb2YgdGhlIGN1cnJlbnQg
c2l6ZSAKb2YgWGVuIChpbiBkZWZhdWx0IGNvbmZpZykuCgo+IEknbGwgcmVtb3ZlIHRoZSBleGFt
cGxlIGFuZCBpbnN0ZWFkIHdyaXRlOgo+IAo+IFRoZSBpbXBsaWNhdGlvbiBvZiB0aGlzIGNoYW5n
ZSBpcyB0aGF0IHdpdGhvdXQgbnJfc3BpcyBkb20wbGVzcyBkb21haW5zCj4gZ2V0IHRoZSBzYW1l
IGFtb3VudCBvZiBTUEkgYWxsb2NhdGVkIGFzIGRvbTAsIHJlZ2FyZGxlc3Mgb2YgaG93IG1hbnkK
PiBwaHlzaWNhbCBkZXZpY2VzIHRoZXkgaGF2ZSBhc3NpZ25lZCwgYW5kIHJlZ2FyZGxlc3Mgb2Yg
d2hldGhlciB0aGV5IGhhdmUKPiBhIHZpcnR1YWwgcGwwMTEgKHdoaWNoIGFsc28gbmVlZHMgYW4g
ZW11bGF0ZWQgU1BJKS4gVGhpcyBpcyBkb25lIGJlY2F1c2UKPiB0aGUgU1BJcyBhbGxvY2F0aW9u
IG5lZWRzIHRvIGJlIGRvbmUgYmVmb3JlIHBhcnNpbmcgYW55IHBhc3N0aHJvdWdoCj4gaW5mb3Jt
YXRpb24sIHNvIHdlIGhhdmUgdG8gYWNjb3VudCBmb3IgYW55IHBvdGVudGlhbCBwaHlzaWNhbCBT
UEkKPiBhc3NpZ25lZCB0byB0aGUgZG9tYWluLgo+IAo+IAo+IElzIHRoaXMgYmV0dGVyPwoKWWVz
LCB0aGFuayB5b3UuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
