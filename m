Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3B1261A1
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 12:21:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTOLP-0001ga-7p; Wed, 22 May 2019 10:19:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aAGA=TW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hTOLO-0001gQ-2x
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 10:19:34 +0000
X-Inumbo-ID: 1663913a-7c7b-11e9-a7f5-5b6a96742096
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1663913a-7c7b-11e9-a7f5-5b6a96742096;
 Wed, 22 May 2019 10:19:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B682FAE99;
 Wed, 22 May 2019 10:19:30 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190522094549.28397-1-jgross@suse.com>
 <20190522094549.28397-2-jgross@suse.com> <5CE52014020000780023147E@suse.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <f100e5be-cf19-bf28-c113-b07b4fe99c59@suse.com>
Date: Wed, 22 May 2019 12:19:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CE52014020000780023147E@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 1/3] xen: drop in_atomic()
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIvMDUvMjAxOSAxMjoxMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjIuMDUuMTkg
YXQgMTE6NDUsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiAtLS0gYS94ZW4vYXJjaC94ODYv
aHZtL2h2bS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPj4gQEAgLTMxODUsMjIg
KzMxODUsNiBAQCBzdGF0aWMgZW51bSBodm1fdHJhbnNsYXRpb25fcmVzdWx0IF9faHZtX2NvcHko
Cj4+ICAKPj4gICAgICBBU1NFUlQoaXNfaHZtX3ZjcHUodikpOwo+PiAgCj4+IC0gICAgLyoKPj4g
LSAgICAgKiBYWFggRGlzYWJsZSBmb3IgNC4xLjA6IFBWLW9uLUhWTSBkcml2ZXJzIHdpbGwgZG8g
Z3JhbnQtdGFibGUgb3BzCj4+IC0gICAgICogc3VjaCBhcyBxdWVyeV9zaXplLiBHcmFudC10YWJs
ZSBjb2RlIGN1cnJlbnRseSBkb2VzIGNvcHlfdG8vZnJvbV9ndWVzdAo+PiAtICAgICAqIGFjY2Vz
c2VzIHVuZGVyIHRoZSBiaWcgcGVyLWRvbWFpbiBsb2NrLCB3aGljaCB0aGlzIHRlc3Qgd291bGQg
ZGlzYWxsb3cuCj4+IC0gICAgICogVGhlIHRlc3QgaXMgbm90IG5lZWRlZCB1bnRpbCB3ZSBpbXBs
ZW1lbnQgc2xlZXBpbmctb24td2FpdHF1ZXVlIHdoZW4KPj4gLSAgICAgKiB3ZSBhY2Nlc3MgYSBw
YWdlZC1vdXQgZnJhbWUsIGFuZCB0aGF0J3MgcG9zdCA0LjEuMCBub3cuCj4+IC0gICAgICovCj4+
IC0jaWYgMAo+PiAtICAgIC8qCj4+IC0gICAgICogSWYgdGhlIHJlcXVpcmVkIGd1ZXN0IG1lbW9y
eSBpcyBwYWdlZCBvdXQsIHRoaXMgZnVuY3Rpb24gbWF5IHNsZWVwLgo+PiAtICAgICAqIEhlbmNl
IHdlIGJhaWwgaW1tZWRpYXRlbHkgaWYgY2FsbGVkIGZyb20gYXRvbWljIGNvbnRleHQuCj4+IC0g
ICAgICovCj4+IC0gICAgaWYgKCBpbl9hdG9taWMoKSApCj4+IC0gICAgICAgIHJldHVybiBIVk1U
UkFOU191bmhhbmRsZWFibGU7Cj4+IC0jZW5kaWYKPiAKPiBEZWFsaW5nIHdpdGggdGhpcyBUT0RP
IGl0ZW0gaXMgb2YgY291cnNlIG11Y2ggYXBwcmVjaWF0ZWQsIGJ1dAo+IHNob3VsZCBpdCByZWFs
bHkgYmUgZGVsZXRlZCBhbHRvZ2V0aGVyPyBUaGUgYmlnLWRvbWFpbi1sb2NrIGlzc3VlCj4gaXMg
Z29uZSBhZmFpciwgaW4gd2hpY2ggY2FzZSBkcm9wcGluZyB0aGUgI2lmIDAgd291bGQgc2VlbQo+
IHBvc3NpYmxlIHRvIG1lLCBldmVuIGlmIGl0J3Mgbm90IHN0cmljdGx5IG5lZWRlZCB3aXRob3V0
IHRoZSBzbGVlcC0KPiBvbi13YWl0cXVldWUgYmVoYXZpb3IgbWVudGlvbmVkLgoKUXVlc3Rpb24g
aXMgd2hldGhlciBpdCBpcyB3b3J0aCB0byBrZWVwIGl0IHJlc3VsdGluZyBpbiB0aGUgbmVlZCB0
bwprZWVwIHByZWVtcHRfY291bnQoKSBhcyB3ZWxsLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
