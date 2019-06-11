Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 223B73CC3E
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 14:52:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hagES-0008Sq-Mn; Tue, 11 Jun 2019 12:50:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hagER-0008SJ-0F
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 12:50:31 +0000
X-Inumbo-ID: 7d833c4a-8c47-11e9-a1f8-6f7f17fdad2b
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d833c4a-8c47-11e9-a1f8-6f7f17fdad2b;
 Tue, 11 Jun 2019 12:50:29 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 11 Jun 2019 06:50:28 -0600
Message-Id: <5CFFA3900200007800237078@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 11 Jun 2019 06:50:24 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CE68CD30200007800231B01@prv1-mh.provo.novell.com>
 <5CE68FDB0200007800231B41@prv1-mh.provo.novell.com>
 <298febae-cc8c-23c4-ee42-2c9ca8643d21@citrix.com>
In-Reply-To: <298febae-cc8c-23c4-ee42-2c9ca8643d21@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 5/5] tools/libxc: allow controlling the max
 C-state sub-state
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
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEwLjA2LjE5IGF0IDE4OjU0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjMvMDUvMjAxOSAxMzoxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEZyb206IFJv
c3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4KPj4KPj4gTWFr
ZSBoYW5kbGluZyBpbiBkb19wbV9vcCgpIG1vcmUgaG9tb2dlbmVvdXM6IEJlZm9yZSBpbnRlcnBy
ZXRpbmcKPj4gb3AtPmNwdWlkIGFzIHN1Y2gsIGhhbmRsZSBhbGwgb3BlcmF0aW9ucyBub3QgYWN0
aW5nIG9uIGEgcGFydGljdWxhcgo+PiBDUFUuIEFsc28gZXhwb3NlIHRoZSBzZXR0aW5nIHZpYSB4
ZW5wbS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pgo+Pgo+PiAtLS0gYS90b29scy9saWJ4Yy94Y19wbS5jCj4+ICsrKyBiL3Rvb2xzL2xpYnhjL3hj
X3BtLmMKPj4gQEAgLTM3OSw3ICszNzksNyBAQCBpbnQgeGNfZ2V0X2NwdWlkbGVfbWF4X2NzdGF0
ZSh4Y19pbnRlcmZhCj4+ICAgICAgfQo+PiAgICAgIHN5c2N0bC5jbWQgPSBYRU5fU1lTQ1RMX3Bt
X29wOwo+PiAgICAgIHN5c2N0bC51LnBtX29wLmNtZCA9IFhFTl9TWVNDVExfcG1fb3BfZ2V0X21h
eF9jc3RhdGU7Cj4+IC0gICAgc3lzY3RsLnUucG1fb3AuY3B1aWQgPSAwOwo+PiArICAgIHN5c2N0
bC51LnBtX29wLmNwdWlkID0gdHlwZTsKPiAKPiBXaGF0IGlzIHR5cGUsIGFuZCB3aHkgaXQgaXMg
YmVpbmcgcHV0IGludG8gYSBmaWVsZCBjYWxsZWQgY3B1aWQ/CgpTaW5jZSB0aGlzIGlzbid0IGNv
ZGUgSSB3cm90ZSBJJ20gaW5jbGluZWQgdG8gc2F5ICJzZWUgdGhlIGNvbW1lbnQKaW4gdGhlIHB1
YmxpYyBoZWFkZXIiLiBHaXZlbiB0aGUgcHJldHR5IHNwZWNpYWwgY2FzZSB0aGlzIGlzIGFib3V0
CkknbSBub3QgcmVhbGx5IGZhbmN5aW5nIGludHJvZHVjaW5nIG5ldyBzdHJ1Y3R1cmVzIC8gZmll
bGRzIGluCnN5c2N0bC5oLCBidXQganVkZ2luZyBmcm9tIHlvdXIgcmVwbHkgeW91IHByZXN1bWFi
bHkgd2FudCBtZSB0by4KCj4+IC0tLSBhL3Rvb2xzL21pc2MveGVucG0uYwo+PiArKysgYi90b29s
cy9taXNjL3hlbnBtLmMKPj4gQEAgLTExMjAsMTMgKzExMjgsMTcgQEAgdm9pZCBnZXRfdmNwdV9t
aWdyYXRpb25fZGVsYXlfZnVuYyhpbnQgYQo+PiAgCj4+ICB2b2lkIHNldF9tYXhfY3N0YXRlX2Z1
bmMoaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKPj4gIHsKPj4gLSAgICBpbnQgdmFsdWU7Cj4+ICsg
ICAgaW50IHZhbHVlLCBzdWJ2YWwgPSBYRU5fU1lTQ1RMX0NYX1VOTElNSVRFRDsKPj4gICAgICBj
aGFyIGJ1ZlsxMl07Cj4+ICAKPj4gLSAgICBpZiAoIGFyZ2MgIT0gMSB8fAo+PiArICAgIGlmICgg
YXJnYyA8IDEgfHwgYXJnYyA+IDIgfHwKPj4gICAgICAgICAgIChzc2NhbmYoYXJndlswXSwgIiVk
IiwgJnZhbHVlKSA9PSAxCj4+ICAgICAgICAgICAgPyB2YWx1ZSA8IDAKPj4gLSAgICAgICAgICA6
ICh2YWx1ZSA9IFhFTl9TWVNDVExfQ1hfVU5MSU1JVEVELCBzdHJjbXAoYXJndlswXSwgInVubGlt
aXRlZCIpKSkgKQo+PiArICAgICAgICAgIDogKHZhbHVlID0gWEVOX1NZU0NUTF9DWF9VTkxJTUlU
RUQsIHN0cmNtcChhcmd2WzBdLCAidW5saW1pdGVkIikpKSB8fAo+PiArICAgICAgICAgKGFyZ2Mg
PT0gMiAmJgo+PiArICAgICAgICAgIChzc2NhbmYoYXJndlsxXSwgIiVkIiwgJnN1YnZhbCkgPT0g
MQo+PiArICAgICAgICAgICA/IHN1YnZhbCA8IDAKPj4gKyAgICAgICAgICAgOiAoc3VidmFsID0g
WEVOX1NZU0NUTF9DWF9VTkxJTUlURUQsIHN0cmNtcChhcmd2WzFdLCAidW5saW1pdGVkIikpKSkg
KQo+IAo+IFVzYWdlIHVwZGF0ZT8KCldlbGwsIHllcy4gVGhhdCdzIHdoYXQgSSBnZXQgZm9yIHBp
Y2tpbmcgdXAgb3RoZXIgZm9sa3MnIHBhdGNoZXMuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
