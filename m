Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1CF7BB2B7
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 09:54:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613270.953712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qofez-00058v-NW; Fri, 06 Oct 2023 07:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613270.953712; Fri, 06 Oct 2023 07:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qofez-00057F-Kf; Fri, 06 Oct 2023 07:54:09 +0000
Received: by outflank-mailman (input) for mailman id 613270;
 Fri, 06 Oct 2023 07:54:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I3TD=FU=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qofey-000573-Ar
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 07:54:08 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2077.outbound.protection.outlook.com [40.107.13.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85d58289-641d-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 09:54:06 +0200 (CEST)
Received: from AM0PR10CA0015.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::25)
 by DBBPR08MB5883.eurprd08.prod.outlook.com (2603:10a6:10:206::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Fri, 6 Oct
 2023 07:53:35 +0000
Received: from AM7EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:17c:cafe::c7) by AM0PR10CA0015.outlook.office365.com
 (2603:10a6:208:17c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.29 via Frontend
 Transport; Fri, 6 Oct 2023 07:53:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT021.mail.protection.outlook.com (100.127.140.243) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.15 via Frontend Transport; Fri, 6 Oct 2023 07:53:35 +0000
Received: ("Tessian outbound 0ae75d4034ba:v211");
 Fri, 06 Oct 2023 07:53:35 +0000
Received: from 1ba6eea2d2bd.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 731C0358-5097-440F-8754-CA9518ED7366.1; 
 Fri, 06 Oct 2023 07:53:28 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1ba6eea2d2bd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 Oct 2023 07:53:28 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU2PR08MB7311.eurprd08.prod.outlook.com (2603:10a6:10:2e6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Fri, 6 Oct
 2023 07:53:26 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 07:53:26 +0000
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
X-Inumbo-ID: 85d58289-641d-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUh2Y9tdvJZA3XyIInghRr5hrs2iCboIlqorNwoR6Mw=;
 b=bGnXzi51i4nJopZ9xIzMI2z5PXKia8jzqR7lj8cBOBKHYt0225ht479Hq1okN/qnD3bm7uM8w4STnx2hO4T2rsY2FCGI9NtvgjUy8Pc+dwY2nBjLP8jE3P94mFipuB8wAS43joXGL6GrgNrpNHxMKsJ7VvR0/Qfpfe914rHKrnw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 702dba83a1e77869
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDIJVxnoZTdiWRTnKbywO/jkNAp1oPSCnGVpUdhamEJd29sFLaalZjNqpF0g+sjSPaBW5PWyFOfXG1JVjJ02548r9+vN704/YylnPttwYJ3BJ2U76pOivTbj27JTA7HOwyCJDSGlbj7LzAKwXWaHfvRjVsKrRKZsCGTu4mf1YqTiF3TPCPL4hIa8ipbx2w4DoI0gog7t856/LErKivJLWogaVN8qzl/SFewSk6/z4HHTDxx5a9laNhvkVaUJaIRJSGkCGIIE0VE1ayvhrLDgpKxuREugfZIet0pIT/xgtNj2f6CoOKlZ4eDdTTD9kknCusO+Y1eqLWDoMyvObS+wvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUh2Y9tdvJZA3XyIInghRr5hrs2iCboIlqorNwoR6Mw=;
 b=J6Xc1OOCsmFxSH7KOrcpi6CtYFpjbfkyakqi5RTQCz4im6EnoTUlHvHRV60RUYezi3LWrzAKzvcGaf8UjL4JxUH1KM05XO55suR7oNumRmKDRdlyER85Px49dz3Hi5CBwafjxli1RAsnmPM6zwN80rtvjDu2G5S4HIggdU6l8SI8fkgKIm19WC30xDHFq1LCiFtosETarK1vny1/E0vhzfyeyALyhcCRzDxfr9493roCEM9/3J9+DpHsMZFvYIscf9M9MccwjyqTA4J+b6743x0sVbkIJfPAw2t0vXzeAGdIa17efkbZhoB12DQu+WI67qtNpyjMQb5WqSWTdXk/qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUh2Y9tdvJZA3XyIInghRr5hrs2iCboIlqorNwoR6Mw=;
 b=bGnXzi51i4nJopZ9xIzMI2z5PXKia8jzqR7lj8cBOBKHYt0225ht479Hq1okN/qnD3bm7uM8w4STnx2hO4T2rsY2FCGI9NtvgjUy8Pc+dwY2nBjLP8jE3P94mFipuB8wAS43joXGL6GrgNrpNHxMKsJ7VvR0/Qfpfe914rHKrnw=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [for-4.18][PATCH 0/2] xen: hypercalls doc update
Thread-Topic: [for-4.18][PATCH 0/2] xen: hypercalls doc update
Thread-Index: AQHZ+Cn+5m37QnKCckKGeOXOP1auN7A8Y/6A
Date: Fri, 6 Oct 2023 07:53:26 +0000
Message-ID: <81E5C18E-62CF-4BAE-A66F-8F14A91CBD48@arm.com>
References: <20231006075142.9803-1-michal.orzel@amd.com>
In-Reply-To: <20231006075142.9803-1-michal.orzel@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU2PR08MB7311:EE_|AM7EUR03FT021:EE_|DBBPR08MB5883:EE_
X-MS-Office365-Filtering-Correlation-Id: bce8ee16-c1e5-4311-213e-08dbc64157f7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Qy35UboftG3nLgpg/JiXbg3KLWyTDUKw3nSrNwEws9J9GkHr3HSzmtHutKrbx+/GDrVeJe3jhQSLcULRGbZfzG0LG1epYPKRtTO9fgSw1VxX+FiN3nZUvNROvAa0cpaXVRKdOHxt7uL36bBeDxowc4BkZrqgRSueoBnZGsshtxpDmIIJDSxd8wlE62B7PvcLJgwKekrF52Njbn0KvmjTf9r438pRaEfmfJQ+6E77srPZ0G7oOyw+AJ6UZS6uiIQl7n4HfkTg6e38PIa/igAZe3W4OLcDy2OwQtjmz3r0cJJUCvmNA77JdKIfYN/wMugDhB/IxZuSXfRHI0BAgyPgXsfQ2uDhXB0vgaV/wW9AGDtvI6U6u1xoECx898QQ3T3Zvxu4dosTmfR4HZKOgxxB6TrY9bR3/K/Hzydymcm94HCMPOLeNe1xrPHNO1wFIFlNwsGqoykPxhaRsTftcB6xC4WF48ufTQxVX+CLpNvNQgax1telEi5pzXkwir1rU14FqSx7We6gBk4GaDL+qzUvPsv7zTYLv4syNPGbjmLIrOxoemPDz70ZVSN2c/5Fx8pSfbNk6rIgU5kP7n/jpG/WMq1zYXTYE1Kx5O0ju67B97KaJ3QQYfDog5CKC3gAQvLrpK4nJ7WKkipmspcs4o9D2A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(136003)(366004)(396003)(346002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(8676002)(6512007)(6486002)(6506007)(478600001)(53546011)(71200400001)(2616005)(41300700001)(83380400001)(26005)(2906002)(15650500001)(6916009)(91956017)(66446008)(66946007)(8936002)(54906003)(66556008)(316002)(4326008)(66476007)(76116006)(36756003)(7416002)(64756008)(5660300002)(38070700005)(33656002)(38100700002)(4744005)(122000001)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C329D6D25A1BE94CA1088985AA73E7B3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7311
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9f7f0543-3764-4845-a642-08dbc64152d4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	swHu5GNp7hZFyEN1ZH2133VigXbxMbGmNtnhkD/qGi9JLe8WulKYKpZ5YTVTpZpk6o/vnDvaSAYgBmxyN0o0C0rYF4ywsMnYcdreKcY7jLajw9nRW0lJ3HBm6K7NYfW4+kg9KdYg9Nmb0WKOHOdOAfTkk0qxS9d1tk68o8Aqe/0D7mJiwX7Gc+qxfyXBMSgUBK6g3a28c7oHdaHI6qftoICUL0EYMJhi+nMYL+pyoahmJjd8JB6JM5O3eYv5UU6sUp6tAJBTMNH/og5GIZerej+bUCY+kC4aPLd1uUZSMx/iJpTmuddb+Al90wL7gfFNVPOD3X+9GV62tnQykNudSrVWmsMM1Gw+ZL7pZnYYotwSdpRblaTdjIiRrjOAswsG6i2HB81AcUOymp+pj34lspDsxcH9YsMryr7zPE0QnyK5G2b5ecZ2N/lb1ayvzuLMGVr7JK6zDwfrgMnI+I29yD6iPacOk4kBdDrKXSAkV/mWBHQ8Fy80GdKUVaHfskQQqS+grWF9Hhsn1eWwB8RE9O717Ma94uDEP1ZEj3FdJU4MObUFypswHSHoizRa/82RmLG3NN3BuzaYy78aTwEBIu2dpIcIn6ybCtL82CgpuwcPOtOSg/xSRgEdI7kme7zAfGaUtfvOwYVFz8znDtgg5FQCuyQgxdsQsupXSoykPYiifrIESUWAxTbxsdVjFApzNFiQ6xgw9ROQjy59U7M/jc3aPQ9a4D0WN1IcO/iJqXuRFBtz0HYbPIEoBgzDDeZq
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(451199024)(186009)(1800799009)(82310400011)(64100799003)(40470700004)(36840700001)(46966006)(107886003)(40460700003)(40480700001)(53546011)(6506007)(6486002)(478600001)(6512007)(47076005)(36860700001)(86362001)(82740400003)(33656002)(356005)(81166007)(2906002)(15650500001)(83380400001)(336012)(26005)(2616005)(36756003)(70206006)(8936002)(70586007)(4744005)(4326008)(54906003)(5660300002)(6862004)(41300700001)(316002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 07:53:35.3419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bce8ee16-c1e5-4311-213e-08dbc64157f7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5883

Hi Michal,

> On Oct 6, 2023, at 15:51, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Update hypercalls related docs before the release to avoid confusion.
>=20
> @Henry:
> Updating docs has no risks and is beneficial for the users, so it would b=
e
> good to have it in 4.18.

Indeed, so with proper review of the series,

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

>=20
> Michal Orzel (2):
>  x86: Clarify that up to 5 hypercall parameters are supported
>  xen/public: arch-arm: Update list of supported hypercalls
>=20
> docs/guest-guide/x86/hypercall-abi.rst   |  8 ++++----
> xen/include/public/arch-arm.h            | 21 +++++++++++++++++++++
> xen/include/public/arch-x86/xen-x86_32.h |  2 +-
> xen/include/public/arch-x86/xen-x86_64.h |  2 +-
> 4 files changed, 27 insertions(+), 6 deletions(-)
>=20
> --=20
> 2.25.1
>=20


