Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 106EFE2B7F
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 09:54:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNXtx-0006zm-Er; Thu, 24 Oct 2019 07:51:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vOkM=YR=neclab.eu=felipe.huici@srs-us1.protection.inumbo.net>)
 id 1iNXtw-0006zh-7P
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 07:51:20 +0000
X-Inumbo-ID: 09f18812-f633-11e9-9497-12813bfff9fa
Received: from mailer1.neclab.eu (unknown [195.37.70.40])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 09f18812-f633-11e9-9497-12813bfff9fa;
 Thu, 24 Oct 2019 07:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mailer1.neclab.eu (Postfix) with ESMTP id B6AFF10588B;
 Thu, 24 Oct 2019 09:51:07 +0200 (CEST)
X-Virus-Scanned: Amavisd on Debian GNU/Linux (netlab.nec.de)
Received: from mailer1.neclab.eu ([127.0.0.1])
 by localhost (atlas-a.office.hd [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uduEosJNDrlk; Thu, 24 Oct 2019 09:51:07 +0200 (CEST)
X-ENC: Last-Hop-TLS-encrypted
X-ENC: Last-Hop-TLS-encrypted
Received: from titania.office.hd (titania.office.hd [192.168.24.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailer1.neclab.eu (Postfix) with ESMTPS id 8F241105863;
 Thu, 24 Oct 2019 09:51:07 +0200 (CEST)
Received: from oberon.office.hd (192.168.24.90) by titania.office.hd
 (192.168.24.89) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 24 Oct
 2019 09:51:07 +0200
Received: from oberon.office.hd ([192.168.126.11]) by Oberon.office.hd
 ([192.168.126.11]) with mapi id 15.01.1713.009; Thu, 24 Oct 2019 09:51:07
 +0200
From: Felipe Huici <Felipe.Huici@neclab.eu>
To: Lars Kurth <lars.kurth@xenproject.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v2 0/6] Code of Conduct + Extra Guides and
 Best Practices
Thread-Index: AQHVdOsomz4jG9eefUS4nCdPE8rRM6dplb2A
Date: Thu, 24 Oct 2019 07:51:06 +0000
Message-ID: <9B267EDA-EC46-489E-9D05-5B9313D6F545@neclab.eu>
References: <cover.1569525222.git.lars.kurth@citrix.com>
In-Reply-To: <cover.1569525222.git.lars.kurth@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.e.190909
x-originating-ip: [192.168.24.96]
Content-ID: <70338CA8B784834D84907486C653D825@office.hd>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 0/6] Code of Conduct + Extra Guides and
 Best Practices
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgTGFycywNCg0KU29ycnkgZm9yIHRoZSBsYXRlIHJlc3BvbnNlLCB0aGUgVW5pa3JhZnQgdGVh
bSBpcyBjZXJ0YWlubHkgaGFwcHkgdG8gc3VwcG9ydCB0aGlzIGNvZGUgb2YgY29uZHVjdC4NCg0K
VGhhbmtzLA0KDQotLSBGZWxpcGUNCg0K77u/T24gMjcuMDkuMTksIDA2OjIyLCAiWGVuLWRldmVs
IG9uIGJlaGFsZiBvZiBMYXJzIEt1cnRoIiA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJv
amVjdC5vcmcgb24gYmVoYWxmIG9mIGxhcnMua3VydGhAeGVucHJvamVjdC5vcmc+IHdyb3RlOg0K
DQogICAgRnJvbTogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPg0KICAgIA0KICAg
IFRoaXMgc2VyaWVzIHByb3Bvc2VzIGEgY29uY3JldGUgdmVyc2lvbiBvZiB0aGUgWGVuIFByb2pl
Y3QNCiAgICBDb0MgYmFzZWQgb24gdjEuNCBvZiB0aGUgQ29udHJpYnV0b3IgQ292ZW5hbnQuIFNl
ZSBbMV0NCiAgICANCiAgICBJdCBjb250YWlucyAqQUxMKiB0aGUgcG9ydGlvbnMgSSB3YXMgc3Rp
bGwgZ29pbmcgdG8gYWRkLg0KICAgIEkgc3BlbnQgYSBiaXQgb2YgdGltZSBvbiB3b3JkLXNtaXRo
aW5nLCBidXQgSSBhbSBub3QgYSBuYXRpdmUgRW5nbGlzaCBzcGVha2VyDQogICAgU28gdGhlcmUg
aXMgcHJvYmFibHkgdGltZSBmb3IgaW1wcm92ZW1lbnQNCiAgICANCiAgICBUaGUgc2VyaWVzIGFs
c28gcmVmbGVjdHMgdGhlIGRpc2N1c3Npb24gaW4gWzJdIGFuZCBzb21lIHByaXZhdGUNCiAgICBk
aXNjdXNzaW9ucyBvbiBJUkMgdG8gaWRlbnRpZnkgaW5pdGlhbCBtZW1iZXJzIG9mIHRoZSBYZW4N
CiAgICBQcm9qZWN04oCZcyBDb0MgdGVhbS4NCiAgICANCiAgICBGb3IgY29udmVuaWVuY2Ugb2Yg
cmV2aWV3IGFuZCBpbiBsaW5lIHdpdGggb3RoZXIgcG9saWN5IGRvY3VtZW50cw0KICAgIEkgY3Jl
YXRlZCBhIGdpdCByZXBvc2l0b3J5IGF0IFszXS4gVGhpcyBzZXJpZXMgY2FuIGJlIGZvdW5kIGF0
IFs1XS4NCiAgICANCiAgICBbMV0gaHR0cHM6Ly93d3cuY29udHJpYnV0b3ItY292ZW5hbnQub3Jn
L3ZlcnNpb24vMS80L2NvZGUtb2YtY29uZHVjdC5tZA0KICAgIFsyXSBodHRwczovL3hlbi5tYXJr
bWFpbC5vcmcvdGhyZWFkLzU2YW8yZ3locGx0cW1yZXcgDQogICAgWzNdIGh0dHA6Ly94ZW5iaXRz
Lnhlbi5vcmcvZ2l0d2ViLz9wPXBlb3BsZS9sYXJzay9jb2RlLW9mLWNvbmR1Y3QuZ2l0O2E9c3Vt
bWFyeQ0KICAgIFs0XSBodHRwczovL3d3dy5zbGlkZXNoYXJlLm5ldC94ZW5fY29tX21nci94cGRk
czE5LWtleW5vdGUtcGF0Y2gtcmV2aWV3LWZvci1ub25tYWludGFpbmVycy1nZW9yZ2UtZHVubGFw
LWNpdHJpeC1zeXN0ZW1zLXVrLWx0ZA0KICAgIFs1XSBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dp
dHdlYi8/cD1wZW9wbGUvbGFyc2svY29kZS1vZi1jb25kdWN0LmdpdDthPXNob3J0bG9nO2g9cmVm
cy9oZWFkcy9Db0MtdjINCiAgICANCiAgICBDaGFuZ2VzIHNpbmNlIHYxDQogICAgKiBDb2RlIG9m
IENvbmR1Y3QgDQogICAgICBPbmx5IHdoaXRlc3BhY2UgY2hhbmdlcw0KICAgIA0KICAgICogQWRk
ZWQgQ29tbXVuaWNhdGlvbiBHdWlkZQ0KICAgICAgQ29udGFpbnMgdmFsdWVzIGFuZCBhIHByb2Nl
c3MgYmFzZWQgb24gYWR2aWNlIGFuZCBtZWRpYXRpb24gaW4gY2FzZSBvZiBpc3N1ZXMNCiAgICAg
IFRoaXMgaXMgdGhlIHByaW1hcnkgcG9ydGFsIGZvciANCiAgICANCiAgICAqIEFkZGVkIENvZGUg
UmV2aWV3IEd1aWRlDQogICAgICBXaGljaCBpcyBiYXNlZCBvbiBbNF0gd2l0aCBzb21lIGFkZGl0
aW9ucyBmb3IgY29tcGxldGVuZXNzDQogICAgICBJdCBwcmltYXJpbHkgc2V0cyBleHBlY3RhdGlv
bnMgYW5kIGFueXRoaW5nIGNvbW11bmljYXRpb24gcmVsYXRlZCBpcyByZW1vdmVkDQogICAgDQog
ICAgKiBBZGRlZCBndWlkZSBvbiBDb21tdW5pY2F0aW9uIEJlc3QgUHJhY3RpY2UNCiAgICAgIFRh
a2VzIHRoZSBjb21tdW5pY2F0aW9uIHNlY3Rpb24gZnJvbSBbNF0gYW5kIGV4cGFuZHMgb24gaXQg
d2l0aCBtb3JlIGV4YW1wbGVzDQogICAgICBhbmQgY2FzZXMuIFRoaXMgaXMgcHJvYmFibHkgd2hl
cmUgd2UgbWF5IG5lZWQgc29tZSBkaXNjdXNzaW9uDQogICAgDQogICAgKiBBZGRlZCBkb2N1bWVu
dCBvbiBSZXNvbHZpbmcgRGlzYWdyZWVtZW50DQogICAgICBBIHRpbnkgYml0IG9mIHRoZW9yeSB0
byBzZXQgdGhlIHNjZW5lDQogICAgICBJdCBjb3ZlcnMgc29tZSBjb21tb24gY2FzZXMgb2YgZGlz
YWdyZWVtZW50cyBhbmQgaG93IHdlIG1heSBhcHByb2FjaCB0aGVtDQogICAgICBBZ2FpbiwgdGhp
cyBwcm9iYWJseSBuZWVkcyBzb21lIGRpc2N1c3Npb24NCiAgICANCiAgICBDYzogbWluaW9zLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQogICAgQ2M6IHhlbi1hcGlAbGlzdHMueGVucHJvamVj
dC5vcmcNCiAgICBDYzogd2luLXB2LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQogICAgQ2M6
IG1pcmFnZW9zLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQogICAgQ2M6IGNvbW1pdHRlcnNA
eGVucHJvamVjdC5vcmcNCiAgICANCiAgICBMYXJzIEt1cnRoICg2KToNCiAgICAgIEltcG9ydCB2
MS40IG9mIENvbnRyaWJ1dG9yIENvdmVuYW50IENvQw0KICAgICAgWGVuIFByb2plY3QgQ29kZSBv
ZiBDb25kdWN0DQogICAgICBBZGQgQ29tbXVuaWNhdGlvbiBHdWlkZQ0KICAgICAgQWRkIENvZGUg
UmV2aWV3IEd1aWRlDQogICAgICBBZGQgZ3VpZGUgb24gQ29tbXVuaWNhdGlvbiBCZXN0IFByYWN0
aWNlDQogICAgICBBZGRlZCBSZXNvbHZpbmcgRGlzYWdyZWVtZW50DQogICAgDQogICAgLS0gDQog
ICAgMi4xMy4wDQogICAgDQogICAgDQogICAgX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18NCiAgICBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0DQogICAgWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQogICAgaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
