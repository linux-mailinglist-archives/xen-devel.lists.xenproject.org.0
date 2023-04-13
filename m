Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 640536E0D93
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 14:41:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520692.808553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmwFY-0003MT-F9; Thu, 13 Apr 2023 12:40:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520692.808553; Thu, 13 Apr 2023 12:40:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmwFY-0003JW-Br; Thu, 13 Apr 2023 12:40:28 +0000
Received: by outflank-mailman (input) for mailman id 520692;
 Thu, 13 Apr 2023 12:40:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vvgu=AE=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pmwFW-0003JQ-Tt
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 12:40:26 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060d.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bca9401-d9f8-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 14:40:23 +0200 (CEST)
Received: from DB8PR04CA0017.eurprd04.prod.outlook.com (2603:10a6:10:110::27)
 by DB9PR08MB9681.eurprd08.prod.outlook.com (2603:10a6:10:45c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Thu, 13 Apr
 2023 12:40:21 +0000
Received: from DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::89) by DB8PR04CA0017.outlook.office365.com
 (2603:10a6:10:110::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.31 via Frontend
 Transport; Thu, 13 Apr 2023 12:40:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT034.mail.protection.outlook.com (100.127.142.97) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.31 via Frontend Transport; Thu, 13 Apr 2023 12:40:21 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Thu, 13 Apr 2023 12:40:21 +0000
Received: from 4ec3420f14fc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8C77334E-929B-45AD-9867-4B675EFF8411.1; 
 Thu, 13 Apr 2023 12:40:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4ec3420f14fc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Apr 2023 12:40:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM8PR08MB6500.eurprd08.prod.outlook.com (2603:10a6:20b:361::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 12:40:13 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 12:40:13 +0000
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
X-Inumbo-ID: 5bca9401-d9f8-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ka1TPzcvs3wzjFmSld0UHQItCpr3ZxdcmEzmyQ6RIU=;
 b=xgHEBrnEB8nQOsInbiEUtLqgUaBjPAZU6k06+3H4OqEPP0/2m840OIuExlekdmLk92YvUjHOX+zYfoA3thcrn91Xc28LxoDQajIUuwhraR9XhTuNfUVn7NQh9jPVYBIESM/ln41pYAkVnwas4/+lxANa9prksnhxmpqP3o/DDZ4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FG9y0t9VkxUd3tv0sx4/MJVTUQw03TJKIEtymlJ3QCeLLMdVLe9XrlLv23iGaXE/wVpXeeFYlZP4iL79fFbC8IYZxF7SpUtirmHX2cSTxgdiilOQhDxSe/b5MFVnk31JiYaXSA5aheS0FIc/MnHUii5GnX0ojL7xJY+GGASl1vVEKMHDfmj6zACPqHP+spJr551hEsc3UTfaf48TAfMfld/bOTGyj7MBfMaXa7qKWjnrgIhu4lRbezN7HFqWXPSLixilkJMJvyKV5IgS1nvZUYVeWdHQz+sqZLitUKh6j7bkzPl7/e7plCzVw0hBtXXjzRaUIa8+H/3PBZcGkQUxvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ka1TPzcvs3wzjFmSld0UHQItCpr3ZxdcmEzmyQ6RIU=;
 b=gWsAIRSljjuDWRKXkXOPth0oM3/gqNAaiJ3+UT9/1AV7fth6fHXdP9CjV9OQlfcKytPO6yxe3swIW0otfXgchlC53VdLOvRUAYxT+4W4IVth/XpE4DeyJOUlUaBKBaCLTrtHdbD2AVYV/P3VlyRNEgo/D1QE3hZQCyHbiYJjQZQUzDeMYXrwUzozs7+cK6j+q5Tjtqf8H9Jrz5OuXdBAlvfFIaxHy7/YT/GlRtG070usl1PoNUxunH9xUZ+qf+Rx6hTl0WBMY3xeHXrNlrl8ux+Ek83lFg9G9oCT6I/OWUETg0EOtL6Fx6gS42qyVnK+jRgmB1y8IFkZvpsTKOH6oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ka1TPzcvs3wzjFmSld0UHQItCpr3ZxdcmEzmyQ6RIU=;
 b=xgHEBrnEB8nQOsInbiEUtLqgUaBjPAZU6k06+3H4OqEPP0/2m840OIuExlekdmLk92YvUjHOX+zYfoA3thcrn91Xc28LxoDQajIUuwhraR9XhTuNfUVn7NQh9jPVYBIESM/ln41pYAkVnwas4/+lxANa9prksnhxmpqP3o/DDZ4=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, Jens Wiklander <jens.wiklander@linaro.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: RE: [XEN PATCH v8 08/22] xen/arm: ffa: add support for FFA_ID_GET
Thread-Topic: [XEN PATCH v8 08/22] xen/arm: ffa: add support for FFA_ID_GET
Thread-Index: AQHZbdfdlkWasQb0b0OUu0VnJOxcoK8pEVxwgAAcEICAAABzkA==
Date: Thu, 13 Apr 2023 12:40:13 +0000
Message-ID:
 <AS8PR08MB7991D8EA176982B9D6780C3A92989@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-9-jens.wiklander@linaro.org>
 <AS8PR08MB7991020B2BB9676DACD2494392989@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <137a1457-aacc-e763-b313-4266be3fa032@xen.org>
In-Reply-To: <137a1457-aacc-e763-b313-4266be3fa032@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 1CA69413958B9B4CBF580C8ADA194074.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM8PR08MB6500:EE_|DBAEUR03FT034:EE_|DB9PR08MB9681:EE_
X-MS-Office365-Filtering-Correlation-Id: 838fd2dc-af41-41a8-91cd-08db3c1c3ed9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 j6V0MDx3IHi+Cl40rz/jcWeq1t4CX6lUKVA+50qRPSUVTBhG7sYZVExU81trri93G/JVUDW9edpyT+orWqofaaL7Bp6m0IxfduWJeWQAdaXtK8nSfxrsohbC4iz4PcMUVbNzIDBqX34rOhxTt86MKDFlF63SMB5BOKb9of5J7vDzKygsu+MV5Mv9o0c5Vk5NOkDl58bdZmA1kFsQmFhuBldUSzqpJZu2o3c1T0UW1gi+FVkCj9OdSEJMS2ML6ejLfUhhtnMo4vimxXJLZHK8J7AsLlmPV+0b4TEci0gE2wV6DGNMYCBLPUDtG9sWAck3lSxUP1oz9yUoSrNqbqqCHleqh7jCdPsIScWt8FHkCjGTghMILKg+gaZ4WqJ3QaDU1el+aA1p5QFH/pdXL+cCH9WB6Qkb48VjuHJtKv7E0clVJsmc41epy5CpOwQLxuKr9MdQQHGYbsE+/ymyvEdIQHhiVZzbqu785OhOu/R0F/7jPMCWeAf7ZqMKMkSXz3GU6afA+bgCN3LFqVQ9SwKrQDhOnkPEE9pr8b1IbgVrktdApAa2okoLCSoxrh0u4XKL2sxURrVKX/g1CaMQlvPJr83o+owc+LguGUjvW4vOBi7Ofm7hvkRdi+OhaoSO28nG
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(451199021)(66476007)(316002)(66946007)(76116006)(64756008)(66446008)(4326008)(83380400001)(7696005)(478600001)(54906003)(110136005)(8936002)(8676002)(41300700001)(38100700002)(66556008)(71200400001)(122000001)(52536014)(38070700005)(5660300002)(4744005)(2906002)(186003)(9686003)(26005)(6506007)(86362001)(33656002)(55016003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6500
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e0d4c870-0d90-4a93-f82b-08db3c1c3a4d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bxd7BhhsE/XYXTqoz2PLm/zzNOiP8fWNannp+lLMIOUsLcLBYuF6PlY3KHIorQddgKIgfw+Jaa4rBcH0xdVqn9/Jro01JCGSrYkjaB44mzMtpONZE2eTY2ewpmiSSNNDHNbCW7vwtZXlrKifVNYXBtWawxPIlSFFrnleMtdAz9JnHQA3cYdkPChR3itpkjessltCF/1JJC9C62WoQhNPv572EAzDF+tyGtHqnY1Hbfb4uiEQrYOSbxeqmAMxGcxqoaodLekpBUQohx/gxYvDJGsTaMz3I6BxGTzpibeXN8+2TOzzHeT/tDNjEvKGeG1HouoJnctAQkced7p9k+kzG1T1zVTuCqLw4ZB8UU3YiJxC/Wny7BsTevZtqp5WKwOJiIl4kfdhHShwtbj0wk1w0S7/jesFvtlJrfIv0+6uYPx4/9qSYNnEcX0FsC5NFRX0OQPIp/95ya8cU7Tr8n1w7kKY+YlA7D7tOHBSQfgLgVQUo2aeJ2aKR+WEZ9FuZUlWbSleLxg49g+o7FDqF21Z17S3qGc1y8alwKaGC5cDzSrplFgBe5JC+gFE6oYy+s8yhtjPBdE5Rc/3ioTmjQ3aSGg9gQJuFBlP8kwC6KM/xN/XXdrsZlax4vC0Q6Hm1lWzWeR+kaYLW8LbGZQgrbNIuiDLKgJr/nv1WTtpC1Y/uw3f6FfNqKjOTsKdoNR9CxWP4SpYa5q9X1bxHRm/bUtZ4A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(478600001)(41300700001)(82310400005)(36860700001)(86362001)(316002)(54906003)(8676002)(70586007)(70206006)(4326008)(110136005)(7696005)(8936002)(52536014)(5660300002)(40460700003)(4744005)(336012)(186003)(356005)(81166007)(82740400003)(33656002)(9686003)(26005)(6506007)(83380400001)(2906002)(47076005)(40480700001)(55016003)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 12:40:21.4097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 838fd2dc-af41-41a8-91cd-08db3c1c3ed9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9681

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbWEVOIFBBVENIIHY4IDA4
LzIyXSB4ZW4vYXJtOiBmZmE6IGFkZCBzdXBwb3J0IGZvciBGRkFfSURfR0VUDQo+ID4+ICtzdGF0
aWMgdWludDE2X3QgZ2V0X3ZtX2lkKGNvbnN0IHN0cnVjdCBkb21haW4gKmQpDQo+ID4+ICt7DQo+
ID4+ICsgICAgLyogKzEgc2luY2UgMCBpcyByZXNlcnZlZCBmb3IgdGhlIGh5cGVydmlzb3IgaW4g
RkYtQSAqLw0KPiA+PiArICAgIHJldHVybiBkLT5kb21haW5faWQgKyAxOw0KPiA+DQo+ID4gU2lu
Y2UgaGVyZSB5b3Ugd2FudCAwIHRvIGJlIHJlc2VydmVkLCBJIHRoaW5rIG1heWJlIHlvdSBjYW4g
dXNlDQo+ID4gdGhlICJkLT5hcmNoLnAybS52bWlkIj8gQWNjb3JkaW5nIHRvIHRoZSBsb2dpYyBp
biBwMm1fYWxsb2Nfdm1pZCgpLA0KPiA+IHRoZSAiZC0+YXJjaC5wMm0udm1pZCIgaXMgYWxzbyBh
IHBlci1kb21haW4gdTE2IHZhbHVlIHRoYXQgc3RhcnRzDQo+ID4gZnJvbSAxLg0KPiANCj4gSSB3
b3VsZCByYXRoZXIgbm90IGRvIHRoYXQgZm9yIGEgZmV3IHJlYXNvbnM6DQo+ICAgMSkgVGhpcyBp
cyBhc3N1bWluZyB0aGUgUDJNIGNvZGUgaXMgaW5pdGlhbGl6ZWQgZmlyc3QNCj4gICAyKSBXZSBz
aG91bGQgbm90IHJlbHkgb24gdGhlIFZNSUQgdG8gYmUgZml4ZWQuIFdlIG1heSBuZWVkIHRvIGNo
YW5nZQ0KPiB0aGF0IGlmIHdlIHdhbnQgdG8gcnVuIG1vcmUgVk1zIHRoYW4gdGhlIG51bWJlciBv
ZiBWTUlEcyAod2UgbWF5IGV2ZW4NCj4gbmVlZCBtdWx0aXBsZSBWTUlEcyBwZXIgZG9tYWluLi4u
KS4NCg0KWWVhaCB0aGVzZSBhcmd1bWVudHMgYXJlIHJlYXNvbmFibGUuIEZvcmdldCBhYm91dCBt
eSBjb21tZW50cyB0aGVuLg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiBDaGVlcnMs
DQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

