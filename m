Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C6762EFA6
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 09:36:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445486.700662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovwqI-0002qw-LF; Fri, 18 Nov 2022 08:35:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445486.700662; Fri, 18 Nov 2022 08:35:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovwqI-0002no-Hm; Fri, 18 Nov 2022 08:35:22 +0000
Received: by outflank-mailman (input) for mailman id 445486;
 Fri, 18 Nov 2022 08:35:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vb94=3S=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1ovwqG-0002ni-OV
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 08:35:21 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20630.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eca2a962-671b-11ed-8fd2-01056ac49cbb;
 Fri, 18 Nov 2022 09:35:19 +0100 (CET)
Received: from DB9PR06CA0015.eurprd06.prod.outlook.com (2603:10a6:10:1db::20)
 by VE1PR08MB5663.eurprd08.prod.outlook.com (2603:10a6:800:1a4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.8; Fri, 18 Nov
 2022 08:35:11 +0000
Received: from DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::d5) by DB9PR06CA0015.outlook.office365.com
 (2603:10a6:10:1db::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Fri, 18 Nov 2022 08:35:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT041.mail.protection.outlook.com (100.127.142.233) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 08:35:10 +0000
Received: ("Tessian outbound 6c699027a257:v130");
 Fri, 18 Nov 2022 08:35:10 +0000
Received: from 304967566076.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6CE536D8-7FB3-40F3-B373-7542C27BD48B.1; 
 Fri, 18 Nov 2022 08:34:59 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 304967566076.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Nov 2022 08:34:59 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com (2603:10a6:20b:523::11)
 by DBAPR08MB5831.eurprd08.prod.outlook.com (2603:10a6:10:1a8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 08:34:53 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::d34b:9a50:9e36:20f]) by AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::d34b:9a50:9e36:20f%3]) with mapi id 15.20.5834.006; Fri, 18 Nov 2022
 08:34:53 +0000
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
X-Inumbo-ID: eca2a962-671b-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFSG4MkciGbr4aNQsH1DMi4AeBS0ZN3LvgHSVbUhh1w=;
 b=YhOtD1hRGYWfsjwz7ng9nkBr4U28KrQ98MM8ei5AaO68VqJXtp2PskCiZIPAUTM8xNq2QDI2hq51l6wVZt0jOr/mfvNLHtC+iCf4+9w3xV+pO7w8PAQoqlLKhlvuQrhd+Kf1v8F5betgDhqb9sF30JwpOFXeFU/Kr+7jmif9jR4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JcqYOpo5PEVtuzyiP1G55hz2bBxkKB/sfKuRnitX0XZ34qvFzoxEK62LxBGn+Pr00JJw9GrhLGqmd7D0DDuPu9BM2P/LRURCUZqQN4yYgwgesVbdap7LtZsMArHBayG1SaCHka2GZwsfo63zEcyEGnuuC2TTutPXeYPeDE6oFppdL2+uYNojJV1mITY8u1SWN6hWb+7pIeTfp3syUmgDsGZDnIp4Qp1gpirGSka5/kXBjpDujmL22KIZKnxkDpRHZbPjO518Gvr8x4mOwyYPhHdVPzCuKs+dVEI/WpL2uxpvnsZMj51Qbpuz2Wrgp1F55OnwBKJEdNYDj6YHdjpqgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFSG4MkciGbr4aNQsH1DMi4AeBS0ZN3LvgHSVbUhh1w=;
 b=A19h0FXTi3lhFAZ4vggsxO3GpcD6dx7nMC5BJ6ql6KUyxqyrfffT/X8Q24TQ0wjVrj+Jr+Ya3tXl5jGaNu8nPLrA+pVul0uVD4y6ZmxOybfx/ZTSyDIGe1dA8w0SI9neTSzc9LEMtkjVAEJ2+EGzJRdRRtRl0kcqberqkqjQN35/IrqevztZvMcvXJP+HCdOC3JB4N7bWZWtuhv6hos5Zb2rZrC+BzbifhF+zcBJuQnXHkJn8EOa+Ag1SGNGlbNNrWza5A6VEaHRKz8KBUszanGITcYFJK81yEsQUpFSpV07e7uLCJNXADCYxDGi6HIMdIhsa52fkRjzBXUi9LmGLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFSG4MkciGbr4aNQsH1DMi4AeBS0ZN3LvgHSVbUhh1w=;
 b=YhOtD1hRGYWfsjwz7ng9nkBr4U28KrQ98MM8ei5AaO68VqJXtp2PskCiZIPAUTM8xNq2QDI2hq51l6wVZt0jOr/mfvNLHtC+iCf4+9w3xV+pO7w8PAQoqlLKhlvuQrhd+Kf1v8F5betgDhqb9sF30JwpOFXeFU/Kr+7jmif9jR4=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
Subject: RE: [PATCH] xen/arm: vpl011: Make access to DMACR write-ignore
Thread-Topic: [PATCH] xen/arm: vpl011: Make access to DMACR write-ignore
Thread-Index: AQHY+vGVwMcRKiwWvE6rnRakCwDYs65D8jVggABaT4CAAA4LcA==
Date: Fri, 18 Nov 2022 08:34:53 +0000
Message-ID:
 <AS8PR08MB7696D678D4224BB729D6FBD092099@AS8PR08MB7696.eurprd08.prod.outlook.com>
References: <20221118020013.125987-1-jiamei.xie@arm.com>
 <AS8PR08MB76963BD3ED96EE6F5314B70992099@AS8PR08MB7696.eurprd08.prod.outlook.com>
 <afb778af-398b-7bff-3af9-963395ea5f46@amd.com>
In-Reply-To: <afb778af-398b-7bff-3af9-963395ea5f46@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 561D6B2A5DB82340A8A320AEAA0F9E25.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7696:EE_|DBAPR08MB5831:EE_|DBAEUR03FT041:EE_|VE1PR08MB5663:EE_
X-MS-Office365-Filtering-Correlation-Id: ec05a832-6339-4f88-ba02-08dac93fce42
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 I5uARwfV1evLnMzawjm7rbbASSbeu+j6PEFH35rk/ccX1EDE/FstUFbDyOpNxknehoA9pu8COjoXdpWVahltlAi5l4GCDpKbuQ1/jwKXxVcOUVAGMELMoTU8tUr5x5U/y110He5gQMhG6Vg/N8BVcoemJuw/Gu5AqIT3Wecyl+TvbKHiMfelqV2tlBe0L6xiT3wB+AcodsXiIz8Au8qC39mI6WVM/Io3q5eAU4TBOEY4g0zEj7EGX5L3J0ku77NrmHdD5L7rgrH1D4JRdTGLJSxycbm4aaZcUWCpO6ZaTFYaVEmBJ4N4jh0yqlSsh0GF8rbl6PqHZ1J3XGgPgbZhuOs0FOpNvZPoC5/6ddwhDGqsstZdAIztbO9cNhlHY6zjVrdgsDbhTp0iw1apjfDFxZoLnDR0waAvJcrsFlcAajKdNx4eLtMcohwaalthDXXvi4JfT9MOD43rBejG7tnqXw0YohT3pQ4Ex7dXmqaoBzGeLjsG1BCUhm6BGvH/iUH4jFd5BQqyph05+qHDFXwaRTrQgweeAUrw3y9YmOSOXEEA/qwizS/VRJYCJ8+2SjP0whbfv+GxZcNXPUI4tQiyDjpNscvb1C/xmZ+JDPKcwZ8GdlZjSAkBCohPWiKy+e1QijGiUT3i3sneIH5TR1002VYbR6UKZ1nsFWb8sSIkMEL38srwEYDkITjMvUXt01XYbjWPBPrGhu3zRERPiz+nCg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(451199015)(33656002)(38100700002)(66946007)(8936002)(2906002)(4326008)(38070700005)(4744005)(86362001)(122000001)(83380400001)(54906003)(316002)(186003)(110136005)(64756008)(478600001)(52536014)(76116006)(5660300002)(8676002)(66556008)(41300700001)(66446008)(66476007)(9686003)(7696005)(53546011)(26005)(71200400001)(55016003)(6506007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5831
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7afd9f3d-fd2b-4c01-0fbf-08dac93fc404
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XqTAq8jaxuscRhDhQNyoMLNgS9hHuEFYKoxu9SzLEYCUnTCogGf0ENAqFE0r+6GVz5tDQ9RMZ0eZOj7NIz1Lk4XQm5EK0ql2Ll8NFLPy+wOde60A65cFHUu23MmeHnWclPt5PLYSSINA5vi4IKQx07SJd0TqkFwdnyaAY9gPD/goXXg5L9tDznPUka7tCIL0BHf4SEKT0AC7XG1kMlVyYay8fj7s54iBB4KkKjVemj0FJY7EOLgrXhpi3ga+bIINvNwJVG9BYf2XEcVMEoz983S6eOXxP3L4M95k+PhcROMFnofRZwzfkp+/QO/uZ9Uo8IUMnbIEz5tExKIYESX7/4PToTcq63BfSc6jR1dWcumJOd9OZTo9BF/+dANe5cd4AreQVn6kMU8YeFq6NY58muxkVGGFvMj8fiO6RjxJMmHwEP14gcmCnYfZmXh1ocAAOJ7TRD8PY4xhfm9VHaO+HyhGODFF3qsyuA719cJk16QD30PVkP/CcSe4j7lnQqjWMXE/vItMK3MZQA1YLiHFyzJ2VxRJ+88bBIuUNPeeEkVuNi61w+2mIrnNh4vEOVfJZgiWSbF7E+4+sb8GFc+qCtLg3VDwKAi65pESGcUDjR9ySu3r7nynsQlBmm1T0gQ2oZoX0hImN++On8t532XBTLl2ePeJr7ZlJeYjId5Z6G8v1hltPG1NklPGYRwNxmkd3bSNmsyVMNrFNoP5kjCaIg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199015)(36840700001)(46966006)(40470700004)(53546011)(82310400005)(86362001)(6506007)(7696005)(9686003)(26005)(478600001)(54906003)(110136005)(316002)(40460700003)(186003)(47076005)(336012)(356005)(81166007)(8676002)(70206006)(70586007)(4326008)(41300700001)(40480700001)(8936002)(55016003)(52536014)(4744005)(5660300002)(33656002)(36860700001)(2906002)(82740400003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 08:35:10.6792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec05a832-6339-4f88-ba02-08dac93fce42
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5663

SGkgTWljaGFs77yMDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWlj
aGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNvbT4NCj4gU2VudDogRnJpZGF5LCBOb3ZlbWJl
ciAxOCwgMjAyMiAzOjQyIFBNDQo+IFRvOiBKaWFtZWkgWGllIDxKaWFtZWkuWGllQGFybS5jb20+
OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+
Ow0KPiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBWb2xvZHlt
eXIgQmFiY2h1aw0KPiA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+OyBXZWkgQ2hlbiA8V2Vp
LkNoZW5AYXJtLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0geGVuL2FybTogdnBsMDExOiBN
YWtlIGFjY2VzcyB0byBETUFDUiB3cml0ZS1pZ25vcmUNCj4gDQo+IEhpIEppYW1laSwNCj4gDQo+
IE9uIDE4LzExLzIwMjIgMDM6MTgsIEppYW1laSBYaWUgd3JvdGU6DQo+ID4NCj4gPg0KPiA+IEhp
DQo+ID4NCj4gPiBTb3JyeSB0aGVyZSBpcyBubyBzdWJqZWN0IGluIHRoZSAgbGFzdCBlbWFpbC4g
U28gYWRkIGluIHRoaXMgb25lLg0KPiBJIHdvdWxkIGNvbnNpZGVyIHJlLXB1c2hpbmcgdGhpcyBw
YXRjaChhbHRob3VnaCBwbGVhc2Ugd2FpdCBmb3Igc29tZQ0KPiBjb21tZW50cykuDQo+IFRoZSBy
ZWFzb24gYmVpbmcsIGEgcGF0Y2ggd2l0aG91dCBhIHN1YmplY3QgaXMgbm90IHBpY2tlZCBieSBw
YXRjaHdvcmsvYjQgb3INCj4gb3RoZXINCj4gdG9vbHMgdXNlZCB0byBncmFiIGEgcGF0Y2guDQpH
b3QgaXQsIHRoYW5rcyENCg0KQmVzdCB3aXNoZXMNCkppYW1laSBYaWUNCg0KDQo+IA0KPiB+TWlj
aGFsDQoNCg==

