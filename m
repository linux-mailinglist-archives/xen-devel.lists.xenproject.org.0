Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C781C5376A6
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 10:48:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338377.563144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvb4B-0007T9-9S; Mon, 30 May 2022 08:47:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338377.563144; Mon, 30 May 2022 08:47:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvb4B-0007R6-4p; Mon, 30 May 2022 08:47:59 +0000
Received: by outflank-mailman (input) for mailman id 338377;
 Mon, 30 May 2022 08:47:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NCsk=WG=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1nvb49-0007R0-01
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 08:47:57 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32392eb3-dff5-11ec-837f-e5687231ffcc;
 Mon, 30 May 2022 10:47:54 +0200 (CEST)
Received: from DB6PR07CA0202.eurprd07.prod.outlook.com (2603:10a6:6:42::32) by
 AM9PR08MB6243.eurprd08.prod.outlook.com (2603:10a6:20b:2db::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13; Mon, 30 May 2022 08:47:52 +0000
Received: from DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::50) by DB6PR07CA0202.outlook.office365.com
 (2603:10a6:6:42::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.5 via Frontend
 Transport; Mon, 30 May 2022 08:47:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT028.mail.protection.outlook.com (100.127.142.236) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13 via Frontend Transport; Mon, 30 May 2022 08:47:52 +0000
Received: ("Tessian outbound c1f35bac1852:v119");
 Mon, 30 May 2022 08:47:52 +0000
Received: from 8f94248d2738.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DA7B2195-3F18-4934-B316-2B16E31DC334.1; 
 Mon, 30 May 2022 08:47:41 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8f94248d2738.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 30 May 2022 08:47:41 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB7714.eurprd08.prod.outlook.com (2603:10a6:10:3be::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Mon, 30 May
 2022 08:47:39 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1d33:77de:5850:383d]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1d33:77de:5850:383d%5]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 08:47:39 +0000
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
X-Inumbo-ID: 32392eb3-dff5-11ec-837f-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=J1gUNH+yEdcLxtsSAc/zGo+W2x9VJ/K+Lf07U8U8Sb3Nnl2feUz1dEoqTKEXFd9Vrr0oxzS3oX+lg3qyNi9OfoI1ietOrCG00/CU73ujmK5drfp7RPnqqzHb3azAuF8Ml1jRjiTmITAwqMmwhOxU+L7u7tMPrfM/ymJuIyn7uAB2JqQRrvTmFCXtEsCx7CuRl9WJb19xxnWjqa2nkWoCzFpMPJ2BxkPbeR7BBId2IuQYY2vygcLD00RfVRayubNmcjRMxUyrDSU+lkWeuziPqL2ZcQewwJ/4WdSroS9NYwGzCuk8q/TLuIN4FxjoV9mEwNjGV+VjHzEDyGRE4vibRA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LL+Kiugkf7vDwypWQeZVd2t84IrJCQL8sjEUKKhmN4=;
 b=m6DoZawJQyRaGyUgakvTxMoSje85KZrl1i3ZqkfZ2BAEVWhJHwv/XkOKxpe8ElDVZQplsVz9cEJgZ0XRGsCrluWrsIaem7WALk6+R34nS//iY+Cvs4xr+u6mDCk6wfj7ME/e6AZED3ib2o0d3CFvzby3YhkFIPIvorZaAN6WYFx6bl/vI/7gRMzSNDp53o3X5iQsh/0Oi17Kp8LUhtBx7eSG9SQ1wtRC6g6a/QfzxACzM9vpehqe2ZZmKn5Tg8WAm7+6PT2wcCKTtAdaAZYMsG5r91RH6rofiEtYLTCXfeXZveTWszHaHcw33iWXUn9aii0nE13fia/U7B5IoXnEsw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LL+Kiugkf7vDwypWQeZVd2t84IrJCQL8sjEUKKhmN4=;
 b=sVGNYKZYUl0PDFzbIAsa/p1H7TnqSS9tIxcmXmqebeDOUzrqwsS5hOVAJp9CQV6zxNBF9k1wXMvA6Nl6arSk4NpFXDR/kdlN4hRW4fIkSsfAMz+GDfbYjLNN3PNupSYixTQNKdf8tSlaGB2B14Wah3gHeHKLOKfTG6WPHE4qEnA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TuZ6lj9skvYvwJYUHZtK5wfOvk//7bnrkKiFKhY326/K1pW42sOQ9gTkaw/AtRp/xhrgIAdFaIwGOP263idXhnlYrjyvvOgjTFndHxbyRFqRjq+wtbz8Dw0GqIYo25fyyMgU5q3NN6m6IbnzXBQnXmq/Q2W4eNdlKQNcQ/xfUEP6Iji03LiybYIagcPN8OqCD6iSuENuQfjmGsHeK0goPGxkQi7C1fHHhzTiCEgqgVMoYGU+ULWeUiCndVLrKhkr35TjjzB6r+lxYz3zp6JcgqvrrBFJpYgrzrqIKwVpJ+283YnXO95lJipV6uxtvKcSj43r7y4LSAXR1lkpbOQHnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LL+Kiugkf7vDwypWQeZVd2t84IrJCQL8sjEUKKhmN4=;
 b=gh1x8HcImyEoE1xR5lZirEBQ3Lai9F9r2VPViX3QK4mD+8snCxj4d8bx4lyEWAXW9vCC+jovijOQzetzsPsjgb3g6ees0GOWFtzESDGECHZB1WcVOnNsLfCrOZdmALNbC18aVPn2gEPBoF0KfLIFXBokfFzRCzcZJHWJy+kEURZp1VE08gZxd6mnoJ9ka+bKbpzLwKvNDnXgJ5C/OAa8iU6QcMWdkf6xEhByLwkr/OJYN2Cx6irvBUreSwDydzPwIN0aW/WcsmsoYiow+7nmi4OmJt0jajs9i/VsdxHlVwxrf8WpH9m+QOqp1avr9jaRATP1hUHn0O7m8bUomJq/DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LL+Kiugkf7vDwypWQeZVd2t84IrJCQL8sjEUKKhmN4=;
 b=sVGNYKZYUl0PDFzbIAsa/p1H7TnqSS9tIxcmXmqebeDOUzrqwsS5hOVAJp9CQV6zxNBF9k1wXMvA6Nl6arSk4NpFXDR/kdlN4hRW4fIkSsfAMz+GDfbYjLNN3PNupSYixTQNKdf8tSlaGB2B14Wah3gHeHKLOKfTG6WPHE4qEnA=
From: Henry Wang <Henry.Wang@arm.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 1/4] Grab the EFI System Resource Table and check it
Thread-Topic: [PATCH v3 1/4] Grab the EFI System Resource Table and check it
Thread-Index: AQHYVAPvZOxRdkFgj0uBaaJ4Rpp1GK0DfWsAgDPbGXA=
Date: Mon, 30 May 2022 08:47:39 +0000
Message-ID:
 <AS8PR08MB79912809AF4E9D258DB8951F92DD9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <Yl7WHv6+M+eJwQep@itl-email> <Yl7X3mAJhR5ENSpl@itl-email>
 <0644ecd8-51cc-897a-5555-62d4c9ee9461@suse.com>
In-Reply-To: <0644ecd8-51cc-897a-5555-62d4c9ee9461@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C681ADBC422A3744B2248251074ACF4D.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 788ca25b-f51e-465b-a55e-08da42191552
x-ms-traffictypediagnostic:
	DU0PR08MB7714:EE_|DBAEUR03FT028:EE_|AM9PR08MB6243:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB62431E7824961C85AB5FF73892DD9@AM9PR08MB6243.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8cb5+OQioituo0tQn55AD7Dv0dxmENFs80kROAJU0i21fjveKEIJ7WLge5t0zTb6xMugi8P7B0ii09K8+R2HMSEchG7grZiRpVLugXnu+ulkTG5rN0xkv+nlDUHcp0DC7uKxMtsdmWmovRktvZFMR0l4c08tmDJP2nXCIFTkwzmVC1qB/hPkpp7mNSk4RqH3XEcW4/drxwD4pauH+u2EaEv0tdM9GIO5YKZIxOHFciq1dGTqf56yiTMcRcIEH6vlel939pyYgoGf1OpZ2UfxAZOcqGTMsFNi/CHzPLLoumY2S3wCdFwkVXl4f6AbWsqRBpI4P5Ks3rCptrJEHbiS6uzVcPdau5pOL3cCC3FJlWSF1f97NW5LVbtNU7zMBFlfg5ee3tDQOrsPuu45NGzIPIloSpFl7mpjTGTo3DCo07MZ7zjunrSLaBqJAPJzCtjiWIyrjV0uyIB0Z1d1nXGlMm9Sm/jS0b0sWeFnO2nt+pulGSmzlLz89WYwDraK9huE/sddq0O0fvNgfE1q/CA3pDu4l6+NOzgmLAsKMMHGUSz3fIlG3+az1oKX4v2jOQ9qXamDEFRSADvW4o2LUIDBJa+rwIcnboOk+6EK4YDvRODndUIcNHUQVubQwGR5/YZ3j483Z+vLGHkwUxbLKRp06lQw7d4ppfewJQ5eB6kCTb4OexeixAvBTm8X/ITMtvecaIDf7GdmVegy/rGa+f4VItK2pTQJFH8oeAVn4JSpqN4fQt1dsMAlflnxPE6kjWJrpEERuli9N5tsTE1GJgtWM5/+D3/Hz/Cr37DiQnOK3n9iL3qhNoAcEIawKo5YxdPpdHDsYODU0L3C9a/sKidarA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66446008)(122000001)(55016003)(83380400001)(64756008)(4326008)(8676002)(6916009)(38100700002)(26005)(186003)(66476007)(66946007)(66556008)(76116006)(6506007)(53546011)(54906003)(33656002)(9686003)(7696005)(2906002)(316002)(86362001)(5660300002)(71200400001)(38070700005)(966005)(508600001)(8936002)(52536014);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7714
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a8fecb83-a39c-4dc4-4409-08da42190dbe
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9Rs4E/0ykjDJP+zV2GPKa7OdWszZFS7Pcn4w+aS0cPxc/pjkSLuRGmJPsEju01EXdmNs1qMUTI2bcvf9q1/0Qi/8eg69d90d/feX1nmYyxOlEAg6AOMGDmilsPcFjfi3r/ODbgUSFjf18vsl0xCykmtzZ3FmNAxaFPshFB46/c/r8tAj75N0W9sjGlmku5spBPUmwncKyRcrg4AyW6od9frE1xO1G9OlISZA9J3kQ7WZZuY7yR9S6Zd3Dce3f0JbBLDL8P1pEpw4G0vqQ/G0YkiAgSBlu+qPiNI/qC6U/jcyxxlq3Q5LkAqyS/fIdkNOqfbZ9A9/uodcWw5FfVf8Zs43zD/lyxUttXFNxoyZlCVR87GcGS0ntEm5o7U5AWyMnxmeR774Ic6hyaq0eUMa/F9ALExeEAeo4ljPzZtKlo5mMKnUrDQ0Nqh74gieEfHcKS04pV8+Z3qBLB35er0v12Dgwtu6Qth19yqnUdQ5YAtqz7iWdRl0Bs9ZzIKvIWaCWRutoBfEt4Ey5584QVGeJP3ytfcT5BRQNgbU4VbZdLnqa4q/UXWSXnOFeQbAn8IckpU2lz6pm0YiJOLdBONVm8NPaoOrP8HquYhkzpnDfC40D0MfffAvQRUzxF4DTLf9yN9VPdQjHpt9kO/el/kbpRG5Y/bxzODomHQjiV/XdYZshoOb1ZYNkRbQuM25wMCHWo3dKkW871q21jKL1o4kx9prAT5l/5mh8xRdmDJ43IAZpOEIe9pDGInzwwD/Dg6dcFfyqUkM/o2A3rMqeqh//fhElF9vywKGb3yDPaJ69ggO2l2fBrmRVDN2aCwjz9eJ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(508600001)(33656002)(55016003)(316002)(54906003)(9686003)(40460700003)(26005)(5660300002)(356005)(82310400005)(70586007)(70206006)(186003)(336012)(47076005)(8676002)(86362001)(53546011)(6862004)(4326008)(36860700001)(7696005)(6506007)(81166007)(966005)(52536014)(83380400001)(8936002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 08:47:52.5699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 788ca25b-f51e-465b-a55e-08da42191552
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6243

SGksDQoNCkl0IHNlZW1zIHRoYXQgdGhpcyBzZXJpZXMgaXMgc3RhbGUgZm9yIG1vcmUgdGhhbiBv
bmUgbW9udGggd2l0aCBtYWludGFpbmVycw0KY29tbWVudHMgZ2l2ZW4gZm9yIFsxXVsyXSBhbmQg
c29tZSBkaXNjdXNzaW9ucyBiZXR3ZWVuIG1haW50YWluZXIgYW5kIGF1dGhvcg0KZm9yIFszXS4g
U28gdGhpcyBlbWFpbCBpcyBhIGdlbnRsZSByZW1pbmRlciBmb3IgdGhlIGF1dGhvciBhYm91dCB0
aGlzIHNlcmllcyAobm8gaHVycmllcw0KYW5kIHByZXNzdXJlIHRob3VnaCwgcGxlYXNlIHRha2Ug
eW91ciB0aW1lIDopICkuIFRoYW5rcyENCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KWzFdIGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC94ZW4tZGV2ZWwvcGF0Y2gvWWw3WDNt
QUpoUjVFTlNwbEBpdGwtZW1haWwvDQpbMl0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9w
cm9qZWN0L3hlbi1kZXZlbC9wYXRjaC9ZbDdYL2RUMzl2dmhabWhvQGl0bC1lbWFpbC8NClszXSBo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QveGVuLWRldmVsL3BhdGNoL1lsN2FD
MmErVHRPYUZ0cVpAaXRsLWVtYWlsLw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IE9uIDE5LjA0LjIwMjIgMTc6NDAsIERlbWkgTWFyaWUgT2Jlbm91ciB3cm90ZToNCj4gPiBAQCAt
MTA1NiwxOSArMTA5MSwxOSBAQCBzdGF0aWMgdm9pZCBfX2luaXQgZWZpX2V4aXRfYm9vdChFRklf
SEFORExFDQo+IEltYWdlSGFuZGxlLCBFRklfU1lTVEVNX1RBQkxFICpTeXN0ZQ0KPiA+ICAgICAg
RUZJX1NUQVRVUyBzdGF0dXM7DQo+ID4gICAgICBVSU5UTiBpbmZvX3NpemUgPSAwLCBtYXBfa2V5
Ow0KPiA+ICAgICAgYm9vbCByZXRyeTsNCj4gPiAtI2lmZGVmIENPTkZJR19FRklfU0VUX1ZJUlRV
QUxfQUREUkVTU19NQVANCj4gPiAgICAgIHVuc2lnbmVkIGludCBpOw0KPiA+IC0jZW5kaWYNCj4g
Pg0KPiA+ICAgICAgZWZpX2JzLT5HZXRNZW1vcnlNYXAoJmluZm9fc2l6ZSwgTlVMTCwgJm1hcF9r
ZXksDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAmZWZpX21kZXNjX3NpemUsICZtZGVz
Y192ZXIpOw0KPiA+IC0gICAgaW5mb19zaXplICs9IDggKiBlZmlfbWRlc2Nfc2l6ZTsNCj4gPiAr
ICAgIGluZm9fc2l6ZSArPSA4ICogKGVmaV9tZGVzY19zaXplICsgMSk7DQo+ID4gICAgICBlZmlf
bWVtbWFwID0gZWZpX2FyY2hfYWxsb2NhdGVfbW1hcF9idWZmZXIoaW5mb19zaXplKTsNCj4gPiAg
ICAgIGlmICggIWVmaV9tZW1tYXAgKQ0KPiA+ICAgICAgICAgIGJsZXhpdChMIlVuYWJsZSB0byBh
bGxvY2F0ZSBtZW1vcnkgZm9yIEVGSSBtZW1vcnkgbWFwIik7DQo+ID4NCj4gPiAgICAgIGZvciAo
IHJldHJ5ID0gZmFsc2U7IDsgcmV0cnkgPSB0cnVlICkNCj4gPiAgICAgIHsNCj4gPiArICAgICAg
ICBlc3J0X2Rlc2MgPSAoY29uc3QgRUZJX01FTU9SWV9ERVNDUklQVE9SDQo+ICopRUZJX0lOVkFM
SURfVEFCTEVfQUREUjsNCj4gDQo+IFNvcnJ5LCBvbmUgbW9yZSBxdWVzdGlvbiBoZXJlOiBXaHkg
aXMgTlVMTCBub3QgZ29vZCBlbm91Z2g/DQo+IA0KPiBKYW4NCj4gDQoNCg==

