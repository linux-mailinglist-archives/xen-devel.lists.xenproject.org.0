Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 538AF57346D
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 12:38:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366470.597264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBZl6-0008UK-Tg; Wed, 13 Jul 2022 10:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366470.597264; Wed, 13 Jul 2022 10:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBZl6-0008RK-Pt; Wed, 13 Jul 2022 10:38:20 +0000
Received: by outflank-mailman (input) for mailman id 366470;
 Wed, 13 Jul 2022 10:38:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKIO=XS=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oBZl5-0008Mh-8O
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 10:38:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2040.outbound.protection.outlook.com [40.107.22.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e877768d-0297-11ed-924f-1f966e50362f;
 Wed, 13 Jul 2022 12:38:18 +0200 (CEST)
Received: from DB8PR06CA0058.eurprd06.prod.outlook.com (2603:10a6:10:120::32)
 by AM0PR08MB4082.eurprd08.prod.outlook.com (2603:10a6:208:12e::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Wed, 13 Jul
 2022 10:38:15 +0000
Received: from DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::36) by DB8PR06CA0058.outlook.office365.com
 (2603:10a6:10:120::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.11 via Frontend
 Transport; Wed, 13 Jul 2022 10:38:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT028.mail.protection.outlook.com (100.127.142.236) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 13 Jul 2022 10:38:15 +0000
Received: ("Tessian outbound 8e3d5168572a:v122");
 Wed, 13 Jul 2022 10:38:15 +0000
Received: from 17489f958cb0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F8F8BE0E-56E4-4F81-9967-A730CC0FA0D8.1; 
 Wed, 13 Jul 2022 10:38:08 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 17489f958cb0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 Jul 2022 10:38:08 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB6PR0801MB2006.eurprd08.prod.outlook.com (2603:10a6:4:79::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.21; Wed, 13 Jul
 2022 10:37:59 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7%5]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 10:37:58 +0000
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
X-Inumbo-ID: e877768d-0297-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=V2GKrKUu0hzm2ZK3LYg3dM4t51kJDx1MWxp309skHqJr8FUhBDjpUrN4jbOLqbLVVOA3en1wsIdr9ItVpuVIAK+qZWLHsF0AyLJ/zTdZfEUQrdE1F4GJZJXcVtVucvP3xu0baxHSt18/L8dXy3p4UVHxo9aFNm75JdYhP1k/1sP/SW4uvJ7R594m1s63twxzE8ZNLDv7IHsR1RCjCLGIDTENi4zV/k4DB4nUkJQNVImfo8td7LUULKW5x/bZyziyQnNOgSD2uEk7zFz6Nt8rEV9Z7pp+STLYIVwZCOOQ7izEByZ2am3e0ILGqQjHvFwNjQ8I4J+8j34Y1YMLhDC/KQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGi+tMeXa0dkMg9eds+7MPut3Nzf9R8DwN4XqsDiXKg=;
 b=nDVLRUWiIyQR2vRFwXkKUH7HrF1npXzpsEq8w8C4eXoim5MwXlQnS0Xjp/cLM7wFQx98z4I9qZpw2Jh2XYu/kOBs7tFkCrC/TvgXIFUzFaGvv62DPGgJe32dJFYSIhNSnwwaiuCkQMUz5DpvOISzVOQYo10Tf6OiFuOk4ihTKJGc1Fsp+UZzB4I8L16TpHtBIaintT5siHaqcTpg5TBSwIDRg5D/QfECZSWZmCv8EMqVBWUf8NRFg4uSTwMfaBO8f6nfhXCsaaIEG29hzvcRTAlneDF+GgDSIYm8n2k+UPELxJ4FSdNd9LvWOFHUIQEvER+ecx6j3X0NIL8ncPUpJg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGi+tMeXa0dkMg9eds+7MPut3Nzf9R8DwN4XqsDiXKg=;
 b=Ct8op7rPdxrkJsvvMHqyySwGtYx0d94WBgU8k8Z4uLeX/EH15IJHRuufI2c4J04e62012GFEc3BA8o3jL4omc1u/I3ZZrqQOLpOKicCk+tw65LXfvmvXA/Flj3dwvwB0RvXQ6aV2aGBEFGp7z9u9wHgjCSLlUGtlgq1P3VYU8Sw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxwyMU6Rf7sUZZeH4wmTM9frYoB7pTOrfWK+tNc9YvnVtUbukYrpjkz0WML+KdcNzu1orTr3ZnvboensTvpPm8Qxaoq124fzfWai+w7GuDHdRealjNguOeBXgN/F7HNGpXKm5JEbGfKtW5LTB3KK85KTkIxtWFPccTAlpFx1Z+Tj08uSFEqxfzSisg7Sje1akSWVjvFAMzmPwsgsJOou3YpOaJaTgDPzICIfBo8Pjozd4Dptl3gJQeCmlaAlfUAaicXuW24SHi8bBVbbUhTsfGURSf7lWlrnvMJpeMPhcbmsYs1pTnJy5sGk9LkuafRytnXyfq9P/XqouXycMHcIqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGi+tMeXa0dkMg9eds+7MPut3Nzf9R8DwN4XqsDiXKg=;
 b=JSWRLLXiGJtbFUXY+qFuAwumfdsek4qcSehiZOqzP+hu86y6YVqqWquw4JEgfBgeoL4nkvYzJQ1pIRv0b4fVobp2cnB1oBxo9/TZllR+ywV1N1wajfmyJfLQp3zTRADsV/aYLmF41TJIud3NkMtNdOFo0KwEGUPgHNH2eQ8XHL2GVtO8TFRHOWUQqBaGTMeOu3hOjjbL49kfE4gauXorXBPD/chJUI7FY7aIa6zHUs/NKGX0MDHjSWH/DmPuRjBnvQUglMsp0wD1fOsYdJeLGvcXhV7AHbSXwuSMUCUYxVXNzMWtXpdDOJmuI1IRGcEMCM6orKD9BIZVlItg9IWDjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGi+tMeXa0dkMg9eds+7MPut3Nzf9R8DwN4XqsDiXKg=;
 b=Ct8op7rPdxrkJsvvMHqyySwGtYx0d94WBgU8k8Z4uLeX/EH15IJHRuufI2c4J04e62012GFEc3BA8o3jL4omc1u/I3ZZrqQOLpOKicCk+tw65LXfvmvXA/Flj3dwvwB0RvXQ6aV2aGBEFGp7z9u9wHgjCSLlUGtlgq1P3VYU8Sw=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 5/9] xen/x86: use arch_get_memory_map to get
 information from E820 map
Thread-Topic: [PATCH v2 5/9] xen/x86: use arch_get_memory_map to get
 information from E820 map
Thread-Index: AQHYktrCVaKtwgivsk2Qg94d9JgqNq16xCUAgAFbxFA=
Date: Wed, 13 Jul 2022 10:37:58 +0000
Message-ID:
 <PAXPR08MB7420A2F6592E9D869789FCF49E899@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-6-wei.chen@arm.com>
 <b42ac0ce-4f5a-9113-57b0-d85d37bdc65d@suse.com>
In-Reply-To: <b42ac0ce-4f5a-9113-57b0-d85d37bdc65d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 06B3638F97521346B9C47B627166F4C1.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ce9bcf23-9d7a-40e4-8b1e-08da64bbcadd
x-ms-traffictypediagnostic:
	DB6PR0801MB2006:EE_|DBAEUR03FT028:EE_|AM0PR08MB4082:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1J+wcV23mO0kjOAqqfYQE4CszncYtVBN6M5b/fOf5JSAr3lUFORx6dSXl30PosbKWm3DJk0YrkAdidaL4F6HzE0Bnx6Nf80mEqVRtG4bhFMAO0E3d4ezeKqJmTgE5MB8Ti+qe1bV7CwkFBcft/7IiYidh7cUgVyle0yFjVYXx/s2e68l0AiBQg0/458WdPPJFMJj3Dt36QUNR0HU31F5rd+Bn3yuP/QMUN5DXKzndr6h7/adwDeSWOlhLSo6lPdljwVeZTIJke6YRpuh/B8KZGzbldy2AmhDPsMPeKGJnL7lEINaPV/uQdw8JWPYlF+nYikgKZT7IlnH4hDC3UyrPeq1msREdF+0IUGYofGSyi8lmp6MdaeKk6UYniwtCGxgQU9pla3sGs/i034fX+By0S09RVfrcx+ydx5xRoM+FoHT0Jvt8UqZyFFwdHBIH8rmGns0xZDTr8m5IHqZhwsibBng98bAfAHl2uxDcOKaawdJJRn4Kp6tflGFEqzlK1zpMm/A/chYfDdnMtFF17kYVy+/oomvYK0Le/3wLE/jhHeGGLv7wYBnGbUpzUdVkzCmNNVGF8SkwAGaDq5rb0ncYFeT26AzK6a4Of3kn0bZSrUNzoUK9NcYqg89vG43GF/KxgdVtD1i9bcsNOvClf8LU0J6IeT3Fa8ygkewKEjXQP5cpjExBKOzGQ1AW5vUMD/Kx9VHo7TDVvV+y2nxQcS8lChQilwHZ4sjD8xHvVUSyOsuEk2zj1o2Qu/jzquUD6tFCzYofr+YgWChznkd2KavEGD9ZRxWVVspguLzgHisUrnpTqg2gFeZqepYh1P56sf/
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(396003)(136003)(366004)(376002)(41300700001)(316002)(66446008)(38100700002)(83380400001)(5660300002)(52536014)(6916009)(33656002)(2906002)(122000001)(55016003)(9686003)(53546011)(76116006)(64756008)(86362001)(66946007)(66476007)(6506007)(478600001)(66556008)(186003)(8936002)(26005)(54906003)(38070700005)(8676002)(71200400001)(7696005)(4326008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2006
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1d13bf3d-2258-4a96-dcc5-08da64bbc123
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fKluwk27bwjmU8mnHDSV8DLGXaeMwceOU6zBz3sPbegw+94ns1ugStl0loXQi6NOqMfpsHIBp+F1BWDmJFYyuYaZUibDHfUlJLF2CfyNwxpMCcTlzEK7UE7ryXqYDi0cYbn7WJGKZ+XlAGpa1Ab+JdRpmXoTov7NyX58Oh7IMYQU68yowSsyoxog+lZoL5+Qb5w2zS3j0fc9FsLIjEO6NOdPDeAI++mIIO9FMuRpUuwlnTzuHl2icikwrNYCU24Q4DAbUerfCRVXj2IN4EI73jRz+uOwehti/2Gy7/lwI5uVgRymoFhzY5tsJReCMnKaFTkkA5XkOl9F9mLZ+Xt+jAZ5a1MdS3zKKcQvC5fXvbUuAebcu7lXfzjgAxAejRMXjmp7c45Co/62/Jh8oKqj7nMR9DzDaG4CFWtnsyx0yuTHyBnuEzkfxAqVNaxBuo3LUbcA6FOhjX46PTFHj8tIbM5aedVCv3IfaApBsQQSX47pMiAOH0RLfJ1k8astr6RMOy7nlxlieVUglfv75dhDSYcD7vdqZ+ScJyu81hsESseEwjdhLvmu4lGorENylkrq1kIdvoa32L66Wteic9yumEBulyLYGz8d86KHHQWCCtuc4Yj8C7tXqZ+qIdFQ189UZfxhuicvPTToXMC7WwJE91s8e1jCzBkWAJZv4zAMjwEKHN8rX1LR5QRCEqm2xKnTugkjKSPiCnt2Tlo6eMuHeXZauCw5pi+EnxsNsE7Qi+ItH55ulTxOIlqklaKIsOxDMDiyNmA928xLUbGHNHvWel2MvYRC7d1YTCAaHf9g7GsRXvhT3JGU2HQIUO1CjVwW
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(136003)(346002)(376002)(40470700004)(46966006)(36840700001)(9686003)(82310400005)(40480700001)(336012)(6862004)(8936002)(47076005)(52536014)(33656002)(478600001)(55016003)(26005)(41300700001)(316002)(86362001)(82740400003)(83380400001)(4326008)(5660300002)(36860700001)(8676002)(70586007)(356005)(53546011)(70206006)(7696005)(40460700003)(6506007)(81166007)(54906003)(2906002)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 10:38:15.1368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9bcf23-9d7a-40e4-8b1e-08da64bbcadd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4082

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDfmnIgxMuaXpSAyMTo0MA0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUNCj4g
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBHZW9y
Z2UgRHVubGFwDQo+IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPjsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjIgNS85XSB4ZW4veDg2OiB1c2UgYXJjaF9nZXRfbWVtb3J5X21hcCB0byBnZXQNCj4gaW5m
b3JtYXRpb24gZnJvbSBFODIwIG1hcA0KPiANCj4gT24gMDguMDcuMjAyMiAxNjo1NCwgV2VpIENo
ZW4gd3JvdGU6DQo+ID4gQEAgLTgyLDMgKzgzLDI1IEBAIHVuc2lnbmVkIGludCBfX2luaXQgYXJj
aF9nZXRfZG1hX2JpdHNpemUodm9pZCkNCj4gPiAgICAgICAgICAgICAgICAgICBmbHNsKG5vZGVf
c3RhcnRfcGZuKG5vZGUpICsgbm9kZV9zcGFubmVkX3BhZ2VzKG5vZGUpIC8NCj4gNCAtIDEpDQo+
ID4gICAgICAgICAgICAgICAgICAgKyBQQUdFX1NISUZULCAzMik7DQo+ID4gIH0NCj4gPiArDQo+
ID4gKy8qDQo+ID4gKyAqIFRoaXMgZnVuY3Rpb24gcHJvdmlkZXMgdGhlIGFiaWxpdHkgZm9yIGNh
bGxlciB0byBnZXQgb25lIFJBTSBlbnRyeQ0KPiA+ICsgKiBmcm9tIGFyY2hpdGVjdHVyYWwgbWVt
b3J5IG1hcCBieSBpbmRleC4NCj4gPiArICoNCj4gPiArICogVGhpcyBmdW5jdGlvbiB3aWxsIHJl
dHVybiB6ZXJvIGlmIGl0IGNhbiByZXR1cm4gYSBwcm9wZXIgUkFNIGVudHJ5Lg0KPiA+ICsgKiBv
dGhlcndpc2UgaXQgd2lsbCByZXR1cm4gLUVOT0RFViBmb3Igb3V0IG9mIHNjb3BlIGluZGV4LCBv
ciByZXR1cm4NCj4gPiArICogLUVJTlZBTCBmb3Igbm9uLVJBTSB0eXBlIG1lbW9yeSBlbnRyeS4N
Cj4gPiArICovDQo+IA0KPiBJIHRoaW5rIHRoZSBjb21tZW50IGFsc28gd2FudHMgdG8gc3BlbGwg
b3V0IHRoYXQgdGhlIHJhbmdlIGlzDQo+IGV4Y2x1c2l2ZSBhdCB0aGUgZW5kIChhc3N1bWluZyB0
aGF0J3Mgc3VpdGFibGUgZm9yIEFybTsgZWxzZSBub3cNCj4gd291bGQgcGVyaGFwcyBiZSB0aGUg
dGltZSB0byBjaGFuZ2UgaXQpLg0KPiANCg0KRGlkIHlvdSBtZWFuIHdlIGhhdmUgdG8gbWVudGlv
biB0aGUgcmFuZ2UgaXMgW3N0YXIsIGVuZCk/DQpJZiB5ZXMsIEkgd2lsbCBhZGQgcmVsYXRlZCBj
b21tZW50LiBBbmQuLi4NCg0KPiA+ICtpbnQgX19pbml0IGFyY2hfZ2V0X21lbW9yeV9tYXAodW5z
aWduZWQgaW50IGlkeCwgcGFkZHJfdCAqc3RhcnQsDQo+IHBhZGRyX3QgKmVuZCkNCj4gPiArew0K
PiA+ICsgICAgaWYgKCBpZHggPj0gZTgyMC5ucl9tYXAgKQ0KPiA+ICsgICAgICAgIHJldHVybiAt
RU5PREVWOw0KPiANCj4gUGVyaGFwcyBiZXR0ZXIgLUVOT0VOVD8NCj4gDQoNCkFjay4NCg0KPiA+
ICsgICAgaWYgKCBlODIwLm1hcFtpZHhdLnR5cGUgIT0gRTgyMF9SQU0gKQ0KPiA+ICsgICAgICAg
IHJldHVybiAtRUlOVkFMOw0KPiANCj4gSSdtIHNvcnJ5LCB0aGlzIHNob3VsZCBoYXZlIG9jY3Vy
cmVkIHRvIG1lIGFscmVhZHkgd2hlbiBjb21tZW50aW5nIG9uDQo+IHYxOiAiZ2V0X21lbW9yeV9t
YXAiIGRvZXNuJ3QgcmVhbGx5IGZpdCB0aGlzICJSQU0gb25seSIgcmVzdHJpY3Rpb24uDQo+IE1h
eWJlIGFyY2hfZ2V0X3JhbV9yYW5nZSgpPyBPciBtYXliZSBvdGhlcnMgaGF2ZSBzb21lIGdvb2Qg
bmFtaW5nDQo+IHN1Z2dlc3Rpb24/DQoNCmFyY2hfZ2V0X3JhbV9yYW5nZSBtYWtlcyBzZW5zZSB0
byBtZS4gSSB3aWxsIHVwZGF0ZSBpbiBuZXh0IHZlcnNpb24uDQoNCj4gDQo+ID4gKyAgICAqc3Rh
cnQgPSBlODIwLm1hcFtpZHhdLmFkZHI7DQo+ID4gKyAgICAqZW5kID0gZTgyMC5tYXBbaWR4XS5h
ZGRyICsgZTgyMC5tYXBbaWR4XS5zaXplOw0KPiANCg0KLi4uSW4gdGhpcyBjYXNlLCBJIHRoaW5r
IHdlIGRvbid0IG5lZWQgdG8gYWRqdXN0IHRoaXMgbGluZSB0bzoNCiplbmQgPSBlODIwLm1hcFtp
ZHhdLmFkZHIgKyBlODIwLm1hcFtpZHhdLnNpemUgLSAxOw0KQXMgd2UgaGF2ZSBtZW50aW9uZWQg
dGhlIHJhbmdlIGlzIFtzdGFydCwgZW5kKS4NCg0KPiBOaXQ6IFdvdWxkIGJlIHNob3J0ZXIgdG8g
cmVhZCBpZiB5b3UgKHJlKXVzZWQgKnN0YXJ0Lg0KPiANCg0KQWNrLg0KDQo+IEphbg0K

