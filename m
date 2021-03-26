Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FCB34A7CF
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 14:07:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101787.194895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPmBc-00032w-Rv; Fri, 26 Mar 2021 13:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101787.194895; Fri, 26 Mar 2021 13:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPmBc-00032X-OT; Fri, 26 Mar 2021 13:07:36 +0000
Received: by outflank-mailman (input) for mailman id 101787;
 Fri, 26 Mar 2021 13:07:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8+7B=IY=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lPmBb-00032R-58
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 13:07:35 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.85]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1cb5965a-2d3a-4813-9744-f358194c4ec7;
 Fri, 26 Mar 2021 13:07:32 +0000 (UTC)
Received: from DU2PR04CA0021.eurprd04.prod.outlook.com (2603:10a6:10:3b::26)
 by AM9PR08MB6851.eurprd08.prod.outlook.com (2603:10a6:20b:305::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Fri, 26 Mar
 2021 13:07:30 +0000
Received: from DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::e7) by DU2PR04CA0021.outlook.office365.com
 (2603:10a6:10:3b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26 via Frontend
 Transport; Fri, 26 Mar 2021 13:07:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT041.mail.protection.outlook.com (10.152.21.4) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Fri, 26 Mar 2021 13:07:29 +0000
Received: ("Tessian outbound 31ead7df1201:v89");
 Fri, 26 Mar 2021 13:07:29 +0000
Received: from d693723aa2d8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7D54F43C-79F3-4F55-A7C6-8376C887D34B.1; 
 Fri, 26 Mar 2021 13:07:12 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d693723aa2d8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 26 Mar 2021 13:07:12 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VE1PR08MB4814.eurprd08.prod.outlook.com (2603:10a6:802:ad::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Fri, 26 Mar
 2021 13:07:11 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.3977.029; Fri, 26 Mar 2021
 13:07:11 +0000
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
X-Inumbo-ID: 1cb5965a-2d3a-4813-9744-f358194c4ec7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuEPvYi5Wn+X7zF7YvqqlOAiF/t9G0fQJ+M/+xlpEAI=;
 b=4xf9vHeCnRZU0ctaSHzVffH/k0fdRWtRfAc8Y/HTUTMgLl1RM+Jl/4OIfZbUQI+UuwPR4/AOlAsthB04gJqqVej3xD6jpvTyGL0GHZnOQndbGCd3btHUP2jl7Mu0d0QeeSJTFFEUMBJCsQACpl7s3MaXjMdAl/N4Rw3R1YPyjZU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 590aed3a4b8d8d0e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWjZG99rA1VED2ShZPIvSM4zE+g2qNxlzTOnB/YVGXiDYsvWO1lQ7miE4NRMYJYdev0uNhfFUZ/qZCIw9sePMIETZb+CtFXegjpLMEBnCBHbqYZpf7tviJT1VWJF/iQDDed9b+/0ItcjppqlPHOJ08f/DgtqDV1VPviwJvXc2gS3zeqLj9KUBlPbrymyULJyvaROwOQYysJfugKAcCAP7FV5CCEz1R7gp1I6Rq/Uf4yyLtUHlJL/JIZXTdhG0xbQU1I266RMmtILDpycD948T9BTfTEv61Wp1MBuneJC9NBvVrClWuDpsxG2nMH49na2KpbgAY4FF0H+Q4Vpms+mug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuEPvYi5Wn+X7zF7YvqqlOAiF/t9G0fQJ+M/+xlpEAI=;
 b=id8rwZBddi+y8lo7kmHvawSV23G9sJp8CuuPq9C/cmmuRh306I00RZt+79a77r58Mnzsa2juyGCM1V0cf6N81yviilKkeScAKACXEkj2bWvjvISpn2+DCFakmz0C9GatXTnl0gMZTkINF2G53rFYa6PO1CfNp7RbSeLHE2Z6TCqM04BdMowWgzpUVkJYhCnc6lqIEIDF338gMGCoOq9pf0h4oqjiF0r9cxyPZrc31ieVx+zlXnPTIdyNLlykwf7XZ5aJO1gqbkfkFNZceI4yLV+m3lj0nZOSfae+FpXq2+jKdgsKrw5c3wIctgGdMCk1cgyHIMyC04oVIeY500IW/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuEPvYi5Wn+X7zF7YvqqlOAiF/t9G0fQJ+M/+xlpEAI=;
 b=4xf9vHeCnRZU0ctaSHzVffH/k0fdRWtRfAc8Y/HTUTMgLl1RM+Jl/4OIfZbUQI+UuwPR4/AOlAsthB04gJqqVej3xD6jpvTyGL0GHZnOQndbGCd3btHUP2jl7Mu0d0QeeSJTFFEUMBJCsQACpl7s3MaXjMdAl/N4Rw3R1YPyjZU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Xen.org security team
	<security@xen.org>
Subject: Re: [PATCH for-next v2 2/2] xen/arm64: Place a speculation barrier
 following an ret instruction
Thread-Topic: [PATCH for-next v2 2/2] xen/arm64: Place a speculation barrier
 following an ret instruction
Thread-Index: AQHXGCLUePNZXth41EOpDgjR62uDxqqISyAAgASaOICACUyKAIAAC94AgAAT1gA=
Date: Fri, 26 Mar 2021 13:07:11 +0000
Message-ID: <05231AC7-484B-48A6-8A5B-119DFB705DF0@arm.com>
References: <20210313160611.18665-1-julien@xen.org>
 <20210313160611.18665-3-julien@xen.org>
 <C0FD2269-4D00-480A-94AC-61663E0C9E94@arm.com>
 <50175d48-6f0b-2d96-8ea9-33f4f65f920f@xen.org>
 <342BA51C-80BE-4393-997E-6C5830CB57A1@arm.com>
 <4dd05515-b65e-e690-1891-5fd24400e385@xen.org>
In-Reply-To: <4dd05515-b65e-e690-1891-5fd24400e385@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f4330770-40ea-4bb0-d539-08d8f0581c8c
x-ms-traffictypediagnostic: VE1PR08MB4814:|AM9PR08MB6851:
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB68514673B25F536943EAF2479D619@AM9PR08MB6851.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5Drzv8BW74uO2XzOZBDdAE3baesmVfxFqH5KkfwKKjzn3ioPkc+HgZsQvbywpnU3CoTjiqhkzuCcc6/AzY6Pfgm8WYmxfy8rDCvbK2z3IdTHhBDmGAZAJurrw2Dz597rzE/+pa9aCX6rpCjqe68JtncjyI+wiZKle3dY5pyOmJmiuOA40tx7+SVfdrHOo5XU4tZYq7D21HmV6ItikkJ0gTesQbvOyxq5pDEu/GzL7OwHu5H7lcvn2FcbB85e2xDV8+lCC1+8vnzLPJ7ldJI5mNDVSDc32RLmMfUFIgm7xsicf0VFPf9KKdSHwrO82C+dbJo2yT0qY5h1g4K27NACE4BGdYQQcRuUHM3I3ZtjQknR0KW4ZkGwqXwecKvdpBsNKKwvnoaYShhk6MyBbG+yORVIcquAJo1OfDR5mQV22NxER2z+kQY2BN61Gw813QmMFVXFklibz3FbHa5cxrHSeql60QICgcheXl1YkBC6EeyA9hanYI2qDV+Ls6XEVycadwFZAm8p8Ez9q9q8U1zJRyuhI9g49ZD2S19vy4Z+LxRfXhdvq5txugSIFv7YfWdh4qDl3YGC49+hEsfqUi2c6Y5aAv8dsABJrrtPAI14AxIJf8UA9svJaodHSLwH0nv93D4iJwbkRx2vNKBSN0Dyg47y4Ez1IUgfzHFbnt6T90/p1aEKHcndSfRE3pXn1g17
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(366004)(39860400002)(346002)(6506007)(186003)(53546011)(66946007)(8936002)(6512007)(91956017)(5660300002)(76116006)(2906002)(66446008)(83380400001)(64756008)(66556008)(316002)(66476007)(2616005)(26005)(54906003)(8676002)(86362001)(38100700001)(6916009)(478600001)(4326008)(71200400001)(36756003)(6486002)(33656002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?K3d4Z0lHRHVYU3lOeTVkaUlMN3ZLY0YwWUdFZk0vUUtjZ1UzV2tLLzA4c0xJ?=
 =?utf-8?B?aW1BUWVGb3dRcVVNdGU1TTlvamo2d2hjcEhkNEV6TjhNcUJWemszelZ6ckl1?=
 =?utf-8?B?S3JvZmljZndMTlBzV3lxbFBKeHRNVXljZ1VzS0FreGVBaW9wUFlMNURicHA0?=
 =?utf-8?B?UEhoWDdXSHRYbGNzTnRLcCtuUEl5UkJWYVViRWVYU1RFMFc5bGdnNmNkVTd4?=
 =?utf-8?B?RlZqNG1Nb0RMWkZrL1BKMEY2eGlRWUg5eWE0TllseFY3U0gyOXpkYldiY1or?=
 =?utf-8?B?NmVVVzQraFN6U1JIVVlxRWxCVEREUmc5VTdYQmZLQzJVZXQ3TmZMdjZlaVQw?=
 =?utf-8?B?ajh1WFRCTGZMZUpYWk9ndC90WVBYMTMxT2l0NXRlNC9WUlpTc21YcUwwVHI2?=
 =?utf-8?B?VWJzY01pVXYrVWUzOTdoUDE0U3pFS2RpVmJBMkVJa0VYcWJ2NjJhOGFEdHBm?=
 =?utf-8?B?YlBpZ2ozZVZSUE9BeDVRcC9KMUFaYWlFdkVOUWFwY050MUF3enV2Um8xbllr?=
 =?utf-8?B?NWU0Qi85UmdDTlVZZXdVRFhqL1crZStUUktaY25WODNpZmU3eWFIdUN6cy94?=
 =?utf-8?B?Znd2UHl0ZGJwM1lpWHBoeVoxNWlTamU4MkRxMnBYc1ZPSUVyZ09VYzd6enhp?=
 =?utf-8?B?WExWY21qckE0Vk1VVi9IMzNkUzAwelpiVDRrUk1LSWNBcVN4cWNZdUIrRnQ0?=
 =?utf-8?B?b1JtQTlFU1krOUY1NHkrK3U0NzFVSERYcTF6OXNiY3hNNWphR01KUnN0UWs0?=
 =?utf-8?B?R05zdVNJeFhURFpYZGxNL3FmMXRsV0U3cDVCclQrd1hVVlVGTXJkWWdvK0F1?=
 =?utf-8?B?aG5wL21OZi9ucW9VUzQrZy8vMFhMc2htMjRLbVNDNG1MTzZGdlhFZU4ySHVK?=
 =?utf-8?B?TWJuSUVaQlRDbHpMdlB6eERUaGlicDU5b2ppUlpDVlRNSXJQSlk3WWlHNTc0?=
 =?utf-8?B?MFF0Uk45VEQxWEtMTThRWlljaSszN29Md2V5RkwyNXJ3K0VLZWZzNDk4Vy85?=
 =?utf-8?B?Szh4S24vZVl0NjVtSGpqNVpuc3RmbXMrVkxYTWJjNzZjYVBXc0hQTy9rTHNj?=
 =?utf-8?B?d0tEbmQ5cFpkeTA1TWhneSs4ZjVNb01UaWZGRnBFTnNCVFZoQko1RnB2Nk0w?=
 =?utf-8?B?b3BiSkE4Lzc3eEprUWZrbnl2bUpMOWZvUXpreldUc0NCRFV4WFhsNHY4S1Nj?=
 =?utf-8?B?VzdNMTRpWTducEhGdllNeFNQNlV0NVpMTnNhcUxkSGNEYWZRSUdOTXptdWhu?=
 =?utf-8?B?TDR4bDlkTmpvTU1JNGpEZzVQMWJ0MHdVYmlHcHF4M3FuUXBvNkFkMVdJTFVP?=
 =?utf-8?B?S1E2OXdaRGllTTUyaTY3MzI2aisxY0IzTmkrVTdESmVnZUhESkQ0MmtXNytK?=
 =?utf-8?B?RG5jRm1QdExSWklmSHc4RjBGS0FJTmR0TUtzbEJvV0U2VFhkVjlkVnRGUnlp?=
 =?utf-8?B?Nnl2Ly9jOWZiQjdycTdaZjdDbVpFVlJYU21wVzQ3ZHRzdS9hTWRRSUlZaHdD?=
 =?utf-8?B?VEd4VmlVaVFpc3pCNnRhZkZTeWgrUXhLeFhpY0duL0NoNSsrMEJpSm9UcDAr?=
 =?utf-8?B?RE85RG5KLy8zQkNCM01vaGo2anEzTG9vbDNLUjhmc1MraThBazI1am1SeE0x?=
 =?utf-8?B?SnoxVURwTXBocURPU00wa3Nla0VwWWRCTHlzY0FoQkpXTm9HeFQyWk9kZXB3?=
 =?utf-8?B?Mi9HcldiY2EzdnNWQmRLNUx0Y1VnSktNWm1oRmM2dGtBb3NUVUU5aTRjdzU1?=
 =?utf-8?B?QlNtYlFIaS9tQlhRK3VkM3R2c1pVWGk4bUpJbVZKaWNFdDI0ZXNZNWZ4dVQr?=
 =?utf-8?B?anA4ZG1idmMxSWl0ZXdvUT09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E4CDAFA8C021C41BBC4435D1443E766@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4814
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3de1776a-6583-4507-1009-08d8f0581169
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RBNPnFhKmSImGatawZsEuWtodMAEYb5riEJC87h5HEepnyZZGfI4yYCxtiTSoQWEfToXCAey3tjetA6S0tqYqwi/1o3IsuoB4M/b3yYrfPZnekF92PWK6j2x6wO5IvipZ0WorxCgaVD+HNLcmNPcVIVe6bv8fnycAuGQcVUKQXxdKM6iWqomEBkTRwKw6HP4xILVip0DckNGzq161qlVFCUal2xA+NLHEM9oIgS9jvHe9hrpmUJMqp3h+J3dKzypR3scyGCr4Er3qm3qEY1rB10RN6TpnUeEixMj//F9eQSM2Xays/Po9/BP+BM0HkXHYkyMLtX7w34a8PhnBz+xsRO0wfHt/yg8UPbS5YSdeF4PexTNGyly/c/gX6IdJSx85wZ41mu3XWGWtLtVwnrUEoBzIcIHrxvc2o7izVzY2N53Zhe9p4iRqtOWEyBOJf/NIdXX2/TufydxOG1XXTqMspOKun9eVn3T3dm/HSgr+uF4lESBC4LFP5EjWK2918QP0q993RUqYG93+JvaWheEyCBqvkstSOg03KZNie+JNk0VnxX8J7+YpZOrqpf+GgdYT5OVg4/3gT+sglVZlZabj3lMKuQ0p4Ef7G0rAgJffuEwyDrKSyaAZgHaeRZ82GmWwGvsbT4Ti1BsCzTWA8lTjbOh39poh1LixKE46X3DJE4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(346002)(396003)(36840700001)(46966006)(86362001)(36860700001)(81166007)(83380400001)(356005)(6486002)(186003)(54906003)(47076005)(8676002)(26005)(316002)(36756003)(8936002)(2906002)(82740400003)(6506007)(53546011)(82310400003)(5660300002)(33656002)(70206006)(70586007)(6512007)(4326008)(6862004)(2616005)(336012)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 13:07:29.9635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4330770-40ea-4bb0-d539-08d8f0581c8c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6851

SGksDQoNCj4gT24gMjYgTWFyIDIwMjEsIGF0IDExOjU2LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMjYvMDMvMjAyMSAxMToxMywgQmVydHJh
bmQgTWFycXVpcyB3cm90ZToNCj4+IEhpIEp1bGllbiwNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiAN
Cj4+PiBPbiAyMCBNYXIgMjAyMSwgYXQgMTM6MTMsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+IHdyb3RlOg0KPj4+IA0KPj4+ICgrIFNlY3VyaXR5KQ0KPj4+IA0KPj4+IA0KPj4+IE9uIDE3
LzAzLzIwMjEgMTQ6NTYsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4+IEhpIEp1bGllbiwN
Cj4+PiANCj4+PiBIaSBCZXJ0cmFuZCwNCj4+PiANCj4+Pj4+IE9uIDEzIE1hciAyMDIxLCBhdCAx
NjowNiwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4+PiANCj4+Pj4+
IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+Pj4+PiANCj4+Pj4+IFNv
bWUgQ1BVcyBjYW4gc3BlY3VsYXRlIHBhc3QgYSBSRVQgaW5zdHJ1Y3Rpb24gYW5kIHBvdGVudGlh
bGx5IHBlcmZvcm0NCj4+Pj4+IHNwZWN1bGF0aXZlIGFjY2Vzc2VzIHRvIG1lbW9yeSBiZWZvcmUg
cHJvY2Vzc2luZyB0aGUgcmV0dXJuLg0KPj4+Pj4gDQo+Pj4+PiBUaGVyZSBpcyBubyBrbm93biBn
YWRnZXQgYXZhaWxhYmxlIGFmdGVyIHRoZSBSRVQgaW5zdHJ1Y3Rpb24gdG9kYXkuDQo+Pj4+PiBI
b3dldmVyIHNvbWUgb2YgdGhlIHJlZ2lzdGVycyAoc3VjaCBhcyBpbiBjaGVja19wZW5kaW5nX2d1
ZXN0X3NlcnJvcigpKQ0KPj4+Pj4gbWF5IGNvbnRhaW4gYSB2YWx1ZSBwcm92aWRlZCBieSB0aGUg
Z3Vlc3QuDQo+Pj4+PiANCj4+Pj4+IEluIG9yZGVyIHRvIGhhcmRlbiB0aGUgY29kZSwgaXQgd291
bGQgYmUgYmV0dGVyIHRvIGFkZCBhIHNwZWN1bGF0aW9uDQo+Pj4+PiBiYXJyaWVyIGFmdGVyIGVh
Y2ggUkVUIGluc3RydWN0aW9uLiBUaGUgcGVyZm9ybWFuY2UgaW1wYWN0IGlzIG1lYW50IHRvDQo+
Pj4+PiBiZSBuZWdsaWdlYWJsZSBhcyB0aGUgc3BlY3VsYXRpb24gYmFycmllciBpcyBub3QgbWVh
bnQgdG8gYmUNCj4+Pj4+IGFyY2hpdGVjdHVyYWxseSBleGVjdXRlZC4NCj4+Pj4+IA0KPj4+Pj4g
UmF0aGVyIHRoYW4gbWFudWFsbHkgaW5zZXJ0aW5nIGEgc3BlY3VsYXRpb24gYmFycmllciwgdXNl
IGEgbWFjcm8NCj4+Pj4+IHdoaWNoIG92ZXJyaWRlcyB0aGUgbW5lbW9uaWMgUkVUIGFuZCByZXBs
YWNlIHdpdGggUkVUICsgU0IuIFdlIG5lZWQgdG8NCj4+Pj4+IHVzZSB0aGUgb3Bjb2RlIGZvciBS
RVQgdG8gcHJldmVudCBhbnkgbWFjcm8gcmVjdXJzaW9uLg0KPj4+Pj4gDQo+Pj4+PiBUaGlzIHBh
dGNoIGlzIG9ubHkgY292ZXJpbmcgdGhlIGFzc2VtYmx5IGNvZGUuIEMgY29kZSB3b3VsZCBuZWVk
IHRvIGJlDQo+Pj4+PiBjb3ZlcmVkIHNlcGFyYXRlbHkgdXNpbmcgdGhlIGNvbXBpbGVyIHN1cHBv
cnQuDQo+Pj4+PiANCj4+Pj4+IFRoaXMgaXMgcGFydCBvZiB0aGUgd29yayB0byBtaXRpZ2F0ZSBz
dHJhaWdodC1saW5lIHNwZWN1bGF0aW9uLg0KPj4+Pj4gDQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBK
dWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KPj4+PiBUaGUgbWFjcm8gc29sdXRpb24g
aXMgZGVmaW5pdGVseSBhIGdyZWF0IGltcHJvdmVtZW50IGNvbXBhcmVkIHRvIHYxIGFuZCBJIGNv
dWxkDQo+Pj4+IGNvbmZpcm0gdGhlIHByZXNlbmNlIG9mIHRoZSBzYiBpbiB0aGUgZ2VuZXJhdGVk
IGNvZGUuDQo+Pj4gDQo+Pj4gVGhhbmtzIGZvciB0ZXN0aW5nISBJdCBpcyBpbmRlZWQgYSBsb3Qg
bmljZXIgYW5kIGxlc3MgZXJyb3ItcHJvbmUuIFdlIGNhbiB0aGFuc2sgSmFuIGZvciB0aGUgaWRl
YSBhcyBoZSBvcmlnaW5hbGx5IGludHJvZHVjZWQgaXQgb24geDg2IDopLg0KPj4+IA0KPj4+PiBJ
IGFsc28gdGhpbmsgdGhhdCB0aGUgbWl0aWdhdGlvbiBvbiBhcm0zMi92NyB3b3VsZCBiZSBtZXNz
eSB0byBkby4NCj4+PiANCj4+PiBJdCBpcyBtZXNzeSBidXQgbm90IGltcG9zc2libGUgOikuIFNv
bWUgb2YgdGhlIGFzc2VtYmx5IGZ1bmN0aW9uIGNvdWxkIGJlIHJld3JpdHRlbiBpbiBDIHRvIHRh
a2UgYWR2YW50YWdlIG9mIHRoZSBjb21waWxlciBtaXRpZ2F0aW9ucy4NCj4+PiANCj4+PiBJIHdl
bnQgdGhyb3VnaCB0aGUgcGFwZXIgYWdhaW4gdG9kYXkuIFN0cmFpZ2h0LWxpbmUgbWl0aWdhdGlv
biBvbmx5IHJlZmVycyB0byB1bmNvbmRpdGlvbmFsIGNvbnRyb2wgZmxvdyBjaGFuZ2UgKGUuZy4g
UkVUKSBvbiBBQXJjaDY0IEFybXY4Lg0KPj4+IA0KPj4+IEEgcmVjZW50IHN1Ym1pc3Npb24gdG8g
TExWTSBzZWVtcyB0byBzdWdnZXN0IHRoYXQgQXJtdjcgYW5kIEFBcmNoMzIgQXJtdjggaXMgYWxz
byBhZmZlY3RlZCBbMl0uDQo+PiBUaGFua3MgZm9yIHRoZSBwb2ludGVyIDotKQ0KPj4+IA0KPj4+
IFNvIEkgdGhpbmsgd2Ugb25seSBuZWVkIHRvIGNhcmUgb2YgdW5jb25kaXRpb25hbCByZXR1cm4g
aW5zdHJ1Y3Rpb24gKGUuZy4gbW92IHBjLCBscikuDQo+Pj4gDQo+Pj4gRm9yIGNvbmRpdGlvbmFs
IHJldHVybiBpbnN0cnVjdGlvbnMsIHRoZXkgd291bGQgYmUgdHJlYXRlZCBhcyBzcGVjdHJlIHYy
IHdoaWNoIHdlIGFscmVhZHkgbWl0aWdhdGUuDQo+PiBUaGF0IHdvdWxkIGJlIGEgZ29vZCBpZGVh
IGJ1dCB0aGF0IHdvdWxkIG1lYW4gbG90cyBvZiBpbnZhc2l2ZSBjaGFuZ2VzIG9uIGFybXY3IGFu
ZA0KPiBJdCBpcyBub3QgcXVpdGUgY2xlYXIgd2hpY2ggY2hhbmdlIHlvdSB0aGluayBpcyBpbnZh
c2l2ZS4uLiBUaGUgY2hhbmdlIGZvciBhZGRpbmcgYSBiYXJyaWVyIGFmdGVyIGFsbCB1bmNvbmRp
dGlvbmFsIHJldHVybiBpbnN0cnVjdGlvbiBpcyBwcmV0dHkgc3RyYWlnaHQtZm9yd2FyZC4NCj4g
DQo+IFJlZ2FyZGluZyBjb25kaXRpb25hbCByZXR1cm4gaW5zdHJ1Y3Rpb25zLCB0aGVuIGlzIG5v
dGhpbmcgdG8gZG8gZm9yIHN0cmFpZ2h0LWxpbmUgc3BlY3VsYXRpb24uDQo+IA0KPj4gdGhpcyBp
cyBub3QgdGhlIG1vc3RseSB0ZXN0ZWQgYXJjaGl0ZWN0dXJlIHdpdGggWGVuLg0KPiBUbyBtZSB0
aGlzIGxvb2tzIHZlcnkgc3ViamVjdGl2ZSwgaG93IGRvIHlvdSBkZWZpbmUgIm1vc3RseSB0ZXN0
ZWQiPw0KPiANCj4gRnJvbSBYZW4gUHJvamVjdCBwZXJzcGVjdGl2ZSwgd2UgcnVuIHRoZSBzYW1l
IHRlc3Qgc3VpdGUgb24gYXJtNjQgYW5kIGFybTMyIG11bHRpcGxlIHRpbWUgZGFpbHkuIEkgY291
bGRuJ3Qgc2F5IHRoZSBzYW1lIGZvciBzb21lIG9mIHRoZSBBcm0gZHJpdmVycyBpbiB0aGUgdHJl
ZS4NCg0KQWxsIHRvZ2V0aGVyIGkganVzdCB3YW50IHRvIHNheSB0aGF0IEkgaGF2ZSBubyB0ZXN0
aW5nIGNhcGFjaXRpZXMgZm9yIGFybTMyIChpbiBoYXJkd2FyZSBhbmQgcGVyc29ucykgYW5kIHRo
ZSDigJx1c2VyIGJhc2XigJ0gZm9yIGl0IG1pZ2h0IG5vdCBiZSBodWdlIChidXQgSSBtaWdodCBi
ZSB3cm9uZyBoZXJlKS4NCg0KSWYgeW91IHRoaW5rIHRoYXQgdGhlcmUgaXMgZW5vdWdoIHRlc3Rp
bmcgZm9yIGl0IGF2YWlsYWJsZSBvciBvdGhlciBtaWdodCBiZSBhYmxlIHRvIHRlc3QgaXQgdGhl
biBubyBwcm9ibGVtIGZvciBtZSwgSSB3aWxsIGhlbHAgb24gdGhlIHJldmlldyBzaWRlLg0KDQpD
aGVlcnMNCkJlcnRyYW5kDQoNCj4gDQo+PiBBbnl3YXkgSSBhbSBoYXBweSB0byBoZWxwIHJldmll
d2luZyB0aGlzIGlmIGl0IGlzIGRvbmUuDQo+Pj4gDQo+Pj4+IFNoYWxsIHdlIG1hcmsgdjcvYWFy
Y2gzMiBhcyBub3Qgc2VjdXJpdHkgc3VwcG9ydGVkID8NCj4+PiBUaGlzIHdvdWxkIGhhdmUgY29u
c2VxdWVuY2UgYmV5b25kIGp1c3Qgc3BlY3VsYXRpb24uIFRoZXJlIG1pZ2h0IGJlIHByb2Nlc3Nv
ciBvdXQgd2hpY2ggYXJlIG5vdCBhZmZlY3RlZCBieSBzdHJhaWdodC1saW5lIHNwZWN1bGF0aW9u
IGFuZCB3ZSB3b3VsZCBub3QgaXNzdWUgYW55IHNlY3VyaXR5IHVwZGF0ZSBmb3IgdGhlbS4gU28g
SSBhbSBub3QgaW4gZmF2b3Igd2l0aCB0aGlzIGFwcHJvYWNoLg0KPj4+IA0KPj4+IFdoYXQgd2Ug
Y291bGQgY29uc2lkZXIgaXMgbWVudGlvbmluZyBpbiBTVVBQT1JULk1EIHRoYXQgc3BlY3VsYXRp
b24gYXR0YWNrIHVzaW5nIFN0cmFpZ2h0LUxpbmUgc3BlY3VsYXRpb24gYXJlIG5vdCBzZWN1cml0
eSBzdXBwb3J0IG9uIEFybSAodGhlIDY0LWJpdCBpcyBub3QgZnVsbHkgbWl0aWdhdGVkKS4NCj4+
IFdlaXJkIHRvIHNheSDigJxub3Qgc2VjdXJpdHkgc3VwcG9ydGVk4oCdIG1heWJlIHNheWluZyBu
b3QgbWl0aWdhdGVkIGJ5IFhlbiB3b3VsZCBiZSBtb3JlIGNsZWFyLg0KPiANCj4gSSBhbSBvcGVu
IGZvciB0aGUgd29yZGluZyA6KS4NCj4gDQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4g
R3JhbGwNCj4gDQoNCg==

