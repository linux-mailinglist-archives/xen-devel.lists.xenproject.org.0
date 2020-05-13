Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B31E1D1B82
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 18:47:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYuX1-0006tb-NV; Wed, 13 May 2020 16:46:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hhv+=63=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jYuX0-0006tW-7S
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 16:46:54 +0000
X-Inumbo-ID: 589de8a2-9539-11ea-ae69-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 589de8a2-9539-11ea-ae69-bc764e2007e4;
 Wed, 13 May 2020 16:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589388413;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=7KufxJ0vfEQcrsvvTS6YGOCA5DoDPlmZ4ExMt5aHByw=;
 b=MwDaTBZrVIAEntMe4faNkIOYrzPPAoArmKh6sWVFyGFCThfsoRPpuxTK
 IqZTXNWn8vbytLIEJ3fcIau6g1+ecjFbg80SuOLHBBTwH1h1iTNyjZh+L
 cfh0Sl7ts+cwoYV6JPHpu8BnmdxKqu6eUAyPesPdEcHrCe+gnojeCBREv A=;
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: PT6EPIlIEuJNmuB0v2HRQUQ2Zzw7wHca56dj7FUacNNcUl+z3PG5i/WGQ5LgygDMv1M2WvbGO4
 oxDATWRgIrm7nvwC55C3Og/JmQGh1VTi+xipI55iuQkX/LDMqVigc/mzYrEIlEzwtwuPKnmmfy
 1LH5eVgF+B4G+dprFi8ng8LpY6wxXCKMaXj4aabo75fWQrDNHSLAdmAEJz7QyflVBTfCb4M/1z
 vQAYyXS221pyOYMm59zpZYpuvZXGO4StSF91r2u/wIACtGIWJu5pecIsu640NpawGAiS4u4T9w
 CLI=
X-SBRS: 2.7
X-MesageID: 17463570
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,388,1583211600"; d="scan'208";a="17463570"
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: UPDATE: XenSummit 2020 will be held virtuaully in JULY
Thread-Topic: UPDATE: XenSummit 2020 will be held virtuaully in JULY
Thread-Index: AQHWKUYYH5YWzVTOTEWd9iPfxbVutA==
Date: Wed, 13 May 2020 16:46:48 +0000
Message-ID: <BD0FAF84-990F-4DC5-AA71-C7859F1609A2@citrix.com>
References: <562E87BB-FAEE-42B3-BEF4-6E7A4D65269D@citrix.com>
In-Reply-To: <562E87BB-FAEE-42B3-BEF4-6E7A4D65269D@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="us-ascii"
Content-ID: <025580CDF2E2274F9556B5EA3DE553CB@citrix.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Just wanted to give an update to this:

After considering recommendations at the previous community call, consultin=
g with Linux Foundation staff, and running it past the Advisory Board, it h=
as been decided to move the event to JULY 6-9.

Time zone still to be decided.

Thanks to everyone who gave input.

 -George=

