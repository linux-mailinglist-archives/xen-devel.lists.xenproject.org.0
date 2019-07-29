Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 064C378AC9
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 13:45:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs43i-000461-Tw; Mon, 29 Jul 2019 11:43:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l3zY=V2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hs43g-00045w-Rp
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 11:43:16 +0000
X-Inumbo-ID: 0d0a866a-b1f6-11e9-af91-7fb916ae02b5
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0d0a866a-b1f6-11e9-af91-7fb916ae02b5;
 Mon, 29 Jul 2019 11:43:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D90CB28;
 Mon, 29 Jul 2019 04:43:14 -0700 (PDT)
Received: from [10.37.8.36] (unknown [10.37.8.36])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 035833F694;
 Mon, 29 Jul 2019 04:43:13 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>
References: <1563456140-12180-1-git-send-email-andrii.anisov@gmail.com>
 <18337bfe-c11e-899e-0ac9-90bb90491f21@arm.com>
 <d2833b7c-798a-c6c6-c970-cf649db33155@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <47dbe940-a465-fae4-2879-3198f0715d1b@arm.com>
Date: Mon, 29 Jul 2019 12:43:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d2833b7c-798a-c6c6-c970-cf649db33155@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] arm:cpuerrata: Align a virtual address
 before unmap
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiA3LzI5LzE5IDg6MzMgQU0sIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4gSGVsbG8gSnVsaWVu
LAo+IAo+IE9uIDI2LjA3LjE5IDE3OjAyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+
PiBJdCBsb29rcyBsaWtlIHRoZSB2bWFwIHNvbHV0aW9uIHN1Z2dlc3RlZCBieSBBbmRyZXcgJiBJ
IGlzIGEgZGVhZCBlbmQuIAo+PiBJIHN0aWxsIHRoaW5rIHdlIG5lZWQgdG8gZG8gc29tZXRoaW5n
IGluIHRoZSB2bWFwIHJlZ2FyZGxlc3MgdGhlIAo+PiBhbGlnbm1lbnQgZGVjaXNpb24gdG8gYXZv
aWQgdW53YW50ZWQgc3VycHJpc2VkIChpLmUgdGhlIFBhZ2UtdGFibGUgbm90IAo+PiBpbiBzeW5j
IHdpdGggdGhlIHZtYXAgc3RhdGUpLgo+Pgo+PiBXZSBwb3RlbnRpYWxseSB3YW50IHRvIGFkZCBz
b21lIEFTU0VSVF9VTlJFQUNIQUJMRSgpIGluIHRoZSBwYWdlLXRhYmxlIAo+PiBjb2RlIGZvciB0
aGUgc2FuaXR5IGNoZWNrLiBTbyB3ZSBkb24ndCBjb250aW51ZSB3aXRob3V0IGZ1cnRoZXIgb24g
Cj4+IGRlYnVnIGJ1aWxkLiBJIHdpbGwgaGF2ZSBhIGxvb2sgYXQgYm90aC4KPj4KPj4gQSBjb3Vw
bGUgb2YgY29tbWVudHMgZm9yIHRoZSBwYXRjaC4KPj4KPj4gVGl0bGU6IE5JVDogTWlzc2luZyBz
cGFjZSBhZnRlciB0aGUgZmlyc3QgOi4KPj4KPj4gT24gMTgvMDcvMjAxOSAxNDoyMiwgQW5kcmlp
IEFuaXNvdiB3cm90ZToKPj4+IEZyb206IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBh
bS5jb20+Cj4+Pgo+Pj4gQWZ0ZXIgY2hhbmdlcyBpbnRyb2R1Y2VkIGJ5IDljYzA2MTggd2UgYXJl
IGFibGUgdG8gdm1hcC92dW5tYXAKPj4KPj4gNy1kaWdpdCBpcyBub3Qgc3VmZmljaWVudCB0byBn
dWFyYW50ZWUgaXQgd2lsbCBiZSB1bmlxIGluIHRoZSBmdXR1cmUuIAo+PiBZb3UgYWxzbyB3YW50
IHRvIHNwZWNpZnkgdGhlIGNvbW1pdCB0aXRsZS4KPj4KPj4+IHBhZ2UgYWxpZ25lZCBhZGRyZXNz
ZXMgb25seS4KPj4+IFNvIGlmIHdlIGFkZCBhIHBhZ2UgYWRkcmVzcyByZW1haW5kZXIgdG8gdGhl
IG1hcHBlZCB2aXJ0dWFsIGFkZHJlc3MsCj4+PiB3ZSBoYXZlIHRvIG1hc2sgaXQgb3V0IGJlZm9y
ZSB1bm1hcHBpbmcuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlp
X2FuaXNvdkBlcGFtLmNvbT4KPj4KPj4gQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxMQGFybS5jb20+Cj4+Cj4+Cj4+IElmIHlvdSBhcmUgaGFwcHkgd2l0aCB0aGUgY2hhbmdlcywg
SSBjYW4gZG8gdGhlbSBvbiBjb21taXQuCj4gCj4gSXQncyBmaW5lIHdpdGggbWUuCj4gVGhhbmsg
eW91LgoKTm93IGNvbW1pdHRlZC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
