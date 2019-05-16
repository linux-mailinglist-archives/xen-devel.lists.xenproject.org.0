Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 339752026D
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 11:21:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRCY3-0006j8-Ee; Thu, 16 May 2019 09:19:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dWcr=TQ=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hRCY2-0006iz-CK
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 09:19:34 +0000
X-Inumbo-ID: b6152e60-77bb-11e9-88da-0b22cadeb076
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b6152e60-77bb-11e9-88da-0b22cadeb076;
 Thu, 16 May 2019 09:19:31 +0000 (UTC)
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
IronPort-SDR: BKovJMZATgHZWcnO0Efb7ZoMZASg9UxrggSXL6lKATGaKYgt04EpQ2hw0FjjD5vGrMOhtSFa4i
 XnaCb58qGV4S3X0jCltYhZ/DYgRKrLP7E8Tjax1NGcGj3esJ5vWfYC8kJPcN1gkD2PZShlLyNC
 nmqWXd+qNungYsezBaNZ1nBwGqn7uW4+OKBNHoV4GpxPkFG/fuSflJo/DrAnycOQHJou89u16f
 4JIoqKp4PGk1prexDgR/JuV5l0ur8fZXBvJizwem5/ELUZ9EnAumNhZVjWeBiBo0RE5SEbkb8P
 Gag=
X-SBRS: 2.7
X-MesageID: 493079
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,476,1549947600"; 
   d="scan'208";a="493079"
Date: Thu, 16 May 2019 10:19:28 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190516091928.GE3977@zion.uk.xensource.com>
References: <20190516111514.79e72bfc.olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190516111514.79e72bfc.olaf@aepfle.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] domains do not shutdown properly with current
 staging
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMTE6MTU6MTRBTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gV2hpbGUgcHJlcGFyaW5nIHRoZSByZWNlbnQgYl9pbmZvLT5kZXZpY2VfbW9kZWxfdmVy
c2lvbiBjaGFuZ2UgYWxsIG15IHRlc3RpbmcKPiB3ZW50IGZpbmUuIEJ1dCBub3cgd2l0aCAiMjAx
OS0wNS0xNSAxNjoxOTo1NyArMDEwMCBnaXQ6MmE1NTZiNjNhMiIgYWxsIGRvbVVzCj4gKFBWL0hW
TSB3aXRoIGFuZCB3aXRob3V0IGRldmljZSBtb2RlbCkgZG8gbm90IGZpbmlzaCBzaHV0ZG93bjoK
PiAKPiBOYW1lICAgICAgICAgICAgICAgICAgICAgICAgICAgSUQgICBNZW0gVkNQVXMgICBTdGF0
ZSAgIFRpbWUocykKPiBEb21haW4tMCAgICAgICAgICAgICAgICAgICAgICAgIDAgIDMwNzIgICAg
IDQgICAgIHItLS0tLSAgICAgMjUzLjAKPiBwdl9zbGUxMnNwMl9jX3Fjb3cyICAgICAgICAgICAg
IDEgICA4ODggICAgIDIgICAgIC0tcHMtLSAgICAgIDgyLjkKPiBwdl9zbGUxMnNwMl9jX3JhdyAg
ICAgICAgICAgICAgIDIgICA4ODggICAgIDIgICAgIC0tcHMtLSAgICAgIDg2LjgKPiBmdl9zbGUx
MnNwMl9jX3JhdyAgICAgICAgICAgICAgIDMgICA4ODAgICAgIDEgICAgIC0tcHMtLSAgICAgIDIw
LjgKPiBmdl9zbGUxMnNwMl9jX3Fjb3cyICAgICAgICAgICAgIDQgICA4ODAgICAgIDEgICAgIC0t
cHMtLSAgICAgMTUwLjkKPiAKPiBJcyBhbnlvbmUgZWxzZSBzZWVpbmcgdGhhdD8KClNlZSBteSBw
YXRjaCBuYW1lZAoKIGxpYnhsOiBmaXggcmVncmVzc2lvbiBpbnRyb2R1Y2VkIGluIDVjODgzY2Yw
MzZjZgoKV2VpLgoKPiAKPiBPbGFmCgoKCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
