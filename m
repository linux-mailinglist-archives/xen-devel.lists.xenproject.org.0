Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 473001055B7
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 16:36:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXoTC-0004tK-68; Thu, 21 Nov 2019 15:34:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXoTA-0004tB-EF
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 15:34:08 +0000
X-Inumbo-ID: 59fc2da7-0c74-11ea-a33b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 59fc2da7-0c74-11ea-a33b-12813bfff9fa;
 Thu, 21 Nov 2019 15:34:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EB095AFF1;
 Thu, 21 Nov 2019 15:34:04 +0000 (UTC)
To: George Dunlap <George.Dunlap@citrix.com>
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
 <4f0df64e7c21d70d72cee4fff3f3821a@crc.id.au>
 <006fa7b3-ae93-2812-c88a-7bf8e2ac88b0@suse.com>
 <5ba3cff4-d898-b994-6b73-262146c0037e@suse.com>
 <01D97001-4B2B-4AD7-9C0A-8E2EC03BC90D@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eab9a5c6-8944-cc5c-f025-84696c91899e@suse.com>
Date: Thu, 21 Nov 2019 16:34:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <01D97001-4B2B-4AD7-9C0A-8E2EC03BC90D@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Status of 4.13
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
Cc: Juergen Gross <jgross@suse.com>, Steven Haigh <netwiz@crc.id.au>,
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>, IanJackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTEuMjAxOSAxNjoyMCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiAKPiAKPj4gT24gTm92
IDIxLCAyMDE5LCBhdCA4OjQxIEFNLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdy
b3RlOgo+Pgo+PiBPbiAyMS4xMS4yMDE5IDA4OjM2LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+Pj4g
T24gMjEuMTEuMTkgMDg6MzAsIFN0ZXZlbiBIYWlnaCB3cm90ZToKPj4+PiBPbiAyMDE5LTExLTIx
IDE3OjA1LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+Pj4+PiBXaGVyZSBkbyB3ZSBzdGFuZCB3aXRo
IFhlbiA0LjEzIHJlZ2FyZGluZyBibG9ja2VycyBhbmQgcmVsYXRlZCBwYXRjaGVzPwo+Pj4+Pgo+
Pj4+PiAyLiBSeXplbi9Sb21lIGZhaWx1cmVzIHdpdGggV2luZG93cyBndWVzdHM6Cj4+Pj4+ICAg
IFdoYXQgaXMgdGhlIGN1cnJlbnRseSBwbGFubmVkIHdheSB0byBhZGRyZXNzIHRoZSBwcm9ibGVt
PyBXaG8gaXMKPj4+Pj4gICAgd29ya2luZyBvbiB0aGF0Pwo+Pj4+Cj4+Pj4gQSB3b3JrYXJvdW5k
IHdhcyBmb3VuZCBieSBzcGVjaWZ5aW5nIGNwdWlkIHZhbHVlcyBpbiB0aGUgV2luZG93cyBWTSAK
Pj4+PiBjb25maWcgZmlsZS4KPj4+Pgo+Pj4+IFRoZSB3b3JrYXJvdW5kIGxpbmUgaXM6Cj4+Pj4g
Y3B1aWQgPSBbICIweDgwMDAwMDA4OmVjeD14eHh4eHh4eHh4eHh4eHh4MDEwMHh4eHh4eHh4eHh4
eCIgXQo+Pj4+Cj4+Pj4gSXQgd2FzIHN1Z2dlc3RlZCB0aGF0IHRoaXMgYmUgZG9jdW1lbnRlZCAt
IGJ1dCBubyBpbW1lZGlhdGUgYWN0aW9uIAo+Pj4+IHNob3VsZCBiZSB0YWtlbiAtIHdpdGggYSB2
aWV3IHRvIGNvcnJlY3QgdGhpcyBwcm9wZXJseSBpbiA0LjE0Lgo+Pj4KPj4+IEknbSBhd2FyZSBv
ZiB0aGUgc3VnZ2VzdGlvbiwgYnV0IG5vdCBvZiBhbnkgZGVjaXNpb24uIDotKQo+Pgo+PiBJdCB3
YXMgbXkgdW5kZXJzdGFuZGluZyB0aGF0IHdlJ2QgY2FwIHRoZSA0LWJpdCB2YWx1ZSB0byA3IGZv
cgo+PiB0aGUgdGltZSBiZWluZy4gSSB0aGluayBHZW9yZ2Ugd2FzIHBsYW5uaW5nIHRvIHNlbmQg
YSBwYXRjaC4KPiAKPiBPbiB0aGF0IGFsc28sIEnigJltIGF3YXJlIG9mIHRoZSBzdWdnZXN0aW9u
LCBidXQgbm90IG9mIGFueSBkZWNpc2lvbi4KPiAgSSBkb27igJl0IHRoaW5rIEkgZ290IG11Y2gg
ZmVlZGJhY2ssIHBvc2l0aXZlIG9yIG5lZ2F0aXZlLCBhYm91dCB0aGUgaWRlYS4KPiAKPiBTdXBw
b3NlIHdlIGltcGxlbWVudCB0aGUgbGltaXQgZm9yIDQuMTMuIElmIHNvbWVvbmUgcnVucyBMaW51
eCBWTXMKPiBvbiA0LjEyIGEgc3lzdGVtIHdpdGggYSBoYXJkd2FyZSB2YWx1ZSBvZiA3IGZvciBh
cGljX2lkX3NpemUsIHRoZQo+IGd1ZXN0cyB3aWxsIHNlZSA4LiAgSWYgdGhleSB0aGVuIG1pZ3Jh
dGUgdG8gNC4xMywgdGhlIHZhbHVlIHdpbGwKPiBtYWdpY2FsbHkgY2hhbmdlIHVuZGVyIHRoZWly
IGZlZXQgdG8gNy4gIElzIHRoYXQgT0s/CgpMZXQncyBsb29rIGF0IHRoZSBwcmVyZXFzIGZvciBy
dW5uaW5nIGEgTGludXggKG9yIGFjdHVhbGx5IGFueSkgVk0Kb24gc3VjaCBoYXJkd2FyZTogQXQg
bGVhc3Qgb24gZHVhbCBzb2NrZXQgc3lzdGVtcyB3aXRoIHN1Y2ggQ1BVcwpYZW4gNC4xMiB3b3Vs
ZG4ndCBldmVuIGJvb3QuIEkgZG9uJ3Qga25vdyBob3cgd2lkZSBhIHJhbmdlIG9mCnNpbmdsZSBz
b2NrZXQgc3lzdGVtcyB3aXRoIHRoZXNlIDY0LWNvZGUgQ1BVcyB3b3VsZCBleGlzdCBvcgphcHBl
YXIgZG93biB0aGUgcm9hZC4KClRoZSB3b3JrYXJvdW5kIGJlZm9yZSBvdXIgZW5hYmxpbmcgb2Yg
eDJBUElDIG1vZGUgZm9yIHRoZXNlIGJveGVzCndhcyB0byBkaXNhYmxlIFNNVCwgd2hpY2ggaGFz
IHRoZSBzaWRlIGVmZmVjdCBvZiBjaGFuZ2luZyBzYWlkCnZhbHVlIHRvIDYuCgpBcyB0byB5b3Vy
IGFjdHVhbCBxdWVzdGlvbiAtIGFzIGZhciBhcyBMaW51eCBnb2VzLCBJIGRvbid0IHRoaW5rCnRo
ZXkgcmUtZXZhbHVhdGUgdGhpcyBDUFVJRCBsZWFmIHBvc3QgYm9vdC4gQnV0IEkgY291bGQgYmUg
d3JvbmcKd2l0aCB0aGlzLCBhbmQgb2YgY291cnNlIG90aGVyIE9TZXMgbWlnaHQgYmVoYXZlIGRp
ZmZlcmVudGx5LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
