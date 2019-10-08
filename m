Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80498CFB01
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 15:11:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHpFE-0000vN-Ha; Tue, 08 Oct 2019 13:09:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rCmb=YB=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iHpFD-0000vG-5y
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 13:09:39 +0000
X-Inumbo-ID: e19b7a7a-e9cc-11e9-97ce-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e19b7a7a-e9cc-11e9-97ce-12813bfff9fa;
 Tue, 08 Oct 2019 13:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570540179;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wNXCEtw+N74L4ZUSQCI4q1rYuykr3wGYwmconUnPcaU=;
 b=OH2F3VqDYmu29eho3vdzHqQYT1oMX8QjxCZaw5J0ogBmdjw/661v7YsT
 2ZtyDe5cVg/a5zSEsCTzQEOUG4mG+BidLbEZHu0VJdqcEZBFSgUE5HMMz
 V2Bdiy6Rw3ftWlnvws5cBuJ31L+bnGIkoCoGPqZPWGxpJyPFVZe93ziXT c=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: uB5U4dCKSe4FOn+vJHmn3XIAk9e37ZKrmQHd9CiQirelLJzNUi5SA0DWHANh9mgjvfVIpRFKod
 JzeSxVCeaobsKFZ/Db6P9Sl21pD/RyUpWpHkaGtesayt9+2F8kyAnzopSyzhTT4tO7TVaPhMyP
 f5vS+VXGQJM0sTWyxrbHpiTu/UzPZHi5WsUN/5kpAdHdlUOcVjJKnUleHxFbWxCYfs1ABAntjC
 C22hUv3I9QCxRV9zqTzhbSj5Tg4vq5FyvgwAfcZBaMoM3mHquFtQIJkuHwtf7rIAMg/25BiZW2
 56c=
X-SBRS: 2.7
X-MesageID: 6679180
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,270,1566878400"; 
   d="scan'208";a="6679180"
From: Lars Kurth <lars.kurth@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 1/4] docs/sphinx: License content with CC-BY-4.0
Thread-Index: AQHVei0GF23MUwvctk6XmDQN6+Tnc6dQriOA
Date: Tue, 8 Oct 2019 13:09:33 +0000
Message-ID: <14CC9E4E-0000-4A81-9DFC-7BC3152D35E2@citrix.com>
References: <20191003205623.20839-1-andrew.cooper3@citrix.com>
 <20191003205623.20839-2-andrew.cooper3@citrix.com>
In-Reply-To: <20191003205623.20839-2-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.e.190909
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <29076A8476C1CB4C9E285A1579AA088F@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/4] docs/sphinx: License content with
 CC-BY-4.0
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Rich Persaud <persaur@gmail.com>,
 Jan Beulich <JBeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDAzLzEwLzIwMTksIDIxOjU2LCAiQW5kcmV3IENvb3BlciIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KDQogICAgQ3JlYXRpdmUgQ29tbW9ucyBpcyBhIG1vcmUg
Y29tbW9uIGxpY2Vuc2UgdGhhbiBHUEwgZm9yIGRvY3VtZW50YXRpb24gcHVycG9zZXMuDQogICAg
U3dpdGNoIHRvIHVzaW5nIENDLUJZLTQuMCB0byBleHBsaWNpdGx5IHBlcm1pdCByZS1wdXJwb3Np
bmcgYW5kIHJlbWl4aW5nIG9mDQogICAgdGhlIGNvbnRlbnQuDQogICAgDQogICAgU2lnbmVkLW9m
Zi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg0KUmV2aWV3
ZWQtYnk6IExhcnMgS3VydGggPGxhcnMua3VydGhAY2l0cml4LmNvbT4NCg0KQWxzbywgSSBuZWVk
IHRvIGNsYXJpZnkgdGhhdCBvbmUgb2YgdGhlIHN0YXRlbWVudHMgSSBtYWRlIHllc3RlcmRheSBp
cyB3cm9uZw0KQ0MtQlktNCBpcyBjb21wYXRpYmxlIHdpdGggYWxsIHZlcnNpb25zIHdpdGggb2Yg
dGhlIEdQTCwgc2VlDQpodHRwczovL3d3dy5nbnUub3JnL2xpY2Vuc2VzL2xpY2Vuc2UtbGlzdC5l
bi5odG1sI090aGVyTGljZW5zZXMNCg0KSSBtaXhlZCB1cCBDQy1CWS00IHdpdGggQ0MtQlktU0Et
NA0KIA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
