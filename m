Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B04736D0E1
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 17:17:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho87k-0002VG-9r; Thu, 18 Jul 2019 15:15:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MdgZ=VP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ho87i-0002Ud-3q
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 15:15:10 +0000
X-Inumbo-ID: d4918218-a96e-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d4918218-a96e-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 15:15:09 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7h8RDEzFrJguMy3EmomoTrLkfJ7AZ9q4eOSAuDB2XVEEs2L59b+0d7y4AgumsyQMzCigfjRVz3
 urfeAHGuw8+ZP9qGlsto9seOlfVAZhMij5aaF/18aR2EYO1sclCEgFgg3MwHeTObCHLzu9BbgE
 1gSoTP5KkOjmRBrhoksTWjhYdrJSGW6+5M8D228AgnIZOKGKpeVysmk+jX2kQ0JKiN9ZlvoFT9
 z/oNYVgySsBq6WqI+9agw78eW+YZAKTbm0bdC/mAQnNYQEAp0s4XZHXb+iWdcKAPW1q7NPc75Z
 +6s=
X-SBRS: 2.7
X-MesageID: 3206386
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,278,1559534400"; 
   d="scan'208";a="3206386"
Date: Thu, 18 Jul 2019 17:14:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190718151456.ioengemnmvk4bfs2@Air-de-Roger.citrite.net>
References: <20190717140810.a5a4bhmm7fb6oah5@Air-de-Roger.citrite.net>
 <cf05039e-45e1-cc11-c7e3-c0953c74b83b@citrix.com>
 <a27a16f1-f8ca-e620-8e91-73c9b01a8968@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a27a16f1-f8ca-e620-8e91-73c9b01a8968@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] printf formatter for pci_sbdf_t
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMTE6NTE6NTdBTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTcuMDcuMjAxOSAxOTowNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiA+IE9uIDE3
LzA3LzIwMTkgMTU6MDgsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPj4gQXMgcGFydCBvZiBz
b21lIFBDSSByZWxhdGVkIGNsZWFudXAgSSdtIGRvaW5nLCB3aGljaCBpbmNsdWRlcwo+ID4+IGV4
cGFuZGluZyB0aGUgdXNhZ2Ugb2YgcGNpX3NiZGZfdCwgSSdtIGFsc28gcGxhbm5pbmcgdG8gYWRk
IGEgY3VzdG9tCj4gPj4gcHJpbnRmIGZvcm1hdHRlciBmb3IgcGNpX3NiZGZfdCBbMF0sIHNvIHRo
YXQgYSBTQkRGIGNhbiBiZSBwcmludGVkCj4gPj4gd2l0aG91dCBoYXZpbmcgdG8gc3BlY2lmeSBm
b3VyIGZvcm1hdHRlcnMgKGFuZCBwYXNzIGZvdXIgcGFyYW1ldGVycykKPiA+PiBlYWNoIHRpbWUg
KCUwNHg6JTAyeDolMDJ4LiV1KS4KPiA+Pgo+ID4+IFRoZXJlJ3MgYmVlbiBzb21lIGRlYmF0ZSBv
biB0aGUgcHJldmlvdXMgdmVyc2lvbiBhYm91dCB3aGV0aGVyIHRoZQo+ID4+IGZvcm1hdHRlciBz
aG91bGQgYmUgJXBwIG9yICVvcCwgYW5kIEkgd291bGQgbGlrZSB0byBzZXR0bGUgb24gb25lIG9m
Cj4gPj4gdGhlbSBiZWZvcmUgc2VuZGluZyBhIG5ldyB2ZXJzaW9uOgo+ID4gCj4gPiBJIGFtIGZp
cm1seSBvcHBvc2VkIHRvIG92ZXJsb2FkaW5nICVvLgo+IAo+IEFuZCBJIGFtIGZpcm1seSBvZiB0
aGUgb3BpbmlvbiB0aGF0IHVzaW5nICVvIGZvciBTQkRGIGlzIHRoZSBtb3JlCj4gbmF0dXJhbCB0
aGluZyB0byBkby4KPiAKPiA+IE5vdGhpbmcgYWJvdXQgUENJIGNvb3JkaW5hdGVzIGhhcyBhbnl0
aGluZyB0byBkbyB3aXRoIG9jdGFsCj4gPiByZXByZXNlbnRhdGlvbjsgaXRzIG1vc3RseSBoZXgu
Cj4gCj4gVGhlIGRvbWFpbiBhbmQgdkNQVSBJRHMgYXJlbiN0IHBvaW50ZXItaXNoIGVpdGhlciwg
Zm9yIGV4YW1wbGUuCgpCdXQgd2UgZG8gcGFzcyB0aGUgdmNwdSBhbmQgdGhlIGRvbWFpbiBzdHJ1
Y3QgcG9pbnRlciB0byB0aG9zZQptb2RpZmllcnM/IGllOiB3ZSBkb24ndCBwYXNzIGEgdmNwdSBv
ciBhIGRvbWFpbiBJRCBkaXJlY3RseSBpbiBlaXRoZXIKY2FzZS4KCj4gPiBBbmQgZm9yIHRoZSBy
ZWNvcmQsIEknbSBmaXJtbHkgb3Bwb3NlZCB0byBvdmVybG9hZGluZyAlW3h1aWRdIGFzIHdlbGwu
Cj4gCj4gSSBhZ3JlZSB0aGF0IHdlIGRvbiN0IHdhbnQgdG8gb3ZlcmxvYWQgYW55IG9mIHRoZXNl
Lgo+IAo+ID4gJXAgaXMgdGhlIG9ubHkgZm9ybWF0dGVyIHdoaWNoIGhhcyBtYWdpYyBvdmVybG9h
ZGluZyBzbyBmYXIsIGFuZAo+ID4gYXZvaWRpbmcgZ2FpbmluZyBhIHNlY29uZCB3b3VsZCBiZSBv
ZiBzdWJzdGFudGlhbCB2YWx1ZSB3aGVuIGl0IGNvbWVzIHRvCj4gPiByZWFkaW5nIHRoZSBjb2Rl
Lgo+IAo+IEkgZG9uJ3QgYnV5IHRoaXMgYXJndW1lbnQuIFJlYWRhYmlsaXR5IG9mIHNvbWUgb2Yg
dGhlIHByaW50aygpCj4gaW52b2NhdGlvbnMgaW4gUm9nZXIncyBwYXRjaCB3YXMgKHNldmVyZWx5
IGltbykgaGFtcGVyZWQgYnkgdGhlIG5lZWQKPiB0byB0YWtlIGFkZHJlc3NlcyBvZiB0aGluZ3Mg
dGhhdCBjb3VsZCBiZSBlYXNpbHkgcGFzc2VkIGJ5IHZhbHVlLgo+IEdlbmVyYXRlZCBjb2RlIChz
aXplKSBzaG91bGQgYmUgdGFrZW4gaW50byBjb25zaWRlcmF0aW9uIGhlcmUgdG9vLAo+IGFzIHNo
b3VsZCBiZSB0aGUgKHNsaWdodGx5KSBsYXJnZXIgc3RhY2sgY29uc3VtcHRpb24gd2hlbiBnb2lu
ZyB0aGUKPiAlcHAgcm91dGUuCgpJIHBlcnNvbmFsbHkgZG9uJ3QgdGhpbmsgcGFzc2luZyB0aGUg
YWRkcmVzcyBpbnN0ZWFkIG9mIHRoZSB2YWx1ZSAoaWU6CmFkZGluZyBhbiBleHRyYSAmKSBtYXR0
ZXJzIHRoYXQgbXVjaC4gSWYgd2UgcGFzcyBieSB2YWx1ZSB0aGVuIHdlCndvdWxkIGhhdmUgdG8g
ZXhwbGljaXRseSBwYXNzIHRoZSBzYmRmIGZpZWxkIG9mIHRoZSBzdHJ1Y3QgSSBndWVzcz8KV2hp
Y2ggYWdhaW4gc2VlbXMgdG8gZGlmZmVyIGZyb20gd2hhdCB3ZSBkbyBmb3IgdmNwdXMgYW5kIGRv
bWFpbnMsCndoZXJlIGEgcG9pbnRlciB0byB0aGUgc3RydWN0IGlzIHBhc3NlZCwgcmVnYXJkbGVz
cyBvZiB3aGV0aGVyIHRoZQphY3R1YWxseSBmb3JtYXR0ZXIgb25seSBjYXJlcyBhYm91dCB0aGUg
SUQuCgpBRkFJQ1QgYm90aCB5b3UgYW4gQW5kcmV3IGFncmVlIHRoYXQgYSBjdXN0b20gcHJpbnRm
IGZvcm1hdHRlciBmb3IgUENJClNCREYgaXMgYSBkZXNpcmFibGUgdGhpbmcgdG8gaGF2ZSwgdGhl
IG9ubHkgZGlzYWdyZWVtZW50IGlzIG9uIHRoZQphY3R1YWwgaW1wbGVtZW50YXRpb24gZGV0YWls
ICh3aGV0aGVyICVwcCBvciAlb3Agc2hvdWxkIGJlIHVzZWQpLiBJbgp3aGljaCBjYXNlIEkgdGhp
bmsgSSB3b3VsZCBsaWtlIHRvIGNhbGwgZm9yIFRIRSBSRVNUIHRvIGFsc28gdm9pY2UgaW4KdGhl
aXIgb3BpbmlvbiBvbiB0aGUgbWF0dGVyIGluIG9yZGVyIHRvIHRyeSB0byByZXNvbHZlIHRoZSBz
aXR1YXRpb24Kc28gdGhhdCBJIGNhbiBtYWtlIHByb2dyZXNzIG9uIHRoZSBzZXJpZXMsIHNvcnJ5
IGlmIHRoaXMgaXMgYXdrd2FyZC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
