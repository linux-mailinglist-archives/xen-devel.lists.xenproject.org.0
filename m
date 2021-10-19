Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 153634334C3
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 13:33:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213061.371173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcnN6-000452-Hu; Tue, 19 Oct 2021 11:33:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213061.371173; Tue, 19 Oct 2021 11:33:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcnN6-00042Z-E1; Tue, 19 Oct 2021 11:33:32 +0000
Received: by outflank-mailman (input) for mailman id 213061;
 Tue, 19 Oct 2021 11:33:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJzt=PH=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mcnN5-00042T-2h
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 11:33:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::62d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 304f3fb8-efe7-4b91-a661-368921569df4;
 Tue, 19 Oct 2021 11:33:29 +0000 (UTC)
Received: from DB6PR07CA0058.eurprd07.prod.outlook.com (2603:10a6:6:2a::20) by
 VI1PR08MB2846.eurprd08.prod.outlook.com (2603:10a6:802:21::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.17; Tue, 19 Oct 2021 11:33:20 +0000
Received: from DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::36) by DB6PR07CA0058.outlook.office365.com
 (2603:10a6:6:2a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.9 via Frontend
 Transport; Tue, 19 Oct 2021 11:33:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT004.mail.protection.outlook.com (10.152.20.128) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 11:33:20 +0000
Received: ("Tessian outbound b9598e0ead92:v103");
 Tue, 19 Oct 2021 11:33:20 +0000
Received: from 9a3c6bc55e90.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6E9B0E14-DA6A-42CB-9BAD-612C9C5FE025.1; 
 Tue, 19 Oct 2021 11:32:41 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9a3c6bc55e90.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 19 Oct 2021 11:32:41 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB6PR0802MB2456.eurprd08.prod.outlook.com (2603:10a6:4:a1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 11:32:39 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 11:32:38 +0000
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
X-Inumbo-ID: 304f3fb8-efe7-4b91-a661-368921569df4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKrQOCyDCw3CZ4gHOudlzVOYZ0BMoOJTHY6Yunl+J0s=;
 b=FKIWkZszjkhoYsi7L+EkT07aFx+2acoAe4YUJEOOEWxhxTyZoDhzpw1AaBBNEnKXywEmkrj1fi2zEsbsR43+scouhrdFuVhM6rIsh+pQpjevM/R4CXkAT3vpOXJ33dZp1KKTfWMzwD4St/sv6iiAlEeEUeErdjwwz4a3dQmQMHQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 730a8c9e0ee2cd47
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FSiaQqRnMFKgHi0bu84Knw6kqTjqamazJJPjZisNMDD/l2622cY9mBIrbuOyt35aLvvJeS+FjvTS9UPu7zuQM5BY0oxKuSjDAKmdvWLpzXYihgzLYx+3eErcY+RmQdkO9TfUvAIGqiuAOCCkx+KHigv8S5m0jmD84gDvnC4ww0YC+R4lh8shxtDh15RNx9w0LiWsCPO0rfyKw9gL3payTS6Fzt/NhLfa8xIyzs1VOvV/eJLMfb0EVt49SFSZtVv2RoVCxc36v8Dq//pB3KFxVKf+gK2ToqFIMuaQSci7AKnNLwdZquF35Am6aBtYwnHuB7muj9CdNaozXSnkcOzfYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKrQOCyDCw3CZ4gHOudlzVOYZ0BMoOJTHY6Yunl+J0s=;
 b=i6mLHAWYIuvF8d0CLJRYiWBrzQtJzteEkfm513Mucde5xuERh6SODGCWrIE/DJX1yq5uBsEt+ti6I424Y/RWd+HrdXTdj81EdvVeT7zIFrJO4m49OzFaCjR425qb4cnmX6MxfX2IJHNEMWstdN3TZlLF/kHSJAxZZRhiJ418gx6aHSlW2F0r7O4DA8gXSjK3y60gUpU61id5AoKet7/noUnPoXfYybbckMJCKvopOHlO6YhS0bD/pYIAqnn9z8bM96oYvCTIGMfTQGpUAfycbKaaELkwVqemde4BBOstA7X8CALM7cqCEcRKHP7IAkWPTAe/30I0Hx8vDea1z3NbmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKrQOCyDCw3CZ4gHOudlzVOYZ0BMoOJTHY6Yunl+J0s=;
 b=FKIWkZszjkhoYsi7L+EkT07aFx+2acoAe4YUJEOOEWxhxTyZoDhzpw1AaBBNEnKXywEmkrj1fi2zEsbsR43+scouhrdFuVhM6rIsh+pQpjevM/R4CXkAT3vpOXJ33dZp1KKTfWMzwD4St/sv6iiAlEeEUeErdjwwz4a3dQmQMHQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "Oleksandr_Andrushchenko@epam.com"
	<Oleksandr_Andrushchenko@epam.com>, Paul Durrant <paul@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 0/3] Fixes: PCI devices passthrough on Arm
Thread-Topic: [PATCH 0/3] Fixes: PCI devices passthrough on Arm
Thread-Index: AQHXxNXsWVtDOu3dTEyPepRQ+pXuJKvaKrkAgAADu4CAAAHpAA==
Date: Tue, 19 Oct 2021 11:32:38 +0000
Message-ID: <0B9FADC4-6375-4069-8444-43346879F585@arm.com>
References: <cover.1634639117.git.bertrand.marquis@arm.com>
 <24942.43034.758402.850001@mariner.uk.xensource.com>
 <4471eef0-5dfc-876d-5f4b-e5b163032210@suse.com>
In-Reply-To: <4471eef0-5dfc-876d-5f4b-e5b163032210@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e4642ebc-218e-495a-154f-08d992f440c1
x-ms-traffictypediagnostic: DB6PR0802MB2456:|VI1PR08MB2846:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB28463E2165C207F6102BB3969DBD9@VI1PR08MB2846.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 a8HstyslVcif+2r/jqJKN/VQ0FXjbHNxq/9ri6J1kjap5TItK0djjWThJ2p14bE97M36lD2+NHfKr6xNboa6NJEJZCjE3/atDgNmmPjnYUCfuN3dqvYO5MMlvJdXc6RX3hFIBjGA635un5tc1x87RG2OV1ODctiEbQqQwAa/SdVhOcZauSg6C8/PYJpqdlaXm7OKZvtf4SV1KW1AbFnmqW2/W1Cf7k6wrDAhIB8/VmGd1vTPa52dxBnmM+Ft1KIg1RagYObvlwJr8Doz3V8gNtCtI6r61sK88yt3M7jwu24VTRbjr/UGItspIcLPw//vzpTOkqNjUWW7HuT1fe4Iz4iDZlHNh7n6fVUeZXBLEUbwYaOAL9lfiHMbfGhTbxSW2M/jWcCbDGMcIcyFa568/P3EdXWbsfMRIvPkDPQVLPqzcTzuhwnI2/2KZt2Aq8IZ41by5R0uRUzCyNHCFiegrEXj/JQ+YToF/nvgNH2k2fyL4EJ2Rp3OYBEJP7jyeD9+lnhH06mLyQi4wnNCMP657EviAsVPB5mfnyE7vD+F7WIzaLM2yVUX2Jva0VCqamt1TpB6WH8dA/uNDbjP3aGRhIbo6Dcr+PN8MbhAh/LIRz1GA7Sf9t6zDKnO61ADgrLMeX6cACt4H2edq+4+L4Gs66XkE1gQLawiLlqFIiKEsjiZD8iN/etPikylyt50ORn4xz+b4e2dCgwkCeGsClv7/VsKZ1BiEUZRhz+qoBQv0KgGGzeBnEG/7ltoUJr65by2
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(91956017)(4744005)(66446008)(66556008)(64756008)(66476007)(5660300002)(66946007)(36756003)(4326008)(71200400001)(53546011)(6486002)(508600001)(2906002)(122000001)(8936002)(38100700002)(186003)(6512007)(26005)(38070700005)(54906003)(8676002)(86362001)(6916009)(33656002)(316002)(6506007)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <19843E7E73BCF9448A3C2E05D5B509F8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2456
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c99272b5-51f1-43b3-3c31-08d992f427ea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E0EgcgIkcMoqU+dy+99LREeoiqnKQSyeu7XbpvwWf52dmmi4hkdGa9GsMgRzlMg3b2XmUFinB051J6DeGkkgM+6IXL2IShvmN4AjLGez4g6VLipl/iX1HV0RZLkrCDUgA4OXJ6pfBcLYQ9PLNGx5gkuIJSOTOt9MPn960A1FQpBgyLtAmOzCQZ8JKrGbTtirEFCPCLEXBoNtfyitme5hbY88NIfcorgGGj89RHlUa72sQGFvsM59472C/i1zj4eH9QqshhEfmk1mahS/YYDmweF+mPigPVf/QER9Fczen4bBZu+NDo2D7o0kkY9mtGOdo+rMJrOvxFXx57jBZF46am+yF6ofLZoEEDbfwxE34yOED8HDNUnGyFdS/26rvxUKFwId3Nn2oh/bPewyJqL+yv5l3hdu1yvtTfRSfOCabZew4CDsmC6flfP1lDladUBeYHLQHSvlyz5006cIhpDBRpwfN92xOuAxWkRuwTZM9ltvjbu8Ze8F0d9z7PdKv467zYn21eyvPPTKCVBOxhGIxZ7FBJGfu24acRIg0xeRRkH7/wVDDyGiuKwMAlFpLn1dJOYQPLN78wTwm72pXRusAaaIiW5Rm4DNT5ocGnxrUe0XhD/kRuymwopEdAqemg4Uu6Tyuo0fgGEDrYPABqgwQp/InVi2OAX/CiTr4M3Uj5gMce5fd4aU2QT9yd3dP3RiueXTxiNiaIiOROsvqpQiOg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(54906003)(316002)(336012)(82310400003)(36860700001)(356005)(186003)(70206006)(86362001)(6862004)(508600001)(8676002)(36756003)(2906002)(2616005)(6486002)(33656002)(4326008)(8936002)(70586007)(5660300002)(53546011)(81166007)(107886003)(26005)(6506007)(47076005)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 11:33:20.5487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4642ebc-218e-495a-154f-08d992f440c1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2846

Hi Jan,

> On 19 Oct 2021, at 12:25, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 19.10.2021 13:12, Ian Jackson wrote:
>> Bertrand Marquis writes ("[PATCH 0/3] Fixes: PCI devices passthrough on =
Arm"):
>>> This patch serie is a follow-up after various findings on d59168dc05
>>> ("xen/arm: Enable the existing x86 virtual PCI support for ARM") as of
>>> agreed in [1].
>>>=20
>>> It does the following:
>>> - enable vpci_add_handlers on x86 and not only on arm
>>> - remove __hwdom_init flag for vpci_add_handlers
>>> - add missing vpci handler cleanup in error path during pci_device_add
>>>  and pci_device_remove
>>=20
>> Thanks.  Roger, Jan, what do you think of this ?
>=20
> I'll get to this, but at the first glance I'd say that the change in
> patch 1 coming before what patch 2 does is already a problem.

Because path 1 is actually introducing a bug solved by patch 2, I should ha=
ve thought of that.

I can either invert those 2 (or actually put patch 1 at the end) or merge p=
atch 1 and 2 together.

Bertrand

>=20
> Jan
>=20


