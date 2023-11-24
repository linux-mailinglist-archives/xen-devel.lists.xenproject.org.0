Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAB67F70AA
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:00:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640360.998386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6SyH-0007pt-Ck; Fri, 24 Nov 2023 09:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640360.998386; Fri, 24 Nov 2023 09:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6SyH-0007n5-9O; Fri, 24 Nov 2023 09:59:37 +0000
Received: by outflank-mailman (input) for mailman id 640360;
 Fri, 24 Nov 2023 09:59:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vqky=HF=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r6SyF-0007mz-K1
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 09:59:35 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2abe1532-8ab0-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 10:59:33 +0100 (CET)
Received: from AM0PR10CA0127.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::44)
 by AS2PR08MB9152.eurprd08.prod.outlook.com (2603:10a6:20b:578::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 09:59:30 +0000
Received: from AM4PEPF00027A67.eurprd04.prod.outlook.com
 (2603:10a6:208:e6:cafe::41) by AM0PR10CA0127.outlook.office365.com
 (2603:10a6:208:e6::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21 via Frontend
 Transport; Fri, 24 Nov 2023 09:59:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A67.mail.protection.outlook.com (10.167.16.84) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.12 via Frontend Transport; Fri, 24 Nov 2023 09:59:30 +0000
Received: ("Tessian outbound 385ad2f98d71:v228");
 Fri, 24 Nov 2023 09:59:29 +0000
Received: from 2403c3193a79.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D362C038-C499-454C-A02D-0E026B38F89E.1; 
 Fri, 24 Nov 2023 09:59:23 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2403c3193a79.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Nov 2023 09:59:23 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAXPR08MB6717.eurprd08.prod.outlook.com (2603:10a6:102:131::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 09:59:21 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838%7]) with mapi id 15.20.7025.021; Fri, 24 Nov 2023
 09:59:21 +0000
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
X-Inumbo-ID: 2abe1532-8ab0-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AXTZcTxSofkX4N3cKcRMRB34zW9WEGsOsuwTU5orqami0QA3AXiHwQFAwzQuYRZmD5bCBK6q32RSlQb2IdNgQ6weThWMHo+/fpXDzrq5CA7PET1V4J5ZvKrQRR04GNcyrogk5GxvV8KM9Pt/ydkg2pbde1rUGr35KpDb4W68ir9/Juwga9UW9bwBZB6vWMGaji+DnwnnG/o5aR0hWIyOOAcJmj/zBFZeL/embiPKtz3OW49dEnK+gY8MM8O9vSuf7B96WhYHKV6EvIQcu+bsuDbnpu85T31hwQ1PU6mID9iW2gPYM09CKLEj5vyyhdiBKrp3Du4x1nFOlVcGFjtXwg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+qYxLRxcr2jeGg6gjBYhvlFUVf6lgJtvM6EpGH6eZk=;
 b=jPlOZdxsDn6j+96/sydMbL0yEuaC7ZIVT9FV9KCwYZ/aewfYNWpM1/BIKlbqE/DMzVIpSWodtW7xhG0zemDMM2dRapVDT32tuMeVCfpiPoxOBSpEQ1vHG7NTkIL+sNpowldnWKZZznOO96wmCDbR4D51RJLvNI2kZ6jjM3WcNsg2HfzOkLjlPp6M/4EwqrZlkKcXiB3EpffglkYSK0Hpamd7bwiqjdtvRZpANT9R2YbUP/2JUE3RAfpFkwzxjHbXzp31x+N/2uFmMxczGnvQRgIXcJtkkTFRgKJb/0EZ+2OjCt1yCIl9i6L3IHT6iH5NJC89gHH74wnzMeUN5fNJiw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+qYxLRxcr2jeGg6gjBYhvlFUVf6lgJtvM6EpGH6eZk=;
 b=PBwl8G6FzcaHLQ5BHrnjz4Bg/EMbl2EHMW/ffRtzHFAl31PgKOIENzFTUCQp2Am0ofp4H2Z3rON9p9N3TPBLEf7qdqjpPD1Ge2U5jtlLrcpwZn5SluGSq+6iYWsihWmxdLmoMzMC/tlSQhH/qZhgjQ1PHWhpIZKrVgttSmLopUE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b2d1ff72ed91b03f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mchgnW4ffR9WfAw5Eh1wGjhEBxCvZ6jZqEL03+urPoWgdZgYS/zUgzY7ZMQvw01lQFQ1/pFJVm4WFyEKJMB9XmUjbO7DSuuq8SUdROSsqzDMUrLM2JiivPvA61a/8BwQwNQHxe/Z5E7AUvsX3qNQ8mSiIA8LmQBmBwf9pFViBKWfvRkzy0gV9VqDmpWQ/JyoxqVGHSBFUOfmmBp0sBVlv+jsQziWQITYs3+QABnHyGh8b8OgQye8Qd66Tc2JDlgNmXyTrdFAV9BkhO5QiiftSkE1sEdZrBIINWzRt5cC/D5UsGz4WGhLzMeO9FYErqaFQOQ+qaGXFd47ZApZlYBOJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+qYxLRxcr2jeGg6gjBYhvlFUVf6lgJtvM6EpGH6eZk=;
 b=ifMRwIEUVuHUMciTIlCSy5XiomoCYSMmWUTLhADp9UmY6ItwBjgznpTr2SGE4lOcEtn09mfyCQV8yG9IRzRXhYlCbArVOyfH+TrlOv84PgkP07wDdSRTc0nZ5jb1OQRRoZOUW7S/GtdpD1QFFGeH2e0zhAYiRA0QtfqqbZuUblZYFybsgk4IscE7Hzwc4DBxWnAT3SbQ7bkgL01D2TC9DBL/r80quq8AktBYTisQPHaiht9MEYHqPGOG9ki3Bgxq0GBq0qDvI7sKlDfMOU1W7UTbQcMhM4H4sw02hsa4NwGLRF3dn2IzrCy0k00/oAu0nhgGkSb3iNByiewBJlyTQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+qYxLRxcr2jeGg6gjBYhvlFUVf6lgJtvM6EpGH6eZk=;
 b=PBwl8G6FzcaHLQ5BHrnjz4Bg/EMbl2EHMW/ffRtzHFAl31PgKOIENzFTUCQp2Am0ofp4H2Z3rON9p9N3TPBLEf7qdqjpPD1Ge2U5jtlLrcpwZn5SluGSq+6iYWsihWmxdLmoMzMC/tlSQhH/qZhgjQ1PHWhpIZKrVgttSmLopUE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v6 0/5] Fine granular configuration
Thread-Topic: [PATCH v6 0/5] Fine granular configuration
Thread-Index: AQHaHruBt1jR61BwukqrbWb7AIYNFrCJPEYA
Date: Fri, 24 Nov 2023 09:59:21 +0000
Message-ID: <E9D1FA66-DB03-4F52-9312-DD34FA916367@arm.com>
References: <20231124094841.1475381-1-luca.fancellu@arm.com>
In-Reply-To: <20231124094841.1475381-1-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAXPR08MB6717:EE_|AM4PEPF00027A67:EE_|AS2PR08MB9152:EE_
X-MS-Office365-Filtering-Correlation-Id: 50c3d0e9-6ad9-4c3e-5814-08dbecd40d3e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /dsC6QVW4S8oekkq7hTv3VHaSOShRp135Tq38rrCRYtfd5pHJriv5JxbfE4i5rIzg1kcxQtgELzco6rsWLzlp8hL/pPmHz57H7p/ml07DiS7oTSW16Gj338uAI57yNWc3mSrrupoUiW2eCEmmyzOiDUTw91hnQuQ/7pdeI5Fa9H2/PzxWFTL/Jiip90PKcsQXPlN5Zcmmzdq1p+i9yz9AXxrT5TS+qNQ2py1pWvneZzcDSm7DhPFrZ7wtJcDbvMRub3hvLtkC2y/fQjeoJUr1HVaDPduxy4f9ZJSZNYVb1kDYEyYrs6SXCIfV4Laqtj3unAWYLU1m+qZzTzNXlZZN6hOmlH3MFZQW9yrpa+CRC+2nwJHA8Vqcpz8Pfp8ruRWR2w/x1MsEyZrzaIuEg2Fkk2FEcoPwSKKSp4N7/CGRPOBV/zMF9ym4Fdwq8N/ZcFfbNzLCFriNFaSWv6zRo7QYRqvLgOU1ZzlPCAGiQL7eyLwEgYPt7jZhk+D70us0F5JVw/MAfJ+u74hfOBLvR4CxGJsoRtNflqwUNVP5XK8pxuhqYaj+d28bHwjsqU2Nn5Oa2PNl3xnRTG5Yq0lUlMg817J4HezZGjlUYZdw4Xtjngylwbf9lgvs381UkGn3gLAYA0AQaJanUtr4NQvGTeoMA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(366004)(39860400002)(136003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(122000001)(83380400001)(6506007)(26005)(41300700001)(6512007)(2616005)(53546011)(38100700002)(36756003)(6486002)(478600001)(71200400001)(33656002)(6916009)(316002)(76116006)(66946007)(66556008)(66476007)(66446008)(54906003)(64756008)(91956017)(2906002)(8936002)(8676002)(4326008)(38070700009)(5660300002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E88DAEC7FADAA84784336ECFC1F66962@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6717
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0e0fa6db-0604-40da-e79d-08dbecd407c8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cmCzQo6U9KP+962KQAhi8tdaiAnwK4TemZVLRbBHZ6fkpJz0G5S+4FZnxOGc2rJknp+2PjPZ2lnfM8w4W22dut5usVVrvuM/cTmspI7xd9V7LK68bZHqFKrJjFxtrseCX7dii2nPcVp8dTxZbAnoBaNda5G4zONzG0x6wsY75aG4/c3WV6Bcmcpmj0+qwehdVywwArxfrY/Ah80IyHeTRA97FCI8h6xp4PIZ9a2YMl6rfrOOZ3LkJylOfCLeR5gpZP0Vg1IKRBEdCN3VdPsu25HVLw4T5mrHV3JQThGbXl1kkkIVmoWth0RDBkgkWbY9tJERyb9XMY6Nl902GAE4P8hIDIpYErYnhBjeDAKjZ6KzQwaTS7fT0XfHgV1YCeoGIm8yiuMJtF04v0A7pJwXegbzQ0eX1NDzQkBPZny9afB8dyPL4A1oIKf768jt4U+qIXS7LH9YW0fLcWZD4S6ztVDImbwWc2JkQwD5cB3dgEakMHdG6CJCivXjRFQAYuG6vG4pzxGOGKIB13pSTekBt0XCirrmIVnzNN8uGqusJcot8mLTNZMNVFCHKHpDnZNb2UJaTwi6kmvoqXm3Afc92frl+D7D89dYDi2lxlb9auCuNu4dzCV8oizsWGHaAGttFUSCD031TNREtVzNyzFvYLdZDODacVCb+Ch/JCsoW2BahXkO2AYLLsa6QI23nAM+CNGktnFCNH14lrjw3D6ht2JSoHBxiN2rAq5MMz2HrCumxzd5j6cXg1gEU9drZ9Xa
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(39860400002)(346002)(230922051799003)(82310400011)(1800799012)(186009)(64100799003)(451199024)(46966006)(40470700004)(36840700001)(36756003)(36860700001)(2616005)(41300700001)(47076005)(356005)(26005)(40480700001)(53546011)(6512007)(81166007)(83380400001)(6506007)(336012)(82740400003)(40460700003)(478600001)(6486002)(33656002)(6916009)(316002)(70586007)(70206006)(54906003)(2906002)(8936002)(8676002)(4326008)(86362001)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 09:59:30.1999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c3d0e9-6ad9-4c3e-5814-08dbecd40d3e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9152

+ CC Maintainers

> On 24 Nov 2023, at 09:48, Luca Fancellu <luca.fancellu@arm.com> wrote:
>=20
> This serie aims to add more modularity to some feature that can be exclud=
ed
> without issues from the build.
>=20
> The first patch is already reviewed.
>=20
> v2 update: So I've tried to see how to put the dom0less code in the commo=
n code,
> but the amount of modifications are not trivial, even putting only the co=
mmon
> part and protecting them with ARM, leaving the ARM specific stuff under a=
rch/
> like gic etc... will leave a status that is not very nice, so I've decide=
d for
> now to keep everything on the arm architecture so that who is going to wo=
rk
> on unifying the code in common can just take from there and do the proper
> rework.
>=20
> Luca Fancellu (5):
>  arm/gicv2: make GICv2 driver and vGICv2 optional
>  xen/arm: Add asm/domain.h include to kernel.h
>  arm/dom0less: put dom0less feature code in a separate module
>  xen/arm: Move static memory build code in separate modules
>  arm/dom0less: introduce Kconfig for dom0less feature
>=20
> xen/arch/arm/Kconfig                      |   27 +
> xen/arch/arm/Makefile                     |    7 +-
> xen/arch/arm/arm32/mmu/mm.c               |    1 +
> xen/arch/arm/arm64/mmu/mm.c               |    1 +
> xen/arch/arm/bootfdt.c                    |  161 +-
> xen/arch/arm/dom0less-build.c             | 1018 ++++++
> xen/arch/arm/domain_build.c               | 3591 ++++++---------------
> xen/arch/arm/efi/efi-boot.h               |    4 +
> xen/arch/arm/gic-v3.c                     |    4 +
> xen/arch/arm/include/asm/dom0less-build.h |   30 +
> xen/arch/arm/include/asm/domain_build.h   |   34 +
> xen/arch/arm/include/asm/kernel.h         |    1 +
> xen/arch/arm/include/asm/setup.h          |    2 -
> xen/arch/arm/include/asm/static-memory.h  |   45 +
> xen/arch/arm/include/asm/static-shmem.h   |   66 +
> xen/arch/arm/setup.c                      |   57 +-
> xen/arch/arm/static-memory.c              |  287 ++
> xen/arch/arm/static-shmem.c               |  547 ++++
> xen/arch/arm/vgic.c                       |    2 +
> xen/arch/arm/vgic/Makefile                |    4 +-
> xen/common/Kconfig                        |    2 +-
> 21 files changed, 3058 insertions(+), 2833 deletions(-)
> create mode 100644 xen/arch/arm/dom0less-build.c
> create mode 100644 xen/arch/arm/include/asm/dom0less-build.h
> create mode 100644 xen/arch/arm/include/asm/static-memory.h
> create mode 100644 xen/arch/arm/include/asm/static-shmem.h
> create mode 100644 xen/arch/arm/static-memory.c
> create mode 100644 xen/arch/arm/static-shmem.c

I sent this serie forgetting about adding the maintainers, CC them
now.

Cheers,
Luca


