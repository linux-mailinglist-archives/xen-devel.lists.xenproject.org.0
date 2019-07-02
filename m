Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 296425D3BB
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 17:59:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiL9O-0005eq-F8; Tue, 02 Jul 2019 15:56:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ftjz=U7=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hiL9N-0005el-Kx
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 15:56:57 +0000
X-Inumbo-ID: 01819ce4-9ce2-11e9-b8af-4bfe8a6a9e68
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01819ce4-9ce2-11e9-b8af-4bfe8a6a9e68;
 Tue, 02 Jul 2019 15:56:51 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hkFUVYBRiHnhDfPPEVGh+cv89pz9DfmmMnfvbRPGp3CkCugQ602qErfHktvzu8asm+3hHNeZhO
 TDSqqRUXi1Bgi4UL0hP47F812J/T9prEcXK1+h8muPdArNMsV6lwArj3dtQ4M2RgdOSej0PXf0
 4KMXh81jYX5phsCpONw9PfDpcE05eYoKUcH3r9csMsojKth8el2fcPlXRlsNNSVqLEsKl83NJ5
 q1V4qtBhP3r5ZA0L88MFintl3WvsQhsgynophwev3e96Ev74+t9TcwDB+OjK49lET1cGMuSpkv
 ITE=
X-SBRS: 2.7
X-MesageID: 2519737
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,443,1557201600"; 
   d="scan'208";a="2519737"
Date: Tue, 2 Jul 2019 15:52:37 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190702145237.GC22182@perard.uk.xensource.com>
References: <20190621092944.29241-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190621092944.29241-1-olaf@aepfle.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH v1] Use XEN_SCRIPT_DIR to refer to
 /etc/xen/scripts
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiBGcmksIEp1biAyMSwgMjAxOSBhdCAxMToyOTo0NEFNICswMjAwLCBPbGFmIEhlcmlu
ZyB3cm90ZToKPiBOb3cgdGhhdCBzY3JpcHRzIGFyZSBzdG9yZWQgaW4gbGliZXhlYywgcmVwbGFj
ZSBhbGwgaGFyZGNvZGVkIHBhdGhzIHRvCj4gdXNlIFhFTl9TQ1JJUFRfRElSIHRvIGV4cGFuZCB0
aGUgYWN0dWFsIGxvY2F0aW9uLgoKQXMgZmFyIGFzIEkgY2FuIHRlbGwsIHRoaXMgaXNuJ3QgdHJ1
ZSwgc2NyaXB0cyBhcmUgbG9jYXRlZCBpbiAvZXRjLgoKSWYgeW91IHdhbnQgdG8gbW92ZSB0aGUg
c2NyaXB0cyBmcm9tIC9ldGMgdG8gbGliZXhlYywgaXQgbWlnaHQgYmUgd29ydGgKZG9pbmcgc28g
aW4gYSBzZXBhcmF0ZWQgcGF0Y2guIEFuZCBrZWVwIHRoaXMgcGF0Y2ggdG8gb25seSBtb3ZlIGhh
cmQKY29kZGVkIHN0cmluZ3MgIi9ldGMveGVuL3NjcmlwdHMiIHRvIHVzZSBYRU5fU0NSSVBUX0RJ
UiBpbnN0ZWFkLgoKU2luY2UgdGhpcyBwYXRjaCBkb2Vzbid0IGFjdHVhbGx5IG1vdmUgYW55dGhp
bmcsIHRoZXJlIG1pZ2h0IGJlIGEKZGlmZmVyZW50IHBhdGNoLiBUaGUgcGF0Y2ggY29tbWVudCBk
b2Vzbid0IG5lZWRzIHRvIGRpc2N1c3MgYWJvdXQgaXQgYXQKYWxsLiBTbyByZW1vdmluZyB0aGUg
Y29tbWVudCBhYm91dCBsb2NhdGlvbiBvZiBzY3JpcHRzIGFuZCB0aGUgZXh0cmEKaHVuayBhbmQg
dGhpcyBwYXRjaCB3b3VsZCBiZSBmaW5lIGJ5IG1lLgoKPiBVcGRhdGUgLmdpdGlnbm9yZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBPbGFmIEhlcmluZyA8b2xhZkBhZXBmbGUuZGU+Cj4gLS0tCj4gZGlm
ZiAtLWdpdCBhL2RvY3MvbWlzYy9ibG9jay1zY3JpcHRzLnR4dCBiL2RvY3MvbWlzYy9ibG9jay1z
Y3JpcHRzLnR4dAo+IGluZGV4IGVhYmFiMTAwYTguLjgwMjA3ODdhNTIgMTAwNjQ0Cj4gLS0tIGEv
ZG9jcy9taXNjL2Jsb2NrLXNjcmlwdHMudHh0Cj4gKysrIGIvZG9jcy9taXNjL2Jsb2NrLXNjcmlw
dHMudHh0Cj4gQEAgLTE4LDcgKzE4LDcgQEAgU2V0dXAKPiAgCj4gIEl0IGlzIGhpZ2hseSByZWNv
bW1lbmRlZCB0aGF0IGN1c3RvbSBob3RwbHVnIHNjcmlwdHMgYXMgbXVjaCBhcwo+ICBwb3NzaWJs
ZSBpbmNsdWRlIGFuZCB1c2UgdGhlIGNvbW1vbiBYZW4gZnVuY3Rpb25hbGl0eS4gIElmIHRoZSBz
Y3JpcHQKPiAtaXMgcnVuIGZyb20gdGhlIG5vcm1hbCBibG9jayBzY3JpcHQgbG9jYXRpb24gKC9l
dGMveGVuL3NjcmlwdHMgYnkKPiAraXMgcnVuIGZyb20gdGhlIG5vcm1hbCBibG9jayBzY3JpcHQg
bG9jYXRpb24gKC91c3IvbGliL3hlbi9zY3JpcHRzIGJ5CgpJIGRvbid0IHRoaW5rIHRoaXMgaHVu
ayBiZWxvbmcgdG8gdGhpcyBwYXRjaCwgaXQgd291bGQgYmUgYmV0dGVyIHRvIGhhdmUKdGhhdCBp
biBhIGRpZmZlcmVudCBwYXRjaCwgSSB0aGluay4KCj4gIGRlZmF1bHQpLCB0aGVuIHRoaXMgY2Fu
IGJlIGRvbmUgYnkgYWRkaW5nIHRoZSBmb2xsb3dpbmcgdG8gdGhlIHRvcCBvZgo+ICB0aGUgc2Ny
aXB0Ogo+ICAKClRoYW5rcywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
