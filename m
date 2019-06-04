Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A20134EFF
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 19:35:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYDJ0-00015c-T7; Tue, 04 Jun 2019 17:33:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ygn2=UD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hYDJ0-00015X-6L
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 17:33:02 +0000
X-Inumbo-ID: cc24a98c-86ee-11e9-b0a3-73aa249f0ec9
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc24a98c-86ee-11e9-b0a3-73aa249f0ec9;
 Tue, 04 Jun 2019 17:33:00 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
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
 postmaster@mail.citrix.com) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8+AGXqxb8LL5f8Yc8tM03P/p6P2O5rvIc7h35QsK195/5HjDh6jux2hxTP4UsqF6OOsJC+lWQc
 CO3fAPMoYNDAySRVbCqdAvJzuv/hFDWqn/eVaZ4fmN+k6ZRarO3Ole6lkUKOHjRcUIXAK/0Orj
 /NrBQHC/7VghT5fl8n+aAv22ELwcEfGkHdj3ZufIqLPwQKit2VaRx54GTq59Rw2WWpvFHtwTdw
 4JFpTtqqib04RO9Dst5IKOZVkhrgsHUgpCl2RkL5K1iICaj48Gq+uar2S9cwM4TfCQtCFXFYnQ
 J2g=
X-SBRS: 2.7
X-MesageID: 1306426
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1306426"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23798.43814.14509.503657@mariner.uk.xensource.com>
Date: Tue, 4 Jun 2019 18:32:22 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190409164542.30274-8-anthony.perard@citrix.com>
References: <20190409164542.30274-1-anthony.perard@citrix.com>
 <20190409164542.30274-8-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 7/9] libxl: Move qmp_parameters_* prototypes
 to libxl_internal.h
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDcvOV0gbGlieGw6IE1vdmUgcW1wX3BhcmFt
ZXRlcnNfKiBwcm90b3R5cGVzIHRvIGxpYnhsX2ludGVybmFsLmgiKToKPiAuLiBhbmQgcmVuYW1l
IHRoZW0gdG8gbGlieGxfX3FtcF9wYXJhbV8qLgo+IAo+IFRoaXMgaXMgdG8gYWxsb3cgb3RoZXIg
ZmlsZXMgdGhhbiBsaWJ4bF9xbXAuYyB0byBtYWtlIFFNUCBjYWxscyB3aXRoCj4gcGFyYW1ldGVy
cy4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
