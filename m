Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A2E7CAA3A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 15:46:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617595.960328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsNuy-0002lM-AH; Mon, 16 Oct 2023 13:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617595.960328; Mon, 16 Oct 2023 13:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsNuy-0002ix-6r; Mon, 16 Oct 2023 13:46:00 +0000
Received: by outflank-mailman (input) for mailman id 617595;
 Mon, 16 Oct 2023 13:45:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4UvS=F6=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qsNuw-0002io-2A
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 13:45:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 552d708a-6c2a-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 15:45:57 +0200 (CEST)
Received: from AM6PR01CA0054.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::31) by AS4PR08MB7603.eurprd08.prod.outlook.com
 (2603:10a6:20b:4cd::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 13:45:53 +0000
Received: from AM2PEPF0001C715.eurprd05.prod.outlook.com
 (2603:10a6:20b:e0:cafe::62) by AM6PR01CA0054.outlook.office365.com
 (2603:10a6:20b:e0::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35 via Frontend
 Transport; Mon, 16 Oct 2023 13:45:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C715.mail.protection.outlook.com (10.167.16.185) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.22 via Frontend Transport; Mon, 16 Oct 2023 13:45:51 +0000
Received: ("Tessian outbound 0ae75d4034ba:v211");
 Mon, 16 Oct 2023 13:45:51 +0000
Received: from feea0d619a8f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FEBA4B02-67AB-405F-B66F-69CC37DC33B0.1; 
 Mon, 16 Oct 2023 13:45:39 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id feea0d619a8f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 16 Oct 2023 13:45:39 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB5426.eurprd08.prod.outlook.com (2603:10a6:208:184::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Mon, 16 Oct
 2023 13:45:35 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::30ea:681d:5fa7:8bfb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::30ea:681d:5fa7:8bfb%2]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 13:45:35 +0000
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
X-Inumbo-ID: 552d708a-6c2a-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDKTH/aQs4frHvTevE4VxDkD5FPpkunc9JITpyjFltY=;
 b=P1Fqf+1L8aS/lUbRBLt1FpHxmfomHsfI1jyrv3760r960JmJ8/XhtBQSVtc4uG4uUGST0b0A6Ai+sKbuCO918rv+qT+kAeTHwoOJbkhGquD8fouX6Vb8of06jKUdAENeuf3hYIszXXQlIk6HrSyEXAX2cw/0R8K4tf/5pqiM254=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e834b1b344c69ead
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNG6+FBdAMHrl7skWa6EsiHqnX3qBT6IponkKyxeEwd6szW0LsQmwFYmqQopCbHVp9SMv37eZZwd8STs+Wb7rKx4ANjh09OQf4qwEgets9D16NnqgyWh65TMH00aaejEnzJNfFKXnNF2LRj27I05ZC3kA4DuQzLc442lPLjB/lG7E/CAoem9iVbL3+Wn/cIFjvewDNpiMGEBuTQqqDWOiAcZ4PXSNBR08DZo7qTOwJ4Q7nQS4FpUa5Z6gfsFVKmxzsvrOPLzbw1mzVCOxVnGUmj/dpP/w4hj7L8VaLEZka/fW8GyVTqZ09+kvkZCNDOrfYVWWgd+7/I5SWG/m4K7Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDKTH/aQs4frHvTevE4VxDkD5FPpkunc9JITpyjFltY=;
 b=JmWj49OKpzAjrphvI7Wm3CKT7lydE13OZj3qbkCbI6Q0/iHwFJr0dM4SxnBtfAy2Sa7uRRz83BeL4oqEx/Lmt8vZOM+0iV/+erOmc6XcQ9M+/c9lWv+tc1w27Iyt4aiPDUJGizKFr8kJpAD0nt6lS+nPc0mfkt8Tyrj1SphkSTI48BDy2Z0NclCnJwS3W9MAQdtkZrH5YnF4YTtRypKRTldoZGf8a6XEvcKaHDdVpLeaXFLdkCgG288Ns4qBf0tLKUliK5Mk7JGEarpdixO1edEcxYra5HGcgwPUnEwSccpGZIK8m2EApdotj1ghI22Oxd/EBaWoHwD8pncKl5FKMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDKTH/aQs4frHvTevE4VxDkD5FPpkunc9JITpyjFltY=;
 b=P1Fqf+1L8aS/lUbRBLt1FpHxmfomHsfI1jyrv3760r960JmJ8/XhtBQSVtc4uG4uUGST0b0A6Ai+sKbuCO918rv+qT+kAeTHwoOJbkhGquD8fouX6Vb8of06jKUdAENeuf3hYIszXXQlIk6HrSyEXAX2cw/0R8K4tf/5pqiM254=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Federico Serafini <federico.serafini@bugseng.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, "consulting@bugseng.com"
	<consulting@bugseng.com>, Rahul Singh <Rahul.Singh@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [XEN PATCH 10/10] arm/smmu: address violation of MISRA C:2012
 Rule 8.2
Thread-Topic: [XEN PATCH 10/10] arm/smmu: address violation of MISRA C:2012
 Rule 8.2
Thread-Index: AQHZ/el7rXFHK+9WvkOYQpiDC7n8ALBMJIIAgABJsYCAAAH9AIAAAgSA
Date: Mon, 16 Oct 2023 13:45:35 +0000
Message-ID: <92C52E39-729F-40AE-A02F-556C8EE471CB@arm.com>
References: <cover.1697207038.git.federico.serafini@bugseng.com>
 <199886f6ba1f2d5701eabd080b4f9723fc28f4b9.1697207038.git.federico.serafini@bugseng.com>
 <39d3f8e0-61cf-4b8d-84f1-a5087ba8ead4@xen.org>
 <D3320838-1E67-4339-A3D4-A3E60FBC4117@arm.com>
 <c9a7f059-4cf5-4a75-b231-573c4fe29b37@xen.org>
In-Reply-To: <c9a7f059-4cf5-4a75-b231-573c4fe29b37@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM0PR08MB5426:EE_|AM2PEPF0001C715:EE_|AS4PR08MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 90fcfc62-ffda-4186-f346-08dbce4e363a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7JmNL29hDDBTDB3F8sf+dyoN0E/ayFKp3rN8y09JT8hEJ3yItrir5OzTluOfV8e+dxvVgX7a2ScVsMDYAXeCKqOolz+UUuL4eeKEbR/Al4nCg0CR66BWGRWjWJn13JWiL2xhJjW1IgKdeKR8JzUmMsk4oV7F5OAMpp0WIJipbFZBSoHV9xx72khm7zeo2m/nz83eDBgytPI6kyrHkntmR9suiSv1+/gmra8WY473kYzzwSXvtuoRRp0mwVasm1/VN4QP4mPgbXSzJI3rumGm4kd7nn0BMYKksmWGOflHAb1Ih6L4layGn3t6lm6ecnLufeRKarI8UQVo6xVljdcFxplzEmGgo1mr84bZg0Kpy4ACqNsThsE9ZYceV8LaE96oCtvxcRpn7ViSy7O2mSXesbR2mh1VzwY6I1ewdIOcPENw+sye/jWDqbkSbKW+WZKRbCl81bllaVWSnpmU9HqFIBNUd1+aC7G1a7RvvhHJdSRZSBlaNt68Hu/edmEKdRlpQ+M7V+zu8kALFQZR4z0DCUXweBc31r+MNCoBsqo3LEdjkODKdO6p+j+ff3qtlu5vygo324mqkEEkjfawNZ9egFfKUdQa0VKB+0fYUlDY1BN0/UAwtwpTosNGD7f8t9rdE2K1sx0oEEw1CRa8xDXtGA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(33656002)(8936002)(8676002)(4326008)(5660300002)(2906002)(41300700001)(86362001)(36756003)(38100700002)(6506007)(38070700005)(122000001)(2616005)(26005)(6512007)(71200400001)(478600001)(6486002)(91956017)(53546011)(66946007)(66556008)(66476007)(316002)(6916009)(76116006)(64756008)(54906003)(66446008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5FA95380F693184A9E132B1B5B77E566@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5426
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	30da28cf-e8fa-4d2c-701f-08dbce4e2cd5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YOK34zYo/Ok3r4HNwmd73kSrqzm0qxjwwPLxwVKHKJ2jCDtkYlAiR8bJQZtpclgi/dGxP8eNlvvMvbltAW9J6uXQRyRa96Ywk9ah0Vf/f+ZZgDkIFPVThY3NOI7jXfdOznYUy1bBsDEAOZtYJgG+xcQbvXECKu6YJmooxb+f1TrtpidtV6Opm0HrNhkOLqqbdTQ6W7JROflmSuTdFcwkVe4LmtAfmSqsB41UNjl3Wlc/KcU3AoTo7jTWxIbqKW9wuEk4zgaMgPNaxkmxgcSrUKzRrf3F9Dk9m+IGvsVrorwINN5uw+xys657e21bslNITQhKCVIBVVN4vmsVj8GKmN60W0G3HafM9SOxf/olaAicTuXNKyFDBskPRhpNNkS5QUl1Saoc8AiiNf2E+s6klvFkE7J9gm178noc/niwu3aRPtl/omNPhVoG2EcDii6lMAYw9/RiNoJ6jnsXAWMeN7swa7nXNxEA3HkoVbcfZtHsMKHQG/6ZbIRFE7wMS9F6CfgtBBgR6A6AKjDIGTtdU0jyt+3qdDbLR0dWkN+290sSv/LAbBOGMysaVMEAkyvPOU+CUQooJu5R8qCeTUScAxyvyfhFRAFCuHMVhuMNDPsd3MmIhrELB6HBrc3njRLRPhhakZ2A5Tfd/HNYBRu+EBvQOiJxY7qM/Q1P5AyuEETybszpUAlw5A/kU+mWJxQMJQw9UkAHJPU1UMeaG3of5EM/UtbMpVyVWsjGVmWn0+I=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(64100799003)(82310400011)(451199024)(186009)(1800799009)(40470700004)(46966006)(36840700001)(33656002)(40480700001)(8936002)(8676002)(6862004)(4326008)(5660300002)(2906002)(41300700001)(40460700003)(86362001)(36756003)(6506007)(82740400003)(356005)(81166007)(2616005)(26005)(6512007)(478600001)(336012)(36860700001)(6486002)(47076005)(53546011)(316002)(54906003)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 13:45:51.5192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90fcfc62-ffda-4186-f346-08dbce4e363a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7603

Hi Julien,

> On 16 Oct 2023, at 15:38, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 16/10/2023 14:31, Bertrand Marquis wrote:
>> Hi Julien,
>=20
> Hi Bertrand,
>=20
>>> On 16 Oct 2023, at 11:07, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi,
>>>=20
>>> On 13/10/2023 16:24, Federico Serafini wrote:
>>>> Add missing parameter names, no functional change.
>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>>> ---
>>>>  xen/drivers/passthrough/arm/smmu.c | 6 +++---
>>>=20
>>> This file is using the Linux coding style because it is imported from L=
inux. I was under the impression we would exclude such file for now.
>>>=20
>>> Looking at exclude-list.json, it doesn't seem to be present. I think th=
is patch should be replaced with adding a line in execlude-list.json.
>> I think that during one of the discussions we said that this file alread=
y deviated quite a lot from the status in Linux and we wanted to turn it to=
 Xen coding style in the future hence it is not listed in the exclude file.
> AFAIK the SMMUv{1, 2} code didn't deviate very much from Linux. I can't t=
ell about the SMMUv3.

True that i had the v3 code in mind, we might not want to do that for v1/2 =
you are right.

>=20
>> At the end having a working smmu might be critical in a safety context s=
o it will make sense to also check this part of xen.
> I don't buy this argument right now. We have files in exclude-lists.json =
that I would consider critical for Xen to run (e.g. common/bitmap.c, common=
/libfdt). So if you want to use this argument then we need to move critical=
 components of Xen out of the exclusion list.

I am sure we will at some point for runtime code but we cannot do everythin=
g on the first shot.
I was not meaning to do that now but that it is something to consider.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall



