Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EA0424F50
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 10:33:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203417.358543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYOps-0002So-Eu; Thu, 07 Oct 2021 08:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203417.358543; Thu, 07 Oct 2021 08:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYOps-0002QE-Bu; Thu, 07 Oct 2021 08:33:04 +0000
Received: by outflank-mailman (input) for mailman id 203417;
 Thu, 07 Oct 2021 08:33:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9/ki=O3=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mYOpq-0002Q8-LY
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 08:33:02 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.82]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2dc07246-2749-11ec-bfc3-12813bfff9fa;
 Thu, 07 Oct 2021 08:33:00 +0000 (UTC)
Received: from DU2PR04CA0064.eurprd04.prod.outlook.com (2603:10a6:10:232::9)
 by PAXPR08MB7074.eurprd08.prod.outlook.com (2603:10a6:102:200::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Thu, 7 Oct
 2021 08:32:57 +0000
Received: from DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::da) by DU2PR04CA0064.outlook.office365.com
 (2603:10a6:10:232::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 7 Oct 2021 08:32:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT033.mail.protection.outlook.com (10.152.20.76) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Thu, 7 Oct 2021 08:32:57 +0000
Received: ("Tessian outbound 2e7020cc8961:v103");
 Thu, 07 Oct 2021 08:32:57 +0000
Received: from 06997e9668a9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2D5A1E8B-5A99-4F0B-B6C4-F7855344E5E0.1; 
 Thu, 07 Oct 2021 08:32:46 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 06997e9668a9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 07 Oct 2021 08:32:46 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB3973.eurprd08.prod.outlook.com (2603:10a6:20b:ab::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Thu, 7 Oct
 2021 08:32:45 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9%7]) with mapi id 15.20.4566.023; Thu, 7 Oct 2021
 08:32:45 +0000
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
X-Inumbo-ID: 2dc07246-2749-11ec-bfc3-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NY7T2DMdrP8QbJjXTPcEhoExl6C7BaRglfaB2gl/xI8=;
 b=X1OahMsSUizO1pQSzJ6pH4/+c0dOJ6iC7VOLzpPHWP7DbgXqSUw411M0iiiqcujBP49Up18bGvMmL1udkQuvWmoCzE4s/SOoqlBpGAWFPfQYypWknGcrfV0DZX359IgBkTumFnwTE/ATLPevcJCpzNcXLYQ23zw/Tl2co2LTuC4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 875dacfc5ad2fd7e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grgd9oRAlxgdt02lXCWTz+R9p2jHT4QM5gDQlfJSJPORk3tl4GzTIpoj41La4qZdxxEEKLHodqWSSDDy8Z1sPoRES1vOI49urAWD0rYSRIvB03sLPMsgzvLSisIPGK4QjYc1RVL4NXTBNwRHcLaCI81AWNKWl+9I2zeoBcVsqUIp7jTiBl/g74dvBkDv9/SaeDdHPCYXI/pzyXSlUunayXN8E5NJoSsmIy29GuAwNvn2CAyUwGIGe/N0oyhrElvO5xD7Y8rTb7Qr5IklPXJSbuEOkhrcCKd8wccOP7OALlubaCBB2oTuMqqYhgUUNLyMbqdXMP1BoLosL27qOPlo2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NY7T2DMdrP8QbJjXTPcEhoExl6C7BaRglfaB2gl/xI8=;
 b=aE4JqPNqstETmeGecq8QLX/yhGDNXlnoAn4vX7gnChCYMsGQX58MD0SCg3YCJW8otoTUXlqE9YOpEAB2sUR56HfwL8t2ZmiUC1/fGzJP0ymmGDUYVSYl3ukBwoKP/DzpqcEt4Cv5+mfkM2L/5gi6K02nsr/7b2l6BA60B7CCLfzViXx0ifCChW08y8CiNeaRzym+jpEjuBKr4VVKKO/qkChUUKpeZ9+qG1u5Amft+5MvdKaPuCJsF7U0s/MVC0PVbFqxjzbhd7hM3pYgG/cXzFYAoU+MJ4ighjs1HHLzCgHpemKlIDuYPkBvyo1f05NIYcYzC9VlOl1syyRRSpP9ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NY7T2DMdrP8QbJjXTPcEhoExl6C7BaRglfaB2gl/xI8=;
 b=X1OahMsSUizO1pQSzJ6pH4/+c0dOJ6iC7VOLzpPHWP7DbgXqSUw411M0iiiqcujBP49Up18bGvMmL1udkQuvWmoCzE4s/SOoqlBpGAWFPfQYypWknGcrfV0DZX359IgBkTumFnwTE/ATLPevcJCpzNcXLYQ23zw/Tl2co2LTuC4=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Andre Przywara
	<Andre.Przywara@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 03/11] xen/arm: Add cmdline boot option
 "pci-passthrough = <boolean>"
Thread-Topic: [PATCH v5 03/11] xen/arm: Add cmdline boot option
 "pci-passthrough = <boolean>"
Thread-Index: AQHXutl8uDaCKdGiUEea3YjyaYprAqvHNJaAgAABgwA=
Date: Thu, 7 Oct 2021 08:32:44 +0000
Message-ID: <6BE3AA48-115A-44CF-A108-44AE124EEE77@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <e7d91ded71816d07f559b98027e5be1ff172dcab.1633540842.git.rahul.singh@arm.com>
 <8c32a39c-e155-588f-775f-e040013166d8@suse.com>
In-Reply-To: <8c32a39c-e155-588f-775f-e040013166d8@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: fea83b65-5574-4ea3-651a-08d9896d10ce
x-ms-traffictypediagnostic: AM6PR08MB3973:|PAXPR08MB7074:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB7074767CBDAB9F480760A447FCB19@PAXPR08MB7074.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2512;OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dGSINaK/K0kwZY8l8Me/22/AKrNWXFfIkNbCfkDbBCYG5wWXQ44kdcIvCrIuVLPlmMUFGeBrIP55b4+YYvzsK8sSNlQWTKyUoXsL8bFKyjJ6tQtsFSvuo46YhL6nmnQpF55qMZ4gYAVW33v0iaC1AYqnH0aoGSp6rJRzJXv7UrDCdS8I0KRJRMmjfdVvK5Hhb7N5wBX18PzWutZwrbNaEVNcHHIKRvsPkS/drtJlw3QDCBG9XLNi9FXZ261lfejLLpXoUCM5s6DwglncfQb08IU3yUIvvX4/ETTsoq1K+3BRJgnTqTfGuOK/ELZMGPBMBZl8OZV4lNpKSDL8X6jsJlnNYPt1u1+uOcwtcAKseSHv9JwPekFZjgrI3WN9RPG8SUMLVyHBttL5et0SQp9r2cGLwaTlsZmFEZ6+esmquD2COAJNdQLPcHesILQQ0cs+DpFp+QtSWhTyMxjeAclsfl1yOhHzKHJC/BNwAyn7YeJcz8+7ZMcLFvf1mXiIDDUOYj5gNdtnVEzmL1d+DDSg4G3WZ+G/9M7WC70nEx1SCKiqg86QsrT1xtw/Io3yW4B66IdYM682fYT+pjhZ792v/X+iNPvce540OA9f+i7qnQtHyzGvfJzGEhQ7qzRwuXvjFFB6gKYIW9FNiDD1GghM+8l/C3imF0vhju5YWjo5aFLu+/FCtf+T1NpmfyA9cUbgatOtQj2bbYwOg1XPP3tqIlwg6bu7BCWeE/92oGBhvt35PCjWc6s/79AviGUyUAY5
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(53546011)(508600001)(6916009)(86362001)(66446008)(76116006)(66556008)(66946007)(26005)(91956017)(66476007)(6512007)(8676002)(7416002)(64756008)(6506007)(8936002)(38100700002)(71200400001)(316002)(36756003)(2906002)(54906003)(6486002)(186003)(2616005)(38070700005)(33656002)(5660300002)(4326008)(122000001)(4744005)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <6D6569831BDA734B9BB314E49F3B5DC9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3973
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	905ea8d6-d1cf-4bc2-133b-08d9896d095b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q/16YjehDgJHd4J6aK+Yt/Bb8N5lXNnZ9dAcNptMEM7LeGrUKFWRI+Na+vkevEBFeC58uELN4458bBfI/4en7QjkeL5+UAu8W/QwUQCPECAfoQaC50w2YdzCFT/rOlXunavvxH9ProvY6S+LtDTS7IcVhy8ZcLecgBar27I6A7KXjKMpFETSrgkSQMpWBnryxKevQBvYM+2WBv5lP+aLwzKIX4KHlQOhn906WXiHqA04XurQnrrThPpGK530M54pL06E3eZY5LBSSDrearvZaEuYPVVYpVrG2Ep2oAs+GO0FOhfDIUcwScH6UqTJWSIrfnkQTt9yN+CJqGvp9I1tw/1DgxlzYOQVIrSDU2gtIhVWi+HwkryG43wJbXeqDe019ItXyw1eGQuIDkDsvO+iwRNMegET0yqipGhuZa9aOYunpiBfIsMjmCRtMYC4q4e5Yv9fpbtkkaD/38WVuBFsUvGTE3xqsyv5hWk/7uuTHfJMuA34xLINiLP9IJv640InlYI+/DAUhcTc2U4m3EzTSd1P7S/r/x3B4dHS+2nRub0uVSHkIAJAP6PXQbt1zyGGW+8HqvNphjSv4oQtOF+Fj0Yo9qcEVhdVUVILLFqSi2wZ7+D8qOKmbccGJMV010JtII9YKHis+HpJvPUL8h0YAmfdqurxYTjre9GJrdeybsUPZNRjyBYuc9xZB6qHW54PdkLKtjciFGmvkasa6wUcag==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(5660300002)(8936002)(36756003)(356005)(336012)(26005)(2906002)(508600001)(316002)(36860700001)(81166007)(82310400003)(54906003)(8676002)(6862004)(2616005)(47076005)(53546011)(6506007)(6486002)(70586007)(186003)(86362001)(83380400001)(70206006)(4744005)(4326008)(33656002)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 08:32:57.5963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fea83b65-5574-4ea3-651a-08d9896d10ce
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7074

Hi Jan,

> On 7 Oct 2021, at 9:27 am, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 06.10.2021 19:40, Rahul Singh wrote:
>> @@ -62,8 +63,19 @@ static int __init acpi_pci_init(void)
>> }
>> #endif
>>=20
>> +/* By default pci passthrough is disabled. */
>> +bool __read_mostly pci_passthrough_enabled;
>=20
> You properly use "bool " here. Why ...
>=20
>> --- a/xen/include/asm-arm/pci.h
>> +++ b/xen/include/asm-arm/pci.h
>> @@ -19,14 +19,25 @@
>>=20
>> #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
>>=20
>> +extern bool_t pci_passthrough_enabled;
>=20
> ... the being phased out "bool_t" here?

I missed that I will fix this.

Regards,
Rahul
>=20
> Jan
>=20


