Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB8433F640
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 18:06:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98759.187539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMZbi-0002B4-0M; Wed, 17 Mar 2021 17:05:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98759.187539; Wed, 17 Mar 2021 17:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMZbh-0002Af-Ss; Wed, 17 Mar 2021 17:05:17 +0000
Received: by outflank-mailman (input) for mailman id 98759;
 Wed, 17 Mar 2021 17:05:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PKfO=IP=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lMZbg-0002Aa-Tu
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 17:05:17 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.79]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d31074d9-9e0b-4819-8dfa-9dcceee74ed0;
 Wed, 17 Mar 2021 17:05:15 +0000 (UTC)
Received: from AM4PR0202CA0013.eurprd02.prod.outlook.com
 (2603:10a6:200:89::23) by PAXPR08MB6944.eurprd08.prod.outlook.com
 (2603:10a6:102:135::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 17:05:12 +0000
Received: from AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:200:89:cafe::3d) by AM4PR0202CA0013.outlook.office365.com
 (2603:10a6:200:89::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Wed, 17 Mar 2021 17:05:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT044.mail.protection.outlook.com (10.152.17.56) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 17:05:12 +0000
Received: ("Tessian outbound 26664f7d619a:v87");
 Wed, 17 Mar 2021 17:05:12 +0000
Received: from 83af946044a4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B4C0D0EA-5E5C-46B2-89B3-F533C0067DF8.1; 
 Wed, 17 Mar 2021 17:05:06 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 83af946044a4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 17 Mar 2021 17:05:06 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR08MB4557.eurprd08.prod.outlook.com (2603:10a6:803:f5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Wed, 17 Mar
 2021 17:05:04 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::1c0d:d340:1408:f642]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::1c0d:d340:1408:f642%4]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 17:05:04 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LO4P123CA0101.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:191::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32 via Frontend Transport; Wed, 17 Mar 2021 17:05:03 +0000
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
X-Inumbo-ID: d31074d9-9e0b-4819-8dfa-9dcceee74ed0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjoirN9hJ9lCOrBH9wWVcqrLpaZmOEcCPlOyfu+EaLM=;
 b=yV8ssXXFH400J8Hw5KLsEYWLLsJ4CueSKldweeTFizqnG38s13FKOYWPwSLbQ0tm57dpGi4JJTaJv15LneiE9ZfqbEGjxShKLZi8JkevKVWq8+rqfv9CUhDHrm9odeHe1Ufx/0zpxs7cfoGfih8eFYfbxj77S4J2F7lmDenS+VM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 46f6b5e081251376
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VRUJjgLgj8kxG5NOYqBxYhQnr1dULhf5gOFTNzN9Ylm+hYzQhk0UEMm3HS5XhQLSpnnWSEkIsBGioOW9ggKvi2E3MXzVHVU7Aumrm24CjjAf7Xb81DMdR4IdpLSDHTuvk8YF5lYTFoIJVju48jpg9q+/PM9sph5qHZziGy3os/VCCjWhw0ZnAxy1G6JPAAPEQGRR86Ou4zdBucEMjxTmyonQT2irCG+1txptYSa3Sh5BHkBJP9dG6gJ6KLdAqPXEYngI7ATitEWRgM1kEP5+d12Y969zrM7cXnQbvKXjSbrZmCNYfr31y6H/14NMC6aU2CnOg7dyUOIRi5cNwXWEEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjoirN9hJ9lCOrBH9wWVcqrLpaZmOEcCPlOyfu+EaLM=;
 b=WxQpho7J4vqgv5TVBaYHEukDLZxsnsRte4E9m4+3oHagrKg07UhhgAvB0JhWVDQ34AJyyxWA+4xuviwjaY3PnNKmO7BzpnkoTTzrmBKsdtOaUEzX7IleIuKOTkcJx5X18oWBp7txNpyAprUEE8ncW2EMfGuEME/2npCLLioPbjAgZuUtFhguvIqGTXOas3dP5kF2E/+qR69Buvx11JwRMwRGJjNF+JetLdJj+nN2/cQHIxXdaFV76m7XBfxGzAwgqrIH2Vh5B4A1iyDDSbtVEhnORLntxiIvBETz/REfp7qGL5xvo/BOTZeqtIUwj98GeapL1fPHF9gmD3E0WnLm1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjoirN9hJ9lCOrBH9wWVcqrLpaZmOEcCPlOyfu+EaLM=;
 b=yV8ssXXFH400J8Hw5KLsEYWLLsJ4CueSKldweeTFizqnG38s13FKOYWPwSLbQ0tm57dpGi4JJTaJv15LneiE9ZfqbEGjxShKLZi8JkevKVWq8+rqfv9CUhDHrm9odeHe1Ufx/0zpxs7cfoGfih8eFYfbxj77S4J2F7lmDenS+VM=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH] xen/arm: Prevent Dom0 to be loaded when using dom0less
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <7ed12d12-6fed-cc3a-4a0b-76ad732d4337@xen.org>
Date: Wed, 17 Mar 2021 17:04:57 +0000
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <C468C8BE-67D0-440D-B8CC-253337A52889@arm.com>
References: <20210308115610.48203-1-luca.fancellu@arm.com>
 <1921ff88-7637-6454-74a7-1cbab8dafc61@xen.org>
 <72E0C95C-D5E1-471B-9590-F4D42E3E066B@arm.com>
 <7ed12d12-6fed-cc3a-4a0b-76ad732d4337@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0101.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::16) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ebfcb938-9dbb-484f-5e75-08d8e966d410
X-MS-TrafficTypeDiagnostic: VI1PR08MB4557:|PAXPR08MB6944:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB694484D119E5750A926574C1E46A9@PAXPR08MB6944.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 iAn46fQD6v7EsKq00yMnagcQOQPOC7GPTEvyk8Oz8DSceY+Crm5ow+2KFyI1pCCyKlUaLk5COOmP+HlvszbAJtSjItcvb3DyvD07Uj6B6A3UJ0U9bOBDfcFlPes6sfMxXc95UcTfLJBqGEhD6ny6rNWPbxBn8WoPMIrZDFcEjSG7rptZnvXAfqHQqUB/MV1zmxJiv/YzB5FBvc/Xr2ToL6zxvLihg8blHmUvJ84NKOGoe7ZAM1FEJwi6wa+lBa8uW7Po8b58KChojvTKOn2z59sKW1qbzO0f0QNG6oGl1Trycr+kW3I/MYDuHFIDRyPfwBFqkJkPnSXocbdphVuGpg60gdGJ8lrwUjM3qaUCLtaW2SrY3Urd+PVkmjWqMiw5cMXyydtuWurozKsNOeHnZRw+bgU0HsbXW6zWbbywA48iMyCJkkckF5RiU3ALXxv/YJtHQQCI5y4QYDWg35cl9jpwnyEmHCvx/guLKh78an/sSWThEryRsqm5z/xfcn5oiZIcIgaFq9mVYWryW89xQFse511Zlh9Xx2oFgeIN0wzHoIiwnKy8DvCIFd8U189nBegsPywCkDk6+8bckjNgGrK7XtsW3qDC9ohChZM3xz0H6uc4clpAhGRzigz7x6IIKdDLGU1j/rv4crPwx+qr+g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(136003)(39860400002)(376002)(54906003)(316002)(8936002)(44832011)(5660300002)(83380400001)(6666004)(2906002)(86362001)(26005)(4326008)(66556008)(478600001)(6916009)(66946007)(33656002)(8676002)(66476007)(956004)(2616005)(186003)(7696005)(16526019)(53546011)(6486002)(36756003)(52116002)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?U3JrczE4b0MybS9VK2c1TzdkdmRhL3JmSWgzMEtoME1sVVY4aG5ETFFTZ2ho?=
 =?utf-8?B?eEU4VlJLSWxGTVJtWmxYWUY4RUQwRk8xRnRhaE5aZE5CSks3UWpCQUhoZzZy?=
 =?utf-8?B?aktYazlCUmM1WHhpcHVDMytKN0luOWEvMXlKZjZQQmtxenNodkpLdzFzRUFE?=
 =?utf-8?B?REdOMG5BTW0xQTdaQjhCd3U4ZlFnaUczQnNPbmx0aG5hUVhlQ2FaRnVLek4r?=
 =?utf-8?B?ajdZNXd2ZVZXbTVXM2NtWW9tUHZlWGpOaTdsejBmcnR6b0I3S29hSFBQTGNm?=
 =?utf-8?B?M092L1lsampBSW1iK2J3dFdBZXV3bVVlK3dBV1BLMm12Z0Q5dWMvQ0cxcEJD?=
 =?utf-8?B?OFZtTk5tY1RMeXZ5bzk4NUpsZ09WR3dtWHA4WUhOQ3RpNE82QXhDMkhlbDVn?=
 =?utf-8?B?aENiWnRhNnh2bGhsV2Q1NURqRWFvcWhUM25Nam9rTUQ3OEhRaEk1cHV1T0Ro?=
 =?utf-8?B?Mko2emtRV0ttNUd0bzNRZDZXZ3Z5aXlYaTZRTUZ5QS9nS2F2OUdhRE44R1dy?=
 =?utf-8?B?d3pjditaK0RKMmU5L0N4N3l0Q2g1S0JtN0s0UUNyWTR1T01CaUZmSm96Zjky?=
 =?utf-8?B?Ky9KbFBCcGh1amxnUW5XeDhodnBaMjNpVGpCWmpNc1lPU2VwWDhLUDFjNDJ6?=
 =?utf-8?B?S0svN1c3RVJtN1NIRWUvU3RoamZoTHBmb24vdWlTNENCS2FwWGJQNVRGZjho?=
 =?utf-8?B?R3F5bHFXTElnUnpPbGhlczlhMmJrQUE0QjJqTWIrTUlKTUk4bUQvMHU3YzhC?=
 =?utf-8?B?T0x1RXVIRzRMSU5JOEJUTlcyMzdQNUh0NTBYQ0lRcUx5VjdsQm1tNzVGcElD?=
 =?utf-8?B?VXpzSUZud2ljZnBLdFB4OUlKaUcxS0RVOGdZMnFHdXBoTktCTW8vSTBqaTVz?=
 =?utf-8?B?ZUZncStOMExSdGM5dk1QaDFuNTlyNTRsMitoaUs0RmJTOCtpTDFzNzliYjJu?=
 =?utf-8?B?RHM2SUxicStTVWpvVVNwekdjNXNKUCtFNVdaNjhGeFo0bWsyOE93WjVXU2hG?=
 =?utf-8?B?SFVtOGZENWR0ZUVjN3QzTHFKcjdKczN6RlM5cUpjWDMzOGNXMGpraG5OVUNN?=
 =?utf-8?B?dlplNExlV0pjWmlENitEYWhZZ3Q0YjNDNUROdWMxbXd1b3JkdmFCSkZhalg2?=
 =?utf-8?B?K2c0ZVdWMFlaYVIyTWxRSjhHU2hqL2JFUnVkeUVuYk9qS3AxcUpRYzNsQW10?=
 =?utf-8?B?ZXFNbE43K2F0L1gyNno1K0xsUi83bzlsMFpTcEEraWFVcEo4R1dBbzEvWll1?=
 =?utf-8?B?NCtLWk5JSHUvQzNTZiswR0RmLzdPcVMzSERndmVzdTNtWXJEeUtpK3ZJRGlh?=
 =?utf-8?B?UDRJUWgzOVozNXczc2hMbW5XWEhsUkRVb3M2SlhVNkN5NnBuQUEzZC80c0wz?=
 =?utf-8?B?NTNrUElaNDc2Wk1ubVBJZC92NXgvQnBZaVE5emxYL2cvSlA2QkhxRHZhblc2?=
 =?utf-8?B?Y0VYbTZGSktMUDErdFFqQ0dJOUhzSGx0YjBsYkdqZE5SMXEvODQyVkU5dUZD?=
 =?utf-8?B?dG1Bc1V3RnBzalM5ZWkxMFFsbi9SK2RUYmJGYnpUUkQyOFRSY3FNSEIrNVhP?=
 =?utf-8?B?alA3bGVuUmlHSGhsWWUwUFk2aHRoOUU0MXhUMUszQjlHSmd1NXBDeFZpeTFN?=
 =?utf-8?B?ZytwQ3kvbm9rUjJLNG9qeDFkbnJuSERFWXY5ckI3eHgxOUZCK2wzVE9teFJ6?=
 =?utf-8?B?WDNaOGFuZ0RyYjQ4TElTcU9QSHhvUTc5R3Bib3JDYkRQTloreGlBWHZCNk5M?=
 =?utf-8?Q?QPToHmNGKlmQ5RiVh3rKE2w7rxZkAB2uSB7VmWp?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4557
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	14651aaa-9337-4754-8ffe-08d8e966cebc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cRD/o+yX0+41Htu1EyhPl9PCq+bb8/ubsXqdlDMGuc2J1Jyn6cWaLGJ2RWglpgRNZFJIa9n3mYSivTgLsZ9/Vz0PK+kLGnfpLEJRIrns0LLU+Vx78K68UY+nVmhW9j/uA7OCklUbWRspZEIgsN3ByaPBJuFnDJjzR7t/kCEAEZrE14lokOysHiHhLk3pdhttCQdjNw6asPIbNy7MuknKeLuuWVrlYIH7bJwGCh6T18wE7bGJfM9/2dlpiNR3poY1dS4+j1MAMemgeuDxB3j1DIEt04Cca+oyVPowbcTXz4zoo89/+O+ubgNk8125U12/k6EuTTKMZId4JzpXxK38TcSujstp9DIRFPpYkAgUH9voBQvYJU3U8DyVdW62j90gUGZkUqFQJ7XsjztinJ8KpUqIJjQzy1BhvpP3bij9HzJQ4tmZGqx+4P2Diup9naMsOZ7o7hxuKxQrjcuTD4WY2P0Ki/BMlSDlqlOzWPTXmwCeJCvGJUvN9lvTzs6yOosUIe0hhLpcwCbhnY7+WZT5HssN2KTqmPRlJW9WqfjjnAnjHvR09L9COHcapESTNbiohJHZiEC0cl1To9DEee44BO+av8+cv/HUuMmvdkuA/EZW0DqBAvPErQh+I6dXZtKmQLxf93BhTPp52j0mjQkFoAQ6/U4mWmoG88ss/1bo/X9udNSAiDd9J6Ejuh1R4rLq
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39830400003)(376002)(346002)(396003)(136003)(36840700001)(46966006)(356005)(54906003)(6862004)(70586007)(44832011)(16526019)(478600001)(4326008)(83380400001)(36756003)(81166007)(2906002)(33656002)(316002)(8676002)(956004)(336012)(26005)(70206006)(53546011)(86362001)(82310400003)(6666004)(47076005)(36860700001)(6486002)(7696005)(5660300002)(2616005)(186003)(8936002)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 17:05:12.6104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebfcb938-9dbb-484f-5e75-08d8e966d410
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6944

Hi,

I=E2=80=99ve checked the common code and the arm part, I can confirm that t=
he domid 0 is never allocated even if the domain 0 is not present, here the=
 only places where domain_create(=E2=80=A6) is called using a variable valu=
e:

1) xen/arch/arm/domain_build.c
d =3D domain_create(++max_init_domid, &d_cfg, false);
Where max_init_domid has value 0 and it is defined in setup.c

2) xen/common/domctl.c
d =3D domain_create(dom, &op->u.createdomain, false);
For me seems that the dom variable won=E2=80=99t take the 0 value, if someo=
ne could give another feedback it would be great.

On every other part where domain_create(=E2=80=A6) is used, it is called wi=
th a constant value different from 0.

For the hardware_domain being NULL and not handled in some situation, it se=
ems that it=E2=80=99s not directly related to this patch, but I can handle =
it on a next serie, from a quick look it seems that many cases can be handl=
ed by checking if the domain is NULL in is_hardware_domain(=E2=80=A6).

So, if the community agree, I can push a v2 patch with all the discussed th=
ings (moving dom0 creation code)

Cheers,

Luca

> On 12 Mar 2021, at 11:31, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20
> On 12/03/2021 09:38, Luca Fancellu wrote:
>>>> +
>>>>  size_t __read_mostly dcache_line_bytes;
>>>>    /* C entry point for boot CPU */
>>>> @@ -804,7 +833,7 @@ void __init start_xen(unsigned long boot_phys_offs=
et,
>>>>      int cpus, i;
>>>>      const char *cmdline;
>>>>      struct bootmodule *xen_bootmodule;
>>>> -    struct domain *dom0;
>>>> +    struct domain *dom0 =3D NULL;
>>>>      struct xen_domctl_createdomain dom0_cfg =3D {
>>>>          .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>>>>          .max_evtchn_port =3D -1,
>>>> @@ -964,28 +993,33 @@ void __init start_xen(unsigned long boot_phys_of=
fset,
>>>>      apply_alternatives_all();
>>>>      enable_errata_workarounds();
>>>>  -    /* Create initial domain 0. */
>>>> -    /* The vGIC for DOM0 is exactly emulating the hardware GIC */
>>>> -    dom0_cfg.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
>>>> -    /*
>>>> -     * Xen vGIC supports a maximum of 992 interrupt lines.
>>>> -     * 32 are substracted to cover local IRQs.
>>>> -     */
>>>> -    dom0_cfg.arch.nr_spis =3D min(gic_number_lines(), (unsigned int) =
992) - 32;
>>>> -    if ( gic_number_lines() > 992 )
>>>> -        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\=
n");
>>>> -    dom0_cfg.arch.tee_type =3D tee_get_type();
>>>> -    dom0_cfg.max_vcpus =3D dom0_max_vcpus();
>>>> -
>>>> -    if ( iommu_enabled )
>>>> -        dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
>>>> -
>>>> -    dom0 =3D domain_create(0, &dom0_cfg, true);
>>>> -    if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) =3D=3D NULL) )
>>>> -        panic("Error creating domain 0\n");
>>>> -
>>>> -    if ( construct_dom0(dom0) !=3D 0)
>>>> -        panic("Could not set up DOM0 guest OS\n");
>>>> +    if ( !is_dom0less_mode() )
>>>> +    {
>>>> +        /* Create initial domain 0. */
>>>> +        /* The vGIC for DOM0 is exactly emulating the hardware GIC */
>>>> +        dom0_cfg.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
>>>> +        /*
>>>> +        * Xen vGIC supports a maximum of 992 interrupt lines.
>>>> +        * 32 are substracted to cover local IRQs.
>>>> +        */
>>>> +        dom0_cfg.arch.nr_spis =3D min(gic_number_lines(), (unsigned i=
nt) 992) - 32;
>>>> +        if ( gic_number_lines() > 992 )
>>>> +            printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceed=
ed.\n");
>>>> +        dom0_cfg.arch.tee_type =3D tee_get_type();
>>>> +        dom0_cfg.max_vcpus =3D dom0_max_vcpus();
>>>> +
>>>> +        if ( iommu_enabled )
>>>> +            dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
>>>> +
>>>> +        dom0 =3D domain_create(0, &dom0_cfg, true);
>>>> +        if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) =3D=3D NULL) )
>>>> +            panic("Error creating domain 0\n");
>>>> +
>>>> +        if ( construct_dom0(dom0) !=3D 0)
>>>> +            panic("Could not set up DOM0 guest OS\n");
>>>> +    }
>>>=20
>>> It always felt a bit strange the dom0 creation is partly happening in s=
etup.c when for domU everythink will happen in domain_build.c.
>>>=20
>>> Woule you be able to create a patch that will first move the code in a =
new function (maybe create_dom0())? The function would return NULL in case =
of an error or the domain.
>> Yes I will create a new patch with this change and I will put on top the=
 v2 dom0less patch
>=20
> I think it would be better to put it first. This will avoid some churn if=
 the code movmement comes second (you would first indent and then move the =
code).
>=20
> Cheers,
>=20
> --=20
> Julien Grall


