Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E173CD02
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 15:32:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hagqa-0003MT-Ny; Tue, 11 Jun 2019 13:29:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SowN=UK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hagqZ-0003MG-3d
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 13:29:55 +0000
X-Inumbo-ID: fd38e494-8c4c-11e9-9c9f-439301f6b12a
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id fd38e494-8c4c-11e9-9c9f-439301f6b12a;
 Tue, 11 Jun 2019 13:29:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C0DD346;
 Tue, 11 Jun 2019 06:29:50 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D74083F557;
 Tue, 11 Jun 2019 06:29:49 -0700 (PDT)
To: chenbaodong <chenbaodong@mxnavi.com>, xen-devel@lists.xenproject.org
References: <f235adc97e71b4814a030969a82dc48f@sslemail.net>
 <c7476978-3c46-05b3-db0e-c7ac28c344d9@arm.com>
 <77b7d94b-35c8-6b28-075e-7096c5356373@mxnavi.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <70763d79-0259-a340-ce9b-477d308629e4@arm.com>
Date: Tue, 11 Jun 2019 14:29:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <77b7d94b-35c8-6b28-075e-7096c5356373@mxnavi.com>
Content-Language: en-US
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

CgpPbiAxMS8wNi8yMDE5IDAxOjA5LCBjaGVuYmFvZG9uZyB3cm90ZToKPiAKPiBPbiA2LzExLzE5
IDA0OjExLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBUaGFuayB5b3UgZm9yIHRo
ZSBwYXRjaC4gVGhlIHRpdGxlIHNob3VsZCBiZSBhdCBtYXggODAgY2hhcmFjdGVycy4gU28gaG93
IAo+PiBhYm91dCB0aGUgZm9sbG93aW5nIHRpdGxlPwo+Pgo+PiAieGVuL2FybTogZG9tYWluOiBS
ZW1vdmUgcmVkdW5kYW50IG1lbXNldCBmb3Igdi0+YXJjaC5zYXZlZF9jb250ZXh0Igo+IE1heCA4
MCBjaGFyYWN0ZXJzLCByb2dlciB0aGF0Lgo+Pgo+PiBPbiA2LzEwLzE5IDY6MTUgQU0sIEJhb2Rv
bmcgQ2hlbiB3cm90ZToKPj4+IEFscmVhZHkgZG9uZSBieSBjbGVhcl9wYWdlKCkgaW4gYWxsb2Nf
dmNwdV9zdHJ1Y3QoKQo+Pgo+PiBQbGVhc2UgdHJ5IHRvIG1ha2Ugc2VudGVuY2UgaW4gdGhlIGNv
bW1pdCBtZXNzYWdlLiBGb3IgaGVyZSBJIHdvdWxkIHN1Z2dlc3Q6Cj4+Cj4+ICJ2LT5hcmNoLnNh
dmVkX2NvbnRleHQgaXMgYWxyZWFkeSB6ZXJvZWQgaW4gYWxsb2NfdmNwdV9zdHJ1Y3QoKSBieSAK
Pj4gY2xlYXJfcGFnZSgpLiBTbyB0aGVyZSBhcmUgbm8gbmVlZCB0byBtZW1zZXQgaXQgYWdhaW4g
aW4gYXJjaF92Y3B1X2NyZWF0ZSgpLiIKPj4KPj4gSWYgeW91IGFyZSBoYXBweSB3aXRoIHRoZSB0
d28gY2hhbmdlcywgSSBjYW4gZG8gdGhlbSBvbiBjb21taXQuCj4gVGhhbmtzLCBwbGVhc2UuCgpD
b21taXR0ZWQsIHRoYW5rIHlvdSEKCkNoZWVycywKCj4+Cj4+IENoZWVycywKPj4KPj4+Cj4+PiBT
aWduZWQtb2ZmLWJ5OiBCYW9kb25nIENoZW4gPGNoZW5iYW9kb25nQG14bmF2aS5jb20+Cj4+PiAt
LS0KPj4+IMKgIHhlbi9hcmNoL2FybS9kb21haW4uYyB8IDEgLQo+Pj4gwqAgMSBmaWxlIGNoYW5n
ZWQsIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFp
bi5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jCj4+PiBpbmRleCBmZjMzMGIzLi5hZDFiMTA2IDEw
MDY0NAo+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbi5jCj4+PiArKysgYi94ZW4vYXJjaC9h
cm0vZG9tYWluLmMKPj4+IEBAIC01NTcsNyArNTU3LDYgQEAgaW50IGFyY2hfdmNwdV9jcmVhdGUo
c3RydWN0IHZjcHUgKnYpCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gc2l6
ZW9mKHN0cnVjdCBjcHVfaW5mbykpOwo+Pj4gwqDCoMKgwqDCoCBtZW1zZXQodi0+YXJjaC5jcHVf
aW5mbywgMCwgc2l6ZW9mKCp2LT5hcmNoLmNwdV9pbmZvKSk7Cj4+PiDCoCAtwqDCoMKgIG1lbXNl
dCgmdi0+YXJjaC5zYXZlZF9jb250ZXh0LCAwLCBzaXplb2Yodi0+YXJjaC5zYXZlZF9jb250ZXh0
KSk7Cj4+PiDCoMKgwqDCoMKgIHYtPmFyY2guc2F2ZWRfY29udGV4dC5zcCA9IChyZWdpc3Rlcl90
KXYtPmFyY2guY3B1X2luZm87Cj4+PiDCoMKgwqDCoMKgIHYtPmFyY2guc2F2ZWRfY29udGV4dC5w
YyA9IChyZWdpc3Rlcl90KWNvbnRpbnVlX25ld192Y3B1Owo+Pj4KPj4KCi0tIApKdWxpZW4gR3Jh
bGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
