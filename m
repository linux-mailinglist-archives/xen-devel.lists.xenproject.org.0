Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D694153554
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 17:37:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izNeC-00070s-PT; Wed, 05 Feb 2020 16:35:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lMay=3Z=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1izNeB-00070n-FC
 for xen-devel@lists.xen.org; Wed, 05 Feb 2020 16:35:27 +0000
X-Inumbo-ID: 831e5f86-4835-11ea-9157-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 831e5f86-4835-11ea-9157-12813bfff9fa;
 Wed, 05 Feb 2020 16:35:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 601FCACA0;
 Wed,  5 Feb 2020 16:35:25 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xen.org>
References: <6722f058-61eb-30c9-f97d-def690ccd7b8@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <110d888d-96f4-68d5-9b85-7ba56145590e@suse.com>
Date: Wed, 5 Feb 2020 17:35:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <6722f058-61eb-30c9-f97d-def690ccd7b8@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Live-Patch application failure in core-scheduling
 mode
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
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDIuMjAgMTc6MDMsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4gSGVsbG8sCj4gCj4gSSdt
IGN1cnJlbnRseSBpbnZlc3RpZ2F0aW5nIGEgTGl2ZS1QYXRjaCBhcHBsaWNhdGlvbiBmYWlsdXJl
IGluIGNvcmUtCj4gc2NoZWR1bGluZyBtb2RlIGFuZCB0aGlzIGlzIGFuIGV4YW1wbGUgb2Ygd2hh
dCBJIHVzdWFsbHkgZ2V0Ogo+IChpdCdzIGVhc2lseSByZXByb2R1Y2libGUpCj4gCj4gICAgICAo
WEVOKSBbICAzNDIuNTI4MzA1XSBsaXZlcGF0Y2g6IGxwOiBDUFU4IC0gSVBJaW5nIHRoZSBvdGhl
ciAxNSBDUFVzCj4gICAgICAoWEVOKSBbICAzNDIuNTU4MzQwXSBsaXZlcGF0Y2g6IGxwOiBUaW1l
ZCBvdXQgb24gc2VtYXBob3JlIGluIENQVSBxdWllc2NlIHBoYXNlIDEzLzE1Cj4gICAgICAoWEVO
KSBbICAzNDIuNTU4MzQzXSBiYWQgY3B1czogNiA5Cj4gCj4gICAgICAoWEVOKSBbICAzNDIuNTU5
MjkzXSBDUFU6ICAgIDYKPiAgICAgIChYRU4pIFsgIDM0Mi41NTk1NjJdIFhlbiBjYWxsIHRyYWNl
Ogo+ICAgICAgKFhFTikgWyAgMzQyLjU1OTU2NV0gICAgWzxmZmZmODJkMDgwMjNmMzA0Pl0gUiBj
b21tb24vc2NoZWR1bGUuYyNzY2hlZF93YWl0X3JlbmRlenZvdXNfaW4rMHhhNC8weDI3MAo+ICAg
ICAgKFhFTikgWyAgMzQyLjU1OTU2OF0gICAgWzxmZmZmODJkMDgwMjNmOGFhPl0gRiBjb21tb24v
c2NoZWR1bGUuYyNzY2hlZHVsZSsweDE3YS8weDI2MAo+ICAgICAgKFhFTikgWyAgMzQyLjU1OTU3
MV0gICAgWzxmZmZmODJkMDgwMjQwZDVhPl0gRiBjb21tb24vc29mdGlycS5jI19fZG9fc29mdGly
cSsweDVhLzB4OTAKPiAgICAgIChYRU4pIFsgIDM0Mi41NTk1NzRdICAgIFs8ZmZmZjgyZDA4MDI3
OGVjNT5dIEYgYXJjaC94ODYvZG9tYWluLmMjZ3Vlc3RfaWRsZV9sb29wKzB4MzUvMHg2MAo+IAo+
ICAgICAgKFhFTikgWyAgMzQyLjU1OTc2MV0gQ1BVOiAgICA5Cj4gICAgICAoWEVOKSBbICAzNDIu
NTYwMDI2XSBYZW4gY2FsbCB0cmFjZToKPiAgICAgIChYRU4pIFsgIDM0Mi41NjAwMjldICAgIFs8
ZmZmZjgyZDA4MDI0MTY2MT5dIFIgX3NwaW5fbG9ja19pcnErMHgxMS8weDQwCj4gICAgICAoWEVO
KSBbICAzNDIuNTYwMDMyXSAgICBbPGZmZmY4MmQwODAyM2YzMjM+XSBGIGNvbW1vbi9zY2hlZHVs
ZS5jI3NjaGVkX3dhaXRfcmVuZGV6dm91c19pbisweGMzLzB4MjcwCj4gICAgICAoWEVOKSBbICAz
NDIuNTYwMDM2XSAgICBbPGZmZmY4MmQwODAyM2Y4YWE+XSBGIGNvbW1vbi9zY2hlZHVsZS5jI3Nj
aGVkdWxlKzB4MTdhLzB4MjYwCj4gICAgICAoWEVOKSBbICAzNDIuNTYwMDM5XSAgICBbPGZmZmY4
MmQwODAyNDBkNWE+XSBGIGNvbW1vbi9zb2Z0aXJxLmMjX19kb19zb2Z0aXJxKzB4NWEvMHg5MAo+
ICAgICAgKFhFTikgWyAgMzQyLjU2MDA0Ml0gICAgWzxmZmZmODJkMDgwMjc5ZGI1Pl0gRiBhcmNo
L3g4Ni9kb21haW4uYyNpZGxlX2xvb3ArMHg1NS8weGIwCj4gCj4gVGhlIGZpcnN0IEhUIHNpYmxp
bmcgaXMgd2FpdGluZyBmb3IgdGhlIHNlY29uZCBpbiB0aGUgTFAtYXBwbGljYXRpb24KPiBjb250
ZXh0IHdoaWxlIHRoZSBzZWNvbmQgd2FpdHMgZm9yIHRoZSBmaXJzdCBpbiB0aGUgc2NoZWR1bGVy
IGNvbnRleHQuCj4gCj4gQW55IHN1Z2dlc3Rpb25zIG9uIGhvdyB0byBpbXByb3ZlIHRoaXMgc2l0
dWF0aW9uIGFyZSB3ZWxjb21lLgoKV29ya2luZyBvbiBpdC4gU2hvdWxkIGJlIGRvYWJsZS4KCgpK
dWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
