Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 129A77E9B5D
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 12:48:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631546.984951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2VPw-0006ZY-D3; Mon, 13 Nov 2023 11:47:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631546.984951; Mon, 13 Nov 2023 11:47:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2VPw-0006XN-AK; Mon, 13 Nov 2023 11:47:48 +0000
Received: by outflank-mailman (input) for mailman id 631546;
 Mon, 13 Nov 2023 11:47:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SuZE=G2=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1r2VPu-0006Tq-Tz
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 11:47:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2043.outbound.protection.outlook.com [40.107.7.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7574201a-821a-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 12:47:44 +0100 (CET)
Received: from DU7PR01CA0048.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::17) by PAXPR08MB7350.eurprd08.prod.outlook.com
 (2603:10a6:102:227::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 11:47:14 +0000
Received: from DU6PEPF00009525.eurprd02.prod.outlook.com
 (2603:10a6:10:50e:cafe::f5) by DU7PR01CA0048.outlook.office365.com
 (2603:10a6:10:50e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31 via Frontend
 Transport; Mon, 13 Nov 2023 11:47:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009525.mail.protection.outlook.com (10.167.8.6) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.13 via Frontend Transport; Mon, 13 Nov 2023 11:47:14 +0000
Received: ("Tessian outbound e243565b0037:v228");
 Mon, 13 Nov 2023 11:47:14 +0000
Received: from d63851659faf.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F010659D-57A1-4E7C-BA56-CD676D3A8DC8.1; 
 Mon, 13 Nov 2023 11:47:02 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d63851659faf.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 13 Nov 2023 11:47:02 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAWPR08MB9065.eurprd08.prod.outlook.com (2603:10a6:102:332::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 11:46:57 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a045:911e:2349:3d8b]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a045:911e:2349:3d8b%6]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 11:46:57 +0000
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
X-Inumbo-ID: 7574201a-821a-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AFNn3NUr36auTWBsie4V1sSA4HHGfemdZsGtKf1droWm7QZBHFyvf+uC5SWlYQxK8JLNTbbzogtwhaL26BlyUW2jMYQcO9r9g1HqWJpyTSo+ofmjtbrNB+1MfVrv+1mr2eXm3fzVpu/vk8ILTQQXW2SmVtbTUmJ7ZdBUFkw+wentdeD8lxrZ/M0mq4Aa/9zz2lBgG9c3VkT0YpeHfWQeDcd2IB3qveBHdxL7SHh/ThkVUJznDAfsvSUH/nCwYGo5zSnVd5Nm2OznxnAoxjtdbxFN+UgHNvtbhbWA7FugilFjpySinVSMwjUCIAzWPHOpMKME17qP7oaqKqDuO1FMhw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTWaOxE6dzqJtw23kAT2/4a6cdqCdv9JRCYfJ8OKIxE=;
 b=iT2c62dcZrgc1zw4zuLUjw9xMDLjLrD7R33QXZg5HQY5vIOFGsLy1ZTLyOd0Hs/avE+5+OVEjh0JS8NitOjse2YuNRXecCK5jlGxekxxBidTQ3N2qzMY6YNkV5yps4Ye2lcXCiGb6Tixcv8wibMThx0H5G7kaM0fYR5VzRAf+ecA2GnufTK8i+h4JlngomPcit8pjXiHaqxwV4R3l439tWet6xBRPlVQin1ejfB8n7FYrlUTwhXM3s65pmgJVEazROwiSj6pvJB7yPuH1tViol9uvN8+9LK6qrbbp4YFG6Y+ROaxy+wR0GMKLxnaNZaAFV7y/N6mNkz1vC5E7OT8Hg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTWaOxE6dzqJtw23kAT2/4a6cdqCdv9JRCYfJ8OKIxE=;
 b=H3obMnqFLZYSBb/3nB9aLPbBU0ACfYiEzQ2Z95fJCMengLOCvpeRSBfbOfjS0tigDsmlXfcf7+69Lbenm+SzTG//MfQtlDg1WkRxwmhjQtbxaPb8Rgm8aZONMrEViML9stBHiUCiQ7xQforb7UpDFigvFnJEnx33jICWH7uAE5g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: edc1f45b1b6f4fdb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSpkjYtiaGkOS7ufGrThtNUi6hWZoLuEZh9s8HZfjMa3pihdjjsI9gQE2Cc+8d7T3yJJ/ql1MDqEnfTr4/uZju6IO0pSI7j1IWy+Yzpi/LZTQrz4xOeiC288vvg5tsh8mQrCGkT7hQ1azN+g/RrsTN/XhlLC1TtsBqxfYrZCLV1lVoivvLas/REuOabnyEQ07AKPoL84U2AnD/1WSloPlD46yTVy+4dLWbgvFboDOeQqFP3leEmLfy1i84cp0CdcId1A/gEt329N5/EQ4maEFis7N6tSfPCZyHePaoloWL2fHOo0Sv18LstSnI+6YeYgZ37SSgcDbYs0g+5ZtGZzYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTWaOxE6dzqJtw23kAT2/4a6cdqCdv9JRCYfJ8OKIxE=;
 b=Zmo7+DHiUSUS+/rh8nHdZMDS0+USasi3PHHU6PQ+R/Q5WKTqb7tXnM7mIhKOfbIqAbuSkfrAXh59x30wPd+vU44TfnlguUBd07Org+QHLiMKONRJBHJqh76EwisOh8f0iByuA2MGv3qQEeIWAnGBzscjbua4SWG9MfroSwmPHbcQOS5bo7GCK7HkLxIVTPiJYN+WyZSExjREeYxPNFhpakw2lyzISWvn8H5XZgiGGNWsVsD8nQEcI5hKQn0fj5bQ6kiIIOvHoqkf5h3ywWdCiO2jGyBdRyvi4yHH/C2Y2sv9LEavzu+YjlPXVxPWv7y22UDuU4nBoURPHMwAY0jE/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTWaOxE6dzqJtw23kAT2/4a6cdqCdv9JRCYfJ8OKIxE=;
 b=H3obMnqFLZYSBb/3nB9aLPbBU0ACfYiEzQ2Z95fJCMengLOCvpeRSBfbOfjS0tigDsmlXfcf7+69Lbenm+SzTG//MfQtlDg1WkRxwmhjQtbxaPb8Rgm8aZONMrEViML9stBHiUCiQ7xQforb7UpDFigvFnJEnx33jICWH7uAE5g=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Thread-Topic: [PATCH v3 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Thread-Index: AQHaEuwOi1mHiP9SFkaZdsiI0By9x7Bx1QmAgAY1JYCAAB4iAA==
Date: Mon, 13 Nov 2023 11:46:57 +0000
Message-ID: <998BB5A5-515C-4656-BD94-9ACC461235E8@arm.com>
References: <20231109090615.3878767-1-luca.fancellu@arm.com>
 <20231109090615.3878767-4-luca.fancellu@arm.com>
 <bec276f9-ea9d-4c9f-887c-358a3f7815fd@amd.com>
 <7C92A577-716B-4D48-B685-3EA0C93AAF5C@arm.com>
In-Reply-To: <7C92A577-716B-4D48-B685-3EA0C93AAF5C@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAWPR08MB9065:EE_|DU6PEPF00009525:EE_|PAXPR08MB7350:EE_
X-MS-Office365-Filtering-Correlation-Id: dc1dc805-d17e-4ce4-2955-08dbe43e4777
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7vO3ReRMxRvY2Ndha+Hlr8v5DvN9Je/BCz9/Eilzqdx9zq/CHhHNcu0ZZj+GaviJ+xFwr/tSTbvU1DVaiPeGyO3sKbWjtJEqNG1BH+bvoNyIHGpu5Z56zmV9CuqXGn2BAMIysbBj/+r7NjOUHg6YHCIGBsJIGHnAjMpIgjc/GXK5EYHcuimciJZSjDxjtNcRaJ4HvcOmNBbCQlcnoYx0p8GlqfotswtGohF/GIF+T5LGLayQt7HDd8vckfIxNsIy1gJ8AC0RFFTC56W1Q/fio64ZDgCxub0BWVJ7xGuXvhHWtU/qMsqjIlKS73dK2UGSq0F4zAGOV4wDdoBV90YAgwf8KA7v0ZRaorrhNhoBP2fjpfrNnTts3foN4Oda7B9q9fnAMKAAB0zES1j+rpKBoiX6N139s5JqTTkOsONataPix7aHRWyZqLTlr7sv6KwgcI2yppCN8iMRG5F1KgIIlIvsmsHHk0FQOKKGqMXseYKLwJd0ABjDY5ynoW5glqPpge7oe/ZMKsQpIdEfyQpGDcY8WPu5WnMvZl5cC0ReimNcPeatCBL3RLAQqwnY9jq1gTB/QyVdVwbMrxQbU+snyHmDH1JIDKiXVSbz/ru7s8J+O1K+W3bf9ydMURy/FDVXrBQ8c3M2lsu0KLL4gFep8j830cxIVV7v5QCsLlbEALEnuxZH+exVJbA9E/IUpdkHd/81tVPTPp+4wgDnw99MrA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(39860400002)(376002)(136003)(230922051799003)(230273577357003)(230173577357003)(451199024)(186009)(64100799003)(1800799009)(6636002)(26005)(6506007)(53546011)(71200400001)(2616005)(6512007)(83380400001)(5660300002)(4326008)(6862004)(8936002)(8676002)(2906002)(41300700001)(6486002)(478600001)(316002)(91956017)(37006003)(54906003)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(122000001)(36756003)(33656002)(86362001)(38100700002)(38070700009)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F51679C5EBBBBD49ADF9B2954B072CD4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9065
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bbbe5889-492d-4338-4c1a-08dbe43e3d51
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BdPUUeNI6lRzjqMuf8FICdKvr1TbmONAQdK0AerXzixsMnPOwXvelDctEj9Gb3dEKeTeEHJTVsZYVX0+A2T2ul2aexo+8fdpoBQGxTGZDBPPmYeJgMtNMzvlzwJtC5E7F1gBJgCosYxI3PNw23ZE5hQJfadAug1J3rfHuw5ZX4EQOVrZzDEW/Z0hVBwU46Iv2ESXqrpb1BkjO1jjppvcT4OOQ+3bRRqfn1h1Q2LlF09KSPuA/h+w4Vk75IVPlDo1f3xzJHmTfQ1IBodJmEDdTzH7+3I+D42fOZTTQOj0tK2p5/ozdK8Kz+H+cGO5MDd6wTVl8M1ISr4mirgLor9Z3NXt/lCPUBuCuYO5ZBg535XR/s7A6sW4E2tu8qPFHKPNk3hEnKP9xpzBOimxO2ka2snwxkgbdRvyMz9My5YM1piHUhhW8GbEQqF7JrjnRtjbK4NBlfNv+qVXN+3aW88O/YISsZHWoq+tzAk2bEzHGi5BWMfmMQ6JRFR5d36Yybyqgc5odsfVpkfrVhBMiSgB4+6/TTCIEqRH7Hp8RkuhzX1guKYwWuSOo9skag3IMoJiIjShAfccgVerRl0oJMZqm4FG76aFNdqoFp9v5Bt6yzWM9g8wVgzxlKM3kMVHTjHzZOTbTGSvKNt1rOIwzMypXRXNQBBIdfTMbXDJjDXwSzyf9P8tDIX5F6CWAxdpRWQIEnwxwOTjcSiiy5lKjYOIyc6lZsDU0QuAZBtgtfP4QtmNa3s/dW1GLXznkQaTIbe+dyzbbbPusFuHeq9oKWA+cwUxDgEZpZSjfMoi30HlxYo=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(39860400002)(136003)(346002)(230273577357003)(230173577357003)(230922051799003)(64100799003)(451199024)(186009)(82310400011)(1800799009)(40470700004)(46966006)(36840700001)(40460700003)(4326008)(6862004)(8676002)(8936002)(316002)(70206006)(70586007)(6636002)(37006003)(54906003)(2906002)(33656002)(41300700001)(86362001)(5660300002)(83380400001)(81166007)(47076005)(356005)(2616005)(107886003)(82740400003)(336012)(26005)(36860700001)(478600001)(36756003)(6486002)(40480700001)(6512007)(53546011)(6506007)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 11:47:14.1154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc1dc805-d17e-4ce4-2955-08dbe43e4777
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7350

SGkgTHVjYSwNCg0KPiBPbiAxMyBOb3YgMjAyMywgYXQgMTA6NTgsIEx1Y2EgRmFuY2VsbHUgPEx1
Y2EuRmFuY2VsbHVAYXJtLmNvbT4gd3JvdGU6DQo+IA0KPj4gDQo+Pj4gDQo+Pj4gVGhlIGZ1bmN0
aW9ucyBhbGxvY2F0ZV9zdGF0aWNfbWVtb3J5IGFuZCBhc3NpZ25fc3RhdGljX21lbW9yeV8xMQ0K
Pj4+IGFyZSBub3cgZXh0ZXJuYWxseSB2aXNpYmxlLCBzbyBwdXQgdGhlaXIgZGVjbGFyYXRpb25z
IGludG8NCj4+PiBkb21haW5fYnVpbGQuaCBhbmQgbW92ZSB0aGUgI2Vsc2UgYW5kIHN0dWIgZGVm
aW5pdGlvbiBpbiB0aGUgaGVhZGVyDQo+Pj4gYXMgd2VsbC4NCj4+PiANCj4+PiBNb3ZlIGlzX2Rv
bTBsZXNzX21vZGUgZnJvbSBzZXR1cC5jIHRvIGRvbTBsZXNzLWJ1aWxkLmMgYW5kIG1ha2UgaXQN
Cj4+PiBleHRlcm5hbGx5IHZpc2libGUuDQo+Pj4gDQo+Pj4gVGhlIGZ1bmN0aW9uIGFsbG9jYXRl
X2JhbmtfbWVtb3J5IGlzIHVzZWQgb25seSBieSBkb20wbGVzcyBjb2RlDQo+Pj4gYXQgdGhlIG1v
bWVudCwgYnV0IGl0J3MgYmVlbiBkZWNpZGVkIHRvIGxlYXZlIGl0IGluIGRvbWFpbl9idWlsZC5j
DQo+Pj4gaW4gY2FzZSB0aGF0IGluIHRoZSBmdXR1cmUgdGhlIGRvbTAgY29kZSBjYW4gdXNlIGl0
Lg0KPj4+IA0KPj4+IFdoZXJlIHNwb3R0ZWQsIGZpeCBjb2RlIHN0eWxlIGlzc3Vlcy4NCj4+PiAN
Cj4+PiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpcyBpbnRlbmRlZC4NCj4+PiANCj4+PiBTaWduZWQt
b2ZmLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQo+Pj4gLS0tDQo+
Pj4gQ2hhbmdlcyBmcm9tIHYyOg0KPj4+IC0gbW92ZSBhbGxvY2F0ZV9iYW5rX21lbW9yeSBiYWNr
IGluIGRvbWFpbl9idWlsZC5jLCByZW1vdmUgaGVhZGVyDQo+Pj4gIGZyb20gZG9tMGxlc3MtYnVp
bGQuYy4NCj4+IEkgY2FuIHNlZSB5b3UgcmVtb3ZlZCB0aGUgY29weXJpZ2h0IGZyb20gLmMgYnV0
IC5oIHN0aWxsIGhhcyBpdC4gVGhpcyBhbHNvDQo+PiBhcHBsaWVzIHRvIG90aGVyIG5ld2x5IGlu
dHJvZHVjZWQgZmlsZXMgdGhhdCB3ZXJlIHN1YmplY3Qgb25seSB0byBjb2RlIG1vdmVtZW50Lg0K
PiANCj4gSeKAmXZlIGp1c3QgcmVhZCBhZ2FpbiB5b3VyIGNvbW1lbnQsIEkgcHVzaGVkIHRoZSB2
NCBidXQgcmVtb3ZpbmcgdGhlIGhlYWRlciBvbmx5IGZyb20NCj4gZG9tMGxlc3MtYnVpbGQuaC4N
Cj4gSSBsZWZ0IHRoZSBoZWFkZXIgaW4gdGhlIG90aGVyIHN0YXRpYy0qIGJlY2F1c2UgdGhhdCBJ
IHRoaW5rIHdhcyBjb2RlIHByb2R1Y2VkIGJ5IEFybSwNCj4gcGxlYXNlIGxldCBtZSBrbm93IHlv
dXIgdGhvdWdodHMgYWJvdXQgdGhhdCAoeW91IGFuZCB0aGUgQXJtIG1haW50YWluZXJzKQ0KDQpF
dmVuIGlmIHRydWUsIGFkZGluZyB0aGUgY29weXJpZ2h0IGFmdGVyIGlzIGEgYml0IG9kZC4NCkkg
ZG8gbm90IHRoaW5rIHRoaXMgaXMgY29kZSBvbiB3aGljaCB0aGUgY29weXJpZ2h0IHJlYWxseSBo
YXMgaW1wYWN0IHNvIEkgd291bGQgbm90IGFkZCBpdCBkdXJpbmcgdGhlIG1vdmUuDQoNCkNoZWVy
cw0KQmVydHJhbmQNCg0KPiANCj4gQ2hlZXJzLA0KPiBMdWNhDQo+IA0KDQo=

