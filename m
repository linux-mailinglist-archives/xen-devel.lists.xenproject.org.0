Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 465BC5927DF
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 04:49:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386981.623027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNQAX-0004RU-TA; Mon, 15 Aug 2022 02:49:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386981.623027; Mon, 15 Aug 2022 02:49:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNQAX-0004Ph-Q2; Mon, 15 Aug 2022 02:49:33 +0000
Received: by outflank-mailman (input) for mailman id 386981;
 Mon, 15 Aug 2022 02:49:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zthq=YT=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oNQAW-0004Kr-1i
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 02:49:32 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130055.outbound.protection.outlook.com [40.107.13.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2f7c8f5-1c44-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 04:49:31 +0200 (CEST)
Received: from AS9PR06CA0625.eurprd06.prod.outlook.com (2603:10a6:20b:46e::16)
 by PAWPR08MB8814.eurprd08.prod.outlook.com (2603:10a6:102:336::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Mon, 15 Aug
 2022 02:49:28 +0000
Received: from AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46e:cafe::bf) by AS9PR06CA0625.outlook.office365.com
 (2603:10a6:20b:46e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.15 via Frontend
 Transport; Mon, 15 Aug 2022 02:49:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT032.mail.protection.outlook.com (100.127.140.65) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Mon, 15 Aug 2022 02:49:28 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Mon, 15 Aug 2022 02:49:27 +0000
Received: from 6452bc503223.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 42BB0613-D5B6-4BFF-A5E7-9B397026868D.1; 
 Mon, 15 Aug 2022 02:49:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6452bc503223.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Aug 2022 02:49:18 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM9PR08MB6276.eurprd08.prod.outlook.com (2603:10a6:20b:2d4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 02:49:16 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::5d27:806b:5d1f:f63]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::5d27:806b:5d1f:f63%2]) with mapi id 15.20.5504.027; Mon, 15 Aug 2022
 02:49:16 +0000
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
X-Inumbo-ID: e2f7c8f5-1c44-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=LUaDrIO/dyIk6WWJJUFRy9MKHyqEUozJZ7JheuOIHs1CQNNIC86PNdcNAVo+v7pzcLurpvaDktnv4n4ut7OPtXh5qy3MnxIOeGp1QfgOXvHLRQtwkvCEWAKQbQqdopHYXU67AY35c8dwYzHTDrwPdKkdg+G5RIeLXkVInop30HUXHtKehUJ41sCa5J7llu7MpgiC5N+Hf6cpz3EEB4yahq+xUZjmj8QF2CZisr5H9O+C+9mutmMpUHHE5d2+KnAUmK8GmWoo2XXwFnF9AMCVrYk7UsI14vJeItt777Y6PemtemL7IUK7g6+UjAFjK7m1Y+H2J6ETPo3vcaDKJv4/5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7DuWh67kuoUKWxqk/J0OxdcWqcM4IlrZEY4w+5ukxQE=;
 b=Fdl0ykFq+iETDIHW+iybtrh63CHbect1FfpY+aZjrvSzFm69ZH8QUz88LuCVcdUrphttR//PGmJIjGIQK/afL+KPfeSkQcpnCs9mS2lqBwouWMndhn5Jr124alG2N4ud4bO39WPKHOYp+7gCI9HQ3ht8Ot9Pg0v8FVHp78/u8Bqoby7DZ791o+w+GrhLubhTZbzUajZhKaXPHUFWgpqKqSC3OrBnUm8HBNAPmwqvOU/LAoJsrjg2ULq5p3RHKfbn0LVL2dY9uLUAadtPX+5ymrpUzBcK+g4/1dcocX9D/xM8Leb2s4WO4J6oeKchzEfVtMRViesZkzxKuZvzlbG09w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7DuWh67kuoUKWxqk/J0OxdcWqcM4IlrZEY4w+5ukxQE=;
 b=1qSbY2Sy22TOEQdjIA2k7yIFeG1YbyzVXwd6ahmoRxqcaywGp4WUF3kEEqmzyiTP1A3sQwEkVDxzGOb+YUGoW+XcdHD/P/tpSSq20UiHolcxzo8/u9r801wQUuMYxaBwAS0FXnTGjyZ5YEm9bzR+bMrHxz2HEpn0aj8UyQDU8e4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiuBkLyRUl8tvlFpfPkJLdmCtqvZRDNvKFGVx+iyqacK7LS3TRzNumh0QceY9Prmi8cUoDryj83yzLo1g9BOJZ71cEeqcaUZ+UX181WkFOBspcH7fqyRQ8S5hkt10/pb2KNA0SLgvP58xJN80lLq2WGHPwYiWltvStI937vgHfYVvrhenFYjCBqucyVYdDp8C//7jlghan6QB6TW8OSUOv/k63elf94w66VYLnUVRhf+RWp4tNayQ32TgsP6dAIdXa0AGBfKuwLqMfvYTJsBnbYhp1ljHVBmcwOvqXuW1WMK63PKWrrH89UR5jR47WZL9ezTNM5xkvhJV9o9dioJwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7DuWh67kuoUKWxqk/J0OxdcWqcM4IlrZEY4w+5ukxQE=;
 b=DIvhWkXgTYo/79JxZzWXAwdYhStpO4b0jjlhETvfodBdsBh+3pGhhhThwrvQLH2BXFfUMGKF9wFnHsLtrOH8rW6a2PU3TPMDt0nw8rlJr7jLAVIcMGawTIGNNUTAL+Xegi93yLVVp/kr1C5FNMVtPmAFo8rSfn5TjNJjkiOfV549fyVbZmb/aI7i9Ak9wPMk6WskQGE+NrVPITYKuTnZL/dEaHR/e2k7f8G+sQLnMoYUFzQB5gPIq8ilT1WeHynx6+O5AL/n6ap75MuNIgW80PSjuk7qvb/CJEPyp0Chz/B5mCZ27xyDPa49DHjogzMpI+AuL9cvugeyPE2QaDlxUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7DuWh67kuoUKWxqk/J0OxdcWqcM4IlrZEY4w+5ukxQE=;
 b=1qSbY2Sy22TOEQdjIA2k7yIFeG1YbyzVXwd6ahmoRxqcaywGp4WUF3kEEqmzyiTP1A3sQwEkVDxzGOb+YUGoW+XcdHD/P/tpSSq20UiHolcxzo8/u9r801wQUuMYxaBwAS0FXnTGjyZ5YEm9bzR+bMrHxz2HEpn0aj8UyQDU8e4=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall
	<jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH] xen/arm: Add xen/arch/arm/efi/stub.c in .gitignore
Thread-Topic: [PATCH] xen/arm: Add xen/arch/arm/efi/stub.c in .gitignore
Thread-Index: AQHYroB9HuUD5/U/xEGQNBL00OqCXa2vRWUw
Date: Mon, 15 Aug 2022 02:49:16 +0000
Message-ID:
 <PAXPR08MB742018A3D44FF6521A0017D89E689@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220812191930.34494-1-julien@xen.org>
In-Reply-To: <20220812191930.34494-1-julien@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 720AF01C6B13664985B856779ABE2782.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2223247d-8ad5-4e7b-0698-08da7e68c583
x-ms-traffictypediagnostic:
	AM9PR08MB6276:EE_|AM7EUR03FT032:EE_|PAWPR08MB8814:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uqaSf6eS8T0gAbTIRlJefaG0uPMk0Jnkh0HcDm07WIRCNJZ7Pr6ZZMxOh60kK3HcrkvJmlhpWaX9/HujTOleUF7G9+jm1jDCfa8Lh+cYXGKELHugt0G/7XOMozevLQsBdMFFMHX5chBLahhdo47WI4AXLt+7AtHwH7/fHmoTtjUh4A0UHtePU53R0vOn2zoVocUr2I9YXMKZHe/697WfgOWofjS1HFyzd9EeSTlowkNrqMZzKmWQkTb6aMr/LhhM3RetybS/BMoynFH1PokKHONSGDfblytfz8iLN9htD7bwZmgcd3gZfK+dwxak+KBeDDPBdPnxyCed/dYabjg7I0hcF0fGBlasUbD4rzWXFqXySgEB7oifuN/+KHPVnXgLBwCa/ToEJy8KcRYf/UcVIDWx1D9g96qVesA8FNs1g6Sgfk9Hq+rKHm96I5p/vIqREpu8jvEzlVMHdGPISBAfh/Elfy4xeszefm0fSYqPLG1PE0O5g8sOp+eOerngQWbsbYo9TCR87nuVMMo2NogGROVpLX4sNkfwmmp8yvS3BKR2IhlNNs7FjmANuJmLwTyP2BOXXANAirQp/uHAs/GHc2gkrPBJi/xoENqO7TD4uE7/OwqW9MsWUrKrRonQo7cUoddOmBCqztej5XPp+xpy2+pQq5iTGpG7ce3R+PnmdO4ftCGbnj4pdpurDZf+rZQ8EL7jBoXC1L8/+aVj+8JoUYniiYzo+ruZwWgeKENbJFj5ymqJTtxD3WxCRVsNByLW/NPDNMHnFC4U0sXZd4DWiQONGO9jpdqLNuZKgbQbLb0oRB1eDYVVoXmgpULIBCIaI/I2xFo9yYCQ4U/O7+41Vw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(41300700001)(71200400001)(316002)(54906003)(478600001)(26005)(38100700002)(4326008)(110136005)(64756008)(5660300002)(66946007)(8676002)(8936002)(66446008)(76116006)(66556008)(66476007)(52536014)(2906002)(38070700005)(53546011)(122000001)(186003)(86362001)(6506007)(33656002)(83380400001)(9686003)(7696005)(55016003)(142923001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
 =?gb2312?B?emdYci9pdUZzcGxFbmF4UHFFdmtKMDY5WHhzMGRGQVozdGlkdmpMZFRRbDJG?=
 =?gb2312?B?bUhyekxzc1kvZkdZVmhBTjIwZWhvT2lRcG1SallJekJadE5WOWwzck1pK2Vk?=
 =?gb2312?B?a0t6WUNzSEMwUmVjS1l1MmRUVCtVanIvUW9YbjZ3MHBpK1lSM3BlOXprQUpL?=
 =?gb2312?B?OVdUVnZKeWVtYXhnZUtnNVlnVWhjU0plNUpkUnVXVEsyRE1TVDN5YWN1bFFB?=
 =?gb2312?B?cERHTFZNc3pnSkFhY1R0ZHg5cTI4TitqV0Q2TFdZN3ZaUWY3KzBHYWFIdG5Z?=
 =?gb2312?B?enBSMklMbEhTdUJ1emh0VTNqNFVqd1FXWll3bzhiUG4zeCt1M0pBbWNpY2tO?=
 =?gb2312?B?aTZ6YVVpM1hGZnFEeGxobnBVZEk4TXQ3bGowNVZqY1E3SG1MbUJ2aVNIUEp2?=
 =?gb2312?B?K2RaTWNLOEhES0tDR3YvN1NXNytzeXpNZ0JYVlJHS1FaOGowOFBaT0NFalR5?=
 =?gb2312?B?RkcxUFdyRlBqZVJYS1VGdTFYb0Q3TFRXTzBwSGNVSGNMZGpJYStJVUpBRk9q?=
 =?gb2312?B?VWE0QW0xbDBOMG92THpGVGFCMlNtODhzMUtGczBGbXcrTFpPL1B3K1c0WGxo?=
 =?gb2312?B?V2xBZzNCYlNQNEQ5bzRGRk1OS1Z1L2J2S2xxb2xlMVpxK2ZpTzYwWDZPamMy?=
 =?gb2312?B?OTlpWWtIUFNZUUhRcllJWGhDeThiV2s4cEYwYU91L21EeVZrT3hMQVJPemtt?=
 =?gb2312?B?Qmo0WDNCYjA5a1Fvb1RZVkx6VFU5K2dlUlk3Mk92YWh3NHg5cDFBNnRJZlhu?=
 =?gb2312?B?Q1RKT2tCZy9od0tETW95YmN4c3hMNmtUZFIvWnk5NVBVRDdqZHArcVZxVlIz?=
 =?gb2312?B?amxEdjhsQVY4R3BuRHFkUkxhMGJrRE1wbUtQb21saFFxV3hOenFmYXRDNmdT?=
 =?gb2312?B?M1pYb2kxckFLOFloL1psTnloRDhINXMwM0VxZEFLbDVDdkVmclkvdVZ6VS9M?=
 =?gb2312?B?NWpDdXRDaEh2cEM4L2RpeUJqMDJ4ckdWczVqb2k4Y3BRakxnbVhlVkl0eDJP?=
 =?gb2312?B?MEpaelVqZFFabWlobzh1VkdIb1EwZFB2REh0MVFhNXkzY3pobldEbFE3dnRR?=
 =?gb2312?B?V29VSDRzVXAyeFVLWElITythOVAvbitHL09aR2FuN2xPSGJaeXV1aWc2Szhz?=
 =?gb2312?B?bHVqditBQ1ZUMlBLSW1hb0p5aE8yTWxGYnk2SzJkSy9tZGZKNGk1NlVTdkY1?=
 =?gb2312?B?OVJaWTIyaTgzUmJuZEM3blNDUEpHNW9seVpNQUdVUDQ1Sk9uY2pjM05LdXBr?=
 =?gb2312?B?TVlqaGFqdDY5Y1dNRTBoYUIyOFNHZjRnVTA4S0h4bnRUUzRrNlBvNFNWVWhT?=
 =?gb2312?B?OCsyTDdFeFZOWmFsWDM5dTFJYS9iQ0g2eFlNekZ5NWs1TVczaGlaZEhmVXVD?=
 =?gb2312?B?UEt2WEljYkVKUWFoVnZCUTJ4aVJ6VFJZb1BBM2p0aWE0Z1pOTW9uUFk4RFNw?=
 =?gb2312?B?NmtRODJ1QTNQTG5PaFlvZy9YbmozeDd6NlEvaWRRPT0=?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6276
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	87708545-ea98-434b-b8f6-08da7e68be56
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0SIRvHPgOJ53ny2bgoaeD2nFKWyGjloW3smmy1g96EaQfsoFd5sDXborBoMBozkiv2JO7IB6zW80VJj/ev1vKiiL5tuA2MvyGX0+5zzo9JFdvx95ws8+niDb7oa/kv1jEQjct6ciJy8c9oj1CHa2EKydN4GrKxHg/cfkOgsz83jiBBdgG13faJ6lkkqxBH98StKqcVil0zuFXZfakuKeuov9KMWPGZSaHpSoNo6lMzmYMLb3ui9cy/7NuLPPoYWFj8Lc2pEUC8Kt2Vjif61hZXrknWa78Iz5umLvRMWI/7h01aapQQ+0/Tk31rrQ9U1fmKjWRIuRCFnt/E4cLbXAJUEuPn1fg+959alfMA4MMIWHtFu2KEUK3vVriNomnvSv1iYF9UkiT/WPDKsGK7XWM41Chjf+sMFOKYue/uGJCreYRib/9z89dIsGHaJsbakhGrUhnDazwAEAxqxePlWO+KFuc7Lm1oZmEIQYxLQPrYjq7UGeCZCuaZ0ZYYkp+qHmNiPqFSXBsFHy6pYkccyjbTnuGM/jGlOgVtNQh5r+wurS9ALBHwi7yM1veHylYIGPnIQYc5GePEThTzo/+n5QAku/JbUpIdWtrVFiWwkJoBf9xE90m3Cm4Q1fbk5Bgoy7hs7d+M6AowSzpLgDMjrW1oBlGQy7XWz/lDdH4/kXwqNpUqKLsKOkcZxSXor0ncQO6TguDmKnQ7LuzFgJSHV1z7XMi49fbrmUW/A00s6+zkJoPblZcEm0T+nnXPfJlODaqxDDOohg112XVvxJ5XsOQr86v0DY1tXFfwBKI1sThjKvlcokFSV8ezsic2ugvST7
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(136003)(346002)(46966006)(36840700001)(53546011)(82310400005)(478600001)(36860700001)(40480700001)(9686003)(4326008)(7696005)(2906002)(33656002)(8676002)(186003)(26005)(6506007)(55016003)(47076005)(336012)(110136005)(54906003)(86362001)(83380400001)(316002)(70206006)(8936002)(41300700001)(81166007)(70586007)(356005)(52536014)(5660300002)(82740400003)(142923001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 02:49:28.1274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2223247d-8ad5-4e7b-0698-08da7e68c583
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8814

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjLE6jjUwjEzyNUgMzoyMA0KPiBU
bzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBXZWkgQ2hlbiA8V2VpLkNo
ZW5AYXJtLmNvbT47IEJlcnRyYW5kIE1hcnF1aXMNCj4gPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNv
bT47IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+OyBBbmRyZXcNCj4gQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgR2VvcmdlIER1bmxhcA0KPiA8Z2VvcmdlLmR1bmxh
cEBjaXRyaXguY29tPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgSnVsaWVuIEdy
YWxsDQo+IDxqdWxpZW5AeGVuLm9yZz47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz47IFdlaSBMaXUNCj4gPHdsQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFtQQVRDSF0g
eGVuL2FybTogQWRkIHhlbi9hcmNoL2FybS9lZmkvc3R1Yi5jIGluIC5naXRpZ25vcmUNCj4gDQo+
IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+IA0KPiBYZW4gYnVpbGQg
c3lzdGVtIHRoZSBzeW1ib2xpYyBsaW5rIHhlbi9hcmNoL2FybS9lZmkvc3R1Yi5jLiBTbyB3ZSB3
YW50DQo+IHRvIGlnbm9yZSBpdC4NCj4gDQo+IEZpeGVzOiA3Zjk2ODU5YjBkMDAgKCJ4ZW46IHJl
dXNlIHg4NiBFRkkgc3R1YiBmdW5jdGlvbnMgZm9yIEFybSIpDQo+IFNpZ25lZC1vZmYtYnk6IEp1
bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+IC0tLQ0KPiAgLmdpdGlnbm9yZSB8IDEg
Kw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
LmdpdGlnbm9yZSBiLy5naXRpZ25vcmUNCj4gaW5kZXggZWQ3YmQ4YmRjNzZjLi4wZDUzZWIzMDQ5
OTMgMTAwNjQ0DQo+IC0tLSBhLy5naXRpZ25vcmUNCj4gKysrIGIvLmdpdGlnbm9yZQ0KPiBAQCAt
Mjk1LDYgKzI5NSw3IEBAIHhlbi8uY29uZmlnDQo+ICB4ZW4vLmNvbmZpZy5vbGQNCj4gIHhlbi8u
eGVuLmVsZjMyDQo+ICB4ZW4vU3lzdGVtLm1hcA0KPiAreGVuL2FyY2gvYXJtL2VmaS9zdHViLmMN
Cj4gIHhlbi9hcmNoL3g4Ni9ib290L21rZWxmMzINCj4gIHhlbi9hcmNoL3g4Ni9ib290L2NtZGxp
bmUuUw0KPiAgeGVuL2FyY2gveDg2L2Jvb3QvcmVsb2MuUw0KPiAtLQ0KPiAyLjM3LjENCg0KVGhh
bmtzIGZvciBmaXhpbmcgaXQuDQoNClJldmlld2VkLWJ5OiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJt
LmNvbT4NCg0KQ2hlZXJzLA0KV2VpIENoZW4NCg0K

