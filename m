Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6EECDE2D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 11:27:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHPGR-0000Ls-Ie; Mon, 07 Oct 2019 09:25:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C2cV=YA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iHPGP-0000Ln-SQ
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 09:25:09 +0000
X-Inumbo-ID: 597a9600-e8e4-11e9-97a8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 597a9600-e8e4-11e9-97a8-12813bfff9fa;
 Mon, 07 Oct 2019 09:25:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A0F41B1A5;
 Mon,  7 Oct 2019 09:25:05 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <20190930191610.27545-1-andrew.cooper3@citrix.com>
 <f8eb4fdc-bec8-a6cd-2657-f163169eeee5@suse.com>
 <41d5ccea-b58c-ed3b-5cc8-8966d2850125@citrix.com>
 <d2d26eef-521a-02b6-68b1-5477530c8901@suse.com>
 <b4258bee-ba9d-80af-93f7-db01db3f2d57@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b2d49e5d-3350-d7f6-6bf2-8a2082e8fc80@suse.com>
Date: Mon, 7 Oct 2019 11:25:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b4258bee-ba9d-80af-93f7-db01db3f2d57@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/typesafe: Force helpers to be
 always_inline
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTAuMjAxOSAxOTowMiwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxMC8yLzE5IDk6
MTEgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAwMS4xMC4yMDE5IDIyOjU5LCBBbmRyZXcg
Q29vcGVyIHdyb3RlOgo+Pj4gT24gMDEvMTAvMjAxOSAwOTozOCwgSmFuIEJldWxpY2ggd3JvdGU6
Cj4+Pj4gT24gMzAuMDkuMjAxOSAyMToxNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+Pj4gQ2xh
bmcgaW4gcGFydGljdWxhciBoYXMgYSBoYWJpdCBvZiBvdXQtb2YtbGluaW5nIHRoZXNlIGFuZCBj
cmVhdGluZyBtdWx0aXBsZQo+Pj4+PiBsb2NhbCBjb3BpZXMgb2YgX21mbigpIGFuZCBtZm5feCgp
LCBldGMuICBPdmVycmlkZSB0aGlzIGJlaGF2aW91ci4KPj4+PiBJcyBzcGVjaWFsIGNhc2luZyB0
aGUgdHlwZXNhZmUgaGVscGVycyB0aGVuIHRoZSByaWdodCBhcHByb2FjaD8gVGhlCj4+Pj4gZnVu
ZGFtZW50YWwgaWRlYSBhZnRlciBhbGwgaXMgdG8gbGV0IHRoZSBjb21waWxlciBkZWNpZGUuIEkg
Y2VydGFpbmx5Cj4+Pj4gYWdyZWUgdGhhdCBub3QgaW5saW5pbmcgc3VjaCB0cml2aWFsIGZ1bmN0
aW9ucyBkZXNwaXRlIHRoZSBpbmxpbmUKPj4+PiBrZXl3b3JkIGxvb2tzIGZhciBmcm9tIG9wdGlt
YWwsIGJ1dCBpZiB0aGVyZSdzIHN1Y2ggYSBnZW5lcmFsIGlzc3VlCj4+Pj4gd2l0aCBjbGFuZywg
c2hvdWxkbid0IHdlIG1ha2UgImlubGluZSIgZXhwYW5kIHRvICJhbHdheXNfaW5saW5lIgo+Pj4+
IHVuaWZvcm1seT8KPj4+Cj4+PiBJbmxpbmUgaGFuZGluZyBpcyBhIG1lc3MuCj4+Pgo+Pj4gV2Ug
Y3VycmVudGx5IGRlZmluZSBpbmxpbmUgdG8gX19pbmxpbmVfXy7CoCBVbmRvaW5nIHRoaXMgcmVz
dWx0cyBpbiBidWlsZAo+Pj4gZmFpbHVyZXMuCj4+Pgo+Pj4gTGludXggY3VycmVudGx5IGRlZmlu
ZXMgaW5saW5lIHRvIGFsd2F5c19pbmxpbmUgYW5kIHRoZXkgYXJlIGRlc3BlcmF0ZWx5Cj4+PiB0
cnlpbmcgdG8gdW5kbyB0aGlzIChtaXMpYmVoYXZpb3VyLgo+Pj4KPj4+IFRoZXJlIGFyZSBhIGZl
dyB1c2VzIG9mIGFsd2F5c19pbmxpbmUgZm9yIHNhZmV0eSBwdXJwb3NlcyAodGhlCj4+PiBzcGVj
dWxhdGl2ZSBoZWxwZXJzKS7CoCBNb3N0IHVzZXMgb2YgYWx3YXlzX2lubGluZSBsb29rIHRvIGJl
IHdvcmthcm91bmRzCj4+PiBmb3IgdGhlIHNpemUtb2YtYXNtIGJ1Zy8obWlzKWZlYXR1cmUuCj4+
Pgo+Pj4gSW4gYW4gaWRlYWwgd29ybGQsIHdlIHdvdWxkbid0IG5lZWQgaXQgYXQgYWxsLCBidXQg
SSBkZWZpbml0ZWx5IGRvbid0Cj4+PiB0aGluayB0aGF0IHRha2luZyB0aGUgTGludXggYXBwcm9h
Y2ggaXMgYSBjbGV2ZXIgbW92ZS7CoCBXZSBkZWZpbml0ZWx5Cj4+PiBoYXZlIHNvbWUgc3RhdGlj
IGlubGluZXMgd2hpY2ggd291bGQgYmV0dGVyIG5vdCBiZWluZyBpbmxpbmUuCj4+Cj4+IElPVyB5
b3VyIHN1Z2dlc3RlZCBhcHByb2FjaCAoYXQgbGVhc3QgZm9yIHRoZSBmb3Jlc2VlYWJsZSBmdXR1
cmUpIGlzIHRvCj4+IGRvIHdoYXQgeW91IGRvIGhlcmUgYW5kIGNvbnZlcnQgaW5saW5lIHRvIGFs
d2F5c19pbmxpbmUgYXMgd2Ugc2VlIGZpdD8KPj4gSWYgc28sIHdlIHNob3VsZCBhdCBsZWFzdCBz
ZXR0bGUgb24gc29tZSBzdWZmaWNpZW50bHkgZmlybSBjcml0ZXJpYSBieQo+PiB3aGljaCBzdWNo
IGEgY29udmVyc2lvbiB3b3VsZCBiZSBqdXN0aWZpYWJsZS4KPj4KPj4gU2VlaW5nIHRoYXQgdGhp
cyBpcyBwcmltYXJpbHkgdG8gaGVscCBjbGFuZyAtIGRpZCB5b3UgY29uc2lkZXIKPj4gaW50cm9k
dWNpbmcgc29tZXRoaW5nIGxpa2UgY2xhbmdfaW5saW5lLCBleHBhbmRpbmcgdG8ganVzdCBpbmxp
bmUgZm9yCj4+IGdjYywgYnV0IGFsd2F5c19pbmxpbmUgZm9yIGNsYW5nPyBUaGlzIHdvdWxkIGF0
IGxlYXN0IHByb3ZpZGUgYQo+PiBzdWZmaWNpZW50bHkgZWFzeSB3YXkgdG8gdW5kbyB0aGlzIGlm
IGEgYmV0dGVyIGNsYW5nLXNpZGUgYXBwcm9hY2ggY2FuCj4+IGJlIGZvdW5kIGRvd24gdGhlIHJv
YWQuCj4gCj4gV2hhdCB3b3VsZCBiZSB0aGUgcG9pbnQgb2YgdGhpcz8gIFRoZSBvbmx5IHJlYXNv
biBhbHdheXNfaW5saW5lIGlzbid0Cj4gbmVjZXNzYXJ5IGZvciBnY2MgKGlmIEknbSBmb2xsb3dp
bmcgdGhlIGFyZ3VtZW50KSBpcyBiZWNhdXNlIGl0IHNvIGZhcgo+IGhhcyBhbHdheXMgaW5saW5l
ZCB0aGVzZSBmdW5jdGlvbnMuICBJZiBpdCBzdG9wcGVkIGlubGluaW5nIHRoZW0sIHdlJ2QKPiBu
ZWVkIHRvIGNoYW5nZSBpdCB0byBhbHdheXNfaW5saW5lIGFueXdheTsgc28gd2h5IG5vdCBqdXN0
IHNheSBzbyB0bwo+IGJlZ2luIHdpdGg/CgpUaGUgcG9pbnQgb2YgdGhpcyB3b3VsZCBiZSB0byBf
YXZvaWRfIHVzaW5nIGFsd2F5c19pbmxpbmUgYXMgbXVjaCBhcwpwb3NzaWJsZS4gV2UgcmVhbGx5
IHNob3VsZG4ndCBmaWdodCBjb21waWxlciBkZWNpc2lvbnMgbW9yZSB0aGFuCmFic29sdXRlbHkg
bmVjZXNzYXJ5LiBIZW5jZSBhbHNvIG15IHJlcXVlc3QgZm9yIHN1ZmZpY2llbnRseSBmaXJtCmNy
aXRlcmlhIHdoZW4gdG8gc3dpdGNoIGluIHRoZSBmaXJzdCBwbGFjZS4gT3IgZWxzZSB3b3VsZCBj
b3VsZCwgYXMKbWVudGlvbmVkIGFzIGFuIG9wdGlvbiBlbHNld2hlcmUsIG1ha2UgaW5saW5lIGV4
cGFuZCB0byBhbHdheXNfaW5saW5lCnVuaWZvcm1seS4gKE9yIGNvdXJzZSwgZXZlbiBhbHdheXNf
aW5saW5lIGlzbid0IGEgZ3VhcmFudGVlIGZvciB0aGUKY29tcGlsZXIgdG8gYWN0dWFsbHkgaW5s
aW5lIGEgZnVuY3Rpb24uKQoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
