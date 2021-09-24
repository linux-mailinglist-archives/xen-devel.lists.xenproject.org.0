Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD39416F9B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 11:52:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195150.347711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThsq-0004oV-PG; Fri, 24 Sep 2021 09:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195150.347711; Fri, 24 Sep 2021 09:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThsq-0004kB-Km; Fri, 24 Sep 2021 09:52:44 +0000
Received: by outflank-mailman (input) for mailman id 195150;
 Fri, 24 Sep 2021 09:52:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OJ83=OO=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mThso-0004iI-GB
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 09:52:42 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.72]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 279b250e-1d1d-11ec-bab9-12813bfff9fa;
 Fri, 24 Sep 2021 09:52:40 +0000 (UTC)
Received: from AM6P194CA0015.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::28)
 by DBAPR08MB5591.eurprd08.prod.outlook.com (2603:10a6:10:1ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Fri, 24 Sep
 2021 09:52:38 +0000
Received: from AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::7c) by AM6P194CA0015.outlook.office365.com
 (2603:10a6:209:90::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Fri, 24 Sep 2021 09:52:38 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by AM5EUR03FT056.mail.protection.outlook.com (10.152.17.224) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 09:52:37 +0000
Received: ("Tessian outbound c9f4ff96a6ad:v103");
 Fri, 24 Sep 2021 09:52:37 +0000
Received: from ed9a0c2bc179.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6A16684F-4741-488E-974B-82E59013C166.1; 
 Fri, 24 Sep 2021 09:52:27 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ed9a0c2bc179.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Sep 2021 09:52:27 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB4646.eurprd08.prod.outlook.com (2603:10a6:10:f5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Fri, 24 Sep
 2021 09:52:25 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 09:52:25 +0000
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
X-Inumbo-ID: 279b250e-1d1d-11ec-bab9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2CgbX7qgYVadUbPgfACKmpkBOnaL4nN85Fl11zIlLY=;
 b=APXRYfkztN0/mxf1Xr5a5Hy6iCUFKDPnmQcds/RTIESNMiRhV9X9jqKhqWxSYGxDjLWQZIYHWWKzM12l4izkiu4fHP6JeI4z/WOXA8racYCL2t0FyrWhstlVq7M1727dJS1fSuaT78yG3rtoQkGi1g/GxUfAfSoxtHDLhfa3bTo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LwNoiH5ugdh+G9Lnq4EXS8Q6X2YaSPW50ksZzZlU0xHZq/wolceynjuQ0TNs5QZOQlB8jL3Jb4bPTFVaxaHiVI638Z7qMrm4Cug5lae9oFW1uqgh3DzlFV2ppDYNjgg7K+yXya33pdplKKyyMSgrEzf/7CjFy5AibJ2pG2HqLURtTNHtALK2bK3ZbvihSx+JVet9h4jy/NF2GOCtyQKdq82Bq0XqT+/7blS/olu3fz/Fi3SdWC1HBWJyhUkHtqL2Ly7c5cxlHEzHdupgWnDaCpWaAsaev8QmybcdJ6v8FJvcWyAfRUmgAjCPyAmAyGRZ+oN/HxjpULRjSAmpYvaQug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=L2CgbX7qgYVadUbPgfACKmpkBOnaL4nN85Fl11zIlLY=;
 b=gcKdxM5xC65XY6pRR7DsFHyN6cyi269tNxSABmIeXL13wxOv02F8D2X4wHHWWgiGyueDjzYGFC/kfV40i0/AIopBoJxLt1dQOuFv5MC+5C8v30R3KBVruH7oqQVynPIlg0VKkitZjVc/LkhYBt3BCiFwKiAf131Ci9ugg27tVVIGKhFFBNC/Zt2YWY5WqKVOFOSfFFI/puJsXwdWCp0iwGnWKj9pQz+CcZtexAaUYnUS55yuNRgLY2gEIDciysAryPCfqC1bQbu9sT/vPqVYW80bRs9JQpP9LuwdDlwR+x/FJ2u2TXum71zxm1n2GTo9kr9jQeziqAyxDJ7uwy6a/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2CgbX7qgYVadUbPgfACKmpkBOnaL4nN85Fl11zIlLY=;
 b=APXRYfkztN0/mxf1Xr5a5Hy6iCUFKDPnmQcds/RTIESNMiRhV9X9jqKhqWxSYGxDjLWQZIYHWWKzM12l4izkiu4fHP6JeI4z/WOXA8racYCL2t0FyrWhstlVq7M1727dJS1fSuaT78yG3rtoQkGi1g/GxUfAfSoxtHDLhfa3bTo=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [PATCH 34/37] xen/arm: enable device tree based NUMA in system
 init
Thread-Topic: [PATCH 34/37] xen/arm: enable device tree based NUMA in system
 init
Thread-Index: AQHXsHM8PJZnWMzeQUKgL4OJKEMnLKuyh4oAgABLdGA=
Date: Fri, 24 Sep 2021 09:52:25 +0000
Message-ID:
 <DB9PR08MB6857ACA0C3C2FD59EC6FF5559EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-35-wei.chen@arm.com>
 <alpine.DEB.2.21.2109232021270.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109232021270.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F2E682EDD10EDE479AD17DE1B3B33138.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 394df3af-3ade-402d-fdd9-08d97f410ac9
x-ms-traffictypediagnostic: DBBPR08MB4646:|DBAPR08MB5591:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB559175F87394DB702050A9B99EA49@DBAPR08MB5591.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3968;OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 S+aVtYXtRxRM+r82EHuzYzoDJn5YW1UjhOR629kQC68faFGCzn84YMv7LWY4iBEbu9qWTAYb65cqGL+416MaIULHSah4lICNQCkZB788yepEpnPX7j1JsvdVfFmFZGjfv/Wip/nn6Ip8KnN4bQmOOwYUbdIQwXEwguRR8jnAbS5k+qlTwC8usWxl0OJLT3Bz9FnSrx7/DBZ3xJSmPIjnhhNvQyAodb7e4pxgBnHnXr2xSJJ8uQ4BzclHFM9G9ZJv8Kw6/U0GkZ+oVuXOi/44g5nmm1o8+S+ThKlDL4kVbDvVa3bJTubZIqcmZRyjja1I4AJd4LF8CRSsgMbtDQuQM9i3HMmNgPTaRpDycTQRIbOVY0prV/r8LdabU2bvbJdyHH2LOwKXlbxRZ+BmdQ5k2Hg1vEXORgW+nLG5cPbXBMG8t/Q+pj3i9BEzhvOy5Er+r4vm/KZGMgVqEx9XNF4mcbwyshWIfqB1C7YzFaij+TdUgi+wW83bwRIyuFwJP7jPUReJR35l+JA2zmpHuNjzkvH5JjcWy9TNppbMIBNAh9GYBxuAoj9dO1zTeviys2CADPcicL8qoynxqQhpUtCDei/yNxoBcJWkFyq2bhnvA58ScWVnkFVTOl2Dd0hCzmmovg9CRj7MPRZwh9B80VDoelgMRSuhipdezXCtVVkt014PNQ2xUpENy64abeSud/NaRi+8JAtUW6BCsk0a2azY3A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(53546011)(6506007)(86362001)(66446008)(7696005)(186003)(66946007)(4326008)(26005)(76116006)(66556008)(64756008)(316002)(55016002)(8676002)(66476007)(5660300002)(9686003)(38070700005)(83380400001)(6916009)(71200400001)(2906002)(33656002)(508600001)(122000001)(52536014)(8936002)(54906003)(38100700002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4646
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	04fa6e02-dd0a-4ae3-d0bb-08d97f41033d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NgoS0dT7mcSdafJJh0q3NHtUUIHapnchsPpBVP1f4LSYhsfHJhjtnc5NtsWMwVZ50S0g7Ki3mZ4JptDkOtueCwfBaivgoeuZuoK1FEDoHtF36lR2eFQcyOntYn2Hu7qzrDM04rpsmD6TXmNV2s3KDidGJjLtITnKh47r9+p8eJLRm6hKgn/Eqoc0PNOdpfW0P6FncaqSBSzL81c1WW6pu0eah2zenCv9HpV9m8ATidZ640K3rsTTGIvzFkl9ytW2ykBk8AgzhfFh9PVYuFhEpn2H4FdyVvlSQLRtk9Eu+Mi6Mk6i2iKLW9XR6NiTD9sExtSzMWKFofnjMCUIe9DSSNI7TZUOl8uYFX+6qq+Tq7tSnMdF2xXVV2QccAxKQV+zlp6JoaXko024ejZrtoXvrJW6/LyBnCotwws5jd49nYeC38kjUF5x0/gCJ/DL1QHWovJv2n2rhTEryPRfmVJvDc0DY86+RInePEWsoOB6dQ516wj3PnW/C4NSYMfJ9lTpS1A8rB5BStW/61T3Hl9i09C18kAgs4T+f+gnCJaLSOZIgHbl6ROlUHNX8IvOLRUBJRyha/I9MaX8amu6cgUOZsumOlcFshrAbdC17LMkrU53bAhjHsH/VwIdE5p4wqKQTs8zfgHFJ9XNpIBCWOZNNiEYeidEpN6GG3rTRQm4RsNwKrikV7JrEiZpk4Q5GXkivIKr3FXEkILFdzfBFHjHuA==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(9686003)(4326008)(2906002)(336012)(508600001)(356005)(8936002)(54906003)(26005)(81166007)(55016002)(7696005)(47076005)(186003)(6862004)(70206006)(8676002)(70586007)(82310400003)(33656002)(52536014)(5660300002)(86362001)(316002)(83380400001)(36860700001)(6506007)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:52:37.9497
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 394df3af-3ade-402d-fdd9-08d97f410ac9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5591

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjHE6jnU
wjI0yNUgMTE6MjgNCj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPg0KPiBDYzogeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxp
ZW5AeGVuLm9yZzsNCj4gQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDM0LzM3XSB4ZW4vYXJtOiBlbmFibGUgZGV2aWNlIHRy
ZWUgYmFzZWQgTlVNQSBpbg0KPiBzeXN0ZW0gaW5pdA0KPiANCj4gT24gVGh1LCAyMyBTZXAgMjAy
MSwgV2VpIENoZW4gd3JvdGU6DQo+ID4gSW4gdGhpcyBwYXRjaCwgd2UgY2FuIHN0YXJ0IHRvIGNy
ZWF0ZSBOVU1BIHN5c3RlbSB0aGF0IGlzDQo+ID4gYmFzZWQgb24gZGV2aWNlIHRyZWUuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4NCj4gPiAtLS0N
Cj4gPiAgeGVuL2FyY2gvYXJtL251bWEuYyAgICAgICAgfCA1NSArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKw0KPiA+ICB4ZW4vYXJjaC9hcm0vc2V0dXAuYyAgICAgICB8ICA3
ICsrKysrDQo+ID4gIHhlbi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5oIHwgIDYgKysrKysNCj4gPiAg
MyBmaWxlcyBjaGFuZ2VkLCA2OCBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL251bWEuYyBiL3hlbi9hcmNoL2FybS9udW1hLmMNCj4gPiBpbmRleCA3ZjA1
Mjk5Yjc2Li5kN2EzZDMyZDRiIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9udW1hLmMN
Cj4gPiArKysgYi94ZW4vYXJjaC9hcm0vbnVtYS5jDQo+ID4gQEAgLTE4LDggKzE4LDEwIEBADQo+
ID4gICAqDQo+ID4gICAqLw0KPiA+ICAjaW5jbHVkZSA8eGVuL2luaXQuaD4NCj4gPiArI2luY2x1
ZGUgPHhlbi9kZXZpY2VfdHJlZS5oPg0KPiA+ICAjaW5jbHVkZSA8eGVuL25vZGVtYXNrLmg+DQo+
ID4gICNpbmNsdWRlIDx4ZW4vbnVtYS5oPg0KPiA+ICsjaW5jbHVkZSA8eGVuL3Bmbi5oPg0KPiA+
DQo+ID4gIHN0YXRpYyB1aW50OF90IF9fcmVhZF9tb3N0bHkNCj4gPiAgbm9kZV9kaXN0YW5jZV9t
YXBbTUFYX05VTU5PREVTXVtNQVhfTlVNTk9ERVNdID0gew0KPiA+IEBAIC04NSw2ICs4Nyw1OSBA
QCB1aW50OF90IF9fbm9kZV9kaXN0YW5jZShub2RlaWRfdCBmcm9tLCBub2RlaWRfdCB0bykNCj4g
PiAgfQ0KPiA+ICBFWFBPUlRfU1lNQk9MKF9fbm9kZV9kaXN0YW5jZSk7DQo+ID4NCj4gPiArdm9p
ZCBfX2luaXQgbnVtYV9pbml0KGJvb2wgYWNwaV9vZmYpDQo+ID4gK3sNCj4gPiArICAgIHVpbnQz
Ml90IGlkeDsNCj4gPiArICAgIHBhZGRyX3QgcmFtX3N0YXJ0ID0gfjA7DQo+IA0KPiBJTlZBTElE
X1BBRERSDQo+IA0KDQpPaCwgeWVzDQoNCj4gDQo+ID4gKyAgICBwYWRkcl90IHJhbV9zaXplID0g
MDsNCj4gPiArICAgIHBhZGRyX3QgcmFtX2VuZCA9IDA7DQo+ID4gKw0KPiA+ICsgICAgLyogTlVN
QSBoYXMgYmVlbiB0dXJuZWQgb2ZmIHRocm91Z2ggWGVuIHBhcmFtZXRlcnMgKi8NCj4gPiArICAg
IGlmICggbnVtYV9vZmYgKQ0KPiA+ICsgICAgICAgIGdvdG8gbWVtX2luaXQ7DQo+ID4gKw0KPiA+
ICsgICAgLyogSW5pdGlhbGl6ZSBOVU1BIGZyb20gZGV2aWNlIHRyZWUgd2hlbiBzeXN0ZW0gaXMg
bm90IEFDUEkgYm9vdGVkDQo+ICovDQo+ID4gKyAgICBpZiAoIGFjcGlfb2ZmICkNCj4gPiArICAg
IHsNCj4gPiArICAgICAgICBpbnQgcmV0ID0gbnVtYV9kZXZpY2VfdHJlZV9pbml0KGRldmljZV90
cmVlX2ZsYXR0ZW5lZCk7DQo+ID4gKyAgICAgICAgaWYgKCByZXQgKQ0KPiA+ICsgICAgICAgIHsN
Cj4gPiArICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAiSW5pdCBOVU1BIGZyb20gZGV2aWNlIHRyZWUgZmFpbGVkLCByZXQ9JWRcbiIsIHJl
dCk7DQo+IA0KPiBBcyBJIG1lbnRpb25lZCBpbiBvdGhlciBwYXRjaGVzIHdlIG5lZWQgdG8gZGlz
dGluZ3Vpc2ggYmV0d2VlbiB0d28NCj4gY2FzZXM6DQo+IA0KPiAxKSBOVU1BIGluaXRpYWxpemF0
aW9uIGZhaWxlZCBiZWNhdXNlIG5vIE5VTUEgaW5mb3JtYXRpb24gaGFzIGJlZW4gZm91bmQNCj4g
MikgTlVNQSBpbml0aWFsaXphdGlvbiBmYWlsZWQgYmVjYXVzZSB3cm9uZy9pbmNvbnNpc3RlbnQg
TlVNQSBpbmZvIGhhcw0KPiAgICBiZWVuIGZvdW5kDQo+IA0KPiBJbiBjYXNlIG9mIDEpLCB3ZSBw
cmludCBub3RoaW5nLiBNYXliZSBhIHNpbmdsZSBYRU5MT0dfREVCVUcgbWVzc2FnZS4NCj4gSW4g
Y2FzZSBvZiAyKSwgYWxsIHRoZSB3YXJuaW5ncyBhcmUgZ29vZCB0byBwcmludC4NCj4gDQo+IA0K
PiBJbiB0aGlzIGNhc2UsIGlmIHJldCAhPSAwIGJlY2F1c2Ugb2YgMiksIHRoZW4gaXQgaXMgZmlu
ZSB0byBwcmludCB0aGlzDQo+IHdhcm5pbmcuIEJ1dCBpdCBsb29rcyBsaWtlIGNvdWxkIGJlIHRo
YXQgcmV0IGlzIC1FSU5WQUwgc2ltcGx5IGJlY2F1c2UgYQ0KPiBDUFUgbm9kZSBkb2Vzbid0IGhh
dmUgbnVtYS1ub2RlLWlkLCB3aGljaCBpcyBhIG5vcm1hbCBjb25kaXRpb24gZm9yDQo+IG5vbi1O
VU1BIG1hY2hpbmVzLg0KPiANCg0KWWVzLCB3ZSBzaG91bGQgaGF2ZSB0byBkaXN0aW5ndWlzaCB0
aGVzZSB0d28gY2FzZXMuIEkgd2lsbCB0cnkgdG8gYWRkcmVzcw0KaXQgaW4gbmV4dCB2ZXJzaW9u
Lg0KDQo+IA0KPiA+ICsgICAgICAgICAgICBudW1hX29mZiA9IHRydWU7DQo+ID4gKyAgICAgICAg
fQ0KPiA+ICsgICAgfQ0KPiA+ICsgICAgZWxzZQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIC8q
IFdlIGRvbid0IHN1cHBvcnQgTlVNQSBmb3IgQUNQSSBib290IGN1cnJlbnRseSAqLw0KPiA+ICsg
ICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORw0KPiA+ICsgICAgICAgICAgICAgICAiQUNQSSBO
VU1BIGhhcyBub3QgYmVlbiBzdXBwb3J0ZWQgeWV0LCBOVU1BIG9mZiFcbiIpOw0KPiA+ICsgICAg
ICAgIG51bWFfb2ZmID0gdHJ1ZTsNCj4gPiArICAgIH0NCj4gPiArDQo+ID4gK21lbV9pbml0Og0K
PiA+ICsgICAgLyoNCj4gPiArICAgICAqIEZpbmQgdGhlIG1pbmltYWwgYW5kIG1heGltdW0gYWRk
cmVzcyBvZiBSQU0sIE5VTUEgd2lsbA0KPiA+ICsgICAgICogYnVpbGQgYSBtZW1vcnkgdG8gbm9k
ZSBtYXBwaW5nIHRhYmxlIGZvciB0aGUgd2hvbGUgcmFuZ2UuDQo+ID4gKyAgICAgKi8NCj4gPiAr
ICAgIHJhbV9zdGFydCA9IGJvb3RpbmZvLm1lbS5iYW5rWzBdLnN0YXJ0Ow0KPiA+ICsgICAgcmFt
X3NpemUgID0gYm9vdGluZm8ubWVtLmJhbmtbMF0uc2l6ZTsNCj4gPiArICAgIHJhbV9lbmQgICA9
IHJhbV9zdGFydCArIHJhbV9zaXplOw0KPiA+ICsgICAgZm9yICggaWR4ID0gMSA7IGlkeCA8IGJv
b3RpbmZvLm1lbS5ucl9iYW5rczsgaWR4KysgKQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIHBh
ZGRyX3QgYmFua19zdGFydCA9IGJvb3RpbmZvLm1lbS5iYW5rW2lkeF0uc3RhcnQ7DQo+ID4gKyAg
ICAgICAgcGFkZHJfdCBiYW5rX3NpemUgPSBib290aW5mby5tZW0uYmFua1tpZHhdLnNpemU7DQo+
ID4gKyAgICAgICAgcGFkZHJfdCBiYW5rX2VuZCA9IGJhbmtfc3RhcnQgKyBiYW5rX3NpemU7DQo+
ID4gKw0KPiA+ICsgICAgICAgIHJhbV9zaXplICA9IHJhbV9zaXplICsgYmFua19zaXplOw0KPiA+
ICsgICAgICAgIHJhbV9zdGFydCA9IG1pbihyYW1fc3RhcnQsIGJhbmtfc3RhcnQpOw0KPiA+ICsg
ICAgICAgIHJhbV9lbmQgICA9IG1heChyYW1fZW5kLCBiYW5rX2VuZCk7DQo+ID4gKyAgICB9DQo+
ID4gKw0KPiA+ICsgICAgbnVtYV9pbml0bWVtX2luaXQoUEZOX1VQKHJhbV9zdGFydCksIFBGTl9E
T1dOKHJhbV9lbmQpKTsNCj4gPiArICAgIHJldHVybjsNCj4gDQo+IE5vIG5lZWQgZm9yIHJldHVy
bg0KPiANCg0KT2ssIEkgd2lsbCByZW1vdmUgaXQuDQoNCj4gDQo+ID4gK30NCj4gPiArDQo+ID4g
IHVpbnQzMl90IF9faW5pdCBhcmNoX21lbWluZm9fZ2V0X25yX2Jhbmsodm9pZCkNCj4gPiAgew0K
PiA+ICAJcmV0dXJuIGJvb3RpbmZvLm1lbS5ucl9iYW5rczsNCj4gPiBkaWZmIC0tZ2l0IGEveGVu
L2FyY2gvYXJtL3NldHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYw0KPiA+IGluZGV4IDFmMGZi
Yzk1YjUuLjYwOTc4NTA2ODIgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL3NldHVwLmMN
Cj4gPiArKysgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYw0KPiA+IEBAIC05MDUsNiArOTA1LDEzIEBA
IHZvaWQgX19pbml0IHN0YXJ0X3hlbih1bnNpZ25lZCBsb25nDQo+IGJvb3RfcGh5c19vZmZzZXQs
DQo+ID4gICAgICAvKiBQYXJzZSB0aGUgQUNQSSB0YWJsZXMgZm9yIHBvc3NpYmxlIGJvb3QtdGlt
ZSBjb25maWd1cmF0aW9uICovDQo+ID4gICAgICBhY3BpX2Jvb3RfdGFibGVfaW5pdCgpOw0KPiA+
DQo+ID4gKyAgICAvKg0KPiA+ICsgICAgICogVHJ5IHRvIGluaXRpYWxpemUgTlVNQSBzeXN0ZW0s
IGlmIGZhaWxlZCwgdGhlIHN5c3RlbSB3aWxsDQo+ID4gKyAgICAgKiBmYWxsYmFjayB0byB1bmlm
b3JtIHN5c3RlbSB3aGljaCBtZWFucyBzeXN0ZW0gaGFzIG9ubHkgMQ0KPiA+ICsgICAgICogTlVN
QSBub2RlLg0KPiA+ICsgICAgICovDQo+ID4gKyAgICBudW1hX2luaXQoYWNwaV9kaXNhYmxlZCk7
DQo+ID4gKw0KPiA+ICAgICAgZW5kX2Jvb3RfYWxsb2NhdG9yKCk7DQo+ID4NCj4gPiAgICAgIC8q
DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5oIGIveGVuL2luY2x1
ZGUvYXNtLWFybS9udW1hLmgNCj4gPiBpbmRleCBmNDZlOGUyOTM1Li41YjAzZGRlODdmIDEwMDY0
NA0KPiA+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5oDQo+ID4gKysrIGIveGVuL2lu
Y2x1ZGUvYXNtLWFybS9udW1hLmgNCj4gPiBAQCAtMjQsNiArMjQsNyBAQCB0eXBlZGVmIHU4IG5v
ZGVpZF90Ow0KPiA+DQo+ID4gIGV4dGVybiB2b2lkIG51bWFfc2V0X2Rpc3RhbmNlKG5vZGVpZF90
IGZyb20sIG5vZGVpZF90IHRvLCB1aW50MzJfdA0KPiBkaXN0YW5jZSk7DQo+ID4gIGV4dGVybiBp
bnQgbnVtYV9kZXZpY2VfdHJlZV9pbml0KGNvbnN0IHZvaWQgKmZkdCk7DQo+ID4gK2V4dGVybiB2
b2lkIG51bWFfaW5pdChib29sIGFjcGlfb2ZmKTsNCj4gPg0KPiA+ICAjZWxzZQ0KPiA+DQo+ID4g
QEAgLTQ3LDYgKzQ4LDExIEBAIGV4dGVybiBtZm5fdCBmaXJzdF92YWxpZF9tZm47DQo+ID4gICNk
ZWZpbmUgbm9kZV9zdGFydF9wZm4obmlkKSAobWZuX3goZmlyc3RfdmFsaWRfbWZuKSkNCj4gPiAg
I2RlZmluZSBfX25vZGVfZGlzdGFuY2UoYSwgYikgKDIwKQ0KPiA+DQo+ID4gK3N0YXRpYyBpbmxp
bmUgdm9pZCBudW1hX2luaXQoYm9vbCBhY3BpX29mZikNCj4gPiArew0KPiA+ICsNCj4gPiArfQ0K
PiA+ICsNCj4gPiAgc3RhdGljIGlubGluZSB2b2lkIG51bWFfYWRkX2NwdShpbnQgY3B1KQ0KPiA+
ICB7DQo+ID4NCj4gPiAtLQ0KPiA+IDIuMjUuMQ0KPiA+DQo=

