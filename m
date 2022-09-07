Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A982B5B03B1
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 14:12:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401449.643293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVtux-0008Qd-RH; Wed, 07 Sep 2022 12:12:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401449.643293; Wed, 07 Sep 2022 12:12:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVtux-0008Nm-OQ; Wed, 07 Sep 2022 12:12:31 +0000
Received: by outflank-mailman (input) for mailman id 401449;
 Wed, 07 Sep 2022 12:12:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2HvF=ZK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oVtuw-0008Nb-Go
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 12:12:30 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140073.outbound.protection.outlook.com [40.107.14.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5754372b-2ea6-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 14:12:28 +0200 (CEST)
Received: from AM5PR0101CA0008.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::21) by AM8PR08MB5716.eurprd08.prod.outlook.com
 (2603:10a6:20b:1d5::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Wed, 7 Sep
 2022 12:12:26 +0000
Received: from AM7EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::f4) by AM5PR0101CA0008.outlook.office365.com
 (2603:10a6:206:16::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Wed, 7 Sep 2022 12:12:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT044.mail.protection.outlook.com (100.127.140.169) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 12:12:26 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Wed, 07 Sep 2022 12:12:26 +0000
Received: from 1ad077a4a929.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C8098B73-D064-47F1-BE30-39B237C94A98.1; 
 Wed, 07 Sep 2022 12:12:14 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1ad077a4a929.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 12:12:14 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB6346.eurprd08.prod.outlook.com (2603:10a6:10:25b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 7 Sep
 2022 12:12:11 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 12:12:11 +0000
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
X-Inumbo-ID: 5754372b-2ea6-11ed-af93-0125da4c0113
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Wf6V1XzwqJsA+0rbkpXFOORBlNhczf0YjzfqUzWHNpQTPJtkA3CoFekA5dTC72EN0TK/E19nDrjSXIZFXGjbvGj9V/wc5dKNb0uN5RslAevdN+0cGw436hXB/LocjDANCrxagn2imDVv372zKIZ9WFaCaxRKbrjiyBKfp8cwEVNKuyw8M0JnoghqPUP4x1c3CmfBNdWeLydM4VkGElMOajilg3pmq2FsjysSgbWRFVoK8uMX/hUm469JVRRBV3PzwkgutUuJdPSqodQv5ZjnFssohEZK60y67c2jdXIHqHjJJz/wNaRwk3+pc/CpgoDXNPoeW26cM/HsHXiqCZITfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IP+0fqfSVNnvMLpLRDJZwIHB1euGc1DDJGj5BdA6SQo=;
 b=TUTE3730GXRQnxHStiXMpxzTkFbIbGWiAIRsu2rUakk9G4k3NLgOh4TLQVZyswAa41sRJk0AeFGAWjVKw6LtZEyJEY38ynJtkbJQZ83taB1nE16K8cp6f6smQORH1TwhgaQK2X0gdmJb6Gd6/f0aV8UfbL1uSwxBSM0jLIQ1aq671+UhgAtN5widTIWc9IsRjqRtt587wQiea4gjjbx3+/uMVyTAD8+8UD/2vMQKCRraDOzJiLoG7FriHqSXr3j9xmI8g9fad0w9SvcltB6mATEU0DEQ5gXE8PlRgMM5L/+ILyIhsJ8+FOukTBfQ7b8UlkTrIVj2VjKAjkPLP0OjsQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IP+0fqfSVNnvMLpLRDJZwIHB1euGc1DDJGj5BdA6SQo=;
 b=pzgZYDjjS4+A6M1HmnrJ1B5TtsyJQ/naZR4xv//EJkcOdUjLez77P2YV88l9Nguj0EvmjiP1nzzjrMpQhqULITDfY89G+Q/1NGqaBaAkQ23fHX5cnsH4KrHdfl6SDqiDmXmnliRbU2XUy05r6XHue1vQUCAy8hEO+pMgYb64Qy0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 876697749c00988a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b82veE1hrMYCqVOWwfEO3wrxIbmMU5qMcIW5/2E+Kl5eFSQl/8/v3AHbaqav+WpKvKMLXd+NVl7Wp4kf4+5/cRko3njVmyCbxGDk22SPHL7vsDTW37K+EJqnGOYejxAr8SYV/cwZcCpgAivhLcG+y6RebhWf0yfhoF5F5GhaJLn/AdleXXlQ8Yks+6HNstiAnR7SYvdTzMN3Jqj8L9CcGqsHL0CvdKa+eqUGQGCemPqVcwoxtwP9oXOSCAzqb9LuHTbQ5PSZjtet/6rN+FJCuMzvvhsJ4oJSuzdUnQHdmGH+JqUkyU+u7txOga4DBLrZJnTs5LClb1HUYt2RclIwFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IP+0fqfSVNnvMLpLRDJZwIHB1euGc1DDJGj5BdA6SQo=;
 b=iw+05tS51Ts2FQkDmIpZXARerTzrmRnWjQtbuTC1rm2DQ+qxDAruREqyS4xJtkafrI+nlOf9iNXuhgEspZkwoG4K0Ms0s0dtLly2D1/0/ReXiLdghHVdSABaCbHR10pl3yIHeOn0DbbUkGjIZHqk1d/8pw/4su8gWdEajWfiyN1q4oi1El3/uDwMwLRRGb535j7GPL/SweCpERRlVPyg5BLNOvEqYpJdBmrI6rFf+W3C/m8ylTUeDeElFGrEgOOoh5tmkd9kvLpBDwkum/7R9dEbTAmYbdjyRfG7DvYn/ZwPcZq3jgj8w46a15dwGu2fQ8mE55vGL2Yv+KfiPAO/Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IP+0fqfSVNnvMLpLRDJZwIHB1euGc1DDJGj5BdA6SQo=;
 b=pzgZYDjjS4+A6M1HmnrJ1B5TtsyJQ/naZR4xv//EJkcOdUjLez77P2YV88l9Nguj0EvmjiP1nzzjrMpQhqULITDfY89G+Q/1NGqaBaAkQ23fHX5cnsH4KrHdfl6SDqiDmXmnliRbU2XUy05r6XHue1vQUCAy8hEO+pMgYb64Qy0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Henry Wang <Henry.Wang@arm.com>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Penny Zheng <Penny.Zheng@arm.com>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Thread-Topic: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Thread-Index: AQHYwpUJ4p6pfICa8EGhkwL2mg6iHK3T1xaAgAADUACAAAaNgA==
Date: Wed, 7 Sep 2022 12:12:11 +0000
Message-ID: <43B994EE-81DE-445A-B31F-477148E5465D@arm.com>
References: <20220907083643.20152-1-Henry.Wang@arm.com>
 <20220907083643.20152-3-Henry.Wang@arm.com>
 <968529ba-3a9d-0812-1a5f-430d467e827f@xen.org>
 <AS8PR08MB799186FB3046AD59C9F8BBE892419@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB799186FB3046AD59C9F8BBE892419@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0a1c6483-a699-4894-f3e2-08da90ca3a7b
x-ms-traffictypediagnostic:
	DB9PR08MB6346:EE_|AM7EUR03FT044:EE_|AM8PR08MB5716:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 sSAsofcazvppWG1zteyyVmJgAJVUHKWGzXqbg2vdRQL1wL0o2naYpbHh8tX04MwhMb9hg2A4j0epg8HqITc/lNtPno9HF8tiHNs57jrV4Ud5A0y9kwQuPYZdeXeYBRjJqlKYRYAT12YU0YyMXvgFHxstX9vScgFfDClJsSPasS3Wb66Vgj7QwyfBxvMFihmQRyy32F9kBoN9kjKF2rcl34nTCO3/0q/5rPuGSXY1BE60oW7+VPXOUQxo2j05W5aGMs8WLkRbyoZAg9g5/uEC2bFjJAaHyH9cpySwkBQSxUkHrN0GfJZ9fz9T4fp9uDdslNqLH8LcJo6mGqKC1rGf/MpK8j1vGbmYBb1z71w4dtf2iWIpkNiscRHltDQ4g+5l3SF6LOumw4eD8rFR1v6R27J2Xzq1VUYSOU8h44GiVGtL1ygtFARXizFXPoDGKSGQflzRmBqtPzRCZcMR5FWN7leHkFwDn6YX9AOYxj7C8eY9JaiwWcIU7hafwuw34t4ea2jhUKVBzJHuJsq0gM1ZTk+Rq/gcDsR4kaOqM1Z1nVa4WO/3Xa/h1XoZebqND9o9i5fK/shkL5/VYEDkDnPYV7Ec7SUB0Si7vaf2c44ysAXCK8vRrYCJXiiln12918oLZGDSS946Vua8Rmd3spbNVfJpQiI+mIyccpoTLtepHI2/Db+/TOvURNBX1mmWfae63Naqz5qhLSyChHpQcddI6Zfnv1DX1juzJgel6rjNj61GQHtBXRvunAk1WuMmWcSHiZ8V88nVW/f5Eje8lxjhlF51Ui/huvQfjNY6q0RIQCY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(136003)(396003)(366004)(346002)(6862004)(5660300002)(41300700001)(8936002)(2616005)(33656002)(26005)(6512007)(53546011)(2906002)(86362001)(6506007)(38100700002)(122000001)(38070700005)(66946007)(186003)(83380400001)(91956017)(37006003)(66476007)(478600001)(66556008)(54906003)(66446008)(76116006)(64756008)(36756003)(6486002)(8676002)(71200400001)(6636002)(316002)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6A13D77CA4D4F34DA6909049DEDDCEF3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6346
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0ee15c19-5d1e-4f62-ede9-08da90ca31c1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vIBnG2iWrAvhDd8ITKmKzRPrz+HYnVxuGMPnkfTOPAQGUDWz6fI4g/s1iEfT7ob4vNkWUfGlO0ooyUXUqQdh6iQU2jxNhRryukzDaJkMt56VsqNtCnDItxz2yB2lkwq++IRx8zZebMQ6S/2927auQybqlUh/30NuR4eQVis2owQtsDhd5PQ3bCOyaki1c/Mh6klIcCJ1xskqbKBO+lhn+2+Zb1YaO8m5h3qlu/iG+ZoHazL1VzXQFXo+LdBPnAMr0i++VeIlVWjx60UtBn5oY5VQf66n9xdeQOf9IxMsVGFJVqA73tf7hwS9AyIMGVMkqhrW/wbNF1Qk8ysJ/CKrMAAMftyiR40j+AcIM0pvfNdjg3dhhjKVNrqOvhmMjb7B84mpUOp120wB32xvb9rS2ZEFDYh85Dfcg5sc3uoj3/nEQubMW+Lz3PxapUsmHvYX9wX+REjsMO32XY2Thoh9hM+UW/h2UOF1JKmb4LQ/CXoP69FsgMUkBl4b3DMmI4yAyh0cMwBUMHwvulyThgu5YQJSg+Tf+BBKA/RE9fZvQ2xPBqbLhr7Mbef/BEkECDTvibOft8z3NKIJFAiPN8lwLuhNWEc1awLf3BjJlEiY392T88oYxK/B7ucb6MpUX5pyQRrgthOnaPY/+4njETnd9AV7bXwN373NSitM98ssfVL17euiCXGIomxpUQejmfoy5DZAdFqf86278KWWpE1sbQ6lk0WhEsjHh0h+wveaeZtxr6KMouY30wOyJUcHZPEpO0GED4lkUKtEY4b1Eh9XCw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(346002)(396003)(136003)(36840700001)(46966006)(40470700004)(81166007)(356005)(82740400003)(40460700003)(316002)(54906003)(70586007)(8676002)(4326008)(37006003)(70206006)(6636002)(36860700001)(82310400005)(2906002)(40480700001)(8936002)(6862004)(2616005)(336012)(186003)(5660300002)(47076005)(83380400001)(6486002)(478600001)(6506007)(53546011)(6512007)(26005)(41300700001)(107886003)(86362001)(33656002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 12:12:26.4716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a1c6483-a699-4894-f3e2-08da90ca3a7b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5716

Hi,

> On 7 Sep 2022, at 12:48, Henry Wang <Henry.Wang@arm.com> wrote:
>=20
> Hi Julien,
>=20
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Subject: Re: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
>>=20
>> Hi Henry,
>>=20
>> While reviewing the binding sent by Penny I noticed some inconsistency
>> with the one you introduced. See below.
>>=20
>> On 07/09/2022 09:36, Henry Wang wrote:
>>> +- xen,static-heap
>>> +
>>> +    Property under the top-level "chosen" node. It specifies the addre=
ss
>>> +    and size of Xen static heap memory. Note that at least a 64KB
>>> +    alignment is required.
>>> +
>>> +- #xen,static-heap-address-cells and #xen,static-heap-size-cells
>>> +
>>> +    Specify the number of cells used for the address and size of the
>>> +    "xen,static-heap" property under "chosen".
>>> +
>>> +Below is an example on how to specify the static heap in device tree:
>>> +
>>> +    / {
>>> +        chosen {
>>> +            #xen,static-heap-address-cells =3D <0x2>;
>>> +            #xen,static-heap-size-cells =3D <0x2>;
>>=20
>> Your binding, is introduce #xen,static-heap-{address, size}-cells
>> whereas Penny's one is using #{address, size}-cells even if the property
>> is not "reg".
>>=20
>> I would like some consistency in the way we define bindings. Looking at
>> the tree, we already seem to have introduced
>> #xen-static-mem-address-cells. So maybe we should follow your approach?
>>=20
>> That said, I am wondering whether we should just use one set of property
>> name.

The more I dig, the less I find a use case where we could need different va=
lues here.
Maybe just:
#xen,address-cells =3D <2>
#xen,size-cells =3D <2>
Could be enough. If some parameter needs a different value it could introdu=
ce a specific name.

Or maybe just memory-address-cells and memory-size-cells if we see a possib=
ility to require a different value for an other address or size.

This would also make life easier for users as we could just always put thos=
e 2 in our examples.

Cheers
Bertrand

>=20
> IMO now we have the pair
> #xen,static-heap-{address, size}-cells and xen,static-heap for static hea=
p.
> and the pair
> #xen,static-mem-{address, size}-cells and xen,static-mem for static
> memory allocation for dom0less.
>=20
> So at least these two are consistent.
>=20
> I guess the concern you raised is related to the static shared memory for
> dom0less,
> ...
>=20
>>=20
>> I am open to suggestion here. My only request is we are consistent (i.e.
>> this doesn't depend on who wrote the bindings).
>=20
> I am not sure if Penny and Stefano have some specific requirements
> regarding the static shared memory usage. So I will wait for Stefano's in=
put.
> But yeah we need to keep the consistency so if we are agreed that I need =
to
> change the binding, I will do the corresponding change.
>=20
> Kind regards,
> Henry
>=20
>>=20
>> Cheers,
>>=20
>> --
>> Julien Grall


