Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4785E493A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 13:08:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNxPk-0000of-4a; Fri, 25 Oct 2019 11:05:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tVJo=YS=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iNxPj-0000oa-8R
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 11:05:51 +0000
X-Inumbo-ID: 66e8d31a-f717-11e9-94c4-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66e8d31a-f717-11e9-94c4-12813bfff9fa;
 Fri, 25 Oct 2019 11:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572001549;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=8pQWHM9zomomqjiOfdyJihqZGQxIQJqpfCWVm7G1/xs=;
 b=CBd601hUYIZiQLqTfb/v4g6qp4lCGOMK/+EowR+bJO8IHazbY9q/+uHz
 WcGeSMrzB1e7BkAKr+Km7peMiRlS0LiQOkFm7ECuwEFXWo8tQ+Cy9v8xs
 cTbmw4LY5wq1/SLqDCGzeJ/JWz7X+a4xA/46yX/VXextGA2oAwl769PLW k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: AsQvv30ptqDCcQtr8Zq2a/UPjM1hKrbMDuO1Y7WmkvRXCjTRPbuajULVlTulIeJQWs+J1CM2ga
 Z2y+klmEWW1L3avf33MG1kQcq5w+Sbz8U/MXwILygY5zswBXKZPB1Jrc44lO8dbltb4uC8jXlt
 BMPbKkn3EOc9DXPj6xLk0Jm50UJri3HUvpxrNBVkzsOweWk+mM1qJUbvmH9O83nd25hY3rUeZk
 ZSQ2u3AIbLdEfoxcnQGjN7IVqnCi0zQny+s249iE00gMjVbxuNOEY9v2+xZIDYsI9F6LSYVAjU
 pQI=
X-SBRS: 2.7
X-MesageID: 7781718
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,228,1569297600"; d="scan'208,217";a="7781718"
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: Tagging livepatch-build-tools.git with Xen releases
Thread-Index: AQHViyQmvItRWnxSJUyGIq77YhUAXw==
Date: Fri, 25 Oct 2019 11:05:46 +0000
Message-ID: <F6091989-2145-435A-8CE8-66BF7172C0C2@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.f.191014
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: [Xen-devel] Tagging livepatch-build-tools.git with Xen releases
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, 'Jan Beulich' <JBeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: multipart/mixed; boundary="===============6545293714588120086=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6545293714588120086==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_F60919892145435A8CE866BF7172C0C2citrixcom_"

--_000_F60919892145435A8CE866BF7172C0C2citrixcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgYWxsLA0KSSBhbSB3b25kZXJpbmcgd2hldGhlciB3ZSBzaG91bGQgdGFnIGxpdmVwYXRjaC1i
dWlsZC10b29scy5naXQgd2l0aCBYZW4gcmVsZWFzZXMNCkJlc3QgUmVnYXJkcw0KTGFycw0K

--_000_F60919892145435A8CE866BF7172C0C2citrixcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <21BEB5ABA44F724B8B29960C8CD45177@citrix.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAy
IDQ7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWws
IGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBjbTsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJ
Zm9udC1zaXplOjEyLjBwdDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQph
OmxpbmssIHNwYW4uTXNvSHlwZXJsaW5rDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xv
cjojMDU2M0MxOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KYTp2aXNpdGVkLCBzcGFu
Lk1zb0h5cGVybGlua0ZvbGxvd2VkDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjoj
OTU0RjcyOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0Kc3Bhbi5FbWFpbFN0eWxlMTcN
Cgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtY29tcG9zZTsNCglmb250LWZhbWlseToiQ2FsaWJy
aSIsc2Fucy1zZXJpZjsNCgljb2xvcjp3aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJe21z
by1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNl
cmlmO30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjYxMi4wcHQgNzkyLjBwdDsNCgltYXJn
aW46NzIuMHB0IDcyLjBwdCA3Mi4wcHQgNzIuMHB0O30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFn
ZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT48IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4NCjxv
OnNoYXBlZGVmYXVsdHMgdjpleHQ9ImVkaXQiIHNwaWRtYXg9IjEwMjYiIC8+DQo8L3htbD48IVtl
bmRpZl0tLT48IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4NCjxvOnNoYXBlbGF5b3V0IHY6ZXh0PSJl
ZGl0Ij4NCjxvOmlkbWFwIHY6ZXh0PSJlZGl0IiBkYXRhPSIxIiAvPg0KPC9vOnNoYXBlbGF5b3V0
PjwveG1sPjwhW2VuZGlmXS0tPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4tR0IiIGxpbms9IiMw
NTYzQzEiIHZsaW5rPSIjOTU0RjcyIj4NCjxkaXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+SGkgYWxsLDxv
OnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTEuMHB0Ij5JIGFtIHdvbmRlcmluZyB3aGV0aGVyIHdlIHNob3VsZCB0YWcgbGl2
ZXBhdGNoLWJ1aWxkLXRvb2xzLmdpdCB3aXRoIFhlbiByZWxlYXNlcw0KPG86cD48L286cD48L3Nw
YW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4w
cHQiPkJlc3QgUmVnYXJkczxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5MYXJzPG86cD48L286cD48L3NwYW4+
PC9wPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_F60919892145435A8CE866BF7172C0C2citrixcom_--


--===============6545293714588120086==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6545293714588120086==--

