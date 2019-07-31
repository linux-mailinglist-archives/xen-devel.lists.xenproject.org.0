Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FA07C53E
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 16:45:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hspoX-0002GL-3E; Wed, 31 Jul 2019 14:42:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8Zog=V4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hspoV-0002GG-TW
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 14:42:47 +0000
X-Inumbo-ID: 7616192d-b3a1-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 7616192d-b3a1-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 14:42:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F64E344;
 Wed, 31 Jul 2019 07:42:46 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C84B3F73D;
 Wed, 31 Jul 2019 07:42:45 -0700 (PDT)
To: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1564371527.git.stewart.hildebrand@dornerworks.com>
 <2473fc46a8229bb2434a90a510136202e7479177.1564371527.git.stewart.hildebrand@dornerworks.com>
 <bca49f6e-7e01-f2d0-b309-9f0dccd70860@arm.com>
 <d502ff01019443ebb5f3edbaafd2671d@dornerworks.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <77c1b8a5-e594-4da0-7b32-c9836745cb03@arm.com>
Date: Wed, 31 Jul 2019 15:42:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d502ff01019443ebb5f3edbaafd2671d@dornerworks.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen/arm: platform: Add Raspberry Pi
 platform
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
Cc: Andre Przywara <andre.przywara@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAzMS8wNy8yMDE5IDE0OjU1LCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6Cj4gT24g
V2VkbmVzZGF5LCBKdWx5IDMxLCAyMDE5IDg6MDQgQU0sIEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+IHdyb3RlOgo+PiBIaSBTdGV3YXJ0LAo+IAo+IEhpIEp1bGllbgo+IAo+PiBP
biAyOS8wNy8yMDE5IDE0OjE5LCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6Cj4+PiBUaGUgYXV4
IHBlcmlwaGVyYWxzICh1YXJ0MSwgc3BpMSwgYW5kIHNwaTIpIHNoYXJlIGFuIElSUSBhbmQgYSBw
YWdlIG9mCj4+PiBtZW1vcnkuIEZvciBkZWJ1Z2dpbmcsIGl0IGlzIGhlbHBmdWwgdG8gdXNlIHRo
ZSBhdXggVUFSVCBpbiBYZW4uIEluCj4+PiB0aGlzIGNhc2UsIFhlbiB3b3VsZCB0cnkgdG8gYXNz
aWduIHNwaTEgYW5kIHNwaTIgdG8gZG9tMCwgYnV0IHRoaXMKPj4+IHJlc3VsdHMgaW4gYW4gZXJy
b3Igc2luY2UgdGhlIHNoYXJlZCBJUlEgd2FzIGFscmVhZHkgYXNzaWduZWQgdG8gWGVuLgo+Pj4g
QmxhY2tsaXN0IGF1eCBkZXZpY2VzIG90aGVyIHRoYW4gdGhlIFVBUlQgdG8gcHJldmVudCBtYXBw
aW5nIHRoZSBzaGFyZWQKPj4+IElSUSBhbmQgbWVtb3J5IHJhbmdlIHRvIGRvbTAuCj4+Cj4+IFJl
YWRpbmcgdGhlIGNvbW1pdCBtZXNzYWdlLCBpdCBpcyB1bmNsZWFyIHdoYXQncyB0aGUgaW1wYWN0
IG9uIGJsYWNrbGlzdCBzcGkxCj4+IGFuZCBzcGkyLiBDb3VsZCB5b3UgZXhwYW5kIGl0Pwo+IAo+
IFllcywgZ29vZCB0aGlua2luZy4gV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgdGhlIGZvbGxvd2lu
ZyAodGhlIGZpcnN0IHBhcmFncmFwaCBpcyB1bmNoYW5nZWQsIGp1c3QgY29waWVkIGZvciBjb21w
bGV0ZW5lc3MpOgo+IAo+ICJUaGUgYXV4IHBlcmlwaGVyYWxzICh1YXJ0MSwgc3BpMSwgYW5kIHNw
aTIpIHNoYXJlIGFuIElSUSBhbmQgYSBwYWdlIG9mCj4gbWVtb3J5LiBGb3IgZGVidWdnaW5nLCBp
dCBpcyBoZWxwZnVsIHRvIHVzZSB0aGUgYXV4IFVBUlQgaW4gWGVuLiBJbgo+IHRoaXMgY2FzZSwg
WGVuIHdvdWxkIHRyeSB0byBhc3NpZ24gc3BpMSBhbmQgc3BpMiB0byBkb20wLCBidXQgdGhpcwo+
IHJlc3VsdHMgaW4gYW4gZXJyb3Igc2luY2UgdGhlIHNoYXJlZCBJUlEgd2FzIGFscmVhZHkgYXNz
aWduZWQgdG8gWGVuLgo+IEJsYWNrbGlzdCBhdXggZGV2aWNlcyBvdGhlciB0aGFuIHRoZSBVQVJU
IHRvIHByZXZlbnQgbWFwcGluZyB0aGUgc2hhcmVkCj4gSVJRIGFuZCBtZW1vcnkgcmFuZ2UgdG8g
ZG9tMC4KPiAKPiBCbGFja2xpc3Rpbmcgc3BpMSBhbmQgc3BpMiB1bmZvcnR1bmF0ZWx5IG1ha2Vz
IHRob3NlIHBlcmlwaGVyYWxzCj4gdW5hdmFpbGFibGUgZm9yIHVzZSBpbiB0aGUgc3lzdGVtLiBG
dXR1cmUgd29yayBjb3VsZCBpbmNsdWRlIGZvcndhcmRpbmcKPiB0aGUgSVJRIGZvciBzcGkxIGFu
ZCBzcGkyLCBhbmQgdHJhcCBhbmQgbWVkaWF0ZSBhY2Nlc3MgdG8gdGhlIG1lbW9yeQo+IHJhbmdl
IGZvciBzcGkxIGFuZCBzcGkyLiIKCk9rLCBzbyB0aGV5IGFyZSBub3QgY3JpdGljYWwgdG8gYm9v
dCBEb20wLiBHb29kIDopLgoKSG9wZWZ1bGx5IHRoZXkgd2lsbCBsZWFybiB0aGUgbGVzc29uIGZv
ciB0aGUgbmV4dCBnZW5lcmF0aW9uIQoKPiAKPiBXb3VsZCB5b3UgbGlrZSBtZSB0byByZS1zZW5k
IHRoZSBwYXRjaCwgb3IgY2FuIHRoZSBtZXNzYWdlIGJlIHVwZGF0ZWQgb24gY29tbWl0PwoKTm8s
IEkgd2lsbCB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlIGFuZCBjb21taXQgaXQgbGF0ZXIgb24g
dG9kYXkuCgpXaXRoIHRoZSBuZXcgY29tbWl0IG1lc3NhZ2U6CgpBY2tlZC1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
