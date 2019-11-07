Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D57AF2823
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 08:38:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iScKn-0008Fl-G0; Thu, 07 Nov 2019 07:36:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iScKl-0008Fg-N0
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 07:35:59 +0000
X-Inumbo-ID: 3d8dc1fa-0131-11ea-a1b9-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d8dc1fa-0131-11ea-a1b9-12813bfff9fa;
 Thu, 07 Nov 2019 07:35:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 560D0B159;
 Thu,  7 Nov 2019 07:35:58 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <db66edf2-ca66-4127-8920-ba55f4aee14e@suse.com>
 <65dd1d8b-fc41-78f6-f988-d354c5ada99c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f2aacaf9-0ad9-4920-82e6-b0abfc22bc5d@suse.com>
Date: Thu, 7 Nov 2019 08:36:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <65dd1d8b-fc41-78f6-f988-d354c5ada99c@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 0/3] AMD/IOMMU: re-work mode updating
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Sander Eikelenboom <linux@eikelenboom.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMTEuMjAxOSAxODozMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNi8xMS8yMDE5
IDE1OjE2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gdXBkYXRlX3BhZ2luZ19tb2RlKCkgaW4gdGhl
IEFNRCBJT01NVSBjb2RlIGV4cGVjdHMgdG8gYmUgaW52b2tlZCB3aXRoCj4+IHRoZSBQQ0kgZGV2
aWNlcyBsb2NrIGhlbGQuIFRoZSBjaGVjayBvY2N1cnJpbmcgb25seSB3aGVuIHRoZSBtb2RlCj4+
IGFjdHVhbGx5IG5lZWRzIHVwZGF0aW5nLCB0aGUgdmlvbGF0aW9uIG9mIHRoaXMgcnVsZSBieSB0
aGUgbWFqb3JpdHkKPj4gb2YgY2FsbGVycyBkaWQgZ28gdW5ub3RpY2VkIHVudGlsIHBlci1kb21h
aW4gSU9NTVUgc2V0dXAgd2FzIGNoYW5nZWQKPj4gdG8gZG8gYXdheSB3aXRoIG9uLWRlbWFuZCBj
cmVhdGlvbiBvZiBJT01NVSBwYWdlIHRhYmxlcy4KPj4KPj4gVW5mb3J0dW5hdGVseSB0aGUgb25s
eSBoYWxmIHdheSByZWFzb25hYmxlIGZpeCB0byB0aGlzIHRoYXQgSSBjb3VsZAo+PiBjb21lIHVw
IHdpdGggcmVxdWlyZXMgbW9yZSByZS13b3JrIHRoYW4gd291bGQgc2VlbSBkZXNpcmFibGUgYXQg
dGhpcwo+PiB0aW1lIG9mIHRoZSByZWxlYXNlIHByb2Nlc3MsIGJ1dCBhZGRyZXNzaW5nIHRoZSBp
c3N1ZSBzZWVtcwo+PiB1bmF2b2lkYWJsZSB0byBtZSBhcyBpdHMgbWFuaWZlc3RhdGlvbiBpcyBh
IHJlZ3Jlc3Npb24gZnJvbSB0aGUKPj4gSU9NTVUgcGFnZSB0YWJsZSBzZXR1cCByZS13b3JrLiBU
aGUgY2hhbmdlIGFsc28gaXNuJ3Qgd2l0aG91dCByaXNrCj4+IG9mIGZ1cnRoZXIgcmVncmVzc2lv
bnMgLSBpZiBpbiBwYXRjaCAyIEkndmUgbWlzc2VkIGEgY29kZSBwYXRoIHRoYXQKPj4gd291bGQg
YWxzbyBuZWVkIHRvIGludm9rZSB0aGUgbmV3IGhvb2ssIHRoZW4gdGhpcyBtaWdodCBtZWFuIG5v
bi0KPj4gd29ya2luZyBndWVzdHMgKHdpdGggcGFzc2VkLXRocm91Z2ggZGV2aWNlcyBvbiBBTUQg
aGFyZHdhcmUpLgo+Pgo+PiAxOiBBTUQvSU9NTVU6IGRvbid0IG5lZWRsZXNzbHkgdHJpZ2dlciBl
cnJvcnMvY3Jhc2hlcyB3aGVuIHVubWFwcGluZyBhIHBhZ2UKPj4gMjogaW50cm9kdWNlIEdGTiBu
b3RpZmljYXRpb24gZm9yIHRyYW5zbGF0ZWQgZG9tYWlucwo+PiAzOiBBTUQvSU9NTVU6IHVzZSBu
b3RpZnlfZGZuKCkgaG9vayB0byB1cGRhdGUgcGFnaW5nIG1vZGUKPiAKPiBIYXZpbmcgbm93IGxv
b2tlZCBhdCBhbGwgdGhyZWUsIHdoeSBkb24ndCB3ZSBqdXN0IGRlbGV0ZSB0aGUgZHluYW1pYwo+
IGhlaWdodCBvZiBBTUQgSU9NTVUgcGFnZXRhYmxlcz8KPiAKPiBUaGlzIHNlcmllcyBsb29rcyBz
dXNwaWNpb3VzbHkgbGlrZSBpdCBpcyBhZGRpbmcgbmV3IGNvbW1vbgo+IGluZnJhc3RydWN0dXJl
IHRvIHdvcmsgYXJvdW5kIHRoZSBmYWN0IHdlJ3JlIGRvaW5nIHNvbWV0aGluZyBmYWlybHkgZHVt
Ygo+IHRvIGJlaW5nIHdpdGguCj4gCj4gSGFyZGNvZGluZyBhdCA0IGxldmVscyBpcywgYXQgdGhl
IHZlcnkgd29yc3QsIDIgZXh0cmEgcGFnZXMgcGVyIGRvbWFpbiwKPiBhbmQgYSBzdWJzdGFudGlh
bCByZWR1Y3Rpb24gaW4gdGhlIGNvbXBsZXhpdHkgb2YgdGhlIElPTU1VIGNvZGUuCgpZZXQgYW4g
YWRkaXRpb25hbCBsZXZlbCBvZiBwYWdlIHdhbGtzIGhhcmR3YXJlIGhhcyB0byBwZXJmb3JtLiBB
bHNvCjQgbGV2ZWxzIHdvbid0IGNvdmVyIGFsbCBwb3NzaWJsZSA1MiBhZGRyZXNzIGJpdHMuIEFu
ZCBmaW5hbGx5LCB0aGUKbW9yZSBhcHBsaWNhYmxlIHlvdXIgInN1YnN0YW50aWFsIHJlZHVjdGlv
biIsIHRoZSBsZXNzIHN1aXRhYmxlIHN1Y2gKYSBjaGFuZ2UgbWF5IGJlIGF0IHRoaXMgcG9pbnQg
b2YgdGhlIHJlbGVhc2UgKGJ1dCBJIGRpZG4ndCBsb29rIGF0CnRoaXMgc2lkZSBvZiB0aGluZ3Mg
aW4gYW55IGRldGFpbCwgc28gaXQgbWF5IHdlbGwgbm90IGJlIGFuIGlzc3VlKS4KCkphbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
