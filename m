Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 066D92CD96E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 15:41:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43674.78515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkpnA-0005J9-Oc; Thu, 03 Dec 2020 14:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43674.78515; Thu, 03 Dec 2020 14:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkpnA-0005Ih-L8; Thu, 03 Dec 2020 14:41:08 +0000
Received: by outflank-mailman (input) for mailman id 43674;
 Thu, 03 Dec 2020 14:41:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lp8G=FH=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kkpn9-0005Ia-CZ
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 14:41:07 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0a::617])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4de35079-8899-4e82-8ee5-5ba0336f7a0b;
 Thu, 03 Dec 2020 14:41:04 +0000 (UTC)
Received: from AM7PR03CA0028.eurprd03.prod.outlook.com (2603:10a6:20b:130::38)
 by AM9PR08MB6178.eurprd08.prod.outlook.com (2603:10a6:20b:2db::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 3 Dec
 2020 14:41:03 +0000
Received: from VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::1a) by AM7PR03CA0028.outlook.office365.com
 (2603:10a6:20b:130::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Thu, 3 Dec 2020 14:41:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT027.mail.protection.outlook.com (10.152.18.154) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 14:41:02 +0000
Received: ("Tessian outbound eeda57fffe7b:v71");
 Thu, 03 Dec 2020 14:41:02 +0000
Received: from 710a84054e98.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D7103A9B-3D38-4A88-8B89-EED90E2EC165.1; 
 Thu, 03 Dec 2020 14:40:53 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 710a84054e98.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 03 Dec 2020 14:40:53 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB6PR0802MB2373.eurprd08.prod.outlook.com (2603:10a6:4:88::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Thu, 3 Dec
 2020 14:40:52 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef%2]) with mapi id 15.20.3611.032; Thu, 3 Dec 2020
 14:40:52 +0000
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
X-Inumbo-ID: 4de35079-8899-4e82-8ee5-5ba0336f7a0b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ue0/iuRhkVWpmecHb9dHIihavIffILaG6rZxd8e8ZrM=;
 b=NiJWZw3qewqqT1bXXiQr4Lm4hQYqotX/TiTmqwUKRGCCdLwe+G6Y1zXc6WiCYvsynj3PLi/RIS/YaUt7Pc4u2ldHvdAj4gmchVKN2fTjqXGEXIWMV2uqc0YDDAxusOxJ8f8M5hBrv67cj6aicLsrQmXVFx1fYUTyU4uZLmBO478=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a059175dd3e48f16
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dubxOheaD9+CNokSz2MrZ9jW3oT8iZe0oX5VO1hIZYa1MniypN22+VCFqs7M6vhEtHX2tKV5r/JzlA9cbaaSm3p+ErR5G381QZyAwwa9RWoMWvXrU0zkPIWPENXLla/+PqxpccM/K7MX+1NW6EDQkuzp9aHz+uHKEiqzrU8KSaUYSFRa/wi9F4gdJEXRoObgoY5DNr9ZJ2DJEOx0uFk667CRm6HI4ewcwAtg1aG7GjxLfdvMekaoqNYP06zOWJqXhn4QfTC933HgQJDcqHT94U1EkJ2E1iE/9sgpO2g0NAv1ec8s1025wqA3GydMFr06z1YwKRMed6c2kL+6n/BjYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ue0/iuRhkVWpmecHb9dHIihavIffILaG6rZxd8e8ZrM=;
 b=Ywtzv0dQcv+IcssqBrxd2MH1WKwi/BjCml7NuNy5RQixG7YJYlRHJGi9TvlGHS5qOZYIrKoclMrMaMPa/hzK4aqO9lsDwxo1RTQeZZyeSL7hbX2ApAcZkeGerENXoIPiYDshDB1t+HzluuWQOkonte8qvYw71aFjn8PYzSH84DhUpn+jTCZFIU64zgFuxHPdam/Mz3UTaWbpRyAgnn/3Y5HH2G+TAM+DT/7U7F40TtKM+rkfMarXf9yCb5rGbyohTivs+SGxqTy87ejgP/2nJCOhF4GDCRaCgSaAE4nJO34thGJwtV3ccOLoxM+gbeB7O0NkxTifMmruhd5Qbg4FIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ue0/iuRhkVWpmecHb9dHIihavIffILaG6rZxd8e8ZrM=;
 b=NiJWZw3qewqqT1bXXiQr4Lm4hQYqotX/TiTmqwUKRGCCdLwe+G6Y1zXc6WiCYvsynj3PLi/RIS/YaUt7Pc4u2ldHvdAj4gmchVKN2fTjqXGEXIWMV2uqc0YDDAxusOxJ8f8M5hBrv67cj6aicLsrQmXVFx1fYUTyU4uZLmBO478=
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
Thread-Index: AQHWxBX/ttp8YMNqT0KunkbXuSldmKnjI/iAgADpk4CAAL+AgIAAr2CA
Date: Thu, 3 Dec 2020 14:40:52 +0000
Message-ID: <BD247B69-7201-41E2-8687-49924B7396CA@arm.com>
References: <cover.1606406359.git.rahul.singh@arm.com>
 <de2101687020d18172a2b153f8977a5116d0cd66.1606406359.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2012011749550.1100@sstabellini-ThinkPad-T480s>
 <1912278a-13f4-885d-d1ca-cc130718d064@xen.org>
 <alpine.DEB.2.21.2012021958020.30425@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2012021958020.30425@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 53a69dd4-ca16-4cde-2bec-08d897997572
x-ms-traffictypediagnostic: DB6PR0802MB2373:|AM9PR08MB6178:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB61784266CBC5085DBCC671F3FCF20@AM9PR08MB6178.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OHNjpZFZgI30B+pF+DdIfr4Xd+2FmUCCb0dhmTi8ikug4Gn/1TLkzzC1OPgM6kttZITdT2LrO6DMUEEWD8GH/OCQMT6+/xAHqCR+AtfXy21iF8wkRZ8yxuqoyvaPdRTjdbONm63bcojpA3M6nyll3z4iIy4j0us7KrX0A4L11rJ3CAqm3C6HFc375AyeSu7fBjxbREuNAO2WUOLzPxB42Mqj8+P+xWSVvNFc6xk9MOpZ8vWS4LI0RI1nKduETRqlnM3ziLVpwHf4DTWODc/dTCWfq9eiJx8lifAFAtFoj5zcmhWqf0daBstpE3ryAk2LtEGdM0gaJFuVL339ielbhAOEs1Vqb6M6ndj5sNsXsiUg4bikduCI57bXC6rQL8hF
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(366004)(376002)(136003)(4326008)(66476007)(6512007)(2616005)(64756008)(71200400001)(66556008)(66446008)(76116006)(6506007)(26005)(316002)(91956017)(83380400001)(53546011)(66946007)(2906002)(186003)(6486002)(6916009)(478600001)(8676002)(36756003)(86362001)(54906003)(5660300002)(33656002)(7416002)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?4qL4vUn0/5iPCDOZ4TmRth98yO40ouSv5oKezwTDjCsBgaFz4mwF3Ub8zWzY?=
 =?us-ascii?Q?HHSkKzvDk/1/d81bevituyLKGS+Fv1bO2o1BbZ3krEBTLOVnLw0yE3R6v3Do?=
 =?us-ascii?Q?+pXlFS78uQm3b1ZUoSbchMvwSE6euLCk7q71iO6dc9qf4y66RAEBOhefC2Q3?=
 =?us-ascii?Q?3QD/3Dd7ySxal4/hhSq3OJ1Th9Lw6F9VQmvaTgvDGyoGntNDtLNGt8gtEw89?=
 =?us-ascii?Q?Wjv5B6FAhrJ3D+yv3Xt/1Mhj6MMXVOootMRcVH6+kZ1/Ea5rXF1AwMCpxRpF?=
 =?us-ascii?Q?rJSxiTSoPkNG26lKSAgdl3kehK4+hry9lVlogwwZ0qPQoM6/3hSp3EGPwUkI?=
 =?us-ascii?Q?dKsSyQOdRk32aWTcnXmhp5RqGiJRrySbXxRomy43UCH4qOqsw97MXA2utdMV?=
 =?us-ascii?Q?3rNqbrxKU7DJsnjs+oOfTcE3sZpXVWTsVwmBkafaGFTLtFik4RvUBNjW5J2i?=
 =?us-ascii?Q?b3INKa6LFjnMZtZ0V0AwpaNQXYC8mOr4F7BJ0JIbj3lyovbzrmr8b0W98hPj?=
 =?us-ascii?Q?shzDG98ljwJWIMPUlDEQBwewhNJ9AVlkSIZB8dBly7wv0T3TKY4XUKFd9gsj?=
 =?us-ascii?Q?eK9dVjAqhNCWyxATJ4UEkxOOzS66TVUDBJp/w4qtFc3DvRXA1vnmFgKYtx3w?=
 =?us-ascii?Q?Av2iTI+9HDaXqjamXVeavEbnQIi3dE+v+487//34hBvWPuTN2KQfbWRxSmzt?=
 =?us-ascii?Q?25rLgNX+3bLqf/tN5zoENzfIoRKHFJLoCst4J8NQpOz+HTL3P6nMDh+HqGoW?=
 =?us-ascii?Q?XzGrycn0pxOHANauTO4lPxApq/+GfOrZPWtbS5gmh4jE1RFYo9Wsz3Jx/oJf?=
 =?us-ascii?Q?TROsgp8KelyyQ989dx1lxFPyiBhLCQ1AzHwrnTsoHvXXY7uVt9Zqu032rSum?=
 =?us-ascii?Q?z+RQoeoxdSWJC+cl9f1XudFiM1yBt/2LaGJEql9+Ry5giwMaULNIqzf/sBS1?=
 =?us-ascii?Q?mBfMzK4kl0nMEfEH93N3tcp79UyIiGsqVIOZzPzm9Z052+gt6iGwFKAiW8nk?=
 =?us-ascii?Q?ejGI?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5D147D03E4E7D843A002A6F2D41ACF76@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2373
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ce35f04c-c2e9-43ee-e50e-08d897996f36
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yiUOseK4r7M0FbgnDlNXfaijG/ImF1dg1gcRe5qPtVz3PXRCp2wfNhxG8Q5D2+nLeeRNZEy8TSGK9MWBZFDe7Cu8EywTFpLgnoPXNcwRM93XnviWSGS63xk9lSyxr0TavAdA2SfR7myFRHT0JApKIgEnlQrGY/zUJNpE63cnBFv+Ey2X+qmMPNNCEGiSP4IJrBRvYBjZpJfM8ydYw6Xwen2Czn1iCLEJPyeaOxklSTaxw24pOHdgcMICdo9dy5NSyvSrue7au30Yv8zboaMY+3fgU3kcqGQrnx9Yb2iQTcwPwEMNl86OXxcgz1r8W66NxxCqZ4hfyeK81Je15bLi8ThZCJ/RSKi8+qBN27lLGYWsNMCJGomwtcPsJ27nZ3M0lW7qz3qGmxTnaBhU5pR1QQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(376002)(396003)(46966005)(6512007)(33656002)(6506007)(82740400003)(2616005)(4326008)(186003)(8676002)(6862004)(53546011)(8936002)(26005)(107886003)(478600001)(316002)(70586007)(2906002)(70206006)(336012)(54906003)(5660300002)(6486002)(82310400003)(36756003)(81166007)(47076004)(86362001)(356005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 14:41:02.7832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a69dd4-ca16-4cde-2bec-08d897997572
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6178

Hello Stefano,

> On 3 Dec 2020, at 4:13 am, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>=20
> On Wed, 2 Dec 2020, Julien Grall wrote:
>> On 02/12/2020 02:51, Stefano Stabellini wrote:
>>> On Thu, 26 Nov 2020, Rahul Singh wrote:
>>>> +/* Alias to Xen device tree helpers */
>>>> +#define device_node dt_device_node
>>>> +#define of_phandle_args dt_phandle_args
>>>> +#define of_device_id dt_device_match
>>>> +#define of_match_node dt_match_node
>>>> +#define of_property_read_u32(np, pname, out) (!dt_property_read_u32(n=
p,
>>>> pname, out))
>>>> +#define of_property_read_bool dt_property_read_bool
>>>> +#define of_parse_phandle_with_args dt_parse_phandle_with_args
>>>=20
>>> Given all the changes to the file by the previous patches we are
>>> basically fully (or almost fully) adapting this code to Xen.
>>>=20
>>> So at that point I wonder if we should just as well make these changes
>>> (e.g. s/of_phandle_args/dt_phandle_args/g) to the code too.
>>=20
>> I have already accepted the fact that keeping Linux code as-is is nearly
>> impossible without much workaround :). The benefits tends to also limite=
d as
>> we noticed for the SMMU driver.
>>=20
>> I would like to point out that this may make quite difficult (if not
>> impossible) to revert the previous patches which remove support for some
>> features (e.g. atomic, MSI, ATS).
>>=20
>> If we are going to adapt the code to Xen (I'd like to keep Linux code st=
yle
>> though), then I think we should consider to keep code that may be useful=
 in
>> the near future (at least MSI, ATS).
>=20
> (I am fine with keeping the Linux code style.)
>=20
> We could try to keep the code as similar to Linux as possible. This
> didn't work out in the past.
>=20
> Otherwise, we could fully adapt the driver to Xen. If we fully adapt the
> driver to Xen (code style aside) it is better to be consistent and also
> do substitutions like s/of_phandle_args/dt_phandle_args/g. Then the
> policy becomes clear: the code comes from Linux but it is 100% adapted
> to Xen.
>=20
>=20
> Now the question about what to do about the MSI and ATS code is a good
> one. We know that we are going to want that code at some point in the
> next 2 years. Like you wrote, if we fully adapt the code to Xen and
> remove MSI and ATS code, then it is going to be harder to add it back.
>=20
> So maybe keeping the MSI and ATS code for now, even if it cannot work,
> would be better. I think this strategy works well if the MSI and ATS
> code can be disabled easily, i.e. with a couple of lines of code in the
> init function rather than #ifdef everywhere. It doesn't work well if we
> have to add #ifdef everywhere.
>=20
> It looks like MSI could be disabled adding a couple of lines to
> arm_smmu_setup_msis.
>=20
> Similarly ATS seems to be easy to disable by forcing ats_enabled to
> false.
>=20
> So yes, this looks like a good way forward. Rahul, what do you think?


I am ok to have the PCI ATS and MSI functionality in the code.=20
As per the discussion next version of the patch will include below modifica=
tion:Please let me know if there are any suggestion overall that should be =
added in next version.

1. Keep the PCI ATS and MSI functionality code.
2. Make the code with XEN compatible ( remove linux compatibility functions=
)
3. Keep the Linux coding style for code imported from Linux.
4. Fix all comments.

I have one query what will be coding style for new code to make driver work=
  for XEN ?=20


>=20
>=20
>=20
>>>> +#define FIELD_GET(_mask, _reg)          \
>>>> +    (typeof(_mask))(((_reg) & (_mask)) >> (__builtin_ffsll(_mask) - 1=
))
>>>> +
>>>> +#define WRITE_ONCE(x, val)                  \
>>>> +do {                                        \
>>>> +    *(volatile typeof(x) *)&(x) =3D (val);    \
>>>> +} while (0)
>>>=20
>>> maybe we should define this in xen/include/xen/lib.h
>>=20
>> I have attempted such discussion in the past and this resulted to more
>> bikeshed than it is worth it. So I would suggest to re-implement WRITE_O=
NCE()
>> as write_atomic() for now.
>=20
> Good suggestion, less discussions more code :-)

I will use the write_atomic.

Regards,
Rahul



