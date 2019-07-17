Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A676BF89
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 18:18:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnmZx-0002vj-70; Wed, 17 Jul 2019 16:14:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zn76=VO=huawei.com=jonathan.cameron@srs-us1.protection.inumbo.net>)
 id 1hnmYy-0002uI-0x
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 16:13:52 +0000
X-Inumbo-ID: dbc57869-a8ad-11e9-8980-bc764e045a96
Received: from huawei.com (unknown [45.249.212.35])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dbc57869-a8ad-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 16:13:49 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id BBF80605C121F65CC65C;
 Thu, 18 Jul 2019 00:13:46 +0800 (CST)
Received: from localhost (10.202.226.61) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Thu, 18 Jul 2019
 00:13:42 +0800
Date: Wed, 17 Jul 2019 17:13:20 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Message-ID: <20190717171320.000035c2@huawei.com>
In-Reply-To: <88d15fa38167e3f2e73e65e1c1a1f39bca0267b4.1563365880.git.mchehab+samsung@kernel.org>
References: <cover.1563365880.git.mchehab+samsung@kernel.org>
 <88d15fa38167e3f2e73e65e1c1a1f39bca0267b4.1563365880.git.mchehab+samsung@kernel.org>
Organization: Huawei
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.226.61]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 17 Jul 2019 16:14:51 +0000
Subject: Re: [Xen-devel] [PATCH v4 13/15] docs: ABI: testing: make the files
 compatible with ReST output
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-doc@vger.kernel.org,
 linux-iio@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-mm@kvack.org, netdev@vger.kernel.org, Peter
 Meerwald-Stadler <pmeerw@pmeerw.net>, Guenter Roeck <groeck@chromium.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-acpi@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>,
 Andrew Donnellan <ajd@linux.ibm.com>, linux-pm@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Stefano
 Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>, Benson Leung <bleung@chromium.org>,
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Sebastian Reichel <sre@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut
 Knaack <knaack.h@gmx.de>, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linuxppc-dev@lists.ozlabs.org, Peter Rosin <peda@axentia.se>,
 Jonathan Cameron <jic23@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxNyBKdWwgMjAxOSAwOToyODoxNyAtMDMwMApNYXVybyBDYXJ2YWxobyBDaGVoYWIg
PG1jaGVoYWIrc2Ftc3VuZ0BrZXJuZWwub3JnPiB3cm90ZToKCj4gU29tZSBmaWxlcyBvdmVyIHRo
ZXJlIHdvbid0IHBhcnNlIHdlbGwgYnkgU3BoaW54Lgo+IAo+IEZpeCB0aGVtLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYitzYW1zdW5nQGtlcm5lbC5v
cmc+CkhpIE1hdXJvLAoKRG9lcyBmZWVsIGxpa2UgdGhpcyBvbmUgc2hvdWxkIHBlcmhhcHMgaGF2
ZSBiZWVuIGJyb2tlbiB1cCBhIHRvdWNoIQoKRm9yIHRoZSBJSU8gb25lcyBJJ3ZlIGV5ZWJhbGxl
ZCBpdCByYXRoZXIgdGhhbiB0ZXN0aW5nIHRoZSByZXN1bHRzCgpBY2tlZC1ieTogSm9uYXRoYW4g
Q2FtZXJvbiA8Sm9uYXRoYW4uQ2FtZXJvbkBodWF3ZWkuY29tPgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
