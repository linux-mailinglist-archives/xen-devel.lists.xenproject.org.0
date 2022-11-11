Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1057B625CAE
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 15:12:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442560.696830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUlc-0005xL-Eh; Fri, 11 Nov 2022 14:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442560.696830; Fri, 11 Nov 2022 14:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUlc-0005uI-BR; Fri, 11 Nov 2022 14:12:24 +0000
Received: by outflank-mailman (input) for mailman id 442560;
 Fri, 11 Nov 2022 14:12:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FoG2=3L=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1otUla-0005u6-Qx
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 14:12:22 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2071.outbound.protection.outlook.com [40.107.22.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db8b0f76-61ca-11ed-8fd2-01056ac49cbb;
 Fri, 11 Nov 2022 15:12:21 +0100 (CET)
Received: from AS9PR06CA0014.eurprd06.prod.outlook.com (2603:10a6:20b:462::8)
 by PA4PR08MB7522.eurprd08.prod.outlook.com (2603:10a6:102:26b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 14:12:19 +0000
Received: from AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:462:cafe::ac) by AS9PR06CA0014.outlook.office365.com
 (2603:10a6:20b:462::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13 via Frontend
 Transport; Fri, 11 Nov 2022 14:12:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT016.mail.protection.outlook.com (100.127.140.106) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Fri, 11 Nov 2022 14:12:19 +0000
Received: ("Tessian outbound 73ab5f36653e:v130");
 Fri, 11 Nov 2022 14:12:19 +0000
Received: from 00687880f820.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AFB41216-47A5-4B4B-92E0-345D8E8B9A18.1; 
 Fri, 11 Nov 2022 14:12:14 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 00687880f820.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Nov 2022 14:12:14 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAXPR08MB6432.eurprd08.prod.outlook.com (2603:10a6:102:154::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 14:12:12 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5813.009; Fri, 11 Nov 2022
 14:12:11 +0000
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
X-Inumbo-ID: db8b0f76-61ca-11ed-8fd2-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Qi3P9WgRnMO3ufrf4imC2nhrXLn3q/5vmrAt5fiqNQ+U2Z1w6CskmQnSgb3B5B3GFMAWgJIhV1Kn76RpB1ThXSCe6cODx3A3c/NuGzw1UtyVISaN3ZpRfVZ5zPzDbpMvjMnX9FUazmW/uXNkyjn5tra5+TAllDEOruyIkKK0e6soqx6uHqPhsHVNBWj2fS+nkjMgBvBAGOLUpaS5SyTNwtgDPuCXz0kdTuTNVjezgba+T3TZYRXqoJTc724k7pHfPe/v7rFl1oG5AJZt0xDLfmdRJwEB19i9TOB/oFW4MZcg/FMCxbr8mf2f9GSu7EgGzIdlUoAnFXVRizygHcsSBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkPoq7KHg8gvsjBSRB/PlTQJD+gulsNomEHgbBYpi+c=;
 b=Ze8K81t8qo+KerieDLDtGGuMXYtb9ejTdU9aiT9oJxIH4RrkDqDO8+dVLh22dl0YL3GO0pRW6mj81IDhtHFbEBKssjwW4WKmf8xNtNTim5m6Ob0RWPHv4l2h8YYVhCooisyUYCm+V6TPn0JzPINCkZuMhBbpDUW9yjONY+wnq98P6q+Nx9ji1s47SZLZTnNzvIuLAfjYABv19Faa57GMGvAkBMAjW7bW9HEOFPnkZMc5QEoaCheg09XpwYamrKJWRNEFY4dT2ggDa+OWvc5xcA6qqG63GSPFnVVGmz844YIHcHzj0kdK5EsTdRvIws2MtdafiBXrXl+xG0g926Jovg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkPoq7KHg8gvsjBSRB/PlTQJD+gulsNomEHgbBYpi+c=;
 b=VFBHpgWCSLeC0eXf+Pa19UB8+nNrRMuTiKiilnaJxjAGLvn01MJKxBNqp0w+hW47rHdAKuRW4z2HfCyCe0WZGaY8AA1Rzt3ubjtk3Z5eJQ8/jNoT/IBJsVGvI+elyMuOPeUIYv7WAKoCxDEZwN/hN72pE26NlaVURLk4XVNdC+Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G2yQYbDY55nzg3UXte7ZlbgImTKQlcsn8XUeFcUtf1A+z0egoXIdwkxLqtnOl/Brt6SlnMNbA6Y9+iqAAmzJs54fgSfYECNo1TgEt+iGvp1/NTKKcto7a/kMGhiyujSAl9SBVudCuUKrLFP1TXN+1P6CpP/PsEIBoZXl2p7B79oPIvUvamh968oneGjczV9dpmpFjb1ZnI4wibKQ4YpcCeowGfHGCZZyBoHFGnMjfGzqN3T21v32YoS21iM8i1L6cl73JKnkjTJsE05LHFwiYnopSjNwC4UtR3pysIDJ4+9kib2fYBnWzA7flt9yG+cUpE+CM+3+5XkfCbZWhGSeKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkPoq7KHg8gvsjBSRB/PlTQJD+gulsNomEHgbBYpi+c=;
 b=bfi1LIZT+vaVldUjW6z6rmO6ViICl+edNVXu6Ptf7IloEvgBmaXgKROmb/0tANBzL4IzqhVXZUUEIi2isrKo3R4bKq3H/wXYGW4+Pm61omdUEkSQPmqADtSDR8nytPLLpNtiNXfWpvEo2hBO93JRxxIMFnsx0ALAMgz3/gNRjsft8Kdau7f88lNbhx+VHNinHDTlzfgDatb3Q2nTmp/YvIHmNl1kSj9oHZBxdQHv1r0PalSev/IiUTG+eaYrgNrN5JzdJsVLqant8pUtPMIbgdlx6tqXCv0IgKeGtKAoEeFaascXF5M0Uwh9mpSESvsmiYxudwmqeomx4xu7rXz62Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkPoq7KHg8gvsjBSRB/PlTQJD+gulsNomEHgbBYpi+c=;
 b=VFBHpgWCSLeC0eXf+Pa19UB8+nNrRMuTiKiilnaJxjAGLvn01MJKxBNqp0w+hW47rHdAKuRW4z2HfCyCe0WZGaY8AA1Rzt3ubjtk3Z5eJQ8/jNoT/IBJsVGvI+elyMuOPeUIYv7WAKoCxDEZwN/hN72pE26NlaVURLk4XVNdC+Q=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 2/3] CHANGELOG: Add missing entries for work during the
 4.17 release
Thread-Topic: [PATCH 2/3] CHANGELOG: Add missing entries for work during the
 4.17 release
Thread-Index: AQHY9cAA3X9w+pjMxES5dLMt0fkbDa45tnoAgAABRRCAAAr5gIAAALlw
Date: Fri, 11 Nov 2022 14:12:10 +0000
Message-ID:
 <AS8PR08MB799114791187C208080415E092009@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221111112208.451449-1-Henry.Wang@arm.com>
 <20221111112208.451449-3-Henry.Wang@arm.com>
 <4482952f-86a9-d232-6cf5-afa6523012dc@suse.com>
 <AS8PR08MB799165ABD2B1FA2BFD7B48D592009@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <c7309294-40c4-bc3f-0d19-a896a0f71594@suse.com>
In-Reply-To: <c7309294-40c4-bc3f-0d19-a896a0f71594@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 13D7A72EAF19EB46B612DE800F5FED68.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAXPR08MB6432:EE_|AM7EUR03FT016:EE_|PA4PR08MB7522:EE_
X-MS-Office365-Filtering-Correlation-Id: 832b83e0-52ac-42bc-c73f-08dac3eebe99
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eQ7l5N79b/LUnX4qBwdywk5ZHJUitxR1r5pr+Omq4mTNDeHB1CCCnlsCMJNQtD1UQLdkcRjkWrIbeA+h0KsJpgQLHHWVYazHxTlFbGTBxEU7bDq7kcwSpoX4zTQOfA6ES8EM9SfKcHUIEtsxpRCJhC7aKMer6BVkThjpXhwW04SHmXPzVDpnRo6eVWbvVRpuvSnAOiZVBft5Ef5F2HU72E5U87heEO0r28Y2xDNeELvpyzyAhkRUuSntNb5lJxR2DiaxXQ4wWdMZG1b0h11SE5MxPVcgRIThZ5Qpn17Wcom3EJpp8GV7fMNLQlreDWx3YD8dUQXpktT4hpEoRPTENn3Ky59c3EdS/ihZgsrZMovJ/2sVWc+5ZpeSDS9Hd878y0+oITKPhyhpcIFNPZsaU7AAVhfuaNvr4VjbhYBTzpI7FyMnEwhh4QcdJYwucnlBOzviFZH5yJwHCQHMl0Q9x7P5YlKkyEuYGKKNhJO+ER2H9fChjojBV87mWFQzf3gbyVwOpRcAELmhYqgEOG+4L9GsR51n9i/IptwLqfG3H+zfcQJwvBd1S5o+JW7PW3/LIRCbnCSoFqcj1JmsY/ovJhKGtgGd9woe0YCppP6M+JYutiOw5fmuSZL72nR5wY9hvIvBJDUQMZgnPedEHMI9EuEz1ZW8z7A8vqKrj61SryQ2xHBs58nPTttB75MB+++SVbxLczgEAwxpLYI+Ww4QvjJ4o0gnbEoR8qAvZX6Og8Y7fxQZI1WcwNU+T6uZm0YWqJQIczGAMxhC+tfx4IQMUnqF6PNZVmTVySUe5qqjJgNQ5Ut15e05hhxNfzM/KtQghKMnLljGZIxb0kfos+b3PUGonMhuldE6SDRDkygZccTSFK5Tumb+InIoLOuBeHtCouXv5vvR9sY9J5G8iJnfii242A4MNWAUI7Xs5FVC5AE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199015)(33656002)(38070700005)(86362001)(83380400001)(55016003)(2906002)(5660300002)(9686003)(53546011)(26005)(7696005)(6506007)(122000001)(186003)(38100700002)(76116006)(6916009)(71200400001)(966005)(66446008)(316002)(66476007)(4326008)(8676002)(64756008)(66946007)(66556008)(8936002)(478600001)(52536014)(41300700001)(59356011)(207903002)(219803003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6432
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0b34389c-2e0d-4f04-9a89-08dac3eeb9a1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FErqWrn9awvs0zeN5/t02xuRhVCOg/cMDbvCDVWpgG1MeOrEkhcdYWyc5IVhBZSMv4sYYkrUWZOCtffVU2TZhqlYo45LJuRuyHqpLVEY6dmg1fMMWFTSC77U2OGaA7m0jktJBSxq7oLsgNZr63tzktL4ocKiSPNmCY5uZIspFvhrihlDZ5EJ0vInUVzmVzsh5aumNtB5EslMrxk1sYvq1qhSgkm4aI2c0kikzca7MDg4jjVuN6kMw5zgc3GAWqB0j+pG/o3Yv1/yYJ/fC83CnUVEwEzyidwwXK38YV+RXOGc6fjR7gB7ASzhHAG8ADjQ/9pyDBnw+bqUXJFRFYySEPuDAL/1dMq4SjOE1O48STruSzch0yh0T2Cm5OLP6HEEzNPaiGgoxULspORIs/HDxKETnp7gB02Z8ftsazF1GJa3laDgoG1+m6eu38zjsMfAXKt1xLK2Qmoy6U3CpI46QPHTmsO3lLkJ9goENjaj8ma+Zk/LZy0XPFVe6cAgKPGdMb6DtBVrPmFiRyXfI2ltnwRdSaEbqS6ebbMKGz4pc3fRZEuEKUbI/vGaO5soYTBAjypUzsgsT2mlhDP5RehbZsnlaUupLJAxnCAEb4x0hesfeNSZHpvPjKYB6OpIt8kzVYcgDiBLe9RGU2umfGloV866zqldQvSJINp6zi4UJK2FzGj7/84ZRTRzDZzJJMovfitN7EAg5ockM8vlWlNCQW/Eqk/s7uJHAvA2nrNldKvJwDa7PZXC+NPFIJFQEHFLaL16Xp3XVu0ZFQEUZXC7JIbz8daRk7O+2m1gEZfs6MD92ftP80rfvbndN9gT65hCvTx+ZwMblMq5nwnDO4JP3sMvmOnfFTY+oieDpRxqbjoLqs38FlXoCdXFJT8vywxd
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199015)(46966006)(36840700001)(40470700004)(8936002)(6862004)(86362001)(5660300002)(2906002)(26005)(9686003)(83380400001)(7696005)(6506007)(478600001)(33656002)(53546011)(356005)(81166007)(966005)(55016003)(316002)(40480700001)(82740400003)(41300700001)(82310400005)(52536014)(186003)(40460700003)(70586007)(70206006)(8676002)(4326008)(36860700001)(336012)(47076005)(59356011)(207903002)(219803003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 14:12:19.3103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 832b83e0-52ac-42bc-c73f-08dac3eebe99
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7522

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IE9uIDExLjExLjIwMjIg
MTQ6NTgsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+ID4gQW5vdGhlciBxdWVzdGlvbiBmb3IgYWRkaW5n
IGFub3RoZXIgZW50cnkgZm9yIHg4NiB0aGF0IHdvcnRoIHRvDQo+ID4gYnJhZyBhYm91dCBhIGxp
dHRsZSBiaXQ6IEkgZGlkIGFub3RoZXIgZGlnIGludG8gcGF0Y2h3b3JrIGFuZCBmb3VuZCB0aGF0
DQo+ID4gdGhpcyBbMV0gbWlnaHQgYmUgYSBnb29kIGNhbmRpZGF0ZS4gSUlVQyBfX3JvX2FmdGVy
X2luaXQgaXMgYSBnb29kDQo+ID4gZmVhdHVyZSB0aGF0IGJvdGggeDg2IGFuZCBBcm0gaGF2ZSBs
ZXZlcmFnZWQgaW4gZGlmZmVyZW50IGxldmVsIHRvZGF5LA0KPiA+IHNvIHByb2JhYmx5IHRoZSBf
X3JvX2FmdGVyX2luaXQgbWlnaHQgd29ydGggYW4gZW50cnkgaW4gQ0hBTkdFTE9HLg0KPiA+DQo+
ID4gSG93ZXZlciBJIHNhdyB5b3VyIGNvbW1lbnRzIGluIFsxXSBzbyBJIGFtIG5vdCByZWFsbHkg
c3VyZSBpZiB5b3UgYXJlDQo+ID4gaGFwcHkgd2l0aCB0aGF0LCBtYXliZSB3ZSBuZWVkIHRvIGNo
YW5nZSB0aGUgd29yZGluZyBhIGxpdHRsZSBiaXQgdG8NCj4gPiByZW1vdmUgeW91ciBjb25jZXJu
PyBXb3VsZCB5b3UgbWluZCBzaGFyaW5nIHNvbWUgdGhvdWdodHM/DQo+IA0KPiBNeSB2aWV3IGhh
c24ndCBjaGFuZ2VkLCBidXQgaWYgQW5kcmV3IGFuZCBSb2dlciB0aGluayB0aGlzIHNob3VsZCBi
ZQ0KPiBtZW50aW9uZWQsDQo+IHRoZW4gSSdtIG5vdCBnb2luZyB0byBzdGFuZCBpbiB0aGUgd2F5
Lg0KDQpUaGFua3MgZm9yIHRoZSBjb25maXJtYXRpb24uIEkgd2lsbCB3YWl0IGZvciBSb2dlcidz
IGJhY2sgb24gbmV4dCBNb25kYXkNCnRoZW4uDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4g
DQo+IEphbg0KPiANCj4gPiBbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0
L3hlbi0NCj4gZGV2ZWwvcGF0Y2gvMjAyMjAzMDkxMjM5MzYuMTY5OTEtMy1hbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tLw0KPiA+DQo+ID4gS2luZCByZWdhcmRzLA0KPiA+IEhlbnJ5DQo+ID4+DQo+
ID4+IEphbg0KDQo=

