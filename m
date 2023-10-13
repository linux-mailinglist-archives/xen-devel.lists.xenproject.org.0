Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD917C7ADC
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 02:31:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616224.958087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr63p-0002sM-EX; Fri, 13 Oct 2023 00:29:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616224.958087; Fri, 13 Oct 2023 00:29:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr63p-0002p0-Ao; Fri, 13 Oct 2023 00:29:49 +0000
Received: by outflank-mailman (input) for mailman id 616224;
 Fri, 13 Oct 2023 00:29:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/5iA=F3=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qr63m-0002ou-Vf
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 00:29:47 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a03b8df-695f-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 02:29:42 +0200 (CEST)
Received: from DB3PR06CA0009.eurprd06.prod.outlook.com (2603:10a6:8:1::22) by
 AM8PR08MB6596.eurprd08.prod.outlook.com (2603:10a6:20b:369::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Fri, 13 Oct
 2023 00:29:33 +0000
Received: from DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::d2) by DB3PR06CA0009.outlook.office365.com
 (2603:10a6:8:1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.30 via Frontend
 Transport; Fri, 13 Oct 2023 00:29:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT008.mail.protection.outlook.com (100.127.142.107) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.31 via Frontend Transport; Fri, 13 Oct 2023 00:29:32 +0000
Received: ("Tessian outbound 0ae75d4034ba:v211");
 Fri, 13 Oct 2023 00:29:32 +0000
Received: from ba4325176711.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 224E3357-C196-4056-8F0A-FA5A3D56BDE7.1; 
 Fri, 13 Oct 2023 00:29:26 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ba4325176711.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 13 Oct 2023 00:29:24 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA6PR08MB10707.eurprd08.prod.outlook.com (2603:10a6:102:3cb::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.42; Fri, 13 Oct
 2023 00:29:22 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6863.032; Fri, 13 Oct 2023
 00:29:20 +0000
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
X-Inumbo-ID: 9a03b8df-695f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KarQf0W/wbuxJNCMhPrfn01FFwf19dtbWiRrong4gNo=;
 b=d4iWKETCnKHnQyi925rRCVbc6DhUC7TVQ7CoTUog3tHDAV8Pq3Fj0FYVo/7CyDrWpFq676WnFwhpzIk8BR0F1LLNwUiLKY/+7eLfGaL4Mc/VJp9m/NQSs9XI01fCAOvQyNYPoUo2quP1q7VUPbP3R7f0isvK4qPFmuUz2xbu+kc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c8b69955a248f21d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZjGXm/dzFiAPZjVQ0/DiIac9kb2XfvrcCpfYBSI7yGELiR6uYAJ1yU1RpIfdk03HElY2eNm3oMXVqdpLxoiv0jpwNX4xgpTm3+j8hIs54zpWtGyqQ1QnixP9xyXWlJp08MkHeb0wIke0k/wwKeG/hjG6IHGTzZZ0utiAtQWoajyD7ZxNSZlbEkNJiZ4X0waXZujFWu7rUrYh3Q3BLJmb93JTBdw0zoFBaUxs65NoBwBsrGn91cRo9ytapH1cwWXZ2QHUSj0noS9B2//7D5b/jXop2KVxpOoVZhYdpjm4KeKq4CtJ8gpHJQnv6lykmBIV8WibushvwX7ah+SeyXjIyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KarQf0W/wbuxJNCMhPrfn01FFwf19dtbWiRrong4gNo=;
 b=TFczOy7VJZkBo/VeEq5LK5rc3X3mTKkVucofvhLXOstRWKv1bCmqbHhVxzxdJOLqsyTX0vMCA6OtfUtq94PVoQqoJtmk3Hs7NU5b9CfirWJQMMvw7d6tn8/ZOuU0TUKw8d9uNS5FkxdCNgCGRWIXpE05qmNEve/4o6ep8uvK25mLFiAkJK10XMx4CI2IXVOPlSvmg5fVBeHKrupADmj7JTgdzrxhLG8ZSPUSCbCA68D07Y1pMI2MASsqHNOLTUEgIlOopK/Xq6KHjSnTHNma/k9K7gXAnQdppeT36Mr+XQU+r57Dw57zkhvTlgDgg+59oY5ZWEpxvXkeRaPfUJitVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KarQf0W/wbuxJNCMhPrfn01FFwf19dtbWiRrong4gNo=;
 b=d4iWKETCnKHnQyi925rRCVbc6DhUC7TVQ7CoTUog3tHDAV8Pq3Fj0FYVo/7CyDrWpFq676WnFwhpzIk8BR0F1LLNwUiLKY/+7eLfGaL4Mc/VJp9m/NQSs9XI01fCAOvQyNYPoUo2quP1q7VUPbP3R7f0isvK4qPFmuUz2xbu+kc=
From: Henry Wang <Henry.Wang@arm.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [for-4.18][PATCH 0/2] Fix AMD erratum #1485 on AMD Zen4
Thread-Topic: [for-4.18][PATCH 0/2] Fix AMD erratum #1485 on AMD Zen4
Thread-Index: AQHZ/TE50gYu+NMZvE+XlASHnJQ+e7BG3i2A
Date: Fri, 13 Oct 2023 00:29:20 +0000
Message-ID: <8DA9FDEC-FABB-4847-9486-BF04600187AE@arm.com>
References: <20231012172601.22600-1-alejandro.vallejo@cloud.com>
In-Reply-To: <20231012172601.22600-1-alejandro.vallejo@cloud.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PA6PR08MB10707:EE_|DBAEUR03FT008:EE_|AM8PR08MB6596:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c3a5da7-b816-4118-1c5f-08dbcb83788d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tuB3VRAQMyGPYfjMiTkgtF4eYSqdtMy8MZGg/H8Ri20rxse9E7RTIlCcqKUpUQ4vOBWjB9nyMUfWkq2CDgZGblIoJQQHXj15HvQpVfQkAAzXGb6nZ4P4jgxaE9p6lk+5fg7B5mGD9mnBBhGJYtBlXg3S4BCR7lXnrV9n2IXKlu5bpiftEMQ0bQ+AOcPZNqweI0nybmrmHszxLQez1jbJ4Y+tj24r1nnBTRt7+V1otqWWBcWvrFCxfgw/sDiQE1XVGY8HIGKIBmuiqoauOVYV8M8PK9yN3iSEsAsjgj7XsxF1Spd2OQvOLIO5znWIyrQO6Xbtp1UbgbKcpGs9bOrT4BCiuDP5uzCAP4z+pAh+deTsrcb7VaPAiMm5wNRArZ5jX26PxGpt61ddXipAtCNa6/30tSirlP++dQ7FdlB6h6zNMHJlX6ivUmzUDtSgVdrof4QNrOmJedKVRpcSm+51BctThZo6NgMSzYadcCseS4PmEpTbF3j65ejP+BEf1nRNSEyJ9kEceFpiejiGgHcCOkVpu1sJUjNpeon9eWecwYFqsashZL6j2i4TBDEKkC82hn/eErjUy1XJQevLl9WnCmGE/niMO0/ScKhCX9XbzxucRqOSfkN8CO6TN8d2hLZ9qMBnt1Rb0f/MyUBjQq5CMQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(396003)(366004)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6506007)(91956017)(53546011)(966005)(6486002)(6512007)(76116006)(2616005)(66556008)(316002)(66446008)(66946007)(66476007)(64756008)(54906003)(6916009)(71200400001)(478600001)(41300700001)(26005)(8936002)(8676002)(4326008)(36756003)(86362001)(122000001)(38070700005)(2906002)(83380400001)(5660300002)(33656002)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <02937F5EC101A24B9441D8F25E050060@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10707
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0e095e23-7962-4757-f3d6-08dbcb837130
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UAbHUmjT3LRCobgQ5Y7eaZBOlBf9CzSTyGN7YaZCtOQYXPeo89mftx7brRIBQRevp9m/dOencMECXKPqXLJ+XtO8azukCsBtVneZ0L3xRx4hgcG2vGfJTNuzNqs+EeDdBcbvvA+DqJEhnkbp6QNMIvDd4c0kTR53D1p+9pNdYbhpaioo92HuBBwOW+h3AIZE5wQ+qKgxcuLj3THu7XPpbmyhya8Z6s34/bs0UT1ucp+9GWr6L9l7TwnIhpOhAP6beHpktXKb6TGbxSrSih8cvqy/WccgOMYjlFICXob9a12YymlSvk2CvnZm2fPTOGat+CWzKHPaxlieDKSc2HmOpIBjXvPUeONelJBEWboZiwbYU/B3FCJhpbKdevu981GR5qgs/Hh8vIhoXek9U5r2DVMdqnHH99C+jAuX6w9TfhNqdr4EhYQzh4jTa3s489DwtnGgjyKEETPbLvdE8/NOPSLtAhpsJXY6shv82HBt5FcIOETtqhvb1xPOyjIZowdxeKUtMJ36LTJvFzF4WA9i+lGCty/kFBCJhq5dTciGeRSdNs3kKPZL8R8JwiIMb6dYQc1TPxdlIlJYmeHTy21IO00gcIpiTAllTVM2dvxoA9Xg6Zb5O2whl32FyAluCfwxJf00/weGuF1Kn22Hpp9gUCBbtJNlsj9HRRe3RFXkel88JOHcTXE/tuY4/OCOs/AF3EFXWQ4SFCAhJxW+v+KSpxbanJM4sD2WZ6CjhqKjkko=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(396003)(39860400002)(376002)(230922051799003)(451199024)(64100799003)(82310400011)(186009)(1800799009)(36840700001)(46966006)(40470700004)(4326008)(6862004)(8676002)(8936002)(70586007)(54906003)(70206006)(966005)(6486002)(83380400001)(36860700001)(36756003)(356005)(81166007)(86362001)(82740400003)(33656002)(47076005)(2906002)(478600001)(40460700003)(316002)(41300700001)(5660300002)(40480700001)(26005)(336012)(53546011)(6512007)(2616005)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 00:29:32.6256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c3a5da7-b816-4118-1c5f-08dbcb83788d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6596

Hi Alejandro,

> On Oct 13, 2023, at 01:25, Alejandro Vallejo <alejandro.vallejo@cloud.com=
> wrote:
>=20
> This patch should make it to 4.18, as it prevents random crashes on AMD
> Zen4 running outdated microcode.

Yes I agree, so for this series:

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


>=20
> Under certain conditions Zen4 may corrupt its own code stream when SMT is
> enabled and STIBP is not. The Linux thread in which this was highlighted =
is
> in patch2's commit message.
>=20
> NOTE: Still running in CI as of now, but tested locally. Pipeline here.
>    https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/103489=
5039
>=20
> Patch 1: is just a minor refactor to ensure we don't get microarchitectur=
es
>         of different families mixed up now that we have 3 different
>         families involved (Fam17h, Fam18h and Fam19h)
> Patch 2: The actual fix. It involves setting a bit in an MSR if it's a no=
n
>         virtualized zen4. It's not a direct copy of the Linux patch, as w=
e
>         have started using macros to find out microarchitectures from
>         CPUID bits, rather than relying on models.
>=20
> Alejandro Vallejo (2):
>  xen/x86: Add family guards to the is_zen[12]_uarch() macros
>  x86/amd: Prevent potentially fetching wrong instruction bytes on Zen4
>=20
> xen/arch/x86/cpu/amd.c               | 16 +++++++++++++---
> xen/arch/x86/include/asm/amd.h       | 17 +++++++++++++----
> xen/arch/x86/include/asm/msr-index.h |  2 ++
> xen/arch/x86/spec_ctrl.c             |  3 ---
> 4 files changed, 28 insertions(+), 10 deletions(-)
>=20
> --=20
> 2.34.1
>=20


