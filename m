Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 353D536D9FB
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 17:00:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119434.225910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lblfG-0007Sx-D4; Wed, 28 Apr 2021 14:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119434.225910; Wed, 28 Apr 2021 14:59:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lblfG-0007SY-9B; Wed, 28 Apr 2021 14:59:46 +0000
Received: by outflank-mailman (input) for mailman id 119434;
 Wed, 28 Apr 2021 14:59:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1tw=JZ=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lblfE-0007ST-HG
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 14:59:44 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.78]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d29d7d79-23d5-4d0b-9819-bc573370a0cf;
 Wed, 28 Apr 2021 14:59:41 +0000 (UTC)
Received: from AM6P193CA0102.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::43)
 by VI1PR08MB4528.eurprd08.prod.outlook.com (2603:10a6:803:fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 14:59:38 +0000
Received: from VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::4) by AM6P193CA0102.outlook.office365.com
 (2603:10a6:209:88::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25 via Frontend
 Transport; Wed, 28 Apr 2021 14:59:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT027.mail.protection.outlook.com (10.152.18.154) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Wed, 28 Apr 2021 14:59:37 +0000
Received: ("Tessian outbound 1e34f83e4964:v91");
 Wed, 28 Apr 2021 14:59:37 +0000
Received: from 0b2f47f2d573.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 195C26B2-E392-47DC-9426-B97AE2920802.1; 
 Wed, 28 Apr 2021 14:59:31 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0b2f47f2d573.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Apr 2021 14:59:31 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR08MB3550.eurprd08.prod.outlook.com (2603:10a6:803:84::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 14:59:29 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9%4]) with mapi id 15.20.4065.028; Wed, 28 Apr 2021
 14:59:29 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LO2P123CA0089.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:138::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 14:59:28 +0000
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
X-Inumbo-ID: d29d7d79-23d5-4d0b-9819-bc573370a0cf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3tgEjj362FzydY290hwrze0IlDLLZE0jiTB8K6Yi4O4=;
 b=jbd/DojTW9wZRbrBR1YQGkXxj2fjcmSQvUzkV5OENJsUdm7IV4H1okTVEGED/QC75hkDwX1gbBkyEDeTGK+0NWozgaKOcCe+/EmVuOCeiFYRgd2mX2fetgoZTtrwmOjYB5PMeHhEC5N+LZqyTSGqJAMcIIMTIL2scStkC94g0jY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2ec16a4a6ee14d41
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ix+stedP6hP5SUmUro2J4qnh3vrFhNPyzG+E9Ozr6GlglwR+HhsekFbf6JJF27DXfe2j3wYBIdEw1QnjylQ0gordfsXtdwZMX7j96mcUH6xraaq5LxnqR7KutMP5m7x06Spoj1PCH9smBHtZcUmOmYeLspTHnDFJfugVqO4zNHbGoewV+P/0fPNXuwfCJOFlFov6EVuGwGP0d4dYt4+/lMKGJTYff4UMOaRhjBeDgkIp+Cx5/T9rICCDSpy8qC+gfDuofSucZ8XtD9GCDGEfsiubcgIAZOvKYHqfHFU8UzyaFWK+Wc1VXUb1GJl3Yc3BxTRuTv36huMI5z6TgZVNWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3tgEjj362FzydY290hwrze0IlDLLZE0jiTB8K6Yi4O4=;
 b=K6cYaGUEUPuNkcqb4Iyo04Y9dWU/Cs4qgz+BN4aHQuiavNHoziW3mf7PbiKRnmoKmvNvt5GgBSznJXfP+se5OlRdi/FKf5w8XFiwAf3b8MBkzaEaN6IZ9PaIDMvY2skNWx3lnYbko+NIhHwIXjggtBDVt+VE4AV342wuhqKedR+8hYhTihPc8naFcN3HS8A+Q8RQlOrsswPMr+psa0x/jRpoHfvAvVE6w9hSFtXfsuP/zn3hKuBjZGJPU2aiFHgLDPzVUUIfF64JHaf5XLSIkyeBW6Uh1gvFuKiDbvw9xXY47bDkBQ+oAXnibPyITAp9E+H1r48lE+mpnJKofc2S1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3tgEjj362FzydY290hwrze0IlDLLZE0jiTB8K6Yi4O4=;
 b=jbd/DojTW9wZRbrBR1YQGkXxj2fjcmSQvUzkV5OENJsUdm7IV4H1okTVEGED/QC75hkDwX1gbBkyEDeTGK+0NWozgaKOcCe+/EmVuOCeiFYRgd2mX2fetgoZTtrwmOjYB5PMeHhEC5N+LZqyTSGqJAMcIIMTIL2scStkC94g0jY=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v3 3/3] docs/doxygen: doxygen documentation for
 grant_table.h
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <eae12602-0616-9363-c8c6-ef6bbd78673c@suse.com>
Date: Wed, 28 Apr 2021 15:59:21 +0100
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E47AFE69-CA75-468D-868D-182F78C6992C@arm.com>
References: <20210426153741.26904-1-luca.fancellu@arm.com>
 <20210426153741.26904-4-luca.fancellu@arm.com>
 <eae12602-0616-9363-c8c6-ef6bbd78673c@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO2P123CA0089.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::22) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc54c152-6dc7-468e-a977-08d90a563e5b
X-MS-TrafficTypeDiagnostic: VI1PR08MB3550:|VI1PR08MB4528:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB45289EEE72BA6BA0464560F3E4409@VI1PR08MB4528.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LeFWBDaIVkz9EbBK7F/8JBpMO+PWgFFAKL/R7wC6b6Wf7NgWOTuAtl4CEuL8NIc7REwtGifzfkp0cRWIYD7uTwt4zh69feKu4IlZ0PpHtleXQKWdSODWCfiWYvTe6kapFpioUnBs2ccHTEGwFIKxH6q2w8yMB0ws/ib5ujaYFgbnKVG+wMTyjECDaCyipe5/ZYpXbcfHr4GgzuSC2Q1FZRVLMBOjoy7w0vpN1ENbryb1QUYrrtXGO5DBopnQb5cAIpnRe43dbkhdyMMT0IYWJvwvuSgog3MdzfkPHkNcLIq0HclM6ckixFg0PyejNhQoZCk44LG12187/Azm2dpptqNdhTmdVb/4DDSXSHC2tQ1CRJT4keAY8g3BqEhb3+QgDrip7n1Vec+BzvGyrD6dpritZEvM9lx1p+y0e9ycCwr1yJ1obqZINQVQADcfHg5jksNPE5TvnB4onXrWaPNhjZLUzbYn7R1+GzhUZtmste1SIn389e4KUYfuccjWZk2qFcZ7bkQrdiLpS2REWYI8fESswrbpFOWZTtMi4IDCaDzQJTKtAgWT9pnC/4hkGWKaIUt6T9Ed/cYc80EMQhxQEsszkKYCEiDk33XIZgyN7ZYvfZKFwVPlB8P0/4aSBofVfuYj5XfE3DM/7lFO3i10LkeqeXBuyV8dP/L11JYCbdCaJy8wuUBZZQSwBY72Md1BJIlKi9kFcPNnZprCBaEqwJtJ3ouK+Pyaf+ZpLvwGauM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(376002)(346002)(396003)(136003)(366004)(86362001)(66946007)(5660300002)(83380400001)(966005)(38100700002)(36756003)(6666004)(44832011)(4326008)(478600001)(7696005)(33656002)(38350700002)(53546011)(66556008)(6486002)(26005)(2906002)(66476007)(8676002)(2616005)(16526019)(316002)(52116002)(8936002)(54906003)(186003)(6916009)(956004)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?SDVvcndCTVpoWGZmOTJCUHRwSGRtU0w2SzVuUGFKTUEyWHlReFd3V1lQTUl5?=
 =?utf-8?B?NVFqZUxqcm0vTWJFcDBrckFWckxBcHhHTk5PV2lPUm5FRmpyeldQak5tQk0x?=
 =?utf-8?B?Q0RBcnd6T3piWWZqNzdidzVwTkk2TVQ1djZJOTZGZzdmVkc5MjdsaHpkZ1Vx?=
 =?utf-8?B?UFJHTzFwS3VsbkM2MEwxV2dscXBYZi8zeEFzWXZkZlhGVW9QNmIrcDZabGZr?=
 =?utf-8?B?VkR0bTM1NDFhTjJxdXBzMGNPT2srUWpYVVlIc052dmQ2YWFVMFNkVk9rbmpJ?=
 =?utf-8?B?cHF0Y0ZhUzFMZ0xwNGNFcjdNYnpQaFVaaG8xQkpMVzl5c25lM3ZvSVgrZUlX?=
 =?utf-8?B?VFdVeXRNdTBEcHFnR2FhRnFva1VTaHdFNCthS0dIVTBkbWd2dGxMTDBIeDJ6?=
 =?utf-8?B?SXhkbnhzbWxlemJpUWd3M1dMK1l3b3c0b2gyK3BlMC9abVRXbTFjd2RUZmpU?=
 =?utf-8?B?RUgzK1pxK1dLcmVKOGNmTmk0Qys0bGlla0YyNkVsQ0ZSLzB5RUVCeWVhQy90?=
 =?utf-8?B?UnJNLzd2TE5UdFduVWp4UzdQeUJ4UHlQQitVNjd3cDJycHFGSmgwczJieGxD?=
 =?utf-8?B?SVJqZ0RvL0VaTG9sUk5GT1dmN0NkRzRnRWxYcEV2ejFUakhFRENObkpOK09z?=
 =?utf-8?B?U0NXTGUycWRyQTNXbEhwbk1NS2NWVy8xQU1ETmVtVndMYWs1L0RHa3NQM0Ry?=
 =?utf-8?B?a3d6djhHV3haUE9zL25qZkNtZWtHVm9vcndydHE4elZmWjM5amNBK0RyUVoz?=
 =?utf-8?B?MnN6SklMU0lZWnNnZnVPeXdJbVo1VWJab1RxK0svclBlei9BUm8rZ0twYjRJ?=
 =?utf-8?B?ZkRIbDFPb0NGamx0UE5KdkNlWkhLNW5KeU4raGp1R3RvUjRVdWZkTit0Z1Ri?=
 =?utf-8?B?WVdBdHNkbDBJZU0wVEZneWhkWGs1VkF4NVljaHVNVFhtRVU3ZTdnRnZCd05P?=
 =?utf-8?B?VUZGdGJlcXB4aGZnTzBidUN5cWc4RTZBU1VaS2d1alp3QjJmb3hlbDNpZHV0?=
 =?utf-8?B?bjl4c3BxNzk4a1FOY1Nmc0ErV1FJdHA0NHhvcUNFVUoyWmRVSTZHSTIyeUVv?=
 =?utf-8?B?QUNPSWRGOXFOa09vQU0yNGJWaUcwWExIMXFYd0M5NGRsbTcyeGtuUU41cjFs?=
 =?utf-8?B?dm85bnQ3c1hFUG1qN3ZGNytFZjJMMzBJZ0dKUU1sczdXbXpCVDVFRXBQTXcr?=
 =?utf-8?B?L3RTRyswWHFDUXFIRnI4aHJuSTVGZE1TMXppbjF5c2VyYStQVldCZWtFYTBx?=
 =?utf-8?B?a211SzdlYkNtOVk3bWd4b0pHRUo5Y1NqL0pJQWZMOVliQUtSRVdXb1MvNTRP?=
 =?utf-8?B?UFF3NXBEKzNQMm9oLzdxRG5VR1NPemRqQkZPZWNHMnFJME9heVBndDRoT1BO?=
 =?utf-8?B?R0R4SGttMk5IVmFYY3dWMGpqRklsUlpCRUhPUENwWW1Ncm9RdjZIZVVTTlRE?=
 =?utf-8?B?cU5Nc1REeGFncnhlR1BSS0M0andhMEhlaGZOT3RtWlF4cDhsUEl4VDZSamYy?=
 =?utf-8?B?Ly9JbHdlUis4citjR0F3aW5FYXNEWkZsNHRyYnFuUExsYUlraXVTSzZNWWg4?=
 =?utf-8?B?a1ZVempDdm56TVRZTWlBU1cwQW1HWU16dFcxKzlSOVNYbkgybTlUdXZCbm9U?=
 =?utf-8?B?OVVsbWd4cTg4S2pUTGVmaTJDUktpbFJ0elBDOS9GWUhYNkNvczRJL3AxMnhp?=
 =?utf-8?B?Vng0aGowN0UrNlBHeVNIVWlHRXZxbHIvRm12Y0ZDRmljekhHYk5adGhJYTM0?=
 =?utf-8?Q?NGSfomHwWLzWE+DxaXc8oZO499atd6z2uy4aYGC?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3550
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	da23df62-6553-43c9-fcb3-08d90a563937
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Zxgx8joh9MrfIxLlH9oEtyfx3hkM28hFKPPNzvEL9jnAN3aSGl2fbLSOOe5v4qyzteEJCrPSt2MNeKzW+SPCxxxXAqLDuF/9pR70hhidQuNLK/7UwTdIgxvoKL7hxOZ2ZeDWZpYuiGb72ps0o/VU7M47GGDao8Wdt80c4rc6nzY5IzjjSBRSrFzA2IEoygnr4x3jAjgQ/FQ/3G1uTQCTy6s0Y/opOIXdkpx0oFIJFkFxerl7rHK1i38TV5CAT7asqx3igOOi6a20j1pkaHwdYysCwYoUXAj1EYbwUdsG0G1rZaOMZuERZLA9QLdQ/wuyhpT8grNVILAZ0emkzPaCfbWnlDJbX+uxNhMipUVZ8ChJKWtOgmlQL8vjNYPduoK31MWOnGEvpajuz0975g95OHfKpGIyZRZU435KUyLskeunFVnI6q12kGRDC8nTSOHgvA6oNUylt5DGFFaku9klnkbiDsW9iqs5U0E5v4g6hllEtHTDCTQWGd9yhawgk7cHFqouwbmg7PN/6wb3QOAwHbL1KIWNLZr1WbBdWuMAUwCaWXr/7ojUlmtNCa1Q87wRdjtjE6Pi/+12gKRBDQ/J+qGUhodUKlSb7n81ubLj1gNlar5LRjXisk7KUhAzbBf/FpH9asQ1zp1K9GeVFy3E2RYnQdftBCdezmmwnxbJMhnpvnAkp4ppbSm1Qme/JkL7jL4S5Lyev+GISames7pdasyxJNaJ5nP75/+s5mwPE5g=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(36840700001)(46966006)(26005)(82310400003)(2616005)(47076005)(6486002)(34020700004)(70206006)(33656002)(81166007)(6666004)(70586007)(956004)(86362001)(186003)(36756003)(44832011)(7696005)(2906002)(336012)(8676002)(36860700001)(966005)(16526019)(53546011)(478600001)(5660300002)(83380400001)(8936002)(6862004)(54906003)(82740400003)(316002)(4326008)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 14:59:37.6996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc54c152-6dc7-468e-a977-08d90a563e5b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4528



> On 27 Apr 2021, at 14:57, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 26.04.2021 17:37, Luca Fancellu wrote:
>> --- a/docs/hypercall-interfaces/arm64.rst
>> +++ b/docs/hypercall-interfaces/arm64.rst
>> @@ -8,6 +8,7 @@ Starting points
>> .. toctree::
>>    :maxdepth: 2
>>=20
>> +   arm64/grant_tables
>>=20
>>=20
>> Functions
>> diff --git a/docs/hypercall-interfaces/arm64/grant_tables.rst b/docs/hyp=
ercall-interfaces/arm64/grant_tables.rst
>> new file mode 100644
>> index 0000000000..8955ec5812
>> --- /dev/null
>> +++ b/docs/hypercall-interfaces/arm64/grant_tables.rst
>> @@ -0,0 +1,8 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Grant Tables
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +.. doxygengroup:: grant_table
>=20
> I continue to object to this giving the impression that grant tables
> are something Arm64 specific.

Hi Jan,

I=E2=80=99ll put it in a folder named =E2=80=9Ccommon"

>=20
>> @@ -66,6 +67,7 @@
>>  *     compiler barrier will still be required.
>>  *
>>  * Introducing a valid entry into the grant table:
>> + * @code
>>  *  1. Write ent->domid.
>>  *  2. Write ent->frame:
>>  *      GTF_permit_access:   Frame to which access is permitted.
>> @@ -73,20 +75,25 @@
>>  *                           frame, or zero if none.
>>  *  3. Write memory barrier (WMB).
>>  *  4. Write ent->flags, inc. valid type.
>> + * @endcode
>>  *
>>  * Invalidating an unused GTF_permit_access entry:
>> + * @code
>>  *  1. flags =3D ent->flags.
>>  *  2. Observe that !(flags & (GTF_reading|GTF_writing)).
>>  *  3. Check result of SMP-safe CMPXCHG(&ent->flags, flags, 0).
>>  *  NB. No need for WMB as reuse of entry is control-dependent on succes=
s of
>>  *      step 3, and all architectures guarantee ordering of ctrl-dep wri=
tes.
>> + * @endcode
>>  *
>>  * Invalidating an in-use GTF_permit_access entry:
>> + *
>>  *  This cannot be done directly. Request assistance from the domain con=
troller
>>  *  which can set a timeout on the use of a grant entry and take necessa=
ry
>>  *  action. (NB. This is not yet implemented!).
>>  *
>>  * Invalidating an unused GTF_accept_transfer entry:
>> + * @code
>>  *  1. flags =3D ent->flags.
>>  *  2. Observe that !(flags & GTF_transfer_committed). [*]
>>  *  3. Check result of SMP-safe CMPXCHG(&ent->flags, flags, 0).
>=20
> Since neither in the cover letter nor in the description here I could
> spot a link to the resulting generated doc, I wonder what the
> inconsistencies above are about: You add @code/@endcode (and no blank
> lines) to parts of what's being described, and _instead_ a blank line
> to another part. I think the goal should be that not only the
> generated doc ends up looking "nice", but that the source code also
> remains consistent. Otherwise, someone like me coming across this
> later on might easily conclude that there was a @code/@endcode pair
> missed.

Yes I=E2=80=99ll explain better in the commit message, that part and other =
parts are
enclosed by @code/@endcode because they are formatted using spaces.
If the block is not enclosed the spaces are missing in the html page result=
ing
In a mess.
If you can suggest an alias for the @code/@endcode command, I can create
it so that the user looking the source code can understand better what's go=
ing on.
An example: @keepformat/@endkeepformat OR @keepindent/@endkeepindent

Here a link to the documentation right now:=20
https://luca.fancellu.gitlab.io/xen-docs/hypercall-interfaces/arm64/grant_t=
ables.html

>=20
>> @@ -97,18 +104,23 @@
>>  *      transferred frame is written. It is safe for the guest to spin w=
aiting
>>  *      for this to occur (detect by observing GTF_transfer_completed in
>>  *      ent->flags).
>> + * @endcode
>>  *
>>  * Invalidating a committed GTF_accept_transfer entry:
>>  *  1. Wait for (ent->flags & GTF_transfer_completed).
>>  *
>=20
> Why did this not also get enclosed by @code/@endcode?

In this case there are no spaces that contributes to the indentation.

>=20
>>  * Changing a GTF_permit_access from writable to read-only:
>> + *
>>  *  Use SMP-safe CMPXCHG to set GTF_readonly, while checking !GTF_writin=
g.
>>  *
>>  * Changing a GTF_permit_access from read-only to writable:
>> + *
>>  *  Use SMP-safe bit-setting instruction.
>=20
> And these two?

These two lines makes the resulting html page looks better, the source code=
 however
seems not too impacted by the change though.

>=20
>> + * @addtogroup grant_table Grant Tables
>=20
> And no blank (comment) line ahead of this?

Here there is no need for a blank line in the comment, but if in your opini=
on the source
code will look better I can add it

>=20
>> @@ -120,24 +132,26 @@ typedef uint32_t grant_ref_t;
>>  * [GST]: This field is written by the guest and read by Xen.
>>  */
>>=20
>> -/*
>> - * Version 1 of the grant table entry structure is maintained purely
>> - * for backwards compatibility.  New guests should use version 2.
>> - */
>> #if __XEN_INTERFACE_VERSION__ < 0x0003020a
>> #define grant_entry_v1 grant_entry
>> #define grant_entry_v1_t grant_entry_t
>> #endif
>> +/**
>> + * Version 1 of the grant table entry structure is maintained purely
>> + * for backwards compatibility.  New guests should use version 2.
>> + */
>=20
> In case I didn't say so already before - I think this would be a good
> opportunity to drop the comment pointing at v2. With v2 optionally
> unavailable altogether, this can't possibly be a generally valid
> course of action.

Could you explain me better that? Do you want to get rid of this comment?

/**
* Version 1 of the grant table entry structure is maintained purely
* for backwards compatibility.  New guests should use version 2.
*/

In this case I don=E2=80=99t think this commit is the right place to do tha=
t, I can just
put it back where it was so that the documentation simply doesn=E2=80=99t s=
how that.

>=20
>> @@ -451,11 +465,6 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
>>  * bytes to be copied.
>>  */
>>=20
>> -#define _GNTCOPY_source_gref      (0)
>> -#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
>> -#define _GNTCOPY_dest_gref        (1)
>> -#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
>> -
>> struct gnttab_copy {
>>     /* IN parameters. */
>>     struct gnttab_copy_ptr {
>> @@ -471,6 +480,12 @@ struct gnttab_copy {
>>     /* OUT parameters. */
>>     int16_t       status;
>> };
>> +
>> +#define _GNTCOPY_source_gref      (0)
>> +#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
>> +#define _GNTCOPY_dest_gref        (1)
>> +#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
>=20
> I guess I didn't express myself precisely enough: I think these
> would better live _immediately_ next to the field that uses them.

Ok I didn=E2=80=99t get that, I=E2=80=99ll put them right next to the field

Cheers,
Luca

>=20
> Jan


