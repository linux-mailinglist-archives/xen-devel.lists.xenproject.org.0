Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 907996F68BA
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 11:56:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529658.824283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puVgj-0000NA-Rj; Thu, 04 May 2023 09:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529658.824283; Thu, 04 May 2023 09:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puVgj-0000KO-Oe; Thu, 04 May 2023 09:55:49 +0000
Received: by outflank-mailman (input) for mailman id 529658;
 Thu, 04 May 2023 09:55:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Gg4=AZ=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1puVgi-0000KI-3C
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 09:55:48 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7a67724-ea61-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 11:55:47 +0200 (CEST)
Received: from DB8PR04CA0015.eurprd04.prod.outlook.com (2603:10a6:10:110::25)
 by AS8PR08MB6072.eurprd08.prod.outlook.com (2603:10a6:20b:296::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 09:55:43 +0000
Received: from DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::34) by DB8PR04CA0015.outlook.office365.com
 (2603:10a6:10:110::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.25 via Frontend
 Transport; Thu, 4 May 2023 09:55:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT011.mail.protection.outlook.com (100.127.142.132) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.26 via Frontend Transport; Thu, 4 May 2023 09:55:43 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Thu, 04 May 2023 09:55:43 +0000
Received: from b4f547a610d0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9F65F0B0-D926-43EF-899D-E88E5A2255D5.1; 
 Thu, 04 May 2023 09:55:37 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b4f547a610d0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 04 May 2023 09:55:37 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DU0PR08MB9558.eurprd08.prod.outlook.com (2603:10a6:10:44d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Thu, 4 May
 2023 09:55:35 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::a4ab:cdfa:b445:7ecb]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::a4ab:cdfa:b445:7ecb%7]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 09:55:35 +0000
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
X-Inumbo-ID: d7a67724-ea61-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oT3cAAImx46iN9Cg877ANIWn8JL/IUJ158jZ8MQ4VBY=;
 b=eS5ZBkQziw7r33wwVJg6sx3NR+NAQ4wIb8+xPGsJU811DU9bxc/bi/VEb9/cwBVXZUnn7eJuAc3IOcUFoAkdiTNpZ8YNKQYVJQE3r4w68zHLJIru0ZtqGHW04nmjPAdSqQwUi8dwVPzjPSnWLthslcTrBpT5s+DfzPqCW3ek3Tg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 612cc924003d0784
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRZyZRnXGhC9bUOUhhL2eebZ/6eLA7w27v0LsUOG5gJ7va5qvq/T8Gjp1uJKUNAWfEL0EcTsJ74jA20wlNfZ6WeB7VniAmKnMFHoUXd9MGDktHRY8oyAwuBIlqSW6+QWjjZwBczW9pv+YcGX1EdlAjc1GZFZSTimP3pnHR4U5sxis9ZqicUsjXFL8tu9qjLjp1ILPrs3FYz1iLs+0fXeW52CKXhdbtW9v8Usnvsx08iikbNtLTFmyMk+pploaqMlqUU4JvWc+08fRcORK1GMQfyK6UIprQxD8F/W6LeMDkjFaign2lU6stevtyJNQgr2hgbdllceGIbRmuFP0SldfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oT3cAAImx46iN9Cg877ANIWn8JL/IUJ158jZ8MQ4VBY=;
 b=dduKJGL8g/ek0QWvPyclcU1g6+FwgYI3Xi4iyD7OWatyGovEeIPW29kyhMWsvPKZFEDjxSNMFZ2E9FR5biQ00dnQcG88Aoh6hr61nwiZ3UbBh4OZxc1V1xPT2DCsVZ/T61R2fq/kaqxA4Bpdayti43c5ne52Uv5BcFwYN7vcsFsXFPr3Vn9MEuKO7r7KMw1Xf1A8RpqCAr7yUvqHzQrTGBR1gqyfpQwuHDxVbhRJYZbeURNfY0rSARX1QeMKXiU5JPW5xTpgp8VOuGeP1WSECTgDFfV7y4B6Ihr+D61NuJkUgYECWzvXynV3TwZSXCVB8kCvqf0Xk8I7SSC73fBrIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oT3cAAImx46iN9Cg877ANIWn8JL/IUJ158jZ8MQ4VBY=;
 b=eS5ZBkQziw7r33wwVJg6sx3NR+NAQ4wIb8+xPGsJU811DU9bxc/bi/VEb9/cwBVXZUnn7eJuAc3IOcUFoAkdiTNpZ8YNKQYVJQE3r4w68zHLJIru0ZtqGHW04nmjPAdSqQwUi8dwVPzjPSnWLthslcTrBpT5s+DfzPqCW3ek3Tg=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stewart Hildebrand <Stewart.Hildebrand@amd.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: pci: fix -Wtype-limits warning in
 pci-host-common.c
Thread-Topic: [PATCH] xen/arm: pci: fix -Wtype-limits warning in
 pci-host-common.c
Thread-Index: AQHZffQdsUu9XjzfjkKQkjxjNw1HC69J4TCA
Date: Thu, 4 May 2023 09:55:35 +0000
Message-ID: <7E04E3DD-B260-49E4-8543-77BBF8715BCB@arm.com>
References: <20230503191820.78322-1-stewart.hildebrand@amd.com>
In-Reply-To: <20230503191820.78322-1-stewart.hildebrand@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|DU0PR08MB9558:EE_|DBAEUR03FT011:EE_|AS8PR08MB6072:EE_
X-MS-Office365-Filtering-Correlation-Id: 40dc0e22-1c9d-496a-1021-08db4c85b9d2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SR5rAQr7dIoqrJ2lQ6NyN7PzKmvjnIdOAJq07eIam7k4zv/i/pCHpEvMK7rA8lxfYYAlbtwQo4NI+qre28yF+ARSFuI/6OgObrtDVVXRjHqrs+SlHaOGaXrTGkShmAeZL4NLwLI2x2bRKdyEemAMwFCVePVlRExSRPLAoeMBMlfDQGB/AquhFH81etvrAEp8+ccH66FnCvyRFogEK/BjIIG7zKAWM7y+sv+pWZJm09HS89tA9Jv0o4JV6J+hLTn48d2b0tVW1GPFMCmrYchDVgOUqsYaOZz3T7HGq0v0/ho0KEeoMVWoKjYcmcdHfMJJBmBnM/MKKTI9dtUxcU6wHikxxyQGEsjSwRnQggrCzKTIJimeo8xEEsh2jY/SCBzJ7sil0TGdpp6QMicRORSBcf4Zq/8oEZsClBeAPXrQuIRYh4tCnbK2UvB7HxuBsrR3gQHUTlLqfs3zSk+AFzs2jRLwn5j33itZgB+bBMDB0G9HeFEHZmsYCF4AOUnNPEITLMwGCGHObDm8irx06atgn22wAYMvYterzkZFcW9d+qsAa2XUgILws7OkCC9lfyygpJeQBTzXi1GWuD603DFWdHkaR5w+ao4voVRKhmWaRueGjHZIkDVt6oAvHIFsvYexQu+/k0JqNl0CZ6OYxoskNg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(451199021)(66446008)(76116006)(2616005)(83380400001)(478600001)(186003)(91956017)(66556008)(54906003)(4326008)(64756008)(66476007)(6916009)(66946007)(53546011)(6486002)(26005)(71200400001)(6512007)(6506007)(316002)(8676002)(41300700001)(8936002)(5660300002)(2906002)(38100700002)(122000001)(4744005)(38070700005)(36756003)(33656002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_7E04E3DDB26049E4854377BBF8715BCBarmcom_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9558
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	49159545-3040-4820-4e7e-08db4c85b54d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UGaVWNNv+G6KBOwrDxGA3y72xZPqQ7Zh3dG9SSOYdEJYSATrINUBTJsEh4zgRncGfve+g4eQNR7efJQnZiEeQsgW/do+kszhI3tG0VsUGqMKQmRqBL/qLh19+Z4tmBF9oVqeAwdLO3J55J1YR7ganE0AXtBAc/TvuU/PFHv/9tG0uZkOXJPrbeO5XlOJWSx2VfWiaqzH0UEzLe1SZ5r/o3pdfAOpnr5w4PJDJ52SlgyGWlIqmjEwQ8WNHuIwVLGflHBu135NFPT4KXIv/I40O0TNo/UGKsx8Sp75pctFlyaNneMniy5RQpb/GtyP0uTUqdZcvB9pvroCO74TMUmG/yjy24lX21+YmiEfDFC0NEDtdT6+pdUKS+rFhzpAUlI9mC0D7IXPRCW44Ectq/NEjXyXJmduBXLIZkXLT8jWOFYcu1JVT9Rw6s00u6n7NMU6XI/sgp3av8mEOZGXZjvfmlp8S25RoSyTKfNTo60cA3dWs4I7yNTQkNcY9spnSzULf+02G53Tkw8CnELYnWV7Mqjt2lO1KTy/DLTISdnDkq2YDoElCJ2ffMHnRYB1ez0/9qNz4PehzQylBkNMudqsmOwlRMIQypbkSok2FBb03odcgKprPT8RdmNS8NPdSyXJWb2pTPdbeFGQhyMtVKINy9zrEpZW5IoW+yJ4KZVN625QJxyV/JaVIQxU+NYkXqjhj96oeq2iNBjrSRjCgfQURM3yVTvA6IXCRdsLyvchnhQ=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199021)(46966006)(36840700001)(40470700004)(40480700001)(45080400002)(478600001)(86362001)(34020700004)(107886003)(40460700003)(336012)(83380400001)(53546011)(47076005)(26005)(36860700001)(186003)(6506007)(6512007)(36756003)(2616005)(82740400003)(6486002)(82310400005)(33964004)(81166007)(33656002)(356005)(54906003)(6862004)(5660300002)(41300700001)(8936002)(8676002)(2906002)(316002)(70206006)(70586007)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 09:55:43.4970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40dc0e22-1c9d-496a-1021-08db4c85b9d2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6072

--_000_7E04E3DDB26049E4854377BBF8715BCBarmcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgU3Rld2FydCwNCg0KT24gMyBNYXkgMjAyMywgYXQgODoxOCBwbSwgU3Rld2FydCBIaWxkZWJy
YW5kIDxTdGV3YXJ0LkhpbGRlYnJhbmRAYW1kLmNvbT4gd3JvdGU6DQoNCldoZW4gYnVpbGRpbmcg
d2l0aCBFWFRSQV9DRkxBR1NfWEVOX0NPUkU9Ii1XdHlwZS1saW1pdHMiLCB3ZSBvYnNlcnZlIHRo
ZQ0KZm9sbG93aW5nIHdhcm5pbmc6DQoNCmFyY2gvYXJtL3BjaS9wY2ktaG9zdC1jb21tb24uYzog
SW4gZnVuY3Rpb24g4oCYcGNpX2hvc3RfY29tbW9uX3Byb2Jl4oCZOg0KYXJjaC9hcm0vcGNpL3Bj
aS1ob3N0LWNvbW1vbi5jOjIzODoyNjogd2FybmluZzogY29tcGFyaXNvbiBpcyBhbHdheXMgZmFs
c2UgZHVlIHRvIGxpbWl0ZWQgcmFuZ2Ugb2YgZGF0YSB0eXBlIFstV3R5cGUtbGltaXRzXQ0KIDIz
OCB8ICAgICBpZiAoIGJyaWRnZS0+c2VnbWVudCA8IDAgKQ0KICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgICAgICBeDQoNClRoaXMgaXMgZHVlIHRvIGJyaWRnZS0+c2VnbWVudCBiZWluZyBhbiB1
bnNpZ25lZCB0eXBlLiBGaXggaXQgYnkgaW50cm9kdWNpbmcgYQ0KbmV3IHZhcmlhYmxlIG9mIHNp
Z25lZCB0eXBlIHRvIHVzZSBpbiB0aGUgY29uZGl0aW9uLg0KDQpTaWduZWQtb2ZmLWJ5OiBTdGV3
YXJ0IEhpbGRlYnJhbmQgPHN0ZXdhcnQuaGlsZGVicmFuZEBhbWQuY29tPg0KDQpSZXZpZXdlZC1i
eTogUmFodWwgU2luZ2ggPHJhaHVsLnNpbmdoQGFybS5jb208bWFpbHRvOnJhaHVsLnNpbmdoQGFy
bS5jb20+Pg0KDQpSZWdhcmRzLA0KUmFodWwNCg0K

--_000_7E04E3DDB26049E4854377BBF8715BCBarmcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <C402AA6BD882D04C9F495AF52E808D43@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJvdmVyZmxv
dy13cmFwOiBicmVhay13b3JkOyAtd2Via2l0LW5ic3AtbW9kZTogc3BhY2U7IGxpbmUtYnJlYWs6
IGFmdGVyLXdoaXRlLXNwYWNlOyI+DQo8ZGl2IGRpcj0iYXV0byIgc3R5bGU9Im92ZXJmbG93LXdy
YXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJzcC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazogYWZ0
ZXItd2hpdGUtc3BhY2U7Ij4NCkhpIFN0ZXdhcnQsPGJyPg0KPGRpdj48YnI+DQo8YmxvY2txdW90
ZSB0eXBlPSJjaXRlIj4NCjxkaXY+T24gMyBNYXkgMjAyMywgYXQgODoxOCBwbSwgU3Rld2FydCBI
aWxkZWJyYW5kICZsdDtTdGV3YXJ0LkhpbGRlYnJhbmRAYW1kLmNvbSZndDsgd3JvdGU6PC9kaXY+
DQo8YnIgY2xhc3M9IkFwcGxlLWludGVyY2hhbmdlLW5ld2xpbmUiPg0KPGRpdj4NCjxkaXY+V2hl
biBidWlsZGluZyB3aXRoIEVYVFJBX0NGTEFHU19YRU5fQ09SRT0mcXVvdDstV3R5cGUtbGltaXRz
JnF1b3Q7LCB3ZSBvYnNlcnZlIHRoZTxicj4NCmZvbGxvd2luZyB3YXJuaW5nOjxicj4NCjxicj4N
CmFyY2gvYXJtL3BjaS9wY2ktaG9zdC1jb21tb24uYzogSW4gZnVuY3Rpb24g4oCYcGNpX2hvc3Rf
Y29tbW9uX3Byb2Jl4oCZOjxicj4NCmFyY2gvYXJtL3BjaS9wY2ktaG9zdC1jb21tb24uYzoyMzg6
MjY6IHdhcm5pbmc6IGNvbXBhcmlzb24gaXMgYWx3YXlzIGZhbHNlIGR1ZSB0byBsaW1pdGVkIHJh
bmdlIG9mIGRhdGEgdHlwZSBbLVd0eXBlLWxpbWl0c108YnI+DQombmJzcDsyMzggfCAmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDtpZiAoIGJyaWRnZS0mZ3Q7c2VnbWVudCAmbHQ7IDAgKTxicj4NCiZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwO3wgJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Xjxicj4NCjxicj4NClRoaXMgaXMgZHVlIHRvIGJyaWRnZS0mZ3Q7c2VnbWVudCBi
ZWluZyBhbiB1bnNpZ25lZCB0eXBlLiBGaXggaXQgYnkgaW50cm9kdWNpbmcgYTxicj4NCm5ldyB2
YXJpYWJsZSBvZiBzaWduZWQgdHlwZSB0byB1c2UgaW4gdGhlIGNvbmRpdGlvbi48YnI+DQo8YnI+
DQpTaWduZWQtb2ZmLWJ5OiBTdGV3YXJ0IEhpbGRlYnJhbmQgJmx0O3N0ZXdhcnQuaGlsZGVicmFu
ZEBhbWQuY29tJmd0Ozxicj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Jsb2NrcXVvdGU+DQo8ZGl2Pjxi
cj4NCjwvZGl2Pg0KPGRpdj5SZXZpZXdlZC1ieTogUmFodWwgU2luZ2ggJmx0OzxhIGhyZWY9Im1h
aWx0bzpyYWh1bC5zaW5naEBhcm0uY29tIj5yYWh1bC5zaW5naEBhcm0uY29tPC9hPiZndDs8L2Rp
dj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2PlJlZ2FyZHMsPC9kaXY+DQo8ZGl2PlJhaHVsPC9k
aXY+DQo8L2Rpdj4NCiZuYnNwOzwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_7E04E3DDB26049E4854377BBF8715BCBarmcom_--

