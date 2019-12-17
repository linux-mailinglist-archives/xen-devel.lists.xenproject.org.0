Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED87212311D
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 17:07:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihFL7-0005rr-JS; Tue, 17 Dec 2019 16:04:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gGJv=2H=list.ru=valor@srs-us1.protection.inumbo.net>)
 id 1ihFL5-0005rj-Kl
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 16:04:48 +0000
X-Inumbo-ID: f1090441-20e6-11ea-8f08-12813bfff9fa
Received: from smtp57.i.mail.ru (unknown [217.69.128.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1090441-20e6-11ea-8f08-12813bfff9fa;
 Tue, 17 Dec 2019 16:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=list.ru;
 s=mail; 
 h=Message-ID:From:CC:To:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Date;
 bh=EHIHkX6WtK3TBrUj9XhcGniGZYb4dISEryoMiIMncE8=; 
 b=fW/mavSjkfoNnE6zpbMiUizrQeAyrn5TsTRHlvkWIgQYNVTGKdXgyrQf8pJ8Kqj+3AqwL7OdFLdSvZJpZM6bLf772GkjtcW6o1/PkralL3f/GM7b6tNla4DnHon3ZJBf6HEWYGR7MhvhQp3PYjxe9/YfjjOo5xYQFrh6htMO+Ts=;
Received: by smtp57.i.mail.ru with esmtpa (envelope-from <valor@list.ru>)
 id 1ihFL1-0002aJ-SB; Tue, 17 Dec 2019 19:04:44 +0300
Date: Tue, 17 Dec 2019 16:04:39 +0000
In-Reply-To: <67147d02-c214-6a59-086d-94067ac00ff4@citrix.com>
References: <96a1376e-9464-f797-30fd-f6923efbf6c7@list.ru>
 <faaf6d0a-1ad4-63fd-f1c6-e6649f887e4d@citrix.com>
 <CABfawh=c6tEAZX4PzAO_fMWeGvKE=UFw2dkWjRkTiRQ28AJRbA@mail.gmail.com>
 <CABfawhmFdgHua-ociayg8BE2NF90UrQ1naywdaVHRrqtMR9v=w@mail.gmail.com>
 <67147d02-c214-6a59-086d-94067ac00ff4@citrix.com>
MIME-Version: 1.0
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
From: =?UTF-8?B?0JrQvtCy0LDQu9GR0LIg0KHQtdGA0LPQtdC5?= <valor@list.ru>
Message-ID: <2D4C2FFD-3730-4C92-8CEC-C04AB9658CA8@list.ru>
Authentication-Results: smtp57.i.mail.ru; auth=pass smtp.auth=valor@list.ru
 smtp.mailfrom=valor@list.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 0A44E481635329DB0E1AA8A03B392317D32E5E48865217369ED6AD9D9C178FB04F2E3A74631B90B3F688BCB05C26794D047133DF5C922C78C45EC187BA9F51B4C3F3B9F75AC46582104E7EE9C0D3ABFC
X-7FA49CB5: 0D63561A33F958A5DFA488ACA88207B848F19ADA4C9E02F57E4FC43B51B022D68941B15DA834481FA18204E546F3947CEDCF5861DED71B2F389733CBF5DBD5E9C8A9BA7A39EFB7666BA297DBC24807EA117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC8364767815B9869FA544D8D32BA5DBAC0009BE9E8FC8737B5C2249543735AC9C76F23876E601842F6C81A12EF20D2F80756B5F5C318D1F9ECD513A76E601842F6C81A127C277FBC8AE2E8BE3B78367742D7E3B3AA81AA40904B5D99449624AB7ADAF37F910319684D6E05D725E5C173C3A84C369456C5265B6C55C10845C57042B57B83946EFC6A664F553C4224003CC836476C0CAF46E325F83A50BF2EBBBDD9D6B0F2AF38021CC9F462D574AF45C6390F7469DAA53EE0834AAEE
X-Mailru-Sender: 00097D31F91C944BBBEB35DDDD6ACD9345F8EFBA121BB7C7570B75759CC9487C0D9D4AF2B0E03E62E54CE59283E19BE8E66B5C1DBFD5D09DD72DCFCE6FA85F85A74E2CAFD6E5C6FC67EA787935ED9F1B
X-Mras: OK
Subject: Re: [Xen-devel] [XEN PATCH v1 1/1] x86/vm_event: add fast single
 step
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?ISO-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3LCBUYW1hcyB0aGFuayB5b3UgdmVyeSBtdWNoLiBJIHdpbGwgaW1wcm92ZSB0aGUgcGF0
Y2guCgpEZWNlbWJlciAxNywgMjAxOSAzOjEzOjQyIFBNIFVUQywgQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4g0L/QuNGI0LXRgjoKPk9uIDE3LzEyLzIwMTkgMTU6MTAs
IFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4gT24gVHVlLCBEZWMgMTcsIDIwMTkgYXQgODowOCBB
TSBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cj53cm90ZToKPj4+IE9uIFR1
ZSwgRGVjIDE3LCAyMDE5IGF0IDc6NDggQU0gQW5kcmV3IENvb3Blcgo+PGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4+IE9uIDE3LzEyLzIwMTkgMTQ6NDAsIFNlcmdleSBLb3Zh
bGV2IHdyb3RlOgo+Pj4+PiBPbiBicmVhayBwb2ludCBldmVudCBlaWdodCBjb250ZXh0IHN3aXRj
aGVzIG9jY3VyZXMuCj4+Pj4+Cj4+Pj4+IFdpdGggZmFzdCBzaW5nbGUgc3RlcCBpdCBpcyBwb3Nz
aWJsZSB0byBzaG9ydGVuIHBhdGggZm9yIHR3bwo+Y29udGV4dAo+Pj4+PiBzd2l0Y2hlcwo+Pj4+
PiBhbmQgZ2FpbiAzNSUgc3BlYWQtdXAuCj4+Pj4+Cj4+Pj4+IFdhcyB0ZXN0ZWQgb24gRGViaWFu
IGJyYW5jaCBvZiBYZW4gNC4xMi4gU2VlIGF0Ogo+Pj4+Pgo+aHR0cHM6Ly9naXRodWIuY29tL3Nr
dmwveGVuL3RyZWUvZGViaWFuL2tub3JyaWUvNC4xMi9mYXN0LXNpbmdsZXN0ZXAKPj4+Pj4KPj4+
Pj4gUmViYXNlZCBvbiBtYXN0ZXI6Cj4+Pj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9za3ZsL3hlbi90
cmVlL2Zhc3Qtc2luZ2xlc3RlcAo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBTZXJnZXkgS292
YWxldiA8dmFsb3JAbGlzdC5ydT4KPj4+PiAzNSUgbG9va3MgbGlrZSBhIGdvb2QgbnVtYmVyLCBi
dXQgd2hhdCBpcyAiZmFzdCBzaW5nbGUgc3RlcCI/ICBBbGwKPnRoaXMKPj4+PiBhcHBlYXJzIHRv
IGJlIGlzIHBsdW1iaW5nIGZvciB0byBjYXVzZSBhbiBhbHRwMm0gc3dpdGNoIG9uIHNpbmdsZQo+
c3RlcC4KPj4+IFllcywgYSBiZXR0ZXIgZXhwbGFuYXRpb24gd291bGQgYmUgbXVjaCBuZWVkZWQg
aGVyZSBhbmQgSSdtIG5vdCAxMDAlCj4+PiBzdXJlIGl0IGNvcnJlY3RseSBpbXBsZW1lbnRzIHdo
YXQgSSB0aGluayBpdCB0cmllcyB0by4KPj4+Cj4+PiBUaGlzIGlzIG15IGludGVycHJldGF0aW9u
IG9mIHdoYXQgdGhlIGlkZWEgaXM6IHdoZW4gdXNpbmcgRFJBS1ZVRgo+KG9yCj4+PiBhbm90aGVy
IHN5c3RlbSB1c2luZyBhbHRwMm0gd2l0aCBzaGFkb3cgcGFnZXMgc2ltaWxhciB0byB3aGF0IEkK
Pj4+IGRlc2NyaWJlIGluCj5odHRwczovL3hlbnByb2plY3Qub3JnLzIwMTYvMDQvMTMvc3RlYWx0
aHktbW9uaXRvcmluZy13aXRoLXhlbi1hbHRwMm0pLAo+Pj4gYWZ0ZXIgYSBicmVha3BvaW50IGlz
IGhpdCB0aGUgc3lzdGVtIHN3aXRjaGVzIHRvIHRoZSBkZWZhdWx0Cj4+PiB1bnJlc3RyaWN0ZWQg
YWx0cDJtIHZpZXcgd2l0aCBzaW5nbGVzdGVwIGVuYWJsZWQuIFdoZW4gdGhlCj5zaW5nbGVzdGVw
Cj4+PiB0cmFwcyB0byBYZW4gYW5vdGhlciB2bV9ldmVudCBpcyBzZW50IHRvIHRoZSBtb25pdG9y
IGFnZW50LCB3aGljaAo+dGhlbgo+Pj4gbm9ybWFsbHkgZGlzYWJsZXMgc2luZ2xlc3RlcHBpbmcg
YW5kIHN3aXRjaGVzIHRoZSBhbHRwMm0gdmlldyBiYWNrCj50bwo+Pj4gdGhlIHJlc3RyaWN0ZWQg
dmlldy4gVGhpcyBwYXRjaCBsb29rcyBsaWtlIGl0cyBzaG9ydC1jaXJjdWl0aW5nIHRoYXQKPj4+
IGxhc3QgcGFydCBzbyB0aGF0IGl0IGRvZXNuJ3QgbmVlZCB0byBzZW5kIHRoZSB2bV9ldmVudCBv
dXQgZm9yIHRoZQo+Pj4gc2luZ2xlc3RlcCBldmVudCBhbmQgc2hvdWxkIHN3aXRjaCBiYWNrIHRv
IHRoZSByZXN0cmljdGVkIHZpZXcgaW4KPlhlbgo+Pj4gYXV0b21hdGljYWxseS4gSXQncyBhIG5p
Y2Ugb3B0aW1pemF0aW9uLiBCdXQgd2hhdCBzZWVtcyB0byBiZQo+bWlzc2luZwo+Pj4gaXMgdGhl
IGFsdHAybSBzd2l0Y2ggaXRzZWxmLgo+PiBOZXZlciBtaW5kLCBwMm1fYWx0cDJtX2NoZWNrIGRv
ZXMgdGhlIGFsdHAybSBzd2l0Y2ggYXMgd2VsbCwgc28gdGhpcwo+PiBwYXRjaCBpbXBsZW1lbnRz
IHdoYXQgSSBkZXNjcmliZWQgYWJvdmUuIFBsZWFzZSB1cGRhdGUgdGhlIHBhdGNoCj4+IG1lc3Nh
Z2UgdG8gYmUgbW9yZSBkZXNjcmlwdGl2ZSAoeW91IGNhbiBjb3B5IG15IGRlc2NyaXB0aW9uIGZy
b20KPj4gYWJvdmUpLgo+Cj5BbHNvIHBsZWFzZSByZWFkIENPRElOR19TVFlMRSBpbiB0aGUgcm9v
dCBvZiB0aGUgeGVuIHJlcG9zaXRvcnkuwqAgVGhlCj5pbXBvcnRhbnQgb25lcyB5b3UgbmVlZCB0
byBmaXggYXJlIHNwYWNlcyBpbiAiaWYgKCAuLi4gKSIgc3RhdGVtZW50cywKPmFuZCBiaW5hcnkg
b3BlcmF0b3JzIG9uIHRoZSBlbmQgb2YgdGhlIGZpcnN0IGxpbmUgcmF0aGVyIHRoYW4gdGhlCj5i
ZWdpbm5pbmcgb2YgdGhlIGNvbnRpbnVhdGlvbi4KPgo+fkFuZHJldwoKLS0gCtCf0YDQvtGB0YLQ
uNGC0LUg0LfQsCDQutGA0LDRgtC60L7RgdGC0YwsINGB0L7Qt9C00LDQvdC+INCyIEstOSBNYWls
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
