Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7563C059
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 02:11:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haULp-00074s-Kw; Tue, 11 Jun 2019 00:09:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tchP=UK=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1haULn-00074n-EU
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 00:09:19 +0000
X-Inumbo-ID: 2494d176-8bdd-11e9-9a25-230c5dbd502f
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2494d176-8bdd-11e9-9a25-230c5dbd502f;
 Tue, 11 Jun 2019 00:09:14 +0000 (UTC)
Received: from [192.168.51.47] (61.161.186.150) by mxnavi-mail.mxnavi.com
 (116.90.87.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 11 Jun
 2019 08:06:03 +0800
To: Julien Grall <julien.grall@arm.com>, <xen-devel@lists.xenproject.org>
References: <f235adc97e71b4814a030969a82dc48f@sslemail.net>
 <c7476978-3c46-05b3-db0e-c7ac28c344d9@arm.com>
From: chenbaodong <chenbaodong@mxnavi.com>
Message-ID: <77b7d94b-35c8-6b28-075e-7096c5356373@mxnavi.com>
Date: Tue, 11 Jun 2019 08:09:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c7476978-3c46-05b3-db0e-c7ac28c344d9@arm.com>
Content-Language: en-US
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: Re: [Xen-devel] [PATCH] xen/arm: domain: remove redundant memset
 for arch's saved_context when creating vcpu
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
Cc: Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDYvMTEvMTkgMDQ6MTEsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSwKPgo+IFRoYW5rIHlv
dSBmb3IgdGhlIHBhdGNoLiBUaGUgdGl0bGUgc2hvdWxkIGJlIGF0IG1heCA4MCBjaGFyYWN0ZXJz
LiBTbyAKPiBob3cgYWJvdXQgdGhlIGZvbGxvd2luZyB0aXRsZT8KPgo+ICJ4ZW4vYXJtOiBkb21h
aW46IFJlbW92ZSByZWR1bmRhbnQgbWVtc2V0IGZvciB2LT5hcmNoLnNhdmVkX2NvbnRleHQiCk1h
eCA4MCBjaGFyYWN0ZXJzLCByb2dlciB0aGF0Lgo+Cj4gT24gNi8xMC8xOSA2OjE1IEFNLCBCYW9k
b25nIENoZW4gd3JvdGU6Cj4+IEFscmVhZHkgZG9uZSBieSBjbGVhcl9wYWdlKCkgaW4gYWxsb2Nf
dmNwdV9zdHJ1Y3QoKQo+Cj4gUGxlYXNlIHRyeSB0byBtYWtlIHNlbnRlbmNlIGluIHRoZSBjb21t
aXQgbWVzc2FnZS4gRm9yIGhlcmUgSSB3b3VsZCAKPiBzdWdnZXN0Ogo+Cj4gInYtPmFyY2guc2F2
ZWRfY29udGV4dCBpcyBhbHJlYWR5IHplcm9lZCBpbiBhbGxvY192Y3B1X3N0cnVjdCgpIGJ5IAo+
IGNsZWFyX3BhZ2UoKS4gU28gdGhlcmUgYXJlIG5vIG5lZWQgdG8gbWVtc2V0IGl0IGFnYWluIGlu
IAo+IGFyY2hfdmNwdV9jcmVhdGUoKS4iCj4KPiBJZiB5b3UgYXJlIGhhcHB5IHdpdGggdGhlIHR3
byBjaGFuZ2VzLCBJIGNhbiBkbyB0aGVtIG9uIGNvbW1pdC4KVGhhbmtzLCBwbGVhc2UuCj4KPiBD
aGVlcnMsCj4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQmFvZG9uZyBDaGVuIDxjaGVuYmFvZG9uZ0Bt
eG5hdmkuY29tPgo+PiAtLS0KPj4gwqAgeGVuL2FyY2gvYXJtL2RvbWFpbi5jIHwgMSAtCj4+IMKg
IDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vZG9tYWluLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluLmMKPj4gaW5kZXggZmYzMzBiMy4u
YWQxYjEwNiAxMDA2NDQKPj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbi5jCj4+ICsrKyBiL3hl
bi9hcmNoL2FybS9kb21haW4uYwo+PiBAQCAtNTU3LDcgKzU1Nyw2IEBAIGludCBhcmNoX3ZjcHVf
Y3JlYXRlKHN0cnVjdCB2Y3B1ICp2KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC0gc2l6ZW9mKHN0cnVjdCBjcHVfaW5mbykpOwo+PiDCoMKgwqDCoMKgIG1lbXNldCh2LT5hcmNo
LmNwdV9pbmZvLCAwLCBzaXplb2YoKnYtPmFyY2guY3B1X2luZm8pKTsKPj4gwqAgLcKgwqDCoCBt
ZW1zZXQoJnYtPmFyY2guc2F2ZWRfY29udGV4dCwgMCwgc2l6ZW9mKHYtPmFyY2guc2F2ZWRfY29u
dGV4dCkpOwo+PiDCoMKgwqDCoMKgIHYtPmFyY2guc2F2ZWRfY29udGV4dC5zcCA9IChyZWdpc3Rl
cl90KXYtPmFyY2guY3B1X2luZm87Cj4+IMKgwqDCoMKgwqAgdi0+YXJjaC5zYXZlZF9jb250ZXh0
LnBjID0gKHJlZ2lzdGVyX3QpY29udGludWVfbmV3X3ZjcHU7Cj4+Cj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
