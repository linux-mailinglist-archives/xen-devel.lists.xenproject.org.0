Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AE66D057
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 16:51:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho7hj-00082i-Fj; Thu, 18 Jul 2019 14:48:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6kuv=VP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ho7hi-00082Y-8a
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 14:48:18 +0000
X-Inumbo-ID: 1290e824-a96b-11e9-ac46-8f17ca86f671
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1290e824-a96b-11e9-ac46-8f17ca86f671;
 Thu, 18 Jul 2019 14:48:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B53A4AC90;
 Thu, 18 Jul 2019 14:48:13 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <f2f3f5f2-8b9c-ac9c-00e8-1e601ec71070@citrix.com>
 <3cb1c2b777e623a55bf87dc12a155734667ab23e.camel@suse.com>
 <c8f4c719-ce7c-9ca0-7d5b-c34db3f21e38@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <a57d18f4-e947-5c3e-3d8d-6e1371f0c9af@suse.com>
Date: Thu, 18 Jul 2019 16:48:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <c8f4c719-ce7c-9ca0-7d5b-c34db3f21e38@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 00/60] xen: add core scheduling support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 RobertVanVossen <robert.vanvossen@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDcuMTkgMTY6MDgsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4gT24gMDUvMDcvMjAxOSAx
NDo1NiwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4+IE9uIEZyaSwgMjAxOS0wNy0wNSBhdCAxNDox
NyArMDEwMCwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPj4+IDEpIFRoaXMgY3Jhc2ggaXMgcXVpdGUg
bGlrZWx5IHRvIGhhcHBlbjoKPj4+Cj4+PiBbMjAxOS0wNy0wNCAxODoyMjo0NiBVVENdIChYRU4p
IFsgMzQyNS4yMjA2NjBdIFdhdGNoZG9nIHRpbWVyIGRldGVjdHMKPj4+IHRoYXQgQ1BVMiBpcyBz
dHVjayEKPj4+IFsyMDE5LTA3LTA0IDE4OjIyOjQ2IFVUQ10gKFhFTikgWyAzNDI1LjIyNjI5M10g
LS0tLVsgWGVuLTQuMTMuMC0KPj4+IDguMC42LWQgIHg4Nl82NCAgZGVidWc9eSAgIE5vdCB0YWlu
dGVkIF0tLS0tCj4+PiBbLi4uXQo+Pj4gWzIwMTktMDctMDQgMTg6MjI6NDcgVVRDXSAoWEVOKSBb
IDM0MjUuNTAxOTg5XSBYZW4gY2FsbCB0cmFjZToKPj4+IFsyMDE5LTA3LTA0IDE4OjIyOjQ3IFVU
Q10gKFhFTikgWwo+Pj4gMzQyNS41MDUyNzhdICAgIFs8ZmZmZjgyZDA4MDIzZDU3OD5dIHZjcHVf
c2xlZXBfc3luYysweDUwLzB4NzEKPj4+IFsyMDE5LTA3LTA0IDE4OjIyOjQ3IFVUQ10gKFhFTikg
Wwo+Pj4gMzQyNS41MTE1MThdICAgIFs8ZmZmZjgyZDA4MDIwODM3MD5dIHZjcHVfcGF1c2UrMHgy
MS8weDIzCj4+PiBbMjAxOS0wNy0wNCAxODoyMjo0NyBVVENdIChYRU4pIFsKPj4+IDM0MjUuNTE3
MzI2XSAgICBbPGZmZmY4MmQwODAyM2UyNWQ+XQo+Pj4gdmNwdV9zZXRfcGVyaW9kaWNfdGltZXIr
MHgyNy8weDczCj4+PiBbMjAxOS0wNy0wNCAxODoyMjo0NyBVVENdIChYRU4pIFsKPj4+IDM0MjUu
NTI0MjU4XSAgICBbPGZmZmY4MmQwODAyMDk2ODI+XSBkb192Y3B1X29wKzB4MmM5LzB4NjY4Cj4+
PiBbMjAxOS0wNy0wNCAxODoyMjo0NyBVVENdIChYRU4pIFsKPj4+IDM0MjUuNTMwMjM4XSAgICBb
PGZmZmY4MmQwODAyNGY5NzA+XSBjb21wYXRfdmNwdV9vcCsweDI1MC8weDM5MAo+Pj4gWzIwMTkt
MDctMDQgMTg6MjI6NDcgVVRDXSAoWEVOKSBbCj4+PiAzNDI1LjUzNjU2Nl0gICAgWzxmZmZmODJk
MDgwMzgzOTY0Pl0gcHZfaHlwZXJjYWxsKzB4MzY0LzB4NTY0Cj4+PiBbMjAxOS0wNy0wNCAxODoy
Mjo0NyBVVENdIChYRU4pIFsKPj4+IDM0MjUuNTQyNzE5XSAgICBbPGZmZmY4MmQwODAzODU2NDQ+
XSBkb19lbnRyeV9pbnQ4MisweDI2LzB4MmQKPj4+IFsyMDE5LTA3LTA0IDE4OjIyOjQ3IFVUQ10g
KFhFTikgWwo+Pj4gMzQyNS41NDg4NzZdICAgIFs8ZmZmZjgyZDA4MDM4ODM5Yj5dIGVudHJ5X2lu
dDgyKzB4YmIvMHhjMAo+Pj4KPj4gTW1tLi4uIHZjcHVfc2V0X3BlcmlvZGljX3RpbWVyPwo+Pgo+
PiBXaGF0IGtlcm5lbCBpcyB0aGlzIGFuZCB3aGVuIGRvZXMgdGhpcyBjcmFzaCBoYXBwZW4/Cj4g
Cj4gSGkgRGFyaW8sCj4gCj4gSSBjYW4gZWFzaWx5IHJlcHJvZHVjZSB0aGlzIGNyYXNoIHVzaW5n
IGEgRGViaWFuIDcgUFYgVk0gKDIgdkNQVXMsIDJHQiBSQU0pCj4gd2hpY2ggaGFzIHRoZSBmb2xs
b3dpbmcga2VybmVsOgo+IAo+ICMgdW5hbWUgLWEKPiAKPiBMaW51eCBsb2NhbGhvc3QgMy4yLjAt
NC1hbWQ2NCAjMSBTTVAgRGViaWFuIDMuMi43OC0xIHg4Nl82NCBHTlUvTGludXgKPiAKPiBBbGwg
SSBuZWVkIHRvIGRvIGlzIHN1c3BlbmQgYW5kIHJlc3VtZSB0aGUgVk0uCgpIYXBwZW5zIHdpdGgg
YSBtb3JlIHJlY2VudCBrZXJuZWwsIHRvby4KCkkgY2FuIGVhc2lseSByZXByb2R1Y2UgdGhlIGlz
c3VlIHdpdGggYW55IFBWIGd1ZXN0IHdpdGggbW9yZSB0aGFuIDEgdmNwdQpieSBkb2luZyAieGwg
c2F2ZSIgYW5kIHRoZW4gInhsIHJlc3RvcmUiIGFnYWluLgoKV2l0aCB0aGUgcmVwcm9kdWNlciBi
ZWluZyBhdmFpbGFibGUgSSdtIG5vdyBkaXZpbmcgaW50byB0aGUgaXNzdWUuLi4KCgpKdWVyZ2Vu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
