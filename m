Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE5312F9DC
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 16:33:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inOu5-0001t2-1R; Fri, 03 Jan 2020 15:30:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1inOu3-0001sw-NP
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 15:30:19 +0000
X-Inumbo-ID: edab5d02-2e3d-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id edab5d02-2e3d-11ea-88e7-bc764e2007e4;
 Fri, 03 Jan 2020 15:30:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CFA7EAE04;
 Fri,  3 Jan 2020 15:30:09 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191224151932.6304-1-andrew.cooper3@citrix.com>
 <20191224151932.6304-11-andrew.cooper3@citrix.com>
 <4503eb28-fb43-a3bf-29d0-6e9a3e419dfb@suse.com>
 <7229f757-5764-aa9b-013b-c7772cff7b9a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ee3c5bf5-03f5-f1f8-ef20-7fb5e8b34fcf@suse.com>
Date: Fri, 3 Jan 2020 16:30:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <7229f757-5764-aa9b-013b-c7772cff7b9a@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 10/12] docs/migration: Specify X86_{CPUID,
 MSR}_POLICY records
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDEuMjAyMCAxNTo1NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMy8wMS8yMDIw
IDE0OjQ5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjQuMTIuMjAxOSAxNjoxOSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IEBAIC00MzksNiArNDQ5LDM0IEBAIGRlZiB2ZXJpZnlfcmVjb3Jk
X3N0YXRpY19kYXRhX2VuZChzZWxmLCBjb250ZW50KToKPj4+ICAgICAgICAgICAgICByYWlzZSBS
ZWNvcmRFcnJvcigiU3RhdGljIGRhdGEgZW5kIHJlY29yZCBmb3VuZCBpbiB2MiBzdHJlYW0iKQo+
Pj4gIAo+Pj4gIAo+Pj4gKyAgICBkZWYgdmVyaWZ5X3JlY29yZF94ODZfY3B1aWRfcG9saWN5KHNl
bGYsIGNvbnRlbnQpOgo+Pj4gKyAgICAgICAgIiIiIHg4NiBDUFVJRCBwb2xpY3kgcmVjb3JkICIi
Igo+Pj4gKwo+Pj4gKyAgICAgICAgaWYgc2VsZi52ZXJzaW9uIDwgMzoKPj4+ICsgICAgICAgICAg
ICByYWlzZSBSZWNvcmRFcnJvcigieDg2IENQVUlEIHBvbGljeSByZWNvcmQgZm91bmQgaW4gdjIg
c3RyZWFtIikKPj4+ICsKPj4+ICsgICAgICAgIHN6ID0gY2FsY3NpemUoWDg2X0NQVUlEX1BPTElD
WV9GT1JNQVQpCj4+PiArICAgICAgICBjb250ZW50c3ogPSBsZW4oY29udGVudCkKPj4+ICsKPj4+
ICsgICAgICAgIGlmIGNvbnRlbnRzeiA8IHN6IG9yIChjb250ZW50c3ogJSBzeikgIT0gMDoKPj4+
ICsgICAgICAgICAgICByYWlzZSBSZWNvcmRFcnJvcigiUmVjb3JkIGxlbmd0aCAldSwgZXhwZWN0
ZWQgbXVsdGlwbGUgb2YgJXUiICUKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAo
Y29udGVudHN6LCBzeikpCj4+PiArCj4+PiArCj4+PiArICAgIGRlZiB2ZXJpZnlfcmVjb3JkX3g4
Nl9tc3JfcG9saWN5KHNlbGYsIGNvbnRlbnQpOgo+Pj4gKyAgICAgICAgIiIiIHg4NiBNU1IgcG9s
aWN5IHJlY29yZCAiIiIKPj4+ICsKPj4+ICsgICAgICAgIGlmIHNlbGYudmVyc2lvbiA8IDM6Cj4+
PiArICAgICAgICAgICAgcmFpc2UgUmVjb3JkRXJyb3IoIng4NiBNU1IgcG9saWN5IHJlY29yZCBm
b3VuZCBpbiB2MiBzdHJlYW0iKQo+Pj4gKwo+Pj4gKyAgICAgICAgc3ogPSBjYWxjc2l6ZShYODZf
TVNSX1BPTElDWV9GT1JNQVQpCj4+PiArICAgICAgICBjb250ZW50c3ogPSBsZW4oY29udGVudCkK
Pj4+ICsKPj4+ICsgICAgICAgIGlmIGNvbnRlbnRzeiA8IHN6IG9yIChjb250ZW50c3ogJSBzeikg
IT0gMDoKPj4+ICsgICAgICAgICAgICByYWlzZSBSZWNvcmRFcnJvcigiUmVjb3JkIGxlbmd0aCAl
dSwgZXhwZWN0ZWQgbXVsdGlwbGUgb2YgJXUiICUKPj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAoY29udGVudHN6LCBzeikpCj4+IFdoaWxlIEkgY2FuJ3QgZXZlbiBzZWUgYSB0aGVv
cmV0aWNhbCBjYXNlIG9mIHRoZSBDUFVJRCBhcnJheQo+PiBoYXZpbmcgemVybyBlbGVtZW50cywg
aXMgaXQgcmVhbGx5IGVudGlyZWx5IGltcGxhdXNpYmxlIHRvIGhhdmUKPj4gYW4gZW1wdHkgTVNS
cyBhcnJheT8gSS5lLiB3b3VsZG4ndCB0aGUgbGVmdCBzaWRlIG9mIHRoZSAib3IiCj4+IGJldHRl
ciBnbyBhd2F5Pwo+IAo+IE1TUnMgd2lsbCBuZXZlciBoYXZlIDAgZW50cmllcywgYmVjYXVzZSB1
bmxpa2UgQ1BVSUQsIHdlIGNhbid0IG9taXQKPiByZWNvcmRzIHdpdGggMHMgYXMgdGhlaXIgY29u
dGVudC7CoCBUaGlzIGJlY29tZXMgYW1iaWd1b3VzIHdoZW4gdGhlCj4gcG9saWN5IGRlZmF1bHQg
aXMgbm9uemVyby4KCklzbid0IHRoZSBzYW1lIHRydWUgZm9yIENQVUlELCBpbiBwYXJ0aWN1bGFy
IHNvbWUgb2YgdGhlIG5vbi1ib29sZWFuCmZpZWxkcz8KCj4gV2hlbiB3ZSBkbyBnYWluIG1vcmUg
TVNScywgSSB3aWxsIHNlZSBhYm91dCBvcmdhbmlzaW5nIGVsaXNpb24gYmFzZWQgb24KPiBDUFVJ
RCBmZWF0dXJlcywgc28gd2UgZG9uJ3QgaGF2ZSB0byBzZW5kIGEgMCBmb3IgZXZlcnkgc2luZ2xl
IE1TUiBpbiB0aGUKPiBwb2xpY3ksIGJ1dCBNU1JzIHdpdGhvdXQgQ1BVSUQgZW51bWVyYXRpb24g
bXVzdCBhbHdheXMgYmUgc2VudC4KPiAKPiBUaGlzIG1lYW5zIHRoYXQgdGhlIG9uZSBNU1Igd2Ug
aGF2ZSBjdXJyZW50bHkgKE1TUl9JTlRFTF9QTEFURk9STV9JTkZPCj4gZm9yIENQVUlEIEZhdWx0
aW5nLCB3aGljaCB3ZSBhbHNvIHZpcnR1YWxpc2Ugb24gQU1EIGhhcmR3YXJlKSBzaGFsbAo+IHVu
Y29uZGl0aW9uYWxseSBiZSBwcmVzZW50IGZvcmV2ZXIgbW9yZS4KCkhtbSwgeWVzLiBTdGlsbCB0
aGUgc3BlY2lhbCBjYXNpbmcgb2YgdGhlcmUgbmVlZGluZyB0byBiZSBhdCBsZWFzdApvbmUgZW50
cnkgbG9va3MgYSBsaXR0bGUgb2RkIGhlcmUgKGFuZCBhbHNvIGZvciBDUFVJRCkuIEkgd291bGQK
ZmluZCBpdCBtb3JlIGxvZ2ljYWwgaWYgdGhlcmUgd2FzIGp1c3QgdGhlIHJlbWFpbmRlci1tdXN0
LWJlLXplcm8KY2hlY2suIEJ1dCB0aGlzIGlzIGxpYnhjIGNvZGUsIHNvIEknbSBub3QgdGhlIG9u
ZSB0byByZWFsbHkganVkZ2UKYW55d2F5LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
