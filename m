Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 499D32D60B0
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 16:59:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49508.87575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knOLY-00078n-0g; Thu, 10 Dec 2020 15:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49508.87575; Thu, 10 Dec 2020 15:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knOLX-00078N-T4; Thu, 10 Dec 2020 15:59:11 +0000
Received: by outflank-mailman (input) for mailman id 49508;
 Thu, 10 Dec 2020 15:59:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/MM=FO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1knOLW-00078H-Pm
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 15:59:10 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.56]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 686e8f75-9b60-4b60-a9f5-15df7dab2819;
 Thu, 10 Dec 2020 15:59:09 +0000 (UTC)
Received: from AM6P194CA0078.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::19)
 by AM4PR08MB2913.eurprd08.prod.outlook.com (2603:10a6:205:a::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Thu, 10 Dec
 2020 15:59:08 +0000
Received: from VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::23) by AM6P194CA0078.outlook.office365.com
 (2603:10a6:209:8f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Thu, 10 Dec 2020 15:59:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT023.mail.protection.outlook.com (10.152.18.133) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 15:59:07 +0000
Received: ("Tessian outbound 8b6e0bb22f1c:v71");
 Thu, 10 Dec 2020 15:59:07 +0000
Received: from 5e8dbee7d06a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C3F2E2AE-4660-4817-B608-296538B288A0.1; 
 Thu, 10 Dec 2020 15:59:02 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5e8dbee7d06a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Dec 2020 15:59:02 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5605.eurprd08.prod.outlook.com (2603:10a6:10:1af::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Thu, 10 Dec
 2020 15:59:01 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 15:59:01 +0000
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
X-Inumbo-ID: 686e8f75-9b60-4b60-a9f5-15df7dab2819
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhnaInN98bY5l09QGCGKOWD3Hj1c0ukB+yxV7eGQzq0=;
 b=npXLlJ5SZpyBGt2kr68ch1BgYsuRjwhP9MqVcG5PfWklU2CZ1YsHL8TCLlSfR16lN3+a9LTitiAW77jVG0TFz83+eSoYqErP0iswYzoOYD6qP/XxBIYZ3IiQZCdfNvNJUgd0N2x98t+GDHbH/JAjMWmc0oZdBLc+hRv4IzFtvIQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 68232168eece3367
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYoqdbOC3W7eQKQCifZXoNrE8Rm47tyEnFd6dIYQgZ/fbfRFBZdL4waf5FPT6A6WoAqPMLvXMOvJCOf/RdGw/fwXS+um/B8tPXJrY2RoTaMng+DSfJ+uRleZqzJKQeP8LQAN8kgmy9aKaySPlAF2owachtyFf3Jc74BJNJltPQU1RW5dKRdHjBd7Vawj6KZyyGpXgj9yOvkBOt6QCPiMm4XjyTRQM1p4l+BDNyFv+cLWcZU69tJde9gu4uzXN5RtDSHF9vpVb9zOp28ROstxPP2kMc7KC/zUO1/G/w3/B2FMfGBL2rGwDrcM9X1VYnjRc/UG1FSRLmbFcMZ6EfG8yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhnaInN98bY5l09QGCGKOWD3Hj1c0ukB+yxV7eGQzq0=;
 b=QVrywH3bONaghXJRRf/gz7N7EuzO/nhzAZa1mGK7Phc7GKQcoOHyBwPIwuo1JFQ955rY6mwGuMdLCdAr+OgXASmvXLbZEpEW+XayoE/fLFZxSZ3dJjMIiWkIu3MoA+dt1eQWm7jRMJxuTj8pGtOsQwgIc7YNcXGp/4XZ6oCwngb+jY6pbE4mwhpbJ6jiGvU69lU2hkXauwDX28vquHpuVi4olSZ/c2Nns5iZw4KT52Yst/2QbRyVMQqAnKJInzCh5JbAx+N+9GdLSTy5Z8lqJUe+0P7XTxIO/JFHrD5yJWIOC6WTwOURYaa1MuE6OF2CySEVnsUd0b1kXAVhYYogHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhnaInN98bY5l09QGCGKOWD3Hj1c0ukB+yxV7eGQzq0=;
 b=npXLlJ5SZpyBGt2kr68ch1BgYsuRjwhP9MqVcG5PfWklU2CZ1YsHL8TCLlSfR16lN3+a9LTitiAW77jVG0TFz83+eSoYqErP0iswYzoOYD6qP/XxBIYZ3IiQZCdfNvNJUgd0N2x98t+GDHbH/JAjMWmc0oZdBLc+hRv4IzFtvIQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 2/7] xen/arm: Add arm64 ID registers definitions
Thread-Topic: [PATCH v3 2/7] xen/arm: Add arm64 ID registers definitions
Thread-Index: AQHWzkltLRvwC2Fl20mIggNF1RyrE6nvYzSAgAA5EwCAAN5UAIAAA5KA
Date: Thu, 10 Dec 2020 15:59:01 +0000
Message-ID: <89552CA7-D63D-4916-9066-15599E4B0F94@arm.com>
References: <cover.1607524536.git.bertrand.marquis@arm.com>
 <96a970e5e5d2f1b1bd0e50327857de6a8c8441f7.1607524536.git.bertrand.marquis@arm.com>
 <af02eefb-5846-d32b-22e5-65763e6f51e0@xen.org>
 <alpine.DEB.2.21.2012091742420.20986@sstabellini-ThinkPad-T480s>
 <29a7ea09-2bc5-94e9-563e-07abb18ed260@xen.org>
In-Reply-To: <29a7ea09-2bc5-94e9-563e-07abb18ed260@xen.org>
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
X-MS-Office365-Filtering-Correlation-Id: f017ecfc-fe11-4fed-655f-08d89d2486de
x-ms-traffictypediagnostic: DBAPR08MB5605:|AM4PR08MB2913:
X-Microsoft-Antispam-PRVS:
	<AM4PR08MB2913BD003CD2F941690321E19DCB0@AM4PR08MB2913.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OdXbQ6lS4Smj6srnylaA5kKcX5efda+yHrokVXYrWIQknZbKQZDPehyVZVUTa9CxuoVGSSoVXtT/w8xBSZd/6P35XWMMJhup3P+3MH25ogjeOHChn9mgohHHG9YbBseh1+7XQTlP6iSNeoZ28uyljE/2UUawaM558OCzDxHTufHykDh4qr6zsjS/sQdv6v0ximsx5gb4O51HKY1SiKTpZmFHJqu0B01/tXn3/5yDUeVnvuMQ3LGpPkotTV+dkIsFphZqUUGDjeLOV4dR+ZYLj0V9HhVQk9IgREhPTw4bhe2/dKhS5c7eO8BUvFRhyk3IzdfZ816fNV6fsFWWUWqlZuWb4QTPLC9eWJXF2hqPSrN8iGixlb/Lmtc7o+9yCvsx
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(39860400002)(136003)(396003)(346002)(54906003)(8676002)(6916009)(66446008)(5660300002)(4326008)(6506007)(66556008)(66946007)(2616005)(64756008)(91956017)(53546011)(71200400001)(86362001)(66476007)(26005)(6512007)(478600001)(186003)(33656002)(76116006)(316002)(8936002)(36756003)(83380400001)(2906002)(6486002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?iQYvDcyjhZPRiWUko0RyFufmHBehjPtbSGysg8r8oVlgGOVo6Hdcr2LDWo4b?=
 =?us-ascii?Q?VJ1i6d4WmHodz72/mVsKotwMCqA2KA3hBukHdC26q8uHRQJGaQub47a+UppP?=
 =?us-ascii?Q?Y3aJypR02aH8cDey0F75fDVAvxXtVu1zWuy/BuXVHWy+CYCGsxrtJpRpryEz?=
 =?us-ascii?Q?qovSK47bipMC3eHGSvNPduVS5ctjsjGn+/VeTMD8kkUvWuYtY5x3O+SpRqwm?=
 =?us-ascii?Q?yPmuNhgqRSU9uLzBWq7CPF7fwCGcImvfca8B4+ffrXNHH7Ok5L0sgc3LYF9O?=
 =?us-ascii?Q?ggdo+DMi9ZxFirIRC8dx4CJF7OCbJsLdvrv/vX6ZvmSHN4eq81+aoyFJXAtc?=
 =?us-ascii?Q?1lYdtiFwdKrvR3LOsHTpwX4EoZMXIMYkdIZfHDSQzWSWuIg+JdTJkurdOnJQ?=
 =?us-ascii?Q?iml5fMTQlJaRZ1eZCJldXK2fzGBnndEmyCsD1pJFjPVuCYBXXqNR8lrLsk4w?=
 =?us-ascii?Q?xDGN3IH4T2H2tIAvfaGcJjHi6gWNRPVCHfUs9u79NkRdWedbZwreiAlkMhqF?=
 =?us-ascii?Q?NEbuadf5TFJHb+gfaeUks/50fimIhkY8te5RqLA9FTHNtPDKh5Pol86PUqoO?=
 =?us-ascii?Q?6VI/Qcc9FDWXQxkQyOdP55xtglLyotjdDYwbWFIsPuq+oLWFRSWEcWvgNPO2?=
 =?us-ascii?Q?gYzn3/la1Xc7h+obT5kbglD3ClG3kKwQ9U4r6yXlFA2FZV8xX9jDCSenBBcj?=
 =?us-ascii?Q?siRjiM2TFH7CDGHCfMt4QEowFJXb659tmq1Sn+qart6jjB5Y2iCgqprbo9Wz?=
 =?us-ascii?Q?kc+8B0UmoVPxOMqLpa4KG4dUpWQAnxMgtdiRhPfrbxO7QpMTKbWwZQG/s2gP?=
 =?us-ascii?Q?M/LZENeJwxEzPW82AT3xuZmyIeSUSTAJxUMnqUhsbAKL/knB3nFoYHnZA1ra?=
 =?us-ascii?Q?jGzaD2LAeJWUqYd/2La4Ir3NY27hwRAzqTmx2azzaRDqGVKNbB4acHJ8fLiy?=
 =?us-ascii?Q?jr+7+3XYpIWTYyq2auQ7KbHNSYn383gCyDb+oxwwCw6FXaggadnYSRCtajaw?=
 =?us-ascii?Q?eEXY?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <15405F296881FD4A9F746AD4D2EA5F48@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5605
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	405d4496-6aeb-4710-0dba-08d89d2482f5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	46tr00YySbbB/qHO3Xwb8otRjqmbH8wz9cyqm0LSoqaUJlnFlrEUaf5UYAcbgwVW85AHTf1kjJnV1/icXai/JYKIzFVooIh3LZ+R39H4nnjw+wAnU5y/dhu3iD/0iRAgeAxUVWhjFZxHbNwyT+mbejIkZ9nNd2HvGY6JoZL6en8g8YVqqxQXWbe4WEleX4vcBM2QGSX1FDfSylyPNQVBhzbgJyJHTUwvNLvMHOOFv19KOi2GKnborDCufn6iDSOuZ9W4WZMBB8z76xdaPxs2ogSZtLFJc4OdgnT8IohZiZSmRByzdzqVthv4vLoUmB165xaEkDMHNgt2xXlSgxZst6/cjKgK66lTE6Y4LsVTyyb+uwxG03SVleA7HTSmCe5vs5tKkcHo+BEd4ZsJtqmQyw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(376002)(39860400002)(46966005)(316002)(6862004)(6512007)(54906003)(5660300002)(6486002)(107886003)(8676002)(70586007)(8936002)(4326008)(356005)(83380400001)(82310400003)(47076004)(478600001)(81166007)(36756003)(70206006)(2616005)(6506007)(33656002)(53546011)(26005)(336012)(82740400003)(86362001)(186003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 15:59:07.8741
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f017ecfc-fe11-4fed-655f-08d89d2486de
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2913

Hi,

> On 10 Dec 2020, at 15:46, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 10/12/2020 02:30, Stefano Stabellini wrote:
>> On Wed, 9 Dec 2020, Julien Grall wrote:
>>> Hi Bertrand,
>>>=20
>>> On 09/12/2020 16:30, Bertrand Marquis wrote:
>>>> Add coprocessor registers definitions for all ID registers trapped
>>>> through the TID3 bit of HSR.
>>>> Those are the one that will be emulated in Xen to only publish to gues=
ts
>>>> the features that are supported by Xen and that are accessible to
>>>> guests.
>>>> Also define a case to catch all reserved registers that should be
>>>> handled as RAZ.
>>>>=20
>>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>> ---
>>>> Changes in V2: Rebase
>>>> Changes in V3:
>>>>    Add case definition for reserved registers.
>>>>=20
>>>> ---
>>>>   xen/include/asm-arm/arm64/hsr.h | 66 +++++++++++++++++++++++++++++++=
++
>>>>   1 file changed, 66 insertions(+)
>>>>=20
>>>> diff --git a/xen/include/asm-arm/arm64/hsr.h
>>>> b/xen/include/asm-arm/arm64/hsr.h
>>>> index ca931dd2fe..ffe0f0007e 100644
>>>> --- a/xen/include/asm-arm/arm64/hsr.h
>>>> +++ b/xen/include/asm-arm/arm64/hsr.h
>>>> @@ -110,6 +110,72 @@
>>>>   #define HSR_SYSREG_CNTP_CTL_EL0   HSR_SYSREG(3,3,c14,c2,1)
>>>>   #define HSR_SYSREG_CNTP_CVAL_EL0  HSR_SYSREG(3,3,c14,c2,2)
>>>>   +/* Those registers are used when HCR_EL2.TID3 is set */
>>>> +#define HSR_SYSREG_ID_PFR0_EL1    HSR_SYSREG(3,0,c0,c1,0)
>>>> +#define HSR_SYSREG_ID_PFR1_EL1    HSR_SYSREG(3,0,c0,c1,1)
>>>> +#define HSR_SYSREG_ID_PFR2_EL1    HSR_SYSREG(3,0,c0,c3,4)
>>>> +#define HSR_SYSREG_ID_DFR0_EL1    HSR_SYSREG(3,0,c0,c1,2)
>>>> +#define HSR_SYSREG_ID_DFR1_EL1    HSR_SYSREG(3,0,c0,c3,5)
>>>> +#define HSR_SYSREG_ID_AFR0_EL1    HSR_SYSREG(3,0,c0,c1,3)
>>>> +#define HSR_SYSREG_ID_MMFR0_EL1   HSR_SYSREG(3,0,c0,c1,4)
>>>> +#define HSR_SYSREG_ID_MMFR1_EL1   HSR_SYSREG(3,0,c0,c1,5)
>>>> +#define HSR_SYSREG_ID_MMFR2_EL1   HSR_SYSREG(3,0,c0,c1,6)
>>>> +#define HSR_SYSREG_ID_MMFR3_EL1   HSR_SYSREG(3,0,c0,c1,7)
>>>> +#define HSR_SYSREG_ID_MMFR4_EL1   HSR_SYSREG(3,0,c0,c2,6)
>>>> +#define HSR_SYSREG_ID_MMFR5_EL1   HSR_SYSREG(3,0,c0,c3,6)
>>>> +#define HSR_SYSREG_ID_ISAR0_EL1   HSR_SYSREG(3,0,c0,c2,0)
>>>> +#define HSR_SYSREG_ID_ISAR1_EL1   HSR_SYSREG(3,0,c0,c2,1)
>>>> +#define HSR_SYSREG_ID_ISAR2_EL1   HSR_SYSREG(3,0,c0,c2,2)
>>>> +#define HSR_SYSREG_ID_ISAR3_EL1   HSR_SYSREG(3,0,c0,c2,3)
>>>> +#define HSR_SYSREG_ID_ISAR4_EL1   HSR_SYSREG(3,0,c0,c2,4)
>>>> +#define HSR_SYSREG_ID_ISAR5_EL1   HSR_SYSREG(3,0,c0,c2,5)
>>>> +#define HSR_SYSREG_ID_ISAR6_EL1   HSR_SYSREG(3,0,c0,c2,7)
>>>> +#define HSR_SYSREG_MVFR0_EL1      HSR_SYSREG(3,0,c0,c3,0)
>>>> +#define HSR_SYSREG_MVFR1_EL1      HSR_SYSREG(3,0,c0,c3,1)
>>>> +#define HSR_SYSREG_MVFR2_EL1      HSR_SYSREG(3,0,c0,c3,2)
>>>> +
>>>> +#define HSR_SYSREG_ID_AA64PFR0_EL1   HSR_SYSREG(3,0,c0,c4,0)
>>>> +#define HSR_SYSREG_ID_AA64PFR1_EL1   HSR_SYSREG(3,0,c0,c4,1)
>>>> +#define HSR_SYSREG_ID_AA64DFR0_EL1   HSR_SYSREG(3,0,c0,c5,0)
>>>> +#define HSR_SYSREG_ID_AA64DFR1_EL1   HSR_SYSREG(3,0,c0,c5,1)
>>>> +#define HSR_SYSREG_ID_AA64ISAR0_EL1  HSR_SYSREG(3,0,c0,c6,0)
>>>> +#define HSR_SYSREG_ID_AA64ISAR1_EL1  HSR_SYSREG(3,0,c0,c6,1)
>>>> +#define HSR_SYSREG_ID_AA64MMFR0_EL1  HSR_SYSREG(3,0,c0,c7,0)
>>>> +#define HSR_SYSREG_ID_AA64MMFR1_EL1  HSR_SYSREG(3,0,c0,c7,1)
>>>> +#define HSR_SYSREG_ID_AA64MMFR2_EL1  HSR_SYSREG(3,0,c0,c7,2)
>>>> +#define HSR_SYSREG_ID_AA64AFR0_EL1   HSR_SYSREG(3,0,c0,c5,4)
>>>> +#define HSR_SYSREG_ID_AA64AFR1_EL1   HSR_SYSREG(3,0,c0,c5,5)
>>>> +#define HSR_SYSREG_ID_AA64ZFR0_EL1   HSR_SYSREG(3,0,c0,c4,4)
>>>> +
>>>> +/*
>>>> + * Those cases are catching all Reserved registers trapped by TID3 wh=
ich
>>>> + * currently have no assignment.
>>>> + * HCR.TID3 is trapping all registers in the group 3:
>>>> + * Op0 =3D=3D 3, op1 =3D=3D 0, CRn =3D=3D c0,CRm =3D=3D {c1-c7}, op2 =
=3D=3D {0-7}.
>>>> + */
>>>> +#define HSR_SYSREG_TID3_RESERVED_CASE  case HSR_SYSREG(3,0,c0,c3,3): =
\
>>>> +                                       case HSR_SYSREG(3,0,c0,c3,7): =
\
>>>> +                                       case HSR_SYSREG(3,0,c0,c4,2): =
\
>>>> +                                       case HSR_SYSREG(3,0,c0,c4,3): =
\
>>>> +                                       case HSR_SYSREG(3,0,c0,c4,5): =
\
>>>> +                                       case HSR_SYSREG(3,0,c0,c4,6): =
\
>>>> +                                       case HSR_SYSREG(3,0,c0,c4,7): =
\
>>>> +                                       case HSR_SYSREG(3,0,c0,c5,2): =
\
>>>> +                                       case HSR_SYSREG(3,0,c0,c5,3): =
\
>>>> +                                       case HSR_SYSREG(3,0,c0,c5,6): =
\
>>>> +                                       case HSR_SYSREG(3,0,c0,c5,7): =
\
>>>> +                                       case HSR_SYSREG(3,0,c0,c6,2): =
\
>>>> +                                       case HSR_SYSREG(3,0,c0,c6,3): =
\
>>>> +                                       case HSR_SYSREG(3,0,c0,c6,4): =
\
>>>> +                                       case HSR_SYSREG(3,0,c0,c6,5): =
\
>>>> +                                       case HSR_SYSREG(3,0,c0,c6,6): =
\
>>>> +                                       case HSR_SYSREG(3,0,c0,c6,7): =
\
>>>> +                                       case HSR_SYSREG(3,0,c0,c7,3): =
\
>>>> +                                       case HSR_SYSREG(3,0,c0,c7,4): =
\
>>>> +                                       case HSR_SYSREG(3,0,c0,c7,5): =
\
>>>> +                                       case HSR_SYSREG(3,0,c0,c7,6): =
\
>>>> +                                       case HSR_SYSREG(3,0,c0,c7,7)
>>>=20
>>> I don't like the idea to define the list of case in a header that is us=
ed by
>>> multiple source. Please define it directly in the source file that use =
it.
>> At that point it might be best to open-coding it in do_sysreg? I mean no
>> #define at all.
>=20
> I am happpy with that.

Then i will fix both cp15 and arm64 code to do it this way.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall
>=20


