Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 777A9417058
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 12:31:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195237.347872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTiUE-0001Q3-Ln; Fri, 24 Sep 2021 10:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195237.347872; Fri, 24 Sep 2021 10:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTiUE-0001N1-IE; Fri, 24 Sep 2021 10:31:22 +0000
Received: by outflank-mailman (input) for mailman id 195237;
 Fri, 24 Sep 2021 10:31:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OJ83=OO=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTiUD-0001Mv-Ek
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 10:31:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::61d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5a407a3-fc88-4bf0-8bb3-9a061a8f1cce;
 Fri, 24 Sep 2021 10:31:19 +0000 (UTC)
Received: from AM6P195CA0071.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::48)
 by VI1PR08MB3743.eurprd08.prod.outlook.com (2603:10a6:803:b5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Fri, 24 Sep
 2021 10:31:17 +0000
Received: from AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::10) by AM6P195CA0071.outlook.office365.com
 (2603:10a6:209:87::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Fri, 24 Sep 2021 10:31:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT012.mail.protection.outlook.com (10.152.16.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 10:31:17 +0000
Received: ("Tessian outbound 010023020eef:v103");
 Fri, 24 Sep 2021 10:31:15 +0000
Received: from 0f1836c68c29.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6B168DCE-86AF-4034-9BA1-8078932968B2.1; 
 Fri, 24 Sep 2021 10:31:04 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0f1836c68c29.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Sep 2021 10:31:04 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB8PR08MB4572.eurprd08.prod.outlook.com (2603:10a6:10:b0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 10:31:03 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 10:31:03 +0000
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
X-Inumbo-ID: f5a407a3-fc88-4bf0-8bb3-9a061a8f1cce
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNqoZ/UOsh2oKbYQi+6YlA+8uaNRduIatnzyl5VMi+o=;
 b=zol9dOqqdWCvKjYVYEj4aNR6B5Dtxz2eCKeroNyUskoG2L0pG9pvvxmxkn5OsYWilpD3wRmTtFou6PHoziIb6Z94fQL7C9p/bkLKARxbLlY/37MkVgFd3H3ygJaLLWmFjboSWLLoHaLsKwGdqcqi2rbntLnJGHEE/Qx9QHhzDPo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ty8STzCIhOTToQA73yRr23B4SKIY23S9XnbxUzwWs0u8RFAld3lBnA4C45nqafDLM/UPrV89qWm+qXUApwM4kT0r0IYk+wUZvqxPyMqJvZ87YSbr6TdJTkvMOf2PRzzvSBszJqrV9PavBiYtBfelCSuOHCszhsa+233YCua2I9qjInSEDzu0J9KAh7hGFgBxfkG99LlLTgwuZuNYBJ+F2fLdH33E5cwxQAGXKfpFnA683cXolPnAbdMUQd9YC1oIvGAAyNSuo7kguZrldhWc20W/8X+trneDrGcExH8+bsxWbllV+dg5IdaMPXEbY9OOUfWv4bvOPHv8AKt1bHocsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=DNqoZ/UOsh2oKbYQi+6YlA+8uaNRduIatnzyl5VMi+o=;
 b=NtIbFlRMeWqS+UDS8wWVONBEAFaf4KCyN//6nGWF4gOYnFm1FTwKzRcFALyk9yshrnCpNxOHbOCoUiTtZiIH//5SkabHJ5gEP/v58ouRaUeL4Xaa5vjYlntqvAOc3v3OxFaMx3lkT5X98nNHwnr0wNdwOhbwukAYIZRKMLf2WTK5g4wTAZHM92Ditbo1pizO+JhUPq/5+GDqXjdKy6gX+5zIxoguiM458BFZIJdLTaMVhgseqZoE13Acp5sGX2U0JSVQGDXuWZEfhUmAF+QtUyoSChLpNPpYonWSOLgJNudF94SrEcQ9JNrVBZZNhyC3qSf9XM5E52XT38wnfWWL+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNqoZ/UOsh2oKbYQi+6YlA+8uaNRduIatnzyl5VMi+o=;
 b=zol9dOqqdWCvKjYVYEj4aNR6B5Dtxz2eCKeroNyUskoG2L0pG9pvvxmxkn5OsYWilpD3wRmTtFou6PHoziIb6Z94fQL7C9p/bkLKARxbLlY/37MkVgFd3H3ygJaLLWmFjboSWLLoHaLsKwGdqcqi2rbntLnJGHEE/Qx9QHhzDPo=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: RE: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
Thread-Topic: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
Thread-Index: AQHXsHMtR+l18+MmpE6rl/RjSXTBgquyYmkAgAA2xQCAADnbAIAAKWhQ
Date: Fri, 24 Sep 2021 10:31:03 +0000
Message-ID:
 <DB9PR08MB685742B691E39FD3161BFE289EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-21-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231811420.17979@sstabellini-ThinkPad-T480s>
 <PAXPR08MB68640027443F267495804A529EA49@PAXPR08MB6864.eurprd08.prod.outlook.com>
 <b4433faf-bb70-d083-126c-0224da3d9a82@suse.com>
In-Reply-To: <b4433faf-bb70-d083-126c-0224da3d9a82@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5A6E1B38E53A0845A2F880F3D13691E8.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9515af94-1fb2-45f1-b919-08d97f467122
x-ms-traffictypediagnostic: DB8PR08MB4572:|VI1PR08MB3743:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB37434F79274B134132B63BA09EA49@VI1PR08MB3743.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ORUtDS7f6u1eFh9NNHozNAP/So6gEZgsaoyr5Pzqf38ukZ4QM4qVsNc4+gziSb3Xd0Boj8ha0uQ2XB7VeQ68mQGqyup7NCWZJjyvwzHep+Rr3ugFRRsRf356lP4EZlzNSVlHaOtAHsJzayt5HmVHO9+bssi46fm+a5tybznLjX4LPZzi+P3Df+M3OjPybmHROoqq0Ho9T/JdHAMiXc3a1vfEy/MhsjM1rkLVIjfIM+ZZHo/g9Cz6DuCzXT4TxX3+fkwE8HCZc8kY/tBgPY3MCzUy/f9QXofJB7kb910co9DMfABj1wz7qSNoezf9/wJU2jTXW0t5d/HDCdwgFwyQ08dvp3LhlLPmZJeO52JVqcxzoqXth+1u/x9vXgMV4fnDUNqJaWzBpST0x+b4Ki07eqyhkJ7TLpMgwtSGDuc6v9ef8ZZudm/VuvMz1OVZ162aKfAkIoHk4ybA9wpFlS2vcRfcg/xgDx4KQWZSe6m+9Wm7icUb2e7CPN1L60a+M+kpULHnw8+nPJp09Tswjpm+6m2hYJsNFLPsF9iB3UtOQfbBQDvLaAZZYPR6j0Ku0vpKVI+ZmFS5g/8H0mBjPGiBu2+SlJWypi5RKwMSbdqNTk22DgQHxvscYpuM5sfoc3Yh2eu60KsnmyP4VN1N0s8xGdEKxVLK1jQEBz5WPVjAmtd9HYYae6astEzJZplSq45aSPDSUzmdtIPLGEBIGyMu+w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(55016002)(5660300002)(316002)(38100700002)(508600001)(66946007)(66556008)(33656002)(6916009)(8936002)(2906002)(66446008)(52536014)(53546011)(86362001)(76116006)(9686003)(83380400001)(54906003)(6506007)(66476007)(186003)(38070700005)(71200400001)(4326008)(26005)(7696005)(122000001)(8676002)(64756008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4572
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e47acb85-86c8-47fb-d5e8-08d97f4668f7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9DCqyivwfR76XUNgFCtS2Uuvm3H68FRzRP2TVbIg3x5nt23s62MjHYYaheRVR6B0jKqLhVxytdUSMF9ArZYBKUiHjJwiZfvT8UNSXPDJkWS8u/0C1Eu6OJvn/YWZuTXi4LHazesjlZbermGpu7fwqCOFueHHHFqOvXqTYQHZpw094M8nuZST7k6RflqftcMsOa42ym68uTX3wbYdwvFGiWYiQTwc8rGvG47RkVvZQfvzlui0h5Gmr2mLUWgwqfMCiFeCb+GeaXZSqRWaUZgQqC7y3f+DLq+8Tsl8cAUnPrINW0ePMfU455eu+TDeSHmEEt2kCQrcbFFe5XWBKBRQ7N3vCJn7cZjLVNw9MlJUzC/TS5j3Gzk0lOjW3zfBD0OzamlJtuxU9VZFegIhYiWXraltbjdonfpDJGOvGey7B5pOHnYIqSNdTtwgfWue7xtaurF8/bBmEHqI1IAaqdIi+FPFzE6zoycScS15b6P/06VYcJbm0FbIL1ccsNp7qmXAVMjNzhyoIhCKOv4x6Vf9V0KG1UiDEelJ4rSN3SS7CFOr8R0HU0en14mHSPBTzLQ3lbuvxSo8ZOjMFzAM5eCEtqaK43scfsc/6GJC4SHSapJE1TkOhQMFpPHTnIRnXcxOf+9asfsIBN4V5qmr9TYNh8qiySccvbLGyazavfvno5arkgrrLkooca+sifK9l45JizhmpVHEa9kz0GtMBh9UWQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(26005)(36860700001)(2906002)(52536014)(55016002)(6506007)(6862004)(5660300002)(186003)(9686003)(8936002)(107886003)(82310400003)(8676002)(53546011)(86362001)(70586007)(7696005)(316002)(70206006)(47076005)(83380400001)(4326008)(508600001)(33656002)(336012)(54906003)(356005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 10:31:17.1555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9515af94-1fb2-45f1-b919-08d97f467122
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3743

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMcTqOdTCMjTI1SAxNTo1OQ0KPiBU
bzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmc7IGp1bGllbkB4ZW4ub3JnOyBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxCZXJ0cmFu
ZC5NYXJxdWlzQGFybS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMjAvMzddIHhlbjogaW50cm9kdWNlIENPTkZJ
R19FRkkgdG8gc3R1YiBBUEkgZm9yIG5vbi0NCj4gRUZJIGFyY2hpdGVjdHVyZQ0KPiANCj4gT24g
MjQuMDkuMjAyMSAwNjozNCwgV2VpIENoZW4gd3JvdGU6DQo+ID4+IEZyb206IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gPj4gU2VudDogMjAyMcTqOdTCMjTI
1SA5OjE1DQo+ID4+DQo+ID4+IE9uIFRodSwgMjMgU2VwIDIwMjEsIFdlaSBDaGVuIHdyb3RlOg0K
PiA+Pj4gLS0tIGEveGVuL2NvbW1vbi9LY29uZmlnDQo+ID4+PiArKysgYi94ZW4vY29tbW9uL0tj
b25maWcNCj4gPj4+IEBAIC0xMSw2ICsxMSwxNiBAQCBjb25maWcgQ09NUEFUDQo+ID4+PiAgY29u
ZmlnIENPUkVfUEFSS0lORw0KPiA+Pj4gIAlib29sDQo+ID4+Pg0KPiA+Pj4gK2NvbmZpZyBFRkkN
Cj4gPj4+ICsJYm9vbA0KPiA+Pg0KPiA+PiBXaXRob3V0IHRoZSB0aXRsZSB0aGUgb3B0aW9uIGlz
IG5vdCB1c2VyLXNlbGVjdGFibGUgKG9yIGRlLXNlbGVjdGFibGUpLg0KPiA+PiBTbyB0aGUgaGVs
cCBtZXNzYWdlIGJlbG93IGNhbiBuZXZlciBiZSBzZWVuLg0KPiA+Pg0KPiA+PiBFaXRoZXIgYWRk
IGEgdGl0bGUsIGUuZy46DQo+ID4+DQo+ID4+IGJvb2wgIkVGSSBzdXBwb3J0Ig0KPiA+Pg0KPiA+
PiBPciBmdWxseSBtYWtlIHRoZSBvcHRpb24gYSBzaWxlbnQgb3B0aW9uIGJ5IHJlbW92aW5nIHRo
ZSBoZWxwIHRleHQuDQo+ID4NCj4gPiBPSywgaW4gY3VycmVudCBYZW4gY29kZSwgRUZJIGlzIHVu
Y29uZGl0aW9uYWxseSBjb21waWxlZC4gQmVmb3JlDQo+ID4gd2UgY2hhbmdlIHJlbGF0ZWQgY29k
ZSwgSSBwcmVmZXIgdG8gcmVtb3ZlIHRoZSBoZWxwIHRleHQuDQo+IA0KPiBCdXQgdGhhdCdzIG5v
dCB0cnVlOiBBdCBsZWFzdCBvbiB4ODYgRUZJIGdldHMgY29tcGlsZWQgZGVwZW5kaW5nIG9uDQo+
IHRvb2wgY2hhaW4gY2FwYWJpbGl0aWVzLiBVbHRpbWF0ZWx5IHdlIG1heSBpbmRlZWQgd2FudCBh
IHVzZXINCj4gc2VsZWN0YWJsZSBvcHRpb24gaGVyZSwgYnV0IHVudGlsIHRoZW4gSSdtIGFmcmFp
ZCBoYXZpbmcgdGhpcyBvcHRpb24NCj4gYXQgYWxsIG1heSBiZSBtaXNsZWFkaW5nIG9uIHg4Ni4N
Cj4gDQoNCkkgY2hlY2sgdGhlIGJ1aWxkIHNjcmlwdHMsIHllcywgeW91J3JlIHJpZ2h0LiBGb3Ig
eDg2LCBFRkkgaXMgbm90IGENCnNlbGVjdGFibGUgb3B0aW9uIGluIEtjb25maWcuIEkgYWdyZWUg
d2l0aCB5b3UsIHdlIGNhbid0IHVzZSBLY29uZmlnDQpzeXN0ZW0gdG8gZGVjaWRlIHRvIGVuYWJs
ZSBFRkkgYnVpbGQgZm9yIHg4NiBvciBub3QuDQoNClNvIGhvdyBhYm91dCB3ZSBqdXN0IHVzZSB0
aGlzIEVGSSBvcHRpb24gZm9yIEFybSBvbmx5PyBCZWNhdXNlIG9uIEFybSwNCndlIGRvIG5vdCBo
YXZlIHN1Y2ggdG9vbGNoYWluIGRlcGVuZGVuY3kuDQoNCj4gSmFuDQoNCg==

