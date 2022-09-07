Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7975B0538
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 15:36:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401748.643667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVvDX-0003X4-CN; Wed, 07 Sep 2022 13:35:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401748.643667; Wed, 07 Sep 2022 13:35:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVvDX-0003UN-9Y; Wed, 07 Sep 2022 13:35:47 +0000
Received: by outflank-mailman (input) for mailman id 401748;
 Wed, 07 Sep 2022 13:35:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9gDT=ZK=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oVvDV-0003UH-Vn
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 13:35:45 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80085.outbound.protection.outlook.com [40.107.8.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f947e376-2eb1-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 15:35:44 +0200 (CEST)
Received: from DU2PR04CA0222.eurprd04.prod.outlook.com (2603:10a6:10:2b1::17)
 by DU0PR08MB8493.eurprd08.prod.outlook.com (2603:10a6:10:406::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Wed, 7 Sep
 2022 13:35:41 +0000
Received: from DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::2d) by DU2PR04CA0222.outlook.office365.com
 (2603:10a6:10:2b1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Wed, 7 Sep 2022 13:35:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT063.mail.protection.outlook.com (100.127.142.255) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 13:35:40 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Wed, 07 Sep 2022 13:35:40 +0000
Received: from 47c1e760eb15.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E522B924-04C6-46A0-A19C-12F2891606FC.1; 
 Wed, 07 Sep 2022 13:35:34 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 47c1e760eb15.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 13:35:34 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VE1PR08MB5662.eurprd08.prod.outlook.com (2603:10a6:800:1a9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 7 Sep
 2022 13:35:31 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Wed, 7 Sep 2022
 13:35:31 +0000
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
X-Inumbo-ID: f947e376-2eb1-11ed-af93-0125da4c0113
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=O+rGSNpHfh/CsTAiVC3lBGroMoir4gm/Q78fLLnzp3z6YIseeqEDXYAwUORTI2CfzFRkPWevkku1IguWkvVKFGpXXygpX7kx9oRWY9sUtKWxdTB9TlDqVNKtDmHR1c6VKfAjBb4KPMJt1Rjxtne9kNohhdCem1CPEe1w0EGvEvEGo5UgReHubgbiajuJhb1g2/uPrz1tVF9fkQZARwMk1zze7w5RPtoELu2GnrZ7/D2C3Ykcx0tWFN4pHI+Pgkze49+3Lsbp/0VQ3oMC3MXuQ+Rua2r5Xhid3zOhKy+cPgat6gfFnEl4+qlgub1NckraSrKprUB3/aqjmvWQ8Wpa4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4ZmMQqidJT7Q4k/GhU/0NX3xmBnpCrQfYcd7pdAtq8=;
 b=AY2jKJa3KJTGPUE1WV8UD2cl96cxxmr0Q23ZIdumdW8Nej+SEI7ipE8QcAEc2QAIDJS/+hofLwytB+Ftu+CbYEmRcazM3UIQ8Q9LsC9WFrjErXSILP1ILaSBLmeuNG5/5mcaL8kE8wDovQpGdzNz07+rcDnIGrrFv8JBpO6t4I3Ed5wYUb5V2tpT3AvImW2IiNegzm4zNVzyAD1KJnjkYrdGwGO/HhibDAfnBURNudiLJRLScU3tysUIR89ttLvj/h8euZTBInz3CVuKVSOMo4ZnWD8IVkEE23QRjZrlQGyAtWJdngabnsmP2/bbSIDNtmPNGZhyDlBoK8rusO7caQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4ZmMQqidJT7Q4k/GhU/0NX3xmBnpCrQfYcd7pdAtq8=;
 b=w5UJmidw/l2geUtMDWHe2Vrui8ksWgMk7mPOU5VIEsXhsEdBV2b1WGyx5Dj5F3MUuz+c58jCTXzoa8+SwAloxs8GE72a6NC8BcJOdXKmWGsEDZ/FeqESlbfeQyFGvB+5qYmQ4f7usFoWlpndOwWUmdfJUX/CWeOXCSuUUYBXkp4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTDj9iT3YFu8CqwieZUnBixvJKA25NFm5IKCns35UMieWONYLMluNHRiWDBmf9ot5vIqlY5nrzLEIqC5mtge2ZIzO/AIdQSHpK4DIJYsoE4aChDD2UKzayjVQsSvJQ7Af6eOZQ2OufTtT6LlbyZGMZyUo79uMDV6sKA2M+5N6wnCYFLrx3ajPd6DBC2OHSufQ9yfvTKP2drgie/Cd9TJLT9/G8UL4tI+ea9JDNpb+YtWDyZg5bs3yvvkH6GWrEK6k/XxPwQhd7+HJ8GJwCITkaSpAy5ILplFDlRFHfsiroucgTXvIlCDS+Y7D8p0g77ozuZFT7SVqlE32u5vNYsyww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4ZmMQqidJT7Q4k/GhU/0NX3xmBnpCrQfYcd7pdAtq8=;
 b=Yna1g87Kf1EHNeBqHcQSJRFiswhTwCyIFnbxyA7E0nAdvX+bJIOz/uU9nPBZA2lcAog+mfzgVR0Fw5gmf88JPdp9yy/Zzkm2dvB1R3ImeeM4k4QKv/m3aUJ0lvJQy0Sfi7+a4x6dGe5Gu2acdzBomFNDCEVA1ybwy42ky6dWZCKuWIQvY2RKItgu0Mydit8MXW/1vNUCvMtLuyUXG4vH0BMix9pM2Clxmjv4qSZ4xlSEHjHIZXBx3aw1l0UV5OgnNgX1Iu1Ck+OpF0oY+bGu+b1tSEYgbZi17R/ctSUE9KEQfhSPnQdnmCJ5FzBkihjPpfvQhhLD/hbuNXmuzNXo/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4ZmMQqidJT7Q4k/GhU/0NX3xmBnpCrQfYcd7pdAtq8=;
 b=w5UJmidw/l2geUtMDWHe2Vrui8ksWgMk7mPOU5VIEsXhsEdBV2b1WGyx5Dj5F3MUuz+c58jCTXzoa8+SwAloxs8GE72a6NC8BcJOdXKmWGsEDZ/FeqESlbfeQyFGvB+5qYmQ4f7usFoWlpndOwWUmdfJUX/CWeOXCSuUUYBXkp4=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Penny Zheng <Penny.Zheng@arm.com>
Subject: RE: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Thread-Topic: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Thread-Index:
 AQHYwpUJ7IYztv5II0KGaSuPgw9aFq3T1xaAgAAKD4CAAAVdgIAAAr4AgAAA5ICAAAbIgIAABXCAgAAA4QCAAABTEA==
Date: Wed, 7 Sep 2022 13:35:31 +0000
Message-ID:
 <AS8PR08MB7991D68A6A20B3106243BE9992419@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220907083643.20152-1-Henry.Wang@arm.com>
 <20220907083643.20152-3-Henry.Wang@arm.com>
 <968529ba-3a9d-0812-1a5f-430d467e827f@xen.org>
 <9a66b6df-bc37-d836-8175-3b98be07c696@amd.com>
 <e5e9a62d-6072-463e-6c4c-8d94aa29589b@xen.org>
 <a29a07fd-40ad-602f-9a79-a36783ada947@amd.com>
 <e8bf68b1-0217-c8cd-4864-ea7fe415fb0a@xen.org>
 <b0b85a1c-ff00-ea06-a960-e49799d507eb@amd.com>
 <ED046919-0B75-48C6-900F-44F3295553B7@arm.com>
 <7997786c-78ff-47df-12de-d1fe38e5624d@amd.com>
In-Reply-To: <7997786c-78ff-47df-12de-d1fe38e5624d@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 6FAEA4B1AA7C5740B344C9FA492ED290.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b692af66-0174-4bb2-96ea-08da90d5db4c
x-ms-traffictypediagnostic:
	VE1PR08MB5662:EE_|DBAEUR03FT063:EE_|DU0PR08MB8493:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mcmeB5t9q1tRs8x2AijSlTSd2SDd0Nq2CZfTw6MQg1j7R/OBR5Hu4FmkpD4VB1xrYK/hW4dFndme6MnrNtMjeeh7kFQqNPjM+/y06sWrW0yPSDJo7Smycod7vjX9eFZgQwjO0+DraLI7b8sz5Xxao9tphLw4jCaiMnEU314DW1l6iJ9uJD4KsI3gg2wk/lfdUEZhZQZOt379Ag1qd/UVjIs8SruVaagQq+aO6+in28sCETaqUA3MIM8kbrLah2f3TXt8mgy2rDsDruDQO8wsAK0gYt5lRq5nKoenKmtobQGGMrkU2fKeM2UnLzWKOyCIzKyGNbaCfeMCx/CoZVX82OJDnfz2nRH1CBMf4v6Nockd1c1Fw8hsexd3mp4y5NnooKMBeWwvcmb1gjsl97Sk6aazC18oGZP4/+YAe7OSPUpYES2TjKGYu5dO+JLI19A3v9pEnpM+DZBW80vaD1NyQAcgV+aIxsXUWnA6t3/zYvpfz6kepOdk17x02lDw7N11TKiSLpBPz0nZaD+H7lIRbL9G3sHeyXP09C7CrzKi4Gh/5Ef5x7b4aTcoKZTWiejaG7SFfXtzajcZ0N7saUpKmRGWFrGgaHNZ6HBjiQDhqw9sFL/4vg6NABKwP1HiluHBj8PsMj+sUhvSu7iMcCS/WYaF5tM3x0e/zxWCtlrhoJENmQzB+tyr2EkniHw5dGld7TkQsQO4kQM/gFRxjpSI5K8lFSbniE55fjNfJ4PIiUXadDVdAHdToqbWPT4iUh82wXRjGZMRTPX7Q1cMGCYCvg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(33656002)(5660300002)(4744005)(76116006)(52536014)(54906003)(4326008)(66946007)(316002)(2906002)(110136005)(8676002)(8936002)(66556008)(66476007)(66446008)(64756008)(478600001)(86362001)(7696005)(6506007)(55016003)(26005)(71200400001)(38100700002)(38070700005)(83380400001)(186003)(9686003)(41300700001)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5662
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a742e86a-c9d6-4f99-8cdc-08da90d5d5fa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fMg0Lp319fjrpotfjZQsoryHIQo/eDFTiwaG83dyhtbu5myzYU2OwEUJCdUgzAIY9SCUSpMwelsehkDwGb5mKkVCoKso5AmrrQ8AHrnEVLKzG6hSHusnyBYYxNx5nQz8L12BLlXmgsRFVmfDeXP2MbLTVQBzDK0RIteSBQtAhDUooQWJFl47sZbPnDifvoOSvp0GPdUWWuoIJK1Hj3FGQ/6J74aC2bQ7UDfvhliOcKO+kR4m7RPr/rcaDg58Da2wTcliLstVlouiG9qpwpQK4qPpd13n6iT0PEyaCZzaMiIUr0LhU4srAe1oainbNSla3ckUvifyjdNzdpBjDdeNuRQKS+b2lxvtjx4ZzbEie8BL/B0u0LgO7MsYR7P3taV04ui1pRbtELXBjwxxMQqvDeqqhPIOtzJU2HYXm5HJ3oYXKyOZCrgfkL5gRPii0ht6EmNW/DUSO8uO8RYgylv7Ri5GY9pTkm16OUsjTxtKvMpsq7iXTmEr7GNK5eLn7CMrVpsdhg1osjOJs2ghpo4rtVe+fzV3Z6EZHCcEyKXzA+IUlYREnhTTNKmfhExGG/P2db4T7bazG/B0492dAQwRoc6BS0AWrtEVGPU8DXYI/q+EvXLtXXYETFYZOpwxHjIyh2XhGE0+pqlie4NhCIogf6GAK4dFb5fGyKURpEtF05sgWJWM5BV0YplbepD0Vdum9iATmJj1G6S0jvrtZmdK9G5HryJG594K/FRGRLnxsXlReXu+VDa6N2Z60DKbd5e1yje3jXZKeGlrGpNJE5dK4Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(346002)(396003)(376002)(40470700004)(46966006)(36840700001)(6506007)(356005)(47076005)(52536014)(4744005)(5660300002)(33656002)(186003)(41300700001)(40460700003)(81166007)(8936002)(2906002)(7696005)(86362001)(9686003)(26005)(36860700001)(55016003)(82740400003)(40480700001)(336012)(316002)(82310400005)(54906003)(70206006)(70586007)(478600001)(83380400001)(4326008)(110136005)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 13:35:40.7853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b692af66-0174-4bb2-96ea-08da90d5db4c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8493

SGkgTWljaGFsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pY2hh
bCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+ID4gSSBhbSBub3QgY29udmluY2VkIGJ5
IHRoZSBhcmd1bWVudHMgb24gbm90IHVzaW5nICNhZGRyZXNzLWNlbGxzIGFuZCB3aWxsDQo+ID4g
bGVhdmUgdGhhdCBvbmUgdG8gU3RlZmFubw0KPiA+DQo+ID4gQnV0IGluIGFueSBjYXNlIHdlIHNo
b3VsZCBvbmx5IGFkZCBvbmUgcGFpciBoZXJlIGZvciBzdXJlLCBhcyB5b3Ugc2F5IHRoZQ0KPiA+
IG9ubHkgaW1wbGljYXRpb24gaXMgdG8gYWRkIGEgY291cGxlIG9mIDAgaW4gdGhlIHdvcnN0IGNh
c2UuDQo+IEkgYWdyZWUuIFRoZSBvbmx5IGRyYXdiYWNrIGlzIHRoZSBuZWVkIHRvIG1vZGlmeSB0
aGUgYWxyZWFkeSBpbnRyb2R1Y2VkDQo+IHByb3BlcnRpZXMNCj4gdG8gYmUgY29oZXJlbnQuDQoN
CllvdSBtZWFuIHRoZSAjeGVuLHN0YXRpYy1tZW0tYWRkcmVzcy9zaXplLWNlbGxzPyBJIHRoaW5r
IHRoaXMgaXMgdGhlIG9ubHkgb25lDQpleGlzdGluZy4gSSBjYW4gYWRkIGFub3RoZXIgcHJlcmVx
dWlzaXRlIHBhdGNoIGluIG15IHNlcmllcyBhZnRlciB3ZSByZWFjaCBhbg0KYWdyZWVtZW50Lg0K
DQpLaW5kIHJlZ2FyZHMsDQpIZW5yeSANCg0KPiANCj4gPg0KPiA+IENoZWVycw0KPiA+IEJlcnRy
YW5kDQo+ID4NCj4gPj4NCj4gPj4+DQo+ID4+PiBDaGVlcnMsDQo+ID4+Pg0KPiA+Pj4gLS0NCj4g
Pj4+IEp1bGllbiBHcmFsbA0KPiA+DQo=

