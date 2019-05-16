Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B36B2204B4
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 13:29:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hREXD-0001bM-Ej; Thu, 16 May 2019 11:26:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dWcr=TQ=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hREXC-0001bC-KR
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 11:26:50 +0000
X-Inumbo-ID: 7d1d8e2e-77cd-11e9-9b37-e78ce79e7dc5
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d1d8e2e-77cd-11e9-9b37-e78ce79e7dc5;
 Thu, 16 May 2019 11:26:46 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=SoftFail smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa6.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com is inclined to not designate 23.29.105.83
 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: bAnTFkU4m2zzYdlCp1lWZLztpCDGZpw5axbrXxhAFG/Q/wbl+HoycCnUGEXI6AEMvMJJGui7dC
 OhjrPxx30Ln1ZeItSHMt8WGuC1fa7yyG73c/NREyOiZ+voCWihoO480yhnzfxJOWoyfMm3rDSZ
 uOrJJuZg6tZY6IcE3gz9VzKYNst9zd5bb/wR7D5WHxPC67M0QY6qzFWlaX0beg38DXNGuIVZeQ
 hXVyS5sOqGjMdpgvkel2f9snNxvu0WYD9lxFnvpcHQM5ejwKpd4o9fqIV5/jgxmuwF9GtxH8xy
 f7Q=
X-SBRS: 2.7
X-MesageID: 497355
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,476,1549947600"; 
   d="scan'208";a="497355"
Date: Thu, 16 May 2019 12:26:38 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Viktor Mitin <viktor.mitin.19@gmail.com>
Message-ID: <20190516112638.GX2798@zion.uk.xensource.com>
References: <20190516111354.15195-1-viktor.mitin.19@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190516111354.15195-1-viktor.mitin.19@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] coverage: GCC coverage libfdt Makefile fix
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
Cc: xen-devel@lists.xenproject.org, Julien
 Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMDI6MTM6NTRQTSArMDMwMCwgVmlrdG9yIE1pdGluIHdy
b3RlOgo+IFRoZSBwYXRjaCByZXNvbHZlcyAneGVuY292JyBjcmFzaGVzIGluIGNhc2Ugb2YgQWFy
Y2g2NC4KPiAKPiBBbGwgdGhlIC5pbml0Liogc2VjdGlvbnMgYXJlIHN0cmlwcGVkIGFmdGVyIGJv
b3QsCj4gaXQgbWVhbnMgdGhhdCBhbnl0aGluZyBpbiAuaW5pdC5kYXRhIGNhbm5vdCBiZSBhY2Nl
c3NlZCBhbnltb3JlLgo+IFRoZSBidWlsZCBzeXN0ZW0gZXhwbGljaXRseSBjb21waWxlcyBhbnkg
LmluaXQgYmluYXJ5IHdpdGhvdXQgZ2NvdiBvcHRpb24uCj4gVGhlIHByb2JsZW0gaXMgY29taW5n
IGZyb20gbGliZmR0Lgo+IFRoZSBlbnRpcmUgbGlicmFyeSBpcyBtb3ZlZCB0byAuaW5pdCB1c2lu
ZzoKPiAkKE9CSkNPUFkpICQoZm9yZWFjaCBzLCQoU0VDVElPTlMpLC0tcmVuYW1lLXNlY3Rpb24g
LiQocyk9LmluaXQuJChzKSkgJDwgJEAKPiBTbyB3ZSBuZWVkIHRvIHRlbGwgdGhlIHRvcCBNYWtl
ZmlsZSB0byBmaWx0ZXIgb3V0IGxpYmZkdC4KPiAKPiBSZXBvcnRlZC1ieTogVmlrdG9yIE1pdGlu
IDx2aWt0b3IubWl0aW4uMTlAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFs
bCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gVGVzdGVkLWJ5OiBWaWt0b3IgTWl0aW4gPHZpa3Rv
ci5taXRpbi4xOUBnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4KCkFsdGhvdWdoIEkgd291bGQgbGlrZSB0byBhc2sgeW91IHRvIGFkanVzdCB0aGUg
c3ViamVjdCB0byBiZSBtb3JlCnNwZWNpZmljOgoKICBjb3ZlcmFnZTogZmlsdGVyIG91dCBsaWJm
ZHQubwoKaWYgeW91IGFncmVlLCB0aGlzIGNhbiBiZSBkb25lIHdoaWxlIGNvbW1pdHRpbmcuCgpX
ZWkuCgoKPiAtLS0KPiAgeGVuL2NvbW1vbi9saWJmZHQvTWFrZWZpbGUgfCAxICsKPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vbGli
ZmR0L01ha2VmaWxlIGIveGVuL2NvbW1vbi9saWJmZHQvTWFrZWZpbGUKPiBpbmRleCBkODFmNTRi
NmI4Li5jMDc1YmJmNTQ2IDEwMDY0NAo+IC0tLSBhL3hlbi9jb21tb24vbGliZmR0L01ha2VmaWxl
Cj4gKysrIGIveGVuL2NvbW1vbi9saWJmZHQvTWFrZWZpbGUKPiBAQCAtMyw2ICszLDcgQEAgaW5j
bHVkZSBNYWtlZmlsZS5saWJmZHQKPiAgU0VDVElPTlMgOj0gdGV4dCBkYXRhICQoU1BFQ0lBTF9E
QVRBX1NFQ1RJT05TKQo+ICAKPiAgb2JqLXkgKz0gbGliZmR0Lm8KPiArbm9jb3YteSArPSBsaWJm
ZHQubwo+ICAKPiAgQ0ZMQUdTICs9IC1JJChCQVNFRElSKS9pbmNsdWRlL3hlbi9saWJmZHQvCj4g
IAo+IC0tIAo+IDIuMTcuMQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
