Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A0D5EA557
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 14:01:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411709.654735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocmmV-0006DA-Kq; Mon, 26 Sep 2022 12:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411709.654735; Mon, 26 Sep 2022 12:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocmmV-0006Aq-HC; Mon, 26 Sep 2022 12:00:15 +0000
Received: by outflank-mailman (input) for mailman id 411709;
 Mon, 26 Sep 2022 12:00:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8M8J=Z5=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ocmmU-0006Ai-IZ
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 12:00:14 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10072.outbound.protection.outlook.com [40.107.1.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c63092e4-3d92-11ed-9648-05401a9f4f97;
 Mon, 26 Sep 2022 14:00:12 +0200 (CEST)
Received: from DB6PR0402CA0017.eurprd04.prod.outlook.com (2603:10a6:4:91::27)
 by DB9PR08MB6489.eurprd08.prod.outlook.com (2603:10a6:10:256::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.23; Mon, 26 Sep
 2022 12:00:10 +0000
Received: from DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::c8) by DB6PR0402CA0017.outlook.office365.com
 (2603:10a6:4:91::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Mon, 26 Sep 2022 12:00:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT050.mail.protection.outlook.com (100.127.142.250) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Mon, 26 Sep 2022 12:00:09 +0000
Received: ("Tessian outbound fc2405f9ecaf:v124");
 Mon, 26 Sep 2022 12:00:09 +0000
Received: from 6d2b922dded2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 88758C60-8D92-4807-BCC5-D74D154AF47B.1; 
 Mon, 26 Sep 2022 12:00:02 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6d2b922dded2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 26 Sep 2022 12:00:02 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by GV1PR08MB7684.eurprd08.prod.outlook.com (2603:10a6:150:63::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 12:00:00 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef%7]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 12:00:00 +0000
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
X-Inumbo-ID: c63092e4-3d92-11ed-9648-05401a9f4f97
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=afAZgqfyEaSArx6O1teB/HFKUtaKao4SIXdaRoygYcSGHO21kQdTYdGaR2y+BCdOYLD8AwWomdXce8WGml1PuHA7XlmBRV2xdTtuKxHPNr88lBpyVVGlZVndxoRqmFaJwWbE4FPvujsSnhi6LmjcHo67uHwCoCKDBCWE7loDK2lGfjEWCqw0quwkdBI0y4zo2QEcl04IlaMIgpieQQXZBAFEgEiJdCaHaUEJKgdYnybvSsloG0y5qoAvjWk3OgdHj1/OmHUlfbJJvt+jSyHc4f5gW1H2qMsyWdU8LCZzt0iub1WLeByM9yPGBhtzxBndv/NRTkbLrpykkGMc05KzRQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/lrE8DZxr3MNuyq/7XX8TSYx8fwwJPYEDbnZexAW1iI=;
 b=jv97ke9zwRvFc/ZAJtidNyvng+VhNY1wIt1e2OkGuOjj089d+ubP9ZE+WZKuj89BUOTqHpjDbzHAzhSlHnux7d3Y4TLv4zIAm9DkB8j47hSmVXgQKmAMWkIg2dI8GKb6JXv6CH5UZ10OYmfpIv5sm4aLhS8J8q/ZLOspTvq+GCYTnsNxHhSBW4U0yHflHi6CJAungbzQJxxEbyYrZ4v6BfzH5ics4qG4FdbZti4KkX5+rSm1Ju1LUJB2nvlDrRYHH7xGegHgMSZm3IJlRfQfFnAJ7DB/V3EfyC2hvvan2kd79SNXVlYrb4VqzGyRKNV22byLWFrpPsGTGPJW6+V+ng==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lrE8DZxr3MNuyq/7XX8TSYx8fwwJPYEDbnZexAW1iI=;
 b=ySrvwzpTxtEChuuRtnaLUg6trIFPWRG3ctCACvhqAQo3rn2JNfSYIyn5DgycRDhAisDAvuY87B/jkCgvsMKCq/no8WWKEd1KEBNkwkfDB0ErW0pX0EFO0hrL16kAif6H/h57FBl0/V1GhABhUxDse84rPG1bDQjA3oyPHCF7YKs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8738a677bf7b120a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZqbIxbzeuqLgq0cC/UWkKZ+FYwkOITfMcbUhPUqXRv9FtA4IXmzwRW7UMIuN1pUmAHMijOduuPXrYeBgSSmNye9ZxD3ZGPyBh3rbIVQu2kYvj0+rdz+X8ataUrO6t151+4Mt8zN779GBWEnSh8VjNjXeHmofO/DUwiopr6icJolje6Klza1eGuq1zg+1RBvBJxh23CnKHHO6qCht55ZRkJe0R5Pk4Rr1S8yH6lMBvBPQk2/cAkAAarF82SbqaQVA3gg5Xq80ULXbz9wWU3F94YnjKZfV6mlk2U9j8ZhXPwqP3oVFfsruWvFim8C2SgC3FAzpg00ymYFb7+wcV8Enw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/lrE8DZxr3MNuyq/7XX8TSYx8fwwJPYEDbnZexAW1iI=;
 b=iKztfLKWBjtI55gjnfGJlNAS/NgCx4m4dKcTnr/ndxDHjtV0Gk0reqmMpT7bv/55Otxt4xJXWSGJWPFeJ0XHP0NED1Dq2wZ1MkdfhCZDtium055FX4gQWsrFFMpATN7Rj4XnOhg1WeJTyFhr6gVaRTSOedKnse6GgAbepetKpu3uo83Ku7Ddd+erU62Xvc2k57lo7cqw46p7H0z+J12C6ZrUeEtUjr6Pmu7a/+c21C3dDB5xW3Qww02af4sFQLpd8PFPA82KOAwbO4JwmSYCq0NkFZ69NWtn3b8RXjJM9aO+3fKF75IgePfzubgkOYL4DycPnaM0qsosq792ckpL9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lrE8DZxr3MNuyq/7XX8TSYx8fwwJPYEDbnZexAW1iI=;
 b=ySrvwzpTxtEChuuRtnaLUg6trIFPWRG3ctCACvhqAQo3rn2JNfSYIyn5DgycRDhAisDAvuY87B/jkCgvsMKCq/no8WWKEd1KEBNkwkfDB0ErW0pX0EFO0hrL16kAif6H/h57FBl0/V1GhABhUxDse84rPG1bDQjA3oyPHCF7YKs=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 02/10] automation: Add randconfig build jobs for arm64
 alpine container
Thread-Topic: [PATCH v2 02/10] automation: Add randconfig build jobs for arm64
 alpine container
Thread-Index: AQHY0ZfZXzMlSEHhuEq/DKetD0ah9a3xm9CA
Date: Mon, 26 Sep 2022 12:00:00 +0000
Message-ID: <E82AD28B-F9CB-4DBB-B9B9-B9266E24E50D@arm.com>
References: <20220926110423.26030-1-michal.orzel@amd.com>
 <20220926110423.26030-3-michal.orzel@amd.com>
In-Reply-To: <20220926110423.26030-3-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3809:EE_|GV1PR08MB7684:EE_|DBAEUR03FT050:EE_|DB9PR08MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: 57276585-00b7-41cd-2248-08da9fb6a92a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dy14HL7oT9zy+lB94dk4vLn3X7gcmehkF5ckcHs6rYCe5/7DoRiaSMZYIBQUxy68DuNBdLiSpJhUQpNgDjnRKI9y7LFtE8FFFOgU9vxMy5wh0kBffM4Gvud/FG70tXnBGrbvlnMGE/6uLmXtza6HVGaCf3IUyXebrIjwBDTuxe9rq9SOGd0jKnbvtfgGAbu/9yjIxgK7i0Vf/0tTlaRiZ1nEVFt0LbwM1bgl8d9wZspqMw76lMCBo01+ACcLTWuiMSXthWM7w8U1MSIkEupf3bVShBR4kIw+/L3Bgqn0mdKSSwgzCNgx5w91q0xQ9ql8kebQRC2kS8HIoDCyrXc7lXsNjdJzpp7xWMF/3WPsG2TDvCtrjJiM0f/ZAOZJ7hhUKMgQjFr/xIrWhHMW1Flwbghyuqb/aXO2X/8XH5GR9cbscRO+bNUZejVb6tRNq90/N5Vd4IOuYr2SS8oRs/BRFYPGfGMwRwWsOLWaf6MM/xZJjxZDx3O8YTn7tWM42Wal2CcMfDTO2ScFIPAjt/GcLpxNlFmz6Cp6OuvkEkUdnNv7bI7fsPNoY179t8KOLy8nQ88USuAlFg92E5ScPPC6MfxjhrtQdaIKaGkqaazR8YL7I8Egyz95FZYLoYfc2bnGSxqvR7vaJK+bQpE1JG53x1g6ZG5xulddn6tMvwS178KkOn2p/fL1DnS4SYe2pYOLDKhLx77iMqHjQVHeZEyUWBBavZv+N/5tt5i1A1XuvEwOksRFRNwU1SUnpNCRS2I9m4reWmO6ZLVfQpJzrveHzXMq3cN7pBsYmGWEO0UKNec=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(451199015)(122000001)(2906002)(86362001)(71200400001)(186003)(6512007)(38070700005)(26005)(6506007)(41300700001)(6486002)(2616005)(53546011)(36756003)(8936002)(5660300002)(38100700002)(4744005)(316002)(6916009)(54906003)(478600001)(64756008)(66446008)(8676002)(66476007)(4326008)(91956017)(66556008)(76116006)(66946007)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <29512FE34749474193DD7680E3393107@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7684
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5057a859-454d-4318-925d-08da9fb6a3b3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v2pplrxL279VehEMrTkJNMz0xdm82Y+Xop6eqjiTzHd/rFtImHq6p/8g2tYYv46cqdIbIBKzY8xVBBdbADpCLLGZmKkw0WAu3tBd8Y82bdm3tdNsoOPJ56o4OE9c55J7V4+rFlmicNtnZAnBiday6FEU7PP0J61T2rgFTZrqfd9qJp5n502YYCHvQlQXBFee5idS/idPWzBJdEMRi8+5QAVEBqpwoiO2xb50Y1AzFDEnpb90fQScKLe6RqORFg/r4r/9/ymCHF+0fu5vpAFi60Wph19MthRFVH7UO3iBxjgnUpob1BvlCLrBOKdBALDvIgkKDRGK/Scu/sMhYMWpkkiKSiCaxLncQ6Gj9WhZgfDQBj6tmfWTAFPnSCwlEjsNvOWVOGyqs+vwVgZuhaVCA0GhdXzX6nM1MKFkFJK5AH2T0IpMYWAasadA2mbrn2H7lteibOqNoLs0s0sfJO1KCbc3YLD/NJ2uXrYs5xQtAV5Tbr9gdfNPCg0i7xNDBv1qa+GjJRXigVqx1Jl6yr8BfefV6ANAADWbyDt/ek5ze2/vq6FajHMbrWs+ZBoWfgwq8LiZq0MbRtRc62rmsJHsG6JZdrNEcQgDDvZIk9yIwE9VlA1NDLxMIpdh+droGHA3OPF+/iIXtKtVl1icR3OF3sBgZwLHTRTGrDANp6ujWCG2A0daGCXvamuCEBe05I648ERAx5uwqxCJewMqd4wSwgrSSf6tJeVvOGkW/ErooaTz3M4qEaL3joKXwGJ++FHwJlISn0cY9nAixEOgyU3ujQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199015)(40470700004)(46966006)(36840700001)(86362001)(70586007)(70206006)(8936002)(6862004)(6486002)(478600001)(4326008)(54906003)(8676002)(316002)(40460700003)(2906002)(36756003)(82310400005)(33656002)(4744005)(40480700001)(5660300002)(36860700001)(336012)(81166007)(356005)(82740400003)(2616005)(186003)(107886003)(53546011)(6512007)(26005)(41300700001)(47076005)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 12:00:09.7165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57276585-00b7-41cd-2248-08da9fb6a92a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6489



> On 26 Sep 2022, at 12:04, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> For arm64 we perform builds using debian and alpine containers.
> We are missing the randconfig build jobs for the latter, so add them.
> This way for each container we have 4 fundamental build jobs:
> - defconfig non-debug/debug
> - randconfig non-debug/debug
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Hi Michal,

This looks good to me

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>




