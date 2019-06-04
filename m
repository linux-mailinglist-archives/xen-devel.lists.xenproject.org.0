Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3663334DED
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 18:47:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYCWu-0003KT-RE; Tue, 04 Jun 2019 16:43:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ygn2=UD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hYCWt-0003KO-Ig
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 16:43:19 +0000
X-Inumbo-ID: d9ea5730-86e7-11e9-8696-eb2ca2976b6f
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9ea5730-86e7-11e9-8696-eb2ca2976b6f;
 Tue, 04 Jun 2019 16:43:16 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: G3uqzgMgXpQHKIC4SXdfVyiSn9Bs9XLwc+gB0B7fivuAcIYqwh7csWgiJvEOhVAv9fpD/msvRT
 9jo4t8JOvZ428hF5sC8BKtQHrbv8s65PN4lBfUccpD+gIVbN+Pd+WyNT72ax2Kb8GqnShmoT3l
 xt7BRZ/HO8zUfIzPtcdaimpgPS60Xu98cA85pCKvvU0CzhJZ7ZBYSjD2uoeZKOYchFZBZimkJJ
 xNfTNV6aTYx0+2hwwGBJ5cWRARTmTMLZlVfirAc/dZVC7lbQTuBxFp4RS2QLuQuq1ufmsRahQP
 hQU=
X-SBRS: 2.7
X-MesageID: 1303721
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1303721"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23798.40830.692910.461852@mariner.uk.xensource.com>
Date: Tue, 4 Jun 2019 17:42:38 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190409164542.30274-2-anthony.perard@citrix.com>
References: <20190409164542.30274-1-anthony.perard@citrix.com>
 <20190409164542.30274-2-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 1/9] libxl_internal: Remove lost comment
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDEvOV0gbGlieGxfaW50ZXJuYWw6IFJlbW92
ZSBsb3N0IGNvbW1lbnQiKToKPiBUaGF0IGNvbW1lbnQgYXMgYmVlbiBzZXBhcmF0ZWQgZnJvbSB0
aGUgZnVuY3Rpb24gaXQgZGVmaW5lcyBieQo+IDQxOTdkM2FiYmIzMDU1ZDM3OTgyNTRlYjdiYTIz
OWJmYjU4MjQzNjAsIGJ1dCB0aGVuIHdhcyBub3QgdXNlZnVsCj4gYW55bW9yZSB3aGVuIHRoZSBs
aWJ4bF9fZGV2aWNlX2Rpc2tfYWRkKCkgcHJvdG90eXBlIHdhcyByZW1vdmVkIGJ5Cj4gMjJlYThh
ZDAyZTQ2NWUzMmNkNDA4ODdjNzUwYjU1YzNhOTk3YTI4OC4KCkFja2VkLWJ5OiBJYW4gSmFja3Nv
biA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
