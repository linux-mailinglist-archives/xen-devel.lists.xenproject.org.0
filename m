Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65072A3DA4
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 20:22:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3lUj-0004OA-W0; Fri, 30 Aug 2019 18:19:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=69lB=W2=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1i3lUh-0004O5-R2
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 18:19:31 +0000
X-Inumbo-ID: b5091b2c-cb52-11e9-ae8e-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5091b2c-cb52-11e9-ae8e-12813bfff9fa;
 Fri, 30 Aug 2019 18:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567189170;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=sd7xnOGO0nlLUfYPAfSqcRlDW5F0aQ//uFjEooch9gY=;
 b=CuTRDQ1mkLCrjVXW9bkPxzw+VxajiqsVhc6n/j5r6y6J6nMpW5DIIEmn
 P6pcgP5s5uJ54JlmFhePm74tzSCNKo5Sj42H6cnvQshQnOj09NKZZ2P18
 fw7EIQMPNwurG+Ucq2uY82C5gRWZ4slL6550HglwC7ImR3Xp8YHMJsE4Z s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: maSMusrPZHvfJL9fLoKREhJrAm/0VhxlDPTgm14JAiywAITU0gVIk08htTL1GEUguC2Ed+5UF/
 +5afT75489cSjJfLHgPJbVO0bw3jO9sPhTI6iI+ALYR+O1GhEFIctEVUBvmDe4pAMpW7H2q332
 yBfjcVEO/f3Va/FPVVBHBdYejKHM5SyTBH6Ws682NYpl3/pCuPugTfzw3rw4WvOA13SeyaZaVn
 sHvQv+ikgb0X9JL9KUwk3NxtS8IT2UcwaK4Nuyh8lzmYlzg7DjGXjVe279MsIPfs/IACrUJHj/
 TXs=
X-SBRS: 2.7
X-MesageID: 5140569
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,447,1559534400"; 
   d="scan'208";a="5140569"
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: Added workflow docs for git-series
Thread-Index: AQHVX191w1CJGSN1H0uu7w909u8ccA==
Date: Fri, 30 Aug 2019 18:19:27 +0000
Message-ID: <E7C6D605-23A9-41E6-A4B2-153FCFCA4388@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.d.190811
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <7974E3650DF7B34A9D0DF1565AA8D659@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] Added workflow docs for git-series
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
Cc: "committers@xenproject.org" <committers@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2VlIGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL01hbmFnaW5nX1hlbl9QYXRjaGVz
X3dpdGhfR2l0LXNlcmllcw0KSXQgc29sdmVzIHNvbWUgcHJvYmxlbXMgd2l0aCBnaXQgYW5kIG1h
a2VzIG1hbmFnaW5nIHNlcmllcyBhIGxpdHRsZSBlYXNpZXIsIGJ1dCB5b3Ugc3RpbGwgaGF2ZSB0
byB1c2UgYXV0b3NxdWFzaA0KU28sIGl0J3Mgbm90IHBlcmZlY3QNCkxhcnMNCg0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
