Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D8522281C
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jul 2020 18:14:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jw6WN-0005gi-FQ; Thu, 16 Jul 2020 16:14:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AXgs=A3=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jw6WM-0005gd-E4
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 16:14:06 +0000
X-Inumbo-ID: 5ecadbea-c77f-11ea-bca7-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ecadbea-c77f-11ea-bca7-bc764e2007e4;
 Thu, 16 Jul 2020 16:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594916046;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=dLHhgHO9Y/hl14cdfSP+15wmYO/DQNbvpNe547Ndmko=;
 b=I+tc81QG2PPhZw5zPcknyeP3QWPZVUDX/aEwOFKZCaWo/rRbVdRyPgEP
 qUTK9aDo2+dNlIz9hw9xZiq7TwgFJqfVjLNUw/6KcBHOQOF42ZBhq207T
 ptHUfMgtnX8CHj17vh333kLrzBjh1HxbG3Uw/Fr0GlkDvNIHBlqpqi5ym g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 61Kg7tnhg2c3HSwAbBkI5u2vIbSRSKp+ewd8EXL3YuzZl7Qa19QPbY/W4EKGrBaqyhT2VYMGYq
 0NhEHiYqSVBnPfWmlQbiZEJXARuaH/34M5J9BjNQyI6eBH3jH2ujtfhAki6qJKbunkhNuBFTG0
 lousThyTNNoUGI/nGGWjU+oh/7X4EyB9RhqXCG0RvFGPmC8O1feX1BWPt1SyBZjiVgsjut8z9I
 hQj7ctbiIEhcvLB1v0Ka2mSwgEi3KSXedrV2+nhJ0kICB5O72CuwfgvbK2iXD2jtGJ8v4f1Mxz
 +yQ=
X-SBRS: 2.7
X-MesageID: 22864209
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,360,1589256000"; d="scan'208";a="22864209"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add myself as a golang bindings maintainer
Thread-Topic: [PATCH] MAINTAINERS: add myself as a golang bindings maintainer
Thread-Index: AQHWW4pIUvo5/lAbGUaesEAOcXnVnqkKP58A
Date: Thu, 16 Jul 2020 16:14:00 +0000
Message-ID: <B0A42BA1-7D5F-4532-BF35-B1EA0F1169FF@citrix.com>
References: <2e7fd9648245db7918b674953bb9643733259420.1594914981.git.rosbrookn@ainfosec.com>
In-Reply-To: <2e7fd9648245db7918b674953bb9643733259420.1594914981.git.rosbrookn@ainfosec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FA235796577D7B4FAB30D6493E89E075@citrix.com>
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
 Jackson <Ian.Jackson@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On Jul 16, 2020, at 5:00 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
>=20
> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>

Acked-by: George Dunlap <george.dunlap@citrix.com>



