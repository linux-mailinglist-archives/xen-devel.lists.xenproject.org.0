Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB9286327
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 15:31:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hviT9-0000UC-S0; Thu, 08 Aug 2019 13:28:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nHR3=WE=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hviT8-0000U4-NC
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 13:28:38 +0000
X-Inumbo-ID: 6c2ff034-b9e0-11e9-9968-1becc8996c66
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c2ff034-b9e0-11e9-9968-1becc8996c66;
 Thu, 08 Aug 2019 13:28:35 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PruM8YqkTuP27u31Ume+eVV4aI4ZY1TojV1lv3NXHCTbUggZXUjigzzling6gFjh21Bp5FqINv
 OD+ozg2g4NlPlc0gOV+Gea1zxTGTNjoYzE2JFRxqL31xO6RirwCF1GmSheiOTB+YZgN0gUkh/P
 FlWujs5cWr2N6GgENq7/VVRONwgw6pAkh6kucRlp8vLNdzOalR2STU1vzx0oYAUpLjqvhbfRMC
 62yLH5/mQteWj/PXThhsP+frN0xZaHwN4zMS8USIIjqt3phJxvFVOGJo+iv5xLkhv6iROv9w3R
 WI0=
X-SBRS: 2.7
X-MesageID: 4190985
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,361,1559534400"; 
   d="scan'208";a="4190985"
Date: Thu, 8 Aug 2019 14:28:32 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20190808132832.GU1242@perard.uk.xensource.com>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-30-anthony.perard@citrix.com>
 <20190807155451.pkld6zhcxljzx6d7@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190807155451.pkld6zhcxljzx6d7@Air-de-Roger>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 29/35] OvmfPkg/OvmfXen:
 Override PcdFSBClock to Xen vLAPIC timer frequency
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDU6NTQ6NTFQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBNb24sIEp1bCAyOSwgMjAxOSBhdCAwNDozOTozOFBNICswMTAwLCBBbnRo
b255IFBFUkFSRCB3cm90ZToKPiA+IFBjZEZTQkNsb2NrIGlzIHVzZWQgYnkgU2VjUGVpRHhlVGlt
ZXJMaWJDcHUsIHRoZSBUaW1lckxpYgo+ID4gaW1wbGVtZW50YXRpb24uIEl0IHdpbGwgYWxzbyBi
ZSB1c2VkIGJ5IFhlblRpbWVyRHhlLiBPdmVycmlkZQo+ID4gUGNkRlNCQ2xvY2sgdG8gbWF0Y2gg
WGVuIHZMQVBJQyB0aW1lciBmcmVxdWVuY3kuCj4gCj4gSSdtIGtpbmQgb2Ygc3VycHJpc2VkIHRo
YXQgaGlzIGlzIG5vdCBhdXRvbWF0aWNhbGx5IGRldGVjdGVkPwo+IAo+IElzIGl0IGEgYnVnIGlu
IFhlbiBvciBqdXN0IGFsd2F5cyBoYXJkY29kZWQgb24gT1ZNRj8KCkl0J3MgaGFyZGNvZGVkLiBX
aHkgd291bGQgeW91IG5lZWQgYXV0byBkZXRlY3Rpb24gd2hlbiB5b3UgYWx3YXlzIHJ1biBvbgp0
aGUgc2FtZSBtYWNoaW5lIDstKS4KCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
