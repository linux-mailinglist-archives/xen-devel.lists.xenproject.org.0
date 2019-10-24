Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 991B4E335F
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 15:04:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNcj7-0001ji-A8; Thu, 24 Oct 2019 13:00:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D++P=YR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iNcj5-0001jd-U0
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 13:00:27 +0000
X-Inumbo-ID: 3ec6aace-f65e-11e9-bbab-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ec6aace-f65e-11e9-bbab-bc764e2007e4;
 Thu, 24 Oct 2019 13:00:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C85A2B73B;
 Thu, 24 Oct 2019 13:00:24 +0000 (UTC)
To: Lars Kurth <lars.kurth@citrix.com>, Wei Liu <wl@xen.org>
References: <20191024110618.6436-1-wl@xen.org>
 <e05ef290-8e71-046f-a687-9d1a8e1ea7fe@suse.com>
 <20191024112226.ugcmzmsyndg3sfeb@debian>
 <5B1B130A-0E1F-4977-91B0-9E283D6CDC36@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <1c255cdb-38b6-cba3-b5f8-97824933e0a8@suse.com>
Date: Thu, 24 Oct 2019 15:00:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <5B1B130A-0E1F-4977-91B0-9E283D6CDC36@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] CONTRIBUTING: drop reference to
 blktap2
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMTAuMTkgMTQ6MTQsIExhcnMgS3VydGggd3JvdGU6Cj4gCj4gCj4g77u/T24gMjQvMTAv
MjAxOSwgMTI6MjIsICJXZWkgTGl1IiA8d2xAeGVuLm9yZz4gd3JvdGU6Cj4gCj4gICAgICBPbiBU
aHUsIE9jdCAyNCwgMjAxOSBhdCAwMToxMzoxM1BNICswMjAwLCBKw7xyZ2VuIEdyb8OfIHdyb3Rl
Ogo+ICAgICAgPiBPbiAyNC4xMC4xOSAxMzowNiwgV2VpIExpdSB3cm90ZToKPiAgICAgID4gPiBC
bGt0YXAyIGlzIGdvbmUuCj4gICAgICA+ID4KPiAgICAgID4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkg
TGl1IDx3bEB4ZW4ub3JnPgo+ICAgICAgPiA+IC0tLQo+ICAgICAgPiA+ICAgQ09OVFJJQlVUSU5H
IHwgMSAtCj4gICAgICA+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+ICAgICAg
PiA+Cj4gICAgICA+ID4gZGlmZiAtLWdpdCBhL0NPTlRSSUJVVElORyBiL0NPTlRSSUJVVElORwo+
ICAgICAgPiA+IGluZGV4IDQ3ZjUzZTlhNDkuLjRmZmY0ZmQ5ZjYgMTAwNjQ0Cj4gICAgICA+ID4g
LS0tIGEvQ09OVFJJQlVUSU5HCj4gICAgICA+ID4gKysrIGIvQ09OVFJJQlVUSU5HCj4gICAgICA+
ID4gQEAgLTEzLDcgKzEzLDYgQEAgTW9zdCBvZiB0aGUgWGVuIFByb2plY3QgY29kZSBpcyBsaWNl
bnNlZCB1bmRlciBHUEx2MiwgYnV0IGEgbnVtYmVyIG9mCj4gICAgICA+ID4gICBkaXJlY3Rvcmll
cyBhcmUgcHJpbWFyaWx5IGxpY2Vuc2VkIHVuZGVyIGRpZmZlcmVudCBsaWNlbnNlcy4KPiAgICAg
ID4gPiAgIE1vc3Qgbm90YWJseToKPiAgICAgID4gPiAtIC0gdG9vbHMvYmxrdGFwMiAgICAgIDog
QlNELU1vZGlmaWVkCj4gICAgICA+ID4gICAgLSB0b29scy9saWJ4YyAgICAgICAgOiBMR1BMIHYy
LjEKPiAgICAgID4gPiAgICAtIHRvb2xzL2xpYnhsICAgICAgICA6IExHUEwgdjIuMQo+ICAgICAg
PiA+ICAgIC0gdG9vbHMveGwgICAgICAgICAgIDogTEdQTCB2Mi4xCj4gICAgICA+ID4KPiAgICAg
ID4KPiAgICAgID4gTWluZCBhZGRpbmcgdG9vbHMvbGlicyBpbnN0ZWFkPwo+ICAgICAgCj4gICAg
ICBTdXJlLiBUaGF0IGNhbiBiZSBkb25lLgo+ICAgICAgCj4gICAgICBCZWNhdXNlIHRvb2xzL2xp
YnMnIGNvZGUgaXMgbW9zdGx5IHNwbGl0IGZyb20gbGlieGMgYW5kIGZyaWVuZHMsIEkKPiAgICAg
IGFzc3VtZSBpdCBpcyBnb2luZyB0byBiZSBMR1BMIHYyLjEgYXMgd2VsbC4KPiAgICAgIAo+ICAg
ICAgTGFycyBhbmQgSWFuLCB5b3VyIG9waW5pb24/Cj4gICAgICAKPiBUb29scy9saWJzIGRvZXMg
bm90IGhhdmUgYSBDT1BZSU5HIGZpbGUsIHNvIGl0IGlzIEdQTCBieSBkZWZhdWx0LiBIb3dldmVy
LCBhbGwgdGhlIGZpbGVzIEkgY2hlY2tlZCBhcHBlYXIgdG8gaGF2ZSBMR1BMIHYyLjEKPiBTbywg
dGhlIGRpcmVjdG9yeSBzaG91bGQgcHJvYmFibHkgaGF2ZSBhbiBhcHByb3ByaWF0ZSBDT1BZSU5H
IGZpbGUsIGJ1dCB3ZSBkbyBuZWVkIHRvIGNoZWNrIGFsbCBmaWxlcyBpbiBpdAoKdG9vbHMvbGli
cy8qL3ByaXZhdGUuaCBoYXZlIG5vIGxpY2Vuc2UgcmVtYXJrLCBhbGwgb3RoZXIgKi5jIGFuZCAq
LmggYXJlCkxHUEwgMi4xLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
