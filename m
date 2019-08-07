Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F2784BB4
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 14:34:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvL5c-0007QW-Qi; Wed, 07 Aug 2019 12:30:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=besu=WD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hvL5b-0007QR-BM
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 12:30:47 +0000
X-Inumbo-ID: 2d99c37d-b90f-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2d99c37d-b90f-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 12:30:45 +0000 (UTC)
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
IronPort-SDR: a3c8SrBxFYBC7Eo6Wf58t7kZOjoauCQ1owp5ZJ3XtPMqI3hRPnPWeFWLRWW92CQ3BGshtkP021
 iP++iar31POw+iKEsACGU5jVKtOLtruJXUHkMu1WPYFcl+mH08vruqVC8GoC/K/OEFG2CAJbYy
 FpvLAf4xA2Oz1EXjajCollgVUFYiecDKra3j0VPERXuSJYAJxMzaPbdk9J64YLmjdDSH4ZsLkJ
 SfPZcWbydhl046jiMZ01rqOvkeTFi7tL0ps1lD3xuuoRw2XMe3kXUMwfeVMoIq6VsPM8A0hRaG
 +fY=
X-SBRS: 2.7
X-MesageID: 4104244
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,357,1559534400"; 
   d="scan'208";a="4104244"
To: "Elnikety, Eslam" <elnikety@amazon.com>
References: <20190807112024.19480-1-elnikety@amazon.com>
 <0aaa7b3b-fc94-d3fb-7afc-2f670511fea0@citrix.com>
 <9F89B8B5-D92E-4CA6-ABCF-5F8E9707AE94@amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <49a95cf4-0b76-234b-ebef-2ed290ef5330@citrix.com>
Date: Wed, 7 Aug 2019 13:30:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9F89B8B5-D92E-4CA6-ABCF-5F8E9707AE94@amazon.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] evtchn: make support for different ABIs
 tunable
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMDgvMjAxOSAxMzowNywgRWxuaWtldHksIEVzbGFtIHdyb3RlOgo+PiBPbiA3LiBBdWcg
MjAxOSwgYXQgMTM6NDAsIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
IHdyb3RlOgo+Pgo+PiBPbiAwNy8wOC8yMDE5IDEyOjIwLCBFc2xhbSBFbG5pa2V0eSB3cm90ZToK
Pj4+IEFkZGluZyBzdXBwb3J0IGZvciBGSUZPIGV2ZW50IGNoYW5uZWwgQUJJIHdhcyBmaXJzdCBp
bnRyb2R1Y2VkIGluIFhlbiA0LjQKPj4+IChzZWUgODg5MTAwNjFlYzYpLiBNYWtlIHRoaXMgc3Vw
cG9ydCB0dW5hYmxlLCBzaW5jZSB0aGUgY2hvaWNlIG9mIHdoaWNoCj4+PiBldmVudCBjaGFubmVs
IEFCSSBoYXMgaW1wbGljYXRpb25zIGZvciBoaWJlcm5hdGlvbi4gQ29uc2lkZXIgcmVzdW1pbmcg
YQo+Pj4gcHJlIFhlbiA0LjQgaGliZXJuYXRlZCBMaW51eCBndWVzdC4gVGhlIGd1ZXN0IGJvb3Qg
a2VybmVsIGRlZmF1bHRzIHRvIEZJRk8KPj4+IEFCSSwgd2hlcmVhcyB0aGUgcmVzdW1lIGtlcm5l
bCBhc3N1bWVzIDJMLiBUaGlzLCBpbiB0dXJuLCByZXN1bHRzIGluIFhlbgo+Pj4gYW5kIHRoZSBy
ZXN1bWVkIGtlcm5lbCB0YWxraW5nIHBhc3QgZWFjaCBvdGhlciAoZHVlIHRvIGRpZmZlcmVudCBw
cm90b2NvbHMKPj4+IEZJRk8gdnMgMkwpLgo+PiBJJ20gYWZyYWlkIEkgZG9uJ3QgZm9sbG93Lgo+
Pgo+PiBXZSBoYXZlIGEgTGludXgga2VybmVsIHdoaWNoIGtub3dzIGFib3V0IEZJRk8sIHdoaWNo
IHdhcyBmaXJzdCBib290ZWQgb24KPj4gWGVuIDwgNC40LCBzbyBjb25maWd1cmVkIDJMIG1vZGUu
Cj4+Cj4+IEl0IGlzIHRoZW4gc3VzcGVuZGVkLCBhbmQgcmVzdW1lZCBvbiBhIG5ld2VyIFhlbiA+
PSA0LjQuICBUaGUgZ3Vlc3Qgbm93Cj4+IGhhcyBhIGNob2ljZSBiZXR3ZWVuIDJMIG1vZGUsIGFu
ZCBGSUZPIG1vZGUuCj4+Cj4+IFdoYXQgaXMgdGhlIHByb2JsZW0/Cj4+Cj4+IFdoZW4gcmVzdW1p
bmcsIHRoZSBndWVzdCBpbiBxdWVzdGlvbiBzaG91bGQgY29udGludWUgdG8gdXNlIDJMIG1vZGUs
Cj4+IGJlY2F1c2UgdGhhdCBpcyB3aGF0IGl0IHdhcyB1c2luZyBwcmV2aW91c2x5Lgo+Pgo+PiB+
QW5kcmV3Cj4KPiBBZnRlciByZXN1bWluZyAoaS5lLiwgTGludXgncyBzb2Z0d2FyZV9yZXN1bWUp
LCB0aGUgZ3Vlc3Qgd2lsbCBpbmRlZWQgY29udGludWUgdG8gdXNlIDJMLiBIb3dldmVyLCBYZW4g
aGFzIGFscmVhZHkgZG9uZSBldnRjaG5fZmlmb19pbml0X2NvbnRyb2wgYXMgcGFydCBvZiB0aGUg
Ym9vdCBrZXJuZWwgaW5pdCAoYmVmb3JlIHRoZSBndWVzdCdzIHNvZnR3YXJlX3Jlc3VtZSkuIFRo
ZW4sIHdlIHJlYWNoIHRoZSBwb2ludCB3aGVyZSBndWVzdCBhc3N1bWVzIDJMIGFuZCBYZW4gYXNz
dW1lcyBGSUZPLgoKV2l0aCBEYXZpZHMgZXhwbGFuYXRpb24sIEkgbm93IHVuZGVyc3RhbmQgdGhl
IHByb2JsZW0uwqAgSG93ZXZlciBmb3IKY2xhcml0eSwgaXQgaXMgcHJvYmFibHkgd29ydGggbWFr
aW5nIGEgY29ycmVjdGlvbiBoZXJlLgoKSXQgaXNuJ3QgWGVuIHdoaWNoIGRvZXMgZXZ0Y2huX2Zp
Zm9faW5pdF9jb250cm9sKCkuwqAgSXQgaXMgdGhlICJib290IgprZXJuZWwgaXNzdWluZyBFVlRD
SE5PUF9pbml0X2NvbnRyb2wgaHlwZXJjYWxsIHdoaWNoIHN3aXRjaGVzIHRoZSBkb21haW4KZnJv
bSAyTCBtb2RlIGludG8gRklGTyBtb2RlLgoKWGVuIGlzIGRvaW5nIGV4YWN0bHkgYXMgaXQgd2Fz
IGluc3RydWN0ZWQuwqAgVGhlIHVuZGVybHlpbmcgYnVnIGlzIGEKbWlzbWF0Y2ggaW4gYmVoYXZp
b3VyIGJldHdlZW4gdGhlICJib290IiBrZXJuZWwgYW5kIHRoZSBvbi1kaXNrCmtlcm5lbC9zdGF0
ZS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
