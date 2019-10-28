Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C863CE75F3
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 17:18:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP7gc-0005gb-Aq; Mon, 28 Oct 2019 16:16:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vp8f=YV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iP7ga-0005gW-Gz
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 16:16:04 +0000
X-Inumbo-ID: 3c69fee6-f99e-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c69fee6-f99e-11e9-beca-bc764e2007e4;
 Mon, 28 Oct 2019 16:16:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EC8A6AB92;
 Mon, 28 Oct 2019 16:16:01 +0000 (UTC)
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20191028152948.11900-1-ian.jackson@eu.citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <5cc77f85-1238-9a67-e1a2-0330ebc5ce3b@suse.com>
Date: Mon, 28 Oct 2019 17:16:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191028152948.11900-1-ian.jackson@eu.citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 0/3] Fix stub dm since pci pt
 overhaul
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTAuMTkgMTY6MjksIElhbiBKYWNrc29uIHdyb3RlOgo+IFRoaXMgc2VyaWVzIGZpeGVz
IGd1ZXN0IGNyZWF0aW9uIHdpdGggc3R1YiBkZXZpY2UgbW9kZWxzLCB3aGljaCB3YXMKPiBicm9r
ZW4gYnkgYWQwMTFhZDA4ODQzICJsaWJ4bC94bDogT3ZlcmhhdWwgcGFzc3Rocm91Z2ggc2V0dGlu
ZyBsb2dpYyIuCj4gCj4gSSBoYXZlIHRlc3RlZCB0aGlzIHdpdGggYWxsIHRocmVlIHBhdGNoZXMg
YW5kIGl0IGZpeGVzIHRoZSByZWdyZXNzaW9uLgo+IEknbSBub3Qgc3VyZSBhYm91dCB0aGUgM3Jk
IGFuZCB3b3VsZCBsaWtlIGFuIG9waW5pb24gZnJvbSB4ODYgZm9sa3MsCj4gZm9yIHRoZSByZWFz
b25zIGV4cGxhaW5lZCBpbiBpdHMgY29tbWl0IG1lc3NhZ2UuCj4gCj4gSWFuIEphY2tzb24gKDMp
Ogo+ICAgIGxpYnhsOiBkb21haW5fY29uZmlnX3NldGRlZmF1bHQ6IERvY3VtZW50IHVzZSBvZiBk
b21pZAo+ICAgIGxpYnhsOiBsaWJ4bF9fc3Bhd25fc3R1Yl9kbTogQ2FsbCBkb21haW5fY29uZmln
X3NldGRlZmF1bHQKPiAgICBsaWJ4bDogU2V0IHNoYWRvd19tZW1rYiBmb3Igc3R1YiBkZXZpY2Ug
bW9kZWwgZG9tYWlucwo+IAo+ICAgdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgfCAyICstCj4g
ICB0b29scy9saWJ4bC9saWJ4bF9kbS5jICAgICB8IDkgKy0tLS0tLS0tCj4gICAyIGZpbGVzIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiAKCkknZCBhcHByZWNpYXRl
IGEgcmF0aGVyIGZhc3QgcmV2aWV3IG9mIHRoZXNlIHBhdGNoZXMsIGFzIHRoZXkgcmVwYWlyIGFu
Cmlzc3VlIGJsb2NraW5nIGFuIE9TU3Rlc3QgcHVzaC4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
