Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F19D75256C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 09:53:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfgDe-0002Ht-Bp; Tue, 25 Jun 2019 07:50:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ez/b=UY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hfgDc-0002Ho-O4
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 07:50:20 +0000
X-Inumbo-ID: ddfab018-971d-11e9-8225-17dfdb4bd7be
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ddfab018-971d-11e9-8225-17dfdb4bd7be;
 Tue, 25 Jun 2019 07:50:15 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2fJjgyRhQ5R/JgBry2dazZ2368YHRHfuGlRkecyGCJW4YL7CsJ1pp2yaNeeOafxXUUkUIFprwG
 ifMPUkLruIyO1fcD8cp4c7ZyQsSTew8R+q3FqqoANSe/XIB53VwWFY0HSQpT3/oTo1DKNyxrTm
 /H4Mr24Y43I/pAn8RGp3G+lnRM1G4Pe8Lk0pzmZrrrEHR0eHzpM4rTleVpLSwOxsYKTb++DBG6
 DidH9JeJUNaz2DTXXqZ8TOtRKW6p1kVto6yYFvbSBxf1E7RZfkObGMca0w4HmOzySncm3rEQHO
 Wm4=
X-SBRS: 2.7
X-MesageID: 2169396
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,415,1557201600"; 
   d="scan'208";a="2169396"
Date: Tue, 25 Jun 2019 09:50:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Johnson, Ethan" <ejohns48@cs.rochester.edu>
Message-ID: <20190625075008.rjhcgr3ntbjadf55@MacBook-Air-de-Roger.local>
References: <9b1a4ece-91fa-c3ad-c0f1-f749cf61f5f9@cs.rochester.edu>
 <1c7b7a7a-0645-5710-14fe-af90ee6383ef@citrix.com>
 <d5ae7db2-b260-c58b-43be-f1f82cdfec9f@cs.rochester.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d5ae7db2-b260-c58b-43be-f1f82cdfec9f@cs.rochester.edu>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] How to compile Xen 4.12 with Clang on Linux?
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDE6MDk6MjJBTSArMDAwMCwgSm9obnNvbiwgRXRoYW4g
d3JvdGU6Cj4gT24gNi8yMC8xOSA3OjAxIFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+ID4gWGVu
IGl0c2VsZiBkb2Vzbid0IHVzZSBhdXRvY29uZiwgYW5kIG5lZWRzIGEgYml0IG9mIGV4dHJhIGhl
bHAgZ2V0dGluZwo+ID4gaXRzIG9wdGlvbnMgaW4gb3JkZXIuwqAgVGhlcmUgaXMgYW4gZXh0cmEg
Y2xhbmc9eSB2YXJpYWJsZSB3aGljaCB5b3UgbmVlZAo+ID4gdG8gcGFzcy4KPiA+Cj4gPiB4ZW4u
Z2l0JCBtYWtlIC1DIHhlbi8gQ0M9Y2xhbmctNyBjbGFuZz15Cj4gCj4gVGhhbmtzISBUaGF0IHNl
ZW1zIHRvIGhhdmUgd29ya2VkLgo+IAo+IE5vdyBJJ3ZlIGdvdCBhIG5ldyBpc3N1ZTogaXQgbG9v
a3MgbGlrZSBYZW4gaXMgdHJ5aW5nIHRvIHVzZSBhbiAKPiBvcHRpbWl6YXRpb24gZmxhZyB0aGF0
IENsYW5nIGRvZXNuJ3QgbGlrZToKPiAKPiAtLS0tLS0tLS0tCj4gWyAxNiVdIEJ1aWxkaW5nIEMg
b2JqZWN0IGNyeXB0by9DTWFrZUZpbGVzL3RwbV9jcnlwdG8uZGlyL2htYWMubwo+IGNkIAo+IC9o
b21lL2Vqb2huczQ4L0Rlc2t0b3AveGVuLTQuMTIuMC9zdHViZG9tL3RwbV9lbXVsYXRvci14ODZf
NjQvYnVpbGQvY3J5cHRvIAo+ICYmIC91c3IvYmluL2NsYW5nLTfCoCAtSS9vcHQvbG9jYWwvaW5j
bHVkZSAKPiAtSS9ob21lL2Vqb2huczQ4L0Rlc2t0b3AveGVuLTQuMTIuMC9zdHViZG9tL3RwbV9l
bXVsYXRvci14ODZfNjQgCj4gLUkvaG9tZS9lam9obnM0OC9EZXNrdG9wL3hlbi00LjEyLjAvc3R1
YmRvbS90cG1fZW11bGF0b3IteDg2XzY0L2J1aWxkIAo+IC1zdGQ9Yzk5IC1EVFBNX05PX0VYVEVS
TiAtaXN5c3RlbSAKPiAvaG9tZS9lam9obnM0OC9EZXNrdG9wL3hlbi00LjEyLjAvc3R1YmRvbS8u
Li9leHRyYXMvbWluaS1vcy9pbmNsdWRlIAo+IC1EX19NSU5JT1NfXyAtREhBVkVfTElCQyAtaXN5
c3RlbSAKPiAvaG9tZS9lam9obnM0OC9EZXNrdG9wL3hlbi00LjEyLjAvc3R1YmRvbS8uLi9leHRy
YXMvbWluaS1vcy9pbmNsdWRlL3Bvc2l4IAo+IC1pc3lzdGVtIAo+IC9ob21lL2Vqb2huczQ4L0Rl
c2t0b3AveGVuLTQuMTIuMC9zdHViZG9tLy4uL3Rvb2xzL3hlbnN0b3JlL2luY2x1ZGUgCj4gLWlz
eXN0ZW0gCj4gL2hvbWUvZWpvaG5zNDgvRGVza3RvcC94ZW4tNC4xMi4wL3N0dWJkb20vLi4vZXh0
cmFzL21pbmktb3MvaW5jbHVkZS94ODYgCj4gLWlzeXN0ZW0gCj4gL2hvbWUvZWpvaG5zNDgvRGVz
a3RvcC94ZW4tNC4xMi4wL3N0dWJkb20vLi4vZXh0cmFzL21pbmktb3MvaW5jbHVkZS94ODYveDg2
XzY0IAo+IC1VIF9fbGludXhfXyAtVSBfX0ZyZWVCU0RfXyAtVSBfX3N1bl9fIC1ub3N0ZGluYyAt
aXN5c3RlbSAKPiAvaG9tZS9lam9obnM0OC9EZXNrdG9wL3hlbi00LjEyLjAvc3R1YmRvbS8uLi9l
eHRyYXMvbWluaS1vcy9pbmNsdWRlL3Bvc2l4IAo+IC1pc3lzdGVtIAo+IC9ob21lL2Vqb2huczQ4
L0Rlc2t0b3AveGVuLTQuMTIuMC9zdHViZG9tL2Nyb3NzLXJvb3QteDg2XzY0L3g4Nl82NC14ZW4t
ZWxmL2luY2x1ZGUgCj4gLWlzeXN0ZW0gL3Vzci9saWIvZ2NjL3g4Nl82NC1saW51eC1nbnUvNy9p
bmNsdWRlIC1pc3lzdGVtIAo+IC9ob21lL2Vqb2huczQ4L0Rlc2t0b3AveGVuLTQuMTIuMC9zdHVi
ZG9tL2x3aXAteDg2XzY0L3NyYy9pbmNsdWRlIAo+IC1pc3lzdGVtIAo+IC9ob21lL2Vqb2huczQ4
L0Rlc2t0b3AveGVuLTQuMTIuMC9zdHViZG9tL2x3aXAteDg2XzY0L3NyYy9pbmNsdWRlL2lwdjQg
Cj4gLUkvaG9tZS9lam9obnM0OC9EZXNrdG9wL3hlbi00LjEyLjAvc3R1YmRvbS9pbmNsdWRlIAo+
IC1JL2hvbWUvZWpvaG5zNDgvRGVza3RvcC94ZW4tNC4xMi4wL3N0dWJkb20vLi4veGVuL2luY2x1
ZGUgLW1uby1yZWQtem9uZSAKPiAtTzEgLWZuby1vbWl0LWZyYW1lLXBvaW50ZXIgLU8xIC1mbm8t
b21pdC1mcmFtZS1wb2ludGVywqAgLW02NCAKPiAtbW5vLXJlZC16b25lIC1mbm8tcmVvcmRlci1i
bG9ja3MgLWZuby1hc3luY2hyb25vdXMtdW53aW5kLXRhYmxlcyAtbTY0IAo+IC1EQlVJTERfSUQg
LWZuby1zdHJpY3QtYWxpYXNpbmcgLXN0ZD1nbnU5OSAtV2FsbCAtV3N0cmljdC1wcm90b3R5cGVz
IAo+IC1XZGVjbGFyYXRpb24tYWZ0ZXItc3RhdGVtZW50IC1Xbm8tdW51c2VkLWxvY2FsLXR5cGVk
ZWZzwqDCoCAKPiAtZm5vLXN0YWNrLXByb3RlY3RvciAtZm5vLWV4Y2VwdGlvbnMgLVduby1kZWNs
YXJhdGlvbi1hZnRlci1zdGF0ZW1lbnTCoMKgIAo+IC1XYWxsIC1XZXJyb3IgLVdleHRyYSAtV25v
LXVudXNlZC1wYXJhbWV0ZXIgLVdwb2ludGVyLWFyaXRoIC1XY2FzdC1hbGlnbiAKPiAtV3dyaXRl
LXN0cmluZ3MgLW8gQ01ha2VGaWxlcy90cG1fY3J5cHRvLmRpci9obWFjLm/CoMKgIC1jIAo+IC9o
b21lL2Vqb2huczQ4L0Rlc2t0b3AveGVuLTQuMTIuMC9zdHViZG9tL3RwbV9lbXVsYXRvci14ODZf
NjQvY3J5cHRvL2htYWMuYwo+IGNsYW5nOiBlcnJvcjogb3B0aW1pemF0aW9uIGZsYWcgJy1mbm8t
cmVvcmRlci1ibG9ja3MnIGlzIG5vdCBzdXBwb3J0ZWQgCj4gWy1XZXJyb3IsLVdpZ25vcmVkLW9w
dGltaXphdGlvbi1hcmd1bWVudF0KPiAtLS0tLS0tLS0tCj4gCj4gSSdtIHNlZWluZyB0aGlzIHNh
bWUgZXJyb3Igb24gb3RoZXIgdHJhbnNsYXRpb24gdW5pdHMgYXMgd2VsbCB3aGVuIEkgcnVuIAo+
ICJtYWtlIiB3aXRoIG11bHRpcGxlIHRocmVhZHMgKC1qMjQpLgo+IAo+IElzIHRoaXMgYW5vdGhl
ciB0aGluZyBJIGNhbiBmaXggd2l0aCBhIGZsYWcgb3IgZG8gSSBuZWVkIHRvIGRpZyBkZWVwZXI/
CgpJJ20gbm90IHN1cmUgY2xhbmcvbGx2bSBpcyBjYXBhYmxlIG9mIGJ1aWxkaW5nIHN0dWJkb21h
aW5zLiBUaGUKY3VycmVudCBnaXRsYWIgQ0kgbG9vcCB0aGF0IHRlc3RzIGNsYW5nL2xsdm0gaGFz
IHRoZSBmb2xsb3dpbmcKc25pcHBldDoKCiMgbmV3bGliIGNhbm5vdCBiZSBidWlsdCB3aXRoIGNs
YW5nIHNvIHdlIGNhbm5vdCBidWlsZCBzdHViZG9tcwpjZmdhcmdzKz0oIi0tZGlzYWJsZS1zdHVi
ZG9tIikKCldoaWNoIGRpc2FibGVzIHRoZSBzdHViZG9tYWluIGJ1aWxkIHdpdGggY2xhbmcuIElm
IHlvdSBuZWVkCnN0dWJkb21haW5zIHdvcmtpbmcgd2l0aCBjbGFuZy9sbHZtIEknbSBhZnJhaWQg
eW91IHdpbGwgaGF2ZSB0byBkbwpzb21lIGRpZ2dpbmcsIG9yIGVsc2UgeW91IGNhbiBqdXN0IGRp
c2FibGUgdGhlbSBmcm9tIGNvbmZpZ3VyZS4KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
