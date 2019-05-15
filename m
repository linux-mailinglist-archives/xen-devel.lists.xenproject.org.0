Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 847131EC36
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 12:37:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQrGP-00079y-4K; Wed, 15 May 2019 10:35:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0eB+=TP=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQrGN-00079r-VL
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 10:35:55 +0000
X-Inumbo-ID: 35c834a0-76fd-11e9-a08b-c77c5d78914c
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35c834a0-76fd-11e9-a08b-c77c5d78914c;
 Wed, 15 May 2019 10:35:51 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=SoftFail smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa1.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com is inclined to not designate 23.29.105.83
 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 mx include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 include:_spf.salesforce.com ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: R0aQCPwfhot6VUgN2kwF3fY1Balgfvr9iawGgo2te4cGooZoDQgt/Rge5IsrPulk9BZhVxSasq
 AoGIyT2+2CLxxklFn9wAZ+XfEd3/6nTvenNbHpTSJEnF5UcwmNlyac2aC+/vFEJdbKxSTTDRI0
 YROmztOnabgXy3P8jXswxVYhYpF8tepNnQHQOQnodU2D4QmiGD1r7Pbbm0EIFI8j7SPT3VeNg/
 eGfIOAJB9Tt+tW/kw4h1in1Yfwc1mC7f9ATVDwJiYFpz1VQwQR3aoHX6wx5t9IXJ8BxsTxViSD
 3/M=
X-SBRS: 2.7
X-MesageID: 449257
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,472,1549947600"; 
   d="scan'208";a="449257"
Date: Wed, 15 May 2019 11:35:48 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20190515103548.GO2798@zion.uk.xensource.com>
References: <osstest-136291-mainreport@xen.org>
 <20190515103407.kezb3vnmyhceem7w@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190515103407.kezb3vnmyhceem7w@Air-de-Roger>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [xen-unstable-smoke test] 136291: regressions - FAIL
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
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMTI6MzQ6MDdQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBXZWQsIE1heSAxNSwgMjAxOSBhdCAxMDoyNDo0NEFNICswMDAwLCBvc3N0
ZXN0IHNlcnZpY2Ugb3duZXIgd3JvdGU6Cj4gPiBmbGlnaHQgMTM2MjkxIHhlbi11bnN0YWJsZS1z
bW9rZSByZWFsIFtyZWFsXQo+ID4gaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcv
b3NzdGVzdC9sb2dzLzEzNjI5MS8KPiA+IAo+ID4gUmVncmVzc2lvbnMgOi0oCj4gPiAKPiA+IFRl
c3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAo+ID4gaW5jbHVkaW5n
IHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46Cj4gPiAgYnVpbGQtYW1kNjQgICAgICAgICAg
ICAgICAgICAgNiB4ZW4tYnVpbGQgICAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTM2MTc5
Cj4gCj4gVGhlIGVycm9yIGlzOgo+IAo+IHAybS5jOiBJbiBmdW5jdGlvbiAnYWx0cDJtX2dldF9l
ZmZlY3RpdmVfZW50cnknOgo+IHAybS5jOjUwMjoyNjogZXJyb3I6ICdwYWdlX29yZGVyJyBtYXkg
YmUgdXNlZCB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rpb24gWy1XZXJyb3I9bWF5YmUtdW5p
bml0aWFsaXplZF0KPiAgICAgICAgICBpZiAoIHByZXBvcHVsYXRlICYmIHBhZ2Vfb3JkZXIgIT0g
UEFHRV9PUkRFUl80SyApCj4gCj4gSSB0aGluayB0aGUgYWJvdmUgcGF0Y2ggc2hvdWxkIHNvbHZl
IGl0LCBBRkFJQ1QgaXQncyBub3QgYSByZWFsCj4gdW5pbml0aWFsaXplZCB1c2FnZS4KCkkgdGhp
bmsgdGhpcyBpcyBmaXhlZCBieSBSYXp2YW4ncyBwYXRjaCB0byBtb3ZlIHRoYXQgZnVuY3Rpb24g
dW5kZXIKQ09ORklHX0hWTS4gSXQgc2hvdWxkIGJlIGZpbmUgaW4gc3RhZ2luZyBub3cuCgpXZWku
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
