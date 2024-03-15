Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E279687CA51
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 10:00:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693700.1082081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl3Pp-0001w6-SV; Fri, 15 Mar 2024 08:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693700.1082081; Fri, 15 Mar 2024 08:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl3Pp-0001st-PC; Fri, 15 Mar 2024 08:59:49 +0000
Received: by outflank-mailman (input) for mailman id 693700;
 Fri, 15 Mar 2024 08:59:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WwtW=KV=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rl3Po-0001sn-Ux
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 08:59:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5df29f3a-e2aa-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 09:59:46 +0100 (CET)
Received: from DU2PR04CA0019.eurprd04.prod.outlook.com (2603:10a6:10:3b::24)
 by AS2PR08MB8877.eurprd08.prod.outlook.com (2603:10a6:20b:5e6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.22; Fri, 15 Mar
 2024 08:59:40 +0000
Received: from DB5PEPF00014B9D.eurprd02.prod.outlook.com
 (2603:10a6:10:3b:cafe::d1) by DU2PR04CA0019.outlook.office365.com
 (2603:10a6:10:3b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36 via Frontend
 Transport; Fri, 15 Mar 2024 08:59:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B9D.mail.protection.outlook.com (10.167.8.164) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.12 via Frontend Transport; Fri, 15 Mar 2024 08:59:38 +0000
Received: ("Tessian outbound 5fdc1e2b2c35:v276");
 Fri, 15 Mar 2024 08:59:38 +0000
Received: from 7deb1d671cd3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2425F618-8A6A-4AD7-A19A-42EB3282DFA7.1; 
 Fri, 15 Mar 2024 08:59:30 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7deb1d671cd3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Mar 2024 08:59:30 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS4PR08MB7501.eurprd08.prod.outlook.com (2603:10a6:20b:4e5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.22; Fri, 15 Mar
 2024 08:59:28 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::13e4:dd98:2513:db0]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::13e4:dd98:2513:db0%7]) with mapi id 15.20.7386.020; Fri, 15 Mar 2024
 08:59:28 +0000
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
X-Inumbo-ID: 5df29f3a-e2aa-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=d0kREhPWVPGfSCqfE1Td8fIbgzylO0YH7FE7tTLBJgz0p5d0RU7fdoNJOgq2vgFbQKkA/YZYSgq3TBWqCK2s2R2HU7fhuArMkGnEz+cuMSW3X/cSd3FrtKk5i/XvmuEMCEcl9VdQrNrOT93vK+va9VHF9ZQ26ERYxxTC1vIG10wp5gHV7nHFYmC4iR9g0A4YnD1gqzxu+mFeE/hYzLlq1O7az9un7Lvr3gPBsfWBLAJSIKFPlXVznX6+AYqdcA9b1URP4Rn6VM3XDYrPaWIbenYAhIasImOaSMQ7+OglIwmSlHNIQwzzxHDiwW0rKKsKfIVAeh9pIMZAjtpyiIWMlA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4KqKIOk8g0hOmD/GWMr8JzUf1mB1Zm/zKmK/5XsM+k=;
 b=CzOSrPRN5jv4O7+uwoJ1w7Iz6aIW/lqMZgr47OrfJ67aX86qNOBeHde35+J6riUgV+mK494OJ4l3g2R0+CT8Qe7kTRGSt3GwLtnwG0Vo53MvC7h0bBvUy7icGDByTERuzf3KzuTzLuudlgbyEF7hKv5EKDyc8DLqBVCcZ5pnjc3joHe//aJPCGDDUtdiHf3VekV7S+LanLpj6246goO5+gyh+fQ9XQSUO/qcu85OFVA9Jx8hLrkgCABsM0L//iUJ47uQ0FhGEZIKDDm1hLJ29p4O0WngO16IV3p9M2k1qoNgGb0pPJZB8Jutc3tyFcgs5imIUfz9bEwApnaCHvgZcw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4KqKIOk8g0hOmD/GWMr8JzUf1mB1Zm/zKmK/5XsM+k=;
 b=YdE46lpC9eXgoUbvDl0KdYd9VzWLJGwq74Fil/xbaotz5z3sKvghQmgsvbXlGT+j2LzvdzBOGlAv/G7UGoGvG2/VwAT9Hgi4o95SSKAAbLtYe6CJcODoZ72WRiBuGUVQE1GoGWr4WMEUbFe8lriQ5N3m8gBU66kxo3pBixvcuOk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 312b1157eb7869de
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmFdA13nsOD3Km4s6jat+Je7zdRzO0W45YN0AyQoJMX+Kl1zIKZn63LxxItURQYPggDwkgBIn2sY08pETpQ+TPRqjyBej1sWGylL9s//MkXcTMdxglrnnYutdF9zUYEg+gSPF84uIR59UgfoJGXENiWX9zo7PG5mpZ4qOIMX1NiR7PEYQX3VyoW6mtlerCjx3Kvqx2bFULAYjlx3B7Q32JaBh9dSOo6eh/wZQDG0Yyu+9g5PAco5ockXqbTadItWpdCOOePpFg3jyhkv9fqPmHXXK0Vbp26DTZ9+FzxjViOPe5GkIXte5NjvO9tOXYZCJiJgoVyimenOJVIe/xorPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4KqKIOk8g0hOmD/GWMr8JzUf1mB1Zm/zKmK/5XsM+k=;
 b=OYjE7wK4NemkGKaAC30ih4G8bATHXAW1LjK4hTMug0tFYcbkY8a9LNYfeTVEWzATmdKOC6vdVQFTnJwpWJML66X6gSKEryn3upsOD4+sg11MMhSDcf9tcP09eBbR9SyZVdGNTNQuKVurIT/PQqCKnfDFUWJMQhzPcAwVpZlSabmcXti75AdkShzUMbOtfb//DigHpx/8Kb1Zfhps9c9R4+eHQ+A5wgoc5lmYMjpmBiKYDM/GZ+1a4fi3SAd4i5UeKzSfmccH8mVHFTc4CyuCsZb+97qzPOU5mVbHDN0rDsBO2liDwxB/Hpm3JtvkUiPA6uaqTnzVC2yzwk/IJdF7eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4KqKIOk8g0hOmD/GWMr8JzUf1mB1Zm/zKmK/5XsM+k=;
 b=YdE46lpC9eXgoUbvDl0KdYd9VzWLJGwq74Fil/xbaotz5z3sKvghQmgsvbXlGT+j2LzvdzBOGlAv/G7UGoGvG2/VwAT9Hgi4o95SSKAAbLtYe6CJcODoZ72WRiBuGUVQE1GoGWr4WMEUbFe8lriQ5N3m8gBU66kxo3pBixvcuOk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"tpearson@raptorengineering.com" <tpearson@raptorengineering.com>, Jan
 Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3 4/9] xen/ppc: Update setup.h with required definitions
 for bootfdt
Thread-Topic: [PATCH v3 4/9] xen/ppc: Update setup.h with required definitions
 for bootfdt
Thread-Index: AQHadl1F8erabWW43UiNIhzv59WNJbE4gWUA
Date: Fri, 15 Mar 2024 08:59:28 +0000
Message-ID: <21CE733E-0F62-41D1-9F9F-805AFA94DB01@arm.com>
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
 <2c14419bd9fbd5307fe4d5b079a9927e4d3ec9fc.1710443965.git.sanastasio@raptorengineering.com>
In-Reply-To:
 <2c14419bd9fbd5307fe4d5b079a9927e4d3ec9fc.1710443965.git.sanastasio@raptorengineering.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS4PR08MB7501:EE_|DB5PEPF00014B9D:EE_|AS2PR08MB8877:EE_
X-MS-Office365-Filtering-Correlation-Id: d49681de-2191-47c8-21ab-08dc44ce3ee6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MHimX+IHg7+J7qjIM0WyPKpHNjDfhOVcOsyXQ7OvHzAE4SA2N4uDTtJ6eQoUdpfXokS/uGR/0YlDtr8gbcw5CbgIFJfrj4EQpDfaIpDeOVaeJl5WNvBGEeVxmkJqdzkk26DROj1iF2rBahTkSEB8XqFL0jqe75E+FC1Uwc4rdxl3t4e26TpHEOolZ/jQGGfo4OI5HfDEVdnLd88BWw2Tyd7dONO+hDrJJWUdkS3bOvNquYgUxv3i5VWgSnDt0Sqot4pi9+JErTn8iFtnlh8WDBxmEfb9ndtxgTnRNzRtUuQTIsw00cZ4bjKRpo976CcraCRhcvndp3kbhpgGvhpHVsoHx25/rutNA/9ACNoZCCjHzwUkq9OLeByqcp8pv9O8CLgs3Fa0Qqk53ZFPiFT4mOa+jBaG4Wxp5pKeoDBoOvbellEQGxm1h3ioc6gLyEGDedQIkURyUXfcht2mPFJF79LN4fuH+W/UTouohyUZTSAx4uQPUc/RLVAgiKY8tL1o6pXScX5EP+LUwcuEKJ6BEtVFJr53zTjFS33RM5kcolb6znN2ffsWa6VWEa1EZwff5ugd4TMXIGxoTKcG/vXkK8srttlq6jqDItOtXa8R7u+gY9RxllPted/9eQZtXmGKf7mFXJsb0ht2eyOrn69rSysAVOK6DbtLDsyV75WpBdRMmu2H/fiN/2VvdqYVPfKf3rW8B3IY0LCPRe0ycZQVyS6jBRKkakV9xfcwUOtcBrA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC0405D6A1FDA14CA7A6021337F224BE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7501
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2216249d-8c20-4862-9d3f-08dc44ce38da
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NCX07U3LCglf44o0iyn/GjJvWYjmusrEOfWZw8lmnkH/b8F7gQKl6FWo5jCwdDR/7l03U+IOZMtxCA4itcaIG3rcYc7blRm4fP0o0uH5KekXrQH+f5cGZif6rubgIAGaXDKDZOXVrHjmETml+33RYjWCfsNA8nurt8QeI2AnU4wtz40Vbr+aprPewtb4RrMUyXQgjk3WUNNT5qUmbYWfwB7tGZMETqO9BmFkz0YTEc+MbpySx1Q7S2zdimoie7ZxHSpkWx4tOf2fx1HIrcZdCIVZsUAIbhHQZv1knDESiSmjWoKd85NGaMx/+KdE9HKipmvJwZWqwseSf/BKx74v2rahbZVssdZHlHJC9aOnQX9aID7IjXMyTO2pVJfDU9mil+gbm4xuRb5GHD+gxtYRb1Z369x7kEQ8YYYicPt5XFz0mYudhnN9pBsX4uP09p6eGDw70hus/Y1LcOxkMyPfOdTTNVU7JJqYTd1sHUup7O537rsfPU1EcoJItEZNxe9nVh53Mv1vJ7Z7MGuP+x4XvVpil+H2jdhAi6hfVvROruwrAV38V9KYuqqlEX/RUCfM6qzoYnsGDGk7CR2NxWeh408JruNUO0eciB+OocTNdpCH8d4X8IpISAMf0k1wujczCSHP57bY6v+T9cnbTuBAYrIcdbCCO4V8pmNqemY/3/U3pRTm6rVOTkdqRrlbGlQ0guTLlD0m1ySghk563AofaLg4PuATk4HJ72NPsp47z1DHE79bLKV/RffgvUw0z9Ev
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 08:59:38.8988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d49681de-2191-47c8-21ab-08dc44ce3ee6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8877

DQpIaSBTaGF3biwNCg0KPiBPbiAxNCBNYXIgMjAyNCwgYXQgMjI6MTUsIFNoYXduIEFuYXN0YXNp
byA8c2FuYXN0YXNpb0ByYXB0b3JlbmdpbmVlcmluZy5jb20+IHdyb3RlOg0KPiANCj4gQWRkIHRo
ZSBkZWZpbml0aW9ucyB1c2VkIGJ5IEFSTSdzIGJvb3RmZHQuYywgd2hpY2ggd2lsbCBiZSBtb3Zl
ZCBpbnRvDQo+IHhlbi9jb21tb24gaW4gYSBsYXRlciBwYXRjaCwgdG8gUFBDJ3Mgc2V0dXAuaC4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNoYXduIEFuYXN0YXNpbyA8c2FuYXN0YXNpb0ByYXB0b3Jl
bmdpbmVlcmluZy5jb20+DQo+IC0tLQ0KPiB4ZW4vYXJjaC9wcGMvaW5jbHVkZS9hc20vc2V0dXAu
aCB8IDExMiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+IDEgZmlsZSBjaGFuZ2Vk
LCAxMTIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3BwYy9pbmNs
dWRlL2FzbS9zZXR1cC5oIGIveGVuL2FyY2gvcHBjL2luY2x1ZGUvYXNtL3NldHVwLmgNCj4gaW5k
ZXggZTRmNjQ4NzliNi4uMWIyZDI5YzViNiAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvcHBjL2lu
Y2x1ZGUvYXNtL3NldHVwLmgNCj4gKysrIGIveGVuL2FyY2gvcHBjL2luY2x1ZGUvYXNtL3NldHVw
LmgNCj4gQEAgLTMsNCArMywxMTYgQEANCj4gDQo+ICNkZWZpbmUgbWF4X2luaXRfZG9taWQgKDAp
DQo+IA0KPiArI2luY2x1ZGUgPHB1YmxpYy92ZXJzaW9uLmg+DQo+ICsjaW5jbHVkZSA8YXNtL3Ay
bS5oPg0KPiArI2luY2x1ZGUgPHhlbi9kZXZpY2VfdHJlZS5oPg0KPiArDQo+ICsjZGVmaW5lIE1J
Tl9GRFRfQUxJR04gOA0KPiArI2RlZmluZSBNQVhfRkRUX1NJWkUgU1pfMk0NCj4gKw0KPiArI2Rl
ZmluZSBOUl9NRU1fQkFOS1MgMjU2DQo+ICsNCj4gKyNkZWZpbmUgTUFYX01PRFVMRVMgMzIgLyog
Q3VycmVudCBtYXhpbXVtIHVzZWZ1bCBtb2R1bGVzICovDQo+ICsNCj4gK3R5cGVkZWYgZW51bSB7
DQo+ICsgICAgQk9PVE1PRF9YRU4sDQo+ICsgICAgQk9PVE1PRF9GRFQsDQo+ICsgICAgQk9PVE1P
RF9LRVJORUwsDQo+ICsgICAgQk9PVE1PRF9SQU1ESVNLLA0KPiArICAgIEJPT1RNT0RfWFNNLA0K
PiArICAgIEJPT1RNT0RfR1VFU1RfRFRCLA0KPiArICAgIEJPT1RNT0RfVU5LTk9XTg0KPiArfSAg
Ym9vdG1vZHVsZV9raW5kOw0KPiArDQo+ICtlbnVtIG1lbWJhbmtfdHlwZSB7DQo+ICsgICAgLyoN
Cj4gKyAgICAgKiBUaGUgTUVNQkFOS19ERUZBVUxUIHR5cGUgcmVmZXJzIHRvIGVpdGhlciByZXNl
cnZlZCBtZW1vcnkgZm9yIHRoZQ0KPiArICAgICAqIGRldmljZS9maXJtd2FyZSAod2hlbiB0aGUg
YmFuayBpcyBpbiAncmVzZXJ2ZWRfbWVtJykgb3IgYW55IFJBTSAod2hlbg0KPiArICAgICAqIHRo
ZSBiYW5rIGlzIGluICdtZW0nKS4NCj4gKyAgICAgKi8NCj4gKyAgICBNRU1CQU5LX0RFRkFVTFQs
DQo+ICsgICAgLyoNCj4gKyAgICAgKiBUaGUgTUVNQkFOS19TVEFUSUNfRE9NQUlOIHR5cGUgaXMg
dXNlZCB0byBpbmRpY2F0ZSB3aGV0aGVyIHRoZSBtZW1vcnkNCj4gKyAgICAgKiBiYW5rIGlzIGJv
dW5kIHRvIGEgc3RhdGljIFhlbiBkb21haW4uIEl0IGlzIG9ubHkgdmFsaWQgd2hlbiB0aGUgYmFu
aw0KPiArICAgICAqIGlzIGluIHJlc2VydmVkX21lbS4NCj4gKyAgICAgKi8NCj4gKyAgICBNRU1C
QU5LX1NUQVRJQ19ET01BSU4sDQo+ICsgICAgLyoNCj4gKyAgICAgKiBUaGUgTUVNQkFOS19TVEFU
SUNfSEVBUCB0eXBlIGlzIHVzZWQgdG8gaW5kaWNhdGUgd2hldGhlciB0aGUgbWVtb3J5DQo+ICsg
ICAgICogYmFuayBpcyByZXNlcnZlZCBhcyBzdGF0aWMgaGVhcC4gSXQgaXMgb25seSB2YWxpZCB3
aGVuIHRoZSBiYW5rIGlzDQo+ICsgICAgICogaW4gcmVzZXJ2ZWRfbWVtLg0KPiArICAgICAqLw0K
PiArICAgIE1FTUJBTktfU1RBVElDX0hFQVAsDQo+ICt9Ow0KPiArDQo+ICsvKiBJbmRpY2F0ZXMg
dGhlIG1heGltdW0gbnVtYmVyIG9mIGNoYXJhY3RlcnMoXDAgaW5jbHVkZWQpIGZvciBzaG1faWQg
Ki8NCj4gKyNkZWZpbmUgTUFYX1NITV9JRF9MRU5HVEggMTYNCg0KTWF5YmUgeW91IGRvbuKAmXQg
bmVlZCB0aGlzIGRlZmluZQ0KDQoNClRoYXTigJlzIGEgYnVtbWVyIEnigJltIG1vZGlmeWluZyBh
IGxvdCB0aGlzIGhlYWRlciBpbiBvbmUgb2YgbXkgc2VyaWUgOikgaWYgdGhpcyBvbmUgZ29lcyBp
biBiZWZvcmUgbWluZQ0KSeKAmWxsIGhhdmUgdG8gdG91Y2ggeW91ciBoZWFkZXJzLiBOb3QgYSBw
cm9ibGVtIHRob3VnaC4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQoNCg0K

