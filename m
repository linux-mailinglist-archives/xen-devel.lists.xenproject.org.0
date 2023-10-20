Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE1A7D062A
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 03:32:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619624.965021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qteMW-0001Al-EQ; Fri, 20 Oct 2023 01:31:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619624.965021; Fri, 20 Oct 2023 01:31:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qteMW-00017m-BQ; Fri, 20 Oct 2023 01:31:40 +0000
Received: by outflank-mailman (input) for mailman id 619624;
 Fri, 20 Oct 2023 01:31:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0mrC=GC=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qteMU-00017g-84
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 01:31:38 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060b.outbound.protection.outlook.com
 [2a01:111:f400:fe16::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67fc2550-6ee8-11ee-9b0e-b553b5be7939;
 Fri, 20 Oct 2023 03:31:35 +0200 (CEST)
Received: from AS9PR06CA0216.eurprd06.prod.outlook.com (2603:10a6:20b:45e::30)
 by AM8PR08MB6596.eurprd08.prod.outlook.com (2603:10a6:20b:369::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Fri, 20 Oct
 2023 01:31:32 +0000
Received: from AM1PEPF000252DD.eurprd07.prod.outlook.com
 (2603:10a6:20b:45e:cafe::2f) by AS9PR06CA0216.outlook.office365.com
 (2603:10a6:20b:45e::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26 via Frontend
 Transport; Fri, 20 Oct 2023 01:31:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252DD.mail.protection.outlook.com (10.167.16.55) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.20 via Frontend Transport; Fri, 20 Oct 2023 01:31:31 +0000
Received: ("Tessian outbound 028b72acc2da:v215");
 Fri, 20 Oct 2023 01:31:30 +0000
Received: from ca413b4c90bc.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 16BE21E1-0A68-4D0B-9733-D984517DB2AF.1; 
 Fri, 20 Oct 2023 01:31:24 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ca413b4c90bc.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Oct 2023 01:31:24 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB10001.eurprd08.prod.outlook.com (2603:10a6:20b:632::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Fri, 20 Oct
 2023 01:31:22 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 01:31:22 +0000
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
X-Inumbo-ID: 67fc2550-6ee8-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjHqZbRp6oarfR+xLPUKOLup4+ESGzCBPM1m0YmmiOg=;
 b=pqs6lb8+1cCHhQKB3g8ZrejBTs6O/sQHIrLQy/lExDceMR8PKOgbKy+/y7pfatOvgNRWV+3SJX6mSXglRqu43HeESbDzM4c1GlLe1rtu2KGhlsOUaHI0xnfRXfweWbzdKc4QByI7OB0pzOZ7mPK0VfAEr8Dz0F5YuwpKXN+VgTM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1ba80428a08bffbd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V68J9535Xm8egZApl2PFbaWtociL4dc5mrXDyejGKAu4YHYXZThqY+uxjCcEIZXzhsGQbfwmkxvcgGfRBwKmrHnQx2CPELptewAXBbaal7XUS5ux1F5/pGHV3L9aG6BpYr9EpzctEL08BnhXgy4HRcAegIjKKmuy4/ouxfwGbkGSMPeL5GkoJiYVLDZL3x75dYCxGN5G/4ReElH5RVQeAip0UBPCF4R3WoTyGACnVVPTmMBb1nFxpEj6/CODZaP3Gc6zIL9vULwMcux2IvbAVpJz5nBiJkR2dqxvIx5zq6kcPq53fylfWTJZwA+f39I9SrRmrbEjqhJ7Rx/YnLrOCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjHqZbRp6oarfR+xLPUKOLup4+ESGzCBPM1m0YmmiOg=;
 b=bG0VcoU0HjyBxK4/iF+IwB6QUMUHhtyc0qh27B1uViNxUQVYY80cL5JmwHxSny6cex7xs0fWQLGZnPq4O5oUkikX1tD/nzD8/a52UE3jXrMy5gIWstNLOmYF5R0k7T7XTuXXr5T8EA1Tg2lf9yxr4zDeKB+fHEnsBUWhPyu6jEwF0FwCoBusii7eHQaa4/HwGkm4v0Ey9VeWRne2rTMEHUFesmFZ81/Fchsq7CyN/Fgd84T0vlkyGnTPblMqodYfHGAhgBoqdynWWQ6RRk2oq8Y683fo76uHD3XuHHiIZSu9AcgEHB95z2ld+62LJfIU9eayRGzNyjlD/eeTBA/6vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjHqZbRp6oarfR+xLPUKOLup4+ESGzCBPM1m0YmmiOg=;
 b=pqs6lb8+1cCHhQKB3g8ZrejBTs6O/sQHIrLQy/lExDceMR8PKOgbKy+/y7pfatOvgNRWV+3SJX6mSXglRqu43HeESbDzM4c1GlLe1rtu2KGhlsOUaHI0xnfRXfweWbzdKc4QByI7OB0pzOZ7mPK0VfAEr8Dz0F5YuwpKXN+VgTM=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Community Manager
	<community.manager@xenproject.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Chen
	<Wei.Chen@arm.com>
Subject: Re: [PATCH 1/3] CHANGELOG.md: Mention the MISRA-C improvement in 4.18
 dev cycle
Thread-Topic: [PATCH 1/3] CHANGELOG.md: Mention the MISRA-C improvement in
 4.18 dev cycle
Thread-Index: AQHaAkwZpuNxj+yPc0utTQUv+u0QObBRScQAgACb2IA=
Date: Fri, 20 Oct 2023 01:31:22 +0000
Message-ID: <B8B61F24-CE9D-4924-992D-A8C43EB22956@arm.com>
References: <20231019052050.1032492-1-Henry.Wang@arm.com>
 <20231019052050.1032492-2-Henry.Wang@arm.com>
 <alpine.DEB.2.22.394.2310190911020.1945130@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2310190911020.1945130@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB10001:EE_|AM1PEPF000252DD:EE_|AM8PR08MB6596:EE_
X-MS-Office365-Filtering-Correlation-Id: 85f47805-8bcc-439a-6ce3-08dbd10c49e9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KdmEIV+wXFZhjtl5cklgw0CmqrWhjknwUJdRW96siz9Mh/BjJCT+72iYnSJ7KDS13ABCD0tD9NnDDIzGjimhY0RaT0qD9V/4a99bUUHeLkScUFp3qRIT0Azr64oSt1OZK9jCavOpmmxbDXxHZSLjCXyr7DsegrS/qZ8XjvaFfsBG51rN/80LTPT1Rad+SysmxtjoELFc2A3aAv5YKcktHTOeBMfKoKmRylCxgf/hx0T3mFq38/5MZwlhi2hkhiPtnuWU1DDe1orQLw5mdWmE5/xz//Wkejbby1VNU0b71w58pSfHLEc1+KS108d+onnMp1Vdhsme3vm6NLm7UWnro+AYQYVPFE6TC+nT9VnYbt7NozD6lgGDr0bXTt22DawuF5XFCKrh4/po/EvAsjQqp1jaCjHG2Nm2fsiXMEWIiCyvgf3TPjbIgnDdJESXu3Ain8GY2GTG9f5ZuYnbyvIdVJf8HCnFempMPadiA0mEOc8QFBahOOutFVaRSLS4o6pOCb0FhBCEtxJh/cjGQlmuGGFPdVpvcUXFz2PC+7KyIJRwbrJ6KHJsWHtEQR1/Zv6RTXju7y5tonfxrWNpSZBKKZk2PQeeJeLsmPl2Idt1AHmXkEvvvSK6GhEXWtSz1aQhrtanowa+gxqMHx8ec0+vJMgwcjLGnTWBccjJbCtwvSzBwfbiWZlqDePfN6WuHNQD
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39860400002)(136003)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(38070700009)(6506007)(66476007)(66446008)(54906003)(76116006)(66946007)(64756008)(66556008)(478600001)(91956017)(41300700001)(6486002)(6512007)(6916009)(4326008)(33656002)(8936002)(86362001)(5660300002)(8676002)(26005)(122000001)(36756003)(316002)(2906002)(38100700002)(2616005)(71200400001)(53546011)(83380400001)(219803003)(207903002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <51C6BF9219F46A42A053A44D74DFED9D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10001
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cef94be6-e869-4280-e5ef-08dbd10c44c0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a7f9lTGnOA2TjZpSMZcinwx9+R8VcRYFlcRfT+yZyBCLXnpohwyTMc2hmcfTHRigtsGsrqo978zKWEnrrC66aNKf2mlDloTZN+yRzsiezh9Yn0ItmtPdZ3mSQ2yRCk+eF332pnWAdFRkcKE1W5Ls426e/4IzVSrtzkNyYBWMlybSQRGBt0yfgbFXzy+OkzA9I/KNcl5qcEq+X/KEZBTa4XpZENy+jxFK0mTN1qDaV4N0+rZB8IWb0uj21J9gtUun6apWqq+8xoJsq+BBpn/olBn3oDMoOqSc93JwEB7uScZZmgN9sRF06mNm+advxEZq+bRkkhspT0eNo6rHd5fi7rBnxJlm7GCdqziTWo87RVN4q2zoIX+StYGfdzJdmt0ZdtJdtYWyo+EsmoTF2SsXTWxmxKMtKHZhEEW59RFzMPFk6or3WEEhIwe/uUY3bumud5sl4oVEKcywIfqg2iy3x76L5mAbO0S2zOXkG378SKYZMgaQ24EdBbAXo+wi+vsJAcziKRIc9aGYf3HBPEv9itvIvJHtuONepcJzobQX9Zj662dbZZ2I8ivGe04vujD8qSdZBROS/3WVL46/2/yBbY6PaUosrJn8O0hurLNpTVWzkj+s0LXjVdsZdGhGNlUxi4oi2WIPWg6Anjiej0oHlqSGrIyXIfxPu8iCtFNRiYmHYMZG+KjEtDPNh58pUyYnWbmhPGHJ+rjmajLLyNHpaQaJyFQYu8QrdWqnueWLdams3Nus3NGA+MphEt5pssiIGnNg4XbZwc1fW/a55yPgM7eM8sctRvUpfADA+OSM2y4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(82310400011)(36840700001)(40470700004)(46966006)(33656002)(83380400001)(36756003)(6506007)(478600001)(47076005)(86362001)(82740400003)(81166007)(36860700001)(356005)(40460700003)(336012)(2616005)(26005)(41300700001)(4326008)(54906003)(6862004)(5660300002)(316002)(6512007)(2906002)(8676002)(70206006)(70586007)(8936002)(6486002)(40480700001)(53546011)(219803003)(207903002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 01:31:31.2435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f47805-8bcc-439a-6ce3-08dbd10c49e9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6596

SGkgU3RlZmFubywNCg0KPiBPbiBPY3QgMjAsIDIwMjMsIGF0IDAwOjEzLCBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gVGh1LCAxOSBP
Y3QgMjAyMywgSGVucnkgV2FuZyB3cm90ZToNCj4+IFNpZ25lZC1vZmYtYnk6IEhlbnJ5IFdhbmcg
PEhlbnJ5LldhbmdAYXJtLmNvbT4NCj4+IC0tLQ0KPj4gQ0hBTkdFTE9HLm1kIHwgMSArDQo+PiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL0NIQU5H
RUxPRy5tZCBiL0NIQU5HRUxPRy5tZA0KPj4gaW5kZXggMTY1YzVjYWY5Yi4uNDdlOThmMDM2ZiAx
MDA2NDQNCj4+IC0tLSBhL0NIQU5HRUxPRy5tZA0KPj4gKysrIGIvQ0hBTkdFTE9HLm1kDQo+PiBA
QCAtMzMsNiArMzMsNyBAQCBUaGUgZm9ybWF0IGlzIGJhc2VkIG9uIFtLZWVwIGEgQ2hhbmdlbG9n
XShodHRwczovL2tlZXBhY2hhbmdlbG9nLmNvbS9lbi8xLjAuMC8pDQo+PiAgICBub2RlcyB1c2lu
ZyBhIGRldmljZSB0cmVlIG92ZXJsYXkgYmluYXJ5ICguZHRibykuDQo+PiAgLSBJbnRyb2R1Y2Ug
dHdvIG5ldyBoeXBlcmNhbGxzIHRvIG1hcCB0aGUgdkNQVSBydW5zdGF0ZSBhbmQgdGltZSBhcmVh
cyBieQ0KPj4gICAgcGh5c2ljYWwgcmF0aGVyIHRoYW4gbGluZWFyL3ZpcnR1YWwgYWRkcmVzc2Vz
Lg0KPj4gKyAtIFRoZSBwcm9qZWN0IGhhcyBub3cgb2ZmaWNpYWxseSBhZG9wdGVkIDcyIHJ1bGVz
IG9mIE1JU1JBLUMuDQo+IA0KPiBJIGNvdW50ZWQgdGhlbSBhZ2FpbiwgdGhleSBhcmUgNzEgdG9k
YXkuIFdlIGhhdmUgYWNjZXB0ZWQgMyBtb3JlDQo+IHJlY2VudGx5IGJ1dCBmb3IgdGhlIENIQU5H
RUxPRy5tZCBJIHdvdWxkIHN0aWNrIHdpdGggd2hhdCBpcyBvbg0KPiBkb2NzL21pc3JhL3J1bGVz
LnJzdA0KDQpUaGFua3MgZm9yIHRoZSBwb2ludGVyIG9mIHRoZSBkb2MsIEkgY2hlY2tlZCB0aGUg
ZG9jIGFuZCBub3RpY2VkIHRoYXQNCndlIGFjdHVhbGx5IHN1cHBvcnQgNjUgcnVsZXMgYW5kIDYg
ZGlyZWN0aXZlcyAoNjUrNj03MSBzbyB5b3UgYXJlIGNvcnJlY3QpLA0KYnV0IHRvIGF2b2lkIHRo
ZSBjb25mdXNpb24sIHdvdWxkIHlvdSBtaW5kIG1lIHdyaXRpbmcgaW4gdGhpcyB3YXk6DQoiVGhl
IHByb2plY3QgaGFzIG9mZmljaWFsbHkgYWRvcHRlZCA2IGRpcmVjdGl2ZXMgYW5kIDY1IHJ1bGVz
IG9mIE1JU1JBLUPigJ0/DQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5

