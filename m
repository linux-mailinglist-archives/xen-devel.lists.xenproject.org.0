Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 439DF773947
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 11:17:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579499.907495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTIqJ-0008RH-97; Tue, 08 Aug 2023 09:17:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579499.907495; Tue, 08 Aug 2023 09:17:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTIqJ-0008OR-5p; Tue, 08 Aug 2023 09:17:31 +0000
Received: by outflank-mailman (input) for mailman id 579499;
 Tue, 08 Aug 2023 09:17:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/Vr=DZ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qTIqH-0008Mh-DO
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 09:17:29 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7d00::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63835951-35cc-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 11:17:25 +0200 (CEST)
Received: from DB8PR03CA0031.eurprd03.prod.outlook.com (2603:10a6:10:be::44)
 by PAVPR08MB8800.eurprd08.prod.outlook.com (2603:10a6:102:2fc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 09:17:18 +0000
Received: from DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::8) by DB8PR03CA0031.outlook.office365.com
 (2603:10a6:10:be::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26 via Frontend
 Transport; Tue, 8 Aug 2023 09:17:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT032.mail.protection.outlook.com (100.127.142.185) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.44 via Frontend Transport; Tue, 8 Aug 2023 09:17:18 +0000
Received: ("Tessian outbound e1fdbe8a48d3:v145");
 Tue, 08 Aug 2023 09:17:18 +0000
Received: from 70315378e119.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B602DDDA-DD00-4B11-8F51-3FD7858C5C6A.1; 
 Tue, 08 Aug 2023 09:17:11 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 70315378e119.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 08 Aug 2023 09:17:11 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS2PR08MB9450.eurprd08.prod.outlook.com (2603:10a6:20b:5ea::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 09:17:09 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 09:17:09 +0000
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
X-Inumbo-ID: 63835951-35cc-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E5/6eynU8wmMfq8xlBDA/OlTx/dc1Cb3+eprC4tznHQ=;
 b=K6sXuaB9fMlU9P/vPaycLLG3tfP0ODwyU9ytesZd5x7pw5mB+R8FjfN3ugzuto8HgvAvSrOfBv5LqAfl/m3jhMadnte2IbkIX+3WxGR0iEJwkNPOZgirb5Hn6CpYeJQjcyxO4XDGsDLdC0dAceTtKi3XVwgbJqzGlam327fhj70=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 57074e8260c8fed5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QujDfSXr7iFeKvZDV3VuPnfMgzTyem3Kz/kBOiUBjR5ZFsWXog+P3KQbJmE9eNfOPjPehjro0ao/Nz2dLQpIvcIwz34Wccw5K6/Ml6rWEu3frLxzSs67oqwQU1j/3fUoG/EqCtEaVv85eJ2ezD1A849YLpG+cRx/Apuw8qC4YP3NFZsikmp27aIHELtiK6TiTdhXLuejdSX2FmxQ6cjB7vm2aPA8kAdVKJivR6L4uZUYPqXyfkCLA7mqxa7tXBQMjW3a9hpE48A3ipmpnqYrir4ZHfnElymd1ZzZtejmAvDv6anp+eU5nNfqI07//tbLDBWhcJ4U6DjC9/D+fXqOxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E5/6eynU8wmMfq8xlBDA/OlTx/dc1Cb3+eprC4tznHQ=;
 b=hK+D9Xis6ri/17kdX3VLqtblA1Qi7XB4+87X0fblcf1KFbluiSaKgsFOSX7QpY5VgFOqcPfU7rOCSJTsNI1KYWHGRAT3HfDAPK/YRKEVkL2ICQUHPoQtUgCioTfO6UrVUpSD2Llf0UluBluS+dA07CVQXG2QiW0plkyLz+9L5fn+/dCp1mLCG0v1CfaH6nyfcBR9M4OhiEGb5jo/rE6A+FraEv6fljHUDzkJ491jgD6f1hpZVV8+p+MBsvQBMHdMo/A0ST7peSdsQDV4xImU4N5mjGcDqcDwlsAXxzNpvwEUw11nzMOfx0fihVZ3fJSmmqgK5fjulIdo1iU8NzPUSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E5/6eynU8wmMfq8xlBDA/OlTx/dc1Cb3+eprC4tznHQ=;
 b=K6sXuaB9fMlU9P/vPaycLLG3tfP0ODwyU9ytesZd5x7pw5mB+R8FjfN3ugzuto8HgvAvSrOfBv5LqAfl/m3jhMadnte2IbkIX+3WxGR0iEJwkNPOZgirb5Hn6CpYeJQjcyxO4XDGsDLdC0dAceTtKi3XVwgbJqzGlam327fhj70=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] automation: Fix missing smoke.serial in artifacts of qemu
 arm32 jobs
Thread-Topic: [PATCH] automation: Fix missing smoke.serial in artifacts of
 qemu arm32 jobs
Thread-Index: AQHZydWPumMM9UHF6EKOWcKXws4Tpq/gHn4A
Date: Tue, 8 Aug 2023 09:17:09 +0000
Message-ID: <7B3BFA6D-5BC3-4ECA-B897-07996D0E9883@arm.com>
References: <20230808085059.13112-1-michal.orzel@amd.com>
In-Reply-To: <20230808085059.13112-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS2PR08MB9450:EE_|DBAEUR03FT032:EE_|PAVPR08MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: 504d4e92-f0f1-48c6-9ecb-08db97f04360
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KSD1s7qg+HFnmfyunMXzHqOSdfmc6SnQG8jsN9lS0yVZdus6zmIVHsCnb+/75FlMF/X8TdnU2p6UW0IZgXkMVF4p1cYLUAOg4cSPSAvr7rAjXfr8s8CcbkH2WDoIL4XsAoNMnsHqafn/mkWa46LMtnQY8ZNo1CCHSQjUryXsuGR1NS4bhpBKujUBpBtBRjOCZueT/Ke+jUwImPVpo6rDuiE9dTOmpRa9EKLGDryflG4ji8nbRXmNPewyedPVxr/iS4OyWvdAEOnUcn2/AH49LeATdRZ6R5G7d1W0hffVZtKMRO2aAQw7ZCTi/TTk+SiKyeJVr9bWIG7HATvqlDCve6CnFiEccR8ZtzJ6XOvvaYBWc6/2OfdkTDlCDzpL0Sh419nVa0hGHPn8Ugf5YbpjdItPU+y5ZNYdnFdSkJznP10lZ/+mJOTfm0vyWUsSusvdVsLuESQnPa5xDwmWigPYXD11zh6xY1ILzJHF9fLUwnaAoluo48TKBWHKw/gNHy1ZsJrY3wqjADFLS6OeQkd4kG49nfTHH3qDLriGh/lYMSQq3mqhPCGd3ApRjtaNNzcn0tR7QJFoGm5pg/Hpvxq4qGShhvsR2JRKvv1DjUI6VdY5WqguUiDFGqgSDXaXOaKjdtXy/OF+pDNVyEh+grK19A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199021)(186006)(1800799003)(36756003)(2906002)(5660300002)(4744005)(2616005)(71200400001)(38070700005)(54906003)(38100700002)(6486002)(91956017)(76116006)(64756008)(66446008)(66556008)(66476007)(6916009)(66946007)(33656002)(6512007)(122000001)(4326008)(316002)(41300700001)(86362001)(8676002)(8936002)(26005)(6506007)(53546011)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <71E197C55DB29D4491D492453A2465DF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9450
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1c857708-d677-4c67-8ada-08db97f03e68
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0PqAK3LpAMPH1PbcSqRJLB7KswDW/EaQLTZFV5wDfM96CGyNg+QdRZ5S5vOQwVxxzTJY8epR50kGxjVBigjqr+gx8GE3g6hZRRPqljbDkMYJEfaP3s5kDKblhFSJRaO4J2p2O6VQAqXBeJRE1WMLfivCUE4tIdHi7KeH9d8s0AcQsN6fJ5Pg3kzkSZgiY2F63HO9OpLkAd//Jj9bI7iKUY2SicfPJh1YeoZr/niQ2HejsAZ8jyWP15X5ZZwQh2XMF9XWxs+DN9z+apXg7+So+gSVSvxNHP50K/IyVyb0w9v7dn78om5gXZrowm2oMxeA4pKJwcGVLnqFBvOULsdrKu5zsat5ksvoGBd6mLa9JZAu3S+9kxAmDwaLm4N7rBkg12WoqR7SPRd4mG5NRGP/KXcYJXuxvTUV9CpyHEKBTvEgLYPYmIUFXQIt2I/k2OCDGMyz3hozkazLTsYHC4PP3ul1y3OfKkxCeCPgZxS2BCJNqsxiDejzJVGkQ0oZO495CcNzZSXZA1c5DNWvD7C5TplQzGW592SGfGotfE+Ru4/+7+Ycu1OuVoqoDD1dQTrl2Z1EE4KAr2qGyEzfO95Po4WkUrWqJHbsHV9CDuFrMfXv2fEBIg1ryVkSdBg1qYlz6jF5VntaZGuOc1kUEBaURhr1vi3Pf+BEMCIED73wvbzqSPkVDv6xwQGFiRP+JCX1lYDUWCZsUqRPjEEn2ujqH3zrplP8xpMpGz9V5rbqJcwK1TeoS3Z8PB6G5dJfOpxA
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(39860400002)(136003)(1800799003)(186006)(451199021)(82310400008)(36840700001)(40470700004)(46966006)(70206006)(36756003)(4326008)(2906002)(478600001)(70586007)(8936002)(8676002)(6862004)(5660300002)(41300700001)(40460700003)(316002)(36860700001)(4744005)(40480700001)(54906003)(33656002)(6486002)(82740400003)(356005)(81166007)(6512007)(6506007)(2616005)(26005)(53546011)(336012)(107886003)(47076005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 09:17:18.1407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 504d4e92-f0f1-48c6-9ecb-08db97f04360
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8800



> On 8 Aug 2023, at 09:50, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> It was observed that smoke.serial file (used to store boot logs) is
> missing in artifacts of qemu based arm32 jobs. This is because the
> artifacts:paths listing smoke.serial specifies paths relative to the
> project directory but the qemu-smoke-dom0{less}-arm32.sh scripts create
> this file under binaries/. Fix it so that smoke.serial gets created in
> project directory just like for every other test job.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>


