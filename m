Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C685809B7
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 04:59:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374916.607117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGAlq-0007AN-8y; Tue, 26 Jul 2022 02:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374916.607117; Tue, 26 Jul 2022 02:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGAlq-00078c-3p; Tue, 26 Jul 2022 02:58:06 +0000
Received: by outflank-mailman (input) for mailman id 374916;
 Tue, 26 Jul 2022 02:58:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=znrZ=X7=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oGAlo-00078W-7U
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 02:58:04 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70079.outbound.protection.outlook.com [40.107.7.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c281a1c2-0c8e-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 04:58:01 +0200 (CEST)
Received: from DB7PR02CA0018.eurprd02.prod.outlook.com (2603:10a6:10:52::31)
 by AS8PR08MB6993.eurprd08.prod.outlook.com (2603:10a6:20b:34a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Tue, 26 Jul
 2022 02:57:58 +0000
Received: from DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::d5) by DB7PR02CA0018.outlook.office365.com
 (2603:10a6:10:52::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25 via Frontend
 Transport; Tue, 26 Jul 2022 02:57:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT018.mail.protection.outlook.com (100.127.142.74) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Tue, 26 Jul 2022 02:57:57 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Tue, 26 Jul 2022 02:57:57 +0000
Received: from e57ac9db520e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E88F58AF-4E4E-4B51-86A2-ABEF76E21249.1; 
 Tue, 26 Jul 2022 02:57:47 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e57ac9db520e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Jul 2022 02:57:47 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by VI1PR08MB3917.eurprd08.prod.outlook.com (2603:10a6:803:c1::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Tue, 26 Jul
 2022 02:57:42 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f90a:69e3:64e7:fdc0]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f90a:69e3:64e7:fdc0%8]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 02:57:42 +0000
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
X-Inumbo-ID: c281a1c2-0c8e-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SOQUyUpLGZflfDdJoX3E50wDi/BacDiGMW78p9zU8NSkjFWC80G1OsyQhROJvdeFHW1XpIO2S2j3N8GdPTa9B9ZpsRO9IrwTKVaPq1k7XqZgvnLmK6Fapq5Tk+nR4gyeQp7TWqyv03e+OlXNYPKndio2PvvsW89wN3HiZ2DUptdd5vbnm+g6LsTfw1Y7UVtG93awmiQQFkJI3YOScjRpZheSWOHjEKoptx6eN7X5AYEH3MO5LtVlYtN0Kon8ZJ+Au1S2VrNsTnBsczgxilaqO7+RQczYS3l0Sa0QbEBI9BL8NWYNSa6zb0yBBuC575vk7RtQHHhtHKfa12zMeNdu0A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EsSUfY5+XGWTbio/dwOVcg6/hGZYnAsP/J3Vbi1MDLI=;
 b=oCgRXqU1rusUCXZZwQXwFhj/FgJwaSrxL5suW7M0BQHPuh7Kjh82J8zNAz4Km/9Sm2Sf2SWDDDCjneYMDyF9Cfz6rli3tWYvSInassBuOwKOQJQYOiojnW763RcjwZr/DRUjunZJ7fWER5URbPwORIOVNKNtG5PW2Eo0PVHjekvIEjbNhR3lyrhqx7TzhK+RvBN5pWiAvSt6VMHt75CX0DzkpfpWwyH3uu4sDWe0a+XPxNvuYmG9CE08gK7NqGJIMF8IKhIvpA4sYUAX3+AJvyeqjq8rMuEgUVCjm6JlEqxsoKPQhRav4u25y/8HWGeJzTBtdahhFt6UU6AF7IyTTA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsSUfY5+XGWTbio/dwOVcg6/hGZYnAsP/J3Vbi1MDLI=;
 b=zx/RxTyQT/HvK9BTPtMhi2rvFAaOLJ3xL+t2hxWQ8ZH4a2h1DiQoBQ3RmdwuajDQGng++27vcxF8LEHiG3Gkl2Pu5LkjD/ToQvvcEkg8yPE5e2GBhirgci3J0Ao4F3WJHT2PZN2fYxMRwNsCBfMZ1EQlhPhx1HC/jeYjbsPHZHg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnVL9raBaRyBhy7YJ+ITeSYVqUDstN3bm0r35aK3f/dgCKkyfvpDaSsWQkM+LondPEPH9Ul6LVHvEkeSz7RLuLUP3IkRuYsU4x7eh0XiNvgmUX954AiSAmwZcargSL0VWaZ5eb75rH/S3ZbsI3M/OR2+5+3Y0hOCyKASM/B65HvXqT0R0zv23uLV2b0Si1A6IiNiEX9tFIl2HXnCOjrqozCOAFlxzBSqBnkj+B1Am0ymJEaZ6kEP/234y9LC2/N8GtUeLZ9IXTQlFdkHElp3ISKbq0mYs8R2Au9hjbEJv14kjRphUlyGdVKIa6RBP1t3QOgFAbRKqpPLcH9YJU4X1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EsSUfY5+XGWTbio/dwOVcg6/hGZYnAsP/J3Vbi1MDLI=;
 b=YhMozm/0HWzeeGhM8lKCksutQsJmtYIKIEpZWWlUc+YIHovvJUfujAKBvLpmNx0LIAIo9oNmITQBpJ4hAWHZsRh0or2xn2lTTqnnMi/5Sby8OO4yRk48+3V4wAP1yqHrdttRrZWLWcLGc9saOl6kwq4+8pLhARwl0/0jrbBAyko1UI7VoqNvIouiYqRUVryFUU0TjqaukMViMAcQ63owK4XDB3EqkybytzstvDeB8K7BJ5imMFwq4+HWfmAlAkLcec1vWJfLloB2pHoTFktf6yc32+9ewxzzPUnP5oRLfvaGBeBSqJ6HHcW3nWd6/o5liTrsTYLfxdThvb5omy5DiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsSUfY5+XGWTbio/dwOVcg6/hGZYnAsP/J3Vbi1MDLI=;
 b=zx/RxTyQT/HvK9BTPtMhi2rvFAaOLJ3xL+t2hxWQ8ZH4a2h1DiQoBQ3RmdwuajDQGng++27vcxF8LEHiG3Gkl2Pu5LkjD/ToQvvcEkg8yPE5e2GBhirgci3J0Ao4F3WJHT2PZN2fYxMRwNsCBfMZ1EQlhPhx1HC/jeYjbsPHZHg=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v9 6/8] xen/arm: unpopulate memory when domain is static
Thread-Topic: [PATCH v9 6/8] xen/arm: unpopulate memory when domain is static
Thread-Index: AQHYm/wj+C+KkWoRC0CF4EH9AdaBLK2PQF8AgAC9HgA=
Date: Tue, 26 Jul 2022 02:57:42 +0000
Message-ID:
 <DU2PR08MB7325D9F476CA130AC4E6AC30F7949@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220720054611.2695787-1-Penny.Zheng@arm.com>
 <20220720054611.2695787-7-Penny.Zheng@arm.com>
 <903b6203-a475-5a83-0b2a-f3a8fa345b73@suse.com>
In-Reply-To: <903b6203-a475-5a83-0b2a-f3a8fa345b73@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 18E04B3EA22F6444907F0A0647CE9536.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9dfcdfaa-b694-41c1-ce56-08da6eb2a500
x-ms-traffictypediagnostic:
	VI1PR08MB3917:EE_|DBAEUR03FT018:EE_|AS8PR08MB6993:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +4ZHvwmets/61dToATWOaq7/UGA762zSs9H3GI4Z5sDGLDl7Xj3a0/qmZQFvHQUXWAMuNqd2Lgk93ph/h/XJ3C5iPCm/tNlJfdKaqem8fBaawK3+AFSp67HpJFgrTnYOIDTbMFSRpuNft5BPnHUYcE4kSmSx6RCeSIO5OWqhJwhOv1wKWezbjxT7b5RUYlFltVxcqGNwzTppjQHJVi97biXZlHUHFaEeMyWYqhFGAmEZYmDFzxYcTOlChsduMTFS4drZqz9LimpVDT2Hq/j9yskITg1MisTgdOlJI6qse5mIRUNwfXj3VsgXRIGY5LvN3rUhzeDOKvSNoxZW7qY2pCtn2h3dzNaLjVS9dVvSPDpU3dd4YMsabfbLDLQn8/7xyQb7/Ej2+bPfDo2F9kBG/JwZNF2kfexaN2yjFzTtE5lYfIfk9eoP6dbFi79DMYhCWaT7x8+Wzrz8SlI+UBtiVyItc4YeOhSKC7gD8HvmDr75RSaGiTXcy/Ekyotme3i3ctpMQzkvTnuixMSODhA9C3LB0DXViKKjWA8LcgjWmn08GZ+kXOED4w/QMVG+HcmTvKb9ddQ8RFP5MlyKPoWItffrxBw9Ty4c8u9YmEvYKwBcpnOsHZzj3cEfP+rRl2QNBApXEJTgC3tSZ9Lwhq/C8rDkStY31PUDI7eVrjwUhY+hEuvY4Zy0+em2DnJuf7OjPEnr4yh3VJkIEOQ4KReJifnHaWo02xFlfdxtgg4Z3fX9K9YBepUZ4LWOEzoWJBH5qpyZofhaWSqwKlbicWBLI/gGJTtgwYNondX0f65E0v1vqIFnDf57H4w7KOpKSvbX
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(5660300002)(52536014)(54906003)(86362001)(2906002)(55016003)(6506007)(8936002)(478600001)(7696005)(186003)(66476007)(76116006)(41300700001)(66556008)(66946007)(26005)(122000001)(38070700005)(4326008)(33656002)(71200400001)(66446008)(83380400001)(64756008)(53546011)(38100700002)(8676002)(9686003)(6916009)(316002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3917
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	83ca2e8f-e59d-44a2-b9e1-08da6eb29bf4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QGcVS2XSbNYwrlHTrE2MG+MbTivg70uS0d9lmE2xb83m/HnGS/NOGIOokmARkd13kjXmEIsjb8Jpju5LkxRD2m0Qzff1KewvSNhOBBogl71PuD7PBO5IAQ+JznLG2vHWZyTE4wcIleF0t0nRyHLwok8qL75uHkdYTn8PBErmqRfU7saBGi/HLf4jGcp6ECmZFXAQLlQDwlHX+chdzOqlT+EqPc2DXmOrE+RuNKIlgfe63yuzIMEAMLMTSXXeRq60vouWmLQ+80/PjYpo5wqNN/xLdLnhf5tiv9/G2bOuG+InQDScuRbpEmFZCSkmZYxZdYa3hQSxSd2bSygA/ji6OxVCP/T7GYQXvEFT+Bui6a0yRn4Bcm1adtj+CGnYEYptLGElc1+Q+K8csMp++E/9cqcL05Zu+Xc33W+zx6yTP0pfSEtTzwzQUYR2I6eEcAiUWKP/txPT8xW6KBiGvD6UvbYNCHGxs7KNEgzfHAO0aDeqzYe4P++tgN8JhnyiwW9C5/71rlIiFVkMYfiBArouJHYbkNeIKivLEIkodoqkIG8wI4pAmnOCuDUKCxmGCNSIXKRtxlqKgLUbUX0QrAZLT96UsB5b0F8cX59f/ZhvjJuQUs9sD/TaYojg+tXAqDIRh7+O8Z7so9Oo//jJxyTJiV901peescTclwraodk0YbKy+tj4mHk71ZAUC/28eMaHFp919fwSOjkZ997Tx9OLad4GBnRgdtpCn4+/LpABvtNYX2Tn/UHzXOTVPSknXW0GcFT0LMgFf1Y5W0fNR22jbazdcYrM760OF14JBI8G5n68yWvb6sPVkSEdSVbuA3OD
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(346002)(376002)(136003)(40470700004)(46966006)(36840700001)(40460700003)(41300700001)(9686003)(33656002)(26005)(53546011)(81166007)(6506007)(7696005)(478600001)(54906003)(86362001)(316002)(40480700001)(55016003)(82310400005)(186003)(2906002)(47076005)(336012)(70586007)(52536014)(83380400001)(5660300002)(70206006)(6862004)(8936002)(82740400003)(356005)(36860700001)(8676002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 02:57:57.7874
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dfcdfaa-b694-41c1-ce56-08da6eb2a500
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6993

SGkgSmFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBNb25kYXksIEp1bHkgMjUsIDIwMjIgMTE6
MzYgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPg0KPiBDYzogV2Vp
IENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPjsgR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsN
Cj4gSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz47DQo+IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyB4ZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2OSA2LzhdIHhlbi9h
cm06IHVucG9wdWxhdGUgbWVtb3J5IHdoZW4gZG9tYWluIGlzDQo+IHN0YXRpYw0KPiANCj4gT24g
MjAuMDcuMjAyMiAwNzo0NiwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gVG9kYXkgd2hlbiBhIGRv
bWFpbiB1bnBvcHVsYXRlcyB0aGUgbWVtb3J5IG9uIHJ1bnRpbWUsIHRoZXkgd2lsbA0KPiA+IGFs
d2F5cyBoYW5kIHRoZSBtZW1vcnkgYmFjayB0byB0aGUgaGVhcCBhbGxvY2F0b3IuIEFuZCBpdCB3
aWxsIGJlIGENCj4gPiBwcm9ibGVtIGlmIGRvbWFpbiBpcyBzdGF0aWMuDQo+ID4NCj4gPiBQYWdl
cyBhcyBndWVzdCBSQU0gZm9yIHN0YXRpYyBkb21haW4gc2hhbGwgYmUgcmVzZXJ2ZWQgdG8gb25s
eSB0aGlzDQo+ID4gZG9tYWluIGFuZCBub3QgYmUgdXNlZCBmb3IgYW55IG90aGVyIHB1cnBvc2Vz
LCBzbyB0aGV5IHNoYWxsIG5ldmVyIGdvDQo+ID4gYmFjayB0byBoZWFwIGFsbG9jYXRvci4NCj4g
Pg0KPiA+IFRoaXMgY29tbWl0IHB1dHMgcmVzZXJ2ZWQgcGFnZXMgb24gdGhlIG5ldyBsaXN0IHJl
c3ZfcGFnZV9saXN0IG9ubHkNCj4gPiBhZnRlciBoYXZpbmcgdGFrZW4gdGhlbSBvZmYgdGhlICJu
b3JtYWwiIGxpc3QsIHdoZW4gdGhlIGxhc3QgcmVmIGRyb3BwZWQuDQo+IA0KPiBJIGd1ZXNzIHRo
aXMgd29yZGluZyBzb21laG93IHJlbGF0ZXMgdG8gLi4uDQo+IA0KPiA+IC0tLSBhL3hlbi9jb21t
b24vcGFnZV9hbGxvYy5jDQo+ID4gKysrIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMNCj4gPiBA
QCAtMjY3NCwxMCArMjY3NCwxNCBAQCB2b2lkIGZyZWVfZG9tc3RhdGljX3BhZ2Uoc3RydWN0IHBh
Z2VfaW5mbw0KPiA+ICpwYWdlKQ0KPiA+DQo+ID4gICAgICBkcm9wX2RvbV9yZWYgPSAhZG9tYWlu
X2FkanVzdF90b3RfcGFnZXMoZCwgLTEpOw0KPiA+DQo+ID4gLSAgICBzcGluX3VubG9ja19yZWN1
cnNpdmUoJmQtPnBhZ2VfYWxsb2NfbG9jayk7DQo+ID4gLQ0KPiA+ICAgICAgZnJlZV9zdGF0aWNt
ZW1fcGFnZXMocGFnZSwgMSwgc2NydWJfZGVidWcpOw0KPiA+DQo+ID4gKyAgICAvKiBBZGQgcGFn
ZSBvbiB0aGUgcmVzdl9wYWdlX2xpc3QgKmFmdGVyKiBpdCBoYXMgYmVlbiBmcmVlZC4gKi8NCj4g
PiArICAgIGlmICggIWRyb3BfZG9tX3JlZiApDQo+ID4gKyAgICAgICAgcGFnZV9saXN0X2FkZF90
YWlsKHBhZ2UsICZkLT5yZXN2X3BhZ2VfbGlzdCk7DQo+IA0KPiAuLi4gdGhlIGNvbmRpdGlvbmFs
IHVzZWQgaGVyZS4gSSBjYW5ub3QsIGhvd2V2ZXIsIGZpZ3VyZSB3aHkgdGhlcmUgaXMgdGhpcw0K
PiBjb25kaXRpb25hbCAoYW5kIHNhaWQgcGFydCBvZiB0aGUgZGVzY3JpcHRpb24gYWxzbyBkb2Vz
bid0IGhlbHAgbWUgZmlndXJlIGl0DQo+IG91dCkuDQo+IA0KDQpJIHdhcyB0aGlua2luZyB0aGF0
IGlmIGRyb3BfZG9tX3JlZiB0cnVlLCB0aGVuIGxhdGVyIHRoZSB3aG9sZSBkb21haW4gc3RydWN0
DQp3aWxsIGJlIHJlbGVhc2VkLCB0aGVuIHRoZXJlIGlzIG5vIG5lZWQgdG8gYWRkIHRoZSBwYWdl
IHRvIGQtPnJlc3ZfcGFnZV9saXN0DQoNCj4gQXMgYW4gYXNpZGU6IEEgdGl0bGUgcHJlZml4IG9m
IHhlbi9hcm06IHN1Z2dlc3RzIHlvdSdyZSBtb3N0bHkgdG91Y2hpbmcgQXJtDQo+IGNvZGUuIEJ1
dCB5b3UncmUgdG91Y2hpbmcgZXhjbHVzaXZlbHkgY29tbW9uIGNvZGUgaGVyZS4NCj4gSSBmb3Ig
b25lIHdvdWxkIGFsbW9zdCBoYXZlIHNraXBwZWQgdGhpcyBwYXRjaCAobW9yZSB0aGFuIG9uY2Up
IHdoZW4NCj4gZGVjaWRpbmcgd2hpY2ggb25lcyAobWF5KSB3YW50IG1lIGxvb2tpbmcgYXQgdGhl
bS4NCj4gDQoNClNvcnJ5IGZvciB0aGF0LCBJ4oCZbGwgZml4IGl0DQo+IEphbg0K

