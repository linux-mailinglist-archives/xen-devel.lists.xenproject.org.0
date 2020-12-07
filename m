Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D272D0BD3
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 09:34:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45954.81516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmBy5-0001B7-Gg; Mon, 07 Dec 2020 08:34:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45954.81516; Mon, 07 Dec 2020 08:34:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmBy5-0001Ai-D7; Mon, 07 Dec 2020 08:34:01 +0000
Received: by outflank-mailman (input) for mailman id 45954;
 Mon, 07 Dec 2020 08:33:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ifa4=FL=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kmBy3-0001Ad-Mm
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 08:33:59 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::610])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3e3fff5-5b2e-4520-ac8e-b56472026524;
 Mon, 07 Dec 2020 08:33:56 +0000 (UTC)
Received: from AM3PR07CA0066.eurprd07.prod.outlook.com (2603:10a6:207:4::24)
 by DB6PR0801MB1749.eurprd08.prod.outlook.com (2603:10a6:4:3b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Mon, 7 Dec
 2020 08:33:53 +0000
Received: from AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:207:4:cafe::ca) by AM3PR07CA0066.outlook.office365.com
 (2603:10a6:207:4::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7 via Frontend
 Transport; Mon, 7 Dec 2020 08:33:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT006.mail.protection.outlook.com (10.152.16.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Mon, 7 Dec 2020 08:33:53 +0000
Received: ("Tessian outbound 6ec21dac9dd3:v71");
 Mon, 07 Dec 2020 08:33:53 +0000
Received: from 2e10e5fbd7a0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D1F5785B-FCC1-44D0-AAF8-1ACE814D98F4.1; 
 Mon, 07 Dec 2020 08:33:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2e10e5fbd7a0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Dec 2020 08:33:37 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB7PR08MB3611.eurprd08.prod.outlook.com (2603:10a6:10:4d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.23; Mon, 7 Dec
 2020 08:33:36 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::11cb:318b:f0a0:f125]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::11cb:318b:f0a0:f125%5]) with mapi id 15.20.3632.022; Mon, 7 Dec 2020
 08:33:36 +0000
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
X-Inumbo-ID: c3e3fff5-5b2e-4520-ac8e-b56472026524
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5x7ZIarv5NJNQsVwJ/NCQ2f8jE3i9jzD+g2YJKYMKlQ=;
 b=HJ+lOU6I9GcCYItnJ++6GtxEagPX7x5OLQFPzI2etUX+vI2wd+Wwr6HTedutpWdH3nwjz7Y5KkmgNxdCHtB+jg7brT6oML6+bKgBE7i3ZU8yEyhzVoB+efd9lsp93qnUggOHxVeu9QV434EFuQKQW1rYx00IYzPlnck6Q7ltaFk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d5d28cbf74b27c3f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPE2tInPFDhAMzHAkblyhFJ27/Tse3AkrqIw6kTCZ+sO5JOrnfpi0hlSNQe5N42t3no4G4Tbc6QarrX1YXpRsDF6PrVH2qHym877wVC4ijJd87xP+EZZgAupT/pGtziWh/J3fo+zkVpvm12qd4qzLR0XkaH3H1VltMfcNijwl/vaICgotOgU72n1bYa7WU1AtyG3T2fpjeRXxKiwlEqV2e76IvXes2dY8nxOKW5j6MiTsYQdJQM3qlcdEJ6mF4vJ2Cvi6xQJshSb2aQtreKoa7DVcyaFWm2+4RAOYwIG5dv1P6WEIg2BDNqM+v13lFnry87DStaOulB+FAzyoTx5bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5x7ZIarv5NJNQsVwJ/NCQ2f8jE3i9jzD+g2YJKYMKlQ=;
 b=WLCHfmKyfFIceH0Tfn/WdjtAnC0U32MSfEhJ/gD0p7Xr5pa+rnHTP8/sfxq4oU5UFOtZycTGTUquTJIGo/uvpjuF+D34h6JjIoYBINUigzw1yEEghRepH8xH7gwkcY3F1dDZ+n3rKkglPMc7S99AQCZ7a3vrXCCYO7AFKgOzpVT+9b3fubLEEyrl4wNML8vRxulPFctVONyXNUZY9l+OmydyGvBkQtHgW2z0Nb2Z5jqk0BBzBxL9mmhI+m6aIL7LOm3zIle2uPFc8CRGFw83C3ncVSVPZuQydw/UZbARk1KYwcoU4PhTBDwJt0pT0JDR7XN22Pr+TMgUnjpqmJ5OMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5x7ZIarv5NJNQsVwJ/NCQ2f8jE3i9jzD+g2YJKYMKlQ=;
 b=HJ+lOU6I9GcCYItnJ++6GtxEagPX7x5OLQFPzI2etUX+vI2wd+Wwr6HTedutpWdH3nwjz7Y5KkmgNxdCHtB+jg7brT6oML6+bKgBE7i3ZU8yEyhzVoB+efd9lsp93qnUggOHxVeu9QV434EFuQKQW1rYx00IYzPlnck6Q7ltaFk=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 8/8] xen/arm: Add support for SMMUv3 driver
Thread-Topic: [PATCH v2 8/8] xen/arm: Add support for SMMUv3 driver
Thread-Index:
 AQHWxBX/ttp8YMNqT0KunkbXuSldmKnjI/iAgADpk4CAAL+AgIAAr2CAgABFBACABZ2zgA==
Date: Mon, 7 Dec 2020 08:33:36 +0000
Message-ID: <15627C56-2A19-4392-AE7E-4DFE0B377354@arm.com>
References: <cover.1606406359.git.rahul.singh@arm.com>
 <de2101687020d18172a2b153f8977a5116d0cd66.1606406359.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2012011749550.1100@sstabellini-ThinkPad-T480s>
 <1912278a-13f4-885d-d1ca-cc130718d064@xen.org>
 <alpine.DEB.2.21.2012021958020.30425@sstabellini-ThinkPad-T480s>
 <BD247B69-7201-41E2-8687-49924B7396CA@arm.com>
 <alpine.DEB.2.21.2012031045420.32240@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2012031045420.32240@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 61950053-d3dd-4b1e-66cc-08d89a8ad46f
x-ms-traffictypediagnostic: DB7PR08MB3611:|DB6PR0801MB1749:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB17490E725E44ADDD8216ECF6FCCE0@DB6PR0801MB1749.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zrVBFlwPhUDt3f6Yc+BJDvghWM8J3ZartU5Yi1dLoyf9yszCblObY5gKOD+0WpPOii8EUtKmOYgsddsEj7ptjFkSXCAnA9EbgjnWDnPyVz9jOHHEX9tE4r7KrgoVWi+1FoiYJ1523gQbL89Q6fttgtr3fApm91njXbIIhcSfUAy0cddeJWUN4J975MXFZVNlSNlYWZ1ZBNRKgc/rGkR7M623LAiCGIObzitypoG6/asJp2dzlIHaRD6B+bbjq6j227oKYgHkxdxmu0UZoDes/ahvzy1hOHayvIytOWkSeKlsd4le0sjTIaHrxGFdPUfadXv8WGWe6oPDk1HPfhqu2oJlw/1cnuRdOW2lg3DhY6/YtlaFJVljDNCinZOJnzHb
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(8676002)(2906002)(7416002)(66446008)(316002)(86362001)(71200400001)(36756003)(33656002)(53546011)(186003)(54906003)(2616005)(6506007)(64756008)(6486002)(4326008)(478600001)(26005)(8936002)(6916009)(76116006)(5660300002)(66556008)(66476007)(83380400001)(91956017)(66946007)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?ihQsOPUiNsUzr+TJFiZFwEgsCDs/J3sYdxbTkP6kbnLuyrGJuxlges3R6FqC?=
 =?us-ascii?Q?PH5ji5Y4TvgCHfq+4K2OvCPaRqUn8QM/S35ndrtHKx/ALg9s7lgBK4rPqehh?=
 =?us-ascii?Q?EBf6jnqktUY43GMjZlM4aCreby9E+DYCZNqr5EYjGsO+HoLZconCkyCE8t7H?=
 =?us-ascii?Q?v65wFyLLkmBAvwLy16SyNxLLk/ORRZt5MbUh7CZ8Y3kQa8OY0raIM0R+XLvj?=
 =?us-ascii?Q?QnCDqMVeBoXDLV2Qx3gOe2w8pjXW/cmAX4T2ppuPgRX7aNymg9a1zmy5Xoma?=
 =?us-ascii?Q?sCNMlBmvvSm1C7Y9G8f+04ftHoYOT5BsYLWrllwCqsVuox2WaSuJtmlcx/DP?=
 =?us-ascii?Q?cjVWDbVXAr6/Wb/V2Midf/PGqlPDS/kiDAy8ubYble8jrjAVfwrwsOU5yvJV?=
 =?us-ascii?Q?1AY8tXPlI4V2+XUoruq7w3jhgC1/BpTFWCVuPnlBw45cFIZdyEj5uQM2EtQm?=
 =?us-ascii?Q?jxlo+LXcS8Oqw2s8yMtkTQn2oRwp0kjXZE5rD77Cf/jNC87/3ldIx+xpchlF?=
 =?us-ascii?Q?xKnhYipGeRojkFYqEX6CcnG0itaqk0/Er0DxZXnNnnF2g+QvgdJFtc7KHJeo?=
 =?us-ascii?Q?AU4y+V0HrUfeewAKCgPiTDjgvhJaF45sT7P/XjkpCmv05fVUFTuPWc5R2Few?=
 =?us-ascii?Q?gs5NHdY7gBrGwdlJOUVfBBdlQwoatki9k6cnlijEqvx8VpUea4vjnrYV7Ysz?=
 =?us-ascii?Q?59oAzRiVUv+Jzwt2nER+9IRJ8MBJNWiXDMPAsRJRC0p2UoBnx5bs4fA93X8J?=
 =?us-ascii?Q?K0NKfyFYYoKlO4wTZRPI/qTGanVCPsoDbwY6z+4sN23VBwDWT1L5kF/65INx?=
 =?us-ascii?Q?HZP5EGKNqd6ISxMmKS8shLCFTK5DQz6btzXgKwU9lUwEN+R/psW4PTScrQyu?=
 =?us-ascii?Q?0CuP2sJOj6MYBJUKMtv47fgujE0WSMcOYA+3tlJJmux7+DdTzf3tACoIT8o/?=
 =?us-ascii?Q?FmUo084Vlyonjwbhho2TabZ+EP63hhMD/dO2eCEvk//j91HVG5BOFdydQtR+?=
 =?us-ascii?Q?T6sw?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0E17C025B865C84DA81F4BE6E3724A79@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3611
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a0dd0df7-8723-4111-5832-08d89a8aca45
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6FJlmOKq0cPsPtnhCYe1oGg64EODl847gfPJFc8TnWRyU+RO7toTFaQAZvNMLYJ7RUYbKg+rmaEJCA7fIysFuTXAGgzWEn6gvA1VQ2xtXxtRKgwaGFlTYkQUDkI7TJhnU1jsiYFtTdYuRrYH7JW8W01UAYPlKbm2eRGqJ8Qm3zekws3E/EF1k4B2t7p2Ur6786t1uqmYT21VnLSUy4GliexadZBVLewg+Ygdf9msCCCkb8GfBHwbEbMdACID8RigSvzE2g4z+/LZrFdi/fecPN/0cX5IcVKxPuftkIL569VL6WD/gk1/00aCOgAxsfdwX6xp/nwSbuQRfpkYAja6pOKYhmHOnsjhfcpigmj0unolYX5dFWFfWhSvzR8dcpKZGz+seUyDqUPxOIPa6iDTzQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(46966005)(356005)(33656002)(6486002)(81166007)(82740400003)(26005)(86362001)(47076004)(82310400003)(5660300002)(83380400001)(70586007)(70206006)(36756003)(6506007)(6862004)(4326008)(2616005)(336012)(186003)(107886003)(2906002)(53546011)(8936002)(54906003)(6512007)(478600001)(316002)(36906005)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2020 08:33:53.2600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61950053-d3dd-4b1e-66cc-08d89a8ad46f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1749

Hello Stefano,

> On 3 Dec 2020, at 6:47 pm, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>=20
> On Thu, 3 Dec 2020, Rahul Singh wrote:
>>> On 3 Dec 2020, at 4:13 am, Stefano Stabellini <sstabellini@kernel.org> =
wrote:
>>> On Wed, 2 Dec 2020, Julien Grall wrote:
>>>> On 02/12/2020 02:51, Stefano Stabellini wrote:
>>>>> On Thu, 26 Nov 2020, Rahul Singh wrote:
>>>>>> +/* Alias to Xen device tree helpers */
>>>>>> +#define device_node dt_device_node
>>>>>> +#define of_phandle_args dt_phandle_args
>>>>>> +#define of_device_id dt_device_match
>>>>>> +#define of_match_node dt_match_node
>>>>>> +#define of_property_read_u32(np, pname, out) (!dt_property_read_u32=
(np,
>>>>>> pname, out))
>>>>>> +#define of_property_read_bool dt_property_read_bool
>>>>>> +#define of_parse_phandle_with_args dt_parse_phandle_with_args
>>>>>=20
>>>>> Given all the changes to the file by the previous patches we are
>>>>> basically fully (or almost fully) adapting this code to Xen.
>>>>>=20
>>>>> So at that point I wonder if we should just as well make these change=
s
>>>>> (e.g. s/of_phandle_args/dt_phandle_args/g) to the code too.
>>>>=20
>>>> I have already accepted the fact that keeping Linux code as-is is near=
ly
>>>> impossible without much workaround :). The benefits tends to also limi=
ted as
>>>> we noticed for the SMMU driver.
>>>>=20
>>>> I would like to point out that this may make quite difficult (if not
>>>> impossible) to revert the previous patches which remove support for so=
me
>>>> features (e.g. atomic, MSI, ATS).
>>>>=20
>>>> If we are going to adapt the code to Xen (I'd like to keep Linux code =
style
>>>> though), then I think we should consider to keep code that may be usef=
ul in
>>>> the near future (at least MSI, ATS).
>>>=20
>>> (I am fine with keeping the Linux code style.)
>>>=20
>>> We could try to keep the code as similar to Linux as possible. This
>>> didn't work out in the past.
>>>=20
>>> Otherwise, we could fully adapt the driver to Xen. If we fully adapt th=
e
>>> driver to Xen (code style aside) it is better to be consistent and also
>>> do substitutions like s/of_phandle_args/dt_phandle_args/g. Then the
>>> policy becomes clear: the code comes from Linux but it is 100% adapted
>>> to Xen.
>>>=20
>>>=20
>>> Now the question about what to do about the MSI and ATS code is a good
>>> one. We know that we are going to want that code at some point in the
>>> next 2 years. Like you wrote, if we fully adapt the code to Xen and
>>> remove MSI and ATS code, then it is going to be harder to add it back.
>>>=20
>>> So maybe keeping the MSI and ATS code for now, even if it cannot work,
>>> would be better. I think this strategy works well if the MSI and ATS
>>> code can be disabled easily, i.e. with a couple of lines of code in the
>>> init function rather than #ifdef everywhere. It doesn't work well if we
>>> have to add #ifdef everywhere.
>>>=20
>>> It looks like MSI could be disabled adding a couple of lines to
>>> arm_smmu_setup_msis.
>>>=20
>>> Similarly ATS seems to be easy to disable by forcing ats_enabled to
>>> false.
>>>=20
>>> So yes, this looks like a good way forward. Rahul, what do you think?
>>=20
>>=20
>> I am ok to have the PCI ATS and MSI functionality in the code.=20
>> As per the discussion next version of the patch will include below modif=
ication:Please let me know if there are any suggestion overall that should =
be added in next version.
>>=20
>> 1. Keep the PCI ATS and MSI functionality code.
>=20
> I'll repeat one point I wrote above that I think it is important: please
> try to disable ATS and MSI without invasive changes, ideally just a
> couple of lines to force-disable each feature

Yes I will disable the feature.
>=20
>=20
>> 2. Make the code with XEN compatible ( remove linux compatibility functi=
ons)
>> 3. Keep the Linux coding style for code imported from Linux.
>> 4. Fix all comments.
>=20
> Sounds good.
>=20
>=20
>> I have one query what will be coding style for new code to make driver w=
ork  for XEN ?=20
>=20
> We try to keep the same code style for the entirety of a source file. In
> this case, the whole driver should use Linux code style (both imported
> code and new code).

Ok.

Regards,
Rahul	=

