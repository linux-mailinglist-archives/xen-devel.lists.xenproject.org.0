Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3456C424D9
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 13:57:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hb1qV-0001VF-Id; Wed, 12 Jun 2019 11:55:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T8NI=UL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hb1qU-0001V7-O7
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 11:55:14 +0000
X-Inumbo-ID: ee1bda0e-8d08-11e9-8986-4f9d06c592e9
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee1bda0e-8d08-11e9-8986-4f9d06c592e9;
 Wed, 12 Jun 2019 11:55:11 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ObwPYeK9Gf1nBteI5u/cOEg/OtiRFZl3bxlsla5TMchVnG7DRv5IJulmlqS6H6yQm3mZjq3Y+J
 c3w/qh+A5uJRpLlnEn3xfK5AfR4lUx2PAmg4w+249AgF+B+3kNeWkAwFYEMk8/nkbMepkc0lNS
 OT875HQ8YBd+tIqD0akmFHTv4344nrNPKw4M3O1+lCDTrk+y8xroSNSdX/7Xf4lV3EvJrqxsFS
 PrY7pG4J9vn565vxu5IgKb10jZLo3Pkl2F4UxmuX0mH+BCjvO6ij33yLbwbtPsyHqy3lDUMHdi
 DpI=
X-SBRS: 2.7
X-MesageID: 1610729
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,365,1557201600"; 
   d="scan'208";a="1610729"
To: Jan Beulich <JBeulich@suse.com>
References: <1560337513-6958-1-git-send-email-andrew.cooper3@citrix.com>
 <5D00E74D02000078002377AA@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <27e0dbf5-5879-0807-ad03-a24735c741cd@citrix.com>
Date: Wed, 12 Jun 2019 12:55:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5D00E74D02000078002377AA@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/boot: Drop vestigial support for
 pre-SIPI APICs
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 David Woodhouse <dwmw2@infradead.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMDYvMjAxOSAxMjo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTIuMDYuMTkg
YXQgMTM6MDUsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gVGhlIGN1cnJl
bnQgY29kZSBpbiBkb19ib290X2NwdSgpIG1ha2VzIGEgQ01PUyB3cml0ZSAoZXZlbiBpbiB0aGUg
Y2FzZSBvZiBhbgo+PiBGQURUIHJlZHVjZWQgaGFyZHdhcmUgY29uZmlndXJhdGlvbikgYW5kIHR3
byB3cml0ZXMgaW50byB0aGUgQkRBIGZvciB0aGUKPj4gc3RhcnRfZWlwIHNlZ21lbnQgYW5kIG9m
ZnNldC4KPj4KPj4gQkRBIDB4NjcgYW5kIDB4NjkgaGFpbCBmcm9tIHRoZSBkYXlzIG9mIHRoZSBE
T1MgYW5kIHRoZSAyODYsIHdoZW4gSUJNIHB1dAo+PiB0b2dldGhlciB0aGUgZmFzdCB3YXkgdG8g
cmV0dXJuIGZyb20gUHJvdGVjdGVkIG1vZGUgYmFjayB0byBSZWFsIG1vZGUgKHZpYSBhCj4+IGRl
bGliZXJhdGUgdHJpcGxlIGZhdWx0KS4gIFRoaXMgdmVjdG9yLCB3aGVuIHNldCwgcmVkaXJlY3Rz
IHRoZSBlYXJseSBib290Cj4+IGxvZ2ljIGJhY2sgaW50byBPUyBjb250cm9sLgo+Pgo+PiBJdCBp
cyBhbHNvIHVzZWQgYnkgZWFybHkgTVAgc3lzdGVtcywgYmVmb3JlIHRoZSBTdGFydHVwIElQSSBt
ZXNzYWdlIGJlY2FtZQo+PiBzdGFuZGFyZCwgd2hpY2ggaW4gcHJhY3RpY2Ugd2FzIGJlZm9yZSBM
b2NhbCBBUElDcyBiZWNhbWUgaW50ZWdyYXRlZCBpbnRvIENQVQo+PiBjb3Jlcy4KPj4KPj4gU3Vw
cG9ydCBmb3Igbm9uLWludGVncmF0ZWQgQVBJQ3Mgd2FzIGRyb3BwZWQgaW4gYy9zIDdiMDAwN2Fm
ICJ4ZW4veDg2OiBSZW1vdmUKPj4gQVBJQ19JTlRFR1JBVEVEKCkgY2hlY2tzIiBiZWNhdXNlIHRo
ZXJlIGFyZSBubyA2NC1iaXQgY2FwYWJsZSBzeXN0ZW1zIHdpdGhvdXQKPj4gdGhlbS4gIFRoZXJl
Zm9yZSwgZHJvcCBzbXBib290X3tzZXR1cCxyZXN0b3JlfV93YXJtX3Jlc2V0X3ZlY3RvcigpLgo+
Pgo+PiBEcm9wcGluZyBzbXBib290X3NldHVwX3dhcm1fcmVzZXRfdmVjdG9yKCkgYWxzbyBsZXRz
IHVzIGRyb3AKPj4gVFJBTVBPTElORV97SElHSCxMT1d9LCB3aGljaCBsZXRzIHVzIGRyb3AgbWFj
aF93YWtlY3B1LmggZW50aXJlbHkuICBUaGUgZmluYWwKPj4gZnVuY3Rpb24gaW4gc21wYm9vdF9o
b29rcy5oIGlzIHNtcGJvb3Rfc2V0dXBfaW9fYXBpYygpIGFuZCBoYXMgYSBzaW5nbGUKPj4gY2Fs
bGVyLCBzbyBleHBhbmQgaXQgaW5saW5lIGFuZCBkZWxldGUgc21wYm9vdF9ob29rcy5oIGFzIHdl
bGwuCj4+Cj4+IFRoaXMgcmVtb3ZlcyBhbGwgcmVsaWFuY2Ugb24gQ01PUyBhbmQgdGhlIEJEQSBm
cm9tIHRoZSBBUCBib290IHBhdGgsIHdoaWNoIGlzCj4+IGVzcGVjaWFsbHkgb2YgaW50ZXJlc3Qg
b24gcmVkdWNlZF9oYXJkd2FyZSBib290cyBhbmQgRUZJIHN5c3RlbXMuCj4+Cj4+IFJlcG9ydGVk
LWJ5OiBEYXZpZCBXb29kaG91c2UgPGR3bXdAYW1hem9uLmNvLnVrPgo+IERvZXMgdGhpcyBtZWFu
IHRoZXJlIHdhcyBhbiBhY3R1YWwgcHJvYmxlbSByZXN1bHRpbmcgZnJvbSB0aGlzIGNvZGUKPiBi
ZWluZyB0aGVyZSwgb3Igc2ltcGx5IHRoZSBvYnNlcnZhdGlvbiB0aGF0IHRoaXMgY29kZSBpcyBh
bGwgZGVhZD8KPiBDbGFyaWZ5aW5nIG9uZSB3YXkgb3IgdGhlIG90aGVyIGJ5IGhhbGYgYSBzZW50
ZW5jZSB3b3VsZCBiZSBuaWNlLgoKSXQgd2FzIG1vcmUgYW4gb2JzZXJ2YXRpb24gdGhhdCB3aGVu
IHlvdSBrZXhlYyBYZW4sIGl0IGJsaW5kbHkgd3JpdGVzCmludG8gdGhlIEJEQSBldmVuIHdoZW4g
dGhhdCB3YXNuJ3Qgc2V0IHVwIHByb3Blcmx5IGJ5IHRoZSB0b29scy4KCkFyZ3VhYmx5IHRoYXQg
bWF5IGhhdmUgYmVlbiBrZXhlYyBzZXR1cCBwcm9ibGVtIG1vcmUgdGhhbiBhIFhlbiBwcm9ibGVt
LApidXQgYWZ0ZXIgbG9va2luZyBhdCB0aGlzIGNvZGUsIGl0IGlzIG9idmlvdXNseSB0aGF0IHdo
YXQgWGVuIHdhcyBkb2luZwpkZWZpbml0ZWx5IHdhc24ndCByaWdodCB0byBkbyB1bmNvbmRpdGlv
bmFsbHkuwqAgSXQganVzdCBzbyBoYXBwZW5zIHRoYXQKaXQgc2FmZSB0byB1bmNvbmRpdGlvbmFs
bHkgZHJvcCB0aGUgbG9naWMsIHJhdGhlciB0aGFuIHRvIG1ha2UgaXQKZGVwZW5kYW50IG9uIG90
aGVyIHN5c3RlbSBwcm9wZXJ0aWVzLgoKSSdtIG5vdCBzdXJlIGhvdyBiZXN0IHRvIHBocmFzZSB0
aGlzLgoKPj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoK
VGhhbmtzLAoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
