Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7323E1E7E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 16:46:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNHsG-0002NL-Ti; Wed, 23 Oct 2019 14:44:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Og4R=YQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iNHsG-0002NG-2D
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 14:44:32 +0000
X-Inumbo-ID: 9efce96e-f5a3-11e9-9482-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9efce96e-f5a3-11e9-9482-12813bfff9fa;
 Wed, 23 Oct 2019 14:44:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6A923B3BF;
 Wed, 23 Oct 2019 14:44:30 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
 <20191023135812.21348-3-andrew.cooper3@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f6404c89-8d6e-e1a0-e8dc-414da3f294de@suse.com>
Date: Wed, 23 Oct 2019 16:44:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191023135812.21348-3-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/7] xen/nospec: Use always_inline to fix
 code gen for evaluate_nospec
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTAuMTkgMTU6NTgsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gZXZhbHVhdGVfbm9zcGVj
KCkgaXMgaW5jcmVkaWJseSBmcmFnaWxlLCBhbmQgdGhpcyBpcyBvbmUgZ2lhbnQgYm9kZ2UuCj4g
Cj4gVG8gY29ycmVjdGx5IHByb3RlY3QganVtcHMsIHRoZSBnZW5lcmF0ZWQgY29kZSBuZWVkcyB0
byBiZSBvZiB0aGUgZm9ybToKPiAKPiAgICAgIGNtcC90ZXN0IDxjb25kPgo+ICAgICAgamNjIDFm
Cj4gICAgICBsZmVuY2UKPiAgICAgIC4uLgo+ICAgMTogbGZlbmNlCj4gICAgICAuLi4KPiAKPiBD
cml0aWNhbGx5LCB0aGUgbGZlbmNlIG11c3QgYmUgYXQgdGhlIGhlYWQgb2YgYm90aCBiYXNpYyBi
bG9ja3MsIGxhdGVyIGluIHRoZQo+IGluc3RydWN0aW9uIHN0cmVhbSB0aGFuIHRoZSBjb25kaXRp
b25hbCBqdW1wIGluIG5lZWQgb2YgcHJvdGVjdGlvbi4KPiAKPiBXaGVuIGEgc3RhdGljIGlubGlu
ZSBpcyBpbnZvbHZlZCwgdGhlIG9wdGltaXNlciBkZWNpZGVzIHRvIGJlIGNsZXZlciBhbmQKPiBy
ZWFycmFuZ2VzIHRoZSBjb2RlIGFzOgo+IAo+ICAgcHJlZDoKPiAgICAgIGxmZW5jZQo+ICAgICAg
PGNhbGN1bGF0ZSBjb25kPgo+ICAgICAgcmV0Cj4gCj4gICAgICBjYWxsIHByZWQKPiAgICAgIGNt
cCAkMCwgJWVheAo+ICAgICAgamNjIDFmCj4gICAgICAuLi4KPiAgIDE6IC4uLgo+IAo+IHdoaWNo
IGJyZWFrcyB0aGUgc3BlY3VsYXRpdmUgc2FmZXR5Lgo+IAo+IEFueSB1c2Ugb2YgZXZhbHVhdGVf
bm9zcGVjKCkgbmVlZHMgYWxsIHN0YXRpYyBpbmxpbmUgcHJlZGljYXRlcyB3aGljaCB1c2UgaXQK
PiB0byBiZSBkZWNsYXJlZCBhbHdheXNfaW5saW5lIHRvIHByZXZlbnQgdGhlIG9wdGltaXNlciBo
YXZpbmcgdGhlIGZsZXhpYmlsaXR5Cj4gdG8gZ2VuZXJhdGUgdW5zYWZlIGNvZGUuCj4gCj4gU2ln
bmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJl
bGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2Vu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
