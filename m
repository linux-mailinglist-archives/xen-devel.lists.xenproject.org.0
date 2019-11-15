Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33401FDEB1
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 14:16:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVbPf-00041k-3K; Fri, 15 Nov 2019 13:13:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jkvn=ZH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iVbPd-00041f-08
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 13:13:21 +0000
X-Inumbo-ID: b12355b6-07a9-11ea-a26c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b12355b6-07a9-11ea-a26c-12813bfff9fa;
 Fri, 15 Nov 2019 13:13:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B86AAB224;
 Fri, 15 Nov 2019 13:13:18 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d3141a4d-b1b8-cc8b-3171-73fe0e6dd1c9@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <5dd04c2a-d6f1-4fc1-31ea-1212f660ad6f@suse.com>
Date: Fri, 15 Nov 2019 14:13:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <d3141a4d-b1b8-cc8b-3171-73fe0e6dd1c9@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] AMD/IOMMU: restore DTE fields in
 amd_iommu_setup_domain_device()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTEuMTkgMTQ6NTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IENvbW1pdCAxYjAwYzE2YmRm
ICgiQU1EL0lPTU1VOiBwcmUtZmlsbCBhbGwgRFRFcyByaWdodCBhZnRlciB0YWJsZQo+IGFsbG9j
YXRpb24iKSBtb3ZlZCBvdXJzZWx2ZXMgaW50byBhIG1vcmUgc2VjdXJlIGRlZmF1bHQgc3RhdGUs
IGJ1dAo+IGRpZG4ndCB0YWtlIHN1ZmZpY2llbnQgY2FyZSB0byBhbHNvIHVuZG8gdGhlIGVmZmVj
dHMgd2hlbiBoYW5kaW5nIGEKPiBwcmV2aW91c2x5IGRpc2FibGVkIGRldmljZSBiYWNrIHRvIGEo
bm90aGVyKSBkb21haW4uIFB1dCB0aGUgZmllbGRzCj4gdGhhdCBtYXkgaGF2ZSBiZWVuIGNoYW5n
ZWQgZWxzZXdoZXJlIGJhY2sgdG8gdGhlaXIgaW50ZW5kZWQgdmFsdWVzCj4gKHNvbWUgZmllbGRz
IGFtZF9pb21tdV9kaXNhYmxlX2RvbWFpbl9kZXZpY2UoKSB0b3VjaGVzIGRvbid0Cj4gY3VycmVu
dGx5IGdldCB3cml0dGVuIGFueXdoZXJlIGVsc2UsIGFuZCBoZW5jZSBkb24ndCBuZWVkIG1vZGlm
eWluZwo+IGhlcmUpLgo+IAo+IFJlcG9ydGVkLWJ5OiBTYW5kZXIgRWlrZWxlbmJvb20gPGxpbnV4
QGVpa2VsZW5ib29tLml0Pgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
