Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A3AD2E09
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 17:45:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIaX1-0001SA-Ot; Thu, 10 Oct 2019 15:39:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=njQE=YD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iIaX0-0001S4-Hm
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 15:39:10 +0000
X-Inumbo-ID: 1a021858-eb74-11e9-8aca-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 1a021858-eb74-11e9-8aca-bc764e2007e4;
 Thu, 10 Oct 2019 15:39:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E564337;
 Thu, 10 Oct 2019 08:39:09 -0700 (PDT)
Received: from [10.1.39.39] (e110479-lin.cambridge.arm.com [10.1.39.39])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 970383F6C4;
 Thu, 10 Oct 2019 08:39:08 -0700 (PDT)
To: Brian Woods <brian.woods@xilinx.com>, xen-devel@lists.xenproject.org
References: <1570650447-3225-1-git-send-email-brian.woods@xilinx.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <4da9c328-3968-5d46-6000-73e824b26962@arm.com>
Date: Thu, 10 Oct 2019 16:39:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1570650447-3225-1-git-send-email-brian.woods@xilinx.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: add warning if memory modules
 overlap
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQnJpYW4sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIDEwLzkvMTkgODo0NyBQTSwg
QnJpYW4gV29vZHMgd3JvdGU6Cj4gSXQncyBwb3NzaWJsZSBmb3IgYSBtaXNjb25maWd1cmVkIGRl
dmljZSB0cmVlIHRvIGNhdXNlIFhlbiB0byBjcmFzaCB3aGVuCj4gdGhlcmUgYXJlIG92ZXJsYXBw
aW5nIGFkZHJlc3NlcyBpbiB0aGUgbWVtb3J5IG1vZHVsZXMuICBBZGQgYSB3YXJuaW5nCj4gd2hl
biBwcmludGluZyB0aGUgYWRkcmVzc2VzIHRvIGxldCB0aGUgdXNlciBrbm93IHRoZXJlJ3MgYSBw
b3NzaWJsZQo+IGlzc3VlIHdoZW4gREVCVUcgaXMgZW5hYmxlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAeGlsaW54LmNvbT4KPiAtLS0KPiBzYW1wbGUgb3V0
cHV0Ogo+IC4uLgo+IChYRU4pIE1PRFVMRVswXTogMDAwMDAwMDAwMTQwMDAwMCAtIDAwMDAwMDAw
MDE1M2I4ZjEgWGVuCj4gKFhFTikgTU9EVUxFWzFdOiAwMDAwMDAwMDA3NmQyMDAwIC0gMDAwMDAw
MDAwNzZkYzA4MCBEZXZpY2UgVHJlZQo+IChYRU4pIE1PRFVMRVsyXTogMDAwMDAwMDAwNzZkZjAw
MCAtIDAwMDAwMDAwMDdmZmYzNjQgUmFtZGlzawo+IChYRU4pIE1PRFVMRVszXTogMDAwMDAwMDAw
MDA4MDAwMCAtIDAwMDAwMDAwMDMxODAwMDAgS2VybmVsCj4gKFhFTikgIFJFU1ZEWzBdOiAwMDAw
MDAwMDA3NmQyMDAwIC0gMDAwMDAwMDAwNzZkYzAwMAo+IChYRU4pICBSRVNWRFsxXTogMDAwMDAw
MDAwNzZkZjAwMCAtIDAwMDAwMDAwMDdmZmYzNjQKPiAoWEVOKQo+IChYRU4pIFdBUk5JTkc6IG1v
ZHVsZXMgWGVuICAgICAgICAgIGFuZCBLZXJuZWwgICAgICAgb3ZlcmxhcAo+IChYRU4pCj4gKFhF
TikgQ29tbWFuZCBsaW5lOiBjb25zb2xlPWR0dWFydCBkdHVhcnQ9c2VyaWFsMCBkb20wX21lbT0x
RyBib290c2NydWI9MCBtYXhjcHVzPTEgdGltZXJfc2xvcD0wCj4gLi4uCj4gCj4gICB4ZW4vYXJj
aC9hcm0vYm9vdGZkdC5jIHwgMTcgKysrKysrKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxNyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9ib290ZmR0
LmMgYi94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jCj4gaW5kZXggMDhmYjU5Zi4uM2NiMGM0MyAxMDA2
NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jCj4gKysrIGIveGVuL2FyY2gvYXJtL2Jv
b3RmZHQuYwo+IEBAIC0zODcsNiArMzg3LDIzIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBlYXJseV9w
cmludF9pbmZvKHZvaWQpCj4gICAgICAgICAgICAgICAgICBtZW1fcmVzdi0+YmFua1tqXS5zdGFy
dCArIG1lbV9yZXN2LT5iYW5rW2pdLnNpemUgLSAxKTsKPiAgICAgICB9Cj4gICAgICAgcHJpbnRr
KCJcbiIpOwo+ICsKPiArI2lmbmRlZiBOREVCVUcKPiArICAgIC8qCj4gKyAgICAgKiBBc3N1bWlu
ZyBhbGwgY29tYmluYXRpb25zIGFyZSBjaGVja2VkLCBvbmx5IHRoZSBzdGFydGluZyBhZGRyZXNz
Cj4gKyAgICAgKiBoYXMgdG8gYmUgY2hlY2tlZCBpZiBpdCdzIGluIGFub3RoZXIgbWVtb3J5IG1v
ZHVsZSdzIHJhbmdlLgo+ICsgICAgICovCj4gKyAgICBmb3IgKCBpID0gMCA7IGkgPCBtb2RzLT5u
cl9tb2RzOyBpKysgKQo+ICsgICAgICAgIGZvciAoIGogPSAwIDsgaiA8IG1vZHMtPm5yX21vZHM7
IGorKyApCj4gKyAgICAgICAgICAgIGlmICggKGkgIT0gaikgJiYKPiArICAgICAgICAgICAgICAg
ICAobW9kcy0+bW9kdWxlW2ldLnN0YXJ0ID49IG1vZHMtPm1vZHVsZVtqXS5zdGFydCkgJiYKPiAr
ICAgICAgICAgICAgICAgICAobW9kcy0+bW9kdWxlW2ldLnN0YXJ0IDwKPiArICAgICAgICAgICAg
ICAgICAgbW9kcy0+bW9kdWxlW2pdLnN0YXJ0ICsgbW9kcy0+bW9kdWxlW2pdLnNpemUpICkKPiAr
ICAgICAgICAgICAgICAgIHByaW50aygiV0FSTklORzogbW9kdWxlcyAlLTEycyBhbmQgJS0xMnMg
b3ZlcmxhcFxuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICBib290X21vZHVsZV9raW5kX2Fz
X3N0cmluZyhtb2RzLT5tb2R1bGVbaV0ua2luZCksCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
Ym9vdF9tb2R1bGVfa2luZF9hc19zdHJpbmcobW9kcy0+bW9kdWxlW2pdLmtpbmQpKTsKCkkgYW0g
bm90IGVudGlyZWx5IGhhcHB5IHdpdGggdGhlIGRvdWJsZSBmb3ItbG9vcCBoZXJlLgoKQXMgd2Ug
YWxyZWFkeSBnbyB0aHJvdWdoIGFsbCB0aGUgbW9kdWxlcyBpbiBhZGRfYm9vdF9tb2R1bGUoKS4g
Q291bGQgeW91IApsb29rIHdoZXRoZXIgdGhpcyBjaGVjayBjb3VsZCBiZSBwYXJ0IG9mIGl0PwoK
VGhpcyBzaG91bGQgYWxzbyBhbGxvdyB0byBoYXZlIHRoaXMgY2hlY2sgZm9yIG5vbi1kZWJ1ZyBi
dWlsZCBhcyB3ZWxsLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
