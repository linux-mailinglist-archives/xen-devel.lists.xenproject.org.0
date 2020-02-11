Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFD2158BD9
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 10:26:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Rll-0007Gz-QX; Tue, 11 Feb 2020 09:23:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zfJQ=37=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j1Rlk-0007Gn-9w
 for xen-devel@lists.xen.org; Tue, 11 Feb 2020 09:23:48 +0000
X-Inumbo-ID: 348f23bc-4cb0-11ea-b537-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 348f23bc-4cb0-11ea-b537-12813bfff9fa;
 Tue, 11 Feb 2020 09:23:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0CA22B011;
 Tue, 11 Feb 2020 09:23:46 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xen.org>
References: <6722f058-61eb-30c9-f97d-def690ccd7b8@citrix.com>
 <6a3aa771-927b-b3bd-dd05-1eea90b0a97f@suse.com>
 <6f3a1061-fd05-91e8-54ad-666ec3984ffb@citrix.com>
 <c5831cef-ff27-93e5-7536-2d6092ca1ad8@citrix.com>
 <38a28a9d-cc99-0776-1f8b-4103df3d3e9c@suse.com>
 <9bff11d5-3b14-d57e-adc9-5d923297c3a0@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <360520f2-397c-2d09-6ee5-8e7809ec20e0@suse.com>
Date: Tue, 11 Feb 2020 10:23:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <9bff11d5-3b14-d57e-adc9-5d923297c3a0@citrix.com>
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDIuMjAgMTA6MDcsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4gT24gMDcvMDIvMjAyMCAw
ODowNCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4gT24gMDYuMDIuMjAgMTU6MDIsIFNlcmdleSBE
eWFzbGkgd3JvdGU6Cj4+PiBPbiAwNi8wMi8yMDIwIDExOjA1LCBTZXJnZXkgRHlhc2xpIHdyb3Rl
Ogo+Pj4+IE9uIDA2LzAyLzIwMjAgMDk6NTcsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+Pj4+IE9u
IDA1LjAyLjIwIDE3OjAzLCBTZXJnZXkgRHlhc2xpIHdyb3RlOgo+Pj4+Pj4gSGVsbG8sCj4+Pj4+
Pgo+Pj4+Pj4gSSdtIGN1cnJlbnRseSBpbnZlc3RpZ2F0aW5nIGEgTGl2ZS1QYXRjaCBhcHBsaWNh
dGlvbiBmYWlsdXJlIGluIGNvcmUtCj4+Pj4+PiBzY2hlZHVsaW5nIG1vZGUgYW5kIHRoaXMgaXMg
YW4gZXhhbXBsZSBvZiB3aGF0IEkgdXN1YWxseSBnZXQ6Cj4+Pj4+PiAoaXQncyBlYXNpbHkgcmVw
cm9kdWNpYmxlKQo+Pj4+Pj4KPj4+Pj4+ICAgICAgICAoWEVOKSBbICAzNDIuNTI4MzA1XSBsaXZl
cGF0Y2g6IGxwOiBDUFU4IC0gSVBJaW5nIHRoZSBvdGhlciAxNSBDUFVzCj4+Pj4+PiAgICAgICAg
KFhFTikgWyAgMzQyLjU1ODM0MF0gbGl2ZXBhdGNoOiBscDogVGltZWQgb3V0IG9uIHNlbWFwaG9y
ZSBpbiBDUFUgcXVpZXNjZSBwaGFzZSAxMy8xNQo+Pj4+Pj4gICAgICAgIChYRU4pIFsgIDM0Mi41
NTgzNDNdIGJhZCBjcHVzOiA2IDkKPj4+Pj4+Cj4+Pj4+PiAgICAgICAgKFhFTikgWyAgMzQyLjU1
OTI5M10gQ1BVOiAgICA2Cj4+Pj4+PiAgICAgICAgKFhFTikgWyAgMzQyLjU1OTU2Ml0gWGVuIGNh
bGwgdHJhY2U6Cj4+Pj4+PiAgICAgICAgKFhFTikgWyAgMzQyLjU1OTU2NV0gICAgWzxmZmZmODJk
MDgwMjNmMzA0Pl0gUiBjb21tb24vc2NoZWR1bGUuYyNzY2hlZF93YWl0X3JlbmRlenZvdXNfaW4r
MHhhNC8weDI3MAo+Pj4+Pj4gICAgICAgIChYRU4pIFsgIDM0Mi41NTk1NjhdICAgIFs8ZmZmZjgy
ZDA4MDIzZjhhYT5dIEYgY29tbW9uL3NjaGVkdWxlLmMjc2NoZWR1bGUrMHgxN2EvMHgyNjAKPj4+
Pj4+ICAgICAgICAoWEVOKSBbICAzNDIuNTU5NTcxXSAgICBbPGZmZmY4MmQwODAyNDBkNWE+XSBG
IGNvbW1vbi9zb2Z0aXJxLmMjX19kb19zb2Z0aXJxKzB4NWEvMHg5MAo+Pj4+Pj4gICAgICAgIChY
RU4pIFsgIDM0Mi41NTk1NzRdICAgIFs8ZmZmZjgyZDA4MDI3OGVjNT5dIEYgYXJjaC94ODYvZG9t
YWluLmMjZ3Vlc3RfaWRsZV9sb29wKzB4MzUvMHg2MAo+Pj4+Pj4KPj4+Pj4+ICAgICAgICAoWEVO
KSBbICAzNDIuNTU5NzYxXSBDUFU6ICAgIDkKPj4+Pj4+ICAgICAgICAoWEVOKSBbICAzNDIuNTYw
MDI2XSBYZW4gY2FsbCB0cmFjZToKPj4+Pj4+ICAgICAgICAoWEVOKSBbICAzNDIuNTYwMDI5XSAg
ICBbPGZmZmY4MmQwODAyNDE2NjE+XSBSIF9zcGluX2xvY2tfaXJxKzB4MTEvMHg0MAo+Pj4+Pj4g
ICAgICAgIChYRU4pIFsgIDM0Mi41NjAwMzJdICAgIFs8ZmZmZjgyZDA4MDIzZjMyMz5dIEYgY29t
bW9uL3NjaGVkdWxlLmMjc2NoZWRfd2FpdF9yZW5kZXp2b3VzX2luKzB4YzMvMHgyNzAKPj4+Pj4+
ICAgICAgICAoWEVOKSBbICAzNDIuNTYwMDM2XSAgICBbPGZmZmY4MmQwODAyM2Y4YWE+XSBGIGNv
bW1vbi9zY2hlZHVsZS5jI3NjaGVkdWxlKzB4MTdhLzB4MjYwCj4+Pj4+PiAgICAgICAgKFhFTikg
WyAgMzQyLjU2MDAzOV0gICAgWzxmZmZmODJkMDgwMjQwZDVhPl0gRiBjb21tb24vc29mdGlycS5j
I19fZG9fc29mdGlycSsweDVhLzB4OTAKPj4+Pj4+ICAgICAgICAoWEVOKSBbICAzNDIuNTYwMDQy
XSAgICBbPGZmZmY4MmQwODAyNzlkYjU+XSBGIGFyY2gveDg2L2RvbWFpbi5jI2lkbGVfbG9vcCsw
eDU1LzB4YjAKPj4+Pj4+Cj4+Pj4+PiBUaGUgZmlyc3QgSFQgc2libGluZyBpcyB3YWl0aW5nIGZv
ciB0aGUgc2Vjb25kIGluIHRoZSBMUC1hcHBsaWNhdGlvbgo+Pj4+Pj4gY29udGV4dCB3aGlsZSB0
aGUgc2Vjb25kIHdhaXRzIGZvciB0aGUgZmlyc3QgaW4gdGhlIHNjaGVkdWxlciBjb250ZXh0Lgo+
Pj4+Pj4KPj4+Pj4+IEFueSBzdWdnZXN0aW9ucyBvbiBob3cgdG8gaW1wcm92ZSB0aGlzIHNpdHVh
dGlvbiBhcmUgd2VsY29tZS4KPj4+Pj4KPj4+Pj4gQ2FuIHlvdSB0ZXN0IHRoZSBhdHRhY2hlZCBw
YXRjaCwgcGxlYXNlPyBJdCBpcyBvbmx5IHRlc3RlZCB0byBib290LCBzbwo+Pj4+PiBJIGRpZCBu
byBsaXZlcGF0Y2ggdGVzdHMgd2l0aCBpdC4KPj4+Pgo+Pj4+IFRoYW5rIHlvdSBmb3IgdGhlIHBh
dGNoISBJdCBzZWVtcyB0byBmaXggdGhlIGlzc3VlIGluIG15IG1hbnVhbCB0ZXN0aW5nLgo+Pj4+
IEknbSBnb2luZyB0byBzdWJtaXQgYXV0b21hdGljIExQIHRlc3RpbmcgZm9yIGJvdGggdGhyZWFk
L2NvcmUgbW9kZXMuCj4+Pgo+Pj4gQW5kcmV3IHN1Z2dlc3RlZCB0byB0ZXN0IGxhdGUgdWNvZGUg
bG9hZGluZyBhcyB3ZWxsIGFuZCBzbyBJIGRpZC4KPj4+IEl0IHVzZXMgc3RvcF9tYWNoaW5lKCkg
dG8gcmVuZGV6dm91cyBjcHVzIGFuZCBpdCBmYWlsZWQgd2l0aCBhIHNpbWlsYXIKPj4+IGJhY2t0
cmFjZSBmb3IgYSBwcm9ibGVtYXRpYyBDUFUuIEJ1dCBpbiB0aGlzIGNhc2UgdGhlIHN5c3RlbSBj
cmFzaGVkCj4+PiBzaW5jZSB0aGVyZSBpcyBubyB0aW1lb3V0IGludm9sdmVkOgo+Pj4KPj4+ICAg
ICAgIChYRU4pIFsgIDE1NS4wMjUxNjhdIFhlbiBjYWxsIHRyYWNlOgo+Pj4gICAgICAgKFhFTikg
WyAgMTU1LjA0MDA5NV0gICAgWzxmZmZmODJkMDgwMjQxN2YyPl0gUiBfc3Bpbl91bmxvY2tfaXJx
KzB4MjIvMHgzMAo+Pj4gICAgICAgKFhFTikgWyAgMTU1LjA2OTU0OV0gICAgWzxmZmZmODJkMDgw
MjNmM2MyPl0gUyBjb21tb24vc2NoZWR1bGUuYyNzY2hlZF93YWl0X3JlbmRlenZvdXNfaW4rMHhh
Mi8weDI3MAo+Pj4gICAgICAgKFhFTikgWyAgMTU1LjEwOTY5Nl0gICAgWzxmZmZmODJkMDgwMjNm
NzI4Pl0gRiBjb21tb24vc2NoZWR1bGUuYyNzY2hlZF9zbGF2ZSsweDE5OC8weDI2MAo+Pj4gICAg
ICAgKFhFTikgWyAgMTU1LjE0NTUyMV0gICAgWzxmZmZmODJkMDgwMjQwZTFhPl0gRiBjb21tb24v
c29mdGlycS5jI19fZG9fc29mdGlycSsweDVhLzB4OTAKPj4+ICAgICAgIChYRU4pIFsgIDE1NS4x
ODAyMjNdICAgIFs8ZmZmZjgyZDA4MDM3MTZmNj5dIEYgeDg2XzY0L2VudHJ5LlMjcHJvY2Vzc19z
b2Z0aXJxcysweDYvMHgyMAo+Pj4KPj4+IEl0IGxvb2tzIGxpa2UgeW91ciBwYXRjaCBwcm92aWRl
cyBhIHdvcmthcm91bmQgZm9yIExQIGNhc2UsIGJ1dCBvdGhlcgo+Pj4gY2FzZXMgbGlrZSBzdG9w
X21hY2hpbmUoKSByZW1haW4gYnJva2VuIHNpbmNlIHRoZSB1bmRlcmx5aW5nIGlzc3VlIHdpdGgK
Pj4+IHRoZSBzY2hlZHVsZXIgaXMgc3RpbGwgdGhlcmUuCj4+Cj4+IEFuZCBoZXJlIGlzIHRoZSBm
aXggZm9yIHVjb2RlIGxvYWRpbmcgKHRoYXQgd2FzIGluIGZhY3QgdGhlIG9ubHkgY2FzZQo+PiB3
aGVyZSBzdG9wX21hY2hpbmVfcnVuKCkgd2Fzbid0IGFscmVhZHkgY2FsbGVkIGluIGEgdGFza2xl
dCkuCj4+Cj4+IEkgaGF2ZSBkb25lIGEgbWFudWFsIHRlc3QgbG9hZGluZyBuZXcgdWNvZGUgd2l0
aCBjb3JlIHNjaGVkdWxpbmcKPj4gYWN0aXZlLgo+IAo+IFRoZSBwYXRjaCBzZWVtcyB0byBmaXgg
dGhlIGlzc3VlLCB0aGFua3MhCj4gRG8geW91IHBsYW4gdG8gcG9zdCB0aGUgMiBwYXRjaGVzIHRv
IHRoZSBNTCBub3cgZm9yIHByb3BlciByZXZpZXc/CgpZZXMuCgoKSnVlcmdlbgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
