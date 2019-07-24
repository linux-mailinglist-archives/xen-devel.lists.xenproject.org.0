Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A95157328B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 17:14:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqIvL-0003ee-Q2; Wed, 24 Jul 2019 15:11:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6YCV=VV=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1hqIvK-0003eZ-Ll
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 15:11:22 +0000
X-Inumbo-ID: 49b76a44-ae25-11e9-ba8e-474d6fb294f2
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 49b76a44-ae25-11e9-ba8e-474d6fb294f2;
 Wed, 24 Jul 2019 15:11:20 +0000 (UTC)
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: Julien Grall <julien.grall@arm.com>, xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 0/2] Raspberry Pi 4 support
Thread-Index: AdVCKTNrhqec33CFSM29ddylSiacxAAJwNIAAAgcuzA=
Date: Wed, 24 Jul 2019 15:12:02 +0000
Message-ID: <19633ba72255446dba015de1ff26c0a7@dornerworks.com>
References: <b947a9eee2bb43d490ddb4f9378f2ff5@dornerworks.com>
 <e85ac1a4-4ef4-3423-35f3-6796f45b72b2@arm.com>
In-Reply-To: <e85ac1a4-4ef4-3423-35f3-6796f45b72b2@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.12.5]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 0/2] Raspberry Pi 4 support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, Tim Deegan <tim@xen.org>, Jan
 Beulich <jbeulich@suse.com>, Andre Przywara <andre.przywara@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkbmVzZGF5LCBKdWx5IDI0LCAyMDE5IDEwOjQ3IEFNLCBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPkhpLAo+Cj5UaGFuayB5b3UgZm9yIHlvdXIgc2VyaWVz
LiBQbGVhc2UgdXNlIGdpdC1zZW5kLWVtYWlsIHNvIHlvdXIgc2VyaWVzIGlzIHRocmVhZGVkCj5j
b3JyZWN0bHkgYW5kIHNlbnQgaW4gcGxhaW4gdGV4dCAobm90IEhUTUwhKS4KCk15IGFwb2xvZ2ll
cy4gSSB3aWxsIGRvIHRoaXMgbmV4dCB0aW1lIEkgaGF2ZSBzb21ldGhpbmcgdG8gc2VuZC4KCj5J
IGd1ZXNzIHlvdSBhcmUgbm90IHVzaW5nIEFuZHJlJ3MgQVRGIHBvcnQ/IElmIHlvdSBhcmUsIHRo
ZW4gWGVuIDQuMTIgaXMKPmRlZmluaXRlbHkgbm90IHNhZmUgb24gdGhhdCBwbGF0Zm9ybSBiZWNh
dXNlIHdlIGRvbid0IGhhbmRsZSByZXNlcnZlZC1yZWdpb24KPnlldAo+YW5kIHRoZXJlZm9yZSBY
ZW4gbWF5IHJlLXVzZSBzb21lIG9mIHRob3NlIHJlZ2lvbnMuCgpObywgSSBhbSBub3QuIEkgYW0g
bG9hZGluZyBhIFhlbitMaW51eCBjb21iaW5lZCBpbWFnZSBhbmQgZHRiIGRpcmVjdGx5IGZyb20g
dGhlIFJhc3BiZXJyeSBQaSdzIGZpcm13YXJlL2Jvb3Rsb2FkZXIuIEknbSBub3QgdXNpbmcgVS1C
b290LCBlaXRoZXIsIGFzIHRoYXQgd291bGQgZGlzY2FyZCB0aGUgYm9vdGFyZ3MgcGFzc2VkIGJ5
IHRoZSBSYXNwYmVycnkgUGkgZmlybXdhcmUuCgo+UGxlYXNlIG5vIG1vcmUgZWFybHlwcmludGsg
YWxpYXMuIFRoZXJlIGFyZSBubyByZWFsIHZhbHVlIGZvciB0aGVtIG90aGVyIHRoYW4KPmNsdXR0
ZXJpbmcgYSBiaXQgbW9yZSBSdWxlcy5tay4KCk9LLiBJIHdpbGwgZHJvcCB0aGlzIGlmIHRoZXJl
IGlzIGEgbmVlZCBmb3IgYSB2MiBvZiB0aGUgc2VyaWVzLiBQYXRjaCAyLzIgY291bGQgYmUgYXBw
bGllZCBpbmRlcGVuZGVudGx5IG9mIHRoZSBwcmludGsgYWxpYXMuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
