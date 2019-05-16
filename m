Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FDD2102C
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 23:41:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRO5d-0000MY-9b; Thu, 16 May 2019 21:39:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vv4c=TQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hRO5b-0000M5-J6
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 21:38:59 +0000
X-Inumbo-ID: 02d51ce0-7823-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 02d51ce0-7823-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 21:38:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97B0119BF;
 Thu, 16 May 2019 14:38:57 -0700 (PDT)
Received: from [10.37.12.1] (unknown [10.37.12.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F30B93F5AF;
 Thu, 16 May 2019 14:38:55 -0700 (PDT)
To: Anthony PERARD <anthony.perard@citrix.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
References: <osstest-136184-mainreport@xen.org>
 <20190516103727.GB5438@perard.uk.xensource.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c576ae9d-4a6e-1602-7f05-6fc2c7b26314@arm.com>
Date: Thu, 16 May 2019 22:38:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190516103727.GB5438@perard.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [qemu-upstream-4.11-testing test] 136184:
 regressions - FAIL
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW50aG9ueSwKClRoYW5rIHlvdSBmb3IgQ0NpbmcgbWUuCgpPbiA1LzE2LzE5IDExOjM3IEFN
LCBBbnRob255IFBFUkFSRCB3cm90ZToKPiBPbiBXZWQsIE1heSAxNSwgMjAxOSBhdCAwNzo0ODox
N1BNICswMDAwLCBvc3N0ZXN0IHNlcnZpY2Ugb3duZXIgd3JvdGU6Cj4+IGZsaWdodCAxMzYxODQg
cWVtdS11cHN0cmVhbS00LjExLXRlc3RpbmcgcmVhbCBbcmVhbF0KPj4gaHR0cDovL2xvZ3MudGVz
dC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNjE4NC8KPj4KPj4gUmVncmVzc2lv
bnMgOi0oCj4+Cj4+IFRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5n
LAo+PiBpbmNsdWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoKPj4gICBidWlsZC1h
cm02NC1wdm9wcyAgICAgICAgICAgICAgIDxqb2Igc3RhdHVzPiAgICAgICAgICAgICAgICAgYnJv
a2VuICBpbiAxMzQ1OTQKPj4gICBidWlsZC1hcm02NCAgICAgICAgICAgICAgICAgICAgIDxqb2Ig
c3RhdHVzPiAgICAgICAgICAgICAgICAgYnJva2VuICBpbiAxMzQ1OTQKPj4gICBidWlsZC1hcm02
NC14c20gICAgICAgICAgICAgICAgIDxqb2Igc3RhdHVzPiAgICAgICAgICAgICAgICAgYnJva2Vu
ICBpbiAxMzQ1OTQKPj4gICBidWlsZC1hcm02NC14c20gICAgICAgICAgICA0IGhvc3QtaW5zdGFs
bCg0KSBicm9rZW4gaW4gMTM0NTk0IFJFR1IuIHZzLiAxMjU1NzUKPj4gICBidWlsZC1hcm02NC1w
dm9wcyAgICAgICAgICA0IGhvc3QtaW5zdGFsbCg0KSBicm9rZW4gaW4gMTM0NTk0IFJFR1IuIHZz
LiAxMjU1NzUKPj4gICBidWlsZC1hcm02NCAgICAgICAgICAgICAgICA0IGhvc3QtaW5zdGFsbCg0
KSBicm9rZW4gaW4gMTM0NTk0IFJFR1IuIHZzLiAxMjU1NzUKPj4gICB0ZXN0LWFybTY0LWFybTY0
LWxpYnZpcnQteHNtICA3IHhlbi1ib290ICAgICAgICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAx
MjU1NzUKPj4gICB0ZXN0LWFybTY0LWFybTY0LXhsICAgICAgICAgICA3IHhlbi1ib290ICAgICAg
ICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMjU1NzUKPj4gICB0ZXN0LWFybTY0LWFybTY0LXhs
LXhzbSAgICAgICA3IHhlbi1ib290ICAgICAgICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMjU1
NzUKPj4gICB0ZXN0LWFybTY0LWFybTY0LXhsLWNyZWRpdDIgICA3IHhlbi1ib290ICAgICAgICAg
ICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMjU1NzUKPj4KPiAKPiBJYW4sIEp1bGllbiwKPiAKPiBJ
IGNhbid0IGZpZ3VyZSBvdXQgd2h5IFhlbiBjb25zaXN0ZW50bHkgZmFpbHMgdG8gYm9vdCBvbiBy
b2NoZXN0ZXIqIGluCj4gdGhlIHFlbXUtdXBzdHJlYW0tNC4xMS10ZXN0aW5nIGZsaWdodHMuIFRo
ZSB4ZW4tNC4xMS10ZXN0aW5nIHNlZW1zIHRvCj4gcGFzcy4KPiAKPiBBdCBib290LCB0aGUgYm9v
dCBsb2FkZXIgc2VlbXMgdG8gbG9hZCBibG9icywgYnV0IHdoZW4gaXQncyB0aW1lIHRvIFhlbgo+
IHRvIHNoaW5lLCB0aGVyZSBhcmUgbm8gb3V0cHV0IGZyb20gWGVuIG9uIHRoZSBzZXJpYWwuCgpU
aGUgc2VyaWFsIGNvbnNvbGUgaXMgaW5pdGlhbGl6aW5nIGZhaXJseSBsYXRlIGluIHRoZSBwcm9j
ZXNzLiBBbnkgCnVzZWZ1bCBtZXNzYWdlIChzdWNoIGFzIG1lbW9yeSBzZXR1cCBvciBldmVuIHBh
cnQgb2YgdGhlIGludGVycnVwdHMpIAp3aWxsIGJlIGhpZGUgb3V0LiBGb3IgZ2V0dGluZyB0aGVt
LCB5b3UgbmVlZCBlYXJseXByaW50ay4gVW5mb3J0dW5hdGVseSAKdGhleSBjYW4ndCBiZSBjb25m
aWd1cmVkIGF0IHJ1bnRpbWUgdG9kYXkgOiguCgo+IAo+IERvIHlvdSBrbm93IHdoYXQgY291bGQg
Y2F1c2UgeGVuIHRvIGZhaWwgdG8gYm9vdD8KCkl0IGlzIGhhcmQgdG8gc2F5IHdpdGhvdXQgdGhl
IGxvZy4gTG9va2luZyBhdCB0aGUgZGlmZmVyZW50IHdpdGggYSBYZW4gCjQuMTEgZmxpZ2h0cyBv
biByb2NoZXN0ZXIwIFsxXSwgaXQgc2VlbXMgdGhlIC5jb25maWcgaXMgc2xpZ2h0bHkgCmRpZmZl
cmVudC4gNC4xMSBmbGlnaHQgaGFzIENPTkZJR19MSVZFUEFUQ0ggc2V0LgoKSSB0cmllZCB0byBi
b290IHhlbiBidWlsdCBpbiB0aGlzIGZsaWdodCBvbiBhbiBpbnRlcm5hbCBib2FyZCwgYnV0IEkg
CmNhbid0IHNlZSBhbnkgZXJyb3IuIFNvIGl0IG1heSBiZSBzb21lIGJvYXJkIHNwZWNpZmljIGlz
c3Vlcy4KClNvcnJ5IEkgY2FuJ3QgcHJvdmlkZSBtb3JlIGlucHV0IHdpdGhvdXQgYSBwcm9wZXIg
aW52ZXN0aWdhdGlvbi4KCj4gSSBkb24ndCBiZWxpZXZlIGEgZmV3IG1vcmUgcGF0Y2ggb24gdG9w
IG9mIHFlbXUteGVuIHdvdWxkLgoKQ2hlZXJzLAoKWzFdIApodHRwOi8vbG9ncy50ZXN0LWxhYi54
ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM2MjMxL3Rlc3QtYXJtNjQtYXJtNjQteGwvaW5m
by5odG1sCj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
