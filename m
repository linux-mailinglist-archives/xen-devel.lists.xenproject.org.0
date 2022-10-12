Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CD75FC630
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 15:16:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421170.666368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oibat-0004AU-E6; Wed, 12 Oct 2022 13:16:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421170.666368; Wed, 12 Oct 2022 13:16:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oibat-000486-BG; Wed, 12 Oct 2022 13:16:19 +0000
Received: by outflank-mailman (input) for mailman id 421170;
 Wed, 12 Oct 2022 13:16:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAAv=2N=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oibar-000480-W6
 for xen-devel@lists.xenproject.org; Wed, 12 Oct 2022 13:16:17 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130088.outbound.protection.outlook.com [40.107.13.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0dc1da34-4a30-11ed-91b4-6bf2151ebd3b;
 Wed, 12 Oct 2022 15:16:17 +0200 (CEST)
Received: from AM5PR0602CA0016.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::26) by AS8PR08MB8181.eurprd08.prod.outlook.com
 (2603:10a6:20b:54e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Wed, 12 Oct
 2022 13:16:10 +0000
Received: from AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::e4) by AM5PR0602CA0016.outlook.office365.com
 (2603:10a6:203:a3::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21 via Frontend
 Transport; Wed, 12 Oct 2022 13:16:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT034.mail.protection.outlook.com (100.127.140.87) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Wed, 12 Oct 2022 13:16:10 +0000
Received: ("Tessian outbound 7761be2ecf00:v128");
 Wed, 12 Oct 2022 13:16:10 +0000
Received: from ef9456e8fc61.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 56D3FC1B-A485-4875-B1D5-18134E17ACAA.1; 
 Wed, 12 Oct 2022 13:16:03 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ef9456e8fc61.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 12 Oct 2022 13:16:03 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB9439.eurprd08.prod.outlook.com (2603:10a6:10:42d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Wed, 12 Oct
 2022 13:16:01 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%7]) with mapi id 15.20.5709.015; Wed, 12 Oct 2022
 13:16:01 +0000
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
X-Inumbo-ID: 0dc1da34-4a30-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=C6KCvZldk1Eo0kJF6+XzZ2LBXGq1XwYWJaP9Vy0+5UdB/QuTPBRr7G+hRrsTlWh3cvy/UfI57JNr8LqLnucf5nlEnvGIujkIlqAfT9WcAp65OlFKfH3SuBgxog6j/wqfCufMUwBLqIG1WK9N6MYSuHtldxbtIOPXUQse31KwUR+vpJJpbnPxQL2jj8e23fVkc6o4IFnkn03O+OORfcYtXFcaAQh2+Tpunr4E85axorRn7na7qY6Yh7cLtsVpcip17TaL6dnujkSYgkh8+lvDzsfLCyTLEF7j4AoD3MR7B6AiwGTt2jSUzQS6+Ktuom0C/uDwM1zAV/5O12rjKH6oVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=coVUI+OovziYU9f2aKGAN07Z7YqMva50yfqK3aKrFMo=;
 b=YvGfmOWQrn+7vfExHUqAoEsUHjC09DZBOt8uJuBe7HL51n+Nz0h2rDorRYSTrkLfqvoj3kVzac6+6kY/yNwMHbnb0geFYvDZlPx3TnTWqMNk54SXKJatA/3TdlPFUZXt788prstmb7W0kYmLVNfn+Wti8KsM2ORHa3jQOD0vjp0gUpohbWrKE+A0vE4lcM7usawkbo8FgQFwNqQ/h1v3NDL8jnkfl5TnnEb9xOBTykTtw+xhlL+M7QYnG3yrwrpEyXakocXHM2zHVbks7hYtHE65fyq4hxqv/ulBFHxi+WIBdsGprsIutBg7SiYfBnF3MloMdxjBCFexx8j/rCT0tw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=coVUI+OovziYU9f2aKGAN07Z7YqMva50yfqK3aKrFMo=;
 b=D+e9DzzCN9NWkCWbGc+lAL1BJoGiubEar/fktcg/Z8F8ZdB41JEPefY0bZQzf103KED4gXyuSh5dZDfAIBeZuyEyVPWL7E3M5n8h0ukCujNJ8jAJPJE6DrYFLoJRrVloXszHAXKk4BrtuP8I6xmBv3br6GMv02HuFqIHcq07+dg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4OrZBi5/KWk+/qjROv8/3hxyOPUJNLKuSPXYaj55F7WTE0K238rseIW5lJTAz2LmdSqHvTGfh26AL54uk8dZVfg/J353QI9AvXmuZyFjExnxWhvLBqeF/ZsnRKeIoMaHKcO1ElyCRjtvheswTaAmeR2jcyM8mEriVWC3FCj2tk/pGamAzPzlbmBkDA8trVjduOK9li7XDRx4xid2/VA7pQvxn+oAj285FrgfglgxuE/X7buazqcelBaKosnBwRiHWw0QrXL3IgpkQM9WsYyKYqd4CEZ+GGAs6LzXmfnxLrgCoCqRKWtapTzTFK4qGI+6zzg8iwf0zT0+WShY/uP+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=coVUI+OovziYU9f2aKGAN07Z7YqMva50yfqK3aKrFMo=;
 b=fF00BIqf2xLsGVhGRSsQgET/cOybmvhkKe/nfJwwniugdSNL1+ywaWB/zgETaE7dJIEWqSlEl8l6cloA0ONgd03cc5bGuxL5Uuz9jlOKN7ac0RqDN4NzdMX2DBwuFOuZ6gDe/ZnVcrnMfB5GIpp2SHyXjz8ryAtL9sQJC8bQxDxbSKAI7GA9KMgRMR/6YCTM08ZmAi/O9bI1V9DKenbMkpLM5GER/IZ0r6UR0LWxwbzSH7U9wwlUDH88L4dTb8suqkHTIRRw7DGx7eFXszlp18dAAgxDldqiVftS0EV2xEJSYV/dNH1wLYllmI0FisZuvWSOU9tqelcAMr162Ttd9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=coVUI+OovziYU9f2aKGAN07Z7YqMva50yfqK3aKrFMo=;
 b=D+e9DzzCN9NWkCWbGc+lAL1BJoGiubEar/fktcg/Z8F8ZdB41JEPefY0bZQzf103KED4gXyuSh5dZDfAIBeZuyEyVPWL7E3M5n8h0ukCujNJ8jAJPJE6DrYFLoJRrVloXszHAXKk4BrtuP8I6xmBv3br6GMv02HuFqIHcq07+dg=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH][4.15] libxl/Arm: correct xc_shadow_control() invocation
 to fix build
Thread-Topic: [PATCH][4.15] libxl/Arm: correct xc_shadow_control() invocation
 to fix build
Thread-Index: AQHY3jtPuivbdxpwvESMJg2+jrcZsa4KukrggAAB8wCAAAA4YA==
Date: Wed, 12 Oct 2022 13:16:01 +0000
Message-ID:
 <AS8PR08MB7991974EDF0C5895E6DB6B9992229@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <805d66fe-e116-254f-015a-59a760639653@suse.com>
 <AS8PR08MB7991025777286F904D3FB6F192229@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <c0b2e0b1-f5bb-e75a-dfc1-60eb7006cbf3@suse.com>
In-Reply-To: <c0b2e0b1-f5bb-e75a-dfc1-60eb7006cbf3@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 74CF9523D5DF204E9764D8945E49E9B5.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB9439:EE_|AM7EUR03FT034:EE_|AS8PR08MB8181:EE_
X-MS-Office365-Filtering-Correlation-Id: 50ffa9ae-d368-453e-af83-08daac53ee2e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wrG6caUkjwM0jszeU06waCqNxEBhvLbNAkFxcDLxTdM3Z429cJC0yyLE1hiVCJm00PVA1/A9y9+qFUx4C3fYYurF+F/x4yPNAM0JMJASoBGTmcs6JF3cotU/DCck++hfthePzAs/ZM5YctOMKTNDElGIpbPl0d/J+N/wNni2lgD4urx/vbt2zSI9VyHhE6zIC1M07pDxEeZ51YT8JRDlBOYMVAF+ivI6+THBJSkdG91MLQUpQpSLQ6/5DUZEK6sXyzJ3hfWAvluWPmkh+aqJ7+CSAqN6h573WQ4Nki//KhKNydyINiZr+4evPAodX/uSzsh55qATqpWzYLtnyS3R+pRVSTL9u5jlhbe/uD0bH6EoE6C5Kz6Hsl4cJnnXw7McP+gx7/l4STVayPIQvYwmbwIfxesy6NQSM49bC9mZ18IlQ8DTBr36aoteMR8V97GRhz3hBjbAC2obgu0AvMpZtVB5/0OnTvc7KzYpyYNUe2oV2Wn7CYyz/SPlnTcOdv5fW/iGlT01K2O7gHE9HKe8qxG/DekPV6vI4cd1w38Ci2oWsTLq3ULjOoP7OfzZt1UgI+v36k2Vf2z4kAxUf52ieaLVhyJNDa3kVdIxhWpv7OlexoKtjWxELN26Leb7nXgpfAz+lZaGay02A413KMOngOtZ4D1lefM98XFrtF7VtIkthuOUgKRhzl2fl9pFXnXC9+3QMUjt9E54Jo5KhTMD6UUFc/WbtxTqHZYPuHHCLjWv9J9G2+FxvOUxkI4d/8FW1xbfppz+2WzXagiXmzQESg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(451199015)(53546011)(478600001)(2906002)(316002)(122000001)(64756008)(8936002)(38100700002)(6916009)(66476007)(33656002)(4326008)(41300700001)(52536014)(66446008)(66556008)(76116006)(38070700005)(5660300002)(54906003)(8676002)(66946007)(71200400001)(186003)(9686003)(6506007)(83380400001)(7696005)(86362001)(55016003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9439
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	37637d4f-68b3-4dae-928a-08daac53e898
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c0Ez6y/wQiVciykFkUqXqJAqynasp4XjvaG395BGKwGid/IPPk34cJAz67pWuAyvvKJ1zcJw4Tw9IfMSp6T8/s3/GU5/sJRAlkuAKvR0eJ7si9o/eH/CkuSoa6PpkLBhAFFVgHQgAP67nQGgLSACXLyGSQP64DIjGdMsCDO0y4aRlOMejNVW3cE7Q29t5+yH+BmoZ4005UtM/4z7o78CXCwJ3MhlmWsbIp9BNMBzbndCtN6gzgdtzgp1YLJX95PyVkvweqmk54azS0llY0Wrzx95nb/Pxv8KnriZ8Z4W4T51hMWVCF1qR9rQjGa2ZHZ434CuT/rkO98QNrr8+cY9lDEHyzZBKLGyL89LYiQgjy8twFuuHYWSYItKvxO3oBOXDEjVOAyDXCEHzC5XlVhzfj5strt0nKkoSITspc55827IauTENhojvBedKg6tWPKu5NVrGwBgtnFr5aAHvgttYvi8q1YP+Oc32DJWVTJbfBJ5OqEDFgzgUWTBScinjE7BM0P7hFZdOQEDL//WzbQQAmlGC6J9nMaG1fsR5Zlt//Hi5As64lWGAmC9bBJev+yYxo75qia/ad5LnxtPqwxWNB7rbeTvbA1opSzNlu5iMYroxbBPGHmnq2Tz+1xcVGHjc6FcD2mRgN55XeTtoHQfRyeSyXiIvg91xx0IDumb3Ak67TSzCf+Ja5SSI7BmT7AYeMc2HVhxXsL6UULbo3OnDw9GbNsZ87wDP1sK2xfImoSZU/FiynOgjyqp8+rbSje13syLnnXNPgRw+0yOhh5kdg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199015)(46966006)(40470700004)(36840700001)(86362001)(81166007)(356005)(36860700001)(82740400003)(33656002)(336012)(83380400001)(55016003)(40480700001)(40460700003)(53546011)(2906002)(478600001)(26005)(7696005)(9686003)(6506007)(186003)(8676002)(8936002)(47076005)(70206006)(70586007)(82310400005)(316002)(54906003)(4326008)(5660300002)(41300700001)(6862004)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 13:16:10.4021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ffa9ae-d368-453e-af83-08daac53ee2e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8181

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF1bNC4xNV0gbGli
eGwvQXJtOiBjb3JyZWN0IHhjX3NoYWRvd19jb250cm9sKCkgaW52b2NhdGlvbg0KPiB0byBmaXgg
YnVpbGQNCj4gDQo+IE9uIDEyLjEwLjIwMjIgMTU6MDcsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+ID4g
SSB0aG91Z2h0IHRvIHNlbmQgbXkgcGF0Y2ggZm9yIGZpeGluZyB0aGlzIGlzc3VlIHRvbW9ycm93
LCBidXQgc2luY2UgeW91IGFyZQ0KPiA+IHNlbmRpbmcuLi4NCj4gDQo+IFdlbGwsIEkgd2FzIGhv
cGluZyB0byBnZXQgc29tZXRoaW5nIGluIGJlZm9yZSB0aGUgZGF5IGNsb3Nlcy4NCg0KTm9ubyBJ
IHdhcyBub3QgY29tcGxhaW5pbmcsIHNvcnJ5IGZvciBtaXN1bmRlcnN0YW5kaW5nLiBBY3R1YWxs
eSB0aGFua3MgZm9yIHlvdXINCmVmZm9ydCBoZXJlLg0KDQo+IA0KPiA+PiAtLS0gYS90b29scy9s
aWJzL2xpZ2h0L2xpYnhsX2FybS5jDQo+ID4+ICsrKyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxf
YXJtLmMNCj4gPj4gQEAgLTEzNiw3ICsxMzYsNyBAQCBpbnQgbGlieGxfX2FyY2hfZG9tYWluX2Ny
ZWF0ZShsaWJ4bF9fZ2MgKmdjLA0KPiA+Pg0KPiA+DQo+ID4gVGhlIGRlZmluaXRpb24gb2Ygc2hh
ZG93X21iIHNob3VsZCBhbHNvIGJlIGNoYW5nZWQgdG8gdW5zaWduZWQgbG9uZywNCj4gPiBhbmQu
Li4NCj4gPg0KPiA+PiAgICAgIGludCByID0geGNfc2hhZG93X2NvbnRyb2woY3R4LT54Y2gsIGRv
bWlkLA0KPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWEVOX0RPTUNUTF9TSEFE
T1dfT1BfU0VUX0FMTE9DQVRJT04sDQo+ID4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAmc2hhZG93X21iLCAwKTsNCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5V
TEwsIDAsICZzaGFkb3dfbWIsIDAsIE5VTEwpOw0KPiA+PiAgICAgIGlmIChyKSB7DQo+ID4+ICAg
ICAgICAgIExPR0VEKEVSUk9SLCBkb21pZCwNCj4gPj4gICAgICAgICAgICAgICAgIkZhaWxlZCB0
byBzZXQgJXUgTWlCIHNoYWRvdyBhbGxvY2F0aW9uIiwgc2hhZG93X21iKTsNCj4gPg0KPiA+IC4u
LmhlcmUgc2hvdWxkIGJlICVsdS4NCj4gDQo+IE9oLCBpbmRlZWQuIFdoeSBkaWQgSSBub3QgcGF5
IGF0dGVudGlvbiB3aGVuIGxvb2tpbmcgYXQgdGhlIHJldmVyc2UgeDg2DQo+IGNoYW5nZSBpbiA0
LjE2PyBUaGFua3MgZm9yIHBvaW50aW5nIG91dC4NCg0KV2VsbCBJIG1hZGUgdGhlIGV4YWN0IHNh
bWUgbWlzdGFrZSBoZXJlIGJlZm9yZSBJIGRpZCBteSBsb2NhbCB0ZXN0aW5nIHNvIEkNCnRoaW5r
IHRoaXMgaXMgcXVpdGUgZWFzeSB0byBpZ25vcmUgOikpKQ0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5y
eQ0KDQo+IA0KPiBKYW4NCg==

