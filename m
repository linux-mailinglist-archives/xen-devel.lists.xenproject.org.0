Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AADE21E8AC
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 08:56:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQnnk-0003g1-Ia; Wed, 15 May 2019 06:54:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0eB+=TP=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQnnj-0003fw-6Q
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 06:54:07 +0000
X-Inumbo-ID: 3847f4be-76de-11e9-9b69-337be603c132
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3847f4be-76de-11e9-9b69-337be603c132;
 Wed, 15 May 2019 06:54:01 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=SoftFail smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa5.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com is inclined to not designate 23.29.105.83
 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 mx include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 include:_spf.salesforce.com ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: vvGHFm71zOpu+WWp7fzRZE/5BlKmzqu/XEXOG39XsLTpXvZTm9bw6MVvv2kNb3DpnSEFub96By
 nFCVtjIqgSmJmhZyM/+GGXSPd1DcUkFahh9S2mGnua8dq52Fz/9CtnFueAiSxAi90KyhIwSrgy
 x+LbArebA6rqJc5oiyvP5tVj3bFbTXW3UIhAG3n0TzALtILE+y279gcosgypdmQCHFw8KSTUVD
 B74IykvnJfqVSafXMtS717ORiqd+/XAdFQ5F0MxZ4RmsoBKoKADwoppaHkcDx68bUp0vHa5thH
 hdo=
X-SBRS: 2.7
X-MesageID: 433580
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,471,1549947600"; 
   d="scan'208";a="433580"
Date: Wed, 15 May 2019 07:53:42 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <20190515065342.GJ2798@zion.uk.xensource.com>
References: <1557850437-27656-1-git-send-email-rcojocaru@bitdefender.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557850437-27656-1-git-send-email-rcojocaru@bitdefender.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] x86/altp2m: move
 altp2m_get_effective_entry() under CONFIG_HVM
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
Cc: wei.liu2@citrix.com, george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 jbeulich@suse.com, xen-devel@lists.xenproject.org, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDc6MTM6NTdQTSArMDMwMCwgUmF6dmFuIENvam9jYXJ1
IHdyb3RlOgo+IEFsbCBpdHMgY2FsbGVycyBsaXZlIGluc2lkZSAjaWZkZWYgQ09ORklHX0hWTSBz
ZWN0aW9ucy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBi
aXRkZWZlbmRlci5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
