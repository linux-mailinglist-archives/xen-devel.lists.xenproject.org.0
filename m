Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC0E5FB2BD
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 14:58:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420197.664789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiEpC-0003vY-BL; Tue, 11 Oct 2022 12:57:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420197.664789; Tue, 11 Oct 2022 12:57:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiEpC-0003sX-70; Tue, 11 Oct 2022 12:57:34 +0000
Received: by outflank-mailman (input) for mailman id 420197;
 Tue, 11 Oct 2022 12:57:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W/N3=2M=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oiEpA-0003sQ-TQ
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 12:57:33 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20066.outbound.protection.outlook.com [40.107.2.66])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4473514a-4964-11ed-91b4-6bf2151ebd3b;
 Tue, 11 Oct 2022 14:57:32 +0200 (CEST)
Received: from DB6PR0301CA0021.eurprd03.prod.outlook.com (2603:10a6:4:3e::31)
 by GV1PR08MB7313.eurprd08.prod.outlook.com (2603:10a6:150:1c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Tue, 11 Oct
 2022 12:57:28 +0000
Received: from DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::f7) by DB6PR0301CA0021.outlook.office365.com
 (2603:10a6:4:3e::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.19 via Frontend
 Transport; Tue, 11 Oct 2022 12:57:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT025.mail.protection.outlook.com (100.127.142.226) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Tue, 11 Oct 2022 12:57:28 +0000
Received: ("Tessian outbound 937eed45f6ed:v128");
 Tue, 11 Oct 2022 12:57:28 +0000
Received: from 789df65a4ad2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FDD5BABE-CE8D-4E09-AF1E-76F8B66B46F1.1; 
 Tue, 11 Oct 2022 12:57:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 789df65a4ad2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 11 Oct 2022 12:57:21 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAVPR08MB9625.eurprd08.prod.outlook.com (2603:10a6:102:310::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Tue, 11 Oct
 2022 12:57:20 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53%7]) with mapi id 15.20.5709.019; Tue, 11 Oct 2022
 12:57:19 +0000
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
X-Inumbo-ID: 4473514a-4964-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=CsDa0TQchRMWjl50hDu+isqeiPf++z9Qhp1cD4rJ2qR50svrC7eRkaFmk27mS9cXfqxqOKnLoT9ekBvdhTaaO663zOCeH9oz6h9wqDwihVLauWMnErBUn2mywu9jaY+v0dn4XB6hctTMZTA5UWitqOCZnte5fIuYBcUvV7klqx6VaY/V2Nyktmf3k3F3kl0GL0I/daY+B601v8VDf0XvRkGX6HOYNWGLHTsLgDpPJBcvlvfHj+gHynOVNB80PcydXWblz8Bvwk6fq7v1UV0gi/DYxL0OoiRm8XGPgO+XQlbalzJGjxf7Hp+7K2aqjAhjQO4guF1oGNJdGxTl1zVh9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13Gq5yH0/DvrNgjO0367SBt/QtrgEhDlvlSzOEqs0eQ=;
 b=ofT+gf1QUISLpJ7aLGV+8FXZMXVtD/f4CRAA4GZvyZLLU9MkArq273Zm3n8dwEjjqRUt0T2SUpiCr6aDvh2Z9+rpxjBa5bOmw2Z4rsChKJiKQRx/8C4mKC1pc3s1NpA2D9+d8ivF/fongfKma1NVXBoT9/af7rzptkjL17vmazLVU3SaWbjwbie3q7zBjTa4YgQLQ1Ec8t+emZ/780Wd4zxpNgwQYK5c3bojaVdmYADPzpIReojbH/+CrcrH9Vv0aMySbA9bgSrg//2cVeBDsbwVESIgXrT+aefGdufdgVqBCbXpzQD9Q4BZNptMwyroCorLGYwxoCtZRBqcfqzTQw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13Gq5yH0/DvrNgjO0367SBt/QtrgEhDlvlSzOEqs0eQ=;
 b=HvVY94Fjv9sA4Kd2ObDSNGpRnNv+zBQDeURUMcF/UNHkn+8AgQ/ouDbZNoukhWbfrcvh40scsMiWcmpLzVO3uxhiB6jVlqrMq53KNDYoHamUm5U3nXhLf/fWm22sDVgKfDa85e+pIHi0VKpMXWIdkSCgX0Ym4Kh+DUWOuYjS6Qo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9ba5172e819ffd99
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/fhkRWsUnZ5ufq1a5hgn89RcU1NCXGp7YNsxXC54Z3oqWzKq5PYYseg9c2qSsU4opnMevdHKsO5vtRjlubcP14Uowb8/ElEAezqN0Rd3CHIqSpE9NnOEvLlYO0LvMfpRIp+iVKDeMh/Ai83IjbCbqecEDz3dg4lAE8CSnmUDkKA+GPoAsAJIgbyBu/GBSvwVK9m7tJgzdbJ1gpBhwgHqpxBp59QcQBstB7kD7eBvKeKKYdyJoBU8OVhamb6KW2hCRFErdydEiTgUfQmSripSZQ+7lEzcKRpGxWeGIbl5+uJM9W0Lg2XCWUA8uCFx0eg3dSnvchqNE/SZB/FDZl8Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13Gq5yH0/DvrNgjO0367SBt/QtrgEhDlvlSzOEqs0eQ=;
 b=WrHqyaxSM75ULARqUMfEUNvhqYBHGr51WCEhDAnpoqkXMLa1ZBRT44/QankYwQWQ0+M9L24CwDqT37j8AZkU024OAdeNQ1Dsmz9hUAnBsOEtKMSgKl7F4qk/F09qKPJ6AgrH19Vv6sYV07Ss4ByOBPEbNfh1Wn8Pyiire5F0Wjg+ikda9bjtemDUHH+G3J4/WFUs0Q+840CrUvSwmIG1H5024EuNBE9N6d3HwJsTQf+vcFg8t8WIi/GhBFIzZLk2xbVyqK71ZU2kFAwCYBKQdcpcTl1qmhdKr9zFNlwOcqevw31xwTMAxRXJKX/roYJZt45IfE0SeJ+PSZsN2VBDfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13Gq5yH0/DvrNgjO0367SBt/QtrgEhDlvlSzOEqs0eQ=;
 b=HvVY94Fjv9sA4Kd2ObDSNGpRnNv+zBQDeURUMcF/UNHkn+8AgQ/ouDbZNoukhWbfrcvh40scsMiWcmpLzVO3uxhiB6jVlqrMq53KNDYoHamUm5U3nXhLf/fWm22sDVgKfDa85e+pIHi0VKpMXWIdkSCgX0Ym4Kh+DUWOuYjS6Qo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, Doug Goldstein <cardoe@cardoe.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>
Subject: Re: [PATCH v1 0/4] Yocto Gitlab CI
Thread-Topic: [PATCH v1 0/4] Yocto Gitlab CI
Thread-Index: AQHYt8nlVEDeUTiM20ag9zvPCK1jqa4D28+AgAWWm4A=
Date: Tue, 11 Oct 2022 12:57:19 +0000
Message-ID: <4B9E702A-E606-4A78-BC27-BFCFA60A077E@arm.com>
References: <cover.1661352827.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.22.394.2210071618300.3690179@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2210071618300.3690179@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAVPR08MB9625:EE_|DBAEUR03FT025:EE_|GV1PR08MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: b3b73797-c338-4011-10fa-08daab8826f7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 isBxSGiSeTfw5LuW1eeCj/BptV35jW6FOqzL/QHPjAKjP+KAFinrKzDvMt9yzTdqX780nU54vznUD7ziuE9099lFjh9qnKyXRIATlsKxrBvk+rsETQbzB5a6JYfkR4GzRiJ3j1Bkl74fLfz+Ys42YPv/DHfhVsT1G0z3HK7pN1nZUqJvcMNkDqf4pjaSGFwzLlTa423S81hhwztsIYO30L6V/Fb6LBo5HNmtWXEec3ULmVoZiCFxJ5qvWSVxSffOS977Hxc4ejx+fJuSXsZtSd6osocrMGaEtAurSJ4Rez4vwffPG1xgIqJlzr6YKqGgn5lWr6yXclzb8ySD5Bh+7UhgqqBOimbpXRduiOvUt2CJcTEkEvnKjr5D9g68xQzSHOEuWVGtsx64NuuiIsAEwGdxUKAIxnZsuMZg+s6h8mEOcjUbdUvqO/M/wQfpotEJ+f+RPY3TF3Z4iIssvYqEwFXMDimOO86L9LtmDhCpXhu+wYSjMCNcD/lnE2YNlvL3uL8Ookw7PpwsvHEcN919sEayeC9JdaqB/9IbAOeE1VtE6O0C5SbhzIhPtTtiebONcL9cft6h5EUGQWssuCfcIWcvQbUjSHi/nlRgx5LsRXy98xMX5bMNHca+JYlhLj4NpO+ZkwYriITJBwMGvCcl1mvkYYNW/fZOWQy7eChkkMBhO+h39niSPYTqdrkXLK3Ktl8gK/4dMW5YjpzVXx9yC/KP7kfp4Q0B27x83eVD/pQZrjY7+/bTJ6WPc8AoOvAzDKG24ZY5L0v4pgllzR8d6/O41atsYO1tnHtGDcJG96U=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(366004)(396003)(39860400002)(376002)(451199015)(478600001)(2906002)(6486002)(41300700001)(8936002)(38100700002)(5660300002)(33656002)(36756003)(86362001)(38070700005)(71200400001)(83380400001)(6916009)(186003)(54906003)(316002)(6506007)(53546011)(2616005)(26005)(6512007)(8676002)(91956017)(66556008)(66476007)(66446008)(64756008)(66946007)(122000001)(76116006)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <40CA5AB2E20838488BBC4A5B2995B201@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9625
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	386d8c5a-5bec-4be9-6085-08daab8821e4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Zy/YnMyohrTrBIC6cSufoFK/kyaEcDti0RlO2cBipBEVqIBCUNQocFTO8p3KokwaI3ID8udQM3Sb+zv/eSTxNWARFWAC9mJGjLXGLOVawVD4Y2OgdeXpAB/fzpj5GQV/Gq6gb2nCBpPF2GX2frR9baoBvO3Egf/ZaU2dPuqF0yddIZHHxrSgjfZPptkAmuCmCXORIAOJh3Hs76KhlqhI+BDiF1c+bqoEdqqeEqZbJu9NbTLoXXnyKCRqRM2OfQzOgAMVRFxZeLXNmBVNZzebk6u6mt6jvFrPvpsL+4vhtgE+AH8TY2zFAuYqQOQjqM+EJb+860HpzbKhGEb9ni1eqS+xia2hBVcVb5HDvJJz9dME8p5wcplAmf5QqeDdliHfK2t3ZNj+mGW/uo+w5KTOKybdQJ9ktb6i3zfB2Q4ye/3N23j1tDISybjgEfkS4WuGB6JNBUyJWTZfW8BNlwUHXMXyDwFwysVzfzY4KLmVDv+8qvapxtqHJBMhNJdnYBxG7WJXUOMDOgY1rHf2mZMp0dswBvRiA6vWh8vNz6hfYrliF7GXq+OSOvwr0JTpQ2oC2vHBYX26dINsg4cL9jOMkYfFkDLFy6FMOKW+5r/v1aj9ePfcRnBvDK9MEqLbY+Bp9jS+memCeYR2Kuuktm+0/lpqLLRXHoQD8eqtZTHQeDs1BrNrPc29W4iak0iySLHuTp8dPxayuJpPTQ5omwEjjmm9QRfqd3c9tZQ6LPK1ofohZjqotJqD4IdWYOZjYi5rNEnZqDPxHjFV0MjhBkkauQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199015)(40470700004)(36840700001)(46966006)(4326008)(8936002)(8676002)(70206006)(41300700001)(6862004)(316002)(5660300002)(54906003)(70586007)(36756003)(2906002)(478600001)(6486002)(82740400003)(6512007)(82310400005)(26005)(53546011)(47076005)(36860700001)(186003)(6506007)(40480700001)(81166007)(33656002)(40460700003)(356005)(86362001)(2616005)(336012)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 12:57:28.3974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b73797-c338-4011-10fa-08daab8826f7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7313

Hi Stefano,

> On 8 Oct 2022, at 00:36, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Wed, 24 Aug 2022, Bertrand Marquis wrote:
>> This patch series is a first attempt to check if we could use Yocto in
>> gitlab ci to build and run xen on qemu for arm, arm64 and x86.
>>=20
>> The first patch is making sure build-yocto.sh is not catched by
>> gitignore.
>>=20
>> The second patch is creating a container with all elements required to
>> build Yocto, a checkout of the yocto layers required and an helper
>> script to build and run xen on qemu with yocto.
>>=20
>> The third patch is creating containers with a first build of yocto done
>> so that susbsequent build with those containers would only rebuild what
>> was changed and take the rest from the cache.
>>=20
>> The fourth patch is adding a way to easily clean locally created
>> containers.
>>=20
>> This is is mainly for discussion and sharing as there are still some
>> issues/problem to solve:
>> - building the qemu* containers can take several hours depending on the
>>  network bandwith and computing power of the machine where those are
>>  created
>> - produced containers containing the cache have a size between 8 and
>>  12GB depending on the architecture. We might need to store the build
>>  cache somewhere else to reduce the size. If we choose to have one
>>  single image, the needed size is around 20GB and we need up to 40GB
>>  during the build, which is why I splitted them.
>> - during the build and run, we use a bit more then 20GB of disk which is
>>  over the allowed size in gitlab
>>=20
>=20
> So I tried to build one of the build containers on my x86 workstation
> with the following:
>=20
>  make yocto/kirkstone-qemuarm64
>=20
> but I get an error from the build:
>=20
>  21:30:20 build qemuarm64: Error
>  22:00:38 run qemuarm64: Error
>  22:00:41 Build Complete (2 errors)
>  The command '/bin/sh -c /home/$USER_NAME/bin/build-yocto.sh $target' ret=
urned a non-zero code: 2
>=20
> Anyone else is having a better luck than me?
>=20

I did a new run and everything went ok on my side.
I will push a v2 of the serie to dump more logs when an error is happening.

Cheers
Bertrand

>=20
> I don't think it is a problem if it takes a long time to build the build
> containers because they are not built often and they are not built as
> part of the gitlab-ci runs.
>=20
> The issue could be the resulting container size. I wasn't aware of a
> limit in gitlab -- I would like to try if there is a way around the
> limit (either by changing a setting, or potentially switching to a
> premium account.) However I need to be able to complete a container
> build first :-)
>=20
> How did you find out about the 20 GB limit? I couldn't find it in the
> docs. The only info I could find states that there is no hard limit on
> registry.gitlab.com.
>=20
> Cheers,
>=20
> Stefano


