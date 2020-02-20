Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBBA165D53
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 13:13:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4kfR-00044h-Gw; Thu, 20 Feb 2020 12:10:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iWzT=4I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4kfQ-00044c-DV
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 12:10:56 +0000
X-Inumbo-ID: 0ba9f48c-53da-11ea-bc8e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ba9f48c-53da-11ea-bc8e-bc764e2007e4;
 Thu, 20 Feb 2020 12:10:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AD8D0AC92;
 Thu, 20 Feb 2020 12:10:54 +0000 (UTC)
To: Wei Liu <wl@xen.org>, Hongyan Xia <hongyxia@amazon.com>
References: <ad98947f577560d47ea7825deb624149788645d0.1580219401.git.hongyxia@amazon.com>
 <20200128142133.eqvyj52xdu5lzbdw@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f2560c00-dc49-f709-d59a-dc057288ab67@suse.com>
Date: Thu, 20 Feb 2020 13:10:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200128142133.eqvyj52xdu5lzbdw@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6] x86: introduce a new set of APIs to
 manage Xen page tables
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
Cc: xen-devel@lists.xenproject.org, jgrall@amazon.com,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDEuMjAyMCAxNToyMSwgV2VpIExpdSB3cm90ZToKPiBPbiBUdWUsIEphbiAyOCwgMjAy
MCBhdCAwMTo1MDowNVBNICswMDAwLCBIb25neWFuIFhpYSB3cm90ZToKPj4gRnJvbTogV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPj4KPj4gV2UgYXJlIGdvaW5nIHRvIHN3aXRjaCB0byB1
c2luZyBkb21oZWFwIHBhZ2UgZm9yIHBhZ2UgdGFibGVzLgo+PiBBIG5ldyBzZXQgb2YgQVBJcyBp
cyBpbnRyb2R1Y2VkIHRvIGFsbG9jYXRlIGFuZCBmcmVlIHBhZ2VzIG9mIHBhZ2UKPj4gdGFibGVz
IGJhc2VkIG9uIG1mbiBpbnN0ZWFkIG9mIHRoZSB4ZW5oZWFwIGRpcmVjdCBtYXAgYWRkcmVzcy4g
VGhlCj4+IGFsbG9jYXRpb24gYW5kIGRlYWxsb2NhdGlvbiB3b3JrIG9uIG1mbl90IGJ1dCBub3Qg
cGFnZV9pbmZvLCBiZWNhdXNlCj4+IHRoZXkgYXJlIHJlcXVpcmVkIHRvIHdvcmsgZXZlbiBiZWZv
cmUgZnJhbWUgdGFibGUgaXMgc2V0IHVwLgo+Pgo+PiBJbXBsZW1lbnQgdGhlIG9sZCBmdW5jdGlv
bnMgd2l0aCB0aGUgbmV3IG9uZXMuIFdlIHdpbGwgcmV3cml0ZSwgc2l0ZQo+PiBieSBzaXRlLCBv
dGhlciBtbSBmdW5jdGlvbnMgdGhhdCBtYW5pcHVsYXRlIHBhZ2UgdGFibGVzIHRvIHVzZSB0aGUg
bmV3Cj4+IEFQSXMuCj4+Cj4+IEFmdGVyIHRoZSBhbGxvY2F0aW9uLCBvbmUgbmVlZHMgdG8gbWFw
IGFuZCB1bm1hcCB2aWEgbWFwX2RvbWFpbl9wYWdlIHRvCj4+IGFjY2VzcyB0aGUgUFRFcy4gVGhp
cyBkb2VzIG5vdCBicmVhayB4ZW4gaGFsZiB3YXksIHNpbmNlIHRoZSBuZXcgQVBJcwo+PiBzdGls
bCB1c2UgeGVuaGVhcCBwYWdlcyB1bmRlcm5lYXRoLCBhbmQgbWFwX2RvbWFpbl9wYWdlIHdpbGwg
anVzdCB1c2UKPj4gdGhlIGRpcmVjdG1hcCBmb3IgbWFwcGluZ3MuIFRoZXkgd2lsbCBiZSBzd2l0
Y2hlZCB0byB1c2UgZG9taGVhcCBhbmQKPj4gZHluYW1pYyBtYXBwaW5ncyB3aGVuIHVzYWdlIG9m
IG9sZCBBUElzIGlzIGVsaW1pbmF0ZWQuCj4+Cj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVu
ZGVkIGluIHRoaXMgcGF0Y2guCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUy
QGNpdHJpeC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEhvbmd5YW4gWGlhIDxob25neXhpYUBhbWF6
b24uY29tPgo+PiBSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4K
PiAKPiBSZXZpZXdlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KCkFja2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpJJ20gc29ycnkgZm9yIHRoZSBkZWxheS4KCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
