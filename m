Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDA9416B0F
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 06:45:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194904.347282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTd5b-0001fe-Fz; Fri, 24 Sep 2021 04:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194904.347282; Fri, 24 Sep 2021 04:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTd5b-0001dq-Cn; Fri, 24 Sep 2021 04:45:35 +0000
Received: by outflank-mailman (input) for mailman id 194904;
 Fri, 24 Sep 2021 04:45:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OJ83=OO=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTd5Z-0001dk-Mi
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 04:45:33 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::613])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4341efa4-38af-4279-96b5-7aa00c0e67c1;
 Fri, 24 Sep 2021 04:45:32 +0000 (UTC)
Received: from DB6P192CA0011.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::21) by
 PAXPR08MB7202.eurprd08.prod.outlook.com (2603:10a6:102:209::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Fri, 24 Sep
 2021 04:45:30 +0000
Received: from DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b8:cafe::bc) by DB6P192CA0011.outlook.office365.com
 (2603:10a6:4:b8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Fri, 24 Sep 2021 04:45:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT044.mail.protection.outlook.com (10.152.21.167) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 04:45:30 +0000
Received: ("Tessian outbound 78bf72cc015a:v103");
 Fri, 24 Sep 2021 04:45:29 +0000
Received: from 4c11f6bd24ce.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5FB78F6D-2F6B-4B97-BF8B-8C6BFC6E2691.1; 
 Fri, 24 Sep 2021 04:45:18 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4c11f6bd24ce.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Sep 2021 04:45:18 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBAPR08MB5622.eurprd08.prod.outlook.com (2603:10a6:10:1af::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 04:45:16 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 04:45:16 +0000
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
X-Inumbo-ID: 4341efa4-38af-4279-96b5-7aa00c0e67c1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8T94Mbto6pvFVI8qCVmcdrb3oV9mjt0Zfo4bQrqJgE=;
 b=CWkwGlYsOE+bO9xLddx/IUpjdvC9ct+jSZ3Ml9rvYd8JfUtyOijkypeDozWddwCsx6SE0Ha8vJvQ7KFE65ERm7JChVvR1z2RCk0iOu+/o3EmkK+CACRRU1x/2rd2OchDWANelEICvWPD6YRYWr0yAmfQ3o9u7Y62392gMssH5XM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6+i9oUP8O8Jju3+e6qee7qyVDvex42xByVQRRQK2PIN/YZddk4pyZtv9kY3STJuA/QfOoBfEBokPwzdDPTMXku7s02mv7QqmA25JEQCZuVIT67w8amWE1TCx8cZx19xZp63leEQZlGuPJ+4UNEAU96MmogfPNSEm55JTRE6KwakTNXh1oG/Ys/jbMoY9p8XK6SYDahDuOH2qzssaI7YtS5S4jI8bVXXNB8MezcsqFVFcmwe5EcDW/CYRRujSzll1iAjM/ArGZEu7I7tFjuL1Wroz5Y4WurC5QixVgpPmgsqG5yhaAnR0q9Agkfqk4AOsvrf0EnC2pJrE+oG+Qbm3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=g8T94Mbto6pvFVI8qCVmcdrb3oV9mjt0Zfo4bQrqJgE=;
 b=aFXmYD2WqXbcJwqBAHcecCCF7KBK6J6upwUn1yFwC2mCVLlaUU8OV/lLpwyEq3Tih17Abx57YJxBpjqCkpqx5X5uegxuZHarRfW7lRVYqVeM0m7FOZjEMSU6XZ7uI5eA5V5fneuFYfs0WeqMOOMJaOaGvPO4QIztjqPIk+MuyUBl2KAnD2AAwsFEOYCKmyXi0I0OvP0JKK6pGnEQIVb3gYlEnrrVYSZAxUgUf4g72NTo8vNQlS04Jj/4SITb57aTpgLy+BlkMR3OzH2OLmchz478WLGNAHCrIQzR7l98ZC2ZWydNtz7W/AQ/2/LxqLt+p5Hp7reNDd+bK8u9JKPPHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8T94Mbto6pvFVI8qCVmcdrb3oV9mjt0Zfo4bQrqJgE=;
 b=CWkwGlYsOE+bO9xLddx/IUpjdvC9ct+jSZ3Ml9rvYd8JfUtyOijkypeDozWddwCsx6SE0Ha8vJvQ7KFE65ERm7JChVvR1z2RCk0iOu+/o3EmkK+CACRRU1x/2rd2OchDWANelEICvWPD6YRYWr0yAmfQ3o9u7Y62392gMssH5XM=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, "wl@xen.org" <wl@xen.org>
Subject: RE: [PATCH 25/37] xen/arm: implement bad_srat for Arm NUMA
 initialization
Thread-Topic: [PATCH 25/37] xen/arm: implement bad_srat for Arm NUMA
 initialization
Thread-Index: AQHXsHMq3VjOt9gtW0yi3uRIsAbNq6uycYQAgAAq5HA=
Date: Fri, 24 Sep 2021 04:45:16 +0000
Message-ID:
 <DB9PR08MB68570E6EA33BF7C6E9E23CBD9EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-26-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231906570.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109231906570.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5FFABA7B4929D349990F917B7E6D4545.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: db282b1d-e18e-4496-f539-08d97f1622ea
x-ms-traffictypediagnostic: DBAPR08MB5622:|PAXPR08MB7202:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB7202671E0288E84D512266279EA49@PAXPR08MB7202.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NKHx34q+Laa25z0FSM1R169E0y1tnL2r+paMiUDzCdcEw9PxWw5V1X0ZXyC1J4VLk3O3KKiE1MWnGsKTHiwwr2xqXJji5Q/N12E/9hGfOUBjpSHGpUdvOqDmC6auDZQ9YXH/wq0aR4S76+c/8Cj2DNqzHx8ZnQBOIQZqqP2qzFYwqUydrVVHgCDpEMlG8V9KB9HjUzUvgi4nBJgF0vA5sY5/jV4HTbPfMJOmO5MwyFFDMA5/MkIe0j7E+R1sOy+6lq7mlGlG9a1oTjY+y9nWJcHg/POO9eJflHkfvJJasm3vPBUT7ovPTSEveTJKeIMZ7wtdw7jkCH2WF9ylUWQPvs5xUIbsUsrkmUrvQPa5chBwEOGn8syJxYzcsSijqQbVD2s62H5tsgG4yAXU+YsPFIDpZiP9AMDRaIzXwM4yyQX7fsef+p4qMui+pV+jrIz36ns89SYIp7CYRqsngfusp0UiboWZKWRz4iwZxQrjEBvChpZ3YYqEoWx1ASfbDC2f1HmVx9L8jInMY/ci0LBVh/tu6LAHSSerVy5uFyZL906gg7IqcnJh0nRNhtgeLnSLXYNeCBZAsGxLHgl11Q+x39zZC+tmU5ercZSajGXO5nSsT+9JPTN2HLRqXeh39UHt8B1Jt2FssfJODEo/vZFfYs0MBr552Ft44rRyJ4UdME3+aLkIFH08ncB/AA0BNmuK2Z6rAbQAD89iqTk17i2BKA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(38100700002)(71200400001)(33656002)(6916009)(122000001)(54906003)(2906002)(316002)(4326008)(86362001)(5660300002)(38070700005)(6506007)(8936002)(55016002)(26005)(53546011)(7696005)(186003)(52536014)(8676002)(83380400001)(9686003)(76116006)(64756008)(66946007)(66476007)(66446008)(66556008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5622
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6fabb5a0-9473-4d53-f97b-08d97f161ae2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LKDR3FuE6uhC7YjXZhLZWA0P55mCkbgvxuYGXejS2UfpdrRaaHSBa9qQPksf3lYdH3WdZDkukntJli3YyhGlp3uux/WjTQeJ1RPWSxElEXdePHUewISIZ6jdkY+OMypcIzeoTlb0CSksAq8ti5lfKSS/6bUyH1wPQnVK6gRSjim8m74tDe1vt+5G0cO1QFaQoe5io4HEhowpoz5myIn2BsuD+W7UjAsiyJre3h9Ziry7XQHDErwhOJRHkDzwvMZ6zmCqbOhodoZz5Tozj1UbxvVrqBJDU71arWAIqdAyD8F+MKUOJcPHWGJLgurNAFHE0pyUPeEnhJzIQpRTG/uV39g6BX7DNNbnXu2VlP7mdWhnh/UzEDykGfd9eFHy9N4zPrJI0d52ieRVDk2cHVK5bx4xBCIhqPRezXbbNdAAdApXQFEvN1DC0PMGLMGy6C5TZmYHKNojogzBxnVMjNq0XJm4jCOrhUa3ATmdlWVwmfwSWHuhdNERxa8qYB0+I93h/enjoCvWbsngDAzyYh04ophCmk0t9PpJ0MaBFLMGUniV3OFymdP0iICqoMzRMaZk/LSBAmv277gNqYlsxzPH2v47TR5lGj7tfkuPLgkDAXNK8T7Fl4kfyw3Xo2HLchO4hDQXT3xkGoG757rgMIHbv4YMsxD94BLsKyIlEpYldSR52ffHUh8J4YoDyrYTRFYBWHvE7QbGCoGSyukrMa63zw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6862004)(316002)(82310400003)(54906003)(8936002)(7696005)(47076005)(81166007)(336012)(4326008)(9686003)(508600001)(8676002)(36860700001)(26005)(53546011)(55016002)(6506007)(186003)(70206006)(52536014)(33656002)(70586007)(83380400001)(356005)(2906002)(86362001)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 04:45:30.1397
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db282b1d-e18e-4496-f539-08d97f1622ea
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7202

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjHE6jnU
wjI0yNUgMTA6MTANCj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPg0KPiBDYzogeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxp
ZW5AeGVuLm9yZzsNCj4gQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29t
PjsgamJldWxpY2hAc3VzZS5jb207DQo+IGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb207IHJvZ2Vy
LnBhdUBjaXRyaXguY29tOyB3bEB4ZW4ub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMjUvMzdd
IHhlbi9hcm06IGltcGxlbWVudCBiYWRfc3JhdCBmb3IgQXJtIE5VTUENCj4gaW5pdGlhbGl6YXRp
b24NCj4gDQo+IE9uIFRodSwgMjMgU2VwIDIwMjEsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IE5VTUEg
aW5pdGlhbGl6YXRpb24gd2lsbCBwYXJzZSBpbmZvcm1hdGlvbiBmcm9tIGZpcm13YXJlIHByb3Zp
ZGVkDQo+ID4gc3RhdGljIHJlc291cmNlIGFmZmluaXR5IHRhYmxlIChBQ1BJIFNSQVQgb3IgRFRC
KS4gYmFkX3NyYXQgaWYgYQ0KPiA+IGZ1bmN0aW9uIHRoYXQgd2lsbCBiZSB1c2VkIHdoZW4gaW5p
dGlhbGl6YXRpb24gY29kZSBlbmNvdW50ZXJzDQo+ID4gc29tZSB1bmV4Y2VwdGVkIGVycm9ycy4N
Cj4gPg0KPiA+IEluIHRoaXMgcGF0Y2gsIHdlIGludHJvZHVjZSBBcm0gdmVyc2lvbiBiYWRfc3Jh
dCBmb3IgTlVNQSBjb21tb24NCj4gPiBpbml0aWFsaXphdGlvbiBjb2RlIHRvIGludm9rZSBpdC4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiA+
IC0tLQ0KPiA+ICB4ZW4vYXJjaC9hcm0vbnVtYS5jIHwgNyArKysrKysrDQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9h
cm0vbnVtYS5jIGIveGVuL2FyY2gvYXJtL251bWEuYw0KPiA+IGluZGV4IDM3NTViMDFlZjQuLjUy
MDlkM2RlNGQgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL251bWEuYw0KPiA+ICsrKyBi
L3hlbi9hcmNoL2FybS9udW1hLmMNCj4gPiBAQCAtMTgsNiArMTgsNyBAQA0KPiA+ICAgKg0KPiA+
ICAgKi8NCj4gPiAgI2luY2x1ZGUgPHhlbi9pbml0Lmg+DQo+ID4gKyNpbmNsdWRlIDx4ZW4vbm9k
ZW1hc2suaD4NCj4gPiAgI2luY2x1ZGUgPHhlbi9udW1hLmg+DQo+ID4NCj4gPiAgc3RhdGljIHVp
bnQ4X3QgX19yZWFkX21vc3RseQ0KPiA+IEBAIC0yNSw2ICsyNiwxMiBAQCBub2RlX2Rpc3RhbmNl
X21hcFtNQVhfTlVNTk9ERVNdW01BWF9OVU1OT0RFU10gPSB7DQo+ID4gICAgICB7IDAgfQ0KPiA+
ICB9Ow0KPiA+DQo+ID4gK19faW5pdCB2b2lkIGJhZF9zcmF0KHZvaWQpDQo+ID4gK3sNCj4gPiAr
ICAgIHByaW50ayhLRVJOX0VSUiAiTlVNQTogRmlybXdhcmUgU1JBVCB0YWJsZSBub3QgdXNlZC5c
biIpOw0KPiA+ICsgICAgZndfbnVtYSA9IC0xOw0KPiA+ICt9DQo+IA0KPiBJIHJlYWxpemUgdGhh
dCB0aGUgc2VyaWVzIGtlZXBzIHRoZSAic3JhdCIgdGVybWlub2xvZ3kgZXZlcnl3aGVyZSBvbiBE
VA0KPiB0b28uIEkgd29uZGVyIGlmIGl0IGlzIHdvcnRoIHJlcGxhY2luZyBzcmF0IHdpdGggc29t
ZXRoaW5nIGxpa2UNCj4gIm51bWFfZGlzdGFuY2UiIGV2ZXJ5d2hlcmUgYXMgYXBwcm9wcmlhdGUu
IEkgYW0gYWRkaW5nIHRoZSB4ODYNCj4gbWFpbnRhaW5lcnMgZm9yIGFuIG9waW5pb24uDQo+IA0K
PiBJZiB5b3UgZ3V5cyBwcmVmZXIgdG8ga2VlcCBzcmF0IChpZiBub3RoaW5nIGVsc2UsIGl0IGlz
IGNvbmNpc2UpLCBJIGFtDQo+IGFsc28gT0sgd2l0aCBrZWVwaW5nIHNyYXQgYWx0aG91Z2ggaXQg
aXMgbm90IHRlY2huaWNhbGx5IGFjY3VyYXRlLg0KDQpJIGhhdmUgcGxhY2VkIHNvbWUgY29tbWVu
dHMgaW4gcGF0Y2gjMjMgZm9yIHNyYXQuDQpJIHdvdWxkbid0IGxpa2UgdG8gcmVwbGFjZSBzcmF0
IGJ5IG51bWFfZGlzdGFuY2UuIGJlY2F1c2Ugc3JhdCBub3Qgb25seQ0KY29udGFpbnMgZGlzdGFu
Y2UsIGFuZCBpdCBhbHNvIGluY2x1ZGVzIHNvbWUgYWZmaW5pdHkgaW5mb3JtYXRpb24gZm9yIENQ
VQ0Kb3Igb3RoZXIgZGV2aWNlcy4NCg0K

