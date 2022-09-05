Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEC65AD7DA
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 18:50:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399058.640092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVFIX-00006t-AR; Mon, 05 Sep 2022 16:50:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399058.640092; Mon, 05 Sep 2022 16:50:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVFIX-0008W5-7L; Mon, 05 Sep 2022 16:50:09 +0000
Received: by outflank-mailman (input) for mailman id 399058;
 Mon, 05 Sep 2022 16:50:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fkdn=ZI=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oVFIV-0008Vz-1N
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 16:50:07 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60042.outbound.protection.outlook.com [40.107.6.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca7f0992-2d3a-11ed-a016-b9edf5238543;
 Mon, 05 Sep 2022 18:50:05 +0200 (CEST)
Received: from AM0PR06CA0089.eurprd06.prod.outlook.com (2603:10a6:208:fa::30)
 by DB9PR08MB8268.eurprd08.prod.outlook.com (2603:10a6:10:3c4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Mon, 5 Sep
 2022 16:50:00 +0000
Received: from VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:fa:cafe::c5) by AM0PR06CA0089.outlook.office365.com
 (2603:10a6:208:fa::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Mon, 5 Sep 2022 16:50:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT014.mail.protection.outlook.com (10.152.19.38) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Mon, 5 Sep 2022 16:49:59 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Mon, 05 Sep 2022 16:49:58 +0000
Received: from 13030c8d0800.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 336275C0-539B-4292-AC8F-EC1EA1770CC2.1; 
 Mon, 05 Sep 2022 16:49:52 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 13030c8d0800.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Sep 2022 16:49:52 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AS8PR08MB6614.eurprd08.prod.outlook.com (2603:10a6:20b:338::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 16:49:51 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 16:49:50 +0000
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
X-Inumbo-ID: ca7f0992-2d3a-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Ns16w31PCAYT3J3bG8/NiIcq/INHb3WF9w9IiXHq4DcUeqkFOlM05QnfZsnsWEOo+zgW+U3Tn06zQxfvXAhihe0a91HUd8pDIpSl+4jD2hiXMeeGrQOpg3WVCLSO3V8xpv5epT/heNNQ4VPV3Nl6DmfayCqw1tm9dcRb9C/ptu8OCuNV6jBgIdJwaIp327zRabIclAWeNRPA7SyRIvi5LzCpQEXGCS2Gu4EqNM9YYQTDdw5tRRk6kOyXhD/+fq9CEOKpr1UQsc6opomz8VoARzsId4QPqKzIGJHUmGhX+p//mzI6PFZ4WHu7uJt1cIDSaMhHDe6i861ac3j+mdojsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=astuJcRJ4TaYXeCiH+Cc4vRFAdkcIwqCPz+W13vNrrI=;
 b=msdKuoGKKlmHak9ZD3AOC4G7tcyVD7f8s/y5aAv5O36ttdwWzyCUzE+g8+fC6lBmTvfUgez+NUdTx3P2TPzaNUzZ/6st8AHvTMMJM2gDIBqj+PaNpo/NRGncWegotRR19sFXg05rnyxHzfr18JOyqAfJwNHGR1WMxGBrDfMbnWmynjv9csPCi9skz9QvsHvqmG57XHKIjf8TEP/I3QG864I9M+BLcsgIcSQIRKLE92aN1IR1/usxm0jmo/XimsSwnjvaQdIFTQsGpB9d3zdw39VbJzCw8XYEUK15mj7W2hnvNSRgLOSibI6gO4Wb/vFAimlbSUVoFAiwuEb3fcwvxw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=astuJcRJ4TaYXeCiH+Cc4vRFAdkcIwqCPz+W13vNrrI=;
 b=5e1U84I6iKp8aegkf7++VbC+b7Bub1gtIn4rT3O1eHcd/jzgJN/wll910AahqJ7w9HoFD1Co7/DwgmiX2awMYbkKyaolq860OlJmZ6NVvcz+KyqmXiF3klC0109QYxoCJ5gopYx9FB7+yRS71iwXhNCGJQId5m4JrEiRkdjU+EE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e39834c7f27cb9d1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TzrCKBZY/9MBrce+2vLzeXClEjmqas4TAk+MroyGjEgfnfTz5fCQ8/ysqa2RgR7jmvP+iOmI+TY6zZue6sBcZC5Ty7ZhwrM6k51DLJpGvJJZJ67qmZU7QxsJFo7xlkMjz5HWMt3GNm36Gl7X6Tk2Vswy1IvNHdGGn+gciUJ08eZgQLf2YvSM0BqZGxxfsQi9Z3Fn5PxNmGzSPAJC/d0Ln3YKPXBiuzD6723Yv2jVE6S1dpjBo3sWLFyAH+3hX5AbKMOFnTawyYPd6CZYO9dp37HcRNhnBsSJeriy0RGiq+6H+L/imll+aoTSdQ5nUsUmyyz6iRpRbG6ibd1rgArHZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=astuJcRJ4TaYXeCiH+Cc4vRFAdkcIwqCPz+W13vNrrI=;
 b=DNf0pI3JkAzUAC2xanO2n4LCCruLIiX78qeAmkZONjj5n1/ftlVz+9LNgpIvt9jdp62AtHOOAo26sJugPFewXfmdE1iXtzQjBZfL+u9rC+99RNv7uSIV0aL1ZjTydhQ5fMf1k8itRq+nD0IYLBiJYRaGwtGtx4xgok3UoRCOLzWBvgGuyMHpGN/jMAXB8P+PCQxDzl/sWNv1FeTsR4O8HRpd0gxEg2J+G+BtwVUmaFvngxU/AmvVGpu4Hdx+SGRz4uGU2pDeJBZRWjd8OZkgYW1nHmGSmv9wrUzuN1MzY99B2JfSuJ1q9SazTK8CSqMYU+p459Z1l4FPj1EOlcBq3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=astuJcRJ4TaYXeCiH+Cc4vRFAdkcIwqCPz+W13vNrrI=;
 b=5e1U84I6iKp8aegkf7++VbC+b7Bub1gtIn4rT3O1eHcd/jzgJN/wll910AahqJ7w9HoFD1Co7/DwgmiX2awMYbkKyaolq860OlJmZ6NVvcz+KyqmXiF3klC0109QYxoCJ5gopYx9FB7+yRS71iwXhNCGJQId5m4JrEiRkdjU+EE=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Zhou Wang
	<wangzhou1@hisilicon.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 03/10] xen/arm: smmuv3: Ensure queue is read after
 updating prod pointer
Thread-Topic: [PATCH v3 03/10] xen/arm: smmuv3: Ensure queue is read after
 updating prod pointer
Thread-Index: AQHYwUUf4E2j4BiT+ESEZERmzSI0nK3RCQUAgAADdQA=
Date: Mon, 5 Sep 2022 16:49:50 +0000
Message-ID: <41229BFA-D9F9-442D-92D2-67354897B5EA@arm.com>
References: <cover.1662394710.git.rahul.singh@arm.com>
 <bd55c05d7197b72cb4597c7412fc4911fa2281d1.1662394710.git.rahul.singh@arm.com>
 <885a4f6b-8350-229d-55da-4171eeafb800@xen.org>
In-Reply-To: <885a4f6b-8350-229d-55da-4171eeafb800@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 723b1b4f-f43b-4970-5d1d-08da8f5eab84
x-ms-traffictypediagnostic:
	AS8PR08MB6614:EE_|VE1EUR03FT014:EE_|DB9PR08MB8268:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5i7S+4pDMZNmPE07QpL1lhvJ3PaxIw7qamW8uj0OOK8QbvnbSojFTKWsPGQ6kcyCX2yTwGVnNKapKTBqE0xTUaiti7res/WHcAXlVISTwdVVBJIqsiZGK1fn/plmovC+aQnbhtFHbjO23hJ9NS0YcyQ4vIpdp+M0tu41HlbVjsechLjj5jiXYBx/3jgXfbcaE3nRPP08qbXXNtsiVjyuIeUR3pGib70XGfDOgp6RUVfiQT5DVoks2btCIKaIW4tBWNGcPU8ZNrq1t7dijzZstM84fk4lM2QhD42HfBUo2FKNKrGKg+Qkqz3sIg17VMZKP9FD4wM2o4HlYYJK+dolaeolWU+ECdMelNlvo1U47DRk4UTrnLLnWErstXQGim6y8eM322JYgPdxMBr0gC4iHFVFfRY5RUW0o+TsfQAV0fytWc6kgXecDxlEKzV9FyNSbDnyGOQ4MRHa3ix5aIxCn1yte79vzvNpp/kOyJESgi+xqgkuwXSzSihQlH4MvH8EGpiockd/PHdGwdU2/3A2RZ0uZ/nIF8eVx2pTQZmGu9HjO0J2ThsMK2LenEOZVah9e1qMS4HFTF60+8VOjU56N5grJGB/qsTyLt7MnGf/+cQIcII4YsUlRXFDZeg3gcY1OQCkY7r3jy7/ndzttkbXRGRqzkgPnRaFD2O06HTIO+jQzmsoeVp/HYfMts1GHUIKvvIVV8v+CENaI2I7BXP/zoSyvJpmgl5LdPSECvdelDd7i0pUmriCzQl62N2uhdGUVvKoxnSQfboX/MfJG9t73o7uqFeve9y5haHL5S4xFyZGyhSCHtGXiWKiWLvFD72QI2JC3elxPBjECDLBYC3XvQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(39860400002)(136003)(396003)(346002)(64756008)(66556008)(8676002)(4326008)(33656002)(66446008)(76116006)(91956017)(66946007)(8936002)(5660300002)(6506007)(83380400001)(26005)(53546011)(478600001)(6486002)(966005)(71200400001)(41300700001)(186003)(2616005)(86362001)(316002)(6916009)(54906003)(36756003)(66476007)(2906002)(38100700002)(6512007)(38070700005)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <91DAE0AFFC2E254588F8EBA884F06B3B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6614
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	445acbed-ffaa-4ef5-0be0-08da8f5ea681
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vxTUsy7dDLgFv1zWpPU+djoGllrjv7glDgdi7bYSkPtRzjcAZ5gw7pxHfNJad5IRkKc7/S8iMeTU/BzP7SXO6IO0oZA9dG80VnHbzlESJyH2TwBmx9ko0Cj2RuvJ1UFiIPSGWna2t8nf9VZK69TpKHwCRr0cSGUmn9fASj9JDpjFwMSb5f7vsY3Kh/OnhiYnoaVixCTP3TJ+HAth+MZ0dAV57+gFvE+fqWrjCgvSkqDOi9/nTvQJjjGphDHUrKeqWbxNVsRiW+hDv03r+hrWwdghZ6FTar4758JssVntqP8P2UrJrAzDwx8qK95aDwPjiyyeaGD/e645g4Sy9bmGXxnuD8l69mukpN7hnBkvwh4NvZ+qsGHxaybJrBQCnU1UXOWyD4M4gBDxpGl+EYFY0zib0rRHXwyOcPMFDwfMLJFFloCOHU8lAsifLCu+lBOAN/0fuVyG/1VpL8jk2DzunzkZY/do8vqUW17bGFh8bfjxA2KUNsAdjWD0Y4rBBbR4612hMWMDKnDXYOo7ln348iVyz7EDTuNOZ9PKnWh8vx2J7Emj5LX+mr5vsemlH2rqAHGsW9g4hraPAVGqNTjpnAdm2bEQ26iWeq2njtB+20pQR8q/jwF6c724Ee/aUXrtR6tMCv6eXnBwBPTnSqNqJQ3VhnbtAlXl9JC8wfAbNeA1pwugZF73Cm8GLdsCq0uaaR7OINiml6ExcrEBCC9UVeaRF9ixH6Zy69tckJus0YzmTnlORHqcePlN8wJkcs2QzCGTRsBMSb4jSzIMbGxtaOGsM+kTdbYm09VqGLXw1i0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(396003)(39860400002)(36840700001)(40470700004)(46966006)(6512007)(6486002)(82310400005)(53546011)(4326008)(2906002)(5660300002)(36860700001)(26005)(6506007)(316002)(47076005)(40460700003)(356005)(966005)(8936002)(33656002)(6862004)(478600001)(86362001)(81166007)(41300700001)(186003)(107886003)(336012)(2616005)(40480700001)(83380400001)(70586007)(82740400003)(54906003)(36756003)(70206006)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 16:49:59.2372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 723b1b4f-f43b-4970-5d1d-08da8f5eab84
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8268

SGkgSnVsaWVuLA0KDQo+IE9uIDUgU2VwIDIwMjIsIGF0IDU6MzcgcG0sIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAwNS8wOS8yMDIyIDE3OjMw
LCBSYWh1bCBTaW5naCB3cm90ZToNCj4+IEZyb206IFpob3UgV2FuZyA8d2FuZ3pob3UxQGhpc2ls
aWNvbi5jb20+DQo+PiBCYWNrcG9ydCBMaW51eCBjb21taXQgYTc2YTM3Nzc3ZjJjLiBSZW5hbWUg
X19pb21iIHRvIGlvbWIoKSB3aGlsZQ0KPj4gbWVyZ2luZyB0byBnZXQgaW4gc3luYyB3aXRoIG90
aGVyIFhlbiBkZWZpbml0aW9ucy4NCj4+IFJlYWRpbmcgdGhlICdwcm9kJyBNTUlPIHJlZ2lzdGVy
IGluIG9yZGVyIHRvIGRldGVybWluZSB3aGV0aGVyIG9yDQo+PiBub3QgdGhlcmUgaXMgdmFsaWQg
ZGF0YSBiZXlvbmQgJ2NvbnMnIGZvciBhIGdpdmVuIHF1ZXVlIGRvZXMgbm90DQo+PiBwcm92aWRl
IHN1ZmZpY2llbnQgZGVwZW5kZW5jeSBvcmRlcmluZywgYXMgdGhlIHJlc3VsdGluZyBhY2Nlc3Mg
aXMNCj4+IGFkZHJlc3MgZGVwZW5kZW50IG9ubHkgb24gJ2NvbnMnIGFuZCBjYW4gdGhlcmVmb3Jl
IGJlIHNwZWN1bGF0ZWQNCj4+IGFoZWFkIG9mIHRpbWUsIHBvdGVudGlhbGx5IGFsbG93aW5nIHN0
YWxlIGRhdGEgdG8gYmUgcmVhZCBieSB0aGUNCj4+IENQVS4NCj4+IFVzZSByZWFkbCgpIGluc3Rl
YWQgb2YgcmVhZGxfcmVsYXhlZCgpIHdoZW4gdXBkYXRpbmcgdGhlIHNoYWRvdyBjb3B5DQo+PiBv
ZiB0aGUgJ3Byb2QnIHBvaW50ZXIsIHNvIHRoYXQgYWxsIHNwZWN1bGF0ZWQgbWVtb3J5IHJlYWRz
IGZyb20gdGhlDQo+PiBjb3JyZXNwb25kaW5nIHF1ZXVlIGNhbiBvY2N1ciBvbmx5IGZyb20gdmFs
aWQgc2xvdHMuDQo+PiBTaWduZWQtb2ZmLWJ5OiBaaG91IFdhbmcgPHdhbmd6aG91MUBoaXNpbGlj
b24uY29tPg0KPj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8xNjAxMjgxOTIyLTEx
NzI5Ni0xLWdpdC1zZW5kLWVtYWlsLXdhbmd6aG91MUBoaXNpbGljb24uY29tDQo+PiBbd2lsbDog
VXNlIHJlYWRsKCkgaW5zdGVhZCBvZiBleHBsaWNpdCBiYXJyaWVyLiBVcGRhdGUgJ2NvbnMnIHNp
ZGUgdG8gbWF0Y2guXQ0KPj4gU2lnbmVkLW9mZi1ieTogV2lsbCBEZWFjb24gPHdpbGxAa2VybmVs
Lm9yZz4NCj4+IE9yaWdpbjogZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdCBhNzZhMzc3NzdmMmMNCj4+IFNpZ25lZC1vZmYtYnk6
IFJhaHVsIFNpbmdoIDxyYWh1bC5zaW5naEBhcm0uY29tPg0KPj4gLS0tDQo+PiBDaGFuZ2VzIGlu
IHYzOg0KPj4gIC0gcmVuYW1lIF9faW9tYigpIHRvIGlvbWIoKSBhbmQgYWxzbyBtb3ZlIGl0IGZy
b20gY29tbW9uIGZpbGUgdG8NCj4+ICAgIHNtbXUtdjMuYyBmaWxlDQo+IA0KPiBIbW1tLi4uIFF1
b3RpbmcgQmVydHJhbmQ6DQo+IA0KPiAiV2UgbmVlZCB0aGUgX19pb21iIGFzIOKAnGxpbnV4IGNv
bXBhdGliaWxpdHnigJ0gaW4gZmFjdCBzbyBJIHdvdWxkIHN1Z2dlc3QgZm9yIG5vdyB0byBvbmx5
IGludHJvZHVjZSBpdCBhdCB0aGUgYmVnaW5uaW5nIG9mIHNtbXUtdjMuYyB3aXRoIG90aGVyIGxp
bnV4IGNvbXBhdGliaWxpdHkgc3R1ZmYgdG8gcHJldmVudCBhZGRpbmcgdGhpcyB0byBYZW4gb3Zl
cmFsbC4iDQo+IA0KPiBXaGljaCBJIGFsc28gYWdyZWVkLiBJIGNvdWxkbid0IGEgbW9yZSByZWNl
bnQgY29udmVyc2F0aW9uIGV4cGxhaW5pbmcgeW91ciBhcHByb2FjaC4gQ2FuIHlvdSBvdXRsaW5l
IHdoeSB5b3UgZGlkbid0IGZvbGxvdyB0aGUgYXBwcm9hY2hlZCBkaXNjdXNzZWQ/DQo+ICAgDQoN
CkkgYW0gcmVhbGx5IHNvcnJ5IHRoYXQgSSBtaXNzZWQgdGhlIG5hbWluZyBhbmQgd2hlbiBJIG1h
ZGUgdGhlIHBhdGNoIGluIG15IG1pbmQgdGhlcmUgd2FzIGEgY29tbWVudCBmcm9tIFN0ZWZhbm8g
dG8NCnJlbmFtZSB0aGUgX19pb21iKCkgdG8gaW9tYigpLiBJIHdpbGwgc2VuZCBvbmx5IHRoaXMg
cGF0Y2ggYWZ0ZXIgZml4aW5nIG9yIGRvIHlvdSB3YW50IG1lIHRvIHNlbmQgdGhlIHdob2xlIHNl
cmllcz8NCg0KUmVnYXJkcywNClJhaHVs

