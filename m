Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C341F24D5E
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 12:58:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hT2Pp-0007g8-Va; Tue, 21 May 2019 10:54:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3mDO=TV=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hT2Po-0007g3-Uu
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 10:54:40 +0000
X-Inumbo-ID: d2ecad66-7bb6-11e9-adc6-b35ba188cc89
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2ecad66-7bb6-11e9-adc6-b35ba188cc89;
 Tue, 21 May 2019 10:54:36 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=Pass smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: +xKiukHE9CRvUQLxBZwVEBWGiWiGKHSEOBKptLPj+gZ+YAzksp/+yA+tEMxSWTn2E/E/WF7UI4
 6hMi+cPPCC8YLFcZOIYxJ/RonIyLUfIjiXk8s/2rQ6dgD8ZlY465DPmmWR1tOD+L23KO+rKHN/
 xZGGDqXocFf+1F33NrBbxsC7VNgo4Shh04b8veT/oD1Vro1kkuS3Dy41NRUYTyHybTRTkJyHq/
 t4bjzg1+lTfnOI4m6EgxQiDqwIElwTovkHiUZoV5wfk7eU7Pc6JC7Va5/3A/WU1zb1/9Rfy6MI
 Huc=
X-SBRS: 2.7
X-MesageID: 685833
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,494,1549947600"; 
   d="scan'208";a="685833"
Date: Tue, 21 May 2019 11:54:28 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Alistair Francis <alistair.francis@wdc.com>
Message-ID: <20190521105428.GF1846@zion.uk.xensource.com>
References: <20190517223152.29839-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190517223152.29839-1-alistair.francis@wdc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH v2 1/2] autotools: Updage config.guess and
 config.sub
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
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, konrad.wilk@oracle.com,
 George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, tim@xen.org, julien.grall@arm.com,
 jbeulich@suse.com, alistair23@gmail.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMDM6MzE6NTFQTSAtMDcwMCwgQWxpc3RhaXIgRnJhbmNp
cyB3cm90ZToKPiBUaGUgYXV0b2NvbmYgbWFudWFsIFsxXSBzcGVjaWZpZXMgdGhhdCBhcyB3ZSBk
ZWZpbmUgQUNfQ0FOT05JQ0FMX0hPU1Qgd2UKPiBtdXN0IHN1cHBseSBjb25maWcuZ3Vlc3MgYW5k
IGNvbmZpZy5zdWIuIEluIHdoaWNoIGNhc2UgbGV0J3MgdXBkYXRlIHRoZW0KPiBmcm9tIFsyXSBj
b21taXQ6IGI5ODQyNGMyNCAiY29uZmlnLmd1ZXNzOiBSZW1vdmUgc3BhY2UgYWZ0ZXIgIiNlbmRp
ZiIsIGFzCj4gR251bGliIGFuZCBzb21lIgo+IAo+IFRoaXMgYWxsb3dzIHVzIHRvIHN1cHBvcnQg
bW9yZSBhY2hpdGVjdHVyZXMgKFJJU0MtVikgYW5kIG90aGVyIGdlbmVyYWwKPiBpbXByb3ZlbWVu
dHMuCj4gCj4gMTogaHR0cHM6Ly93d3cuZ251Lm9yZy9zb2Z0d2FyZS9hdXRvY29uZi9tYW51YWwv
YXV0b2NvbmYuaHRtbCNDYW5vbmljYWxpemluZwo+IDI6IGh0dHBzOi8vZ2l0LnNhdmFubmFoLmdu
dS5vcmcvY2dpdC9jb25maWcuZ2l0Lwo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsaXN0YWlyIEZyYW5j
aXMgPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT4KCkFja2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1
MkBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
