Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1792B23DFC
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 19:03:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSldL-0006ME-1U; Mon, 20 May 2019 16:59:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hVmq=TU=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hSldJ-0006LH-6i
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 16:59:29 +0000
X-Inumbo-ID: a08f2f78-7b20-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a08f2f78-7b20-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 16:59:27 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: YCfx1iZWzuotTiNmQQ25MgCysleLIjTUcZEGB9hXW9s1Pzyt+LZtxNp0Y7YSQxlTjamlr88up0
 5OB85/NtFM78+sOLIjfuG8jiI5knG/w8pIv+93b+1M4OQokcVkaVN7A4JRjFV7JbrWS8SG1RYH
 C95NFWtpEoOVqoVbq19oh8QhBvtK5b1Xvd4zUMcTCzW+7SsShpI0ZBrZdh+57wSMFwvZMqGmwP
 A0R5fQK7LhFIxIFWJEePvHTCLFoWO38CjxeLmn/rvZi1qPNIVcZ01tUO36QxMK+8V24tbNuHET
 STI=
X-SBRS: 2.7
X-MesageID: 650230
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,492,1549947600"; 
   d="scan'208";a="650230"
From: Lars Kurth <lars.kurth@citrix.com>
To: Ian Jackson <Ian.Jackson@citrix.com>
Thread-Topic: [PATCH] Add TRACKING.IMPORTS to xen.git to more easily manage
 imported files that need to be kept in sync with an upstream
Thread-Index: AQHVC2w8yCFJJzKGGki86dw3YKFbFqZtcP2A///xTICAAWtFgIAE4QuAgABteQD//6GdAA==
Date: Mon, 20 May 2019 16:59:23 +0000
Message-ID: <56755914-DCC1-4386-8740-0F45E1F49544@citrix.com>
References: <0648312f1c78e519142ff1829a984e7e965bf3c7.1557957269.git.lars.kurth@citrix.com>
 <5CDD3FA1020000780022F903@prv1-mh.provo.novell.com>
 <530E0649-256F-4A11-B887-E665B3C92979@citrix.com>
 <5CDE6407020000780022FF63@prv1-mh.provo.novell.com>
 <2B55A18B-F04C-4249-8558-11F0A24E312C@citrix.com>
 <23778.55202.449293.616451@mariner.uk.xensource.com>
In-Reply-To: <23778.55202.449293.616451@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.a.190512
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <594B5E7155CF524698A44A477269C521@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] Add TRACKING.IMPORTS to xen.git to more
 easily manage imported files that need to be kept in sync with an upstream
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDIwLzA1LzIwMTksIDEwOjM3LCAiSWFuIEphY2tzb24iIDxpYW4uamFja3NvbkBj
aXRyaXguY29tPiB3cm90ZToNCg0KICAgIFRoaXMgaXMgZ29pbmcgaW4gdGhlIHJpZ2h0IGRpcmVj
dGlvbiBJTU8uDQogICAgDQogICAgTGFycyBLdXJ0aCB3cml0ZXMgKCJSZTogW1BBVENIXSBBZGQg
VFJBQ0tJTkcuSU1QT1JUUyB0byB4ZW4uZ2l0IHRvIG1vcmUgZWFzaWx5IG1hbmFnZSBpbXBvcnRl
ZCBmaWxlcyB0aGF0IG5lZWQgdG8gYmUga2VwdCBpbiBzeW5jIHdpdGggYW4gdXBzdHJlYW0iKToN
CiAgICA+IFRoYXQgbWFrZXMgcGVyZmVjdCBzZW5zZSBub3cuIEluIHRoYXQgY2FzZSwgSSB0ZW5k
IHRvIGFncmVlIHRoYXQgImF1dG8iIGlzIHByb2JhYmx5IG5vdCBuZWVkZWQuIFdvdWxkIGJlIHF1
aXRlIGhhcHB5IHRvIGRyb3AgaXQuDQogICAgDQogICAgSXQgd2lsbCBjb25zaWRlcmFibHkgY29t
cGxpY2F0ZSB0aGluZ3MgdG8gYWRkIGEgd2F5IHRvIGRlZmluZQ0KICAgIHNlZGRlcnkuICBMZXQg
dXMgbGVhdmUgdGhhdCB0byBhIGZ1dHVyZSBleHRlbnNpb24uDQogICAgDQogICAgVGhhdCBzdWdn
ZXN0cyB0aGF0IGBtYW51YWwnIHNob3VsZCBiZWNvbWUgYGZpbGU6Jy4NCiAgICANCiAgICBBcyBm
b3IgZGVsaW1pdGVycw0KICAgIA0KICAgID4gT24gMTcvMDUvMjAxOSwgMDE6MzQsICJKYW4gQmV1
bGljaCIgPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCiAgICA+ICAgICA+IEkgYW0gbm90IHN1
cmUgd2hhdCB5b3UgbWVhbiwgd2hpY2ggY29sb25zPyBBcmUgeW91IHNheWluZywgdGhlIGZvcm1h
dCBzaG91bGQgYmUNCiAgICA+ICAgICA+IHZlcnNpb246IDENCiAgICA+ICAgICA+IHJlcG86IC4u
Lg0KICAgID4gICAgIA0KICAgID4gICAgIFllcy4gVGhpcyB3b3VsZCBtYWtlIGl0IGV2ZW4gbW9y
ZSBwcm9taW5lbnQgdGhhdCB0aGVzZSBhcmUgdGFncyBvZg0KICAgID4gICAgIHNvbWUgc29ydC4g
QnV0IHRoaXMgd2FzIG9ubHkgYSB0aG91Z2h0IG9mIG1pbmUsIGl0J3MgaW4gbm8gd2F5IG1lYW50
DQogICAgPiAgICAgdG8gYmUgYSByZXF1aXJlbWVudCBJIGhhdmUuDQogICAgDQogICAgSXQgd2ls
bCBtYWtlIHdyaXRpbmcgYSBwYXJzZXIgZWFzaWVyIGlmIGVhY2ggZW50cnkgaXMgYSBzaW5nbGUg
bGluZQ0KICAgIHdpdGggdGhlIGZpZWxkcyBpbiBhIGRlZmluZWQgb3JkZXIgYW5kIGlmIHdlIGNh
biBzYXkgdGhhdCBhIGByZXBvOicNCiAgICBtdXN0IHByZWNlZGUgZXZlcnkgYGZpbGU6JyB0aGF0
IG1lbnRpb25zIGl0Lg0KICAgIA0KVGhhdCBzb3VuZHMgcGVyZmVjdGx5IHNlbnNpYmxlDQpWZXJz
aW9uIDIgb24gaXRzIHdheSwgc29tZXRpbWVzIG5leHQgd2Vlaw0KDQpMYXJzDQogICAgDQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
