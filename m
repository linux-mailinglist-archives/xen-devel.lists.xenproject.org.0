Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 751BC3C53CE
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jul 2021 12:52:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154493.285479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2tWe-00065G-Qq; Mon, 12 Jul 2021 10:51:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154493.285479; Mon, 12 Jul 2021 10:51:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2tWe-00062Z-Nb; Mon, 12 Jul 2021 10:51:00 +0000
Received: by outflank-mailman (input) for mailman id 154493;
 Mon, 12 Jul 2021 10:51:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SUz8=ME=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1m2tWd-00062T-W1
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 10:51:00 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.64]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a5b9ee0-e2ff-11eb-86e3-12813bfff9fa;
 Mon, 12 Jul 2021 10:50:58 +0000 (UTC)
Received: from DB3PR06CA0012.eurprd06.prod.outlook.com (2603:10a6:8:1::25) by
 AM5PR0801MB2083.eurprd08.prod.outlook.com (2603:10a6:203:4d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Mon, 12 Jul
 2021 10:50:56 +0000
Received: from DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::85) by DB3PR06CA0012.outlook.office365.com
 (2603:10a6:8:1::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Mon, 12 Jul 2021 10:50:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT045.mail.protection.outlook.com (10.152.21.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Mon, 12 Jul 2021 10:50:56 +0000
Received: ("Tessian outbound 8b91ad1fd5d8:v98");
 Mon, 12 Jul 2021 10:50:56 +0000
Received: from 12e6e87c3c03.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 311772F7-3A90-479F-A05E-A063611FFF7C.1; 
 Mon, 12 Jul 2021 10:50:24 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 12e6e87c3c03.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 12 Jul 2021 10:50:24 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PAXPR08MB6592.eurprd08.prod.outlook.com (2603:10a6:102:158::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Mon, 12 Jul
 2021 10:50:22 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d%8]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 10:50:21 +0000
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
X-Inumbo-ID: 0a5b9ee0-e2ff-11eb-86e3-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpROOC5XltsUGm+yEoptO2dxSk8iMDYqLm01ZSKpsDU=;
 b=Xx9vbrfrwuvJlVj2SV/DHkAngAoTpum5SMT/Y800+9iOFVPG9lSz5HmwDtMw5Ao4ZR63JNtqPtblPeD1nDuwMN5AjpKNWnpD+J8HuxTJJRv6ak9ZR3IDEwTQaPhKdDEmfZnqze1jGCAyeO9+/lGL+1Es2Dy6N443rF4cV8w40FE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ad0d734b986f6dc8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cvQxr0FmjRmJb5sQ+tTCVlQAPfYJyB/kTWtWadESFMNEIfSqv5IR0Tyn8AFG0ttRmdn/PssIACmyd+cTKPfkcUvt8Q+MfCZb0LO4XiGTvVdntKfMnb9eE+HUYtCfUDNC4KV0WMPPmK9jvkIkquJ8D7FY2N5kJEPJuf4MF5McZZc85d4JG2z5+o9NvDWob6wk3uGooIw/99En1hA/23Fb15oLsQU7dGkmZ/Y6EKJd/qXRWZf0Poulef87ETBfeQpGGw0vdtBfTLEqIGaxIL96y6n9VT/myN6rwhbXs1zj2ZhM+4/t4+ZwI683yzErnrtVlqp/91dRCHwHcuw72xBGAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpROOC5XltsUGm+yEoptO2dxSk8iMDYqLm01ZSKpsDU=;
 b=EGA6X969B15ATmB69EZZ8BA8HtVPMjgj+06yCzjtIa3abtfJ+Ez7ltz+fPl2f3rAY6KViewJDrlPTWJ5+4T+9z747WNjcrHTCPazZS9vLhnAK+OtX6phvxRcDdYbUoLwJEYoP5EZqVptjbpU4MqnVsDSHbUaqnjm0e7ISLozJQYsdpv+YCF4hLsNSaawVjUetcfsfWeNI1/dSaV/jvk8GROVQx2Mu/RrHLe3kU8O/N6dEcqyCCvvRQBcQdXGX6wvfQDzyHbl2cJX0u6uWdGh+g+T6w2Tmh2qFUG7likbKCiiByu4SB2SCzosMpdYyMz/Ey1GL7Vm2rCjXu1FypWhzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpROOC5XltsUGm+yEoptO2dxSk8iMDYqLm01ZSKpsDU=;
 b=Xx9vbrfrwuvJlVj2SV/DHkAngAoTpum5SMT/Y800+9iOFVPG9lSz5HmwDtMw5Ao4ZR63JNtqPtblPeD1nDuwMN5AjpKNWnpD+J8HuxTJJRv6ak9ZR3IDEwTQaPhKdDEmfZnqze1jGCAyeO9+/lGL+1Es2Dy6N443rF4cV8w40FE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH 2/4] xen/arm: Import ID features sanitize from linux
Thread-Topic: [RFC PATCH 2/4] xen/arm: Import ID features sanitize from linux
Thread-Index: AQHXbQzgNu/qUFs3aEClaXaz6zdScKs/KIwAgAAUw4A=
Date: Mon, 12 Jul 2021 10:50:21 +0000
Message-ID: <C505E8BE-9B75-4C19-A822-C65B5807EFAA@arm.com>
References: <cover.1624974370.git.bertrand.marquis@arm.com>
 <da0e48cde6c26d19fde468ad2860b807459a1042.1624974370.git.bertrand.marquis@arm.com>
 <d312b6aa-7bdd-5ce1-f28b-3227a9331c62@xen.org>
In-Reply-To: <d312b6aa-7bdd-5ce1-f28b-3227a9331c62@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.100.0.2.22)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 285c781c-960a-49c5-f080-08d94522ed73
x-ms-traffictypediagnostic: PAXPR08MB6592:|AM5PR0801MB2083:
X-Microsoft-Antispam-PRVS:
	<AM5PR0801MB208329CFBA03F0E317DBDBD39D159@AM5PR0801MB2083.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Rnub/BFl86CWBaBgZ7QGaTLRhvYajqSieGXSAOWidS430fx/ZBk4HHmeFaIh2WAa5Wzm/dS0jfJ8+yW+k/K2qNOQisUaWoQ+SU44Zym6hhoqCRueIvFPUdy/MHqA+BCbeL65H1DPp/704LqyPFB+RqQnI2W69I4TKdzKLVZiniwH6D/ai9TJTPtFNYDURCa6b51F1+mWTucVCenxV3G5oMmk4LOC/12zR1kspCynj1lY2JgXFFs/qDKCkP93j2BnWiUw+zVpUt3lxu1HgKJCTBI7zwTlVOrsw5fnqBBMi316Auyr8WiXiVIbTId4KNtIsEOe5zxJ3sFwnMlPKuJbJcV/JZViZcNaWuHejUV13mWUozSwK0wQMBwl1K+jSIGm0JP0BuOyOrYv9bzSNDn0gl8T9LuCL1od/ER+6OuSMNhpBlS4dlA/4TUlKnAyoj7fF0fINv2z0+3f1SdcnGoRjfQU5/7wUg+eX+Jg02qsNrqeD/q7kofBpqXuxliEPU71at80wQPfcwucgXDf5FlGzjepQ7nMmuyux/7nzWCK7NL49sfacT0uM7klgfALzB47U14OXYQV1Ya3+si2lFQNC1IRb919NTlA8kQR7j1UwSvG6tKRMzdc3zZlvzmJ7VO4QWfmAtVtXJdR3qcKrXPEA050Rn6Fr92c9zTj7Qb1o6dYGhFoq1b6JCgCWdVxKfvc8Xi2Ma76qaT+P5nW/wPJialA/mQzvK3IaceI6vA2eRdcyywoMeA2OXp2D6sb+fueam+bGEKezIelpPSQ6oSpWjTGWpJFIZL8fGIGDPFSB5+3OUm2IOGMMFq03dlgHuZN
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(346002)(376002)(396003)(366004)(91956017)(76116006)(66446008)(186003)(66946007)(26005)(4326008)(84040400003)(33656002)(6486002)(83380400001)(36756003)(66556008)(122000001)(66476007)(64756008)(38100700002)(5660300002)(2616005)(8676002)(6506007)(86362001)(2906002)(6512007)(6916009)(30864003)(71200400001)(53546011)(8936002)(478600001)(54906003)(316002)(2004002)(45980500001)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?D7AL10g5Pd35ORHW5pqc9gZP1eg8ZUinDBHRCgoLkvh1PLGntJ3aSbLWV4ht?=
 =?us-ascii?Q?ydbEXZPmGKpociew08YPTAf5dgP/LU5r8efGYpLL5HRUaJiDRGUvt1RjP4o7?=
 =?us-ascii?Q?YFaMGjDQst/vBp9SGCeGpMRoxsEbt/pCLlDO9dJ+gmM41E9e/qX11GSaBsZu?=
 =?us-ascii?Q?OENZipbB9v9reqIRn0P8edocaZ1GeWOVZPKGABumagw61EQFrVv0zNOgse0z?=
 =?us-ascii?Q?AIjyvgvR2tvbl58gjeXoSLgO59y8RPm5Att1/YL478aGIiAxu7E8aGGs3v/P?=
 =?us-ascii?Q?WOUbPJyAqFdoVteKyqCFh4fkB6SCV2IOigclaomMekTWm+WD6VN1KEBnjeNF?=
 =?us-ascii?Q?O+TogoNBM3iRNjrC73QFcqsX9kTApKWV8c+7jaNF8y2v/F5vExyhJ0Jbu03f?=
 =?us-ascii?Q?qy3lcWQGPUky9X2fo5XZ7qTsvU2LrNHzI6cLPb3yUhcdLMQ9S2drNMFZjBbA?=
 =?us-ascii?Q?tKQd4SQX3O41U2wOGIE6i/zdLojs3YDw5p1ay8ceqG0kuX3QtNvOF1kZY5tk?=
 =?us-ascii?Q?yY1ZA9mPGyJMAFss0SdnzaMkNUKGeaCHMPd30HGfL+PEJpUA8Uc1vsG3D1zR?=
 =?us-ascii?Q?MLUHATjeltHg2QijO0ZwflU967E5efuA607HlJ4odEsV+efzOGbosjnxdBkm?=
 =?us-ascii?Q?qwSjD7qmWecAFiZOP4BkhlvaTVnsY3zivwMQT14ICP2dQ+jcs6gMxdNW3YQl?=
 =?us-ascii?Q?2ql2b7Dq+b/mf9IAKz2w/bjUnP8l7Mok1xAQapayMjvTlZrZOsbqefRPI6xV?=
 =?us-ascii?Q?te9DDe8nt2XCZ+hsIFEnTjlmzmrNiY8SvUJHbyOBa+tqDQe798f/W2Tmfy8X?=
 =?us-ascii?Q?Ny8oFCTtnN5c+GStaHv69bQQgcSmrD41RM3Dbz8DAI1C5an6zqRwDVzr0ng8?=
 =?us-ascii?Q?C3uv2OvLqKeEi/Zsuozd9mKKmRY2DKh+sPvG8y76WuzQYf5ELFf0HEzRB6JJ?=
 =?us-ascii?Q?J2JCKdrZmLUwsDMp3/sMK1aPk+q37ERlO0GTzOzM7au3ug8wG7k/TyOBxDfE?=
 =?us-ascii?Q?if1FoT6eMgNbzj+OPTMYvMl9vpTq54+JmvvDBeiE4i0VI8x0dB6zzpRLH+2b?=
 =?us-ascii?Q?xyqmeobIxkYpTwOJKBfQajY/yBpP4xQeG0cWJH1iq+vYT8+1Va8uyqYeh1HS?=
 =?us-ascii?Q?EyeOpxBmzMiCFP4io8itHehkmg17bo5S+7B3HAjvecTWvUAXsqHsjBlhnUWP?=
 =?us-ascii?Q?HJ+jp034nm4thLbLP45MqumM8uKNGySQjarjvuO2HJ1eA+iVa2tafN/MzyWV?=
 =?us-ascii?Q?eG4bPiLWqHSJwYir1iK4fsDLBZew8ohAMWio4G2+RLGE9CK3qPWV0bApEi6f?=
 =?us-ascii?Q?OZoYHTKoRBoHLMfPH2ztFfyr?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A8B63EFE3CB6F74FB744474180D33FAD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6592
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d9e0f1af-1e1c-4e88-6693-08d94522d8e5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4cEHgMljyiy/0c52+BqAAN7UgG81tAT/qmIwtjkFei9HM9/bZylh9kCj4v4mv4+WEG99e3QBD9xqNxVVMKURy5VhIn3Ktu1CtoEf968A/E7SYNNbqFCvbwDcKCi1+4LuFBVDsOMvIOguL+/AefkXP5MdZz6y6XaA26bPZNQwzX1/C4Q6Io53N/9ZBbfRt3XpG6PsIAhNaXGU+DZIbdeR2YoFzojo19hzvP3dTKyEXzcOtiHtBVAiXO1PQaKkzGT/c1XQaLMvsL6usAoMu2ZyHBYitxbOL8skohfF/SrgVddPVIjXTq7N75Vjc651PYDidAkSyK2nEF+JCbue1C9KnBkFEvv2/cZBCQdB41hledynQ0zHIitBUJ9n+cdcxSFUpjHMHttYoyZeaGI7QTGGCUSrqLDlAo9Ijgd3HLrAESS5mJn9+CP081rYUU6TC1m/YIB8dmDRj2e36bXyTR8YvA3r0VvkkPNz1f2GtoxOy8W/0BS7v3uQP9Y+DSW36TX8+McmS9XeMlsOlpODQQ0kM+uK1yFBsREfWiW4ZtPbl0UWZAOaGkxi4izdRf5p4QNZWCE9Vsn6JFwXBndUAZZ++MRFa2eeWrEBTN+FL+WbIxEyKF467Q7WZRMMhOanz6tKV4vx17mEY/CbIJHT3h1DpsA6y5ufjPG4RfzO1Ww/Hza9sTL/pOUTp5v8ygEfEblU/vL5lPUzUopxxy0N02/zwVzPgxp6T/t4j1a7Cx+y40710pgrG6lesVLEyjNftO0kILo8mlFQtNk5WQcSQ5gyF1ZJoVtK1KMEX5vWRUAhpGQ3ROXKgW4YOvONRvqmhqfx
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(36840700001)(46966006)(2616005)(53546011)(54906003)(6862004)(82310400003)(84040400003)(33656002)(316002)(26005)(6506007)(70206006)(36756003)(70586007)(30864003)(2906002)(8676002)(47076005)(86362001)(83380400001)(478600001)(6486002)(81166007)(356005)(107886003)(82740400003)(8936002)(336012)(186003)(6512007)(5660300002)(36860700001)(4326008)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 10:50:56.4558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 285c781c-960a-49c5-f080-08d94522ed73
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2083

Hi Julien,


> On 12 Jul 2021, at 10:36, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 29/06/2021 18:08, Bertrand Marquis wrote:
>> Import structures declared in Linux file arch/arm64/kernel/cpufeature.c
>> and import the required types.
>> Current code has been imported from Linux 5.13-rc5 (Commit ID
>> cd1245d75ce93b8fd206f4b34eb58bcfe156d5e9)
>> Those structure will be used to sanitize the cpu features available to
>> the ones availble on all cores of a system even if we are on an
>> heterogeneous platform (from example a big/LITTLE).
>> For each feature field of all ID registers, those structures define what
>> is the safest value and if we can allow to have different values in
>> different cores.
>> This patch is introducing Linux code without any changes to it.
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>>  xen/arch/arm/arm64/Makefile      |   1 +
>>  xen/arch/arm/arm64/cpusanitize.c | 494 +++++++++++++++++++++++++++++++
>>  2 files changed, 495 insertions(+)
>>  create mode 100644 xen/arch/arm/arm64/cpusanitize.c
>> diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
>> index 40642ff574..c626990185 100644
>> --- a/xen/arch/arm/arm64/Makefile
>> +++ b/xen/arch/arm/arm64/Makefile
>> @@ -1,6 +1,7 @@
>>  obj-y +=3D lib/
>>    obj-y +=3D cache.o
>> +obj-y +=3D cpusanitize.o
>=20
> Looking at the code, I don't think this cpusanitize.c would build after t=
his patch. To allow bisection, this line would need to move when the file c=
an build.

You are right. I will push the Makefile change to the next patch.

>=20
>>  obj-$(CONFIG_HARDEN_BRANCH_PREDICTOR) +=3D bpi.o
>>  obj-$(CONFIG_EARLY_PRINTK) +=3D debug.o
>>  obj-y +=3D domctl.o
>> diff --git a/xen/arch/arm/arm64/cpusanitize.c b/xen/arch/arm/arm64/cpusa=
nitize.c
>> new file mode 100644
>> index 0000000000..4cc8378c14
>> --- /dev/null
>> +++ b/xen/arch/arm/arm64/cpusanitize.c
>=20
> Any reason to not stick with the Linux name?

File in linux is named cpufeature.c and we already have a file cpufeature.c=
 in arch/arm so I wanted to prevent clashes.
As this is anyway in arm64 subdirectory the clash does not really exist so =
I will rename the file to cpufeature.c.

>=20
>> @@ -0,0 +1,494 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Sanitize CPU feature definitions
>> + *
>> + * Copyright (C) 2021 Arm Ltd.
>> + * based on code from the Linux kernel, which is:
>> + *  Copyright (C) 2015 ARM Ltd.
>=20
> Linux has a large comment explaining the goal of the file. I think it is =
worth to keep it for Xen.

Ok

>=20
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program.  If not, see <http://www.gnu.org/licenses/>=
.
>=20
> This is a redundant with the SPDX tag above. Please get rid of one of the=
m.

Ok I will keep just the SPDX and copyrights.


>=20
>> + */
>> +
>> +#include <xen/types.h>
>> +#include <asm/sysregs.h>
>> +#include <asm/cpufeature.h>
>> +
>> +/*
>> + * CPU feature register tracking
>> + *
>> + * The safe value of a CPUID feature field is dependent on the implicat=
ions
>> + * of the values assigned to it by the architecture. Based on the relat=
ionship
>> + * between the values, the features are classified into 3 types - LOWER=
_SAFE,
>> + * HIGHER_SAFE and EXACT.
>> + *
>> + * The lowest value of all the CPUs is chosen for LOWER_SAFE and highes=
t
>> + * for HIGHER_SAFE. It is expected that all CPUs have the same value fo=
r
>> + * a field when EXACT is specified, failing which, the safe value speci=
fied
>> + * in the table is chosen.
>> + */
>> +
>> +enum ftr_type {
>> +    FTR_EXACT,               /* Use a predefined safe value */
>> +    FTR_LOWER_SAFE,          /* Smaller value is safe */
>> +    FTR_HIGHER_SAFE,         /* Bigger value is safe */
>> +    FTR_HIGHER_OR_ZERO_SAFE, /* Bigger value is safe, but 0 is biggest =
*/
>> +};
> Please use the Linux coding style to stay consistent with the rest of the=
 file. However, unless there is a reason to, I would prefer if the definiti=
on are in a separate header like Linux did.

Ok, I will apply the linux coding style to the whole file.

>=20
>> +
>> +#define FTR_STRICT      true    /* SANITY check strict matching require=
d */
>> +#define FTR_NONSTRICT   false   /* SANITY check ignored */
>> +
>> +#define FTR_SIGNED      true    /* Value should be treated as signed */
>> +#define FTR_UNSIGNED    false   /* Value should be treated as unsigned =
*/
>> +
>> +#define FTR_VISIBLE true    /* Feature visible to the user space */
>> +#define FTR_HIDDEN  false   /* Feature is hidden from the user */
>> +
>> +#define FTR_VISIBLE_IF_IS_ENABLED(config)       \
>> +    (IS_ENABLED(config) ? FTR_VISIBLE : FTR_HIDDEN)
>> +
>> +struct arm64_ftr_bits {
>> +    bool    sign;   /* Value is signed ? */
>> +    bool    visible;
>> +    bool    strict; /* CPU Sanity check: strict matching required ? */
>> +    enum ftr_type   type;
>> +    u8      shift;
>> +    u8      width;
>> +    s64     safe_val; /* safe value for FTR_EXACT features */
>> +};
>> +
>> +/*
>> + * NOTE: The following structures are imported directly from Linux kern=
el and
>> + * should be kept in sync.
>> + * The current version has been imported from arch/arm64/kernel/cpufeat=
ure.c
>> + *  from kernel version 5.13-rc5
>> + */
>=20
> It feels a bit odd to add this comment in the middle of the definition. I=
t would be better to move it close to the copyright.

Ok.

>=20
>> +
>> +#define __ARM64_FTR_BITS(SIGNED, VISIBLE, STRICT, TYPE, SHIFT, WIDTH, S=
AFE_VAL) \
>> +	{						\
>> +		.sign =3D SIGNED,				\
>> +		.visible =3D VISIBLE,			\
>> +		.strict =3D STRICT,			\
>> +		.type =3D TYPE,				\
>> +		.shift =3D SHIFT,				\
>> +		.width =3D WIDTH,				\
>> +		.safe_val =3D SAFE_VAL,			\
>> +	}
>> +
>> +/* Define a feature with unsigned values */
>> +#define ARM64_FTR_BITS(VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL) \
>> +	__ARM64_FTR_BITS(FTR_UNSIGNED, VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SA=
FE_VAL)
>> +
>> +/* Define a feature with a signed value */
>> +#define S_ARM64_FTR_BITS(VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL)=
 \
>> +	__ARM64_FTR_BITS(FTR_SIGNED, VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE=
_VAL)
>> +
>> +#define ARM64_FTR_END					\
>> +	{						\
>> +		.width =3D 0,				\
>> +	}
>> +
>> +static void cpu_enable_cnp(struct arm64_cpu_capabilities const *cap);
>=20
> This function is not defined in the code you import.

I imported the block I am interested in from Linux and I am filtering it in=
 the
Next patch where I remove those function prototypes.

This was to allow easier update of the code.

Should I filter directly when importing linux code then ?

>=20
>> +
>> +static bool __system_matches_cap(unsigned int n);
>=20
> Ditto.

Cheers
Bertrand

>=20
>> +
>> +/*
>> + * NOTE: Any changes to the visibility of features should be kept in
>> + * sync with the documentation of the CPU feature register ABI.
>> + */
>> +static const struct arm64_ftr_bits ftr_id_aa64isar0[] =3D {
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR0_R=
NDR_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR0_TL=
B_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR0_T=
S_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR0_F=
HM_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR0_D=
P_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR0_S=
M4_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR0_S=
M3_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR0_S=
HA3_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR0_R=
DM_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR0_A=
TOMICS_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR0_C=
RC32_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR0_S=
HA2_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR0_S=
HA1_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR0_A=
ES_SHIFT, 4, 0),
>> +	ARM64_FTR_END,
>> +};
>> +
>> +static const struct arm64_ftr_bits ftr_id_aa64isar1[] =3D {
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_I=
8MM_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_D=
GH_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_B=
F16_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_SP=
ECRES_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_S=
B_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_F=
RINTTS_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_PTR_AUTH),
>> +		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_GPI_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_PTR_AUTH),
>> +		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_GPA_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_L=
RCPC_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_F=
CMA_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_J=
SCVT_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_PTR_AUTH),
>> +		       FTR_STRICT, FTR_EXACT, ID_AA64ISAR1_API_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_PTR_AUTH),
>> +		       FTR_STRICT, FTR_EXACT, ID_AA64ISAR1_APA_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_D=
PB_SHIFT, 4, 0),
>> +	ARM64_FTR_END,
>> +};
>> +
>> +static const struct arm64_ftr_bits ftr_id_aa64pfr0[] =3D {
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_=
CSV3_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_=
CSV2_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_DI=
T_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_=
AMU_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_MPA=
M_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_=
SEL2_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
>> +				   FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_SVE_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_RAS=
_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_GIC=
_SHIFT, 4, 0),
>> +	S_ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_=
ASIMD_SHIFT, 4, ID_AA64PFR0_ASIMD_NI),
>> +	S_ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_=
FP_SHIFT, 4, ID_AA64PFR0_FP_NI),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_=
EL3_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_=
EL2_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_=
EL1_SHIFT, 4, ID_AA64PFR0_EL1_64BIT_ONLY),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_=
EL0_SHIFT, 4, ID_AA64PFR0_EL0_64BIT_ONLY),
>> +	ARM64_FTR_END,
>> +};
>> +
>> +static const struct arm64_ftr_bits ftr_id_aa64pfr1[] =3D {
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_MPA=
MFRAC_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_RAS=
FRAC_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_MTE),
>> +		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_MTE_SHIFT, 4, ID_AA64P=
FR1_MTE_NI),
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR1=
_SSBS_SHIFT, 4, ID_AA64PFR1_SSBS_PSTATE_NI),
>> +	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_BTI),
>> +				    FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_BT_SHIFT, 4, 0),
>> +	ARM64_FTR_END,
>> +};
>> +
>> +static const struct arm64_ftr_bits ftr_id_aa64zfr0[] =3D {
>> +	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
>> +		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ZFR0_F64MM_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
>> +		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ZFR0_F32MM_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
>> +		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ZFR0_I8MM_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
>> +		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ZFR0_SM4_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
>> +		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ZFR0_SHA3_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
>> +		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ZFR0_BF16_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
>> +		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ZFR0_BITPERM_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
>> +		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ZFR0_AES_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_SVE),
>> +		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ZFR0_SVEVER_SHIFT, 4, 0),
>> +	ARM64_FTR_END,
>> +};
>> +
>> +static const struct arm64_ftr_bits ftr_id_aa64mmfr0[] =3D {
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR0_EC=
V_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR0_FG=
T_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR0_EX=
S_SHIFT, 4, 0),
>> +	/*
>> +	 * Page size not being supported at Stage-2 is not fatal. You
>> +	 * just give up KVM if PAGE_SIZE isn't supported there. Go fix
>> +	 * your favourite nesting hypervisor.
>> +	 *
>> +	 * There is a small corner case where the hypervisor explicitly
>> +	 * advertises a given granule size at Stage-2 (value 2) on some
>> +	 * vCPUs, and uses the fallback to Stage-1 (value 0) for other
>> +	 * vCPUs. Although this is not forbidden by the architecture, it
>> +	 * indicates that the hypervisor is being silly (or buggy).
>> +	 *
>> +	 * We make no effort to cope with this and pretend that if these
>> +	 * fields are inconsistent across vCPUs, then it isn't worth
>> +	 * trying to bring KVM up.
>> +	 */
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_EXACT, ID_AA64MMFR0_TGRA=
N4_2_SHIFT, 4, 1),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_EXACT, ID_AA64MMFR0_TGRA=
N64_2_SHIFT, 4, 1),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_EXACT, ID_AA64MMFR0_TGRA=
N16_2_SHIFT, 4, 1),
>> +	/*
>> +	 * We already refuse to boot CPUs that don't support our configured
>> +	 * page size, so we can only detect mismatches for a page size other
>> +	 * than the one we're currently using. Unfortunately, SoCs like this
>> +	 * exist in the wild so, even though we don't like it, we'll have to g=
o
>> +	 * along with it and treat them as non-strict.
>> +	 */
>> +	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64MMF=
R0_TGRAN4_SHIFT, 4, ID_AA64MMFR0_TGRAN4_NI),
>> +	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64MMF=
R0_TGRAN64_SHIFT, 4, ID_AA64MMFR0_TGRAN64_NI),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64MMFR0=
_TGRAN16_SHIFT, 4, ID_AA64MMFR0_TGRAN16_NI),
>> +
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR0_BI=
GENDEL0_SHIFT, 4, 0),
>> +	/* Linux shouldn't care about secure memory */
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64MMFR0=
_SNSMEM_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR0_BI=
GENDEL_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR0_AS=
ID_SHIFT, 4, 0),
>> +	/*
>> +	 * Differing PARange is fine as long as all peripherals and memory are=
 mapped
>> +	 * within the minimum PARange of all CPUs
>> +	 */
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64MMFR0=
_PARANGE_SHIFT, 4, 0),
>> +	ARM64_FTR_END,
>> +};
>> +
>> +static const struct arm64_ftr_bits ftr_id_aa64mmfr1[] =3D {
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_ET=
S_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_TW=
ED_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_XN=
X_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_HIGHER_SAFE, ID_AA64MMFR1_S=
PECSEI_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_PA=
N_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_LO=
R_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_HP=
D_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_VH=
E_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_VM=
IDBITS_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_HA=
DBS_SHIFT, 4, 0),
>> +	ARM64_FTR_END,
>> +};
>> +
>> +static const struct arm64_ftr_bits ftr_id_aa64mmfr2[] =3D {
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64MMFR2=
_E0PD_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR2_EV=
T_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR2_BB=
M_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR2_TT=
L_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR2_FW=
B_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR2_ID=
S_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR2_A=
T_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR2_ST=
_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR2_NV=
_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR2_CC=
IDX_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR2_LV=
A_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64MMFR2=
_IESB_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR2_LS=
M_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR2_UA=
O_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR2_CN=
P_SHIFT, 4, 0),
>> +	ARM64_FTR_END,
>> +};
>> +
>> +static const struct arm64_ftr_bits ftr_ctr[] =3D {
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, 31, 1, 1), /* RES1 =
*/
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_DIC_SHIFT,=
 1, 1),
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_IDC_SHIFT,=
 1, 1),
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_HIGHER_OR_ZERO_SAFE, CTR_C=
WG_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_HIGHER_OR_ZERO_SAFE, CTR_E=
RG_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_DMINLINE_S=
HIFT, 4, 1),
>> +	/*
>> +	 * Linux can handle differing I-cache policies. Userspace JITs will
>> +	 * make use of *minLine.
>> +	 * If we have differing I-cache policies, report it as the weakest - V=
IPT.
>> +	 */
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_EXACT, CTR_L1IP_SHIFT, =
2, ICACHE_POLICY_VIPT),	/* L1Ip */
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_IMINLINE_S=
HIFT, 4, 0),
>> +	ARM64_FTR_END,
>> +};
>> +
>> +static struct arm64_ftr_override __ro_after_init no_override =3D { };
>> +
>> +struct arm64_ftr_reg arm64_ftr_reg_ctrel0 =3D {
>> +	.name		=3D "SYS_CTR_EL0",
>> +	.ftr_bits	=3D ftr_ctr,
>> +	.override	=3D &no_override,
>> +};
>> +
>> +static const struct arm64_ftr_bits ftr_id_mmfr0[] =3D {
>> +	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR0_INNE=
RSHR_SHIFT, 4, 0xf),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR0_FCSE_S=
HIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_MMFR0_AUX=
REG_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR0_TCM_SH=
IFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR0_SHAREL=
VL_SHIFT, 4, 0),
>> +	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR0_OUTE=
RSHR_SHIFT, 4, 0xf),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR0_PMSA_S=
HIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR0_VMSA_S=
HIFT, 4, 0),
>> +	ARM64_FTR_END,
>> +};
>> +
>> +static const struct arm64_ftr_bits ftr_id_aa64dfr0[] =3D {
>> +	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_D=
OUBLELOCK_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR0_=
PMSVER_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_CTX=
_CMPS_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_WRP=
S_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_BRP=
S_SHIFT, 4, 0),
>> +	/*
>> +	 * We can instantiate multiple PMU instances with different levels
>> +	 * of support.
>> +	 */
>> +	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_EXACT, ID_AA64DFR0_PMU=
VER_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_EXACT, ID_AA64DFR0_DEBUGVER=
_SHIFT, 4, 0x6),
>> +	ARM64_FTR_END,
>> +};
>> +
>> +static const struct arm64_ftr_bits ftr_mvfr2[] =3D {
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, MVFR2_FPMISC_SH=
IFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, MVFR2_SIMDMISC_=
SHIFT, 4, 0),
>> +	ARM64_FTR_END,
>> +};
>> +
>> +static const struct arm64_ftr_bits ftr_dczid[] =3D {
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, DCZID_DZP_SHIFT, 1,=
 1),
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, DCZID_BS_SHIFT=
, 4, 0),
>> +	ARM64_FTR_END,
>> +};
>> +
>> +static const struct arm64_ftr_bits ftr_id_isar0[] =3D {
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR0_DIVIDE=
_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR0_DEBUG_=
SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR0_COPROC=
_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR0_CMPBRA=
NCH_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR0_BITFIE=
LD_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR0_BITCOU=
NT_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR0_SWAP_S=
HIFT, 4, 0),
>> +	ARM64_FTR_END,
>> +};
>> +
>> +static const struct arm64_ftr_bits ftr_id_isar5[] =3D {
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR5_RDM_SH=
IFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR5_CRC32_=
SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR5_SHA2_S=
HIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR5_SHA1_S=
HIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR5_AES_SH=
IFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR5_SEVL_S=
HIFT, 4, 0),
>> +	ARM64_FTR_END,
>> +};
>> +
>> +static const struct arm64_ftr_bits ftr_id_mmfr4[] =3D {
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR4_EVT_SH=
IFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR4_CCIDX_=
SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR4_LSM_SH=
IFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR4_HPDS_S=
HIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR4_CNP_SH=
IFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR4_XNX_SH=
IFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR4_AC2_SH=
IFT, 4, 0),
>> +
>> +	/*
>> +	 * SpecSEI =3D 1 indicates that the PE might generate an SError on an
>> +	 * external abort on speculative read. It is safe to assume that an
>> +	 * SError might be generated than it will not be. Hence it has been
>> +	 * classified as FTR_HIGHER_SAFE.
>> +	 */
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_HIGHER_SAFE, ID_MMFR4_SPECS=
EI_SHIFT, 4, 0),
>> +	ARM64_FTR_END,
>> +};
>> +
>> +static const struct arm64_ftr_bits ftr_id_isar4[] =3D {
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR4_SWP_FR=
AC_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR4_PSR_M_=
SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR4_SYNCH_=
PRIM_FRAC_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR4_BARRIE=
R_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR4_SMC_SH=
IFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR4_WRITEB=
ACK_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR4_WITHSH=
IFTS_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR4_UNPRIV=
_SHIFT, 4, 0),
>> +	ARM64_FTR_END,
>> +};
>> +
>> +static const struct arm64_ftr_bits ftr_id_mmfr5[] =3D {
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR5_ETS_SH=
IFT, 4, 0),
>> +	ARM64_FTR_END,
>> +};
>> +
>> +static const struct arm64_ftr_bits ftr_id_isar6[] =3D {
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR6_I8MM_S=
HIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR6_BF16_S=
HIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR6_SPECRE=
S_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR6_SB_SHI=
FT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR6_FHM_SH=
IFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR6_DP_SHI=
FT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR6_JSCVT_=
SHIFT, 4, 0),
>> +	ARM64_FTR_END,
>> +};
>> +
>> +static const struct arm64_ftr_bits ftr_id_pfr0[] =3D {
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR0_DIT_SHI=
FT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_PFR0_CSV2=
_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR0_STATE3_=
SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR0_STATE2_=
SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR0_STATE1_=
SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR0_STATE0_=
SHIFT, 4, 0),
>> +	ARM64_FTR_END,
>> +};
>> +
>> +static const struct arm64_ftr_bits ftr_id_pfr1[] =3D {
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR1_GIC_SHI=
FT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR1_VIRT_FR=
AC_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR1_SEC_FRA=
C_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR1_GENTIME=
R_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR1_VIRTUAL=
IZATION_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR1_MPROGMO=
D_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR1_SECURIT=
Y_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_PFR1_PROGMOD=
_SHIFT, 4, 0),
>> +	ARM64_FTR_END,
>> +};
>> +
>> +static const struct arm64_ftr_bits ftr_id_pfr2[] =3D {
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_PFR2_SSBS=
_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_PFR2_CSV3=
_SHIFT, 4, 0),
>> +	ARM64_FTR_END,
>> +};
>> +
>> +static const struct arm64_ftr_bits ftr_id_dfr0[] =3D {
>> +	/* [31:28] TraceFilt */
>> +	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_DFR0_PERFM=
ON_SHIFT, 4, 0xf),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_DFR0_MPROFDB=
G_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_DFR0_MMAPTRC=
_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_DFR0_COPTRC_=
SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_DFR0_MMAPDBG=
_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_DFR0_COPSDBG=
_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_DFR0_COPDBG_=
SHIFT, 4, 0),
>> +	ARM64_FTR_END,
>> +};
>> +
>> +static const struct arm64_ftr_bits ftr_id_dfr1[] =3D {
>> +	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_DFR1_MTPMU=
_SHIFT, 4, 0),
>> +	ARM64_FTR_END,
>> +};
>> +
>> +static const struct arm64_ftr_bits ftr_zcr[] =3D {
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE,
>> +		ZCR_ELx_LEN_SHIFT, ZCR_ELx_LEN_SIZE, 0),	/* LEN */
>> +	ARM64_FTR_END,
>> +};
>> +
>> +/*
>> + * Common ftr bits for a 32bit register with all hidden, strict
>> + * attributes, with 4bit feature fields and a default safe value of
>> + * 0. Covers the following 32bit registers:
>> + * id_isar[1-4], id_mmfr[1-3], id_pfr1, mvfr[0-1]
>> + */
>> +static const struct arm64_ftr_bits ftr_generic_32bits[] =3D {
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 28, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 24, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 20, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 16, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 12, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 8, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 4, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, 0, 4, 0),
>> +	ARM64_FTR_END,
>> +};
>> +
>> +/* Table for a single 32bit feature value */
>> +static const struct arm64_ftr_bits ftr_single32[] =3D {
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_EXACT, 0, 32, 0),
>> +	ARM64_FTR_END,
>> +};
>> +
>> +static const struct arm64_ftr_bits ftr_raz[] =3D {
>> +	ARM64_FTR_END,
>> +};
>> +
>> +/*
>> + * End of imported linux structures
>> + */
>> +
>=20
> --=20
> Julien Grall


