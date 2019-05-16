Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 470A320743
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 14:50:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRFnk-0002Bd-Qf; Thu, 16 May 2019 12:48:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dWcr=TQ=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hRFnj-0002BQ-Qw
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 12:47:59 +0000
X-Inumbo-ID: d1ab709a-77d8-11e9-b515-fbf546ac1928
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1ab709a-77d8-11e9-b515-fbf546ac1928;
 Thu, 16 May 2019 12:47:53 +0000 (UTC)
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
IronPort-SDR: gfjcw5wNal5JMTrTvk5mo2kh8Eo8QIuJPkQNs1nSxuaFhShuc7ppilkjHvDMSa60ovYZ8QWaPE
 7e3O0l5sKvPv4td+JUd54hXqFD57q3Tse0a79/PG8oNhLcnXJsatzAzlQu5acMKN81sJyzrx63
 6lXI6Yrc24PkBkLsEEjWC4HiXsgFGJx2JVjIUEVIb+RLCJKpGOzrf+DMU5lt1/PnJwnW9lcoeR
 JN72JD8wIF8ZUAyHYeqf18CKKhbNw/5ivNHr0hZ9pOm3BdhRq1bYShLYuoVq3P3qBMwJqKC9x8
 uMY=
X-SBRS: 2.7
X-MesageID: 509260
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,476,1549947600"; 
   d="scan'208";a="509260"
Date: Thu, 16 May 2019 13:47:39 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190516124739.GD2798@zion.uk.xensource.com>
References: <20190516000212.13468-1-alistair.francis@wdc.com>
 <5CDD3BF2020000780022F8AD@prv1-mh.provo.novell.com>
 <20190516111330.GA32248@aepfle.de>
 <20190516113902.GZ2798@zion.uk.xensource.com>
 <20190516134432.3029d52a.olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190516134432.3029d52a.olaf@aepfle.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH 1/3] config.sub: Update config.sub to latest
 version
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
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>, alistair23@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMDE6NDQ6MzJQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gVGh1LCAxNiBNYXkgMjAxOSAxMjozOTowMiArMDEwMAo+IHNjaHJpZWIgV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT46Cj4gCj4gPiBJIGd1ZXNzIGFsbCBJIGNhbiBzYXkgYXQg
dGhpcyBwb2ludCBpcyB0aGF0IEkgaGF2ZW4ndCBkb25lIGEgc3VydmV5IG9uCj4gPiB0aGUgZGlm
ZmVyZW5jZXMgb2YgdGhlIGF1dG90b29scyBzaGlwcGVkIGluIGFsbCB0aGUgZGlzdHJvcyB3ZSBj
YXJlCj4gPiBhYm91dCAoZXNwZWNpYWxseSB0aGUgb2xkZXIgb25lcyksIHNvIEkgd291bGQgZXJy
IG9uIHRoZSBzYWZlIHNpZGUgdG8KPiA+IGtlZXAgdGhlIGluLXRyZWUgY29uZmlndXJlIHNjcmlw
dC4KPiAKPiBHaXZlbiB0aGF0IGFsbCBkaXN0cm9zIGZvciBzdXJlIGRpZCBydW4gJ2F1dG9nZW4u
c2gnIGluIGEgbGFyZ2UgbnVtYmVyCj4gb2YgcGFja2FnZXMgc2luY2UgeWVhcnMgaXQgaXMgZWFz
eSB0byBndWVzcyB0aGF0IGluIGdlbmVyYWwgaXQganVzdCB3b3Jrcy4KPiAKPiBBbmQgaWYgWGVu
IGRlY2lkZXMgdGhhdCBhIGNlcnRhaW4gYXV0b2NvbmYgdmVyc2lvbiBpcyBpcyB0aGUgbWluaW11
bSwKPiBjb25maWd1cmUuYWMgaGFzIGEga25vYiBmb3IgdGhhdCB0aGUgbWluaW1hbCByZXF1aXJl
ZCB0b29scyB2ZXJzaW9uLgoKT0suIFRoaXMgZG9lcyBhbGxldmlhdGUgbXkgY29uY2Vybi4KCj4g
QXMgSSBzYWlkLCBhdXRvb29scyBhcmUgbm90IHJ1bnRpbWUgZGVwZW5kZW5jaWVzLCBub3IgaXMg
bWFrZXxmbGV4fGJpc29uLgo+IAo+IFNvLCBwbGVhc2UgY29uc2lkZXIgbW92aW5nIHRoZXNlIGdl
bmVyYXRlZCBmaWxlcyB0byAuZ2l0aWdub3JlLgo+IAoKSWFuLCB5b3VyIG9waW5pb24/CgpXZWku
Cgo+IE9sYWYKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
