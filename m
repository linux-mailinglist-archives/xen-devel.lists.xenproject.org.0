Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6E07CAAAE
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 16:01:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617622.960388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsO9I-0002eP-TY; Mon, 16 Oct 2023 14:00:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617622.960388; Mon, 16 Oct 2023 14:00:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsO9I-0002b6-QY; Mon, 16 Oct 2023 14:00:48 +0000
Received: by outflank-mailman (input) for mailman id 617622;
 Mon, 16 Oct 2023 14:00:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4UvS=F6=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qsO9H-0002aw-Bf
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 14:00:47 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060a.outbound.protection.outlook.com
 [2a01:111:f400:fe16::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66a8172c-6c2c-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 16:00:45 +0200 (CEST)
Received: from DU2PR04CA0013.eurprd04.prod.outlook.com (2603:10a6:10:3b::18)
 by GV1PR08MB8619.eurprd08.prod.outlook.com (2603:10a6:150:83::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 14:00:38 +0000
Received: from DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::54) by DU2PR04CA0013.outlook.office365.com
 (2603:10a6:10:3b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35 via Frontend
 Transport; Mon, 16 Oct 2023 14:00:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT064.mail.protection.outlook.com (100.127.143.3) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.19 via Frontend Transport; Mon, 16 Oct 2023 14:00:38 +0000
Received: ("Tessian outbound 0ae75d4034ba:v211");
 Mon, 16 Oct 2023 14:00:38 +0000
Received: from 1418b5d91621.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 47B5BDD2-50C3-4D87-8129-683F9AE16F8A.1; 
 Mon, 16 Oct 2023 14:00:32 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1418b5d91621.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 16 Oct 2023 14:00:32 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM9PR08MB6002.eurprd08.prod.outlook.com (2603:10a6:20b:2d6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Mon, 16 Oct
 2023 14:00:30 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::30ea:681d:5fa7:8bfb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::30ea:681d:5fa7:8bfb%2]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 14:00:30 +0000
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
X-Inumbo-ID: 66a8172c-6c2c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTZBtSU+qddVOLpEL3KDqDvexbdmKSpMGDXAspaFxaw=;
 b=t98KdB/DGfPFMBQJoC/089EKhjMmggH2jmf6vvGRjd9GVqRsQ6MBYMeb67XXoXn/f+mqbzqwM511UXl9NbBk+VFH11Lv8Xsq7F4sZ7h50lqPWXejczrG9fxqbNH2jy3cM/LTzAkBT4rCFNrYE1bimDXQCcuKHQeOVHmCJPBF8LA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f89f466739baa070
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jIi8vH4OrcbbW07ezP35YNbESPXA0kWq4ucWvFWHISLcwXD9uW3MUVQHRy/raaBrp8HcWUk6BcQJX9TTyylrwEb5YoxFQMcyxgruw6A62ZgoV+aHKpyuzi95gIMlU5IKyTWoz6bt0aiU34u4zwELUvsTEG1ZeawmJvLoVn2XkPM4h88tymSQ/UALOEOytjBWnKKB9vUHr6xHwkpeHqnIKD02MD15jrdFyG/5jf/YRrZjQrYQ7OnGO3pYNCo7xaQrTL3sy+60Gzp3JOYpNSaPxXPPqapUQNO+p7R7pSDQ1NIaKmOrEEti5efVeEFicIkhaHbAsWbO80H+49cfVhO+rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTZBtSU+qddVOLpEL3KDqDvexbdmKSpMGDXAspaFxaw=;
 b=AwjuDPTj7Pg2oc9lBSUD0ELQf4CiRp98bOw+CNWnWJ6h7c6Sbd39f19c9L3sMFpmsJOkBXk63y+SqJX85mhwfSs1ImtZZ1j34yfJ3iNZ+P682O62UWQYF1Xr9RmQcEbW9Fyv+M20OJ+2SlGWdCFtEiMcAWSTuoBtTpeqyCMkIzjF148bPoBlN0CopDyvpaUavsQPQFWifOQh7E8LIOaepQglu/oJNF471ff0/+vPjIvpMtHPY/k5F55yGzrRiIhs5vtMnP541ua51KO+qKerP7M6+WJosn0yGiT+EIEzPIdHiRdIE9+URrW5GzoGoL39BfOOnqqlMv7PMNb+pJv8Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTZBtSU+qddVOLpEL3KDqDvexbdmKSpMGDXAspaFxaw=;
 b=t98KdB/DGfPFMBQJoC/089EKhjMmggH2jmf6vvGRjd9GVqRsQ6MBYMeb67XXoXn/f+mqbzqwM511UXl9NbBk+VFH11Lv8Xsq7F4sZ7h50lqPWXejczrG9fxqbNH2jy3cM/LTzAkBT4rCFNrYE1bimDXQCcuKHQeOVHmCJPBF8LA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Michal Orzel <michal.orzel@amd.com>, "leo.yan@linaro.org"
	<leo.yan@linaro.org>, Xen-devel <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Alexey Klimov <alexey.klimov@linaro.org>, Luca
 Fancellu <Luca.Fancellu@arm.com>, Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: [PATCH v4 2/2] xen/arm: Enlarge identity map space to 10TB
Thread-Topic: [PATCH v4 2/2] xen/arm: Enlarge identity map space to 10TB
Thread-Index: AQHZ/dCeetLGz4GvX0qAhZnpE9HtkrBMHj+AgABWt4CAAAGagA==
Date: Mon, 16 Oct 2023 14:00:30 +0000
Message-ID: <8BCB97B4-CBDD-43D9-B0F8-7F637B8BE559@arm.com>
References: <20231013122658.1270506-1-leo.yan@linaro.org>
 <20231013122658.1270506-3-leo.yan@linaro.org>
 <169101f8-0475-45b1-b2c2-60dadd88d3f0@amd.com>
 <5a5e960b-e6fd-4617-b33a-10cf07f5bb52@xen.org>
In-Reply-To: <5a5e960b-e6fd-4617-b33a-10cf07f5bb52@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM9PR08MB6002:EE_|DBAEUR03FT064:EE_|GV1PR08MB8619:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cdb9483-5553-46ea-af74-08dbce5046cd
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2Y67JEtS7Vdo3K8oIHbMW+zp37KTjwIqLJbDvCNXxmGnQthF14zTfunCHxXrGR+Ksl/NWaFUnZN0obu9wb3VkRv9rEgFMW9R37blVxofiVHSgmXNYd8n/ysYvZnNN8097QeK+9ojU8GuMBc+rzDakXxDS9zpa7BP+tP4+IRo//J1sBPvsH7LVjlenMxAOjzOKfaYu6SgEar6G+WlqIA9rDerJ4goP+HW5qC1U3jFfr06F3H0Ek5GxBaJbikd5UmzsqCfuySXNwH3gY081i3vmS2WdIeytJz60JPk+y3w/1AmKWH4dhFeuGj110yrFR7YrUiHg1Yr1ZgMxdeHO5fir+qzFYhwHQpqZgEWMciJbtNYRlqlLNCjD6SDEMl/Jb8zddldRSaL9pyGfhd5PPuy53Oqt1qAkE/bjgNZxyEFX/zMHArR2M/hf4fS7su0JUd8I1x47/rNBt/HVZOEh7jotWmhJIqx0RsbP/y6nSv86poIfP2cjnyxVcfHunDfUkbDQvhUiPbPTGdxaQqq7pu3rNQvSaL2DZbD6HpH3u0nyfW3tEgxZu0chTvOPzS5nPdQDoGcWwvNatVgDMv34PnoDNHowGnOE/fw5Wzt1VObW76hhNom0nV1b0z6k8VCrHH7aNoIKaOV4P2oyv20UQigMgepq+erGwkBJr72Bot7MeA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(346002)(396003)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(26005)(71200400001)(6512007)(6506007)(2616005)(53546011)(38100700002)(122000001)(33656002)(86362001)(36756003)(38070700005)(83380400001)(2906002)(66446008)(64756008)(66946007)(76116006)(66556008)(91956017)(478600001)(54906003)(66476007)(6486002)(4326008)(8936002)(8676002)(5660300002)(41300700001)(6916009)(316002)(147533002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F8ACE5D084877946AB8E4253F5D250E5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6002
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7dcd4b85-4cbe-4205-38ba-08dbce5041e1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	irzXjCqNIJah6rfiTp8EvXEcOPZrzMnc4fcQHhGJJud6xvADThlIDhqW6c3pAGk23fj9fJefWeRUQOAZ5Cy0Ao4WHnsrleXvlkjWXOEcToDUrgV2qgz8RG80bKcoPafaiC2Q0nnMNHgvGvHKXkOluiY5pMxL1gfV86HezQYE+2sAnbETGlI+WBo+doFJudGXyZqsy4G0n508Dt58Q87S6kSnNsl/UrhPF9qDMhQNC4ni3Ocko8yJEFJ10JcM5wZ1J7j/0FyypTn4QFNYtDo/UCXcm/SxATkE/FpL9wyrcYnFqZ71SIFaJqrDyXbR6ghDjGgxgulTecs+m5SjGJH4kU0pB1NFRB0bEi1mOQE+v43DjA60lTn+er+gfV0aIW8UMDc1gyzhnl4zxBN/k75q2bg9TOM94UlvmSKAfWJQ3qVH6SGrGWt1jfUoiO1lIVQMGtlKQksHGUbxZmxnXY8rkNv9SJAa/rTe2ExcvQUgttUjNe5GT81hVauTg4/lXp4/Hvx3lOWDEgP6gq/RO3oAndQDqmD+aVwruAzt/JRg2IkQSMkzcdfJTFdGUN2EVDKGYKx4poLZ55FU3EOm036fwj9gHuOjsVeCEtUjvIjcD3Afbqna6tM4HXSy0IsTh5IsnmW4J6cCDnrH76uPI3C7zaYktPCpwkQXD3tN8/K9iogzO723By6eF4OzYN4IzFZxSv5/BvlHWqA6Hb5ox8xTsE2xG4EDa0G/SQj/Z6vhfBo=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(186009)(1800799009)(64100799003)(82310400011)(451199024)(36840700001)(46966006)(316002)(6486002)(478600001)(70586007)(54906003)(70206006)(26005)(336012)(2616005)(53546011)(6506007)(6512007)(6862004)(8676002)(8936002)(4326008)(2906002)(5660300002)(41300700001)(33656002)(36756003)(81166007)(86362001)(47076005)(356005)(36860700001)(83380400001)(82740400003)(40480700001)(147533002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 14:00:38.3491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cdb9483-5553-46ea-af74-08dbce5046cd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8619

SGkNCiANCitMdWNhIGFuZCBSYWh1bA0KDQo+IE9uIDE2IE9jdCAyMDIzLCBhdCAxNTo1NCwgSnVs
aWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDE2LzEw
LzIwMjMgMDk6NDQsIE1pY2hhbCBPcnplbCB3cm90ZToNCj4+IEhpLA0KPiANCj4gSGksDQo+IA0K
Pj4gT24gMTMvMTAvMjAyMyAxNDoyNiwgTGVvIFlhbiB3cm90ZToNCj4+PiANCj4+PiANCj4+PiBP
biBBRExpbmsgQVZBIHBsYXRmb3JtIChBbXBlcmUgQWx0cmEgU29DIHdpdGggMzIgQXJtIE5lb3Zl
cnNlIE4xIGNvcmVzKSwNCj4+PiB0aGUgcGh5c2ljYWwgbWVtb3J5IHJlZ2lvbnMgYXJlOg0KPj4+
IA0KPj4+ICAgRFJBTSBtZW1vcnkgcmVnaW9uczoNCj4+PiAgICAgTm9kZVswXSBSZWdpb25bMF06
IDB4MDAwMDgwMDAwMDAwIC0gMHgwMDAwZmZmZmZmZmYNCj4+PiAgICAgTm9kZVswXSBSZWdpb25b
MV06IDB4MDgwMDAwMDAwMDAwIC0gMHgwODAwN2ZmZmZmZmYNCj4+PiAgICAgTm9kZVswXSBSZWdp
b25bMl06IDB4MDgwMTAwMDAwMDAwIC0gMHgwODA3ZmZmZmZmZmYNCj4+PiANCj4+PiBUaGUgVUVG
SSBsb2FkcyBYZW4gaHlwZXJ2aXNvciBhbmQgRFRCIGludG8gdGhlIGhpZ2ggbWVtb3J5LCB0aGUg
a2VybmVsDQo+Pj4gYW5kIHJhbWRpc2sgaW1hZ2VzIGFyZSBsb2FkZWQgaW50byB0aGUgbG93IG1l
bW9yeSBzcGFjZToNCj4+PiANCj4+PiAgIChYRU4pIE1PRFVMRVswXTogMDAwMDA4MDdmNmRmMDAw
MCAtIDAwMDAwODA3ZjZmM2UwMDAgWGVuDQo+Pj4gICAoWEVOKSBNT0RVTEVbMV06IDAwMDAwODA3
ZjgwNTQwMDAgLSAwMDAwMDgwN2Y4MDU2MDAwIERldmljZSBUcmVlDQo+Pj4gICAoWEVOKSBNT0RV
TEVbMl06IDAwMDAwMDAwZmE4MzQwMDAgLSAwMDAwMDAwMGZjNWRlMWQ1IFJhbWRpc2sNCj4+PiAg
IChYRU4pIE1PRFVMRVszXTogMDAwMDAwMDBmYzVkZjAwMCAtIDAwMDAwMDAwZmZiM2Y4MTAgS2Vy
bmVsDQo+Pj4gDQo+Pj4gSW4gdGhpcyBjYXNlLCB0aGUgWGVuIGJpbmFyeSBpcyBsb2FkZWQgYWJv
dmUgOFRCLCB3aGljaCBleGNlZWRzIHRoZQ0KPj4+IG1heGltdW0gc3VwcG9ydGVkIGlkZW50aXR5
IG1hcCBzcGFjZSBvZiAyVEIgaW4gWGVuLiBDb25zZXF1ZW50bHksIHRoZQ0KPj4+IHN5c3RlbSBm
YWlscyB0byBib290Lg0KPj4+IA0KPj4+IFRoaXMgcGF0Y2ggZW5sYXJnZXMgaWRlbnRpdHkgbWFw
IHNwYWNlIHRvIDEwVEIsIGFsbG93aW5nIG1vZHVsZSBsb2FkaW5nDQo+Pj4gd2l0aGluIHRoZSBy
YW5nZSBvZiBbMHgwIC4uIDB4MDAwMDA5ZmZfZmZmZl9mZmZmXS4NCj4+PiANCj4+PiBGaXhlczog
MWM3OGQ3NmI2NyAoInhlbi9hcm02NDogbW06IEludHJvZHVjZSBoZWxwZXJzIHRvIHByZXBhcmUv
ZW5hYmxlL2Rpc2FibGUiKQ0KPj4gSSBkb24ndCB0aGluayBhIGZpeGVzIHRhZyBhcHBsaWVzIGhl
cmUgZ2l2ZW4gdGhhdCAyVEIgd2FzIGp1c3QgYSBudW1iZXIgd2UgYmVsaWV2ZWQgaXMgZW5vdWdo
DQo+PiBhbmQgYWxsIG9mIHRoaXMgaXMgcGxhdGZvcm0gZGVwZW5kZW50Lg0KPj4gVGhpcyBjYW4g
YmUgZHJvcHBlZCBvbiBjb21taXQgaWYgY29tbWl0dGVyIGFncmVlcw0KPiBYZW4gbWF5IGhhdmUg
Ym9vdGVkIG9uIHRoYXQgcGxhdGZvcm0gYmVmb3JlIGhhbmQuIFNvIHRoaXMgd291bGQgYmUgY29u
c2lkZXJlZCBhIHJlZ3Jlc3Npb24gYW5kIHRoZXJlZm9yZSBhIHRhZyB3b3VsZCBiZSB3YXJyYW50
Lg0KPiANCj4gQUZBSUNULCB0aGUgY29tbWl0IGlzIG9ubHkgcHJlc2VudCBvbiB0aGUgdXBjb21p
bmcgNC4xOC4gU28gdGhlIHF1ZXN0aW9uIGlzIHdoZXRoZXIgWGVuIDQuMTcgYm9vdGVkIG91dC1v
Zi10aGUtYm94IG9uIEFETGluaz8gSWYgdGhlIGFuc3dlciBpcyB5ZXMsIHRoZW4gd2UgbmVlZCB0
byBhZGQgYSBGaXhlcyB0YWcuIEJ1dCB0aGUgY29ycmVjdCBvbmUgd291bGQgYmUNCj4gDQoNCkBS
YWh1bCBvciBMdWNhOiBjb3VsZCB5b3UgZ2l2ZSBhbiBhbnN3ZXIgaGVyZSA/DQpJIGtub3cgeW91
IHVzZWQgWGVuIG9uIGFuIEFWQSBwbGF0Zm9ybSBidXQgd2FzIGl0IGJvb3Rpbmcgb3V0IG9mIHRo
ZSBib3ggPw0KDQo+IO+7vzFjNzhkNzZiNjdlMSAoInhlbi9hcm02NDogbW06IEludHJvZHVjZSBo
ZWxwZXJzIHRvIHByZXBhcmUvZW5hYmxlL2Rpc2FibGUgdGhlIGlkZW50aXR5IG1hcHBpbmciKS4N
Cj4gDQo+IFdlIHdvdWxkIGFsc28gbmVlZCB0byBjb25zaWRlciBpdCBhcyBhIGNhbmRpZGF0ZSBm
b3IgWGVuIDQuMTggYmVjYXVzZSB3ZSB3b3VsZCByZWdyZXNzIGJvb3Qgb24gQURMaW5rLg0KDQpB
Y2sNCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVs
aWVuIEdyYWxsDQoNCg0K

