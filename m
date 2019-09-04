Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B091BA8343
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 14:57:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Unf-0006we-4z; Wed, 04 Sep 2019 12:54:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WgxQ=W7=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1i5Und-0006wP-1f
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 12:54:13 +0000
X-Inumbo-ID: 13f23394-cf13-11e9-abb3-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13f23394-cf13-11e9-abb3-12813bfff9fa;
 Wed, 04 Sep 2019 12:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567601646;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=sh8k3jfl+H6uENnIHSEQIg2ldaL+eEs1GZNoQ1qfTi0=;
 b=SKUggC2qcaZv+XamU9sCBB7jfjLDWudiN46ZOMI4Tfq6UrO9r067vFzN
 6RNoEr7YDUTr3SCMgPzfBLQYa+kLVLFh/+Se/UCt7JtXPYS/5OyNYr1ck
 KU02MDa3TDxgA4cfMXFxCAnhWhdGTE3i2fKN9uXA3BwUdinPVxT6xFvTq 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: t9eN6UPhJVKnQS7/LXR3kwOfBBA7EmYW3UXDndqlZdusB4ZIA1EPrSjOApZwEAv07MmPDGOB60
 ysDew73Xysqo+LB+7XF/WGT+0nB8opEN6inZXGWRMHjyTmi5Vpw3CtaDpTvY6JNf5sM9i/kfkM
 b0HIa07bk9PsBe9ksSbbhwJz5/LUcRneh/yMGnC9vTghn8QwOFJKxxY/mpZQdbZEe3QFJQ+KDS
 Y2qSO0DGGSH/4CsaBuowVll2Ilb57OFQ2xILGVH3OH61imjaP8oJx74yM5l3g3rjqt6NBCDCvi
 0cE=
X-SBRS: 2.7
X-MesageID: 5385624
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,467,1559534400"; 
   d="scan'208";a="5385624"
From: Lars Kurth <lars.kurth@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] Please propose agenda items for Thursday's community
 call
Thread-Index: AQHVYoacjgncdmzqIEKCTc2zsbyM0acbU8oAgAAV/4A=
Date: Wed, 4 Sep 2019 12:53:51 +0000
Message-ID: <E02DAE10-CDF8-447D-8202-16C8FF896467@citrix.com>
References: <C0345A39-5EF3-48D9-9AC0-9DA174CEA818@citrix.com>
 <439228e9-0a69-7c8e-d217-b3e4a9124478@suse.com>
In-Reply-To: <439228e9-0a69-7c8e-d217-b3e4a9124478@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.d.190811
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <DBA901936696DA4AB106762511541B59@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] Please propose agenda items for Thursday's
 community call
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDA0LzA5LzIwMTksIDEzOjM1LCAiSmFuIEJldWxpY2giIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQoNCiAgICBPbiAwMy4wOS4yMDE5IDIwOjM3LCBMYXJzIEt1cnRoIHdyb3Rl
Og0KICAgID4gSSBoYXZlIG5vdCBnb3R0ZW4gYXJvdW5kIHRvIGRyYWZ0IGFuIGFnZW5kYSB5ZXQu
IFBsZWFzZSByZXBseSB0bw0KICAgID4gdGhpcyB0aHJlYWQgd2l0aCBwb3NzaWJsZSBhZ2VuZGEg
aXRlbXMuIEkgd2lsbCByZXBseSB0byB0aGlzDQogICAgPiB0aHJlYWQgd2l0aCBtZWV0aW5nIGlu
dml0ZSBhbmQgZGV0YWlscyBhcyB1c3VhbA0KICAgIA0KICAgIFdlbGwsIG9uIG9uZSBoYW5kIEkg
d291bGQgaGF2ZSB0d28gdG9waWNzOg0KICAgIA0KICAgIC0gdGhlIHBlbmRpbmcgQU1EIG1haW50
YWluZXJzaGlwIGNoYW5nZXMNCiAgICAtIHRoZSB2YXJpb3VzIHBlbmRpbmcgZm9sbG93LXVwcyBv
ZiBtaW5lIHRvIFhTQXMgMjc1IC4uLiAyOTQNCiAgICANCiAgICBCdXQgb3RvaCBJIHdvbid0IGJl
IGFibGUgdG8gYXR0ZW5kIG1vcmUgdGhhbiB0aGUgZmlyc3QgaGFsZiBvZg0KICAgIHRoZSBtZWV0
aW5nIHRvbW9ycm93IChhbmQgZXZlbiB0aGlzIG92ZXJsYXBzIHdpdGggYW4gaW50ZXJuYWwNCiAg
ICBldmVudCBoZXJlKSwgcG9zc2libHkgbGVzcyBkZXBlbmRpbmcgb24gd2VhdGhlci4NCg0KSSB3
aWxsIG1ha2Ugc3VyZSB0aGF0IHlvdXIgaXRlbXMgYXJlIGNvdmVyZWQgZmlyc3QNClJlZ2FyZHMN
CkxhcnMNCiANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
