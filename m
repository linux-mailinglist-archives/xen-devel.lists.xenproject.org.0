Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3341050CF
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 11:43:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXju7-0006Wj-MX; Thu, 21 Nov 2019 10:41:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXju6-0006Wc-HJ
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 10:41:38 +0000
X-Inumbo-ID: 7e7b999c-0c4b-11ea-984a-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e7b999c-0c4b-11ea-984a-bc764e2007e4;
 Thu, 21 Nov 2019 10:41:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E8128B2B9;
 Thu, 21 Nov 2019 10:41:36 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <8e8866de-33a8-68c0-3352-d6dfeec4a9b6@suse.com>
 <f2232cd2-4786-2b8e-d649-0635309edb92@suse.com>
 <480f4d49-0a5f-c011-a5b8-85a9fc6352af@xen.org>
 <48afa07d-8219-3a2e-45eb-e3dec2bcb89e@suse.com>
 <ae71b47b-3fcf-01c5-5bc8-83948c2f209b@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cdc1afc7-46b4-63dc-6844-16ab40b97229@suse.com>
Date: Thu, 21 Nov 2019 11:41:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <ae71b47b-3fcf-01c5-5bc8-83948c2f209b@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/2] introduce GFN notification for
 translated domains
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Sander Eikelenboom <linux@eikelenboom.it>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTEuMjAxOSAxMTowNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IAo+IAo+IE9uIDIxLzEx
LzIwMTkgMDk6MDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAyMC4xMS4yMDE5IDIxOjIyLCBK
dWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBPbiAxNC8xMS8yMDE5IDE2OjQzLCBKYW4gQmV1bGljaCB3
cm90ZToKPj4+PiBUQkQ6IERvZXMgQXJtIGFjdHVhbGx5IGhhdmUgYW55dGhpbmcgdG8gY2hlY2sg
YWdhaW5zdCBpbiBpdHMKPj4+PiAgICAgICAgYXJjaF9ub3RpZnlfZ2ZuKCk/Cj4+Pgo+Pj4gSSB1
bmRlcnN0YW5kIHRoYXQgd2Ugd2FudCB0byBrZWVwIHRoZSBjb2RlIG1vc3RseSBnZW5lcmljLCBi
dXQgSSBhbSBhCj4+PiBiaXQgY29uY2VybmVkIG9mIHRoZSBleHRyYSBjb3N0IHRvIHVzZSBub3Rp
ZnlfZ2ZuKCkgKGFuZCBpbmRpcmVjdGx5Cj4+PiBpb21tdV9ub3RpZnlfZ2ZuKCkpIGZvciBkb2lu
ZyBub3RoaW5nLgo+Pj4KPj4+IEkgY2FuJ3Qgc2VlIGFueSBkaXJlY3QgdXNlIG9mIHRoaXMgZm9y
IHRoZSBmb3Jlc2VhYmxlIGZ1dHVyZSBvbiBBcm0uIFNvCj4+PiBjb3VsZCB3ZSBnYXRlIHRoaXMg
dW5kZXIgYSBjb25maWcgb3B0aW9uPwo+Pgo+PiBUaGlzIGlzIGFuIG9wdGlvbiwgc3VyZS4gQWx0
ZXJuYXRpdmVseSBJIGNvdWxkIHNlZSBhYm91dCBtYWtpbmcgdGhpcwo+PiBhbiBpbmxpbmUgZnVu
Y3Rpb24sIGJ1dCBpaXJjIHRoZXJlIHdlcmUgaGVhZGVyIGRlcGVuZGVuY3kgaXNzdWVzLgo+PiBU
aGVuIGFnYWluIC0gaXMgYSBjYWxsIHRvIGEgZnVuY3Rpb24gZG9pbmcgYWxtb3N0IG5vdGhpbmcg
cmVhbGx5IHNvCj4+IG11Y2ggZXh0cmEgb3ZlcmhlYWQgb24gQXJtLgo+IAo+IEFGQUlDVCwgdGhp
cyBpcyBhIHdvcmthcm91bmQgZm9yIEFNRCBkcml2ZXIuIFNvIGFueSBpbXBhY3QgKG5vIG1hdHRl
ciAKPiB0aGUgc2l6ZSkgZmVlbHMgbm90IHJpZ2h0IGZvciBBcm0uCj4gCj4gSW4gdGhpcyBwYXJ0
aWN1bGFyIGNhc2UsIHRoZSBvbmx5IHRoaW5nIEkgcmVxdWVzdCBpcyB0byBwcm90ZWN0IHRoZSAK
PiBub3RpZnlfZ2ZuICYgY2FsbGJhY2sgd2l0aCAhQ09ORklHX0lPTU1VX0ZPUkNFX1NIQVJFLgoK
T2gsIHRoZXJlIGFscmVhZHkgaXMgYSBzdWl0YWJsZSBjb25maWcgb3B0aW9uLiBXaWxsIGRvIChh
bmQKY292ZXIgc2hhcmVfcDJtX3RhYmxlKCkgYXQgdGhlIHNhbWUgdGltZSkuCgo+Pj4+IC0tLSBh
L3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwo+Pj4+ICsrKyBiL3hlbi9jb21tb24vZ3JhbnRfdGFi
bGUuYwo+Pj4+IEBAIC05NDYsNiArOTQ2LDE2IEBAIG1hcF9ncmFudF9yZWYoCj4+Pj4gICAgICAg
ICAgICByZXR1cm47Cj4+Pj4gICAgICAgIH0KPj4+PiAgICAKPj4+PiArICAgIGlmICggcGFnaW5n
X21vZGVfdHJhbnNsYXRlKGxkKSAvKiAmJiAob3AtPmZsYWdzICYgR05UTUFQX2hvc3RfbWFwKSAq
LyAmJgo+Pj4KPj4+IEkgdGhpbmsgdGhpcyB3YW50cyBhbiBleHBsYW5hdGlvbiBpbiB0aGUgY29k
ZSB3aHkgdGhlIGNoZWNrIGlzIGNvbW1lbnRlZC4KPj4KPj4gSG1tLCBpbiBzdWNoIGEgY2FzZSBJ
J2QgcmF0aGVyIG9taXQgdGhlIGNvbW1lbnRlZCBjb25kaXRpb24uIEl0Cj4+IGJlaW5nIGNvbW1l
bnRlZCBoYXMgdGhlIHB1cnBvc2Ugb2YgZG9jdW1lbnRpbmcgaXRzZWxmLgo+IAo+IEkgZmFpbCB0
byB1bmRlcnN0YW5kIHdoeSBHTlRNQVBfaG9zdF9tYXAgd291bGQgYWx3YXlzIGJlIHRydWUgaW4g
dGhlIGNhc2UuCj4gCj4gQUZBSVUgdGhlIGNvZGUsIHRoaXMgaXMgb25seSBjb3JyZWN0IGZvciBw
YWdpbmdfbW9kZV9leHRlcm5hbChsZCkgPT0gMS4gCj4gRG9lcyBpdCBtZWFuIHRoYXQgcGFnaW5n
X21vZGVfdHJhbnNsYXRlKGxkKSBhbmQgcGFnaW5nX21vZGVfZXh0ZXJuYWwobGQpIAo+IGFyZSBh
bHdheXMgZXF1YWw/IElmIHNvLCB3aGF0J3MgdGhlIHBvaW50IG9mIGhhdmluZyB0d28gbWFjcm8g
KGFuZCB0d28gCj4gZmxhZ3MpPwoKSGlzdG9yaWNhbCByZWFzb25zLiBOb3dhZGF5cyB0cmFuc2xh
dGUgPT0gZXh0ZXJuYWwgPT0gcmVmY291bnRzIG9uCng4Ni4gQnV0IHNpbmNlIHRoaXMgaXMgY29t
bW9uIGNvZGUsIHBlcmhhcHMgSSBiZXR0ZXIgdW4tY29tbWVudCB0aGF0CnBhcnQgb2YgdGhlIGNv
bmRpdGlvbmFsLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
