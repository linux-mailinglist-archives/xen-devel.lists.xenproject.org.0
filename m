Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 979AC35C812
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 15:59:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109143.208312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVx68-0003BN-CE; Mon, 12 Apr 2021 13:59:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109143.208312; Mon, 12 Apr 2021 13:59:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVx68-0003Aw-8U; Mon, 12 Apr 2021 13:59:28 +0000
Received: by outflank-mailman (input) for mailman id 109143;
 Mon, 12 Apr 2021 13:59:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VKKJ=JJ=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lVx67-00039a-Bj
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 13:59:27 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.51]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 816a13e4-e3dd-4cda-9d84-8a46fde6ccea;
 Mon, 12 Apr 2021 13:59:18 +0000 (UTC)
Received: from AM5PR04CA0025.eurprd04.prod.outlook.com (2603:10a6:206:1::38)
 by PA4PR08MB6157.eurprd08.prod.outlook.com (2603:10a6:102:e3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Mon, 12 Apr
 2021 13:59:16 +0000
Received: from AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::b4) by AM5PR04CA0025.outlook.office365.com
 (2603:10a6:206:1::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Mon, 12 Apr 2021 13:59:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT059.mail.protection.outlook.com (10.152.17.193) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Mon, 12 Apr 2021 13:59:15 +0000
Received: ("Tessian outbound 47ca92dabae7:v90");
 Mon, 12 Apr 2021 13:59:15 +0000
Received: from e9d9854bf71d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0BC9A634-9AC7-4534-B744-1841FBE25C35.1; 
 Mon, 12 Apr 2021 13:59:07 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e9d9854bf71d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 12 Apr 2021 13:59:07 +0000
Received: from DB7PR08MB3626.eurprd08.prod.outlook.com (2603:10a6:10:4a::16)
 by DB6PR0801MB1829.eurprd08.prod.outlook.com (2603:10a6:4:39::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Mon, 12 Apr
 2021 13:59:05 +0000
Received: from DB7PR08MB3626.eurprd08.prod.outlook.com
 ([fe80::a05a:b249:56a2:c570]) by DB7PR08MB3626.eurprd08.prod.outlook.com
 ([fe80::a05a:b249:56a2:c570%4]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 13:59:05 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LO4P123CA0378.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:18e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.22 via Frontend Transport; Mon, 12 Apr 2021 13:59:04 +0000
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
X-Inumbo-ID: 816a13e4-e3dd-4cda-9d84-8a46fde6ccea
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAeEwcj23krVwC3C/RIwtZr+s+XvL2+19gc2q6ein7g=;
 b=8HIdyMu+yKpKWmyhvcZFFi1Cicun9tiRFyJHyOEdi6wXIy0/mMSa2Qkf2R9UmBO9mUKRxXsNu8IvxxR7runYrYNPTEkMmd4jYx8NLCthBWZicCkWYM0LuYglTbsoV87+CXe9VAh/vRMBKcGefzn1LeQpVSrfEHphN4Ye/hLT2aE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 055d40984ed435e4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ugxoh04+c9y6E0o72rGBnE/ozrz8QPvAnQfZUBeV/lXCN7wnCfzXjao3uqf+QywQoi4sK9Lh4Wkzgh3X01/ugHdi6LOQ+Jqpuf2nyAYTTeqax5kT98cAjS288naeves8zPDVNIA9lyWShEcB4UNiLvucFNTJ+fA9uJedqrU8kLn/61TfUoppbnz4Z3jcK+Y+byFXBV5C0PAQ5N7rV0l1BYAk1iFfbl0TABjHcOXyUIaIuqqBV+KoH/YLRw8tli95sDfcGwbEZqcQPFM3o/J3GCtKfeMM2QW3wga1G+MBj0SJGbS8aNI1Upg1tEHO2HDsvNXVWNcHm0EsVeJf3Oznfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAeEwcj23krVwC3C/RIwtZr+s+XvL2+19gc2q6ein7g=;
 b=QetbBT9eUj1d7z6db3QSS+V3pW2JnYKjplGxNdRnYXlWUzp0inTAgADjQKzrrrOGJF9bSOmj6XBMzfzEFnHMpWMaxRE7416dfeVJ7nCY6MFNeq4ARf9y5euIh65Djf8n8A/2TIxN5M8jtsjoNZXPvhlZsSUcwn9vk58dtxsiluW408I4WRiGtETH3YkxKfCAHPeEyAvsbc5ZjYDovmQp9Vr5FjJWaxPATZmPyrPbp1GeXra4gXXEP9kQ90OGzPGqIK0aoB1l3LeItwTjugUIFxBVV1QsNy8ZZhxOitCJlSG+wJrFj4GMh5GFa8eqsGGP+/InMoHgbKu8WUhSr1LSnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAeEwcj23krVwC3C/RIwtZr+s+XvL2+19gc2q6ein7g=;
 b=8HIdyMu+yKpKWmyhvcZFFi1Cicun9tiRFyJHyOEdi6wXIy0/mMSa2Qkf2R9UmBO9mUKRxXsNu8IvxxR7runYrYNPTEkMmd4jYx8NLCthBWZicCkWYM0LuYglTbsoV87+CXe9VAh/vRMBKcGefzn1LeQpVSrfEHphN4Ye/hLT2aE=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v3 2/4] xen/arm: Handle cases when hardware_domain is NULL
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <b1242714-e5f3-1e6b-f1bd-e9e53326fda7@suse.com>
Date: Mon, 12 Apr 2021 14:58:58 +0100
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 Rahul Singh <rahul.singh@arm.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <9A775115-36A9-418F-B945-A778DE98672F@arm.com>
References: <20210412105243.23354-1-luca.fancellu@arm.com>
 <20210412105243.23354-3-luca.fancellu@arm.com>
 <b1242714-e5f3-1e6b-f1bd-e9e53326fda7@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0378.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::23) To DB7PR08MB3626.eurprd08.prod.outlook.com
 (2603:10a6:10:4a::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24e64d31-7ae4-4eef-e259-08d8fdbb28ee
X-MS-TrafficTypeDiagnostic: DB6PR0801MB1829:|PA4PR08MB6157:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB615739301F5EA00994242CEFE4709@PA4PR08MB6157.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NWC8lvAx6Jj55KZ30oQD+LT8WARNoFioeb9ptJLdzhiZJhr0daEulePTzZYURs4QQFGh3YkmGm27Tqf7L9tlwYl5GMQ9c1oFzHESZ0mXNt2qp3GU1dwWOOL4TzXQCHeWEYwAKx9qreaXboCpOtV8G/UWfLETU/Ckrk1HmWFQqo+bwg7fsPIJKlfy96mz8EFfrP0IC02lP91kj+uU55cfRhsW1vPV+MtLLa+BRaH3iSr2KuignM71WMKmpbj/FhHwWalHrEDF8MQnAiAyOEtphsSlqV7XkYJ46KTXYbCocbDBXMXsMeH/JXF9s7bP9kikMhdi8kMqEkYK2aKiv77NR15z0FgruVPT7GH5bZOlICK9xZ2PIZm36XZdiufFEQCwWsFJBC7trX5HDMa9p8PqYVRHUATzMoe+QmrxmbU8Hyf6E3PRqXKJvGb2TCfGVjQTaU1WARjsI3XqfgHcBiOZyzl6nzgGfAaHdPXfmxMtXwwHzkZm1kqMgvJBEchONTdVufBABOm1hmWQUKy1DT+0Ufedwb7YYKbwh7/DZMiPrjWhqYW6DNNAGIroPiq0MPZ+IuG1aBNoLqk1YXDcCKbzFvsRW9mbr/PumiOA86Or0OiGXAACpqSE57LEof2XoMmxsiKSTCirCDiG76wwkRLQtW7F/8FHzYl48Ma5JjtCpz8/l/BK5axi31z7FmlxFnKa
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3626.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(136003)(346002)(366004)(26005)(16526019)(2906002)(66946007)(6916009)(2616005)(52116002)(44832011)(956004)(36756003)(53546011)(186003)(5660300002)(66476007)(66556008)(6486002)(86362001)(8936002)(83380400001)(316002)(8676002)(4326008)(38350700002)(54906003)(478600001)(6666004)(38100700002)(33656002)(7696005)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?RFRucW5yOHBENWkrM09aYXprUlJTU2g1c2QyZ1dXdEkzcUpYTjRGTVRzU0M0?=
 =?utf-8?B?QmNUVjVOb1I4S3F4RDBNdm9RMFhRQlUrbUc3UjN6aktnU0pVM05JZHZwdGFq?=
 =?utf-8?B?cE1TaHZTRTkxQUEyZlNabWlLSEh4SytVRnMxSVo5Uys1N040Z2lyZWg4RWxi?=
 =?utf-8?B?QSs2eUZncmZRblNiYlAwTWVRVjk5bE45MDdFYW56dlFURjhhQ1NCaXdCSDE2?=
 =?utf-8?B?RUR4RzlwTzF1Z3d3Wll5V05oYkxpbmZ6UmJHckNVblJZbVJKNGVxdnd5akt3?=
 =?utf-8?B?T21aN0dxWEdteExzay9oV3ZFbno0WXY2UE5WSG91Q3U2dFA1a1dLVkFnMlMx?=
 =?utf-8?B?Tml2MEM0SkVhOGVFS1UzMGZJN3NWUWpDY1l3bUEyMDN5UWp0WHJlZS9lUjV5?=
 =?utf-8?B?RitoN0pOdXJnaVlITEZmSDlod2lsb3VYUXVlUkJaU3RodzZIL3F0My8zcGN3?=
 =?utf-8?B?dmlhb2svdzdBL2dKNlI3SzdldzJKTmxZN003eHdtR1BFZUFHczgzcmJFWnEx?=
 =?utf-8?B?VnZabURyMVpEM01xbCtWbVdzMjE5R3pRb0dCdlliajloZnpTd1ZBMUpreVBt?=
 =?utf-8?B?NCtxRmdwazltQkVnZjJsZmhmb0xRTUZMck9kSWtQcEhmV2svNitLMU9QOTRx?=
 =?utf-8?B?YnNhUjBkYmd2OU5WL1llL3dkY2xjTU9WcjFDQUpKUHI1aHpsNzhaTGRucEFP?=
 =?utf-8?B?WDFtbFl3Rk9NWDg1dXNuUnUyWi9uN1RzOTNaaGRLWjliN0J0bnQ4OWovK0Js?=
 =?utf-8?B?Q2p6K1hObnNDYk12R0ZpaU1RTzFjVTVic0pmbzVIQURTbzBJanBFUS9KRDRR?=
 =?utf-8?B?bFFWa1lvS3VhSGkzcFRhQ0VNM1p6c0gxbWNCVWhXOFZQNGVZd3loYThrY3Nr?=
 =?utf-8?B?Vys1c1Y2WHcvTE45dlZISGVadm9hSmpjQVgyN1kvMk1qenBXRjVPU3RwRENi?=
 =?utf-8?B?NkpRMkFWakw1SlNlYUlobUhNN2NCbHlGenR2QnVGcGxZTC9HaFF1cHduVmpz?=
 =?utf-8?B?aWFvYnVRMVV6aEZaUWFBS3hRNWhqaHFwYk0vOHlFK3VwNEkyR2JaMC9UZk1C?=
 =?utf-8?B?NjRZVWo4VHdLZUh2UEVKb0dkSGZMaDZZN1dONmFpUy9CUCt4RUsvNndzdnJh?=
 =?utf-8?B?UDQxbUVCb0NISDdQb0tXVndDRmlPcXVvdW16cnhiUTRGY2N4MzlLc2c5MzRz?=
 =?utf-8?B?NnRxM3pHcmR0Q2Y1SlNoZ1FLL0RRYnlpalQyQXdpb2RvMnYrbzF6dU9SZzRG?=
 =?utf-8?B?dmVoakR2VzNnQnFRbGV5U3pZQ0tYK2dNdE4xODgvWGJ2T0dvU2N5Z3ViTGUz?=
 =?utf-8?B?d2gxQXNvQ1hESGgxK3Q4R0pGMnMrMjlhUEFISTVybkVPSEZUUVloditTcW50?=
 =?utf-8?B?U1lFL250Qm9XV0ZHOGg2L1Ewd0NxZlFMcjBCcDY1TjVQck1ya1hrYk80OGR2?=
 =?utf-8?B?UDg5U0x6WXU3MVdwZjM2d0llS3BSa0J5WkI2MTdOazN6Mmp3K0dxSVYzRGFk?=
 =?utf-8?B?UjhIU0JaQS84QU56QUI0MTBKN0hqTFViRVozZWpPOTd0SE8ybm45eTF3amRD?=
 =?utf-8?B?dFdud3huaHJ5cndvM1hDOTUwUzZXRzhidHVweFRWZkRtM3lRYmE2ZnIvaDgy?=
 =?utf-8?B?Ymt1aWNrSFhsbUN6V0VzU3E0UERVOVA3b3lKa0trRHcyQ0xzTGVXUjdVY0ZD?=
 =?utf-8?B?TTBvL0w0by90MEVnSFpIVVVSQjBuc2I3MVlxekhxNjJjVWtHUjA0YmVLK3Yx?=
 =?utf-8?Q?56zjmlH2je2OlNiEbTlAPZLGjBFBl0VC0lUCrqi?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1829
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cc34d5be-6f73-4293-55d6-08d8fdbb226f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QVoNciQomGDY7/z5agzF7+U+TwhQ/FM2Zs9JhJAVK8dp8LAiP5IBIV4bY4CcNvWKDihbQafBXtHpfJdg7196Z3Ur4Dof+PmkTESbEA28qNDL9zQPXuGYHq5s54LkW5x+NaSrTh76lJ7bX5Ya2tvFs3VZ92Je3g+w2DAjgUeL86wpswvC2U8TVTk2WpM5keaB3mga27RfWWJkyifJA9jcr+/cB1/3S3bsxG+7bhU/6cG7fZJeLQflYueQrizBSGo+Cs35WPHWSPx4lhpGgD5tZBbGQeKhqVOGiHbKXZN1hel7X9DUklM2uYm2BndzgZzJwr3tkJVqGPBEIvTiZf6JQChbUgX+nqnk6FY5NSWpVYKz4SJF0JupmnC6BNduCVCj9Pa4Ax8zTFe0RIt8LWklPn/ggHjfr55zuobcm4pjfEAMNzerdK74zJe/USx921NufpV/12YmzoYPfa7qELJfCknOpWUiExLnD+cB+f0h4Wx7TKKj4H9rajyIfJoHDEb7RkMhbtRBXIqoLsoGZe/354PiPD1bIJBO8ApWFtb94AjBQe5MgdL7Ybo+a++KMlIp+/9HVcuzpJ092DxWAXblcjA193HfoYdrnVCoPe/ZhM+QsVHlel0ZpXN+7W584hSzt2+pcrQG1PSUKV3XxiX5T928h0Y+4xz0tqYMVx0r+ps=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(376002)(46966006)(36840700001)(86362001)(70206006)(16526019)(70586007)(7696005)(82740400003)(186003)(81166007)(44832011)(8676002)(336012)(53546011)(6666004)(47076005)(26005)(356005)(83380400001)(82310400003)(2616005)(2906002)(956004)(6486002)(33656002)(54906003)(316002)(478600001)(6862004)(4326008)(8936002)(36860700001)(5660300002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 13:59:15.9841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e64d31-7ae4-4eef-e259-08d8fdbb28ee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6157



> On 12 Apr 2021, at 12:03, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 12.04.2021 12:52, Luca Fancellu wrote:
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -1022,6 +1022,9 @@ static always_inline bool is_hardware_domain(const=
 struct domain *d)
>>     if ( IS_ENABLED(CONFIG_PV_SHIM_EXCLUSIVE) )
>>         return false;
>>=20
>> +    if ( !d )
>> +        return false;
>> +
>>     return evaluate_nospec(d =3D=3D hardware_domain);
>> }
>=20
> On v2 I did say on the respective code that was here (and my
> suggestion of this alternative adjustment): "Can you point out
> code paths where d may actually be NULL, and where [...] would
> not behave as intended (i.e. where bad speculation would
> result)?"
>=20
> Since you've taken the suggestion as-is, and since the commit
> message says nothing in either direction here, did you actually
> verify that there's no abuse of speculation possible with this
> extra return path? And did you find any caller at all which may
> pass NULL into here?

Hi Jan,

I=E2=80=99ve analysed the code and seems that there are no path that calls=
=20
Is_hardware_domain() with a NULL domain, however I found this
function in xen/arch/arm/irq.c:

bool irq_type_set_by_domain(const struct domain *d)
{
    return is_hardware_domain(d);
}

That is calling directly is_hardware_domain and it is global.
It can be the case that a future code can call irq_type_set_by_domain
potentially with a null domain...
I introduced a check for the domain for that reason, do you think that
maybe it=E2=80=99s better to put that check on the irq_type_set_by_domain i=
nstead?

Thank you for your feedback.

Cheers,
Luca

>=20
> Jan


