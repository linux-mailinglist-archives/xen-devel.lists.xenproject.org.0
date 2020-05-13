Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E652E1D19B0
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 17:44:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYtXn-00014B-Tk; Wed, 13 May 2020 15:43:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hhv+=63=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jYtXm-00013Z-NX
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 15:43:38 +0000
X-Inumbo-ID: 82b47a06-9530-11ea-b07b-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82b47a06-9530-11ea-b07b-bc764e2007e4;
 Wed, 13 May 2020 15:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589384617;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Mkr6Uo3lyE7hiZ4l/x1maj4DgXhMgoRRrV0ngc5bcfc=;
 b=MyK8o+CZZIdMhAxEOlZ7MUvnxhiHWzq2N2vZ6TeR5FmRJZccChf27Pcb
 1eM0R9is1YfznW2yb/I+J+qCqCU2MLt6B5SsojIt8n7OSnyQKkCGrWBtf
 oh64ggZpUrPBSMp51LjoCocjW+4kyfiozAhEOhhiGXdhQyCUgDFEqjla6 g=;
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: gHBWn170w+QERJvitPyjhI6I5WutqgBYKlSU5TnG9J4meSkQvZryi2Aqd/PN8DktGUuMwLiN+6
 Uy35PthhOdXqRpl5dMpeGI0RYXQv+X/taQzVL0tvozE34Nfna0+gJZlkNRP2TDNMe1KggfRXMI
 +zDAFTllM4z10p9OvkWkXi2HbYdl3/4/rMYxMbRDjQGXKp1CwfbLAK+O2SLelXboStnm25YY0y
 dmeclml9xrWdYtOLg980eEihE1KQeG7xUYy7zTNXlYRuuUmijPVAIDSVaqlxj4EC42KqT28GvL
 x8A=
X-SBRS: 2.7
X-MesageID: 17704893
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,388,1583211600"; d="scan'208";a="17704893"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH v3 1/1] golang/xenlight: add necessary module/package
 documentation
Thread-Topic: [PATCH v3 1/1] golang/xenlight: add necessary module/package
 documentation
Thread-Index: AQHWKTFf897wv5R+lky5jSbM2UASCaimBpqA
Date: Wed, 13 May 2020 15:43:33 +0000
Message-ID: <CF9BC8CA-8A63-4569-AA49-A33A14D858CE@citrix.com>
References: <cover.1589379056.git.rosbrookn@ainfosec.com>
 <fa80be6bf52005db0e54fd8dd74a9ff855a5316f.1589379056.git.rosbrookn@ainfosec.com>
In-Reply-To: <fa80be6bf52005db0e54fd8dd74a9ff855a5316f.1589379056.git.rosbrookn@ainfosec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="us-ascii"
Content-ID: <536A57941FE4644C8297FCD5908EFF12@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>, Jan Beulich <jbeulich@suse.com>, Ian
 Jackson <Ian.Jackson@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On May 13, 2020, at 3:18 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
>=20
> Add a README and package comment giving a brief overview of the package.
> These also help pkg.go.dev generate better documentation.
>=20
> Also, add a copy of the LGPL (the same license used by libxl) to
> tools/golang/xenlight. This is required for the package to be shown
> on pkg.go.dev and added to the default module proxy, proxy.golang.org.
>=20
> Finally, add an entry for the xenlight package to SUPPORT.md.
>=20
> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>

Reviewed-by: George Dunlap <george.dunlap@citrix.com>


