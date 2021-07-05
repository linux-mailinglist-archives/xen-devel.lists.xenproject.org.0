Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D893BB79F
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 09:15:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149797.277065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Ios-0007UK-Rj; Mon, 05 Jul 2021 07:15:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149797.277065; Mon, 05 Jul 2021 07:15:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Ios-0007SV-NR; Mon, 05 Jul 2021 07:15:06 +0000
Received: by outflank-mailman (input) for mailman id 149797;
 Mon, 05 Jul 2021 07:15:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2kFf=L5=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m0Ior-0007SP-6K
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 07:15:05 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.40]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b776510b-dd60-11eb-843e-12813bfff9fa;
 Mon, 05 Jul 2021 07:15:03 +0000 (UTC)
Received: from AM6P195CA0014.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::27)
 by AM5PR0801MB1892.eurprd08.prod.outlook.com (2603:10a6:203:4d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 07:15:00 +0000
Received: from VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::db) by AM6P195CA0014.outlook.office365.com
 (2603:10a6:209:81::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Mon, 5 Jul 2021 07:15:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT005.mail.protection.outlook.com (10.152.18.172) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 07:15:00 +0000
Received: ("Tessian outbound 5d90d3e3ebc7:v97");
 Mon, 05 Jul 2021 07:14:59 +0000
Received: from cc79ab84d0a9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9AF69E76-84EC-48E3-B1FE-0B9ED816F679.1; 
 Mon, 05 Jul 2021 07:14:53 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cc79ab84d0a9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Jul 2021 07:14:53 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VE1PR08MB5598.eurprd08.prod.outlook.com (2603:10a6:800:1a2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Mon, 5 Jul
 2021 07:14:51 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918%7]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 07:14:51 +0000
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
X-Inumbo-ID: b776510b-dd60-11eb-843e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6qdP3mMKvnmKn7YyujD+j/ep41Pw1sRSneXiEsdZm0=;
 b=jXUI1zG96aW6fVQn4ElU/IbZRIn7XuWoyXZqtZNWdPcZztLYpshdvUpHhaNetMeyau2hOIyzflu8em8PQOoCoYO5nG8RN/B/wApuxLqyJL3uHQ8jZc/ObScohG+o7v1ulN0JBF9NrQPesjtKFGyTUIRRkMRR1v+KuHwHPwzZ4dc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLTUpNp0S8gqELKpuxGpt40jzEH1to5NEe1K5KtiNGtofHERIjGrYRvH5WfD8zzu09aYWaL1/iSKhej9ZLClS98IUdze4vCb/ZjV9hbB1jjDg72OmhacgGNmuIwsq7QEdqgnMqLDue/pwPlTOKiyLjw8lz4wcg07Sm/XSZQBKEXlkxSej8Ckb+CNa/ksiZOtFMmjLQnTUYw/UacPJFWe1jdQxtFzbve7PPJbc6eQuJK1dPy5SbBxCnlI1/5hx8OufhXs4FfY7IBjiScB3fy/UDTTP/Lx4MsJt/wl2+WcZ7b2Z0s4HpThXP6jV56W5yzIDyoW5UJopxow1DIf+OUddw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6qdP3mMKvnmKn7YyujD+j/ep41Pw1sRSneXiEsdZm0=;
 b=OZR+SZHF/OLQ4By/b9gupxdEuZ0uZlDhSaBNI/F+qG4RYofY5Q+LSW6P83OKUJn/6w35VFmCaCg403u9GOoWMJ+4SWKfwFLB98N9JISOub/fYFIWh4tKYgY23XmlzcayOLahgVyNqNSKCjguWxZbc2fsB6PmlOIFCxNf8ooRh7h7J8AGQzcgaSjpUS86yojmYMC6mO9+/p5uFS94nQqQJGury7ASpteRjjbox/NuXqdWvR/J4ByNfPvQS23KOvp6tB7Rgk8q+O6Af0Wh8wRhx9EAQCSwEqSQJSkiOBg63oFdkQCLDuCR6jINjZsHoJB4YG1N6tydmvV8dvVj38rMnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6qdP3mMKvnmKn7YyujD+j/ep41Pw1sRSneXiEsdZm0=;
 b=jXUI1zG96aW6fVQn4ElU/IbZRIn7XuWoyXZqtZNWdPcZztLYpshdvUpHhaNetMeyau2hOIyzflu8em8PQOoCoYO5nG8RN/B/wApuxLqyJL3uHQ8jZc/ObScohG+o7v1ulN0JBF9NrQPesjtKFGyTUIRRkMRR1v+KuHwHPwzZ4dc=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>
Subject: RE: [PATCH 4/9] xen/arm: static memory initialization
Thread-Topic: [PATCH 4/9] xen/arm: static memory initialization
Thread-Index: AQHXW0b3OiAcoe7xDE2AVcNY0dwUCqsNAWAAgB/3qYCABuqiQIAANggw
Date: Mon, 5 Jul 2021 07:14:51 +0000
Message-ID:
 <VE1PR08MB521538D03677F9CBC6088855F71C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-5-penny.zheng@arm.com>
 <e0a312a1-f430-3ff0-6dd6-fcfe18e58071@suse.com>
 <7f77349f-015e-83d3-d646-af9897e31348@xen.org>
 <VE1PR08MB52150F476CA7E1989F9067C7F71C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
In-Reply-To:
 <VE1PR08MB52150F476CA7E1989F9067C7F71C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B630EF36C6B0AB4983EA6A5DD2F2D3EF.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.113]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 6a035659-f4e9-45a0-0cba-08d93f849a20
x-ms-traffictypediagnostic: VE1PR08MB5598:|AM5PR0801MB1892:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM5PR0801MB18928745C04D607FBBF642E2F71C9@AM5PR0801MB1892.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 N7vDkgRI8+BncMjQvH23gcCuDyiRzpFmKZvgjpOxFSWnX/Kh+MMeyRL0m/qzy/umFSQmt8mYGe9j37bOsHBaItbTN5qF9dn1WW2Pt6FcM0TaB/16IkHbBKtTyAP+Xkpc53O6lwqAykJOV5J23putfLOBevLmLsNg6KU3a6U94aLxrR4QTo2ca2yoGBB9nvJu579Sm3DFzqdTtnVqVNhexIQK0QWdKjKdoZtKMPXuh6e2O01noC5W9WKkNJjH1Sk0KTvm8mjsYLxjGvgrmuROXX1m6lY4oU3CvGszDwcWmRQNjAZgR/V8aq6n0xomBgfWlO5+g1drw7hCsVANq2FINCq9R9FBR7JMHKjd+MZVs9v+QZQ7UNWGONPWMeOWd+ZyA8GLzXo03cx3Au7y9DSfYcdRxlC72CRH4I9UGrizgVYhWnxTyjo//1UaWNBNuuF+9/372FT4bdq5GqiA7/LidZPOLe2/etmbmMJw37/rXO3Z0Eu4C7y/VNOKj1KwaIE/FUsvheTAeN7Nii3C6v2nwLXr3cEH46kz7H3/pnoIkusV91icTfUfcQnIIkWB11kb5Qs0kZ+3/zzb/OHLr5PVY+swlprCA5PDgqLod/6BahNlesZwhqVUmwpf5d9tv9VMYEiL1CiMOe0cyshDTiOt/g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(396003)(39840400004)(136003)(26005)(186003)(55016002)(478600001)(53546011)(54906003)(2940100002)(122000001)(9686003)(52536014)(83380400001)(7696005)(8676002)(5660300002)(38100700002)(6916009)(71200400001)(316002)(66946007)(66476007)(76116006)(64756008)(66446008)(4326008)(2906002)(66556008)(6506007)(33656002)(8936002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QUM0OTFlUjkwcUU1VTZzWjI1NTdHVnZmNVllTWJrMXU1dm1YVlR6WFdrMGI3?=
 =?utf-8?B?MDdFMmZMZGhlOUN1Q3NIdE5zbnlUYnRETzNjazhYSVZLbmd2QXZZbjJUUmhY?=
 =?utf-8?B?ZVA2MnphaWc3ZmFJa2tDdWwvUVJ5ejAvYmcxTElqbHFIZkdsNjFHNzdLMDQ2?=
 =?utf-8?B?QTVIUC9UMkRNa05YM2ZZWVYwckdZN29UbWpWZ3FwSEVLdjZWWU81dUJHQTFN?=
 =?utf-8?B?TTBKL3ZvSXRxWUNXWnRCZFRUU21qSE8rby9iNERCQ3hidFczQlFzUFNXOUww?=
 =?utf-8?B?WW9hczNxT25XdEFicHdBd0lhOUpFMkFtdXdnK2FSM1dwZ3dWOGpETGZ4cmhJ?=
 =?utf-8?B?amFYeWFUTlRzb3RNMFVsNEV5Rk1XNnVTM1ZCMm9wcE5oamdUdWFxYnA3RVhu?=
 =?utf-8?B?dmtaTHltUmRyVGJnaUdyenN3K3JOR0hWUHIydStqRTEvb2hCSS9ubmxlK2pQ?=
 =?utf-8?B?WjBLNitTSmZ5YWxINkRaMzV4MEhkNUxmR1UrbmpqZFRzN1B6ZVZPOE9KVkdX?=
 =?utf-8?B?RVlGYjZUa3ZFa3dGSXduS2J0dVFJKzBJYVUwa1l3Q1lESDFzOENJMlhCUDlK?=
 =?utf-8?B?bGxRUDk4a0ZxMDZTcHZMNUlFWVFVbDhXVWRvTnRvSmxGRXJqVE0zUDNDck9F?=
 =?utf-8?B?cnMvZGZQS0oybnRwTjdxV2Z3c3BHTEMxT2dVWm1KQ3dxUCtqTzhNVnp1eEhW?=
 =?utf-8?B?UXd5bU5Nczk3Q0JmelpoRG91L3NFNDVMSlV0ZXRFZnd0TEdlL1lNV3hPV2Jn?=
 =?utf-8?B?SitKbHpPalgwS0ZKaDFud1Y3NitTK1ZYWmVhbXJ4UlJMRDM2TXRZLzBOaE9H?=
 =?utf-8?B?UC81dzUvaG9SOE9SVFFydTFkQTVyNWZ6eHVWa3VPMlI2U2Q3aFFLUWMvSjQ3?=
 =?utf-8?B?TXh0Y0hKY3pnUmFIWmlOdU5TNTlUT1FxWnI3V0lFSll6blV3Smw5WmhUbzNl?=
 =?utf-8?B?dmdpQkQ1UnE0WTFvQ0ZEaVRvOHNDOWhUWVp3R01GZzEzN3VISzhIWmtsOW5x?=
 =?utf-8?B?QThsMno2T0piZEY5eHFvZW1BbTF4WTByM0lMcUNib3FqRWZUSlNwV3dIR0U2?=
 =?utf-8?B?SjNpdjJyL3NsQ2kxSU52NElPUEs2VWhRTlR5R1hRT1JvcHRlKzFVOVZJMjFN?=
 =?utf-8?B?WWk4WUowZ0ppc0grRHE0V28xTDJFMSt6djh2T2sxbkEvZ0t6WlVNdVd2RUVi?=
 =?utf-8?B?RlZhWXo5ck5LcHNZbldPaFhNR3l1bTBOTFJIT2xSNjJwVUM5Mms0dElrMmpn?=
 =?utf-8?B?ZU0rUkl5NFcwcjlMeWE0VWtyeXdvcVNEYTY3YTFWbVZtU0hPem04Nk1wSmpZ?=
 =?utf-8?B?TGdRTEljU2hOUGlQT3NLRkduSlFiVlprM1ZNU0M2TklrdmtWOEdBY2t0Wld1?=
 =?utf-8?B?VEp3aWgzTXc3a2VsVEhzbjRadlJNdFFpQWRFY2tmOG91bjFxTzdRUnBvckVN?=
 =?utf-8?B?b3k4SzFMYnU2eG8vcGNuRHk4Z0hPNEk2ZGRGekJCNkRyTDRidmZPa0lPRkxR?=
 =?utf-8?B?OTZkVEJPSVZqUm5INm9BMGdYZTNSalhvRm1XNXZ0YUVyQlJZVjNFM2dFTXFS?=
 =?utf-8?B?czh3QnpFMWFNWmNsRExZQWVVdVdZODVqWjVoK0pNSCt0VGlGUlZIZ2FqMmlC?=
 =?utf-8?B?RnIzWFdxeUtXZElsUGtyQnB3Sm82dURsOE9ncDhkYmljSjhWWEo5cHZ6VlRZ?=
 =?utf-8?B?N2dGL1JlSHBVR0pYWEVCUzBrUFF3UW1KS2cwQTY3MGpCRjNVMm9mTjR3Tlhp?=
 =?utf-8?Q?aHLGJl5FW3TWGRCldnjELvhKTqD52mbpGQ/bM4I?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5598
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f0f5a155-5d02-4973-983c-08d93f8494ca
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8Y8yfUNpdKkqiPSwK4BpIe4sGmzqPiZI+Ty+JWNDczxPV6OkTC7YdSNuOe6BP9b7MLQLKOQfScfkS4vsb5lgdSAs4poWRLZqe9JgvBPo3RFHUItq7L3vBVwjnAOPx0Kb1qcDpzVrqnNG7HF6cdRwVBgkv3am4RSzuHWt/aC8IMi9zR0zemhUSDay0UpePF89xTwBkJEIxcvyicnAIL7AoKEwbAwYC9vEkBcbKWwJaUsVikVVk+GctRNyI4KX9QGFuM6AbfoxlHVlu55dKCFCoOc1DpDNlbvplIFPwsCfXvJ1ize+tsuL1W2ds7nIzDFn3ubIgW68s6a97KYZldUolfGDBbr/s+W6fXHZ9aXlU0q2Bl5aJILSXfEHGqd4FGXXkTwyXfgsglZ+06klLz92y7iCSVJ528l69qki3ly3DDY/pKD3GOSMzMuTvrChkApqRNp7XsSFbo3zlWh5BnsmqRk9iqw4SW+wvaXixT0rV4mwtSF7Cx+41iDA/FHhQWG5a2GURV6CMnE7wUXGI5dluU3mQ9hXbSYIH3XSE56B3pYSCdtJefuPaPnpALUZuITn9y/D6y81OsOw/rOMZ87LpDKp0DnT8oN1UAMykqgWTm3nWX/P951mrHOTRj6mIJoKqWmwbt3sTSOlVDHI03/ANb0GUSM9JLE6xQFs6oCslLiTbPjfY2TwHWijLRnpWWTw2AkiJLhwduuDKGxQb00ijA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(136003)(39850400004)(46966006)(36840700001)(4326008)(8676002)(86362001)(47076005)(2940100002)(7696005)(356005)(8936002)(33656002)(336012)(81166007)(54906003)(83380400001)(6862004)(316002)(70206006)(82310400003)(82740400003)(9686003)(70586007)(478600001)(53546011)(6506007)(186003)(52536014)(55016002)(36860700001)(2906002)(26005)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 07:15:00.2461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a035659-f4e9-45a0-0cba-08d93f849a20
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1892

SGkgSmFuIA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBlbm55IFpo
ZW5nDQo+IFNlbnQ6IE1vbmRheSwgSnVseSA1LCAyMDIxIDE6MjIgUE0NCj4gVG86IEp1bGllbiBH
cmFsbCA8anVsaWVuQHhlbi5vcmc+OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+
IENjOiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBXZWkgQ2hl
bg0KPiA8V2VpLkNoZW5AYXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsN
Cj4gc3N0YWJlbGxpbmlAa2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSRTogW1BBVENIIDQvOV0geGVu
L2FybTogc3RhdGljIG1lbW9yeSBpbml0aWFsaXphdGlvbg0KPiANCj4gSGkgSnVsaWVuIGFuZCBK
YW4NCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBKdWxpZW4g
R3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiA+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDEsIDIwMjEg
MTo0NiBBTQ0KPiA+IFRvOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBQZW5ueSBa
aGVuZw0KPiA8UGVubnkuWmhlbmdAYXJtLmNvbT4NCj4gPiBDYzogQmVydHJhbmQgTWFycXVpcyA8
QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgV2VpIENoZW4NCj4gPiA8V2VpLkNoZW5AYXJtLmNv
bT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsNCj4gPiBzc3RhYmVsbGluaUBrZXJu
ZWwub3JnDQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCA0LzldIHhlbi9hcm06IHN0YXRpYyBtZW1v
cnkgaW5pdGlhbGl6YXRpb24NCj4gPg0KPiA+IEhpLA0KPiA+DQo+ID4gT24gMTAvMDYvMjAyMSAx
MDozNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+ID4gPiBPbiAwNy4wNi4yMDIxIDA0OjQzLCBQZW5u
eSBaaGVuZyB3cm90ZToNCj4gPiA+PiAtLS0gYS94ZW4vYXJjaC9hcm0vc2V0dXAuYw0KPiA+ID4+
ICsrKyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jDQo+ID4gPj4gQEAgLTYxMSw2ICs2MTEsMzAgQEAg
c3RhdGljIHZvaWQgX19pbml0IGluaXRfcGR4KHZvaWQpDQo+ID4gPj4gICAgICAgfQ0KPiA+ID4+
ICAgfQ0KPiA+ID4+DQo+ID4gPj4gKy8qIFN0YXRpYyBtZW1vcnkgaW5pdGlhbGl6YXRpb24gKi8g
c3RhdGljIHZvaWQgX19pbml0DQo+ID4gPj4gK2luaXRfc3RhdGljbWVtX3BhZ2VzKHZvaWQpIHsN
Cj4gPiA+PiArICAgIGludCBiYW5rOw0KPiA+ID4NCj4gPiA+IFdoaWxlIEknbSBub3QgYSBtYWlu
dGFpbmVyIG9mIHRoaXMgY29kZSwgSSdkIHN0aWxsIGxpa2UgdG8gcG9pbnQgb3V0DQo+ID4gPiB0
aGF0IHdoZXJldmVyIHBvc3NpYmxlIHdlIHByZWZlciAidW5zaWduZWQgaW50IiB3aGVuIGRlYWxp
bmcgd2l0aA0KPiA+ID4gb25seSBub24tbmVnYXRpdmUgdmFsdWVzLCBhbmQgZXZlbiBtb3JlIHNv
IHdoZW4gdXNpbmcgdGhlbSBhcyBhcnJheQ0KPiA+ID4gaW5kZXhlcy4NCj4gPg0KPiA+ICsxLg0K
PiA+DQo+IA0KPiBVbmRlcnN0b29kLiBUaHguDQo+IA0KPiA+ID4NCj4gPiA+PiArICAgIC8qDQo+
ID4gPj4gKyAgICAgKiBUT0RPOiBDb25zaWRlcmluZyBOVU1BLXN1cHBvcnQgc2NlbmFyaW8uDQo+
ID4gPj4gKyAgICAgKi8NCj4gPiA+DQo+ID4gPiBOaXQ6IENvbW1lbnQgc3R5bGUuDQo+ID4gPg0K
PiANCj4gU3VyZSwgdGh4Lg0KPiANCj4gPiA+PiBAQCAtODcyLDYgKzg5Niw5IEBAIHZvaWQgX19p
bml0IHN0YXJ0X3hlbih1bnNpZ25lZCBsb25nDQo+ID4gYm9vdF9waHlzX29mZnNldCwNCj4gPiA+
PiAgICAgICBjbWRsaW5lX3BhcnNlKGNtZGxpbmUpOw0KPiA+ID4+DQo+ID4gPj4gICAgICAgc2V0
dXBfbW0oKTsNCj4gPiA+PiArICAgIC8qIElmIGV4aXN0cywgU3RhdGljIE1lbW9yeSBJbml0aWFs
aXphdGlvbi4gKi8NCj4gPiA+PiArICAgIGlmICggYm9vdGluZm8uc3RhdGljX21lbS5ucl9iYW5r
cyA+IDAgKQ0KPiA+ID4+ICsgICAgICAgIGluaXRfc3RhdGljbWVtX3BhZ2VzKCk7DQo+ID4gPg0K
PiA+ID4gSSBkb24ndCB0aGluayB0aGUgY29uZGl0aW9uYWwgaXMgcmVhbGx5IG5lZWRlZCBoZXJl
Pw0KPiA+ID4NCj4gDQo+IFN1cmUsIHJpZ2h0Lg0KPiBMaWtlIHdoYXQgSnVsaWVuIHN1Z2dlc3Rz
LCAgaW5pdF9zdGF0aWNtZW1fcGFnZXMoKSBpcyBhbHJlYWR5IGFibGUgdG8gY29wZQ0KPiB3aXRo
IG5yX2JhbmtzID09IDAuDQo+IA0KPiA+ID4+IC0tLSBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5j
DQo+ID4gPj4gKysrIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMNCj4gPiA+PiBAQCAtMTM3Niw2
ICsxMzc2LDM3IEBAIGJvb2wgc2NydWJfZnJlZV9wYWdlcyh2b2lkKQ0KPiA+ID4+ICAgICAgIHJl
dHVybiBub2RlX3RvX3NjcnViKGZhbHNlKSAhPSBOVU1BX05PX05PREU7DQo+ID4gPj4gICB9DQo+
ID4gPj4NCj4gPiA+PiArc3RhdGljIHZvaWQgZnJlZV9wYWdlKHN0cnVjdCBwYWdlX2luZm8gKnBn
LCBib29sIG5lZWRfc2NydWIpIHsNCj4gPiA+PiArICAgIG1mbl90IG1mbiA9IHBhZ2VfdG9fbWZu
KHBnKTsNCj4gPiA+DQo+ID4gPiBXaXRoIHBkeCBjb21wcmVzc2lvbiB0aGlzIGlzIGEgbm9uLXRy
aXZpYWwgY29udmVyc2lvbi4gVGhlIGZ1bmN0aW9uDQo+ID4gPiBiZWluZyBhbiBpbnRlcm5hbCBo
ZWxwZXIgYW5kIHRoZSBjYWxsZXIgYWxyZWFkeSBob2xkaW5nIHRoZSBNRk4sIEkNCj4gPiA+IHRo
aW5rIGl0IHdvdWxkIGJlIHByZWZlcmFibGUgaWYgdGhlIE1GTiB3YXMgcGFzc2VkIGluIGhlcmUu
IElmIGRvbmUNCj4gPiA+IHRoaXMgd2F5LCB5b3UgbWF5IHdhbnQgdG8gY29uc2lkZXIgYWRkaW5n
IGFuIEFTU0VSVCgpIHRvIGRvdWJsZQ0KPiA+ID4gY2hlY2sgYm90aCBwYXNzZWQgaW4gYXJndW1l
bnRzIG1hdGNoIHVwLg0KPiA+ID4NCj4gDQo+IFRoYW5rIGZvciB0aGUgc3VnZ2VzdGlvbn4NCj4g
DQoNCldoaWxlIGFwcGx5aW5nIHlvdXIgc3VnZ2VzdGlvbiBoZXJlLCBpZiBhZGRpbmcgYW4gQVNT
RVJUKCkgdG8gZG91YmxlIGNoZWNrIGJvdGggcGFzc2VkLWluDQphcmd1bWVudHMgbWF0Y2ggdXAs
IGVpdGhlciB1c2UgbGlrZSBwYWdlX3RvX21mbiB0byBlc3RhYmxpc2ggY29ubmVjdGlvbiwgd2hp
Y2ggaXMgYWJzb2x1dGVseQ0KdW5hY2NlcHRhYmxlLCBvciBwYXNzIG1vcmUgcGFyYW1ldGVycyBs
aWtlIGJhc2UgcGFnZS9tZm4gdG8gY29tcGFyZSB0aGUgb2Zmc2V0LiBIbW1tLA0KSSBhbSBub3Qg
aW4gZmF2b3Igb2YgdGhpcywgIHNpbmNlIGJvdGggZXh0cmEgcGFyYW1ldGVycyBhcmUgb25seSB1
c2VkIGluIGFzc2VydGlvbiBvbmx5LiANCiANCj4gPiA+PiArICAgIC8qIElmIGEgcGFnZSBoYXMg
bm8gb3duZXIgaXQgd2lsbCBuZWVkIG5vIHNhZmV0eSBUTEIgZmx1c2guICovDQo+ID4gPj4gKyAg
ICBwZy0+dS5mcmVlLm5lZWRfdGxiZmx1c2ggPSAocGFnZV9nZXRfb3duZXIocGcpICE9IE5VTEwp
Ow0KPiA+ID4+ICsgICAgaWYgKCBwZy0+dS5mcmVlLm5lZWRfdGxiZmx1c2ggKQ0KPiA+ID4+ICsg
ICAgICAgIHBhZ2Vfc2V0X3RsYmZsdXNoX3RpbWVzdGFtcChwZyk7DQo+ID4gPj4gKw0KPiA+ID4+
ICsgICAgLyogVGhpcyBwYWdlIGlzIG5vdCBhIGd1ZXN0IGZyYW1lIGFueSBtb3JlLiAqLw0KPiA+
ID4+ICsgICAgcGFnZV9zZXRfb3duZXIocGcsIE5VTEwpOyAvKiBzZXRfZ3Bmbl9mcm9tX21mbiBz
bm9vcHMgcGcgb3duZXINCj4gPiAqLw0KPiA+ID4+ICsgICAgc2V0X2dwZm5fZnJvbV9tZm4obWZu
X3gobWZuKSwgSU5WQUxJRF9NMlBfRU5UUlkpOw0KPiA+ID4+ICsNCj4gPiA+PiArI2lmZGVmIENP
TkZJR19BUk0NCj4gPiA+DQo+ID4gPiBJZiBhdm9pZGFibGUgdGhlcmUgc2hvdWxkIGJlIG5vIGFy
Y2gtc3BlY2lmaWMgY29kZSBhZGRlZCB0byB0aGlzIGZpbGUuDQo+ID4gPiBBc3N1bWluZyBhbm90
aGVyIGFyY2ggZ2FpbmVkIFBHQ19yZXNlcnZlZCwgd2hhdCdzIHdyb25nIHdpdGgNCj4gPiA+IGVu
YWJsaW5nIHRoaXMgY29kZSByaWdodCBhd2F5IGZvciB0aGVtIGFzIHdlbGw/IEkuZS4gdXNlDQo+
ID4gPiBQR0NfcmVzZXJ2ZWQgaGVyZSBpbnN0ZWFkIG9mIENPTkZJR19BUk0/IEFsdGVybmF0aXZl
bHkgdGhpcyBtYXkgd2FudA0KPiA+ID4gdG8gYmUgQ09ORklHX1NUQVRJQ19BTExPQ0FUSU9OLCBh
c3N1bWluZyB3ZSBjb25zaWRlciBQR0NfcmVzZXJ2ZWQNCj4gPiA+IHRpZWQgdG8gaXQuDQo+ID4g
Pg0KPiANCj4gVG8gbm90IGJyaW5nIGRlYWQgY29kZXMgaW4gb3RoZXIgYXJjaHMsIEknbGwgdXNl
IG1vcmUgZ2VuZXJpYyBvcHRpb24NCj4gQ09ORklHX1NUQVRJQ19BTExPQ0FUSU9OLg0KPiANCj4g
PiA+PiArICAgIGlmICggcGctPmNvdW50X2luZm8gJiBQR0NfcmVzZXJ2ZWQgKQ0KPiA+ID4+ICsg
ICAgew0KPiA+ID4+ICsgICAgICAgIC8qIFRPRE86IGFzeW5jaHJvbm91cyBzY3J1YmJpbmcuICov
DQo+ID4gPj4gKyAgICAgICAgaWYgKCBuZWVkX3NjcnViICkNCj4gPiA+PiArICAgICAgICAgICAg
c2NydWJfb25lX3BhZ2UocGcpOw0KPiA+ID4+ICsgICAgICAgIHJldHVybjsNCj4gPiA+PiArICAg
IH0NCj4gPiA+PiArI2VuZGlmDQo+ID4gPj4gKyAgICBpZiAoIG5lZWRfc2NydWIgKQ0KPiA+ID4N
Cj4gPiA+IE5pdDogUGxlYXNlIGhhdmUgYSBibGFuayBsaW5lIGJldHdlZW4gdGhlc2UgbGFzdCB0
d28uDQo+ID4gPg0KPiANCj4gU3VyZS4gV2lsbCBkby4NCj4gDQo+ID4gPj4gKyAgICB7DQo+ID4g
Pj4gKyAgICAgICAgcGctPmNvdW50X2luZm8gfD0gUEdDX25lZWRfc2NydWI7DQo+ID4gPj4gKyAg
ICAgICAgcG9pc29uX29uZV9wYWdlKHBnKTsNCj4gPiA+PiArICAgIH0NCj4gPiA+PiArDQo+ID4g
Pj4gKyAgICByZXR1cm47DQo+ID4gPg0KPiA+ID4gUGxlYXNlIG9taXQgcmV0dXJuIHN0YXRlbWVu
dHMgYXQgdGhlIGVuZCBvZiBmdW5jdGlvbnMgcmV0dXJuaW5nIHZvaWQuDQo+ID4gPg0KPiANCj4g
U3VyZSwgdGh4DQo+IA0KPiA+ID4+ICt9DQo+ID4gPg0KPiA+ID4gT24gdGhlIHdob2xlLCBiaWtl
IHNoZWRkaW5nIG9yIG5vdCwgSSdtIGFmcmFpZCB0aGUgZnVuY3Rpb24ncyBuYW1lDQo+ID4gPiBk
b2Vzbid0IG1hdGNoIHdoYXQgaXQgZG9lczogVGhlcmUncyBubyBmcmVlaW5nIG9mIGEgcGFnZSBo
ZXJlLiBXaGF0DQo+ID4gPiBnZXRzIGRvbmUgaXMgbWFya2luZyBvZiBhIHBhZ2UgYXMgZnJlZS4g
SGVuY2UgbWF5YmUgbWFya19wYWdlX2ZyZWUoKQ0KPiA+ID4gb3IgbWFya19mcmVlX3BhZ2UoKSBv
ciBzb21lIHN1Y2g/DQo+ID4gPg0KPiANCj4gT2suIFRoeC4gQWx3YXlzIG5vdCBnb29kIGF0IGdp
dmluZyBuYW1lcy4gSSdsbCB0YWtlIG1hcmtfcGFnZV9mcmVlKCkNCj4gDQo+ID4gPj4gQEAgLTE1
MTIsNiArMTUzMCwzOCBAQCBzdGF0aWMgdm9pZCBmcmVlX2hlYXBfcGFnZXMoDQo+ID4gPj4gICAg
ICAgc3Bpbl91bmxvY2soJmhlYXBfbG9jayk7DQo+ID4gPj4gICB9DQo+ID4gPj4NCj4gPiA+PiAr
I2lmZGVmIENPTkZJR19TVEFUSUNfQUxMT0NBVElPTg0KPiA+ID4+ICsvKiBFcXVpdmFsZW50IG9m
IGZyZWVfaGVhcF9wYWdlcyB0byBmcmVlIG5yX21mbnMgcGFnZXMgb2Ygc3RhdGljDQo+ID4gPj4g
K21lbW9yeS4gKi8gdm9pZCBfX2luaXQgZnJlZV9zdGF0aWNtZW1fcGFnZXMoc3RydWN0IHBhZ2Vf
aW5mbyAqcGcsDQo+ID4gdW5zaWduZWQgbG9uZyBucl9tZm5zLA0KPiA+ID4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBib29sIG5lZWRfc2NydWIpIHsNCj4gPiA+PiArICAgIG1m
bl90IG1mbiA9IHBhZ2VfdG9fbWZuKHBnKTsNCj4gPiA+PiArICAgIHVuc2lnbmVkIGxvbmcgaTsN
Cj4gPiA+PiArDQo+ID4gPj4gKyAgICBmb3IgKCBpID0gMDsgaSA8IG5yX21mbnM7IGkrKyApDQo+
ID4gPj4gKyAgICB7DQo+ID4gPj4gKyAgICAgICAgc3dpdGNoICggcGdbaV0uY291bnRfaW5mbyAm
IFBHQ19zdGF0ZSApDQo+ID4gPj4gKyAgICAgICAgew0KPiA+ID4+ICsgICAgICAgIGNhc2UgUEdD
X3N0YXRlX2ludXNlOg0KPiA+ID4+ICsgICAgICAgICAgICBCVUdfT04ocGdbaV0uY291bnRfaW5m
byAmIFBHQ19icm9rZW4pOw0KPiA+ID4+ICsgICAgICAgICAgICAvKiBNYXJrIGl0IGZyZWUgYW5k
IHJlc2VydmVkLiAqLw0KPiA+ID4+ICsgICAgICAgICAgICBwZ1tpXS5jb3VudF9pbmZvID0gUEdD
X3N0YXRlX2ZyZWUgfCBQR0NfcmVzZXJ2ZWQ7DQo+ID4gPj4gKyAgICAgICAgICAgIGJyZWFrOw0K
PiA+ID4+ICsNCj4gPiA+PiArICAgICAgICBkZWZhdWx0Og0KPiA+ID4+ICsgICAgICAgICAgICBw
cmludGsoWEVOTE9HX0VSUg0KPiA+ID4+ICsgICAgICAgICAgICAgICAgICAgIlBhZ2Ugc3RhdGUg
c2hhbGwgYmUgb25seSBpbiBQR0Nfc3RhdGVfaW51c2UuICINCj4gPiA+DQo+ID4gPiBXaHk/IEEg
cGFnZSAoc3RhdGljIG9yIG5vdCkgY2FuIGJlY29tZSBicm9rZW4gd2hpbGUgaW4gdXNlLiBJT1cg
SQ0KPiA+ID4gZG9uJ3QgdGhpbmsgeW91IGNhbiBhdm9pZCBoYW5kbGluZyBQR0Nfc3RhdGVfb2Zm
bGluaW5nIGhlcmUuIEF0DQo+ID4gPiB3aGljaCBwb2ludCB0aGlzIGNvZGUgd2lsbCBtYXRjaCBm
cmVlX2hlYXBfcGFnZXMoKSdlcywgYW5kIGhlbmNlDQo+ID4gPiBsaWtlbHkgd2lsbCB3YW50IGZv
bGRpbmcgYXMgd2VsbC4NCj4gPiA+DQo+IA0KPiBZZWFoLCBJIHdhcyBmb2xsb3dpbmcgdGhlIGxv
Z2ljIGluIGZyZWVfaGVhcF9wYWdlcy4NCj4gSG1tbSwgSSBjb3VsZCBub3QgdGhpbmsgb2YgYW55
IHNjZW5hcmlvIHRoYXQgd2lsbCBsZWFkIHRvIFBHQ19zdGF0ZV9vZmZsaW5pbmcsDQo+IHRoYXQn
cyB3aHkgSSB3YXMgbm90IGluY2x1ZGluZyBpdCBhdCB0aGUgZmlyc3QgcGxhY2UuDQo+IEZvciBi
cm9rZW4gaXNzdWUsIHRiaCwgSSBqdXN0IGNvcHkgdGhlIGJ1Z19vbiBmcm9tIGZyZWVfaGVhcF9w
YWdlcywgYWZ0ZXINCj4gcXVpdGUgYSB0aW1lIHRoaW5raW5nLCBJIGFsc28gY291bGQgbm90IGZp
bmQgYW55IHNjZW5hcmlvIHdoZW4gYSBwYWdlKHN0YXRpYyBvcg0KPiBub3QpIGNhbiBiZWNvbWUg
YnJva2VuIHdoaWxlIGluIHVzZS4gOy8NCj4gDQo+ID4gPj4gLS0tIGEveGVuL2luY2x1ZGUveGVu
L21tLmgNCj4gPiA+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbW0uaA0KPiA+ID4+IEBAIC04NSw2
ICs4NSwxMiBAQCBib29sIHNjcnViX2ZyZWVfcGFnZXModm9pZCk7DQo+ID4gPj4gICB9IHdoaWxl
ICggZmFsc2UgKQ0KPiA+ID4+ICAgI2RlZmluZSBGUkVFX1hFTkhFQVBfUEFHRShwKSBGUkVFX1hF
TkhFQVBfUEFHRVMocCwgMCkNCj4gPiA+Pg0KPiA+ID4+ICsjaWZkZWYgQ09ORklHX0FSTQ0KPiA+
ID4NCj4gPiA+IElUWU0gQ09ORklHX1NUQVRJQ19BTExPQ0FUSU9OIGhlcmU/DQo+ID4gPg0KPiA+
ID4gSmFuDQo+ID4gPg0KPiA+DQo+ID4gLS0NCj4gPiBKdWxpZW4gR3JhbGwNCj4gDQo+IENoZWVy
cw0KPiANCj4gLS0NCj4gUGVubnkgWmhlbmcNCg==

