Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3185535E
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 17:28:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfnJq-0006Vo-TO; Tue, 25 Jun 2019 15:25:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xfxB=UY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hfnJp-0006Vj-0N
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 15:25:13 +0000
X-Inumbo-ID: 6a82fd58-975d-11e9-9130-ab0f4b1496a9
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a82fd58-975d-11e9-9130-ab0f4b1496a9;
 Tue, 25 Jun 2019 15:25:09 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 25 Jun 2019 09:25:08 -0600
Message-Id: <5D123CD0020000780023B077@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 25 Jun 2019 09:25:04 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Ian Jackson" <ian.jackson@citrix.com>
References: <osstest-138333-mainreport@xen.org>
 <23824.55987.139222.778619@mariner.uk.xensource.com>
 <23824.56091.124052.340656@mariner.uk.xensource.com>
 <23824.56583.488225.205300@mariner.uk.xensource.com>
 <23825.64696.25926.318881@mariner.uk.xensource.com>
 <23826.11187.707446.188402@mariner.uk.xensource.com>
In-Reply-To: <23826.11187.707446.188402@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [xen-4.6-testing test] 138333: regressions - FAIL
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI1LjA2LjE5IGF0IDE2OjEyLCA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6
Cj4gSWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFt4ZW4tNC42LXRlc3RpbmcgdGVzdF0gMTM4MzMz
OiByZWdyZXNzaW9ucyAtIEZBSUwiKToKPj4gSWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFt4ZW4t
NC42LXRlc3RpbmcgdGVzdF0gMTM4MzMzOiByZWdyZXNzaW9ucyAtIEZBSUwiKToKPj4gPiBJYW4g
SmFja3NvbiB3cml0ZXMgKCJSZTogW3hlbi00LjYtdGVzdGluZyB0ZXN0XSAxMzgzMzM6IHJlZ3Jl
c3Npb25zIC0gRkFJTCIpOgo+PiA+ID4gSWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFt4ZW4tNC42
LXRlc3RpbmcgdGVzdF0gMTM4MzMzOiByZWdyZXNzaW9ucyAtIEZBSUwiKToKPj4gPiA+ID4gVGhl
c2UgYWxsIGhhdmUgYHFlbXV0JyBpbiBjb21tb24uCj4+IC4uLgo+PiA+IEknbSB0cnlpbmcgYSB0
ZXN0IHdpdGggNC43J3MgdmVyc2lvbiBvZiBxZW11IHRyYWQuCj4+IAo+PiBUaGlzIGRvZXMgbm90
IHdvcmsuICA0LjcncyBxZW11IHRyYWQgZG9lc24ndCBidWlsZCBiZWNhdXNlIG9mIHRvb2xzCj4+
IGxpYnJhcnkgcmVvcmdhbmlzYXRpb24uICBSZXZlcnRpbmcgdGhvc2UgY2hhbmdlcyB0byA0Ljcg
cHJvZHVjZXMgYQo+PiBxZW11IHRyYWQgdGhhdCBpcyBpZGVudGljYWwgdG8gNC42J3MuICBTbyB0
aGUgcmVncmVzc2lvbiBpcyBub3QgaW4KPj4gcWVtdS4KPj4gCj4+IEkgc3VzcGVjdCBhIGZpcm13
YXJlIG9yIGh2bWxvYWRlciBwcm9ibGVtLgo+PiAKPj4gVGhpcyBpcyBibG9ja2luZyB1cyBnZXR0
aW5nIGEgcHVzaCBmb3IgdGhlIFhlbiA0Ljggc3RhYmxlIGJyYW5jaGVzOgo+IAo+IFRoZXNlIGhh
dmUgbm90IGhhZCBhIHB1c2ggZm9yLCBpbiB0aGUgY2FzZSBvZiA0LjksIDEzMyBkYXlzLgoKWWVz
LCBJIGhhZCBub3RpY2VkIHRoaXMgdG9vLiBFbWJhcnJhc3NpbmcuCgo+IFVubGVzcyBzb21lb25l
IGV4cGxhaW5zIHRvIG1lIGEgcGxhbiBmb3IgaG93IHRvIGdldCA0LjYgdG8gYWN0dWFsbHkKPiB3
b3JrIGFnYWluIHdlbGwgZW5vdWdoIHRvIHRlc3QgNC43LCBvciBzb21lIG90aGVyIGJldHRlciBw
cm9wb3NhbCwgSQo+IGludGVuZCB0byBmb3JjZSBwdXNoIDQuNiBhdCB0aGUgZW5kIG9mIHRoaXMg
d2Vlay4KCkkndmUgdGFrZW4gYSBsb29rLiBUaGUgZ3Vlc3RzIG5vdyB0cmlwbGUgZmF1bHQgZHVy
aW5nIEJJT1MgaW5pdGlhbGl6YXRpb246CgooZDEyMTgpIDE4MTI0IGJ5dGVzIG9mIFJPTUJJT1Mg
aGlnaC1tZW1vcnkgZXh0ZW5zaW9uczoKKGQxMjE4KSAgIFJlbG9jYXRpbmcgdG8gMHhmYzAwMTAw
MC0weGZjMDA1NmNjIC4uLiBkb25lCi4uLgooWEVOKSBkMTIxOHYwIFRyaXBsZSBmYXVsdCAtIGlu
dm9raW5nIEhWTSBzaHV0ZG93biBhY3Rpb24gMQooWEVOKSAqKiogRHVtcGluZyBEb20xMjE4IHZj
cHUjMCBzdGF0ZTogKioqCihYRU4pIC0tLS1bIFhlbi00LjYuNiAgeDg2XzY0ICBkZWJ1Zz15ICBO
b3QgdGFpbnRlZCBdLS0tLQooWEVOKSBDUFU6ICAgIDAKKFhFTikgUklQOiAgICAwMDA4Ols8MDAw
MDAwMDBmYzAwNDI0Yz5dCgpbTm90ZSBpbiBwYXJ0aWN1bGFyIHRoaXMgYWRkcmVzcy5dCgooWEVO
KSBSRkxBR1M6IDAwMDAwMDAwMDAwMTAwODYgICBDT05URVhUOiBodm0gZ3Vlc3QgKGQxMjE4djAp
CihYRU4pIHJheDogMDAwMDAwMDBmYzAwNDM2OSAgIHJieDogMDAwMDAwMDBmYzAwNDBlOSAgIHJj
eDogMDAwMDAwMDAwMDAwMDAwMgooWEVOKSByZHg6IDAwMDAwMDAwZmMwMDQzMDcgICByc2k6IDAw
MDAwMDAwMDAwMDAwMDAgICByZGk6IDAwMDAwMDAwMDAwMDAwMjAKKFhFTikgcmJwOiAwMDAwMDAw
MDAwMDllZWQyICAgcnNwOiAwMDAwMDAwMDAwMDllZTk2ICAgcjg6ICAwMDAwMDAwMDAwMDAwMDAw
CihYRU4pIHI5OiAgMDAwMDAwMDAwMDAwMDAwMCAgIHIxMDogMDAwMDAwMDAwMDAwMDAwMCAgIHIx
MTogMDAwMDAwMDAwMDAwMDAwMAooWEVOKSByMTI6IDAwMDAwMDAwMDAwMDAwMDAgICByMTM6IDAw
MDAwMDAwMDAwMDAwMDAgICByMTQ6IDAwMDAwMDAwMDAwMDAwMDAKKFhFTikgcjE1OiAwMDAwMDAw
MDAwMDAwMDAwICAgY3IwOiAwMDAwMDAwMDAwMDAwMDExICAgY3I0OiAwMDAwMDAwMDAwMDAwMDAw
CihYRU4pIGNyMzogMDAwMDAwMDAwMDAwMDAwMCAgIGNyMjogMDAwMDAwMDAwMDAwMDAwMAooWEVO
KSBkczogMDAxOCAgIGVzOiAwMDE4ICAgZnM6IDAwMDAgICBnczogYzkwMCAgIHNzOiAwMDE4ICAg
Y3M6IDAwMDgKCkkgd291bGRuJ3QgYmUgc3VycHJpc2VkIGlmIHRoZSByb21iaW9zIGJ1aWxkIGlz
IGJyb2tlbiAtIGRpZCB5b3UgaGFwcGVuCnRvIGNvbXBhcmUgdGhvc2UgYmluYXJpZXM/IE90b2gg
SSBjYW4ndCBzZWVtIHRvIHNwb3QgYW55IGZpeGVzIGluCm1hc3RlciB0aGF0IHdvdWxkIGxvb2sg
bGlrZSBwb3NzaWJseSBhZGRyZXNzaW5nIGJ1aWxkIGlzc3VlcyB3aXRoIGEKbmV3ZXIgdG9vbCBj
aGFpbiAob3RoZXIgdGhhbiBjYXNlcyB3aGVyZSB0aGUgYnVpbGQgaXRzZWxmIHdvdWxkIGZhaWwp
LgoKSXJyZXNwZWN0aXZlIG9mIHRoaXMgSSdtIG5vdCByZWFsbHkgb3Bwb3NlZCB0byBhIGZvcmNl
IHB1c2ggYXMgeW91J3ZlCnN1Z2dlc3RlZCwgZGVzcGl0ZSBiZWluZyBhZnJhaWQgdGhhdCB0aGlz
IG1heSBoaWRlIGFuIGFjdHVhbCBpc3N1ZS4KVGhhdCdzIGV2ZW4gbW9yZSBzbyB0aGF0IGJ5IG5v
dyA0LjcgaGFzIGdvbmUgb3V0IG9mIHNlY3VyaXR5CnN1cHBvcnQsIGFuZCBoZW5jZSB3ZSBvbmx5
IG5lZWQgaXQgbm93IGZvciA0LjgncyAtcHJldiB0ZXN0cy4KCkphbgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
