Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6603C72CEF
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 13:10:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqF7E-0000Sk-8s; Wed, 24 Jul 2019 11:07:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mQw0=VV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hqF7D-0000Sf-8i
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 11:07:23 +0000
X-Inumbo-ID: 337ab06e-ae03-11e9-ad06-af0dbba493d0
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 337ab06e-ae03-11e9-ad06-af0dbba493d0;
 Wed, 24 Jul 2019 11:07:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01979337;
 Wed, 24 Jul 2019 04:07:18 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D518B3F71A;
 Wed, 24 Jul 2019 04:07:16 -0700 (PDT)
To: Roman Shaposhnik <roman@zededa.com>,
 Sushant Bhangale <Sushant.Bhangale@ltts.com>
References: <MA1PR01MB3851BEA4FBF03BB603B1A971E8F20@MA1PR01MB3851.INDPRD01.PROD.OUTLOOK.COM>
 <MA1PR01MB3851A10D5DE69A99DDB292A0E8C70@MA1PR01MB3851.INDPRD01.PROD.OUTLOOK.COM>
 <CAMmSBy-uMGqa3SDwhmoutmorsg+KUi8ddr-9r2wRMEyZcpCRGw@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <761fb7e2-2096-f2f6-3693-8f2b5c18fb0b@arm.com>
Date: Wed, 24 Jul 2019 12:07:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy-uMGqa3SDwhmoutmorsg+KUi8ddr-9r2wRMEyZcpCRGw@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen Hypervisor porting on Raspberry Pi 3B+/4
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
Cc: "lars.kurth@citrix.com" <lars.kurth@citrix.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>,
 "xenprojecthelp@linuxfoundation.org" <xenprojecthelp@linuxfoundation.org>,
 Nikhil Wadke <Nikhil.Wadke@ltts.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Pranav Paralikar <Pranav.Paralikar@ltts.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyMy8wNy8yMDE5IDE4OjU1LCBSb21hbiBTaGFwb3NobmlrIHdyb3RlOgo+IEl0IHdv
dWxkIGJlIGdyZWF0IHRvIGhhdmUgWGVuIHJ1bm5pbmcgb24gUlBpLCBidXQgSSBoYXZlIHRvIHdv
bmRlcjogaXMKPiBpdCBub3cgcG9zc2libGUgdG8gd29ya2Fyb3VuZCBSUGkgbGltaXRhdGlvbnMg
b2YgaG93IEdQVSBib290cz8KPiAgICAgaHR0cHM6Ly93d3cucmFzcGJlcnJ5cGkub3JnL2ZvcnVt
cy92aWV3dG9waWMucGhwP3Q9MTg3MDg2I3AxMjA2NDg3Cj4gCj4gSSB0aG91Z2h0IHRoYXQgdGhp
cyBpcyBjb21wbGV0ZWx5IGxvY2tlZCwgcHJvcHJpZXRhcnkgYmNtMjgzNyBjb2RlCj4gdGhhdCBY
ZW4gY2FuJ3QgZG8gbXVjaCBvZiBhbnl0aGluZyBhYm91dC4KClRoYXQncyBub3QgcmVhbGx5IGEg
cHJvYmxlbS4gUGVvcGxlIGhhdmUgbWFuYWdlZCB0byBnZXQgb3RoZXIgaHlwZXJ2aXNvciBydW5u
aW5nIApvbiBSUEkuIFRoZSBtYWpvciBpc3N1ZSBpcyBnb2luZyB0byBiZSB0aGUgaW50ZXJydXB0
IGNvbnRyb2xsZXIsIHRoZSBSUEkzIGRvZXMgCm5vdCBoYXZlIGEgR0lDIHdoaWNoIGlzIGEgcmVx
dWlyZW1lbnQgZm9yIHVzaW5nIFhlbi4KCklmIHlvdSB3YW50IHRvIGdldCBYZW4gd29ya2luZyBv
biBSUEkzLCB0aGVuIHlvdSB3b3VsZCBhdCBsZWFzdCBuZWVkIHRvIHByb3ZpZGUgCmRyaXZlciBm
b3IgdGhlIGludGVycnVwdCBjb250cm9sbGVyIGFuZCBlbXVsYXRlIGl0IGZvciB0aGUgZ3Vlc3Rz
LiBBbHRlcm5hdGl2ZWx5IAp5b3UgY291bGQgcHJvdmlkZSBhIFBWIGludGVyZmFjZSBhcyB4ODYg
dXNlIHRvIGRvLiBCb3RoIGNhc2VzIGFyZSBnb2luZyB0byAKcmVxdWlyZSBhIGZhaXIgYW1vdW50
IG9mIHdvcmsgYW5kIHZlcnkgdW5saWtlbHkgdG8gYmUgYWNjZXB0ZWQgdXBzdHJlYW0uIEkgd291
bGQgCmxpa2UgdG8ga2VlcCBYZW4gc21hbGwgYW5kIHNpbXBsZS4KCkFueXdheSwgUmFzYmVycnkg
UEkgZm91bmRhdGlvbiBqdXN0IHJlbGVhc2UgUlBJNCB3aGljaCBub3cgY29udGFpbiBhIEdJQy4g
U28gCnRoaXMgc2hvdWxkIG1ha2UgZWFzaWVyIHRvIGdldCBYZW4gd29ya2luZyBvbiB0aGUgcGxh
dGZvcm0uCgpBbmRyZSAoaW4gQ0MpIGhhcyBiZWVuIHdvcmtpbmcgb24gcG9ydGluZyBBcm0gVHJ1
c3RlZCBGaXJtd2FyZSB0byB0aGUgUlBJNCBhbmQgCm1hbmFnZSB0byBnZXQgWGVuIGJvb3Rpbmcg
dXAgdG8gdGhlIHN0YWdlIG9mIGJyaW5naW5nLXVwIHNlY29uZGFyeSBDUFVzIChzZWUgWzFdLgoK
SSBhbHNvIGJvdWdodCBhIFJQSTQgc28gSSB3aWxsIGhhdmUgYSBnbyBhdCBYZW4gd2hlbiBJIGhh
dmUgc29tZSBzcGFyZSB0aW1lLgoKQ2hlZXJzLAoKWzFdIGh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tdXNlcnMvMjAxOS0wNy9tc2cwMDAzMi5odG1sCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
