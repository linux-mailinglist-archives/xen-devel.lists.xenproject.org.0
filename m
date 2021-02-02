Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F2830C4E5
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 17:08:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80622.147557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6yDQ-0006bN-6a; Tue, 02 Feb 2021 16:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80622.147557; Tue, 02 Feb 2021 16:07:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6yDQ-0006aw-25; Tue, 02 Feb 2021 16:07:44 +0000
Received: by outflank-mailman (input) for mailman id 80622;
 Tue, 02 Feb 2021 16:07:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g09W=HE=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1l6yDP-0006ar-6I
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 16:07:43 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.61]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 229f7e3a-1167-46bc-bf03-a4129ff3c3e8;
 Tue, 02 Feb 2021 16:07:41 +0000 (UTC)
Received: from DB6P191CA0007.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::17) by
 VI1PR08MB3471.eurprd08.prod.outlook.com (2603:10a6:803:7d::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.19; Tue, 2 Feb 2021 16:07:27 +0000
Received: from DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::69) by DB6P191CA0007.outlook.office365.com
 (2603:10a6:6:28::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend
 Transport; Tue, 2 Feb 2021 16:07:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT034.mail.protection.outlook.com (10.152.20.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 2 Feb 2021 16:07:26 +0000
Received: ("Tessian outbound 8418c949a3fa:v71");
 Tue, 02 Feb 2021 16:07:26 +0000
Received: from 73672a4cf0c8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 32A22B64-DDE4-4298-900A-5E9B8C8AA937.1; 
 Tue, 02 Feb 2021 16:07:19 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 73672a4cf0c8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 02 Feb 2021 16:07:19 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB7PR08MB3881.eurprd08.prod.outlook.com (2603:10a6:10:77::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Tue, 2 Feb
 2021 16:07:17 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d%2]) with mapi id 15.20.3805.027; Tue, 2 Feb 2021
 16:07:17 +0000
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
X-Inumbo-ID: 229f7e3a-1167-46bc-bf03-a4129ff3c3e8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLiCbfzZcc+o2kZaqn3sYmkw7CkSS9uvAeq5DrqtSm8=;
 b=ZGP91mzQpYo41W6uWbDszcFpARAod6TuNcZ9yzCMansy2UaBjagBWes3HeqcKGu8OlrzbER9oejqid63Il/hteYRgcsNcVDM66RZyvwXvnkvu4/UQl2v+tjk9olE4H4D6U269eKNnXS0h8ZzPWX1LoQ4CuboTD2XTUYHXtMhN+s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: bd55745c8d5821be
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RjV4n4eU9wDPrU2SJr8xhUwJB62GgmoRoDqVulFn6Cv0uwN4/KSmQVnX4oGGYHcLlFPEhEll7Y4Nu+IaSFP/5wB57/UawWKJ5x0GnPUNz+idjEPsn6UnSxKDtSBawaVI539MiLg0fTsEZ1J5PCkvvG1IAE7aYBnrdXqM/VjpSoMw5nWW7D090VAP7UD8f/1qjpDVlRD/MfI0BWxY2VYwftFqmQMFjdXsFHzdxclWqJWENxhCYft9nB74E44ZzkSXDtJc3Ibf0BS/AaqbCL+cldE9KAyb0XuW6hSZyNWJFBx4L0Z1CJti+6RJmpfQ68fUWY/jiRm2zOstfNBUfKRqzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLiCbfzZcc+o2kZaqn3sYmkw7CkSS9uvAeq5DrqtSm8=;
 b=KhpkZSonfJQjjDkeoonD4kaJhOl0sbNCkBcXyjH7Svg3eI6KIePx2cdvqZRefuEMh4k7Rg4dzqXwz7uqjopencXRuYLECBTa2xGRNuGJhmrusDPikF2UUwZB+ymnvjl4flNyRqtpUMzpJBlMcj969jl6n5CMySQ0JyUKodDC7+E4CM5j4gLPxV5F4sqOhjHctTyq78WTC96SIWa8VhRFlw3wyZLUooijHm5jD6y9j6U9yI3GsyojzpfOgjJbpxoxi9tvRTbEatmIhB4Pug+iWZ3unX7aS1TfBXxaOb3hVvygGRpf0uFRsi4RBgoIwrCsGF/XDe+9CNfYeWaLduYYWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLiCbfzZcc+o2kZaqn3sYmkw7CkSS9uvAeq5DrqtSm8=;
 b=ZGP91mzQpYo41W6uWbDszcFpARAod6TuNcZ9yzCMansy2UaBjagBWes3HeqcKGu8OlrzbER9oejqid63Il/hteYRgcsNcVDM66RZyvwXvnkvu4/UQl2v+tjk9olE4H4D6U269eKNnXS0h8ZzPWX1LoQ4CuboTD2XTUYHXtMhN+s=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "brian.woods@xilinx.com"
	<brian.woods@xilinx.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v3 1/3] arm,smmu: switch to using iommu_fwspec functions
Thread-Topic: [PATCH v3 1/3] arm,smmu: switch to using iommu_fwspec functions
Thread-Index: AQHW9DbwAflFP7R5g0GKnact3rvcxKpFEoUA
Date: Tue, 2 Feb 2021 16:07:17 +0000
Message-ID: <DF3A4D93-17BE-4E59-92B1-5BA356C22EB1@arm.com>
References: <alpine.DEB.2.21.2101261435550.2568@sstabellini-ThinkPad-T480s>
 <20210126225836.6017-1-sstabellini@kernel.org>
In-Reply-To: <20210126225836.6017-1-sstabellini@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d33b0680-b2c6-4166-49e5-08d8c794a282
x-ms-traffictypediagnostic: DB7PR08MB3881:|VI1PR08MB3471:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB34719571FDD50C1DAA47CE07FCB59@VI1PR08MB3471.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:773;OLM:773;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 psD1mlYQs65Rm9ZZtvfLaozWM9aAy6V5UX/eiMOaUleObpwYO8qwfYw/40mjwxK+jY4ac7l6mlQanZXbkmC1kg18TF9dhfZTMklMqex3jQXC90MbLj2RjDS0FXtXKa3CZmzKsh3DP80kNMRQD+TCgOBMxjVW4eGp9gYS1apN2dEYlXd/B+pNh5W00oruiRcTcffMHFB/LnEeS/GBQgu4TMn834Z97GHKuV5uZ5IB/vwltDJzCKBexJ0V+qgZaH2nx1z0oVlQ4WY7Xq2i+v3N3uRDtIavc+MV861cS/ZZqMhq8iisYnaWJ8nEehh/LsPAWKq2v/cqrjb8Q1nAyNf7Ku9AzTSxYY3WmYtVTSSUoR/cmuWVpopP1UgR/wrLmFNBK/R1QWZObEE4ocbnXagB48PeHmw5P6rRliCPgiFyKFtzB8dhiauqNwu0PjXmAdP5O52saN+/hMqPnS0fkV0nErOqeSUkT4jIIZZu1RxKZZ60IH58TUMa8HKJGn2Uvq1mJKJ9EeGJNnhmiqCQP1Drls1fQ/BTzJXBt3RJm0sHlXtQ4kY5aSz8REPtYWWq37Ay2jWlqELBa8oAOb4TI8KCHg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(136003)(39860400002)(346002)(6486002)(54906003)(6512007)(86362001)(316002)(83380400001)(8936002)(2616005)(4326008)(66446008)(8676002)(36756003)(478600001)(64756008)(76116006)(66556008)(66476007)(66946007)(33656002)(91956017)(186003)(53546011)(5660300002)(6506007)(71200400001)(26005)(2906002)(6916009)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?YD4e354NcAoDD0t6GrvlY4WrE7iE3kqy80IhsOEkymexTzy8MdI5TY19QH9y?=
 =?us-ascii?Q?w5x5e8Xu9mu7DfAQPzm3zmsvOCQdY+iS/K3A8Ln5ePG4UKzW9k89xd8ETIa5?=
 =?us-ascii?Q?Qg7R23BjD0CReFxBovKAGKc8Xc7hPe57b1Db8oA1RlxfUGdkuDUkzgBmislo?=
 =?us-ascii?Q?MZEGurtDdU1w6zxM6jRhxigDSzg9Q2hF3gs1mUXwjsiFtvyQmVkWTb1rloWX?=
 =?us-ascii?Q?h931ZfRSzfDDBmpfSnmDdnDqWNwWpDt9283YlWeOvGiKTEP+iwYbgEzk6NVS?=
 =?us-ascii?Q?qYxvx3wdwVA+8IHA+Ea5Tg5oavlbgkJObC+lcO+wsWPToCbmFHQyyClwW07r?=
 =?us-ascii?Q?b7avoHOgVvHuaeB/SzWaATOYBkRLUQmgFtwPJUq0JXKPjidu/2GydYMxTxKa?=
 =?us-ascii?Q?E3Xi4juqmoBWDSKPkzw8pJTHtW+t4DPKie5vNTDrR+T9r/AzKWDaSrtNZWSl?=
 =?us-ascii?Q?6mUVkdE4amcAzplzK38O0WLhGVhZDMEOrdx8vaWTykXDmft9gDbEGipV7D27?=
 =?us-ascii?Q?FEYaFmTskPQKMfYx0mPGMGQip+SkNXLrR3UA/TIA2MglC30gKBT2zRJZgf6S?=
 =?us-ascii?Q?FBfteTM70BUOjAQ3b1FjzwNN56w4MflMoGCXQdxmjEXnGEuwoTctpctiHUbb?=
 =?us-ascii?Q?jwXPTJCwpn0q7SVPuYyqiWu9ragKas2l+xeOs6VWBdDjtGvoLqdYYtgrLnBi?=
 =?us-ascii?Q?hEf/FKL7aZ7Hbv8vAp185Lxs8DomUH+TPazX5Tu5ViM1GxKk8976ZVjJwPSE?=
 =?us-ascii?Q?h8W73ySlO5rge5TPzQ9zcb2cFMO6Xzm7uptbrYahzKiciyazR0EUwZeZX35f?=
 =?us-ascii?Q?PKxJr3ZtTt9lXbqgL3bGB+Ibvc0hP5ef5BV9N5Z+wt8sRO+yT63A8BQZR8Jy?=
 =?us-ascii?Q?K5iENOEsiJwlKqh5QDkYVfGfAg8lhT+IRN8Nbr/c1X4JzNx5BGNsNuvDwR8H?=
 =?us-ascii?Q?OsblLBdwQldZBtJvPbbZkfp+hNJYOat6Csbz94qNVe21otaE6d6ifIAXEPNh?=
 =?us-ascii?Q?ytYiPMRKN5LfB+P89OKsLarrhnJIZRqiQ1hJzCh7z52g8XLvbWydY1vDcWmC?=
 =?us-ascii?Q?p0bqa8fD?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4E0BD89213380545A308C490C1AC9619@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3881
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e6c6a53f-5427-46bd-ac85-08d8c7949ce9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TrTZaXtHNlcQJwiKHqTWhSjj0tgEEv3DHuxKS0yDJ526kx7ySUplL+Tn6vpXjq8WsvH5Wog5+Sq7JpLxrenz5kOi+oNXj/7rKpKYT7r5t5FXmnBJlEV7BLJyIFlDPcKthVYhtIypzzxtfOyAANKxdNofBxJCHs9GQzN0LbeM10D9ea2JLaVCKbMP5my3seWUdB8Vdw/6J1GuHRYB995DtGRFrKSrAjiBjJwqC1eRCd7vFvdJ4Mn6Ani1va/hBDRM9nnnwns4mt7vuq+5a3Aiz06s/nF7tTxs7RsvAi3emOrDWTdG50X2107jGCksuI3zG9PffXcKyb7TSuWNXGTABYtmo6quNbn1OrM5FNiHMilzcuUMhsa4FYyVR8uO0B2+ylL1wFThB3PP+FnEUJuMiftGjJTQOlVHRBlZDdSTgtwHFCjJbCpMITZNyEMDoY+0eJ2Cenb1kKksrPsu8SVbzkTBfPkuQhmpzo9Im28DWBcvZueysOXtnW3b/A4K/3f/3NDSJXb5BQLMTGKHDwZtEJn0lZFIeTz6wOMRbzluzoCOeh2JQ0nfWoJ/VTKBVQYOikSqmacCiVBaG7GOWLNLenllDSVSO5xmT49XzAe+NzlGntK8qbEEudyswiF0PAhdMts85WXe9onNFdiM0ZffvEqksQEuq/dRLDyb546Q5/Y=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(46966006)(36840700001)(33656002)(30864003)(86362001)(6486002)(6512007)(2616005)(47076005)(6862004)(107886003)(186003)(2906002)(4326008)(26005)(53546011)(316002)(478600001)(8936002)(54906003)(83380400001)(6506007)(82740400003)(36860700001)(356005)(8676002)(36756003)(81166007)(5660300002)(70586007)(82310400003)(336012)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 16:07:26.8375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d33b0680-b2c6-4166-49e5-08d8c794a282
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3471

Hello Stefano,

> On 26 Jan 2021, at 10:58 pm, Stefano Stabellini <sstabellini@kernel.org> =
wrote:
>=20
> From: Brian Woods <brian.woods@xilinx.com>
>=20
> Modify the smmu driver so that it uses the iommu_fwspec helper
> functions.  This means both ARM IOMMU drivers will both use the
> iommu_fwspec helper functions, making enabling generic device tree
> bindings in the SMMU driver much cleaner.
>=20
> Signed-off-by: Brian Woods <brian.woods@xilinx.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
> ---
> Changes in v3:
> - add a comment in iommu_add_dt_device
> - don't allocate fwspec twice in arm_smmu_add_device
> - reuse existing fwspec pointer, don't add a second one
> - add comment about supporting fwspec at the top of the file
> ---
> xen/drivers/passthrough/arm/smmu.c    | 98 ++++++++++++++++-----------
> xen/drivers/passthrough/device_tree.c |  7 ++
> 2 files changed, 66 insertions(+), 39 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough=
/arm/smmu.c
> index 3e8aa37866..3898d1d737 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -32,6 +32,9 @@
>  *	- 4k and 64k pages, with contiguous pte hints.
>  *	- Up to 48-bit addressing (dependent on VA_BITS)
>  *	- Context fault reporting
> + *
> + * Changes compared to Linux driver:
> + *	- support for fwspec
>  */
>=20
>=20
> @@ -49,6 +52,7 @@
> #include <asm/atomic.h>
> #include <asm/device.h>
> #include <asm/io.h>
> +#include <asm/iommu_fwspec.h>
> #include <asm/platform.h>
>=20
> /* Xen: The below defines are redefined within the file. Undef it */
> @@ -302,9 +306,6 @@ static struct iommu_group *iommu_group_get(struct dev=
ice *dev)
>=20
> /***** Start of Linux SMMU code *****/
>=20
> -/* Maximum number of stream IDs assigned to a single device */
> -#define MAX_MASTER_STREAMIDS		MAX_PHANDLE_ARGS
> -
> /* Maximum number of context banks per SMMU */
> #define ARM_SMMU_MAX_CBS		128
>=20
> @@ -597,8 +598,6 @@ struct arm_smmu_smr {
> };
>=20
> struct arm_smmu_master_cfg {
> -	int				num_streamids;
> -	u16				streamids[MAX_MASTER_STREAMIDS];
> 	struct arm_smmu_smr		*smrs;
> };
>=20
> @@ -686,6 +685,14 @@ static struct arm_smmu_option_prop arm_smmu_options[=
] =3D {
> 	{ 0, NULL},
> };
>=20
> +static inline struct iommu_fwspec *
> +arm_smmu_get_fwspec(struct arm_smmu_master_cfg *cfg)
> +{
> +	struct arm_smmu_master *master =3D container_of(cfg,
> +			                                      struct arm_smmu_master, cfg);
> +	return dev_iommu_fwspec_get(&master->of_node->dev);
> +}
> +
> static void parse_driver_options(struct arm_smmu_device *smmu)
> {
> 	int i =3D 0;
> @@ -779,8 +786,9 @@ static int register_smmu_master(struct arm_smmu_devic=
e *smmu,
> 				struct device *dev,
> 				struct of_phandle_args *masterspec)
> {
> -	int i;
> +	int i, ret =3D 0;
> 	struct arm_smmu_master *master;
> +	struct iommu_fwspec *fwspec;
>=20
> 	master =3D find_smmu_master(smmu, masterspec->np);
> 	if (master) {
> @@ -790,34 +798,37 @@ static int register_smmu_master(struct arm_smmu_dev=
ice *smmu,
> 		return -EBUSY;
> 	}
>=20
> -	if (masterspec->args_count > MAX_MASTER_STREAMIDS) {
> -		dev_err(dev,
> -			"reached maximum number (%d) of stream IDs for master device %s\n",
> -			MAX_MASTER_STREAMIDS, masterspec->np->name);
> -		return -ENOSPC;
> -	}
> -
> 	master =3D devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
> 	if (!master)
> 		return -ENOMEM;
> +	master->of_node =3D masterspec->np;
>=20
> -	master->of_node			=3D masterspec->np;
> -	master->cfg.num_streamids	=3D masterspec->args_count;
> +	ret =3D iommu_fwspec_init(&master->of_node->dev, smmu->dev);
> +	if (ret) {
> +		kfree(master);
> +		return ret;
> +	}
> +	fwspec =3D dev_iommu_fwspec_get(dev);
> +
> +	/* adding the ids here */
> +	ret =3D iommu_fwspec_add_ids(&masterspec->np->dev,
> +				   masterspec->args,
> +				   masterspec->args_count);
> +	if (ret)
> +		return ret;
>=20
> 	/* Xen: Let Xen know that the device is protected by an SMMU */
> 	dt_device_set_protected(masterspec->np);
>=20
> -	for (i =3D 0; i < master->cfg.num_streamids; ++i) {
> -		u16 streamid =3D masterspec->args[i];
> -
> -		if (!(smmu->features & ARM_SMMU_FEAT_STREAM_MATCH) &&
> -		     (streamid >=3D smmu->num_mapping_groups)) {
> -			dev_err(dev,
> -				"stream ID for master device %s greater than maximum allowed (%d)\n"=
,
> -				masterspec->np->name, smmu->num_mapping_groups);
> -			return -ERANGE;
> +	if (!(smmu->features & ARM_SMMU_FEAT_STREAM_MATCH)) {
> +		for (i =3D 0; i < fwspec->num_ids; ++i) {
> +			if (masterspec->args[i] >=3D smmu->num_mapping_groups) {
> +				dev_err(dev,
> +					"stream ID for master device %s greater than maximum allowed (%d)\n=
",
> +					masterspec->np->name, smmu->num_mapping_groups);
> +				return -ERANGE;
> +			}
> 		}
> -		master->cfg.streamids[i] =3D streamid;
> 	}
> 	return insert_smmu_master(smmu, master);
> }
> @@ -1390,6 +1401,7 @@ static int arm_smmu_master_configure_smrs(struct ar=
m_smmu_device *smmu,
> 	int i;
> 	struct arm_smmu_smr *smrs;
> 	void __iomem *gr0_base =3D ARM_SMMU_GR0(smmu);
> +	struct iommu_fwspec *fwspec =3D arm_smmu_get_fwspec(cfg);
>=20
> 	if (!(smmu->features & ARM_SMMU_FEAT_STREAM_MATCH))
> 		return 0;
> @@ -1397,15 +1409,14 @@ static int arm_smmu_master_configure_smrs(struct =
arm_smmu_device *smmu,
> 	if (cfg->smrs)
> 		return -EEXIST;
>=20
> -	smrs =3D kmalloc_array(cfg->num_streamids, sizeof(*smrs), GFP_KERNEL);
> +	smrs =3D kmalloc_array(fwspec->num_ids, sizeof(*smrs), GFP_KERNEL);
> 	if (!smrs) {
> -		dev_err(smmu->dev, "failed to allocate %d SMRs\n",
> -			cfg->num_streamids);
> +		dev_err(smmu->dev, "failed to allocate %d SMRs\n", fwspec->num_ids);
> 		return -ENOMEM;
> 	}
>=20
> 	/* Allocate the SMRs on the SMMU */
> -	for (i =3D 0; i < cfg->num_streamids; ++i) {
> +	for (i =3D 0; i < fwspec->num_ids; ++i) {
> 		int idx =3D __arm_smmu_alloc_bitmap(smmu->smr_map, 0,
> 						  smmu->num_mapping_groups);
> 		if (IS_ERR_VALUE(idx)) {
> @@ -1416,12 +1427,12 @@ static int arm_smmu_master_configure_smrs(struct =
arm_smmu_device *smmu,
> 		smrs[i] =3D (struct arm_smmu_smr) {
> 			.idx	=3D idx,
> 			.mask	=3D 0, /* We don't currently share SMRs */
> -			.id	=3D cfg->streamids[i],
> +			.id	=3D fwspec->ids[i],
> 		};
> 	}
>=20
> 	/* It worked! Now, poke the actual hardware */
> -	for (i =3D 0; i < cfg->num_streamids; ++i) {
> +	for (i =3D 0; i < fwspec->num_ids; ++i) {
> 		u32 reg =3D SMR_VALID | smrs[i].id << SMR_ID_SHIFT |
> 			  smrs[i].mask << SMR_MASK_SHIFT;
> 		writel_relaxed(reg, gr0_base + ARM_SMMU_GR0_SMR(smrs[i].idx));
> @@ -1443,12 +1454,13 @@ static void arm_smmu_master_free_smrs(struct arm_=
smmu_device *smmu,
> 	int i;
> 	void __iomem *gr0_base =3D ARM_SMMU_GR0(smmu);
> 	struct arm_smmu_smr *smrs =3D cfg->smrs;
> +	struct iommu_fwspec *fwspec =3D arm_smmu_get_fwspec(cfg);
>=20
> 	if (!smrs)
> 		return;
>=20
> 	/* Invalidate the SMRs before freeing back to the allocator */
> -	for (i =3D 0; i < cfg->num_streamids; ++i) {
> +	for (i =3D 0; i < fwspec->num_ids; ++i) {
> 		u8 idx =3D smrs[i].idx;
>=20
> 		writel_relaxed(~SMR_VALID, gr0_base + ARM_SMMU_GR0_SMR(idx));
> @@ -1465,16 +1477,17 @@ static int arm_smmu_domain_add_master(struct arm_=
smmu_domain *smmu_domain,
> 	int i, ret;
> 	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> 	void __iomem *gr0_base =3D ARM_SMMU_GR0(smmu);
> +	struct iommu_fwspec *fwspec =3D arm_smmu_get_fwspec(cfg);
>=20
> 	/* Devices in an IOMMU group may already be configured */
> 	ret =3D arm_smmu_master_configure_smrs(smmu, cfg);
> 	if (ret)
> 		return ret =3D=3D -EEXIST ? 0 : ret;
>=20
> -	for (i =3D 0; i < cfg->num_streamids; ++i) {
> +	for (i =3D 0; i < fwspec->num_ids; ++i) {
> 		u32 idx, s2cr;
>=20
> -		idx =3D cfg->smrs ? cfg->smrs[i].idx : cfg->streamids[i];
> +		idx =3D cfg->smrs ? cfg->smrs[i].idx : fwspec->ids[i];
> 		s2cr =3D S2CR_TYPE_TRANS |
> 		       (smmu_domain->cfg.cbndx << S2CR_CBNDX_SHIFT);
> 		writel_relaxed(s2cr, gr0_base + ARM_SMMU_GR0_S2CR(idx));
> @@ -1489,6 +1502,7 @@ static void arm_smmu_domain_remove_master(struct ar=
m_smmu_domain *smmu_domain,
> 	int i;
> 	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> 	void __iomem *gr0_base =3D ARM_SMMU_GR0(smmu);
> +	struct iommu_fwspec *fwspec =3D arm_smmu_get_fwspec(cfg);
>=20
> 	/* An IOMMU group is torn down by the first device to be removed */
> 	if ((smmu->features & ARM_SMMU_FEAT_STREAM_MATCH) && !cfg->smrs)
> @@ -1499,8 +1513,8 @@ static void arm_smmu_domain_remove_master(struct ar=
m_smmu_domain *smmu_domain,
> 	 * that it can be re-allocated immediately.
> 	 * Xen: Unlike Linux, any access to non-configured stream will fault.
> 	 */
> -	for (i =3D 0; i < cfg->num_streamids; ++i) {
> -		u32 idx =3D cfg->smrs ? cfg->smrs[i].idx : cfg->streamids[i];
> +	for (i =3D 0; i < fwspec->num_ids; ++i) {
> +		u32 idx =3D cfg->smrs ? cfg->smrs[i].idx : fwspec->ids[i];
>=20
> 		writel_relaxed(S2CR_TYPE_FAULT,
> 			       gr0_base + ARM_SMMU_GR0_S2CR(idx));
> @@ -1903,9 +1917,9 @@ static int arm_smmu_add_device(struct device *dev)
> 	struct arm_smmu_device *smmu;
> 	struct arm_smmu_master_cfg *cfg;
> 	struct iommu_group *group;
> +	struct iommu_fwspec *fwspec;
> 	void (*releasefn)(void *) =3D NULL;
> 	int ret;
> -
> 	smmu =3D find_smmu_for_device(dev);
> 	if (!smmu)
> 		return -ENODEV;
> @@ -1925,13 +1939,19 @@ static int arm_smmu_add_device(struct device *dev=
)
> 			goto out_put_group;
> 		}
>=20
> -		cfg->num_streamids =3D 1;
> +		ret =3D iommu_fwspec_init(dev, smmu->dev);
> +		if (ret) {
> +			kfree(cfg);
> +			goto out_put_group;
> +		}
> +		fwspec =3D dev_iommu_fwspec_get(dev);
> +
> 		/*
> 		 * Assume Stream ID =3D=3D Requester ID for now.
> 		 * We need a way to describe the ID mappings in FDT.
> 		 */
> 		pci_for_each_dma_alias(pdev, __arm_smmu_get_pci_sid,
> -				       &cfg->streamids[0]);
> +				       &fwspec->ids[0]);
> 		releasefn =3D __arm_smmu_release_pci_iommudata;
> 	} else {
> 		struct arm_smmu_master *master;
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthro=
ugh/device_tree.c
> index 999b831d90..a51ae3c9c3 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -140,6 +140,13 @@ int iommu_add_dt_device(struct dt_device_node *np)
>     if ( !ops )
>         return -EINVAL;
>=20
> +	/*
> +	 * This is needed in case a device has both the iommus property and
> +	 * also apperars in the mmu-masters list.
> +	 */
> +    if ( dt_device_is_protected(np) )
> +        return 0;
> +
>     if ( dev_iommu_fwspec_get(dev) )
>         return -EEXIST;
>=20
> --=20
> 2.17.1
>=20
>=20


