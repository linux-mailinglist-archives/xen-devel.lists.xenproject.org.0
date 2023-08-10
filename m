Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 933E77779AE
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 15:34:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582101.911686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU5oA-0005yJ-EC; Thu, 10 Aug 2023 13:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582101.911686; Thu, 10 Aug 2023 13:34:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU5oA-0005vg-BG; Thu, 10 Aug 2023 13:34:34 +0000
Received: by outflank-mailman (input) for mailman id 582101;
 Thu, 10 Aug 2023 13:34:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s5UL=D3=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qU5o9-0005va-Ew
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 13:34:33 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20610.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a367724d-3782-11ee-b284-6b7b168915f2;
 Thu, 10 Aug 2023 15:34:32 +0200 (CEST)
Received: from AS8PR04CA0064.eurprd04.prod.outlook.com (2603:10a6:20b:313::9)
 by DB9PR08MB7748.eurprd08.prod.outlook.com (2603:10a6:10:397::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 13:34:26 +0000
Received: from AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::95) by AS8PR04CA0064.outlook.office365.com
 (2603:10a6:20b:313::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28 via Frontend
 Transport; Thu, 10 Aug 2023 13:34:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT058.mail.protection.outlook.com (100.127.140.247) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.19 via Frontend Transport; Thu, 10 Aug 2023 13:34:25 +0000
Received: ("Tessian outbound c99fbc01d472:v175");
 Thu, 10 Aug 2023 13:34:25 +0000
Received: from ef9790401739.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0BE6CAE2-DFC0-4773-BB13-DC66ACEBF4FD.1; 
 Thu, 10 Aug 2023 13:34:18 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ef9790401739.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Aug 2023 13:34:18 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM7PR08MB5510.eurprd08.prod.outlook.com (2603:10a6:20b:109::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 13:34:16 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 13:34:16 +0000
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
X-Inumbo-ID: a367724d-3782-11ee-b284-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzWXUAgdO7tbgtV/Z6I+0otW08vyX7V7DfacQSegU+w=;
 b=QqmIWMccn4UjWZwY+PKbZD3MryqGIYWMlwmdt0g1rDEjRxBzNe/t7EvJ9jUOVf3KhqmEZ1T7qxyEyYVsM1zzqx58XeVe0/+1OvtgkvbbsuI+2erQm5JOYd5nhSa85pa8a69jpulLLt+dPXVm92daSfiAU2wnSYC3ayjphp5vXe4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f51938f3e7633da3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NlT3eMvjNdoSbsdNWViOf9+rOSVD8DKsLAL4S4ya02h3xpZrleLJY5/Yb1CgD8ezyMymlzBVbwp1mrrsboHONbRIrf3m6mjdmkxTG66JEAiZ/aHoc0rNLf+SQzwQs57AWtow5nU8OkkO4+ihm51u+f624rD27mTuPuEYByf1zAmU6HB1w85SbvoB4c4ecWLpxeHltREeBGxNoSpHTeMEe3bsO5ffWqCZmA1KJa2rDQcmPYN+vB15nNqc3ymonBReFJWa7fKQyxASA7Z1vmyQN7OMJ7acQ7pth3KCr+sSdJ2jBcT2dHxNlFCgy3W8zf6jx8CURvt4jYBf0bwDrqJf8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzWXUAgdO7tbgtV/Z6I+0otW08vyX7V7DfacQSegU+w=;
 b=nzEiZyAVqXU5TLijc8nbtQwmJufTBT1YCF8eA090NhipNzTse5U4wMRw7cik68GXqnJ8is2S1bFTseEmSn6RJS98NVQyHtmPni6Q3J9cgLiUQEg+uBHSIevwm71+FhRU2heF7SSxrMCrPbqtTYsUtn2ZBNZEtULMTVToMhPcbKo7YatT5mSnKYjLPzA6cVEKIZYgBnyk8grtHnz3fdhcmoWZHTN6Agg2595BX0pi+sT392mgmb1YL3tzr+ybfHWNzHltzrkNY6rwT8HzKn07Xafnpa0TR3+5a62EVlzdOiBOE6VV7if30M9kZq30LvdREBtwsqcQteSwIyipMQMn4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzWXUAgdO7tbgtV/Z6I+0otW08vyX7V7DfacQSegU+w=;
 b=QqmIWMccn4UjWZwY+PKbZD3MryqGIYWMlwmdt0g1rDEjRxBzNe/t7EvJ9jUOVf3KhqmEZ1T7qxyEyYVsM1zzqx58XeVe0/+1OvtgkvbbsuI+2erQm5JOYd5nhSa85pa8a69jpulLLt+dPXVm92daSfiAU2wnSYC3ayjphp5vXe4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] xen/arm: Skip inclusion of domU nodes into hwdom dt
 /chosen node
Thread-Topic: [PATCH 2/2] xen/arm: Skip inclusion of domU nodes into hwdom dt
 /chosen node
Thread-Index: AQHZy32N62CgBrAksUCXC1bl6i56jK/jh68A
Date: Thu, 10 Aug 2023 13:34:16 +0000
Message-ID: <E3D0146D-9E5B-4CC6-A864-A6F51C9B599A@arm.com>
References: <20230810112544.17365-1-michal.orzel@amd.com>
 <20230810112544.17365-3-michal.orzel@amd.com>
In-Reply-To: <20230810112544.17365-3-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM7PR08MB5510:EE_|AM7EUR03FT058:EE_|DB9PR08MB7748:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bcb0e1d-0f1a-46af-0a7d-08db99a68397
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cw7NIjP42+xiBZPKT8BY0c1/+BOxFE8xQvwVzb7TavwZGzzKgBpw45reX+nqqTel03v1wnFR7GqUmuEUCidaSL4ygEkiCPmt96SrZuQm0fpOzzIuyGM7gqqZuW4jjqObT2ot9Q3fTN5FSEGjlUhPUqDEdsYvAOhZ24I8NDcrJgjiho6Hgh7XDgFlr4F3mhwBep/2WDZDifAqNE0ztwGcMW5jZ8i2WTMjv5nR2JKlJOnoGv1+bxdPK8HyoxZ8LCqZwdolUCAGs4ac+kT7wNDJhQ9Zw9pxGiITCXXS0/iqoIf7jra+rfZXF0/jt+2VSKHLshRzUZ2P0Mm2uHUObwLHnBDI0O94bgNyRlpZwblKk6GvVQbbDO1KYouopCFcqPd1s+xLFW9aVs1G5/rnuPFRQ4KfGYgiTnnXzWQbyTC/tS7BG5ZvUrX7mvks+ON+wVBu0eLl0HCerSpc8Nc2Uxec7K4ZCk8yWd2ge0n86U6ZZbH2lU2XuRsmkWTF6+dCC0CYZkg5H9iVxsxRL2xfYgRjfa71QPDpeHF3/jLCjGInrhZ0lUEqXIPPW4OrhuSYDpRh5GefFNkTTBHIVnJBoc5DHQmsPkYbPrm07/KvW9HxEOsPeqLY4BuBTDJXYF2x4c2iVRH4XDjgZF5K+XsVAXygeA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(366004)(376002)(136003)(396003)(1800799006)(186006)(451199021)(33656002)(36756003)(71200400001)(478600001)(91956017)(54906003)(76116006)(66946007)(6916009)(66476007)(26005)(66446008)(64756008)(6506007)(66556008)(53546011)(6486002)(4326008)(4744005)(6512007)(2906002)(41300700001)(316002)(5660300002)(122000001)(38070700005)(8936002)(8676002)(86362001)(38100700002)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5FF0E397A2207840B7E5A58C8B708D9E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5510
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	98fc1e28-e9b6-4f2e-37d5-08db99a67e4f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	64QfW413/hS1x4wZ1sMU4pUktlWtd2REcq08IEfjCe9Prg2DS9mkaQzZr7EZu8cdA5h0ysq4M+N9igR/MAXkq9ppY8QDnvgccKkm9hSoekR7AceC0Gy64WXA2DstWEZLcwG6/yQWyVN5fck0P9fFRFcTv1tsB9fLmMRUwszydE9t9VUtUAFdGXeW4e1r7P997TTyIpfsPBrEuT/NR7ArteCyuQciIfaUIiM8Tc9jewtxS3X7WITiiKv10yhoi3eFNarlmxDXZDt0f0RlgH7PNAdQO++EHTW1IYJ/yam9fkNgWNqsEC87gJ0vs8S73BgTI7+zW9UtzZZltndkY3meZJgLpMUF4bIGvjNKIrgVUeblx2oVbbF3zbVUDqqSlbw/m4snxXVz4cHSQ7Vw1fX/0xLrhFPPYjSEWJRHQQ2dB05A6fKBRDTiPefAW0i8w5agVThIf0xZ5fOLHFMYs+dP5hNGnN2hGoRbtC1y9wcUz4UftyHVuyGe56a1udnHDOHwnZBTGbMoziYFdNCuwK11zCXQ94phl/qcgiHaw62trXjjljM8Yco6kgXCMRCs0JpxZZ8tTdLOxPHxAkp0GG9r36zIBlmqzHgLUhPBL6ZutkzX1If8g7RSqlCkRc7SmgYZxudl/SP1qVbWVcn5a3GeWGwm98ywPQ+5vtcwi+jsUSOYhueegUObGHCJf8vRigw/EM8fgAKZncHSrHGL4K9jsOJ3V13Stoc1erFfqRszBKy0fQ2Wple/CX4oCHN6ucK3
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(396003)(136003)(82310400008)(1800799006)(451199021)(186006)(46966006)(36840700001)(40470700004)(41300700001)(5660300002)(82740400003)(6862004)(70586007)(8676002)(70206006)(316002)(4326008)(81166007)(356005)(8936002)(36860700001)(54906003)(40460700003)(4744005)(47076005)(478600001)(86362001)(6486002)(40480700001)(2616005)(2906002)(26005)(107886003)(6512007)(336012)(53546011)(36756003)(33656002)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 13:34:25.3766
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bcb0e1d-0f1a-46af-0a7d-08db99a68397
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7748



> On 10 Aug 2023, at 12:25, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Configuration for dom0less domUs is stored under /chosen/<domu> nodes
> present in the host device tree provided to Xen. All the properties and
> sub nodes there are meant only for Xen. However, at the moment we still
> copy them (except for modules that we skip) into hardware domain /chosen
> node. Fix it by adding "xen,domain" compatible into the list of nodes to
> skip in handle_node().
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>


