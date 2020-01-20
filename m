Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87320142749
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 10:30:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itTK2-0001Zw-SF; Mon, 20 Jan 2020 09:26:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1itTK0-0001Zr-La
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 09:26:12 +0000
X-Inumbo-ID: e0cb2c62-3b66-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0cb2c62-3b66-11ea-9fd7-bc764e2007e4;
 Mon, 20 Jan 2020 09:26:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AD749AAB8;
 Mon, 20 Jan 2020 09:26:02 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200115170015.249667-1-anthony.perard@citrix.com>
 <20200115170015.249667-3-anthony.perard@citrix.com>
 <1b0dcb84-425c-48a2-dba8-03385d3bf4e2@suse.com>
 <20200116122922.GA1288@perard.uk.xensource.com>
 <f09684ed-4a82-0547-8cd1-019a6b762fe4@suse.com>
 <20200117162345.GE1288@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <65c07ce5-7a43-8a57-54c6-e81ae5fa6bcb@suse.com>
Date: Mon, 20 Jan 2020 10:26:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200117162345.GE1288@perard.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v3 2/6] xen: Have Kconfig check $(CC)'s
 version
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDEuMjAyMCAxNzoyMywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gT24gVGh1LCBKYW4g
MTYsIDIwMjAgYXQgMDE6NDA6MzlQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE2
LjAxLjIwMjAgMTM6MjksIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+PiBJbmRlZWQsIGhlbmNlIGFs
c28gbXkgImFzIHN1Z2dlc3RlZCBiZWZvcmUiLiBJIHJlbWFpbiB1bmNvbnZpbmNlZAo+PiB0aGF0
IGlzIGl0IHVzZWZ1bCB0byBoYXZlIGUuZy4KPj4KPj4gQ09ORklHX0dDQ19WRVJTSU9OPTgwMzAw
Cj4+IENPTkZJR19DTEFOR19WRVJTSU9OPTAKPj4KPj4gaW4geGVuLy5jb25maWcuIFRoaXMgaXMg
YXQgYmVzdCBjb25mdXNpbmcsIGJlY2F1c2UgaXQgbWF5IG5vdAo+PiByZXByZXNlbnQgd2hhdCB0
aGUgc3lzdGVtIGFjdHVhbGx5IGhhcyBpbnN0YWxsZWQgKHdoaWNoIEkgcmVhbGl6ZQo+PiBpcyBh
bHNvIG5vdCB0aGUgaW50ZW50aW9uLCBidXQgdGhlIHZhcmlhYmxlIG5hbWluZyBzdWdnZXN0cyB0
aGF0Cj4+IHRoaXMgaXMgd2hhdCB3YXMgZm91bmQgb24gdGhlIHN5c3RlbTsgSSBoYXZlIG5vIGJl
dHRlciBuYW1pbmcKPj4gc3VnZ2VzdGlvbiwgdG8gcHJlZW1wdCBhIHBvc3NpYmxlIHF1ZXN0aW9u
IHRvIHRoaXMgZWZmZWN0KS4KPiAKPiBBZnRlciBhIHRhbGsgb24gI3hlbmRldmVsIHllc3RlcmRh
eSwgSSBoYXZlIEdlb3JnZSBhZ3JlZWluZyB0aGF0IHdlCj4gc2hvdWxkIGtlZXAgdGhlIHNhbWUg
YmVoYXZpb3IgYXMgdGhlIG9uZSBMaW51eCBoYXZlLiBBbmQgSWFuIHNheWluZyB0aGF0Cj4gd2Ug
c2hvdWxkIGNvcHkgZW50aXJlIGZpbGVzIHdoZXJlIHdlIGNhbi4gSWYgd2UgbW9kaWZ5IHRoZSBi
ZWhhdmlvciBvZgo+ICVfVkVSU0lPTiwgaXQgd291bGQgbWFrZSBpdCBtb3JlIGRpZmZpY3VsdCB0
byBjb3B5IGVudGlyZSBmaWxlcyBmcm9tCj4gJUxpbnV4IGxhdGVyLgo+IAo+IFNvLCBub3csIGNh
biB3ZSBmaW5hbGx5IGNvbW1pdCB0aGUgcGF0Y2ggc2VyaWVzLCB3aXRoIGJvdGggJV9WRVJTSU9O
Cj4gc2V0LCBhbmQgbGV0IHRoaXMgYmlrZXNoZWRkaW5nIHJlc3QsIGFuZCBtb3ZlIG9uPwoKV2Vs
bCwgc29tZW9uZSBmZWVsIGZyZWUgdG8gZ28gYWhlYWQgdGhlbi4gRXZlcnkgdGltZSBJJ2xsIGdl
dCB0byBzZWUKdGhpcyBJJ2xsIGJlIHRlbXB0ZWQgdG8gY2xlYW4gdXAgdGhlIHJlZHVuZGFuY3ks
IGJ1dCBzbyBiZSBpdC4gKEkKZG9uJ3QgdmlldyB0aGlzIGFzIGJpa2Ugc2hlZGRpbmcgYXQgYWxs
LCBidHcuIFdoaWxlIGV2ZXJ5IGluZGl2aWR1YWwKaW5zdGFuY2UgbWF5IG5vdCBtYXR0ZXIgbXVj
aCwgaXQgaXMgdGhlIHN1bSBvZiB0aGVtIHRoYXQgSSdtIHdvcnJpZWQKYWJvdXQuKQoKSmFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
