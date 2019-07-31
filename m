Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB31D7CF64
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 23:10:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsvoV-0006Il-8b; Wed, 31 Jul 2019 21:07:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8Zog=V4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hsvoT-0006Ic-Cg
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 21:07:09 +0000
X-Inumbo-ID: 27435f9d-b3d7-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 27435f9d-b3d7-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 21:07:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B78BE344;
 Wed, 31 Jul 2019 14:07:06 -0700 (PDT)
Received: from [10.37.9.90] (unknown [10.37.9.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CFB13F694;
 Wed, 31 Jul 2019 14:07:05 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-15-julien.grall@arm.com>
 <alpine.DEB.2.21.1906271135340.5851@sstabellini-ThinkPad-T480s>
 <e802f230-52f7-a018-8902-ad466f2dab76@arm.com>
 <alpine.DEB.2.21.1907301024460.28600@sstabellini-ThinkPad-T480s>
 <0f74ba78-6c38-61d4-98e4-885f5228fcca@arm.com>
 <alpine.DEB.2.21.1907311329430.22968@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <03237448-c09a-2365-e949-ba6aa27fbc87@arm.com>
Date: Wed, 31 Jul 2019 22:07:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1907311329430.22968@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 14/17] xen/arm64: head: Remove ID map as
 soon as it is not used
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Oleksandr_Tyshchenko@epam.com,
 andrii_anisov@epam.com, andre.przywara@arm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDcvMzEvMTkgOTo0MCBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IE9uIFR1ZSwgMzAgSnVsIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGkgU3RlZmFu
bywKPj4KPj4gT24gNy8zMC8xOSA2OjMzIFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+
PiBPbiBUaHUsIDI3IEp1biAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4gT24gNi8yNy8x
OSA3OjU1IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+Pj4+IE9uIE1vbiwgMTAgSnVu
IDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+Pj4+ICsxOgo+Pj4+Pj4gKyAgICAgICAgLyoK
Pj4+Pj4+ICsgICAgICAgICAqIEZpbmQgdGhlIHNlY29uZCBzbG90IHVzZWQuIFJlbW92ZSB0aGUg
ZW50cnkgZm9yIHRoZSBmaXJzdAo+Pj4+Pj4gKyAgICAgICAgICogdGFibGUgaWYgdGhlIHNsb3Qg
aXMgbm90IDEgKHJ1bnRpbWUgWGVuIG1hcHBpbmcgaXMgMk0gLQo+Pj4+Pj4gNE0pLgo+Pj4+Pj4g
KyAgICAgICAgICogRm9yIHNsb3QgMSwgaXQgbWVhbnMgdGhlIElEIG1hcCB3YXMgbm90IGNyZWF0
ZWQuCj4+Pj4+PiArICAgICAgICAgKi8KPj4+Pj4+ICsgICAgICAgIGxzciAgIHgxLCB4MTksICNT
RUNPTkRfU0hJRlQKPj4+Pj4+ICsgICAgICAgIGFuZCAgIHgxLCB4MSwgI0xQQUVfRU5UUllfTUFT
SyAgLyogeDEgOj0gZmlyc3Qgc2xvdCAqLwo+Pj4+Pj4gKyAgICAgICAgY21wICAgeDEsICMxCj4+
Pj4+PiArICAgICAgICBiZXEgICBpZF9tYXBfcmVtb3ZlZAo+Pj4+Pj4gKyAgICAgICAgLyogSXQg
aXMgbm90IGluIHNsb3QgMSwgcmVtb3ZlIHRoZSBlbnRyeSAqLwo+Pj4+Pj4gKyAgICAgICAgbGRy
ICAgeDAsID1ib290X3NlY29uZCAgICAgICAgICAvKiB4MCA6PSBzZWNvbmQgdGFibGUgKi8KPj4+
Pj4+ICsgICAgICAgIHN0ciAgIHh6ciwgW3gwLCB4MSwgbHNsICMzXQo+Pj4+Pgo+Pj4+PiBXb3Vs
ZG4ndCBpdCBiZSBhIGJpdCBtb3JlIHJlbGlhYmxlIGlmIHdlIGNoZWNrZWQgd2hldGhlciB0aGUg
c2xvdCBpbgo+Pj4+PiBxdWVzdGlvbiBmb3IgeDE5ICh3aGV0aGVyIHplcm8sIGZpcnN0LCBzZWNv
bmQpIGlzIGEgcGFnZXRhYmxlIHBvaW50ZXIgb3IKPj4+Pj4gc2VjdGlvbiBtYXAsIHRoZW4gemVy
byBpdCBpZiBpdCBpcyBhIHNlY3Rpb24gbWFwLCBvdGhlcndpc2UgZ28gZG93biBvbmUKPj4+Pj4g
bGV2ZWw/IElmIHdlIGRpZCBpdCB0aGlzIHdheSBpdCB3b3VsZCBiZSBpbmRlcGVuZGVudCBmcm9t
IHRoZSB3YXkKPj4+Pj4gY3JlYXRlX3BhZ2VfdGFibGVzIGlzIHdyaXR0ZW4uCj4+Pj4KPj4+PiBZ
b3VyIHN1Z2dlc3Rpb24gd2lsbCBub3QgY29tcGx5IHdpdGggdGhlIGFyY2hpdGVjdHVyZSBjb21w
bGlhbmNlIGFuZCBob3cKPj4+PiBYZW4KPj4+PiBpcy93aWxsIGJlIHdvcmtpbmcgYWZ0ZXIgdGhl
IGZ1bGwgcmV3b3JrLiBXZSB3YW50IHRvIHJlbW92ZSBldmVyeXRoaW5nCj4+Pj4gKG1hcHBpbmcg
KyB0YWJsZSkgYWRkZWQgc3BlY2lmaWNhbGx5IGZvciB0aGUgMToxIG1hcHBpbmcuCj4+Pj4KPj4+
PiBPdGhlcndpc2UsIHlvdSBtYXkgZW5kIHVwIGluIGEgcG9zaXRpb24gd2hlcmUgYm9vdF9maXJz
dF9pZCBpcyBzdGlsbCBpbgo+Pj4+IHBsYWNlLgo+Pj4+IFdlIHdvdWxkIG5lZWQgdG8gdXNlIHRo
ZSBicmVhay1iZWZvcmUtbWFrZSBzZXF1ZW5jZSBpbiBzdWJzZXF1ZW50IGNvZGUgaWYKPj4+PiB3
ZQo+Pj4+IHdlcmUgYWJvdXQgdG8gaW5zZXJ0IDFHQiBtYXBwaW5nIGF0IHRoZSBzYW1lIHBsYWNl
Lgo+Pj4+Cj4+Pj4gQWZ0ZXIgbXkgcmV3b3JrLCB3ZSB3b3VsZCBoYXZlIHZpcnR1YWxseSBubyBw
bGFjZSB3aGVyZSBicmVhay1iZWZvcmUtbWFrZQo+Pj4+IHdpbGwKPj4+PiBiZSBuZWNlc3Nhcnkg
YXMgaXQgd2lsbCBlbmZvcmNlIGFsbCB0aGUgbWFwcGluZ3MgdG8gYmUgZGVzdHJveWVkIGJlZm9y
ZQo+Pj4+IGhhbmQuCj4+Pj4gU28gSSB3b3VsZCByYXRoZXIgYXZvaWQgdG8gbWFrZSBhIHNwZWNp
ZmljIGNhc2UgZm9yIHRoZSAxOjEgbWFwcGluZy4KPj4+Cj4+PiBJIGRvbid0IGZ1bGx5IHVuZGVy
c3RhbmQgeW91ciBleHBsYW5hdGlvbi4gSSB1bmRlcnN0YW5kIHRoZSBmaW5hbCBnb2FsCj4+PiBv
ZiAicmVtb3ZpbmcgZXZlcnl0aGluZyAobWFwcGluZyArIHRhYmxlKSBhZGRlZCBzcGVjaWZpY2Fs
bHkgZm9yIHRoZSAxOjEKPj4+IG1hcHBpbmciLiBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IG15IHN1
Z2dlc3Rpb24gd291bGQgYmUgYSBoaW5kcmFuY2UKPj4+IHRvd2FyZCB0aGF0IGdvYWwsIGNvbXBh
cmVkIHRvIHdoYXQgaXQgaXMgZG9uZSBpbiB0aGlzIHBhdGNoLgo+Pgo+PiBCZWNhdXNlLCBBRkFJ
Q1QsIHlvdXIgc3VnZ2VzdGlvbiB3aWxsIG9ubHkgcmVtb3ZlIHRoZSBtYXBwaW5nIGFuZCBub3Qg
dGhlCj4+IHRhYmxlcyAoc3VjaCBhcyBib290X2ZpcnN0X2lkKS4gVGhpcyBpcyBkaWZmZXJlbnQg
ZnJvbSB0aGlzIHBhdGNoIHdoZXJlIGJvdGgKPj4gbWFwcGluZyBhbmQgdGFibGVzIGFyZSByZW1v
dmVkLgo+Pgo+PiBTbyB5ZXMsIG15IHN1Z2dlc3Rpb24gaXMgbm90IGdlbmVyaWMsIGJ1dCBhdCBs
ZWFzdCBpdCBkb2VzIHRoZSBqb2IgdGhhdCBpcwo+PiBleHBlY3RlZCBieSB0aGlzIGZ1bmN0aW9u
LiBJLmUgcmVtb3ZpbmcgYW55dGhpbmcgdGhhdCB3YXMgc3BlY2lmaWNhbGx5IGNyZWF0ZWQKPj4g
Zm9yIHRoZSBpZGVudGl0eSBtYXBwaW5nLgo+IAo+IEkgdW5kZXJzdGFuZCB5b3VyIGNvbW1lbnQg
bm93LCBhbmQgb2YgY291cnNlIEkgYWdyZWUgdGhhdCBib3RoIG1hcHBpbmcKPiBhbmQgdGFibGVz
IG5lZWQgdG8gYmUgcmVtb3ZlZC4KPiAKPiBJIGFtIGNhcmVmdWwgbWFraW5nIHN1Z2dlc3Rpb25z
IGZvciBhc3NlbWJseSBjb2RpbmcgYmVjYXVzZSBJIGRvbid0Cj4gcmVhbGx5IHdhbnQgdG8gc3Vn
Z2VzdCBzb21ldGhpbmcgdGhhdCBkb2Vzbid0IHdvcmssIG9yIGV2ZW4gaWYgaXQgd29ya3MKPiB0
aGF0IGl0J3Mgd29yc2UgdGhhbiB0aGUgb3JpZ2luYWwuCj4gCj4gSXQgc2hvdWxkIGJlIHBvc3Np
YmxlIHRvIHJlbW92ZSBib3RoIHRoZSB0YWJsZSBhbmQgdGhlIG1hcHBpbmcgaW4gYQo+IGdlbmVy
aWMgd2F5LiBJbnN0ZWFkIG9mIGhhcmRjb2RpbmcgdGhlIGFzc2VtcGx5IGVxdWl2YWxlbnQgb2Yg
Ikl0IGlzIG5vdAo+IGluIHNsb3QgMCwgcmVtb3ZlIHRoZSBlbnRyeSIsIHdlIGNvdWxkIGNoZWNr
IHdoZXRoZXIgdGhlIHRhYmxlIG9mZnNldAo+IG1hdGNoZXMgdGhlIHRhYmxlIG9mZnNldCBvZiB0
aGUgbWFwcGluZyB0aGF0IHdlIHdhbnQgdG8gcHJlc2VydmUuIFRoYXQKPiB3YXksICJzbG90IDAi
IHdvdWxkIGJlIGNhbGN1bGF0ZSBpbnN0ZWFkIG9mIGhhcmRjb2RlZCwgYW5kIHRoZSBjb2RlCj4g
d291bGQgYmUgcHJldHR5IGdlbmVyaWMuIFdoYXQgZG8geW91IHRoaW5rPyBJdCBzaG91bGQgb25s
eSBiZSBhIHNtYWxsCj4gYWRkaXRpb24uCgpJdCBzaG91bGQgYmUgZmVhc2libGUgYW5kIG1heSBh
Y3R1YWxseSBoZWxwIHRoZSBuZXh0IHN0ZXAgaW4gbXkgcGxhbiAKd2hlcmUgSSBuZWVkIHRvIG1h
a2UgWGVuIHJlbG9jYXRhYmxlLgoKSSB3aWxsIGhhdmUgYSBsb29rIGZvciBib3RoIHRoZSBhcm0z
MiBhbmQgYXJtNjQgY29kZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
