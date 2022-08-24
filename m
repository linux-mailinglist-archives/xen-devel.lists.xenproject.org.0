Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E279059F475
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 09:37:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392250.630471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQkx7-0002Ki-7i; Wed, 24 Aug 2022 07:37:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392250.630471; Wed, 24 Aug 2022 07:37:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQkx7-0002HW-4S; Wed, 24 Aug 2022 07:37:29 +0000
Received: by outflank-mailman (input) for mailman id 392250;
 Wed, 24 Aug 2022 07:37:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DC3Q=Y4=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oQkx5-0002H3-LM
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 07:37:27 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70059.outbound.protection.outlook.com [40.107.7.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99574a78-237f-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 09:37:26 +0200 (CEST)
Received: from DB6PR07CA0071.eurprd07.prod.outlook.com (2603:10a6:6:2a::33) by
 AM5PR0802MB2498.eurprd08.prod.outlook.com (2603:10a6:203:98::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Wed, 24 Aug
 2022 07:37:23 +0000
Received: from DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::fb) by DB6PR07CA0071.outlook.office365.com
 (2603:10a6:6:2a::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Wed, 24 Aug 2022 07:37:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT037.mail.protection.outlook.com (100.127.142.208) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Wed, 24 Aug 2022 07:37:23 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Wed, 24 Aug 2022 07:37:23 +0000
Received: from a41fd2944aec.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 44B471DD-7610-4FB2-B2BC-A290A86AB53A.1; 
 Wed, 24 Aug 2022 07:37:16 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a41fd2944aec.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 Aug 2022 07:37:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GVXPR08MB7896.eurprd08.prod.outlook.com (2603:10a6:150:16::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Wed, 24 Aug
 2022 07:37:14 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5546.024; Wed, 24 Aug 2022
 07:37:14 +0000
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
X-Inumbo-ID: 99574a78-237f-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=nO7HzlnSOwAVkgF34gvnQ6ecGv3C09bAQM2FFep6WX5T/vCMDtZpN7nCVWR82iUhv57RPAe6EueEpxR1JdkWKYWcCiKbf4ZrYIq6gavDQJnQ/GgtaxnkVlsiVD7NIYigx6A8x4mVykLaDY+v86L1C3UL1+fkNNZvU/mPRZR1qVg8Grx2ULpOu92GZ1XWBFLT0N/JsxmIushcslXIDFVt3/2bW4KmmvEiN+plKacP9Biolm0zhAnErVuCQrakOhoQqCYidOI/nN32ysURqze+XMsfbAbmaVZ4dYXwa0mQuEtBlxaLuwGMUPBW4+qpoYV2lb+nrXs7WVXXOk5HoVoLdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZEq/e83HIzaNoHQR1mdMPPVp79HpUG1fmfaYpDeddY=;
 b=oAeZBcT+agxhrYMnjJIlcnHELHiK1243AKkF874ZYt5dfxjYdbRtqXjbTzB597QPeruMDlSMKI+S83d8e2+xi7T7cNpABvf2/zrzSlwN8LgslhZe9CFMOK8WFRueobZM6rxWSW5rkujr6LFI/C3ODALFu4Tl2CYrNCya9sMxYEKxD1NAHgrXMe4AxCWAxWIpJtHsqgzqxjO4ldm1c4MJgWSdz4T8KA7DB5bx7v4AwLj31sqKq0nXxpNVSDpVn4zuZIa+KISKwqzPwT0sa07w42580mZBL9vVJV8e1GXTY996d+Gyi0zEC1/fXQvabuDrhwiOFidSNerCYaefjchVXQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZEq/e83HIzaNoHQR1mdMPPVp79HpUG1fmfaYpDeddY=;
 b=sl1llKPwzfAY6c0C+ISuA5kn/fJ2LvUYv0T1TkROoWXZ8WO/MT+iNBmg3rS9dnLhEEy7YG8MWC/rG6WRGea6zzGh3DZRRMrt0iaTbOqzDoNJ3//84KDg4Gj/B95UNYb4lJXHgsFFAfpsHrTANCmUBs2MizJmgLytM4rKfrLAnsk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d5de14eecf11269c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lyq8/iP6WKG2Om8myJXtOsN6KKS3BVLANt0dpq3lM+9fbOxEU0HCyxjWQClC/uq5O+UThVuyCZOL9C1kwCcsv4k5ibLePewUj66xFOBWE/gaied8ybgmuEKR21rRhwNvAfchmrHmJm4ZgaaOXveF9BYQYlDXufPTqkFHvUvQR3Kf/SdnunBFAgf7/xpdBiHPoiEeomqqAZOlr/5L4BEOgxzULeBFbwK911cE2iNAEllfTBhGGAF8BH0KyNBckIDL4240RUPOuFlDEW1uLk1g6rahp4WJzEV+EDoOyrR5KEEtZrtgf32umIub7tKh1o4wVwRASVetmTDY9bhKays6OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZEq/e83HIzaNoHQR1mdMPPVp79HpUG1fmfaYpDeddY=;
 b=XaD3MaPhZdBch/4I9brSHarHWQEzP1mh6RgSFysRbzHus4vQ/Fb6dE9iB6vPsRO1JueLdicVScOcZ8ESR0QWc7YCbWopSu3482RJb4H5FtZI8R+TyjNIwVdNxoHbTJwYXAun3G8gWD3mnM/2yWhrxJ4y+u+Zon123YqCBtqaP57HK/hHznksH5yESBmb21khL6uzsgaA46hhXKnsUzK13JzT0/57G9HaSzRrMMYhURIA3KzfY5uxV2TM6Agnjb6GF+xOnkwjIbUZaBt/M9JzOtIOx9hz6q/oV6wxig409c7nFJhtlhCK6PwBvICboN0q8YwNClvnYMlDQVCGvB0Ljg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZEq/e83HIzaNoHQR1mdMPPVp79HpUG1fmfaYpDeddY=;
 b=sl1llKPwzfAY6c0C+ISuA5kn/fJ2LvUYv0T1TkROoWXZ8WO/MT+iNBmg3rS9dnLhEEy7YG8MWC/rG6WRGea6zzGh3DZRRMrt0iaTbOqzDoNJ3//84KDg4Gj/B95UNYb4lJXHgsFFAfpsHrTANCmUBs2MizJmgLytM4rKfrLAnsk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] libacpi: Fix cross building x86 on arm
Thread-Topic: [RFC PATCH] libacpi: Fix cross building x86 on arm
Thread-Index:
 AQHYttqU3r7Sk/IKHkKroerrTRS8F628a1KAgAARJACAABAJgIAAAokAgAAaagCAAQF/gA==
Date: Wed, 24 Aug 2022 07:37:14 +0000
Message-ID: <60E47246-811B-4131-9B04-27DFB00BB0C5@arm.com>
References:
 <c3d431217010f669de809a76c2f1c15a0313ae53.1661246753.git.bertrand.marquis@arm.com>
 <844e0164-96b1-8a56-a9c0-0f432b9e648a@suse.com>
 <B2DC2AC4-E59C-4C96-8993-D4812D73E799@arm.com>
 <74994bdd-8c70-7f5c-2146-157a36c843a0@suse.com>
 <87AD61AE-5C50-4F04-AF60-300C6A113A85@arm.com>
 <824f5b58-4a54-45a6-a5e9-bdc8532e89cc@suse.com>
In-Reply-To: <824f5b58-4a54-45a6-a5e9-bdc8532e89cc@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 34d6109e-688f-48ec-164f-08da85a37bf2
x-ms-traffictypediagnostic:
	GVXPR08MB7896:EE_|DBAEUR03FT037:EE_|AM5PR0802MB2498:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LbDqmgfwLg8hlWyjrdb7xJagBqbi+A1iUtQRG4xCy+XZVzxnlDR4dRVO7j1uFJYIf2UR8f1Kh6JJ3+BFUFigi6fv+kOeRezAtX6qdf+blgount8MQDdeRq7bM6gxLuUCScZm/hSks8rsfDfFuQqoAtEDnAG17NN8tktGvzIcky1cix7EWWvTk6HDvXGMg+/YNrtw3db6vBQf177rN0qNbT885O4FRbEsELGNjxWjxyMiiZA/eBPMnndP7nb4whDQD+SCIeZPuFKuFdTU5i2s6hyIiD4/AmPUMiw7ssT7Y5drrCo1gpaHlbFPBYNybWg7up11sH5GnNfYd48cOPG+CfiTA60vaDxFiPVGw4RukIXq3x6e+7dQCV23EHLTE0GG7aGg31tFW5y0XEIpGMMtx/fm74/Cf7foLKVh7P4TuuHNo2vv28/XUa+y33P/XPGwrtNNR+3deXuR0b7ZSUNbYk34xXjFVN8IMwqJlEwCr+w3egsLVKD1BkJjoqGjgWsWrsqQRPp+CrQnoi08NiXPEjgOZXRRAO0TvK2laXAldK2B1jO7GN58PhUj5R/jzKnb6WNenu05JZ0SDepSXzZ3a5/eIIBzp5UtGahpLszL5SuNJL+bKAaR24njBHjOHn8WZhzIH/nZ78tvEOC/nnmmTKDDftoZNliwgWtyctegLvwkEiV+Q+KkoihjkhDz1QYOz99UBWjjrneJIhzZokELy579ge+L+y6EUihl0zhq+naaExahyBESP146/tJIaAIrE5SXOklxXqnXSJbFy3QyeVF4gqSTdY0FyUmW1v5QCMw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(66556008)(8676002)(54906003)(66946007)(91956017)(76116006)(86362001)(6916009)(83380400001)(38070700005)(41300700001)(316002)(71200400001)(6512007)(26005)(2616005)(38100700002)(6486002)(6506007)(186003)(122000001)(478600001)(33656002)(64756008)(2906002)(36756003)(66446008)(53546011)(8936002)(5660300002)(4326008)(66476007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B0C4D64E27ED964CACF46BC3CF2F5811@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7896
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6224922b-b301-4c33-cebf-08da85a3768e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zjGODJ6VlxnqFOi5k53EuqeFKtfAJ+mBuf7Nn2GqpnGLEb1l4MjWC36L2zhVlrg1IxTm2OB0Ojbo8mT68lDucopR/K3H1Lw+Hsvxom5A3dM8r7hX0LLQPlgeX+cJybf7h62hbwGkHF9lHQoD9LXyfjruyjnu10RL9+mkvsyu7aK3BKx6SROYwZFNIHmLgd0QJmWcr7d5hxm1f904HaxHiXbRfLqOOHZZ+dh9D2kfaraftyWK4OK/9WsTMNYJDsL4Ul6+gTAsqgNx5vgbjnO6xPRHoMIDoEBNsijkqFl71u8qglv3x8WE18jz7kR14HBahbblNcDiA38WLp9owSDErKHcg7EqxsnWhK3OsJ1jDl9vnoi31Z4cB7bPWauyW8E+dXFJJETR9KwQkD/tX2nT4lq+D7tVjtWsoYpa8xyX+DGxIdha9a1vKx0lz1OJ+RGzwNH6wYQ2U7udJc//P8VvdCGAEzHIVgGB5AbZYG6mD1HgAJSU694EIKPQWchsbj56xf8kdTEBj7/qN9cRkc6rNDscAFKSekdbCNBjzU0a8ux2KLyJnZWlSU6cjUbEoGLNhcniJuKpsrTYcMb88WIxlO1n60AZnYhkbf6t7ox963RpfTAsbe0EoWzuNE5XwBEAJAB/F94FKht0OevZFgIzSew1cXkXzQjlqaA708JOuU83jZRd8HTWEOxw9K58UoZGn0AX3DEcjS8A/rPGvqjQupNSGOvNjIrs2kUbit+OgVmWX2hmKNHAElz0lNyZ2IB3HWZy7n7s7qV6IOjIMnQS7A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(396003)(346002)(136003)(36840700001)(40470700004)(46966006)(26005)(47076005)(86362001)(2616005)(82740400003)(81166007)(356005)(336012)(4326008)(83380400001)(186003)(36860700001)(70206006)(70586007)(8676002)(82310400005)(40460700003)(33656002)(54906003)(8936002)(5660300002)(6862004)(36756003)(2906002)(316002)(41300700001)(53546011)(40480700001)(478600001)(6486002)(6512007)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 07:37:23.1972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34d6109e-688f-48ec-164f-08da85a37bf2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2498

Hi Jan,

> On 23 Aug 2022, at 17:15, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 23.08.2022 16:41, Bertrand Marquis wrote:
>>=20
>>=20
>>> On 23 Aug 2022, at 15:31, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> On 23.08.2022 15:34, Bertrand Marquis wrote:
>>>>> On 23 Aug 2022, at 13:33, Jan Beulich <jbeulich@suse.com> wrote:
>>>>> On 23.08.2022 12:24, Bertrand Marquis wrote:
>>>>>> --- a/tools/libacpi/mk_dsdt.c
>>>>>> +++ b/tools/libacpi/mk_dsdt.c
>>>>>> @@ -18,6 +18,16 @@
>>>>>> #include <stdlib.h>
>>>>>> #include <stdbool.h>
>>>>>> #if defined(CONFIG_X86)
>>>>>> +/*
>>>>>> + * When building on non x86 host, arch-x86/xen.h will include xen.h=
 which will
>>>>>> + * try to include the arch xen.h (for example if built on arm, x86/=
xen.h will
>>>>>> + * include xen.h which will include arch-arm.h).
>>>>>> + * To prevent this effect, define x86 to have the proper sub arch i=
ncluded when
>>>>>> + * the compiler does not define it.
>>>>>> + */
>>>>>> +#if !(defined(__i386__) || defined(__x86_64__))
>>>>>> +#define __x86_64__
>>>>>> +#endif
>>>>>=20
>>>>> Besides being confusing this depends on the order of checks in xen.h.
>>>>>=20
>>>>>> #include <xen/arch-x86/xen.h>
>>>>>> #include <xen/hvm/hvm_info_table.h>
>>>>>> #elif defined(CONFIG_ARM_64)
>>>>>=20
>>>>> At the very least you will want to #undef the auxiliary define as soo=
n
>>>>> as practically possible.
>>>>=20
>>>> Ack
>>>>=20
>>>>>=20
>>>>> But I think a different solution will want finding. Did you check wha=
t
>>>>> the #include is needed for, really? I've glanced through the file
>>>>> without being able to spot anything ... After all this is a build too=
l,
>>>>> which generally can't correctly use many of the things declared in th=
e
>>>>> header.
>>>>=20
>>>> As stated in the comment after the commit message, this is not a good
>>>> solution but an hack.
>>>>=20
>>>> Now I do not completely agree here, the tool is not really the problem
>>>> but the headers are.
>>>=20
>>> Well - the issue is the tool depending on these headers.
>>=20
>> Yes but the tool itself cannot solve the issue, we need to have the valu=
es
>> in properly accessible headers.
>>=20
>>>=20
>>>> There is not such an issue on arm.
>>>=20
>>> Then why does the tool include xen/arch-arm.h for Arm64?
>>=20
>> Because this header defines the values required and as no such thing as =
include xen.h.
>> The point is on arm, the arch-arm.h header does not depend on per cpu de=
fines.
>=20
> At first I was surprised you get away there without including xen.h -
> this may change at any time, as soon as you grow a dependency.
>=20
> But then the inclusion by arch-x86/xen.h looks suspicious, since xen.h
> itself includes arch-x86/xen.h (first thing), so unless I'm missing
> something arch-x86/xen.h can't really have a dependency on xen.h. So
> maybe in the short term you could get away with removing that include
> as a "fix"?

Just removing the include is ending up in errors (I tried that first).
I will dig deeper to check if those are possible to solve but some files
including arch-x86/xen.h should actually including xen.h instead and
I think the amount of changes might get a bit bigger.
I will give it a try.

Bertrand

>=20
> Jan


