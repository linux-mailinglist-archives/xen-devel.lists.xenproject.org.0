Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 679BE1C9EA9
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 00:49:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWpJu-0000zB-Jz; Thu, 07 May 2020 22:48:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WU5u=6V=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jWpJt-0000z6-C3
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 22:48:45 +0000
X-Inumbo-ID: e6cd8b02-90b4-11ea-9f8c-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e6cd8b02-90b4-11ea-9f8c-12813bfff9fa;
 Thu, 07 May 2020 22:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588891723;
 h=from:to:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=N86GxH6ihLvzvmdPTDb+qmvyWT8evRMPlMJt4BgFShA=;
 b=aVrZkzyFQ2l8EsPw+fKyuLtltpz1Rn7IsEhVEX+xgNLyxps7DF56IUYM
 YvJgKmGO1/4/24H568h/cHKleVvFGOoAzkk1K4SkkpN9fzsEDmETxX6dU
 dWRMutgYuPZs6P6YlM7kuWShPl3dmK25c8nzpiZ/CdGmKF8cg0iB7Zqip E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
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
IronPort-SDR: qQYWGvmgZFLLM/3qGqt8OhYxIeMDu9Jso036cUH/DOmYv03MAaiNv6GV9WaMSqpnsYClaY2Ygc
 il16AuV+0FSwwgVJ4JqeBUXByffOVE3FR9VE1FmVFj/hUfEOCnbm8+zcmLNW/voVLTFqapwivy
 7/yQMlp1tftd37HdK3c1MYiy/PdUPJ6IWBOImQSH4b1SNVVZJtJRlKjPdjzT1GXPXcLZjMrq7H
 WnbIDUZfOaKvULPQ3i3sCUb2Ce75WHUa23d7y8RpT67jCCQL35DOlvVwU6CAhUMWmbKHaZpj1M
 JV4=
X-SBRS: 2.7
X-MesageID: 17307801
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,365,1583211600"; d="scan'208";a="17307801"
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: XenSummit 2020 *will* be held virtuaully in June!
Thread-Topic: XenSummit 2020 *will* be held virtuaully in June!
Thread-Index: AQHWJMGm0AmOdlVrOUaNRapVF0rYbw==
Date: Thu, 7 May 2020 22:48:39 +0000
Message-ID: <562E87BB-FAEE-42B3-BEF4-6E7A4D65269D@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <8DA4A1E15FEE7244B8D1E365912687E5@citrix.com>
Content-Transfer-Encoding: base64
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

V2XigJlyZSBzdGlsbCBpcm9uaW5nIG91dCBhbGwgdGhlIGRldGFpbHMsIGJ1dCBpdOKAmXMgYWJz
b2x1dGVseSBjb25maXJtZWQgdGhhdCBYZW5TdW1taXQgMjAyMCB3aWxsIGJlIGhlbGQgdmlydHVh
bGx5IGluIEp1bmUuDQoNCkluIGFkZGl0aW9uLCB0aGUgbmV3IHZlcnNpb24gb2YgdGhlIERlc2ln
biBTZXNzaW9ucyB3ZWJzaXRlIGlzIG5vdyBsaXZlOg0KDQpodHRwczovL2Rlc2lnbi1zZXNzaW9u
cy54ZW5wcm9qZWN0Lm9yZw0KDQpNYWtlIHNwYWNlIG9uIHlvdXIgY2FsZW5kYXJzLCBhbmQgc3Vi
bWl0IHlvdXIgZGVzaWduIHNlc3Npb25zLCBhbmQgd2F0Y2ggdGhpcyBzcGFjZSBmb3IgZnVydGhl
ciBpbmZvcm1hdGlvbiENCg0KIC1HZW9yZ2UgRHVubGFw

