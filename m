Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 753511094B3
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 21:38:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZL5X-0001PB-81; Mon, 25 Nov 2019 20:36:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZR4G=ZR=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1iZL5V-0001P6-5r
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 20:36:01 +0000
X-Inumbo-ID: 301c735f-0fc3-11ea-a395-12813bfff9fa
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 301c735f-0fc3-11ea-a395-12813bfff9fa;
 Mon, 25 Nov 2019 20:36:00 +0000 (UTC)
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
References: <20191125183520.126404-1-jeff.kubascik@dornerworks.com>
 <091f3626-8ee4-81bd-5031-3b57cf038b57@xen.org>
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
Message-ID: <74f9c8f5-ceb2-45b0-efe2-36ddf251038d@dornerworks.com>
Date: Mon, 25 Nov 2019 15:36:48 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <091f3626-8ee4-81bd-5031-3b57cf038b57@xen.org>
Content-Language: en-US
X-Originating-IP: [172.27.13.171]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_0_4
X-Spam-Flag: NO
Subject: Re: [Xen-devel] [PATCH] xen/arm: initialize vpl011 flag register
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpPbiAxMS8yNS8yMDE5IDI6MjAgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSwK
PiAKPiBPbiAyNS8xMS8yMDE5IDE4OjM1LCBKZWZmIEt1YmFzY2lrIHdyb3RlOgo+PiBUaGUgdHgv
cnggZmlmbyBmbGFncyB3ZXJlIG5vdCBzZXQgd2hlbiB0aGUgdnBsMDExIGlzIGluaXRpYWxpemVk
LiBUaGlzCj4+IGlzIGEgcHJvYmxlbSBmb3IgY2VydGFpbiBndWVzdHMgdGhhdCBhcmUgb3BlcmF0
aW5nIGluIHBvbGxlZCBtb2RlLCBhcyBhCj4+IGd1ZXN0IHdpbGwgZ2VuZXJhbGx5IGNoZWNrIHRo
ZSByeCBmaWZvIGVtcHR5IGZsYWcgdG8gZGV0ZXJtaW5lIGlmIHRoZXJlCj4+IGlzIGRhdGEgYmVm
b3JlIGRvaW5nIGEgcmVhZC4gVGhlIHJlc3VsdCBpcyBhIGNvbnRpbnVvdXMgc3BhbSBvZiB0aGUK
Pj4gbWVzc2FnZSAidnBsMDExOiBVbmV4cGVjdGVkIElOIHJpbmcgYnVmZmVyIGVtcHR5IiBiZWZv
cmUgdGhlIGZpcnN0IHZhbGlkCj4+IGNoYXJhY3RlciBpcyByZWNlaXZlZC4gVGhpcyBpbml0aWFs
aXplcyB0aGUgZmxhZyBzdGF0dXMgcmVnaXN0ZXIgdG8gdGhlCj4+IGRlZmF1bHQgc3BlY2lmaWVk
IGluIHRoZSBQTDAxMSB0ZWNobmljYWwgcmVmZXJlbmNlIG1hbnVhbC4KPiAKPiBOb3RlIHRoYXQg
dGhlIHZwbDAxMSBpcyBub3QgbWVhbnQgdG8gZW11bGF0ZSBhIGZ1bGwgUEwwMTEuIEluc3RlYWQg
aXQKPiBlbXVsYXRlcyB0aGUgU0JTQSBVQVJUIHdoaWNoIGlzIGEgc3Vic2V0IG9mIHRoZSBQTDAx
MS4gVGhleSBoYXZlIHNvbWUKPiBkaWZmZXJlbmNlcyBhbmQgSSB3b3VsZCBiZSBjYXV0aW91cyB0
byB0cnkgdG8gZHJpdmUgaXQgYXMgYSBQTDAxMS4KCkkgd2FzIG5vdCBhd2FyZSBvZiB0aGlzLCBi
dXQgaXQgbWFrZXMgc2Vuc2UuIEkgdG9vayBhIHF1aWNrIHBlZWsgYXQgdGhlIFNCU0EKZGVzaWdu
IGRvYyBhbmQgdGhlIGZpZm8gZmxhZ3MgYXJlIGRlZmluZWQuCgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBKZWZmIEt1YmFzY2lrIDxqZWZmLmt1YmFzY2lrQGRvcm5lcndvcmtzLmNvbT4KPj4gLS0tCj4+
ICAgeGVuL2FyY2gvYXJtL3ZwbDAxMS5jIHwgMiArKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92cGwwMTEuYyBiL3hl
bi9hcmNoL2FybS92cGwwMTEuYwo+PiBpbmRleCA3YmM1ZWViMjA3Li4zMWI3ZDU2ZDdkIDEwMDY0
NAo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdnBsMDExLmMKPj4gKysrIGIveGVuL2FyY2gvYXJtL3Zw
bDAxMS5jCj4+IEBAIC02MjYsNiArNjI2LDggQEAgaW50IGRvbWFpbl92cGwwMTFfaW5pdChzdHJ1
Y3QgZG9tYWluICpkLCBzdHJ1Y3QgdnBsMDExX2luaXRfaW5mbyAqaW5mbykKPj4gICAgICAgaWYg
KCB2cGwwMTEtPmJhY2tlbmQuZG9tLnJpbmdfYnVmICkKPj4gICAgICAgICAgIHJldHVybiAtRUlO
VkFMOwo+Pgo+PiArICAgIHZwbDAxMS0+dWFydGZyID0gVFhGRSB8IFJYRkU7Cj4gCj4gSSBrbm93
IHRoYXQgaXQgZG9lcyBub3QgbWFrZSBtdWNoIGRpZmZlcmVuY2UsIGJ1dCBJIHdvdWxkIHByZWZl
ciBpZgo+IHVhcnRmciBpcyBpbml0aWFsaXplZCBvbmNlIHdlIGtub3cgbm90aGluZyBlbHNlIGNh
biBmYWlsLgoKRWFzeSBlbm91Z2ggY2hhbmdlLCBJJ2xsIHNlbmQgb3V0IGFuIHVwZGF0ZWQgcGF0
Y2guCgo+IFdpdGggb3Igd2l0aG91dCB0aGlzIHN1Z2dlc3Rpb246Cj4gCj4gQWNrZWQtYnk6IEp1
bGllbiBHcmFsIDxqdWxpZW5AeGVuLm9yZz4KPiAKPiBDaGVlcnMsCj4gCj4gLS0KPiBKdWxpZW4g
R3JhbGwKPiAKClRoYW5rcyEKSmVmZiBLdWJhc2NpawoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
