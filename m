Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC87C20E28
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 19:43:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRKMf-0007N4-NC; Thu, 16 May 2019 17:40:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vv4c=TQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hRKMe-0007Mz-5J
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 17:40:20 +0000
X-Inumbo-ID: abd7a900-7801-11e9-a37a-9b57924ebf34
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id abd7a900-7801-11e9-a37a-9b57924ebf34;
 Thu, 16 May 2019 17:40:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CB3119BF;
 Thu, 16 May 2019 10:40:18 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 815473F5AF;
 Thu, 16 May 2019 10:40:16 -0700 (PDT)
To: Viktor Mitin <viktor.mitin.19@gmail.com>, xen-devel@lists.xenproject.org
References: <20190516132016.8032-1-viktor.mitin.19@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <37a3a6c6-7de4-e496-5619-00f31e8e338f@arm.com>
Date: Thu, 16 May 2019 18:40:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190516132016.8032-1-viktor.mitin.19@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] coverage: filter out libfdt.o and
 libelf.o
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVmlrdG9yLAoKVGhhbmsgeW91IGZvciB0aGUgcXVpY2sgcmVzcGluLiBJIGhhdmUgc29tZSBj
b21tZW50cyBiZWxvdyByZWdhcmRpbmcgdGhlIGNvbW1pdCAKbWVzc2FnZSBhbmQgcHJvY2Vzcy4K
Ck9uIDE2LzA1LzIwMTkgMTQ6MjAsIFZpa3RvciBNaXRpbiB3cm90ZToKPiBUaGUgcGF0Y2ggcmVz
b2x2ZXMgJ3hlbmNvdicgY3Jhc2hlcyBpbiBjYXNlIG9mIEFhcmNoNjQuCj4gCj4gQWxsIHRoZSAu
aW5pdC4qIHNlY3Rpb25zIGFyZSBzdHJpcHBlZCBhZnRlciBib290LAo+IGl0IG1lYW5zIHRoYXQg
YW55dGhpbmcgaW4gLmluaXQuZGF0YSBjYW5ub3QgYmUgYWNjZXNzZWQgYW55bW9yZS4KPiBUaGUg
YnVpbGQgc3lzdGVtIGV4cGxpY2l0bHkgY29tcGlsZXMgYW55IC5pbml0IGJpbmFyeSB3aXRob3V0
IGdjb3Ygb3B0aW9uLgo+IFRoZSBwcm9ibGVtIGlzIGNvbWluZyBmcm9tIGxpYmZkdCBhbmQgbGli
ZWxmLgoKVGhpcyBpcyBub3QgZW50aXJlbHkgY29ycmVjdCwgbGliZWxmIGlzIG5vdCBidWlsdCBm
b3IgQXJtIHNvIGl0IGNhbid0IGNhdXNlIGEgCmNyYXNoLiBIb3dldmVyIGxpYmVsZiBleHBvc2Vz
IHRoZSBzYW1lIHByb2JsZW0gYXMgbGliZmR0LgoKPiBUaGUgZW50aXJlIGxpYnJhcnkgaXMgbW92
ZWQgdG8gLmluaXQgdXNpbmc6CgpUaGUgc2VudGVuY2UgaGVyZS4uLgoKPiAkKE9CSkNPUFkpICQo
Zm9yZWFjaCBzLCQoU0VDVElPTlMpLC0tcmVuYW1lLXNlY3Rpb24gLiQocyk9LmluaXQuJChzKSkg
JDwgJEAKCi4uLiBkb2VzIG5vdCBtYXRjaCB0aGUgY29tbWFuZCBoZXJlLiAkKFNFQ1RJT05TKSBv
bmx5IGNvbnRhaW4gYSBzdWJzZXQgb2YgYWxsIAp0aGUgc2VjdGlvbnMuIEZvciBpbnN0YW5jZSwg
QlNTIGlzIG5vdCByZW5hbWVkLgoKVGhpcyBpcyB0aGUgcmVhc29uIHdoeSB0aGUgaXNzdWVzIGlz
IG5vdCBzZWVuIG9uIHg4Ni4gTGliZWxmIHNlZW1zIHRvIGhhdmUgYWxsIApHQ09WIHZhcmlhYmxl
cyBpbiByZWdpb24gbm90IHJlbmFtZWQuCgo+IFNvIHdlIG5lZWQgdG8gdGVsbCB0aGUgdG9wIE1h
a2VmaWxlIHRvIGZpbHRlciBvdXQgbGliZmR0IGFuZCBsaWJlbGYuCgpIb3cgYWJvdXQgdGhlIGZv
bGxvd2luZyBjb21taXQgbWVzc2FnZToKCiJjb3ZlcmFnZTogZmlsdGVyIG91dCBsaWJmZHQubyBs
aWJlbGYubwoKV2hpbGUgdGhlIGJ1aWxkIHN5c3RlbSBleHBsaWNpdGx5IGNvbXBpbGVzIGFueSAu
aW5pdCBvYmplY3Qgd2l0aG91dCBnY292IG9wdGlvbiwgCnRoaXMgZG9lcyBub3QgY292ZXIgdGhl
IGxpYnJhcmllcyBsaWJmZHQgYW5kIGxpYmVsZi4gVGhpcyBpcyBiZWNhdXNlIHRoZSB0d28KbGli
cmFyaWVzIGFyZSBidWlsdCBub3JtYWxseSBhbmQgdGhlbiBzb21lIHNlY3Rpb25zIHdpbGwgaGF2
ZSAuaW5pdCBhcHBlbmQuCgpBcyBjb3ZlcmFnZSB3aWxsIGJlIGVuYWJsZWQgZm9yIGxpYmZkdCwg
c29tZSBvZiB0aGUgR0NPViBjb3VudGVycyBtYXkgYmUgc3RvcmVkIAppbiBhIHNlY3Rpb24gdGhh
dCB3aWxsIGJlIHN0cmlwcGVkIGFmdGVyIGluaXQuIE9uIEFybTY0LCB0aGlzIHdpbGwgcmVsaWFi
bHkgCnJlc3VsdCB0byBhIGNyYXNoIHdoZW4gJ3hlbmNvdicgd2lsbCBhc2sgdG8gcmVzZXQgdGhl
IGNvdW50ZXJzLgoKSW50ZXJlc3RpbmdseSwgb24geDg2LCBhbGwgdGhlIGNvdW50ZXJzIGZvciBs
aWJlbGYgc2VlbXMgdG8gYmUgaW4gc2VjdGlvbnMgdGhhdCAKd2lsbCBub3QgYmUgcmVuYW1lZCBz
byBmYXIuIEhlbmNlLCB3aHkgdGhpcyB3YXMgbm90IGRpc2NvdmVyZWQgYmVmb3JlLiBCdXQgdGhp
cyAKaXMgYSBsYXRlbnQgYnVnLgoKQXMgdGhlIHR3byBsaWJyYXJpZXMgY2FuIG9ubHkgYmUgdXNl
ZCBhdCBib290LCBpdCBpcyBmaW5lIHRvIGRpc2FibGUgY292ZXJhZ2UgCmZvciB0aGUgZW50aXJl
IGxpYnJhcnkuCiIKCj4gCj4gUmVwb3J0ZWQtYnk6IFZpa3RvciBNaXRpbiA8dmlrdG9yLm1pdGlu
LjE5QGdtYWlsLmNvbT4KPiBTdWdnZXN0ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVmlrdG9yIE1pdGluIDx2aWt0b3IubWl0aW4uMTlA
Z21haWwuY29tPgo+IEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgo+IFJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKUmV2
aWV3ZWQtYnkgdGFnIG1lYW4gdGhlIHBlcnNvbiBoYXMgY2FyZWZ1bGx5IHJldmlld2VkIHlvdXIg
Y29kZSBhbmQgaXMgaGFwcHkgCndpdGggaXQuIEFzIHlvdSBleHRlbmQgdGhlIHB1cnBvc2Ugb2Yg
dGhlIHBhdGNoLCBpdCBpcyBjdXN0b20gdG8gZWl0aGVyIHJlbW92ZSAKdGhlIHRhZyBvciBhc2sg
dGhlIHBlcnNvbiBpcyBoYXBweSB3aXRoIHRoZSBjaGFuZ2UuIEZvciB0aGlzIHRpbWUsIEkgaGF2
ZSBhc2tlZCAKV2VpIG9uIElSQyBhbmQgaGUgaXMgc3RpbGwgaGFwcHkgd2l0aCBpdC4KCj4gVGVz
dGVkLWJ5OiBWaWt0b3IgTWl0aW4gPHZpa3Rvci5taXRpbi4xOUBnbWFpbC5jb20+CgpZb3UgYXJl
IHRoZSBhdXRob3Igb2YgdGhlIHBhdGNoLCBzbyBpdCBpcyBub3QgbmVjZXNzYXJ5LiBJZiB5b3Ug
c2VuZCBhIHBhdGNoIHlvdSAKdXN1YWxseSB0ZXN0IGl0IGFuZCB0aGVyZWZvcmUgdGhlIG1lYW5p
bmcgc29ydCBvZiBjYXJyaWVkIGluIHNpZ25lZC1vZmYtYnkgOikuCgpObyBuZWVkIHRvIHJlc2Vu
ZCB0aGUgcGF0Y2gsIEkgY2FuIGRvIHRoZSBtb2RpZmljYXRpb24gd2hlbiBJIHdpbGwgY29tbWl0
IHRoZSBwYXRjaC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
