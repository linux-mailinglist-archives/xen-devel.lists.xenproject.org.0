Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C52A20734
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 14:47:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRFjW-0001r7-M2; Thu, 16 May 2019 12:43:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dWcr=TQ=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hRFjU-0001qx-Ml
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 12:43:36 +0000
X-Inumbo-ID: 37e4075b-77d8-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 37e4075b-77d8-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 12:43:34 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=SoftFail smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa1.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com is inclined to not designate 23.29.105.83
 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: bVOctb7w5JuhaxGyVIlMpWiU1iVK1QNHtDjKAwyn17s1Lb6qM5GvZJRzXqRukSLytjaz067QE3
 zpPNwfnuSrU0YrjXidnpEgpkLrBMBROu61eo8bmsWzsdjDa8Kno5PqQI9P7gMygke1ZhUSSQgK
 voNkEwuP1sGylN2najTY5e9lNn+3ptUjrOLsflH8fl6JMwKjEoc0FuDYF0JwlDSTDBjosyKPE2
 3/USImuTDBuFuG28bKoX+nl+fDhMLJtgX9R92NIO7kUWIMsxEfvhPV1nnFzARrYGjmGOwuZAkn
 rSA=
X-SBRS: 2.7
X-MesageID: 509023
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,476,1549947600"; 
   d="scan'208";a="509023"
Date: Thu, 16 May 2019 13:42:30 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20190516124230.GC2798@zion.uk.xensource.com>
References: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
 <20190516110735.67e19d15.ohering@suse.com>
 <20190516104540.7hiqsn6qjeaam2c6@Air-de-Roger>
 <20190516125735.6c1bf1ca.ohering@suse.com>
 <20190516112450.GW2798@zion.uk.xensource.com>
 <20190516114255.7t6re7yot6wp3mom@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190516114255.7t6re7yot6wp3mom@Air-de-Roger>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] Regression in xen-unstable due to commit
 3802ecbaa9eb36
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
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wei.liu2@citrix.com>, Olaf Hering <ohering@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMDE6NDI6NTVQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUaHUsIE1heSAxNiwgMjAxOSBhdCAxMjoyNDo1MFBNICswMTAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gT24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMTI6NTc6MzVQTSArMDIwMCwg
T2xhZiBIZXJpbmcgd3JvdGU6Cj4gPiA+IEFtIFRodSwgMTYgTWF5IDIwMTkgMTI6NDU6NDAgKzAy
MDAKPiA+ID4gc2NocmllYiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT46
Cj4gPiA+IAo+ID4gPiA+IEhhdmluZyBhIGZpZWxkIGluIGJ1aWxkX2luZm8gd2l0aCBhIGRlZmF1
bHQgdmFsdWUgdGhhdCBkZXBlbmRzIG9uCj4gPiA+ID4gZmllbGRzIG91dHNpZGUgb2YgYnVpbGRf
aW5mbyBpcyBwcm9ibGVtYXRpYywgc2luY2Ugbm90IGFsbCBjYWxsZXJzIG9mCj4gPiA+ID4gbGli
eGxfX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1bHQgaGF2ZSBhY2Nlc3MgdG8gbGlieGxfZG9t
YWluX2NvbmZpZy4KPiA+ID4gCj4gPiA+IE9uZSBvcHRpb24gd291bGQgYmUgYSBuZXcgQVBJIHRo
YXQgZ2V0cyBhIGxpYnhsX2RvbWFpbl9jb25maWcgYW5kIHdoaWNoCj4gPiA+IGNhbGxzIGxpYnhs
X19kb21haW5fc2V0X2RldmljZV9tb2RlbCwgbGlieGxfX2RvbWFpbl9jcmVhdGVfaW5mb19zZXRk
ZWZhdWx0Cj4gPiA+IGFuZCBsaWJ4bF9fZG9tYWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdC4gVG8g
bWUgaXQgbG9va3MgbGlrZSBjcmVhdGVfZG9tYWluCj4gPiA+IGNhbiBub3QgYnVpbGQgYSBwcm9w
ZXIgZF9jb25maWcgYWxsIG9uIGl0cyBvd24sIGl0IGp1c3QgaGFzIG5vdCBlbm91Z2ggaW5mby4K
PiA+IAo+ID4gSWYgeW91J3JlIHRhbGtpbmcgYWJvdXQgYWRkaW5nIGEgbmV3IF9wdWJsaWNfIEFQ
SToKPiA+IAo+ID4gVGhlIHByb2JsZW0gd2l0aCB0aGlzIGFwcHJvYWNoIGlzIHRoYXQgaXQgZG9l
c24ndCBoZWxwIGV4aXN0aW5nIGxpYnhsCj4gPiB1c2Vycy4gVGhleSB3aWxsIG5lZWQgdG8gYmUg
Zml4ZWQgYnkgY2FsbGluZyB0aGlzIG5ldyBBUEkuCj4gPiAKPiA+IFdpbGwgaXQgd29yayBpZiAx
KSB5b3UgbWFrZSBsaWJ4bF9fZG9tYWluX3NldF9kZXZpY2VfbW9kZWwgaWRlbXBvdGVudAo+ID4g
YW5kIDIpIGNhbGwgaXQgZnJvbSB3aXRoaW4gbGlieGxfX2RvbWFpbl9idWlsZF9pbmZvX3NldGRl
ZmF1bHQgKHdoaWNoCj4gPiBiYXNpY2FsbHkgcmVzdG9yZXMgdGhlIG9yaWdpbmFsIGNvZGUgcGF0
aCBiZWZvcmUgeW91ciBwYXRjaCk/Cj4gCj4gQ2FsbGluZyBsaWJ4bF9fZG9tYWluX3NldF9kZXZp
Y2VfbW9kZWwgZnJvbQo+IGxpYnhsX19kb21haW5fYnVpbGRfaW5mb19zZXRkZWZhdWx0IHdvdWxk
IHJlcXVpcmUgcGFzc2luZwo+IGRvbWFpbl9jb25maWcgdG8gbGlieGxfX2RvbWFpbl9idWlsZF9p
bmZvX3NldGRlZmF1bHQsIHdoaWNoIGdldHMgYmFjawo+IHRvIG15IHByb3Bvc2FsLgo+IAoKT2gg
SSBzZWUgd2hhdCB5b3Ugd2VyZSBnZXR0aW5nIGF0LgoKSSBoYXZlIG1lcmVseSBiZWVuIGxvb2tp
bmcgYXQgdGhlIG9uZSBwYXRjaCB0aGF0IGludHJvZHVjZWQgdGhpcwpyZWdyZXNzaW9uIHdoaWNo
IGRpZG4ndCB1c2UgYW55IGZpZWxkIGluIGRfY29uZmlnLiBCdXQgaW4gdGhlIHN1YnNlcXVlbnQK
cGF0Y2ggZF9jb25maWcgd2FzIHVzZWQuCgo+IEluIG9yZGVyIHRvIGtub3cgaWYgYSBQViBvciBQ
VkggZG9tYWluIHJlcXVpcmVzIGEgZGV2aWNlIG1vZGVsIChmb3IKPiB0aGUgUFYgYmFja2VuZHMp
IGxpYnhsIG5lZWRzIHRvIGxvb2sgYXQgdGhlIGNvbnRlbnRzIG9mIGRvbWFpbl9jb25maWcKPiBi
ZWNhdXNlIHRoYXQncyB3aGVyZSB0aGUgbGlzdCBvZiBkZXZpY2VzIGlzIHN0b3JlZC4KPiAKPiBB
bm90aGVyIG9wdGlvbiB3b3VsZCBiZSB0byBkaWZmZXJlbnRpYXRlIGJldHdlZW4gZGV2aWNlIG1v
ZGVsIGFuZCBQVgo+IGJhY2tlbmQuIEluIHRoZSBQVi9QVkggY2FzZSBRRU1VIGlzIG5vdCBhY3Rp
bmcgYXMgYSBkZXZpY2UgbW9kZWwgYnV0Cj4gcmF0aGVyIGFzIGEgUFYgYmFja2VuZCwgaGVuY2Ug
aXQgY291bGQgYmUgc2lnbmFsZWQgdXNpbmcgYSBkaWZmZXJlbnQKPiBmaWVsZCwgdGhhdCBjb3Vs
ZCBsaXZlIGluIGRvbWFpbl9jb25maWcgaW5zdGVhZCBvZgo+IGRvbWFpbl9idWlsZF9pbmZvPwoK
SSB0aGluayB0aGlzIGlzIGdlbmVyYWxseSBhIGdvb2QgaWRlYS4gTm90IHN1cmUgaG93IG11Y2gg
Y29kZSBjaHVybiBpcwpnb2luZyB0byBiZSB0aG91Z2guCgpXZWkuCgo+IAo+IFJvZ2VyLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
