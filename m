Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C511CA74
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 16:35:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQYTt-0000vb-6a; Tue, 14 May 2019 14:32:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pH1X=TO=citrix.com=prvs=030624cdf=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQYTs-0000vW-JY
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 14:32:36 +0000
X-Inumbo-ID: 1d726be9-7655-11e9-8980-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1d726be9-7655-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 14:32:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,469,1549929600"; d="scan'208";a="85443548"
Date: Tue, 14 May 2019 15:32:27 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20190514143227.GG2798@zion.uk.xensource.com>
References: <20190514072741.11760-1-olaf@aepfle.de>
 <20190514101856.6otetd56n72t42bm@Air-de-Roger>
 <20190514123118.6c9ecbf7.olaf@aepfle.de>
 <20190514103907.2fc6pf7p64m3c7fh@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514103907.2fc6pf7p64m3c7fh@Air-de-Roger>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH v1] libxl: add helper function to set
 device_model_version
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
Cc: xen-devel@lists.xenproject.org, Olaf Hering <olaf@aepfle.de>,
 Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMTI6Mzk6MDdQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUdWUsIE1heSAxNCwgMjAxOSBhdCAxMjozMToxOFBNICswMjAwLCBPbGFm
IEhlcmluZyB3cm90ZToKPiA+IEFtIFR1ZSwgMTQgTWF5IDIwMTkgMTI6MTg6NTYgKzAyMDAKPiA+
IHNjaHJpZWIgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ogo+ID4gCj4g
PiA+IFdoeSBpcyBpdCBub3QgZmluZSB0byBzZXQgdGhlIGRldmljZSBtb2RlbCB2ZXJzaW9uIGlu
Cj4gPiA+IGxpYnhsX19kb21haW5fYnVpbGRfaW5mb19zZXRkZWZhdWx0Pwo+ID4gCj4gPiBCZWNh
dXNlIGl0IHJlY2VpdmVzIGp1c3QgYnVpbGRfaW5mbywgd2hpY2ggbGFja3MgYWxsIHRoZSBkYXRh
IHRvIGRlY2lkZQo+ID4gaWYgYSBkZXZpY2UgdHlwZSBuZWVkcyBhIGRldmljZSBtb2RlbCBvciBu
b3QuCj4gCj4gR2FoLCB0aGFua3MuIENvdWxkIHlvdSBwbGVhc2UgYWRkIHRoaXMgdG8gdGhlIGNv
bW1pdCBtZXNzYWdlPyBPciBlbHNlCj4gaXQncyBsaWtlbHkgSSB3aWxsIGFzayBhZ2Fpbi4KPiAK
PiBXaXRoIHRoYXQ6Cj4gCj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpP
bGFmLCBpZiB5b3UgY2FuIHByb3ZpZGUgbWUgd2l0aCBhbiB1cGRhdGVkIHZlcnNpb24gb2YgdGhl
IGNvbW1pdAptZXNzYWdlIEkgY2FuIGZvbGQgdGhhdCBpbiB3aGlsZSBjb21taXR0aW5nLiBObyBu
ZWVkIHRvIHJlc2VuZCB0aGlzCnBhdGNoLgoKV2VpLgoKPiAKPiBSb2dlci4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
