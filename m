Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2272D6060
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 16:50:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49481.87515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knOD2-0006H2-RS; Thu, 10 Dec 2020 15:50:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49481.87515; Thu, 10 Dec 2020 15:50:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knOD2-0006Gd-Nu; Thu, 10 Dec 2020 15:50:24 +0000
Received: by outflank-mailman (input) for mailman id 49481;
 Thu, 10 Dec 2020 15:50:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/MM=FO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1knOD1-0006GY-A1
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 15:50:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.78]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 37f1ddea-58ff-46a8-b0c5-c3f26560992f;
 Thu, 10 Dec 2020 15:50:22 +0000 (UTC)
Received: from DB7PR05CA0063.eurprd05.prod.outlook.com (2603:10a6:10:2e::40)
 by AM0PR08MB5362.eurprd08.prod.outlook.com (2603:10a6:208:180::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Thu, 10 Dec
 2020 15:50:20 +0000
Received: from DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::9a) by DB7PR05CA0063.outlook.office365.com
 (2603:10a6:10:2e::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Thu, 10 Dec 2020 15:50:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT012.mail.protection.outlook.com (10.152.20.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 15:50:20 +0000
Received: ("Tessian outbound fc5cc0046d61:v71");
 Thu, 10 Dec 2020 15:50:20 +0000
Received: from e1da092aec17.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A9E26798-CEF6-4CAA-969A-0A8D6E9D0A7D.1; 
 Thu, 10 Dec 2020 15:49:51 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e1da092aec17.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Dec 2020 15:49:51 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1798.eurprd08.prod.outlook.com (2603:10a6:4:3c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 10 Dec
 2020 15:49:49 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 15:49:49 +0000
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
X-Inumbo-ID: 37f1ddea-58ff-46a8-b0c5-c3f26560992f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zm9M4Gm06IJ1PiQn+j/Tr0+qmJf3CBRgdTVfNx51KG0=;
 b=I7A8qy7ynmHGOcH2AoM45r40DSR2xmE7YzThUOOl1SFqGLGd9JVbKeulcg5WlVwzJgEbhUiRZMxtJf8dCC0iiZp12yGhyaVuEa7/eucX+uNrstoVLJvqDEulqKjKFLJmtJ7WHOD0l3OgJFIZS9g+3J3WjFZUPDQQenuxvEikw7I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ff05f758596b8a88
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AdJlWe3Hgdfgld1eoZUTICgQ9tZRKRxS5YdS4kdYebi9W2ubVZZffKIN+Wjzeg8Nl4ScTR+WecHPGrJZ4uG3G3KNc/r6GevibdPJbPwSUAjgbcFzdDmkcoY7cxptOyePZt5vnC3UvPVmfEuD4nwjfCbAspojDxUiXyCvZfM2jzAI77jDjgPaFMrfdnNmaCDthd1S6GoaZjdjPtcOYJNUyje/oqMRNQOqx11DhT1m3tNxL3+zpa0qfqF2sMZERSBmKemhFUhrrxamx+tJExkkJHgVwV6MVyPJRbaAZeZnvFzxXIdX8Wrx8Di6/pWYsYaBahssQl8YudGRvper5PSzsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zm9M4Gm06IJ1PiQn+j/Tr0+qmJf3CBRgdTVfNx51KG0=;
 b=PbPt+x3/WKmHUnMkHpckdgIIRU7/8RQH7s9y/4k3gEGYNO1KM2k+y4BesXMCY5/8U9ZXgK8rr3HUbH7VHEek98uE+YpxPWGcqHlaj3N7HuxwOyOxbxCdIyQYW2CaCCqsP7+vKn4u4l62iX4njlmCz8UbXBtvALL83sFs5ritm8d9yP5fh5eks6YnyIAoXOv8ezY4x+b185DOK6IWF5xIXGY5IubfM7fQo8BGyeaHb8Jzl1KdkuVmVyTSsPgnoQa4Z82tn+b9CO1PXqu6WZ/RL4H0A+xnQSRgmC+IJlNr84Hm9+Q6XsYP8J3c1IkMSGf7+WRY9nSRE0v1t6Y/DT/V+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zm9M4Gm06IJ1PiQn+j/Tr0+qmJf3CBRgdTVfNx51KG0=;
 b=I7A8qy7ynmHGOcH2AoM45r40DSR2xmE7YzThUOOl1SFqGLGd9JVbKeulcg5WlVwzJgEbhUiRZMxtJf8dCC0iiZp12yGhyaVuEa7/eucX+uNrstoVLJvqDEulqKjKFLJmtJ7WHOD0l3OgJFIZS9g+3J3WjFZUPDQQenuxvEikw7I=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 3/7] xen/arm: create a cpuinfo structure for guest
Thread-Topic: [PATCH v3 3/7] xen/arm: create a cpuinfo structure for guest
Thread-Index: AQHWzklW+4XymezDRUeCGhvhzW8UY6nvZ8mAgAET0oA=
Date: Thu, 10 Dec 2020 15:49:49 +0000
Message-ID: <873A3EA8-DAE4-49AD-840B-1832E0249DCC@arm.com>
References: <cover.1607524536.git.bertrand.marquis@arm.com>
 <33f39e7f521e6f73a0dba57a8be9fb50656e1807.1607524536.git.bertrand.marquis@arm.com>
 <6cf80971-e9aa-f9e4-cb9b-4f102b84a99b@xen.org>
In-Reply-To: <6cf80971-e9aa-f9e4-cb9b-4f102b84a99b@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b9b24715-21c7-4546-148c-08d89d234c4e
x-ms-traffictypediagnostic: DB6PR0801MB1798:|AM0PR08MB5362:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB53624E1803889BB98D2131CB9DCB0@AM0PR08MB5362.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tsqVm3N5sQaGD7pF0S3fPDePZdyrCl1wKAF/etxJYKGxn+rVavg38UQE5kmZvESe1m2Rj2tvKJzyrc7z19sXxmCV6X0V3Q3+Qhz08UKSRXJXBVYTyr59SSyeApXChx5a2dmQi3vzY0IcYFTaeY9czLxx+Nji000ngcUGgrMhpluUhq11kGvOj1XQKKrNJxUaGF99JFvjv1OG8bOXX9+QPbMgDPyZSZBYE9nOGz+EnIbQwwegGSIiD94IqufwUGPj66MmObNIBR2kLC7+rfZsa4d17YiAQIeMmNQrUM0mLqCov9puk5jAvRipo9fyle1qpmHYFnqnC1/WNvXxvCG92efMOZledCN7trAVjpbDx/JFWRonTG8XDxJPMOKYjexO
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(8936002)(36756003)(66476007)(76116006)(4326008)(66446008)(64756008)(66556008)(91956017)(2906002)(71200400001)(8676002)(26005)(6506007)(5660300002)(186003)(2616005)(316002)(33656002)(54906003)(53546011)(6916009)(4744005)(478600001)(86362001)(6486002)(6512007)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?iJWbYLZ8DI0DPOo2dSlyeGCPO92F/cjrpjg+mEN2bO0Yf+7pnCPItbKCXCAF?=
 =?us-ascii?Q?cfANoLUu1Je8otUoTfIIByLT311NKKJVHrTx66ZP5SGGo5j649l2ADORZLPn?=
 =?us-ascii?Q?h48k38eeMdph4WqdMBn9LTPcaYn00HREvUpSwMTtCHNhFREIjnPgDMX3FYda?=
 =?us-ascii?Q?x5WZjiSylbsiepJ7FVrrXxtsq7twOp0RB45A44HGPesN8kdAuLPe1lw3U8IY?=
 =?us-ascii?Q?W33Uctu627wvgKDxWNScu7L70NhTQTch+yWs456WQ3ApXaYv/NCZe+RIxuEC?=
 =?us-ascii?Q?UNC3c35rlLWuqz8f2cs48sge0vo8/ViSTEeXh0fOBVDJiYg94fd+PtymIVS8?=
 =?us-ascii?Q?sBkuWUUTntpqYaPbEUQlkGnDs/PJu2Pn73IdfpUfCuiVkOWexuHKi7i0AWwe?=
 =?us-ascii?Q?o+TUhbD96wFgHm1GWcwvWiuLYtOiXmIVQ0BiPicwB/lLmz366hR/akJEkUuR?=
 =?us-ascii?Q?bQ1OZaBEregdt6brLDq14UAAhRnfhwLrmtyPB9n8zvn6uUGbVcPI0yFw+Ho+?=
 =?us-ascii?Q?6ENEajCCHXe3PTsl5OQ6XW9ddXV7bpKsb5wYgdnkCapi1/fOxcjxH8xxNUUi?=
 =?us-ascii?Q?Ry7l6XzfBbYDrlcGoG53xtZ45qjrGuN7vJP2zA5H77yJH7QIzIOR+t2QUaCw?=
 =?us-ascii?Q?/K2y7B5qAZPlM8PjmVbjF3r4AIIJw8JvzCiObW9GtRck59WA0BhqoZo4WwD5?=
 =?us-ascii?Q?dCIeU3Di/tio5GRL+P55rlaOt+oo8vToscgmG7/NSGNdbeEeopnPkDExdjum?=
 =?us-ascii?Q?44dBfhVWGX+CBHuQwVehBcYHI3br+GXOB06belNZ3og1G1fGeT3eeMJK+Jmu?=
 =?us-ascii?Q?/vT5RIDgorSMDQ90ix9J0/3xfHaRmT8mKIK+BOFP+FrnDTn7oN6Im+20r6CS?=
 =?us-ascii?Q?0CncFueuyxveGHMQvgKG2GDgdgTpVTx2CR8EkJ2ohffJX/vhBlo4AuYGKUVl?=
 =?us-ascii?Q?SFWACHlP9XDIJgPpVuSmZJKZpsH3zGf7shvQa2BULp4Me+rKYK+XqnyExlD+?=
 =?us-ascii?Q?eSNW?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <682C7DF4E953474180E26C965E61A79A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1798
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	59ecd4c5-3335-4160-8d63-08d89d2339fd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fsuX3KM/MD0LdsQEqEyZQDKDXOwB36W97HPKtiFzQqBxBwxAWuErzTQtVt4seOT6ZOx9jBfseefjO9AgqK2M9ljW+28QHEzuIWj3LDrf7Xe3lCI0OuaxiSusIWYSsU8QDXo2wJRswJXOzWd4AtAzpofSPoDYl4psLMVl/jH9y2FJPoWhWUgd86bK7z5/QBug9FFB4JQ2RyE47CxbXFtV5XdCRTPVPgbi/mDTXpRW8BdbQAdBL52WQNNRqi1dtqcGvlxg8Go/1GiLjm3DRd2mJML0t19chp2mD5x05SpVS2CGi7rFOWj1n4lay6ixgIWwOyJ62mooxVJN76iVQw8KC9DfktjzvLYxe48cNNFWgez6NA6d2Eq9RDxMtxs0NJTb3E+vqRIBdOIrQ2LajmmTjA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(46966005)(316002)(6862004)(336012)(8936002)(82740400003)(107886003)(6486002)(186003)(478600001)(47076004)(2906002)(82310400003)(4326008)(70586007)(70206006)(6506007)(54906003)(356005)(2616005)(86362001)(8676002)(5660300002)(26005)(33656002)(4744005)(6512007)(53546011)(81166007)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 15:50:20.2466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b24715-21c7-4546-148c-08d89d234c4e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5362

Hi,

> On 9 Dec 2020, at 23:22, Julien Grall <julien@xen.org> wrote:
>=20
> Hi,
>=20
> On 09/12/2020 16:30, Bertrand Marquis wrote:
>> +    /* Disable MPAM as xen does not support it */
>=20
> I am going to be picky :). I think we want to say "hide" rather than "dis=
able" because the latter is done differently via the HCR_EL2.

That does make sense as we are not really disabling but hiding you are righ=
t.
I will fix that in V4.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


