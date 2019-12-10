Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 349C0118374
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 10:24:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iebhj-0001dr-M6; Tue, 10 Dec 2019 09:21:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1mH3=2A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iebhi-0001dm-Sm
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 09:21:14 +0000
X-Inumbo-ID: 695a3734-1b2e-11ea-890a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 695a3734-1b2e-11ea-890a-12813bfff9fa;
 Tue, 10 Dec 2019 09:21:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E1ED7B02C;
 Tue, 10 Dec 2019 09:21:12 +0000 (UTC)
To: Eslam Elnikety <elnikety@amazon.com>
References: <20191209084119.87563-1-elnikety@amazon.com>
 <180013ce-7b18-335a-f04b-1db0d4f2adf4@citrix.com>
 <eca670cd-7f8c-a662-320a-43981ba60c9a@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5bdb27b7-f827-23bd-a1dd-a0cec039ce54@suse.com>
Date: Tue, 10 Dec 2019 10:21:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <eca670cd-7f8c-a662-320a-43981ba60c9a@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/microcode: Support builtin CPU microcode
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTIuMjAxOSAyMjo0OSwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4gT24gMDkuMTIuMTkg
MTY6MTksIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDA5LzEyLzIwMTkgMDg6NDEsIEVzbGFt
IEVsbmlrZXR5IHdyb3RlOgo+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4gKysrIGIveGVuL2FyY2gveDg2
L21pY3JvY29kZS9NYWtlZmlsZQo+Pj4gQEAgLTAsMCArMSw0MCBAQAo+Pj4gKyMgQ29weXJpZ2h0
IChDKSAyMDE5IEFtYXpvbi5jb20sIEluYy4gb3IgaXRzIGFmZmlsaWF0ZXMuCj4+PiArIyBBdXRo
b3I6IEVzbGFtIEVsbmlrZXR5IDxlbG5pa2V0eUBhbWF6b24uY29tPgo+Pj4gKyMKPj4+ICsjIFRo
aXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQv
b3IgbW9kaWZ5Cj4+PiArIyBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQo+Pj4gKyMgdGhlIEZyZWUgU29mdHdhcmUgRm91
bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiBvZiB0aGUgTGljZW5zZSwgb3IKPj4+ICsjIChhdCB5
b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCj4+PiArIwo+Pj4gKyMgVGhpcyBwcm9ncmFt
IGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCj4+PiAr
IyBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJy
YW50eSBvZgo+Pj4gKyMgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxB
UiBQVVJQT1NFLiAgU2VlIHRoZQo+Pj4gKyMgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9y
IG1vcmUgZGV0YWlscy4KPj4+ICsKPj4+ICtvYmoteSArPSBidWlsdGluX3Vjb2RlLm8KPj4+ICsK
Pj4+ICsjIERpcmVjdG9yeSBob2xkaW5nIHRoZSBtaWNyb2NvZGUgdXBkYXRlcy4KPj4+ICtVQ09E
RV9ESVI9JChwYXRzdWJzdCAiJSIsJSwkKENPTkZJR19CVUlMVElOX1VDT0RFX0RJUikpCj4+PiAr
YW1kLWJsb2JzIDo9ICQod2lsZGNhcmQgJChVQ09ERV9ESVIpL2FtZC11Y29kZS8qKQo+Pj4gK2lu
dGVsLWJsb2JzIDo9ICQod2lsZGNhcmQgJChVQ09ERV9ESVIpL2ludGVsLXVjb2RlLyopCj4+Cj4+
IFRoaXMgaXMgYSBsaXR0bGUgZGFuZ2Vyb3VzLsKgIEkgY2FuIHNlZSB3aHkgeW91IHdhbnQgdG8g
ZG8gaXQgbGlrZSB0aGlzLAo+PiBhbmQgSSBjYW4ndCBwcm92aWRlIGFueSBvYnZpb3VzIHN1Z2dl
c3Rpb25zLCBidXQgaWYgdGhpcyBnbG9iIHBpY2tzIHVwCj4+IGFueXRoaW5nIHdoaWNoIGlzbid0
IGEgbWljcm9jb2RlIGZpbGUsIGl0IHdpbGwgYnJlYWsgdGhlIGxvZ2ljIHRvIHNlYXJjaAo+PiBm
b3IgdGhlIHJpZ2h0IGJsb2IuCj4+Cj4gCj4gV2UgY2FuIGxpbWl0IHRoZSBhbWQtYmxvYnMgYW5k
IGludGVsLWJsb2IgdG8gYmluYXJpZXMgZm9sbG93aW5nIHRoZSAKPiBuYW1pbmcgY29udmVudGlv
biBBdXRoZW50aWNBTUQuYmluIGFuZCBHZW51aW5lSW50ZWwuYmluIGZvciBhbWQgYW5kIAo+IGlu
dGVsLCByZXNwZWN0aXZlbHkuIFlldCwgdGhpcyB3b3VsZCBiZSBpbXBvc2luZyBhbiB1bm5lY2Vz
c2FyeSAKPiByZXN0cmljdGlvbiBvbiBhZG1pbmlzdHJhdG9ycyB3aG8gbWF5IHdhbnQgdG8gYmUg
aW5ub3ZhdGl2ZSB3aXRoIG5hbWluZyAKPiAob3Igd2FudCB0byB1c2UgdGhlIG5hbWluZyBtaWNy
b2NvZGVfYW1kXyouYmluIG9yIEZGLU1NLVNTIGluc3RlYWQpLgo+IAo+IEFsdGVybmF0aXZlbHks
IHdlIGNhbiBpbnRyb2R1Y2UgQ09ORklHX0JVSUxUSU5fVUNPREVfSU5URUwgYW5kIAo+IENPTkZJ
R19CVUlMVElOX1VDT0RFX0FNRC4gQm90aCBkZWZhdWx0IHRvIGVtcHR5IHN0cmluZ3MuIFRoZW4s
IGFuIAo+IGFkbWluaXN0cmF0b3IgY2FuIHNwZWNpZnkgZXhhY3RseSB0aGUgbWljcm9jb2RlcyB0
byBpbmNsdWRlIHJlbGF0aXZlIHRvIAo+IHRoZSBDT05GSUdfQlVJTFRJTl9VQ09ERV9ESVIuIEZv
ciBleGFtcGxlOgo+IENPTkZJR19CVUlMVElOX1VDT0RFX0lOVEVMPSJpbnRlbC11Y29kZS8wNi0z
YS0wOSIKPiBDT05GSUdfQlVJTFRJTl9VQ09ERV9BTUQ9ImFtZC11Y29kZS9taWNyb2NvZGVfYW1k
X2ZhbTE1aC5iaW4iCgpUaGlzIHdvdWxkIG1ha2UgdGhlIGZlYXR1cmUgZXZlbiBsZXNzIGdlbmVy
aWMgLSBJIGFscmVhZHkgbWVhbnQgdG8KYXNrIHdoZXRoZXIgYnVpbGRpbmcgdWNvZGUgaW50byBi
aW5hcmllcyBpcyByZWFsbHkgYSB1c2VmdWwgdGhpbmcKd2hlbiB3ZSBhbHJlYWR5IGhhdmUgbW9y
ZSBmbGV4aWJsZSB3YXlzLiBJIGNvdWxkIHNlZSB0aGlzIGJlaW5nCnVzZWZ1bCBpZiB0aGVyZSB3
YXMgbm8gb3RoZXIgd2F5IHRvIG1ha2UgdWNvZGUgYXZhaWxhYmxlIGF0IGJvb3QKdGltZS4KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
