Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB17303E76
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 14:20:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75009.134927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4OGj-0008EO-JA; Tue, 26 Jan 2021 13:20:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75009.134927; Tue, 26 Jan 2021 13:20:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4OGj-0008Dz-Fh; Tue, 26 Jan 2021 13:20:29 +0000
Received: by outflank-mailman (input) for mailman id 75009;
 Tue, 26 Jan 2021 13:20:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=55K9=G5=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1l4OGi-0008Ds-A5
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 13:20:28 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::630])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03ec1b43-94a1-45fb-a3b2-82f451e0ead8;
 Tue, 26 Jan 2021 13:20:25 +0000 (UTC)
Received: from AM6P195CA0101.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::42)
 by DB6PR0802MB2326.eurprd08.prod.outlook.com (2603:10a6:4:86::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Tue, 26 Jan
 2021 13:20:22 +0000
Received: from VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::72) by AM6P195CA0101.outlook.office365.com
 (2603:10a6:209:86::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Tue, 26 Jan 2021 13:20:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT038.mail.protection.outlook.com (10.152.19.112) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 26 Jan 2021 13:20:22 +0000
Received: ("Tessian outbound 587c3d093005:v71");
 Tue, 26 Jan 2021 13:20:21 +0000
Received: from 95f74ccde80d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C5D5DA9F-1CBE-44FD-BEFF-5B5417248B26.1; 
 Tue, 26 Jan 2021 13:20:16 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 95f74ccde80d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Jan 2021 13:20:16 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB5422.eurprd08.prod.outlook.com (2603:10a6:803:12e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Tue, 26 Jan
 2021 13:20:14 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6%5]) with mapi id 15.20.3784.017; Tue, 26 Jan 2021
 13:20:14 +0000
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
X-Inumbo-ID: 03ec1b43-94a1-45fb-a3b2-82f451e0ead8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jyhp6/3v76sM6Q3RtGKoOHvPaFj/rDSryuOdH6rfSI=;
 b=CN8bqEMZflIP10G9CdYpMAfY5uQKsRpt/RTMHXVBwWNQ5WfqpGGGL0yKFwXpsw4WIjx6KE5q1JrV2+cdhcDdkA3LkwIgYVYoCnpysgP62vV/No2iytIeul3+Ex6NO1Xn5LVf37jhFspzufIi2Hi6F5o4XppJQIhs16pislIVImU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4f3d9e8c3885e2f3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I86FVCh9CBhoLCVqAPSH+CeZu0KqPGhYtmBvn5Oy+u3r8cfIDDWjlEQ//aMNYt32LTebujbdc9hAOJ1NU7fDTSQnpBWcR7juxkzbNK/BtTd/VI6TMcejKBNJzp73wIQ81EW83xyIuu8gGTL6M3sKs/vXtiXeCUJjjcbYJtEJxxgK/oTbo5XPl5pqFsHM+nXFRoVIp6VeapXeAfMSVoKpuLBW4CwsaqYp7cZ3nEDbxxHLg8CVkztdCJE9jHWGfFmAk2PmEVT+QpXz2L5Ye234G7zB1Gqw6AjzAWPUUzGwCiwogMJLvahm34JPXlqcgHNjbjDJ5Pj8jFmXk+EGSnb+Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jyhp6/3v76sM6Q3RtGKoOHvPaFj/rDSryuOdH6rfSI=;
 b=Zb1p8eGbEQ4jeyEmbLXAPB5b07nrB84LdYDvxmXFma1UouvqEJkldF14K3R6aZDoNcBDTHR3fMnvDNA18Hs9bHujVBfNPh7niu7TVpRPgYoI1pvpnr+Stb+izBxiVL0diCCzMxOMVWefi2LtLhB4z3S2u1GRvRp55p5TQ5er6t23n+L/KEjBksXCYCzH0DmPEFesCG+lq6SLMpTYAQereJMHmN3VzjlULd/gaRZh+0UvOPI2Z++utZkNKQjY3CHSpzNFyNJ88IXK0xy6jBaYtfJ0iIpGal/QcrT4iwjAHHIDk2t/Fk21uHmZH1kwRvC9ME0kry9/GmKZWMTM+YQ4Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jyhp6/3v76sM6Q3RtGKoOHvPaFj/rDSryuOdH6rfSI=;
 b=CN8bqEMZflIP10G9CdYpMAfY5uQKsRpt/RTMHXVBwWNQ5WfqpGGGL0yKFwXpsw4WIjx6KE5q1JrV2+cdhcDdkA3LkwIgYVYoCnpysgP62vV/No2iytIeul3+Ex6NO1Xn5LVf37jhFspzufIi2Hi6F5o4XppJQIhs16pislIVImU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "julien@xen.org"
	<julien@xen.org>, "wl@xen.org" <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 1/2] xen: EXPERT clean-up and introduce UNSUPPORTED
Thread-Topic: [PATCH v4 1/2] xen: EXPERT clean-up and introduce UNSUPPORTED
Thread-Index:
 AQHW82EN9R2ynrmbqk6EAVX0Oyalkao5otWAgAAc8QCAAAFygIAAAbYAgAAfFACAAAKIAIAAAG4AgAAAOoA=
Date: Tue, 26 Jan 2021 13:20:14 +0000
Message-ID: <F7910701-ECBD-42AB-B36F-DFAC57FC72A4@arm.com>
References: <alpine.DEB.2.21.2101251321420.20638@sstabellini-ThinkPad-T480s>
 <20210125212747.26676-1-sstabellini@kernel.org>
 <bbdbb0d2-24d7-4e46-1303-706c6c3036c3@suse.com>
 <8F34AC6E-2337-42C3-B612-A5414F9E16BE@arm.com>
 <01da05ea-6c34-8d8e-4277-e29bc54cb67d@suse.com>
 <5CB981E5-27BC-4B7E-B494-EFFDE8A4A1A9@arm.com>
 <1199ab03-ecfe-386c-7488-ca4f794b0683@suse.com>
 <24592.5760.197643.853055@mariner.uk.xensource.com>
 <e216b834-793a-0ace-49ab-c21a4febde3a@suse.com>
In-Reply-To: <e216b834-793a-0ace-49ab-c21a4febde3a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 062561d3-dc0d-4840-c178-08d8c1fd22a8
x-ms-traffictypediagnostic: VI1PR08MB5422:|DB6PR0802MB2326:
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB23264A82B89678B3B0A335059DBC0@DB6PR0802MB2326.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rplzgkmuQ988nC0mCfAjHjoiv0Zq2jMKnBM682RDocP/ep0A4LpsumNG2eEn0KUWQGOu+f0wn/TC43GVyddP33tQGfTyAUDSIBwt5mJw6uuOTRKft5GAjBt82jofQ8K73UKhQjEqRbYRONhSQb/iTNjdkESkP+j4CfWa7V7TmUvz09E1MZ8ON0wHniqRgDXlwB1navFK6KdXzuND/+Z78dbQFcoUbraweD1JZq1TJ1HKCpkiICY3Uw0vTFve7eAbFcCi7NFNk/ynBdueuJDoQva2W5JFjEJrrp5Oyf+sz+MbvLD+8QysGrDxE6FB4LQmT+242exAPHkYFotSOCTwPI6dZFgTiZr5At4GMWtVz9Yqx8qahaEfox+3xNeYTFYtjKhL3Hu3Bc+s0sgU1wawO+jN3Y05ZrJMwHz+P/rVaWXc/D/FWOgSvuKC5G4MWhnl
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(316002)(54906003)(66476007)(66946007)(4326008)(6486002)(5660300002)(36756003)(66446008)(71200400001)(6512007)(64756008)(66556008)(2906002)(76116006)(83380400001)(53546011)(8936002)(478600001)(26005)(55236004)(6506007)(91956017)(86362001)(6916009)(8676002)(33656002)(2616005)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?JHFrZv+n/RUxFx6Rk4bk0plv1WTBY1PdgPl5M+yn82CPhUxq/g1aiv6p4xlS?=
 =?us-ascii?Q?ZC6Rr/p/on/pNGJYvI0zxPuw6w085iSyK9Xmi0bybtocEkK/c2vNRfXLVSaE?=
 =?us-ascii?Q?A7wBFLx0+4/14x9TNw4un9UGtW9uwkZ1PnDgCBgtR2N+VTfXQMgTWC3U1P8B?=
 =?us-ascii?Q?Lg0W2QSwSw9wUQT43b6Dkl80c1uDoRSRL7imWSvvmW7/BZzPY/UF4XjCGloy?=
 =?us-ascii?Q?XndhFuJH/JpBrQmgeJMmWOzVYK/Nx8s+bUGVMH8AhPC9Q6UzPAGEMMwNAiyW?=
 =?us-ascii?Q?g7CxnukEvhPLk43w7e1jJvpsIv4oRu3uGVUOMbHM1YwQExJk9JYAuKlP6Y+G?=
 =?us-ascii?Q?NfKAVGttvzaTfi/36I8a8SiDRBeu2NfGq4uay2SckklfqsGO9uk3EgMvyeoC?=
 =?us-ascii?Q?DRR8a1HK06SFjYu+qrHn6Q7OB5802pZIpfFbPQPURquX48JJfNy/SqFt5Y15?=
 =?us-ascii?Q?T9Ehd8SARZmGsvUfjtWPTgdXw6PIS2hIFSD1cLFnQETT+kmgrAT4eY03BIaB?=
 =?us-ascii?Q?GX2gvU0+knhytEatlN1wEreCKbacxYzqtykSWOnuhKCc1ibyPPo8xwqz6qL5?=
 =?us-ascii?Q?fdlhRo9NzIz1vhFJNLaB7YAHL5PbJ1JdBE1Q/Vw9uqArfjmpAUuv03gsr6LP?=
 =?us-ascii?Q?3wgNA8aRXtOwGzL5+SNZCHPWKQrmZ+TAshgHvgpn1HYqYtDReSCSqqX8H2Q4?=
 =?us-ascii?Q?4NNoshUay9oHItwkxCiFP4LOUwqJPukwkzNJ4UkmteoXsfOkFl9CZUrzm7s7?=
 =?us-ascii?Q?dYSHNCAuo7t4bEezFVpZnFqgbonzS5QczExfOuc0+GY3ghpIH+ImzvI4tTNU?=
 =?us-ascii?Q?LoVECXLKP5fJvnFxE/A6Oo7RmUTfrVpuRI6jYFKXKUPeOli0SiYI3FEhr+8P?=
 =?us-ascii?Q?cpd7l0rkbXzJ4/LHPmbOcYtVmStCq1y6mAzFeUFjK7ngasjGwhgggHH5J1bJ?=
 =?us-ascii?Q?T4B5qZlRu89VU/d0Nh5YPM9lnNwdi6QsXo1iOZSaCGCwDY7rkPHbGTMhHh4t?=
 =?us-ascii?Q?OAuxvgEI6NO0Ht6paHinrQjHwnDapxZqh15DUUHZjID1eyY9g+lTLgshg2if?=
 =?us-ascii?Q?IpRMXfYc?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <584D46D44A95A644829D7B4BF33A8DC9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5422
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	03aa0ecb-df58-4d01-39f9-08d8c1fd1dc0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ykVxYCJBefxIBBiN6gblSsVg0KOToPvaoMc0SOZCHqXiDOjHNb02bHw3Jjs1FdM+3fo2g/bIDLeD9sJ1yPmEsD/cANcVHQZsZsVI1uhj8tx3yFZ6UU8FndyNRRT7Bh7LKBvq73B4SWRfgWC6UIYDmVeHh9cMx00du82bUi69I5W7T/4nyjD6a6OMqbC/t1hJvjUg+yWUZgS0XP8H+gDr0PnhbYB4SxLgVTzwibFL5Cm8NOlncTTBvblsUyzhgwKlQ/+BJ8UEKrqnCsYiRbEPqXlHwL6ngVVphsUynJqhSwYndp+FWVcrVWYh4DW9xdVYsJ/hlQl2xPSOu4d18SrmzPGh0nKQAm1/GwxRMpmJMpP52Op926mUe9mulqlThe15TUIUgtjqh52owCAj6rPI9wh8XAJ1WV/tsxk+1vugNkwZ22ELTm8z/X2jryUa0M/NMTvl901uJjfSEvDcnS/1TmMLDuhAW5KDHj1kz1ti20bwjdl0WI45ZY3dMjj6QAUFuQhCrA796dCVnBNd/D1iFV1kUuYaYO22pYHBYp36512BlAL2F6rJHuJX2uFKBbJrQh9hMd0e4k6sDGV93Tx1Ck83e4q1BG3gMOfusDRaxe8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(46966006)(86362001)(2616005)(8936002)(5660300002)(186003)(70206006)(6862004)(8676002)(6512007)(70586007)(36756003)(336012)(81166007)(82740400003)(54906003)(83380400001)(6486002)(478600001)(26005)(53546011)(6506007)(2906002)(82310400003)(55236004)(316002)(356005)(4326008)(47076005)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 13:20:22.3987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 062561d3-dc0d-4840-c178-08d8c1fd22a8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2326



> On 26 Jan 2021, at 13:19, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 26.01.2021 14:17, Ian Jackson wrote:
>> Jan Beulich writes ("Re: [PATCH v4 1/2] xen: EXPERT clean-up and introdu=
ce UNSUPPORTED"):
>>> On 26.01.2021 12:17, Bertrand Marquis wrote:
>>>> Maybe something we could explain more clearly in the UNSUPPORTED/EXPER=
T
>>>> config parameters instead ?
>>>> We could also make that more clear in the help of such parameters dire=
ctly.
>>>>=20
>>>> I do not see how we could make that more clear directly in the prompt =
(as
>>>> making it too long is not a good solution).
>>>=20
>>> My main request is that such tags be added only if there's
>>> absolutely no ambiguity. Anything else (requiring longer
>>> explanations in many cases) should be expressed in the help
>>> text of the option, or in yet other ways (a referral to
>>> SUPPORT.md comes to mind).
>>=20
>> Is
>>=20
>>>>>>> +	bool "Harden the branch predictor against aliasing attacks (disab=
ling UNSUPPORTED)" if UNSUPPORTED
>>=20
>> too long ?
>=20
> It may be tolerable, but it is getting longish imo.

I am also not quite sure this is making things clearer.

Bertrand

>=20
> Jan


