Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C694416AFB
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 06:27:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194862.347205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTcnx-00039x-2z; Fri, 24 Sep 2021 04:27:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194862.347205; Fri, 24 Sep 2021 04:27:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTcnw-00036U-Vq; Fri, 24 Sep 2021 04:27:20 +0000
Received: by outflank-mailman (input) for mailman id 194862;
 Fri, 24 Sep 2021 04:27:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OJ83=OO=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTcnv-00036L-EV
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 04:27:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.59]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d60924b7-ed67-4866-a9dd-e0c9660937e9;
 Fri, 24 Sep 2021 04:27:17 +0000 (UTC)
Received: from AM6P194CA0021.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::34)
 by AM5PR0802MB2466.eurprd08.prod.outlook.com (2603:10a6:203:97::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Fri, 24 Sep
 2021 04:27:08 +0000
Received: from AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::14) by AM6P194CA0021.outlook.office365.com
 (2603:10a6:209:90::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Fri, 24 Sep 2021 04:27:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT054.mail.protection.outlook.com (10.152.16.212) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 04:27:07 +0000
Received: ("Tessian outbound a492f2284909:v103");
 Fri, 24 Sep 2021 04:27:06 +0000
Received: from d76a2de587e8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AAF7B539-C802-4615-924A-ECF049DE4CBB.1; 
 Fri, 24 Sep 2021 04:26:56 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d76a2de587e8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Sep 2021 04:26:56 +0000
Received: from PAXPR08MB6864.eurprd08.prod.outlook.com (2603:10a6:102:132::14)
 by PR3PR08MB5771.eurprd08.prod.outlook.com (2603:10a6:102:83::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Fri, 24 Sep
 2021 04:26:54 +0000
Received: from PAXPR08MB6864.eurprd08.prod.outlook.com
 ([fe80::14c4:e1c6:bc6d:77be]) by PAXPR08MB6864.eurprd08.prod.outlook.com
 ([fe80::14c4:e1c6:bc6d:77be%6]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 04:26:54 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d60924b7-ed67-4866-a9dd-e0c9660937e9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dcpt/BRXQhfJCq59NIwGW+HzCC6vr4mLckkyoqQvrf8=;
 b=uCoUS4NHe7FMmMqD6YTSYe2BF9AZHLxbbu6fPKI+bqUM9GVZ8ZXkh07MRB3T9X/qWcreTSj13upGRvu2LbLsUcl+XO94Jb+AgFsuHzBRl8XLyUCtZb0SuXibjOnDUTIB1jYHe6iz8pdP01PD3bhPldZuY+sJOb6uBbnUQ9bYqRk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJfx8Oat6p19Im90572ZLuD5sOt9DTbsLSntMEekZl0Du9BYpXefcmlFXR9fx2qCyqZAxvx8dWr8haX50CuExGhxNMnoJCfoSGVIp4R6SdanVy+Jl2lrDy4/r6/okOcW1QSPuEPa2lBrIQkYhUpmgzz8MeK4k2V7xC/YIrDHg1aj4qaoqCdiufI8QtRS2yCaQYILat8ucLXxl4kyWjeijk6xphwonr8mJ1UTSSn1qd5xqf3Kq84ijTDrh4Hl9drzn/uLii7SiJ/FPuTOscW8PCUhYh7k3h4q4p14/7lDuAQzcYQAZYPu5mD+Hi4e/nTQGZlnwHMbw6QfHZmO5/T2zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Dcpt/BRXQhfJCq59NIwGW+HzCC6vr4mLckkyoqQvrf8=;
 b=FcCmDihdg1u7mrkD8Pv0PEaSOJXRpE0zJqhFchB+pD85mQYto1HUNPqz2VUuXvZxH0S8DYuWZR6AghehCe1ePy8fgKFrUUEH/ig339354HdwmoYtLS/ZNTtNtA8qw6rsfI1tZ33D09xCXq+UqJuUS9iHonXAhoB4GWHgxR9i19u+a+Fge0vz7Ic5yyZ9Yadb9kD17Q/mpfynQ1L5l+TJQR7NK7GpdT7nKzHC9eaRbWyfJtp9EIP8SJcwm9asrF29unM8J0Qz84rp/VFrf4AyiQ3DbRRTElB5tHj/08s7o8+vxexZCkDJUVktTD+yMRt2jzPh4YC4qzahGMEl00OGfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dcpt/BRXQhfJCq59NIwGW+HzCC6vr4mLckkyoqQvrf8=;
 b=uCoUS4NHe7FMmMqD6YTSYe2BF9AZHLxbbu6fPKI+bqUM9GVZ8ZXkh07MRB3T9X/qWcreTSj13upGRvu2LbLsUcl+XO94Jb+AgFsuHzBRl8XLyUCtZb0SuXibjOnDUTIB1jYHe6iz8pdP01PD3bhPldZuY+sJOb6uBbnUQ9bYqRk=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [PATCH 28/37] xen/arm: stub memory hotplug access helpers for Arm
Thread-Topic: [PATCH 28/37] xen/arm: stub memory hotplug access helpers for
 Arm
Thread-Index: AQHXsHM7ZH4VKSj50US+Svlpv1AyWquyeDqAgAAfkdA=
Date: Fri, 24 Sep 2021 04:26:54 +0000
Message-ID:
 <PAXPR08MB68643E4949FCAB1CC84CFC2F9EA49@PAXPR08MB6864.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-29-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231932250.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109231932250.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 6B5F14B452839145BBC41D28DD33E36B.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a9d628c1-9fc9-4cae-3aa6-08d97f1391ec
x-ms-traffictypediagnostic: PR3PR08MB5771:|AM5PR0802MB2466:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM5PR0802MB2466E4739EC21617604E16FB9EA49@AM5PR0802MB2466.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YFZXq/NEyGrCAithY5Q3CwFzBsbkP+Pz5de6kfp+Pz9ERxCz0XcKG1fMqJ8a93tRiJeEcTo1mIzV2v0imnGVxAC+ahT3n8GACSToUT+o1uu0noD1BctgVZiLHdFz0i7i6SWDp8oOOmYXsaSDdyV8NbJKnbYXc4l9qfRy2YqAMtWzgOJlvTMBjR6GDSnieramYGcvx9xRNgFkzH2g4swmCfTdywD8XbtKTcuhRTomKZwlAX3/nhzII9hh4vUG/DeUYo7YPRTZHieYYzuIkA64QvgIoZMZd1pDrRQ5nc1GzDJiBQ9jwHYco7nmssycvCnsNCJjwbe6hPudoi2NrXR1yKkG2YhEkt83um5s5iSvqk+C1nmQavSo27hrjJKEC2q3tnhatzl+cZxxSh9Ft51E0u2vSrv5/UCKhwjj2QUELZpgQmKKZ8NleepZTM24BrpxvlahtFlWKygEGxKisenJ8W948Yf/TGr2qX0UuZyPKr8cWgaH9C5QbwWKgpaZBN2IVpFL8K0LuQABiax5lewZRd+fzMENSZhmmiDHk7xV/3c4eGsmnJ2GW2Uc17KWMbSKXQcaGmTgfpBzxqxLoqldTo+aHSF0NbVZS1tiDu9OV/vbl2avQI9D85D1WGfAm5ggxPbZ780T8/Xuhpybmcm7STqpvMiw09xJJJEz2CxPq4mtGF6sWGNVbrY/S7Lo6sIgRzx1nNEvXavrrKdospj0Ag==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6864.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(4326008)(122000001)(8936002)(55016002)(38070700005)(52536014)(9686003)(6506007)(53546011)(7696005)(71200400001)(186003)(66476007)(66946007)(6916009)(508600001)(66446008)(64756008)(38100700002)(83380400001)(76116006)(2906002)(5660300002)(33656002)(26005)(66556008)(316002)(54906003)(8676002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5771
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9c78b180-37c9-4776-9241-08d97f138a03
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YRr/f37WvpJ/xYHTbjpOFxnvnAZ1HrNaNc0jJTVClBx5kNEadOtZeL03wR3JtD9xQGCfgp4REObP5pNnRLtJuxHUNs38rYfzdP8yZSwUidKy11sEb26gu996Fjq6HF9e6ZYRee9XyVgHoMaOlQC05j3AeygpbhDWuhraJodegNeODOpp1zuMuvsCJEEnZB6/6jqme11ht2xyb0Ae5jMHKsYjaZnGd3tam8ll/D3W/+UZShcNMQg0YkrCNliNed0eKT5S8YN2qUF+2Fv8TYYuX1TeXWBrX4usXC44To8a/xOd8vNIIA/hRM3JGfdR/enTVen/jXBlV/SQZx8vTM+3zzwc++36e6uEJ48p/NsLuYOjMx6jyGtOEE4R8st6nX6FqfBiat8+5MG3F9Ex2El/OzjXZYpNOCCk8Cp5l/KV6O1P1zgu/UyXH3auIrd5an9fzVmrR6Zt1uQf8OKB6uuNdvbOC7YoTfX6yXxpxPLEraD/Yr1YR4teBtezi/194bRGgjkW0zjvqatVGm6me8GMaA/b0OkdoC8q+zbZVrHYQzYRBkKl5psSE62dZjZnlKqeUuEk6/q0nzKCFbq/ziL2G/6nVC9Cat9bmzn/AlZO9KCTOxvGPgHgli8s9kL+VQwRGJMfZ8DIamIvTWe4OMvyuyu5jr14qoNT98hBRhjxccRueRrWQpYkQBqMyvx//0ocsRQEkkkBY43C4avFFUSrCw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(9686003)(33656002)(36860700001)(8676002)(70586007)(186003)(70206006)(5660300002)(336012)(8936002)(86362001)(55016002)(26005)(83380400001)(81166007)(4326008)(47076005)(7696005)(6862004)(2906002)(82310400003)(54906003)(316002)(6506007)(53546011)(356005)(508600001)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 04:27:07.8270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d628c1-9fc9-4cae-3aa6-08d97f1391ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2466

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiBTZW50OiAyMDIxxOo51MIyNMjVIDEwOjM0
DQo+IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZzsgc3N0YWJlbGxpbmlAa2VybmVsLm9yZzsganVsaWVuQHhlbi5vcmc7
DQo+IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4NCj4gU3ViamVj
dDogUmU6IFtQQVRDSCAyOC8zN10geGVuL2FybTogc3R1YiBtZW1vcnkgaG90cGx1ZyBhY2Nlc3Mg
aGVscGVycyBmb3INCj4gQXJtDQo+IA0KPiBPbiBUaHUsIDIzIFNlcCAyMDIxLCBXZWkgQ2hlbiB3
cm90ZToNCj4gPiBDb21tb24gY29kZSBpbiBOVU1BIG5lZWQgdGhlc2UgdHdvIGhlbHBlcnMgdG8g
YWNjZXNzL3VwZGF0ZQ0KPiA+IG1lbW9yeSBob3RwbHVnIGVuZCBhZGRyZXNzLiBBcm0gaGFzIG5v
dCBzdXBwb3J0IG1lbW9yeSBob3RwbHVnDQo+ID4geWV0LiBTbyB3ZSBzdHViIHRoZXNlIHR3byBo
ZWxwZXJzIGluIHRoaXMgcGF0Y2ggdG8gbWFrZSBOVU1BDQo+ID4gY29tbW9uIGNvZGUgaGFwcHku
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4NCj4g
PiAtLS0NCj4gPiAgeGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oIHwgMTAgKysrKysrKysrKw0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBh
L3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaA0KPiA+
IGluZGV4IDdiNWU3YjdmNjkuLmZjOTQzMzE2NWQgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2luY2x1
ZGUvYXNtLWFybS9tbS5oDQo+ID4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oDQo+ID4g
QEAgLTM2Miw2ICszNjIsMTYgQEAgdm9pZCBjbGVhcl9hbmRfY2xlYW5fcGFnZShzdHJ1Y3QgcGFn
ZV9pbmZvICpwYWdlKTsNCj4gPg0KPiA+ICB1bnNpZ25lZCBpbnQgYXJjaF9nZXRfZG1hX2JpdHNp
emUodm9pZCk7DQo+ID4NCj4gPiArc3RhdGljIGlubGluZSB2b2lkIG1lbV9ob3RwbHVnX3VwZGF0
ZV9ib3VuZGFyeShwYWRkcl90IGVuZCkNCj4gPiArew0KPiA+ICsNCj4gPiArfQ0KPiA+ICsNCj4g
PiArc3RhdGljIGlubGluZSBwYWRkcl90IG1lbV9ob3RwbHVnX2JvdW5kYXJ5KHZvaWQpDQo+ID4g
K3sNCj4gPiArICAgIHJldHVybiAwOw0KPiA+ICt9DQo+IA0KPiBXaHkgemVybz8gQ291bGQgaXQg
YmUgSU5WQUxJRF9QQUREUiA/DQoNClllcywgSU5WQUxJRF9QQUREUiBpcyBiZXR0ZXIuDQo=

