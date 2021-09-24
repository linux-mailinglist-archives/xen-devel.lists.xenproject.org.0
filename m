Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE56A416B08
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 06:42:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194892.347259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTd2D-0000NN-JG; Fri, 24 Sep 2021 04:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194892.347259; Fri, 24 Sep 2021 04:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTd2D-0000LX-GC; Fri, 24 Sep 2021 04:42:05 +0000
Received: by outflank-mailman (input) for mailman id 194892;
 Fri, 24 Sep 2021 04:42:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OJ83=OO=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTd2B-0000LO-WF
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 04:42:04 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.78]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3265748-3213-4fdb-a17f-71d97c1dc665;
 Fri, 24 Sep 2021 04:42:01 +0000 (UTC)
Received: from DU2PR04CA0318.eurprd04.prod.outlook.com (2603:10a6:10:2b5::23)
 by PAXPR08MB6480.eurprd08.prod.outlook.com (2603:10a6:102:155::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 04:41:52 +0000
Received: from DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::1c) by DU2PR04CA0318.outlook.office365.com
 (2603:10a6:10:2b5::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16 via Frontend
 Transport; Fri, 24 Sep 2021 04:41:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT014.mail.protection.outlook.com (10.152.20.102) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 04:41:51 +0000
Received: ("Tessian outbound 71ebfb754289:v103");
 Fri, 24 Sep 2021 04:41:51 +0000
Received: from 6e7a80343b7f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 34509C8B-E875-4177-9924-3DA8DAC35113.1; 
 Fri, 24 Sep 2021 04:41:40 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6e7a80343b7f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Sep 2021 04:41:40 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBAPR08MB5622.eurprd08.prod.outlook.com (2603:10a6:10:1af::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 04:41:39 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 04:41:39 +0000
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
X-Inumbo-ID: b3265748-3213-4fdb-a17f-71d97c1dc665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBlq6h6M1zHBD87kL+Y1HK06DiDaAcZlMN2lyMlHGZw=;
 b=K0+ugwzNSXstWTvSqXMfNZgTkZNQI5jnmg+T0XAnfLI9MiYRrQhRH5XBlimYtypHJGDAA5KC9mWKxZXpqTEayeFFnWVH6sREvz4aNNlQABOjklo2Dr3Oqa2/E+39Uj0/m/DnPYzcJnphOalq5VDDrc8VFTImZ9oCX25a6rGbO7o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XxvUooFYYlhGKdCq4a5YJx2sWVNsRC/PbkQCF6bMWCiW5NMhuEjO/uFql00Z+FWTJHWQdoODuZw220DAMEmu+Wk0+jFD+2Ig3dKsM69xELeWt0/pyzRgOf6mV0+gWEB61Gk5+ET+JuZlYeeQn7D0+anagGWxF6p7zTn1MjQco9FGHgiwTkJ73Yi5TjHVVG06DpftiP1SzMF/sABBdUmXBW89xozp7tUcrsYTJmAkTfkR2U9+2f5vKdnaIktLi6OQcTSYP7f3ehp6tMp3uN0MpYh4/s3oB+G2nJyGX+1/VxmsDpMr97jfveedXp6/+xoTcOy74YqW+o1aHs/ljkKgaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ZBlq6h6M1zHBD87kL+Y1HK06DiDaAcZlMN2lyMlHGZw=;
 b=J1WdAIG8vGVb6cPiRcDsi+ZNC8NC0EZ/LQMwiNxYrXgNtJwz/RTzr6LjTDtHtMBul14O0WbQNjnVbHEP1pf8pJPtvI9QYs7RkLL13BCWievy1t+Y9v5M51etrcePxELcIgzpWHeStdGQPzGUO9rlSB0kAGio3pbXFb+zbMxByuDwwdR9P+zQ3kNtZoYOK8rf0ThdJ1uSjJ3A6MMLQ0yZ9rC4Wbn37gQcRK70rzXDcRATaYMeIUAUlWaSaOjaQ9rXy9GN3/oJfhX1Eyp4K9PGRqm4JAUo08/5dPnIOHB43w/bvo14bLk0rzBrS4KMej3YzS5SeWZHIL9Z6gYC4z8TDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBlq6h6M1zHBD87kL+Y1HK06DiDaAcZlMN2lyMlHGZw=;
 b=K0+ugwzNSXstWTvSqXMfNZgTkZNQI5jnmg+T0XAnfLI9MiYRrQhRH5XBlimYtypHJGDAA5KC9mWKxZXpqTEayeFFnWVH6sREvz4aNNlQABOjklo2Dr3Oqa2/E+39Uj0/m/DnPYzcJnphOalq5VDDrc8VFTImZ9oCX25a6rGbO7o=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [PATCH 23/37] xen/arm: implement node distance helpers for Arm
Thread-Topic: [PATCH 23/37] xen/arm: implement node distance helpers for Arm
Thread-Index: AQHXsHMu1eZPzfhk6EKVEGWM7eNLZ6uyayoAgAAvnmA=
Date: Fri, 24 Sep 2021 04:41:39 +0000
Message-ID:
 <DB9PR08MB68571BAA4C8B07BB2061C8579EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-24-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231843530.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109231843530.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 25FDE39980836D4D8F82B971B36E8D2C.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c8c4d86e-2ce6-4d44-b7e7-08d97f15a0dd
x-ms-traffictypediagnostic: DBAPR08MB5622:|PAXPR08MB6480:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB6480ABF83D78E1C15631AA4E9EA49@PAXPR08MB6480.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cuZVj02NP1nWRPECQqEIbq6r16CT7mNYXYTPof5yzaQNy9hgHHF/jiLWbqOkZMaU8O1u8Ts49UQUmvoPhxR3ef9peGAdlDwejQvQxddPJrktpiq4gXLdKO97wTUI7FfN+WxWL4bUbOfe9CkZoOgz2zwqQgz+bVto+EhcRWxw7OA02W4nHky0H57/9v8YOun/cevXdd1YWNodwAf0tquhNbzw5bVvuT5T9NvfqK0XGu/d7W/4DZ5Ou/HvVRDzif6WKcurwg8arU4ZE1YQ1/bS2p4B6ZdO9NQ99ROjcZyDfMLTf2PJ4Qcg2yBH3CqcuUGdXQChgRlj5318zmSR13v8gyk6Toh2ZEaPoReHkYK7RLN79s+1I2YK4whk6dAwlwnu+ZfflDr/t3hc6rIbU9Nrj+dt2h6Pzvrb0q3kmQw8LqPDYDxHdRhGQSDSrovGqX0wbA6pdz3rvOZ6NENbFpGGagp+Ggve+Z/Cp81PoW5uk9Cv+heXksl8jlPs53KM8eozfSoZa3Mf2QPYdFDzCrHXQnfsjnOFx6oGobCTEPDgGGKvr8HSBCIUCigOO8xqnkmzAkqjxZcqsHz1hgQH7G405bRJQL1zMA4P+BwOGGHly7zsooYz7N9TQUnXKQMQ/wPENRTpRXdOsek/tgJw1On60ihHH15o1LSryCg8kzfgGAn+gAMPh/k2EO4R4OwTNv1LKN08ZG1oXEOqgztG1Q3EjfUf0eBx6vyrtOykIj5YuScvbYqhxgfLviBpd5FPSseXjs4oNE5R+9BlGDjhIuVMOb2ABoRKY4qTvyUgRoCj7Glg3tX/YLCpZRspvjy05Keg
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(38100700002)(71200400001)(33656002)(6916009)(122000001)(54906003)(2906002)(316002)(4326008)(86362001)(5660300002)(38070700005)(6506007)(8936002)(55016002)(26005)(53546011)(7696005)(186003)(52536014)(8676002)(83380400001)(9686003)(76116006)(64756008)(66946007)(66476007)(66446008)(66556008)(2004002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5622
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ddc63845-7688-40a8-445f-08d97f159967
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ohGiDzwECEWnBOreC4e0/j1VdZQVI55uj/eEQlBE3j6ERDPLGO1Dpjejd1eOWS1o5jMDnVFcLxQbUx2vMFbqGXqDFUwF0IFFgPMxDhCKMm0ofHv3ySXcXWqDIjw4OWzJwAdbElvMhzWdnxt6K+mj7ZUC4gXouBnhWxiu2Mk4/bxhrSBWFpItoigPg0O2cZDcwPwlYFgcHAifgBmPgg3L44BX1yRBsuMaqqCcv6ZEarQtqej9tbfGDTyWPxF26lTYBNr1Ong8eQ08Pz0vBDDdpzixVoRNmDwRKyZsk4McdYMm6LsH82jTQlxE+Iaa7df1jfcn0UHjxcFSdW3eTSiofZKdTC4b6x5cZJNPWvutxMtyZpv21pZiOvCTn7NevXsdClb5yYMJH50wP9iyoF8/RGS8+CZdml/qRHluZ459Fdb7Sp+MH6P/yQbkNmyGYBrwV/tjiZXsNcRdshNK21jw3SvJsAkz2fIu6dYeG0TCl+qeF/s2b/BGONFJDldr9coGG0Wdf74HuAgRH91R7k+i9pqVOQ6rjPBdASYUKsqjwCR+ayOqkSUgUynuFqTawPJDQR5Vc59LDwekRDiqFe5+GamKtwWvwoBEep0F/N/oa/kkqYRA3WV2wJbJ6yHiNiDygyUPc0s6h3j3MivNf2TinAs7KsF/K6AFWKUlDOb4B/PAFr0ntNiznZXLWoxJpniVwFkmp6XnamwXwx9Gdm1ECQdbuDfpwco4bmxJcnApn/OgNjqbB+3sqeIq5VxBgEY7xdHYY9zaAdamrz59/NVcToHY54AHhB/pIJ883kcwuxLV3HwWI6GMSO/PLayHzzsV
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(83380400001)(47076005)(2906002)(81166007)(26005)(186003)(5660300002)(8936002)(4326008)(6506007)(33656002)(508600001)(53546011)(70586007)(336012)(8676002)(52536014)(82310400003)(70206006)(316002)(7696005)(6862004)(9686003)(55016002)(356005)(86362001)(36860700001)(54906003)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 04:41:51.9463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c4d86e-2ce6-4d44-b7e7-08d97f15a0dd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6480

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjHE6jnU
wjI0yNUgOTo0Nw0KPiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1bGll
bkB4ZW4ub3JnOw0KPiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMjMvMzddIHhlbi9hcm06IGltcGxlbWVudCBub2RlIGRp
c3RhbmNlIGhlbHBlcnMgZm9yDQo+IEFybQ0KPiANCj4gT24gVGh1LCAyMyBTZXAgMjAyMSwgV2Vp
IENoZW4gd3JvdGU6DQo+ID4gV2Ugd2lsbCBwYXJzZSBOVU1BIG5vZGVzIGRpc3RhbmNlcyBmcm9t
IGRldmljZSB0cmVlIG9yIEFDUEkNCj4gPiB0YWJsZS4gU28gd2UgbmVlZCBhIG1hdHJpeCB0byBy
ZWNvcmQgdGhlIGRpc3RhbmNlcyBiZXR3ZWVuDQo+ID4gYW55IHR3byBub2RlcyB3ZSBwYXJzZWQu
IEFjY29yZGluZ2x5LCB3ZSBwcm92aWRlIHRoaXMNCj4gPiBub2RlX3NldF9kaXN0YW5jZSBBUEkg
Zm9yIGRldmljZSB0cmVlIG9yIEFDUEkgdGFibGUgcGFyc2Vycw0KPiA+IHRvIHNldCB0aGUgZGlz
dGFuY2UgZm9yIGFueSB0d28gbm9kZXMgaW4gdGhpcyBwYXRjaC4NCj4gPiBXaGVuIE5VTUEgaW5p
dGlhbGl6YXRpb24gZmFpbGVkLCBfX25vZGVfZGlzdGFuY2Ugd2lsbCByZXR1cm4NCj4gPiBOVU1B
X1JFTU9URV9ESVNUQU5DRSwgdGhpcyB3aWxsIGhlbHAgdXMgYXZvaWQgZG9pbmcgcm9sbGJhY2sN
Cj4gPiBmb3IgZGlzdGFuY2UgbWF4dHJpeCB3aGVuIE5VTUEgaW5pdGlhbGl6YXRpb24gZmFpbGVk
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+
ID4gLS0tDQo+ID4gIHhlbi9hcmNoL2FybS9NYWtlZmlsZSAgICAgIHwgIDEgKw0KPiA+ICB4ZW4v
YXJjaC9hcm0vbnVtYS5jICAgICAgICB8IDY5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrDQo+ID4gIHhlbi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5oIHwgMTMgKysrKysrKw0K
PiA+ICAzIGZpbGVzIGNoYW5nZWQsIDgzIGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IHhlbi9hcmNoL2FybS9udW1hLmMNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vTWFrZWZpbGUgYi94ZW4vYXJjaC9hcm0vTWFrZWZpbGUNCj4gPiBpbmRleCBhZTRlZmJm
NzZlLi40MWNhMzExYjZiIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9NYWtlZmlsZQ0K
PiA+ICsrKyBiL3hlbi9hcmNoL2FybS9NYWtlZmlsZQ0KPiA+IEBAIC0zNSw2ICszNSw3IEBAIG9i
ai0kKENPTkZJR19MSVZFUEFUQ0gpICs9IGxpdmVwYXRjaC5vDQo+ID4gIG9iai15ICs9IG1lbV9h
Y2Nlc3Mubw0KPiA+ICBvYmoteSArPSBtbS5vDQo+ID4gIG9iai15ICs9IG1vbml0b3Iubw0KPiA+
ICtvYmotJChDT05GSUdfTlVNQSkgKz0gbnVtYS5vDQo+ID4gIG9iai15ICs9IHAybS5vDQo+ID4g
IG9iai15ICs9IHBlcmNwdS5vDQo+ID4gIG9iai15ICs9IHBsYXRmb3JtLm8NCj4gPiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL251bWEuYyBiL3hlbi9hcmNoL2FybS9udW1hLmMNCj4gPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAuLjNmMDg4NzBkNjkNCj4gPiAt
LS0gL2Rldi9udWxsDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL251bWEuYw0KPiA+IEBAIC0wLDAg
KzEsNjkgQEANCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gPiAr
LyoNCj4gPiArICogQXJtIEFyY2hpdGVjdHVyZSBzdXBwb3J0IGxheWVyIGZvciBOVU1BLg0KPiA+
ICsgKg0KPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjEgQXJtIEx0ZA0KPiA+ICsgKg0KPiA+ICsg
KiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQg
YW5kL29yIG1vZGlmeQ0KPiA+ICsgKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5l
cmFsIFB1YmxpYyBMaWNlbnNlIHZlcnNpb24gMiBhcw0KPiA+ICsgKiBwdWJsaXNoZWQgYnkgdGhl
IEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbi4NCj4gPiArICoNCj4gPiArICogVGhpcyBwcm9ncmFt
IGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsDQo+ID4g
KyAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdh
cnJhbnR5IG9mDQo+ID4gKyAqIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJ
Q1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUNCj4gPiArICogR05VIEdlbmVyYWwgUHVibGljIExpY2Vu
c2UgZm9yIG1vcmUgZGV0YWlscy4NCj4gPiArICoNCj4gPiArICogWW91IHNob3VsZCBoYXZlIHJl
Y2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UNCj4gPiArICog
YWxvbmcgd2l0aCB0aGlzIHByb2dyYW0uIElmIG5vdCwgc2VlIDxodHRwOi8vd3d3LmdudS5vcmcv
bGljZW5zZXMvPi4NCj4gPiArICoNCj4gPiArICovDQo+ID4gKyNpbmNsdWRlIDx4ZW4vaW5pdC5o
Pg0KPiA+ICsjaW5jbHVkZSA8eGVuL251bWEuaD4NCj4gPiArDQo+ID4gK3N0YXRpYyB1aW50OF90
IF9fcmVhZF9tb3N0bHkNCj4gPiArbm9kZV9kaXN0YW5jZV9tYXBbTUFYX05VTU5PREVTXVtNQVhf
TlVNTk9ERVNdID0gew0KPiA+ICsgICAgeyAwIH0NCj4gPiArfTsNCj4gPiArDQo+ID4gK3ZvaWQg
X19pbml0IG51bWFfc2V0X2Rpc3RhbmNlKG5vZGVpZF90IGZyb20sIG5vZGVpZF90IHRvLCB1aW50
MzJfdA0KPiBkaXN0YW5jZSkNCj4gPiArew0KPiA+ICsgICAgaWYgKCBmcm9tID49IE1BWF9OVU1O
T0RFUyB8fCB0byA+PSBNQVhfTlVNTk9ERVMgKQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIHBy
aW50ayhLRVJOX1dBUk5JTkcNCj4gPiArICAgICAgICAgICAgICAgIk5VTUE6IGludmFsaWQgbm9k
ZXM6IGZyb209JSJQUkl1OCIgdG89JSJQUkl1OCINCj4gTUFYPSUiUFJJdTgiXG4iLA0KPiA+ICsg
ICAgICAgICAgICAgICBmcm9tLCB0bywgTUFYX05VTU5PREVTKTsNCj4gPiArICAgICAgICByZXR1
cm47DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICsgICAgLyogTlVNQSBkZWZpbmVzIDB4ZmYgYXMg
YW4gdW5yZWFjaGFibGUgbm9kZSBhbmQgMC05IGFyZSB1bmRlZmluZWQNCj4gKi8NCj4gPiArICAg
IGlmICggZGlzdGFuY2UgPj0gTlVNQV9OT19ESVNUQU5DRSB8fA0KPiA+ICsgICAgICAgIChkaXN0
YW5jZSA+PSBOVU1BX0RJU1RBTkNFX1VERl9NSU4gJiYNCj4gPiArICAgICAgICAgZGlzdGFuY2Ug
PD0gTlVNQV9ESVNUQU5DRV9VREZfTUFYKSB8fA0KPiA+ICsgICAgICAgIChmcm9tID09IHRvICYm
IGRpc3RhbmNlICE9IE5VTUFfTE9DQUxfRElTVEFOQ0UpICkNCj4gPiArICAgIHsNCj4gPiArICAg
ICAgICBwcmludGsoS0VSTl9XQVJOSU5HDQo+ID4gKyAgICAgICAgICAgICAgICJOVU1BOiBpbnZh
bGlkIGRpc3RhbmNlOiBmcm9tPSUiUFJJdTgiIHRvPSUiUFJJdTgiDQo+IGRpc3RhbmNlPSUiUFJJ
dTMyIlxuIiwNCj4gPiArICAgICAgICAgICAgICAgZnJvbSwgdG8sIGRpc3RhbmNlKTsNCj4gPiAr
ICAgICAgICByZXR1cm47DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICsgICAgbm9kZV9kaXN0YW5j
ZV9tYXBbZnJvbV1bdG9dID0gZGlzdGFuY2U7DQo+ID4gK30NCj4gPiArDQo+ID4gK3VpbnQ4X3Qg
X19ub2RlX2Rpc3RhbmNlKG5vZGVpZF90IGZyb20sIG5vZGVpZF90IHRvKQ0KPiA+ICt7DQo+ID4g
KyAgICAvKiBXaGVuIE5VTUEgaXMgb2ZmLCBhbnkgZGlzdGFuY2Ugd2lsbCBiZSB0cmVhdGVkIGFz
IHJlbW90ZS4gKi8NCj4gPiArICAgIGlmICggc3JhdF9kaXNhYmxlZCgpICkNCj4gDQo+IEdpdmVu
IHRoYXQgdGhpcyBpcyBBUk0gc3BlY2lmaWMgY29kZSBhbmQgc3BlY2lmaWMgdG8gQUNQSSwgSSBk
b24ndCB0aGluaw0KPiB3ZSBzaG91bGQgaGF2ZSBhbnkgY2FsbCB0byBzb21ldGhpbmcgY2FsbGVk
ICJzcmF0X2Rpc2FibGVkIi4NCj4gDQo+IEkgc3VnZ2VzdCB0byBlaXRoZXIgcmVuYW1lIHNyYXRf
ZGlzYWJsZWQgdG8gbnVtYV9kaXN0YW5jZV9kaXNhYmxlZC4NCj4gDQo+IE90aGVyIHRoYW4gdGhh
dCwgdGhpcyBwYXRjaCBsb29rcyBPSyB0byBtZS4NCj4gDQoNCnNyYXQgc3RhbmRzIGZvciBzdGF0
aWMgcmVzb3VyY2UgYWZmaW5pdHkgdGFibGUsIEkgdGhpbmsgZHRiIGFsc28gY2FuIGJlDQp0cmVh
dGVkIGFzIGEgc3RhdGljIHJlc291cmNlIGFmZmluaXR5IHRhYmxlLiBTbyBJIGtlZXAgU1JBVCBp
biB0aGlzIHBhdGNoDQphbmQgb3RoZXIgcGF0Y2hlcy4gSSBoYXZlIHNlZW4geW91ciBjb21tZW50
IGluIHBhdGNoIzI1LiBCZWZvcmUgeDg2IG1haW50YWluZXJzDQpnaXZlIGFueSBmZWVkYmFjaywg
Y2FuIHdlIHN0aWxsIGtlZXAgc3JhdCBoZXJlPw0KDQo+IA0KPiA+ICsgICAgICAgIHJldHVybiBO
VU1BX1JFTU9URV9ESVNUQU5DRTsNCj4gPiArDQo+ID4gKyAgICAvKg0KPiA+ICsgICAgICogQ2hl
Y2sgd2hldGhlciB0aGUgbm9kZXMgYXJlIGluIHRoZSBtYXRyaXggcmFuZ2UuDQo+ID4gKyAgICAg
KiBXaGVuIGFueSBub2RlIGlzIG91dCBvZiByYW5nZSwgZXhjZXB0IGZyb20gYW5kIHRvIG5vZGVz
IGFyZSB0aGUNCj4gPiArICAgICAqIHNhbWUsIHdlIHRyZWF0IHRoZW0gYXMgdW5yZWFjaGFibGUg
KHJldHVybiAweEZGKQ0KPiA+ICsgICAgICovDQo+ID4gKyAgICBpZiAoIGZyb20gPj0gTUFYX05V
TU5PREVTIHx8IHRvID49IE1BWF9OVU1OT0RFUyApDQo+ID4gKyAgICAgICAgcmV0dXJuIGZyb20g
PT0gdG8gPyBOVU1BX0xPQ0FMX0RJU1RBTkNFIDogTlVNQV9OT19ESVNUQU5DRTsNCj4gPiArDQo+
ID4gKyAgICByZXR1cm4gbm9kZV9kaXN0YW5jZV9tYXBbZnJvbV1bdG9dOw0KPiA+ICt9DQo+ID4g
K0VYUE9SVF9TWU1CT0woX19ub2RlX2Rpc3RhbmNlKTsNCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUvYXNtLWFybS9udW1hLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL251bWEuaA0KPiA+IGlu
ZGV4IDIxNTY5ZTYzNGIuLjc1OGVhZmViMDUgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2luY2x1ZGUv
YXNtLWFybS9udW1hLmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL251bWEuaA0KPiA+
IEBAIC05LDggKzksMjEgQEAgdHlwZWRlZiB1OCBub2RlaWRfdDsNCj4gPg0KPiA+ICAjaWZkZWYg
Q09ORklHX05VTUENCj4gPg0KPiA+ICsvKg0KPiA+ICsgKiBJbiBBQ1BJIHNwZWMsIDAtOSBhcmUg
dGhlIHJlc2VydmVkIHZhbHVlcyBmb3Igbm9kZSBkaXN0YW5jZSwNCj4gPiArICogMTAgaW5kaWNh
dGVzIGxvY2FsIG5vZGUgZGlzdGFuY2UsIDIwIGluZGljYXRlcyByZW1vdGUgbm9kZQ0KPiA+ICsg
KiBkaXN0YW5jZS4gU2V0IG5vZGUgZGlzdGFuY2UgbWFwIGluIGRldmljZSB0cmVlIHdpbGwgZm9s
bG93DQo+ID4gKyAqIHRoZSBBQ1BJJ3MgZGVmaW5pdGlvbi4NCj4gPiArICovDQo+ID4gKyNkZWZp
bmUgTlVNQV9ESVNUQU5DRV9VREZfTUlOICAgMA0KPiA+ICsjZGVmaW5lIE5VTUFfRElTVEFOQ0Vf
VURGX01BWCAgIDkNCj4gPiArI2RlZmluZSBOVU1BX0xPQ0FMX0RJU1RBTkNFICAgICAxMA0KPiA+
ICsjZGVmaW5lIE5VTUFfUkVNT1RFX0RJU1RBTkNFICAgIDIwDQo+ID4gKw0KPiA+ICAjZGVmaW5l
IE5SX05PREVfTUVNQkxLUyBOUl9NRU1fQkFOS1MNCj4gPg0KPiA+ICtleHRlcm4gdm9pZCBudW1h
X3NldF9kaXN0YW5jZShub2RlaWRfdCBmcm9tLCBub2RlaWRfdCB0bywgdWludDMyX3QNCj4gZGlz
dGFuY2UpOw0KPiA+ICsNCj4gPiAgI2Vsc2UNCj4gPg0KPiA+ICAvKiBGYWtlIG9uZSBub2RlIGZv
ciBub3cuIFNlZSBhbHNvIG5vZGVfb25saW5lX21hcC4gKi8NCj4gPiAtLQ0KPiA+IDIuMjUuMQ0K
PiA+DQo=

