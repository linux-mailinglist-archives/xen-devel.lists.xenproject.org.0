Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B7E7B0126
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 11:58:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608826.947580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlRIo-0003EP-T0; Wed, 27 Sep 2023 09:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608826.947580; Wed, 27 Sep 2023 09:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlRIo-0003B5-Pf; Wed, 27 Sep 2023 09:57:54 +0000
Received: by outflank-mailman (input) for mailman id 608826;
 Wed, 27 Sep 2023 09:57:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x8T5=FL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qlRIn-0003Av-8d
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 09:57:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 518f03cd-5d1c-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 11:57:50 +0200 (CEST)
Received: from AS9PR04CA0124.eurprd04.prod.outlook.com (2603:10a6:20b:531::11)
 by PAVPR08MB9355.eurprd08.prod.outlook.com (2603:10a6:102:300::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 09:57:46 +0000
Received: from AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:531:cafe::9e) by AS9PR04CA0124.outlook.office365.com
 (2603:10a6:20b:531::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21 via Frontend
 Transport; Wed, 27 Sep 2023 09:57:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT005.mail.protection.outlook.com (100.127.140.218) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.21 via Frontend Transport; Wed, 27 Sep 2023 09:57:46 +0000
Received: ("Tessian outbound c99fbc01d472:v175");
 Wed, 27 Sep 2023 09:57:46 +0000
Received: from 3356c32d4354.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D6CDD614-C9C2-4E29-AA17-8DD98541F20B.1; 
 Wed, 27 Sep 2023 09:57:39 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3356c32d4354.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Sep 2023 09:57:39 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAVPR08MB9061.eurprd08.prod.outlook.com (2603:10a6:102:325::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 09:57:36 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 09:57:36 +0000
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
X-Inumbo-ID: 518f03cd-5d1c-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHC7WZBYfbPZkcxCyvkYvjbnV1eVTuoXV0VksTsp78E=;
 b=sn0/Ro7yFm9ZJ2KacwANuOk1gPJtuKads/EhxOpflk3rquBkAvHG0a58eggEAXDSX1IJD6F5DfkTPbsc/woWmGxXj5+dKYXyhOViQFBXCnFLmdaf9WNO4x9Cd2nOggPetXMy6apPm5lzdA//7EhMoDU7g/FbPwpKdegz8wxm+VI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e5fc3fbaef466447
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crTHIcIMUnzRVd/8G0TGwK6Gdho9TjrMHgPS+Ckw8hE6LvxdTU7qUjPXLvW4BPQGg0qidyEiX+7gSOJ7X7e+/+c/joEDmv2mj7WAGFagUp0fwj6ooJV3bHOgBSv/ulR6EZrcmqhyXUXtPzSVgiUlmdr1pdDbtG8FIlTW7Q40ttBDjJwQjl3/GY7KV0MhvLmo7QXZEM190he6uK0DqazqGBI/zECHGA88Q4O8Dd8W7MmilZAeZWwlV/e2kSvgwgnwmuCnamdGM4CKuxYvnBx96xpKASqcFZ5QU4mHOypVhK3UeV3dReOAGp0jHkf6tJe8aL8kVM/Opm7PfFAz6KzGGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHC7WZBYfbPZkcxCyvkYvjbnV1eVTuoXV0VksTsp78E=;
 b=mVhAKesaYoZIptyE7IMtdZA2LpWt6aryE7VZpqUnSbePIvPGtWwgURdGeff+i9sZ9pUllBW0ThtT9WYtxtLmNynm0rwGeUbtrTldQIwaDorlru2X55HwiWc3gWEe0Hce8tsyuZTtbtHgqHRlJjvjtXpasdJGV4DaiJwNJxaY4pTlwun2IBIr2MV24inv/WYNjrmXHlseFhyQITO+HLZfKTfDTa5ZkIYu6YWw7ytzXfB/eQGwf+aVfLo2CUD9ldIv4LguRaRlo9XtItd/YhuIgtHAQdb6Jm7pyVJF/N4CwcUOoxE5gDH0Qya6dIsA3RisWz7BHBAvSiX6tAGAHEvC7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHC7WZBYfbPZkcxCyvkYvjbnV1eVTuoXV0VksTsp78E=;
 b=sn0/Ro7yFm9ZJ2KacwANuOk1gPJtuKads/EhxOpflk3rquBkAvHG0a58eggEAXDSX1IJD6F5DfkTPbsc/woWmGxXj5+dKYXyhOViQFBXCnFLmdaf9WNO4x9Cd2nOggPetXMy6apPm5lzdA//7EhMoDU7g/FbPwpKdegz8wxm+VI=
From: Henry Wang <Henry.Wang@arm.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	"xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, "consulting@bugseng.com"
	<consulting@bugseng.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei
 Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Simone Ballarin
	<simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH v2 0/3] docs/misra: add documentation skeleton to
 address MISRA C:2012 Dir 4.1
Thread-Topic: [XEN PATCH v2 0/3] docs/misra: add documentation skeleton to
 address MISRA C:2012 Dir 4.1
Thread-Index: AQHZ8Shy2mMpVlpND0C+/CYXjLA/CrAub7eA
Date: Wed, 27 Sep 2023 09:57:36 +0000
Message-ID: <038E9560-2F91-4098-A681-9BC7872E986B@arm.com>
References: <cover.1695801813.git.nicola.vetrini@bugseng.com>
In-Reply-To: <cover.1695801813.git.nicola.vetrini@bugseng.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAVPR08MB9061:EE_|AM7EUR03FT005:EE_|PAVPR08MB9355:EE_
X-MS-Office365-Filtering-Correlation-Id: 9760cfb7-846d-4f79-211a-08dbbf403381
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qVbQCtJtyJKCWCtM4ziG5Zy1tKJqpwovCCkwWvO3qwSuvM1WGEZMDYDGseJuyDh88BEdmvwtDIPSb0eaK6EFA56c0dxk3tLLsVpNj1WX5BpNYSeXZZhn1R0nw+793uPt/EM5lGHS8F53WplN6mcoxQU4agCa4R5PM36+uRnT41CseEnHH6V8zLcEX/s1U4VplBfjzbAPGzxpByE4+MSbu4AVKqU5xznlmUDCpJ2IzD6mjrhwXLJ7qUmdVwLNqCe8CnIzT/sEv/8Norh3f2l8P2ZqWkSWlAV/cE29FPvqEhHECuynaEwMrigWM5sIbK0EHbENCYfh94lKCMGqOC7imWpX0zyK2OpXicsiY/xQoCNuI4RwMg/7aZ8NIImHaPyFGWIvucjJ585VsFssuLx1zk0QK17dAlcyd6H/R1WXL34wyGZTvrtXbGuA6CElGyC7tTDTG7RWdic5n4iIDQ5dK3IyQ/iBH7wq2tl2MiP7gBgH1pYhLZn4TzJhm5ikkOgjhFzERmXuOMBgGVnygrTtxfQ5d6VUFO6ojZlxiQ8yjf7O0w1KJpkx8v/vqnv++wQHkJmaBF4gdwIkTejuGVrRPJYF0uhC+3mIwaERik0ueCf7MHCSF0lrNVu2VaRQS78DzfnSjvxRMNNDchWcKu3m7Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(346002)(366004)(396003)(230922051799003)(451199024)(186009)(1800799009)(83380400001)(6486002)(6506007)(53546011)(2616005)(86362001)(36756003)(38100700002)(38070700005)(122000001)(33656002)(7416002)(2906002)(8676002)(71200400001)(478600001)(26005)(6512007)(66556008)(8936002)(4326008)(5660300002)(41300700001)(64756008)(316002)(66946007)(66476007)(54906003)(6916009)(76116006)(91956017)(66446008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1FA60C29E9D61146857E4C9AEDCA03E6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9061
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6e95b794-cc0d-4e90-79ec-08dbbf402d70
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+lvNMENQLDtLbqyiCc8dfU5ZCnWA4ZsNG3lpcEbfezOWUiPab2m4IF7FKAxZurqx2zgNW2j/JowP3Kt9C3WlW0ANhCABWZb/zqiBhplozI7VbJcYrFGDjdMAwHpJjp44Z09T6gQ5mBub6/smx8fyHN5dYmkp8eqpiPpaHQzD0ugTJcMvpVnw9lLzJ/GjstMY9URBmQ4NeDWtfzyo/qg28PvxFKRoyflesIryLPDlxtJwTbeQeCQE6p10KkF+DBS0FsB1RfVIHzji9nzxqK3tb7CXYbGFGJh8n0AivwjXlT4DSgb12VA9dMG1TtLwDLappep5rEs6ECU3SpvpqJWvJlDMUc2DMZrgcNw1BCegAGSSLFTBWK/ZbzW99IeDJoOwg7YNU9glK/+1hfhooq+jQ/+01L2mbAMAiIcsZLsbt5nbD9eQ4xp8TP+C1faKpdU+SV7TVvhYDFmXl0p1nA7oPa2MT5tA3DwG+WpyY+jzUY+ip5i3vS8xpaSqmNGS3rKJ9qzJg/Ln1nlCsOD7sMxFn6SjmKRhymAoU1V1xJVPxNrBcjqEkF91Kp0eIe2jkJCotcuXhi8l7rTEEFDuVdcsjGCSwNbDrbiLT38y1M0tQoODufKzlSeJcd19mnIvpwYn/peYpgkegn6SCTpxoQmVYaD8aplKQZMbYrtQfQbrqK856gDwqloUsl7aHoMzUvOxuRfx7m0IBbJDDbu3fqtPMX3QtyWlo8X0KRXUbR/wcwvIu9G+8c+rhR0L44PQUYRc
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(82310400011)(186009)(451199024)(1800799009)(40470700004)(46966006)(36840700001)(40460700003)(2906002)(33656002)(47076005)(26005)(2616005)(53546011)(336012)(6486002)(6512007)(36756003)(6506007)(83380400001)(36860700001)(478600001)(86362001)(82740400003)(81166007)(107886003)(356005)(40480700001)(5660300002)(70586007)(54906003)(70206006)(8936002)(316002)(4326008)(8676002)(6862004)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 09:57:46.5188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9760cfb7-846d-4f79-211a-08dbbf403381
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9355

Hi Nicola,

> On Sep 27, 2023, at 17:52, Nicola Vetrini <nicola.vetrini@bugseng.com> wr=
ote:
>=20
> The headline of Directive 4.1 states: "Run-time failures shall be minimiz=
ed".
> Thus, it requires the project to supply documentation that pertains the m=
easures
> and techinques used to prevent run-time failures from happening. For ease=
 of
> reading, the documentation is in RST format, but since ECLAIR needs a sou=
rce file
> to check that the needed subsections and their format is the one expected=
, the
> Makefiles for the docs/ are amended to generate such a file.
>=20
> The format and categories of the subsections in the .rst file can be
> customized based on feedback from the community: the one provided is just=
 a
> basic skeleton that should be tailored to the project.
>=20
> CC-ing also Henry Wang, as these are just documentation and CI changes

Indeed, so technically it is safe to include this series to 4.18, if this s=
eries can
be properly reviewed, I am ok to add my release-ack tag for each patch:

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


>=20
> Nicola Vetrini (3):
>  docs/misra: add documentation skeleton for MISRA C:2012 Dir 4.1
>  docs: make the docs for MISRA C:2012 Dir 4.1 visible to ECLAIR
>  automation/eclair: build docs/misra to address MISRA C:2012 Dir 4.1
>=20
> automation/eclair_analysis/build.sh   |   6 +-
> automation/eclair_analysis/prepare.sh |   4 +-
> docs/Makefile                         |   7 +-
> docs/misra/C-runtime-failures.rst     | 200 ++++++++++++++++++++++++++
> docs/misra/Makefile                   |  22 +++
> docs/misra/rules.rst                  |   8 +-
> 6 files changed, 240 insertions(+), 7 deletions(-)
> create mode 100644 docs/misra/C-runtime-failures.rst
> create mode 100644 docs/misra/Makefile
>=20
> --
> 2.34.1


