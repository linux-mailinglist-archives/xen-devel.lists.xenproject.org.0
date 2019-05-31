Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DCA30ED5
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 15:27:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWhVJ-0000iB-LG; Fri, 31 May 2019 13:23:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2tza=T7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hWhVI-0000i6-AC
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 13:23:28 +0000
X-Inumbo-ID: 462e8049-83a7-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 462e8049-83a7-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 13:23:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06C89A78;
 Fri, 31 May 2019 06:23:27 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C2CF3F5AF;
 Fri, 31 May 2019 06:23:25 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <5CF0F33A0200007800233D8F@prv1-mh.provo.novell.com>
 <5CF0F5700200007800233DB4@prv1-mh.provo.novell.com>
 <f78f627c-753f-a162-14a1-b193908f673a@arm.com>
 <5CF0F8BE0200007800233DE3@prv1-mh.provo.novell.com>
 <f8edeb03-b223-e723-0b02-9ca565fe8055@arm.com>
 <5CF0FC080200007800233E50@prv1-mh.provo.novell.com>
 <7ca91b27-1c37-70ab-e367-494603e4464d@arm.com>
 <5CF1026F0200007800233ED8@prv1-mh.provo.novell.com>
 <aa27503b-7fcb-dbf0-1f69-6aae35b6f4c1@arm.com>
 <5CF105FD0200007800233F31@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <60e875e1-a0fa-9c3d-0bfc-55ae567d409f@arm.com>
Date: Fri, 31 May 2019 14:23:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF105FD0200007800233F31@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] dom_cow is needed for mem-sharing only
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMzEvMDUvMjAxOSAxMTo0NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MzEuMDUuMTkgYXQgMTI6MzQsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IE5vIGl0
IHdhcyBhIG1vcmUgZ2VuZXJpYyBzdGF0ZW1lbnQgb24gdGhlIHN0YW5jZSAiSXQgYWxyZWFkeSBl
eGlzdHMgaW4KPj4gWGVuIHNvIGl0IGlzIGZpbmUgdG8gc3ByZWFkIHRoZW0gYSBiaXQgbW9yZSIu
Cj4gCj4gT2gsIEkgc2VlLiBPZiBjb3Vyc2UgSSdtIG1ha2luZyByZW1hcmtzIHdoZW4gd2hhdCdz
IGluIHRoZSB0cmVlIGlzCj4gYmFkIChhcyBwZXIgZS5nLiBjb2Rpbmcgc3R5bGUsIG9yIGlmIG5v
dCBtZW50aW9uZWQgdGhlcmUgdGhhbiBpbiBteQo+IHBlcnNvbmFsIG9waW5pb24pLiBBcyBhIHJl
c3VsdCBJIHRha2Ugbm90ZSBvZiB5b3UgdGhpbmtpbmcgdGhpcyBiZWluZwo+IGJhZCBwcmFjdGlj
ZSwgYW5kIHRoZSB0d28gb2YgdXMgZGlzYWdyZWVpbmcuIEknbSBjZXJ0YWlubHkgd2lsbGluZyB0
bwo+IGFkanVzdCBub24tb2J2aW91cyBjb2RlIHRvIGEgbW9yZSBvYnZpb3VzIHNoYXBlIGluIHZh
cmlvdXMgY2FzZXMsCj4gYnV0IEkgdGhpbmsgdGhlcmUgbmVlZHMgdG8gYmUgYSBsaW1pdCBhcyB0
byB3aGF0IGxhbmd1YWdlIGZlYXR1cmVzCj4gd2UgZGVjaWRlIHNob3VsZCBub3QgYmUgdXNlZCBp
biB0aGUgY29kZSBiYXNlLiBPdmVycmlkaW5nCj4gZGVjbGFyYXRpb25zIChhbmQgaW4gc29tZSBj
YXNlcyBldmVuIGRlZmluaXRpb25zKSBieSBtYWNyb3MgaXMgYQo+IHVzZWZ1bCB0aGluZyBmb3Ig
Z2VuZXJhbCByZWFkYWJpbGl0eSBpbiBjZXJ0YWluIGNhc2VzIGluIG15IG9waW5pb24sCj4gYW5k
IHdoaWxlIGl0J3Mgbm90IG1ha2luZyBtdWNoIG9mIGRpZmZlcmVuY2UgaGVyZSBJJ2Qgc3RpbGwg
cHJlZmVyIGlmCj4gSSB3YXMgYWxsb3dlZCB0byBnZXQgYXdheSB3aXRoIHRoaXMsIHVubGVzcyBh
IG1ham9yaXR5IHN1cHBvcnRzCj4geW91ciB2aWV3LiBJT1cgLSB5b3VyIGNoYW5nZSByZXF1ZXN0
IGlzLCBhcyBwZXIgbXkgb3duCj4gcGVyc3BlY3RpdmUsIG1ha2luZyB0aGUgY29kZSBsZXNzIGVh
c3kgdG8gcmVhZCwgZXZlbiBpZiBub3QgYnkKPiBtdWNoLgoKTGV0IHdpbGwgd2FpdCB0aGUgb3Bp
bmlvbiBmcm9tIHRoZSBvdGhlcnMgaGVyZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
