Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F267078CA9
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 15:20:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs5Y4-0004Sg-HZ; Mon, 29 Jul 2019 13:18:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZKY6=V2=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1hs5Y3-0004Sb-48
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 13:18:43 +0000
X-Inumbo-ID: 617e0887-b203-11e9-8980-bc764e045a96
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 617e0887-b203-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 13:18:42 +0000 (UTC)
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: Julien Grall <julien.grall@arm.com>, xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 0/2] Raspberry Pi 4 support
Thread-Index: AdVCKTNrhqec33CFSM29ddylSiacxAAJwNIAAO/C4+A=
Date: Mon, 29 Jul 2019 13:19:55 +0000
Message-ID: <9dc0ad87d10b44cb844b5ad1e1ef5646@dornerworks.com>
References: <b947a9eee2bb43d490ddb4f9378f2ff5@dornerworks.com>
 <e85ac1a4-4ef4-3423-35f3-6796f45b72b2@arm.com>
In-Reply-To: <e85ac1a4-4ef4-3423-35f3-6796f45b72b2@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.12.5]
MIME-Version: 1.0
X-spam-status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_0_4
X-Spam-Flag: NO
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
bi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPkFsc28sIHRoZXJlIGEgZmV3IG90aGVyIGludGVyZXN0
aW5nIHByb2JsZW1zIHdpdGggdGhlIFJQSTQgdGhhdCB3aWxsIG5lZWQgdG8gYmUKPnNvbHZlZDoK
PiAgICAxKSBUaGUgVUFSVCBpcyBzaGFyaW5nIHRoZSBzYW1lIHBhZ2UgYXMgc29tZSBvdGhlciBk
ZXZpY2VzLiBXZSBlaXRoZXIKPm5lZWQKPnRvIGJsYWNrbGlzdCB0aGVtIHNvIHRoZXkgY2FuJ3Qg
YmUgdXNlZCBieSBhIGd1ZXN0IChpbmNsdWRpbmcgRG9tMCksIG9yIHdlCj5uZWVkCj50byB0cmFw
IGFuZCBzYW5pdGl6ZSBhY2Nlc3MuCgpJdCdzIGFsc28gc2hhcmluZyBhbiBJUlEgd2l0aCB0aGUg
b3RoZXIgImF1eCIgcGVyaXBoZXJhbHMuIEkgd2lsbCBzZW5kIGEgcGF0Y2ggdG8gYmxhY2tsaXN0
IGZvciBub3cuCgo+ICAgIDIpIFhlbiBpcyBtYXBwaW5nIG1lbW9yeSB1c2luZyAxR0IgbWFwcGlu
Zy4gQUZBSUssIHRoZXJlIGFyZSAxR0Igc2xvdAo+dGhhdAo+aXMgc2hhcmVkIGJldHdlZW4gUkFN
IGFuZCBNTUlPLiBUaGlzIHdpbGwgcmVzdWx0IHRvIGNhY2hlIGluY29oZXJlbmN5LgoKVGhhbmtz
IGZvciB0aGUgaW5mby4gVGhlcmUgaXMgYWxzbyBhIDFHQiBzbG90IHNoYXJlZCB3aXRoIEdQVSBb
MV0uCgpTdGV3YXJ0IEhpbGRlYnJhbmQKRG9ybmVyV29ya3MsIEx0ZAoKWzFdIGh0dHBzOi8vZ2l0
aHViLmNvbS9yYXNwYmVycnlwaS9saW51eC9pc3N1ZXMvMzA5MyNpc3N1ZWNvbW1lbnQtNTE1NDM4
NjI3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
