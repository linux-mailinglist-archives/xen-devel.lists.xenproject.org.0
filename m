Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 112EF7E589C
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 15:23:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629306.981411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0jT3-0006yX-Mq; Wed, 08 Nov 2023 14:23:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629306.981411; Wed, 08 Nov 2023 14:23:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0jT3-0006w7-K6; Wed, 08 Nov 2023 14:23:41 +0000
Received: by outflank-mailman (input) for mailman id 629306;
 Wed, 08 Nov 2023 14:23:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KPTf=GV=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r0jT2-0006vv-II
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 14:23:40 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2062a.outbound.protection.outlook.com
 [2a01:111:f400:fe13::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 682427b0-7e42-11ee-9b0e-b553b5be7939;
 Wed, 08 Nov 2023 15:23:37 +0100 (CET)
Received: from DB3PR06CA0023.eurprd06.prod.outlook.com (2603:10a6:8:1::36) by
 PA6PR08MB10444.eurprd08.prod.outlook.com (2603:10a6:102:3c7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Wed, 8 Nov
 2023 14:23:29 +0000
Received: from DU2PEPF0001E9C4.eurprd03.prod.outlook.com
 (2603:10a6:8:1:cafe::31) by DB3PR06CA0023.outlook.office365.com
 (2603:10a6:8:1::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28 via Frontend
 Transport; Wed, 8 Nov 2023 14:23:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C4.mail.protection.outlook.com (10.167.8.73) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.18 via Frontend Transport; Wed, 8 Nov 2023 14:23:28 +0000
Received: ("Tessian outbound 26ee1d40577c:v228");
 Wed, 08 Nov 2023 14:23:28 +0000
Received: from 999797919d3e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8F508F75-A054-41FA-B63D-6521F05C74F4.1; 
 Wed, 08 Nov 2023 14:23:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 999797919d3e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 08 Nov 2023 14:23:17 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS4PR08MB8218.eurprd08.prod.outlook.com (2603:10a6:20b:51d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 14:23:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9%4]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 14:23:15 +0000
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
X-Inumbo-ID: 682427b0-7e42-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=J6eL7BknQIZUsYq5K7YugO7CA/CoOuqvjC8CVOtA0jhRrohzbNGpeTIkeYGLG5xxYgMHl35Qt81T7Tx4lljJUKBY/PTAWT1MtXZKd2F4b8/jc2HmO1gso3Sb8mLHEeNbtzoObCIF+7WYe7fT9Kp1pN4n6thrK9OhTGZstxJJmJMRrxk4AZAN6gas/7Zbr7Ww6jvtC20z1JDRbj6m9hb+x+LC6u5ra8ql/Tdws/36+IPcpH31WVAYI59viNWZsgyzOKYgvrcF4e6iSk04tVcaaWnLIwDFwq9o65KW148eUshZkeUj9GZix9uPAYWC7ZbHwo+PGNJF2PBcIPuOj4SpIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=id8VAVjWPZ9bUs24LdiLJmrNCcFqQQQTDamxpyRtxew=;
 b=C0ixWTZJvSGZD/FqSOSVv15AiYGb+oK6MU9sVKBdWdjgqj48zT/mhxtch3k5pSvQfktngR44iN5MO+v2rm7gficr86vPaKJF1/d73QtgaErVKk7L1l85Lzijsfkj1XH1dl7qHLmSObY5netoXbbHMGXitiV/9iKGjn03ynwPy+nE0H3ajvg9c4VHD4b6mhae4YuqXbglQyUtfC9ox+5VcGXMV10257So5lyEwOF2gvqrgX6WiPZrpRrx44ujyELDhKWf1f5amZ2kqMejAbyZjs8q6J3Jcl89ghAF7KyuOhGs5QxtdYPBjfW+u72CrDk0qxAwLl+hJ3C8b2FsiF7FqQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=id8VAVjWPZ9bUs24LdiLJmrNCcFqQQQTDamxpyRtxew=;
 b=N5tmmZje4oo8mjwU2Cpug9GJz2lK+pg0uBCJJM/pZJ6nXXda5FMc2L+J5d7amR/Hk94MVNt23FWi2lYYPsM1MmcPM6BmnxhsFOg/TdEL8/XP/9ieO72jJXf2PGdiXMKX0zLeF0cUx/MhLtiahAxELr06bJppApf+4Pzs/uAqrWk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 81024fb3409dca45
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F7u1tKCNqqavWkubs2TgdVdiLTYZKhiXQGQ9cOR0U2x5REmwx8eiAvYIR2KQ9a0KF7V6NQha/FtxQfXfQwAfR0ptF44aFGU/qEhE1h5E950K5cT5Rp4yaS1BRjBaq2WIWNZvOgSCmb/ePpJQ93jhgznDWvDrBwIoXhSXcyi55Yxc2iIgXJOdFrzfl5KeTVf4an2o616GQjck92ic+z2AT4hut/AuVsN9OUd7/+jswpF3YbgvZevAvCOzGjmc6vmgvs5WcdAyoNJttyzNLij/+9zhoQI2nLauN7OYlbDOkmOM4l+gzi6ff15avSYW8Q3Xq3oNfU+jIOgaxDS40IWosQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=id8VAVjWPZ9bUs24LdiLJmrNCcFqQQQTDamxpyRtxew=;
 b=gJM3YnPTwj6tFxifPPPwfU9BwOYGVeMExR08rNnocJRPOxth709OAkrTMURg/tzdYDdIywDP3su8JcFKsi5L/ZBcTVcAxXzyEMiiAt1SwMK5bnc1B2Bb6URJaHqqGO4wUfC3eKwie8kaC4DgheqIvUB8HfmQKMcG6DJ3loUSAas8UXqSw19ss7kuGP53KriyaFb1j4R5qk+38jj1ZoE2RiWatAgG0ThqrWqLI+wIbiX2kigF9zwz98DVZ8c0OW/x3g4F0lj1fVL3YEEWeEQVr4CCcgAW1YlYMJaqvXeyPCxQbEDs1KB46m/42KogpzPWMYre0wVn/4fTFEX2+MiC8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=id8VAVjWPZ9bUs24LdiLJmrNCcFqQQQTDamxpyRtxew=;
 b=N5tmmZje4oo8mjwU2Cpug9GJz2lK+pg0uBCJJM/pZJ6nXXda5FMc2L+J5d7amR/Hk94MVNt23FWi2lYYPsM1MmcPM6BmnxhsFOg/TdEL8/XP/9ieO72jJXf2PGdiXMKX0zLeF0cUx/MhLtiahAxELr06bJppApf+4Pzs/uAqrWk=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Federico Serafini
	<federico.serafini@bugseng.com>, Luca Fancellu <Luca.Fancellu@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Roberto Bagnara <roberto.bagnara@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.18] docs/misra: Add missing SPDX tags
Thread-Topic: [PATCH for-4.18] docs/misra: Add missing SPDX tags
Thread-Index: AQHaEk6K5LkkMqKtJkeH7p+zHgDrAbBweY+A
Date: Wed, 8 Nov 2023 14:23:15 +0000
Message-ID: <25232280-EA3F-4F1B-9D10-C48168D9BB86@arm.com>
References: <20231108141847.47697-1-andrew.cooper3@citrix.com>
In-Reply-To: <20231108141847.47697-1-andrew.cooper3@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS4PR08MB8218:EE_|DU2PEPF0001E9C4:EE_|PA6PR08MB10444:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c5fc13a-511e-4c9a-3f1e-08dbe0664724
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7EHrfWyTXARHDjLVT5fNiMO4OKbzH623neCUYB7EeBGES1FPAuft5DdEgsTMXmXLGrSa1lwfSzNU9VG0bvASc/iaMN/Gr4zaUyTCFMyPidDA+k542LyG83yeoAPbsnvn2fr0UDUL0eBzvDrBPE2B/ZYYOF5/9zArwsKWYKo+BiDbBQaRlvxnD6iJDqdDBr877piiqEsi/H2D8emJy6RhkNQfNuk2TmUbpe43L0Q19ykZCQlYjZqI0KpcRC50FSxiYbRcydWytVgwSQ7Ft/0KFRWAXmsNY9YzLc7o7Go2nENKBO0u2G5ut3CrvU77xbbE71cVJvYZi2GWfoU/uVO2lzZqbpvN7je3kqnh9CEY6BhegUMfsYE/54MTWb5zFgV2kGIq1SGFdelik11/55eQEUN1aYv9bHbPmawQtlm81p4aRdCc+2rAyfgUAPLPZpZCIUpHkInrJqtiXNkYKc++Fy5KJWhTevAyKBg+coBQLbdkRo+VtGzgnimNtCHn37GSKrfLkn+1xMKKWuMW+XPHACYQiwQ+0yEqrXV88SLwUQN5z/R09pHBsiuffmdqDMx+j1Batj1zGNE3wpR267ClQ7vRlI3Qh/pyoWapR8/RoxOkJqrTmJWULlkQ6Uh7N05bjirjlIJ9z0kPMpZys52yYw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(396003)(39860400002)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(122000001)(53546011)(6512007)(71200400001)(26005)(2616005)(66899024)(6506007)(316002)(64756008)(41300700001)(66946007)(6916009)(66476007)(478600001)(66446008)(66556008)(76116006)(8676002)(8936002)(4326008)(36756003)(54906003)(38100700002)(91956017)(2906002)(4744005)(33656002)(5660300002)(86362001)(38070700009)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <668CF100A5B53949ABA7375A5D673538@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8218
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	104769db-4ff4-47fa-cad4-08dbe0663f35
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yOeE4f34CSNQWXBbWttM0kKqJY/mc0bx40fiXAB5CgGtnHJd1JKzUhRPdygAhTerQn2g8kjd5f9MYrQnd5azUmF5RuMjtoOzk8x3t1+jMSrfbxTm5dRMXn+KesB4P7T9xgmmPHd+erCPANZ1OWfvTlSYs8NiUr8ells0V6z+fYY3nASJ9zoR6O3+xMtAW1dBgafP5XsoP9QZORGoGQvR1frA70f2DC7o7n7Xh912BAD+NMBLDh5e2i9hl5kC+55A6OTdbWjDsFT45Uev0Anj+OpJ+dToCSg09s6QKrN1+KXfk6yP1i/L0jG5075bjzx66F5/UunQdU6sFB6AfX8RuzW4FOL1Rg5So3yhFYEoGUmgVpRXL3urT6LovlJOycBH9CdshzHtDLUXt7bBXyupI1azlKYvgBifvUJj1Ps/jKzOjHSZ7WVFPSqKEq5KHQgBl45b6H16O5sm0GUilkguFMPAxGrAPIgI8iBhq7U54v9H+XxIb5g1gsYK14qfeXks+pDBHIxIqrlO5rRbFnGCDUdIbwF2qq4Wt0qDZv5nHsE5ygDPFUUWW9dKzpT/RvUpr40meNTPxDZXm+lgjPdqn7+cpaimwO5683Ls93Yb2y+8plF5FJ12Ck+xd1Agg2HMoubmSHuOK0t7q+MdlyK7UvzgJk2Pr+Rcnm2FwaxjGSxodMQE2H9JTZc4ETCwS4VqEscTFvaejxu9IYCikDWkvcJ8y5KBw/7Y+cjunZ+40dDMoZTmC8xnaSB8BSW2wBlF
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(451199024)(186009)(82310400011)(64100799003)(1800799009)(40470700004)(36840700001)(46966006)(40460700003)(66899024)(33656002)(40480700001)(36756003)(8936002)(36860700001)(336012)(5660300002)(4326008)(6862004)(8676002)(26005)(54906003)(316002)(70206006)(70586007)(2906002)(4744005)(107886003)(47076005)(6512007)(478600001)(41300700001)(53546011)(6486002)(6506007)(2616005)(82740400003)(86362001)(81166007)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 14:23:28.7900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c5fc13a-511e-4c9a-3f1e-08dbe0664724
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10444

Hi Andrew,

> On Nov 8, 2023, at 22:18, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> Two files are missing SDPX tags, but are covered by the blanketing licens=
e
> statement in docs/README.sources saying that RST files are CC-BY-4.0
>=20
> Fixes: 3c911be55f1c ("docs/misra: document the C dialect and translation =
toolchain assumptions.")
> Fixes: 7211904e09bd ("docs/misra: add documentation skeleton for MISRA C:=
2012 Dir 4.1")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Federico Serafini <federico.serafini@bugseng.com>
> CC: Luca Fancellu <luca.fancellu@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Henry Wang <Henry.Wang@arm.com>
>=20
> CC Henry as this does ideally want backporting to 4.18

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry=

