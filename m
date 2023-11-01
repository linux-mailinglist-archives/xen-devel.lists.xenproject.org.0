Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0A67DDAC6
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 02:59:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626057.975978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy0VS-0003kW-1E; Wed, 01 Nov 2023 01:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626057.975978; Wed, 01 Nov 2023 01:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy0VR-0003i5-UT; Wed, 01 Nov 2023 01:58:53 +0000
Received: by outflank-mailman (input) for mailman id 626057;
 Wed, 01 Nov 2023 01:58:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7wFu=GO=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qy0VQ-0003hz-W9
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 01:58:53 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060f.outbound.protection.outlook.com
 [2a01:111:f400:fe16::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32c7c0c0-785a-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 02:58:49 +0100 (CET)
Received: from AM6PR01CA0067.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::44) by PAXPR08MB7468.eurprd08.prod.outlook.com
 (2603:10a6:102:2b6::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Wed, 1 Nov
 2023 01:58:44 +0000
Received: from AMS0EPF000001A5.eurprd05.prod.outlook.com
 (2603:10a6:20b:e0:cafe::93) by AM6PR01CA0067.outlook.office365.com
 (2603:10a6:20b:e0::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29 via Frontend
 Transport; Wed, 1 Nov 2023 01:58:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A5.mail.protection.outlook.com (10.167.16.232) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.19 via Frontend Transport; Wed, 1 Nov 2023 01:58:42 +0000
Received: ("Tessian outbound 26ee1d40577c:v228");
 Wed, 01 Nov 2023 01:58:42 +0000
Received: from 1d50ed93793d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A4B378C3-D5BB-4D5C-BFDC-8572699E076A.1; 
 Wed, 01 Nov 2023 01:58:30 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1d50ed93793d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 01 Nov 2023 01:58:30 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS4PR08MB7532.eurprd08.prod.outlook.com (2603:10a6:20b:4fb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Wed, 1 Nov
 2023 01:58:27 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9%4]) with mapi id 15.20.6933.028; Wed, 1 Nov 2023
 01:58:27 +0000
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
X-Inumbo-ID: 32c7c0c0-785a-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=G7NB9oYTKqIezzSWB+4Jv2HYYmy7WYERwM3P3v2RVPrZeeiBj6ICce6GeMHgAtx80HWI3AaMAXTIrZCXxtxcywr6jOHNVLUCo70i3LwxNcyUuSoU1RtDJTvLtoJmKymX+pr0S1n9X/qUiU33EsRNCE5DuWrPhNN5xDBp2Wnhn8OkXu4lw0crHndIh71S5696p1J3Y5W4yncz0uAlZuXiYBgvx5JAznGVc0lA6krVp91PGlBukOXrOHq0N6FUz/y1BQyul3V16ORM7uoWM3zs/ry59UJW3O65JeVGdFwNm3vkwsE8ob3G90Gde5CP+bwjsgaCXBaOm5++wVfTKjukcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KCbIKvw7NtC/SYBt4hbAUM1pSPcvUI4IQb0RDApCGs=;
 b=Oqaf2IO3jQNO5xj/Y9iAJA9n7B0pUac9GkFFdIHNZzvBIvOK8AdBFWgTdUnk5qTJpVuh5aKMdF3c8D5CLySY+wWint57wdU8F16mNh+IpXBs/6Vvi/eOiZ6qA2petbcCKyX1caWoxl3uaIrnivBYpExIXg0qG+0IUGT/9OJRIiI4jBaYdav98PmILnBPVOz85bVpgW8ZYseiJ+h/NJx+rT4tgiAqGjhAKwFVYedDNwFOWlpRDEbZGcPjqbQar4aWRFvhIziEtz26L2GrdgiR58RZw30En29dd4LwJkjKmGzjPSrM4P57mgJeHMOBHh9sO2m48QYK8+YaUGKYFJH8eQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KCbIKvw7NtC/SYBt4hbAUM1pSPcvUI4IQb0RDApCGs=;
 b=BzJ1TwxQt0BK3lQhO5CuX1Cv6AXC+Jir1ObIy7ln7VXSN/cwx0viNGlz/AxJ505jHetoqNcFGEAXMN/rbm62WA8CZFhdyrAFf09PKT5ysgQkPEe+cs8J5dKFIcgJIDKq4KN/wo7WqafL0hU7N9OFyOG/632MhY8I8jt5m/JYGOk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8a01f275641caf6b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQlzgUPeNyjilR7wm8I4zlzocv1A4kRRiTyJPxjHBFNRbymML2T4qTOyE1/Li40RscVFzwik5VTsJq+GSpxp0LUalQ7H4bsLapsbLvfErRDumM53TceRpyOVyHIlwFlB1rG7gKsmCzDWNX0MRsHjrLbLlexguZHQMewOTCkJmft+mWyHbxQ3NRcxEyks5QAH37bZEtTQkO7uRMpND1zcPVmnzKhP8VVuv7BVgOuuW3uOCi9YRiH7FATwca5qeb5nThbVM6qBPilPRtXMvb03GhC4el9TgW7giGmqK4ynCCFA+XSz4WvK240ZyIiuFIsnCrXxu/y9u/kDGsxAYTVkBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KCbIKvw7NtC/SYBt4hbAUM1pSPcvUI4IQb0RDApCGs=;
 b=jeCz4wRSKaRmW8LPvb/VPTm/C6ykZvm1WGvPudo0bi3dwSqFIjBkluqpTz5/JMTu4qeD5DHIub7PQ46RXrdVty3dCzshohbRE8aLsULX7YP4AH9N1nm+NNXJtBma9WXVs7rnVsOm7P7EzFudNhITgD6DPkLlmbaz39LrFUucwzT8RBQx+NF9tIFw7+KBMElhmXbxghR+XIXoYEU/rw0APUxogoI2iesdyMicFbSS/HzMHqABUlfRQ2bwuziUK0HOpg6QsbJ9KEUkAtnVLePmABVbOg3J1PAN6PoqVPmoQf3ilyq1m3BgnWjrbdhb5wKSv19EiB0Po+VRrNrD6NQrzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KCbIKvw7NtC/SYBt4hbAUM1pSPcvUI4IQb0RDApCGs=;
 b=BzJ1TwxQt0BK3lQhO5CuX1Cv6AXC+Jir1ObIy7ln7VXSN/cwx0viNGlz/AxJ505jHetoqNcFGEAXMN/rbm62WA8CZFhdyrAFf09PKT5ysgQkPEe+cs8J5dKFIcgJIDKq4KN/wo7WqafL0hU7N9OFyOG/632MhY8I8jt5m/JYGOk=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei
 Chen <Wei.Chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Julien Grall <jgrall@amazon.com>, Ayan Kumar
 Halder <ayan.kumar.halder@amd.com>
Subject: Re: [PATCH v8 3/8] xen/arm: Fold mmu_init_secondary_cpu() to head.S
Thread-Topic: [PATCH v8 3/8] xen/arm: Fold mmu_init_secondary_cpu() to head.S
Thread-Index: AQHaBVagUvAeq6Jj0E+dI1rvNGdSyLBkRaEAgAB9cwA=
Date: Wed, 1 Nov 2023 01:58:27 +0000
Message-ID: <D25CD22C-F529-41F7-93AB-43BEB7157B8C@arm.com>
References: <20231023021345.1731436-1-Henry.Wang@arm.com>
 <20231023021345.1731436-4-Henry.Wang@arm.com>
 <f098a07d-fa19-4b40-bfac-7b121524382a@xen.org>
In-Reply-To: <f098a07d-fa19-4b40-bfac-7b121524382a@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS4PR08MB7532:EE_|AMS0EPF000001A5:EE_|PAXPR08MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: 67a34b28-a68f-462f-9dd2-08dbda7e1310
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +cCWJccZTok+R15R9NPshwNkaKvT/ZMkkh2e3rs1mdtYvs0t9RhVz49r427P13I/h8b4EKnY2ZEA1csooGfc3n/NyIlckDC0099juhBTM4IV7JNfqS3Vh1YT9RcBEYPThX54xcnNabxmN73ApOYzFG5EsY+om8Lpv70wharRft5l67bZ+p+EFUjp1jdEqs31Ha53lvuNmC3G5QrZb2bpaZOufJYBUdZFJFMNTgCFkd9wb9ZuzsjG4ob91A2KNQcPvCH25s5kxtiEvowOwvOU6exLwdHsdpCK0hXy+WWV+ywGJ6BxYEyFDMadfX+HxoTxO5IYv8Jgijl7zkFaAcOZVQmQZnVtfHpb8uD8Ip/Ca7eC+hIxUq4UJuCn6vGY5+EP629T/FI2oB03gquV9Jemb9GShj5YrkGHDyQwSkmGFgqBJRsji6OFbXPyihZVJVVP+YFIIoXH9dobzoiHlyFlO67k/UpG72XgZLwAPXT9VcoOiPIeLdZDBHhHljjLLjfnZtikbdnsGbAUC6YHaoN8Wo8022MZATTN+Vq33bccVRwCjnVjZdU/AHlBcshYthiYiFs/1JQEA0ky0dGj6x86b8Q7J3wCUXYs83bfJs2z7sLqCQ0HIx1VgKY6sWX/vtq11OB+/CVUe/5WmCctOudgGSoB3Jllu1EVvqmtgjd2tUlmDIuNPKvydJotGOQGe6vW
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(396003)(366004)(39860400002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(66899024)(26005)(2616005)(6512007)(38070700009)(36756003)(33656002)(86362001)(122000001)(38100700002)(2906002)(83380400001)(5660300002)(53546011)(71200400001)(478600001)(6506007)(4326008)(8676002)(6916009)(8936002)(54906003)(66946007)(316002)(66476007)(66446008)(64756008)(66556008)(91956017)(41300700001)(76116006)(6486002)(966005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <63700F5631B0514CA443ED487EC7F970@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7532
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9b0e392f-ac5d-474d-7d1d-08dbda7e0a06
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rve9SqmAP6AsNuSIZZHO1MtBipqnAr6k0hEfkxkyk5kfiwioOqj9KfI9PUB1aUC9mX8hRF8si2ZqXFxxQoOhT2mj0uoU81M7rtHFTFXjOSm+C7+z8iX5zKEwNL+JX/1C/lMHBQmTzR4b1qw88KEbKkVDSu8P1/u/PoMB2gT3X7BRFoFoZL+BlJdz/2z5YJ8Be9F5lXlLXc7zyooUoUi/6/002+be/EWJXsOMd2gLWkn0Rpd40oCfF/L9DeuNgtV6G0molypfehdBzPX+52eut3HEPJxMoKKoC7J2x6NalHws/khtFXlMfoX/FzcDiNlizz+M9+AewjLZKuL6BwN5REKSPBLP8RDWc2C7W85C503IkMboJZxuAdjyIzpMv5xoPlBsKYcfyBpMYjirIJKaiHCBdF3VgkLyWin1QiBBELdW5yMBotlXbluEFVFa/fXFywtgIR+Vbr/VGH11grBzNT9xf99r6QKqq6xdvcNzjHSZLTLsGqmttd02k2Rgq/FH44fKEp4GgZIomsVWkv77eg3SGAT+NY2snzZ+7po4lXw/GuEvS5GKi9nee4jiaaooDdJvx6jq8YaH16A+Nyx6tA8yH3sxgiLBRWS+HMRffCHSxuhNvfybazxv+dOio1LwhgMEhIzV0LqyOLYKsjI5PcK2LOpkdj+ZftHemiBtEwTgoHC4GAmNQNhxOwfvJFD26HcvFuFoUOFp7IYQPbtwbi20NOBCIKx7PtcAXQO+alL9/II/JnQrc22oLlmUCDne497oVdAcyPUff4+WQlRHvQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(82310400011)(46966006)(36840700001)(40470700004)(40460700003)(40480700001)(2616005)(6512007)(26005)(53546011)(478600001)(6506007)(336012)(47076005)(36860700001)(83380400001)(2906002)(5660300002)(41300700001)(70586007)(70206006)(966005)(6486002)(4326008)(6862004)(8676002)(316002)(8936002)(54906003)(81166007)(82740400003)(356005)(86362001)(33656002)(36756003)(66899024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 01:58:42.2866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a34b28-a68f-462f-9dd2-08dbda7e1310
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7468

SGkgSnVsaWVuLA0KDQo+IE9uIE5vdiAxLCAyMDIzLCBhdCAwMjoyOSwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBIZW5yeSwNCj4gDQo+ICtBeWFuDQo+IA0K
PiBPbiAyMy8xMC8yMDIzIDAzOjEzLCBIZW5yeSBXYW5nIHdyb3RlOg0KPj4gQ3VycmVudGx5IG1t
dV9pbml0X3NlY29uZGFyeV9jcHUoKSBvbmx5IGVuZm9yY2VzIHRoZSBwYWdlIHRhYmxlDQo+PiBz
aG91bGQgbm90IGNvbnRhaW4gbWFwcGluZyB0aGF0IGFyZSBib3RoIFdyaXRhYmxlIGFuZCBlWGVj
dXRhYmxlcw0KPj4gYWZ0ZXIgYm9vdC4gVG8gZWFzZSB0aGUgYXJjaC9hcm0vbW0uYyBzcGxpdCB3
b3JrLCBmb2xkIHRoaXMgZnVuY3Rpb24NCj4+IHRvIGhlYWQuUy4NCj4+IEZvciBhcm0zMiwgaW50
cm9kdWNlIGFuIGFzc2VtYmx5IG1hY3JvIHB0X2VuZm9yY2Vfd3huLiBUaGUgbWFjcm8gaXMNCj4+
IGNhbGxlZCBiZWZvcmUgc2Vjb25kYXJ5IENQVXMganVtcGluZyBpbnRvIHRoZSBDIHdvcmxkLg0K
Pj4gRm9yIGFybTY0LCBzZXQgdGhlIFNDVExSX0F4eF9FTHhfV1hOIGZsYWcgcmlnaHQgd2hlbiB0
aGUgTU1VIGlzDQo+PiBlbmFibGVkLiBUaGlzIHdvdWxkIGF2b2lkIHRoZSBleHRyYSBUTEIgZmx1
c2ggYW5kIFNDVExSIGRhbmNlLg0KPiANCj4gRm9yIGEgcmFuZG9tIHJlYWRlciwgaXQgaXMgbm90
IGNsZWFyIHdoeSB5b3UgY2FuJ3Qgc2V0IFduWCBlYXJseSBmb3IgYXJtMzIgYXMgd2VsbC4gSSB0
aGluayBpdCB3b3VsZCBoZWxwZnVsIHRvIGV4cGxhaW4gdGhlIGRpZmZlcmVuY2UuIEkuZS4gYXQg
dGhlIHBvaW50IHRoZSBNTVUgaXMgZW5hYmxlZCwgdGhlIHBhZ2UtdGFibGVzIG1heSBzdGlsbCBj
b250YWluIG1hcHBpbmcgd2hpY2ggYXJlIHdyaXRhYmxlIGFuZCBleGVjdXRhYmxlLg0KDQpTb3Vu
ZHMgZ29vZCwgSSB3aWxsIGFkZCB0aGUgc3VnZ2VzdGVkIHNlbnRlbmNlLg0KDQo+PiAgLmVuZG0N
Cj4+ICArLyoNCj4+ICsgKiBFbmZvcmNlIFhlbiBwYWdlLXRhYmxlcyBkbyBub3QgY29udGFpbiBt
YXBwaW5nIHRoYXQgYXJlIGJvdGgNCj4+ICsgKiBXcml0YWJsZSBhbmQgZVhlY3V0YWJsZXMuDQo+
PiArICoNCj4+ICsgKiBUaGlzIHNob3VsZCBiZSBjYWxsZWQgb24gZWFjaCBzZWNvbmRhcnkgQ1BV
Lg0KPj4gKyAqLw0KPj4gKy5tYWNybyBwdF9lbmZvcmNlX3d4biB0bXANCj4+ICsgICAgICAgIG1y
YyAgIENQMzIoXHRtcCwgSFNDVExSKQ0KPj4gKyAgICAgICAgb3JyICAgXHRtcCwgXHRtcCwgI1ND
VExSX0F4eF9FTHhfV1hODQo+PiArICAgICAgICBkc2INCj4+ICsgICAgICAgIG1jciAgIENQMzIo
XHRtcCwgSFNDVExSKQ0KPj4gKyAgICAgICAgLyoNCj4+ICsgICAgICAgICAqIFRoZSBUTEJzIG1h
eSBjYWNoZSBTQ1RMUl9FTDIuV1hOLiBTbyBlbnN1cmUgaXQgaXMgc3luY2hyb25pemVkDQo+PiAr
ICAgICAgICAgKiBiZWZvcmUgZmx1c2hpbmcgdGhlIFRMQnMuDQo+PiArICAgICAgICAgKi8NCj4+
ICsgICAgICAgIGlzYg0KPj4gKyAgICAgICAgZmx1c2hfeGVuX3RsYl9sb2NhbCBcdG1wDQo+PiAr
LmVuZG0NCj4+ICsNCj4+ICAvKg0KPj4gICAqIENvbW1vbiByZWdpc3RlciB1c2FnZSBpbiB0aGlz
IGZpbGU6DQo+PiAgICogICByMCAgLQ0KPj4gQEAgLTI1NCw2ICsyNzMsNyBAQCBzZWNvbmRhcnlf
c3dpdGNoZWQ6DQo+PiAgICAgICAgICAvKiBVc2UgYSB2aXJ0dWFsIGFkZHJlc3MgdG8gYWNjZXNz
IHRoZSBVQVJULiAqLw0KPj4gICAgICAgICAgbW92X3cgcjExLCBFQVJMWV9VQVJUX1ZJUlRVQUxf
QUREUkVTUw0KPj4gICNlbmRpZg0KPj4gKyAgICAgICAgcHRfZW5mb3JjZV93eG4gcjANCj4gDQo+
IEZyb20gcmVjZW50IGRpc2N1c3Npb24gb24gSVJDLCBBeWFuIHJlbWluZGVkIG1lIHRoaXMgcGF0
Y2ggWzFdLiBJZGVhbGx5LCBJIHdvdWxkIHdhbnQgdG8gcHJpbnQgYSBtZXNzYWdlIGp1c3QgYmVm
b3JlIHRvIGluZGljYXRlIHRoYXQgdGhlIGJpdCBpcyBzZXQuIEJ1dCBJIHVuZGVyc3RhbmQgdGhh
dCB0aGlzIHdvdWxkIG5lZWQgdG8gYmUgZHJvcHBwZWQgaW4gQXlhbiByZXdvcmsgYXMgd2UgZG9u
J3QgeWV0IHN1cHBvcnQgZWFybHkgcHJpbnRrIGluIGVuYWJsZV9tbXUoKS4NCj4gDQo+IFdoaWxl
IGRlYnVnZ2luZyBhbiBNTVUgaXNzdWUgb24gQXJtMzIsIEkgd3JvdGUgYSBwYXRjaCB0byBzcHJp
bmtsZSBwcmludHMgaW4gdGhlIGVuYWJsZV9tbXUoKSBjb2RlLiBJIHdpbGwgY2xlYW4tdXAgdGhl
IHBhdGNoIGFuZCBzZW5kIGl0Lg0KDQpKdXN0IHRvIG1ha2Ugc3VyZSwgeW91ciBwYXRjaCBpcyBm
b3IgYm90aCBBcm0zMiBhbmQgQXJtNjQsIGlzIG15IHVuZGVyc3RhbmRpbmcgY29ycmVjdD8NCklm
IGl0IGlzIG9ubHkgZm9yIEFybTMyLCBkbyB5b3UgbmVlZCBtZSBhZGRpbmcgdGhlIHByaW50IGZv
ciBBcm02NCBhcyB3ZWxsIGluIHRoaXMgcGF0Y2g/DQoNCj4gSSB3aWxsIGFkZCBhIHByaW50IGF0
IHRoYXQgcG9pbnQuIE1lYW53aGlsZSwgSSB3b3VsZCBtb3ZlIHRoZSBjYWxsIGEgZmV3IGxpbmVz
IGFib3ZlPyBUaGlzIHdpbGwgYWxsb3cgQXlhbiB0byBkcm9wIFsxXS4NCg0KWWVhaCBJIHdpbGwg
aW5jbHVkZSBBeWFu4oCZcyBjaGFuZ2UgaW4gdGhpcyBwYXRjaCBhbmQgYWRkIGhpcyBzaWduLW9m
Zi4NCg0KPj4gICAgICAgICAgUFJJTlQoIi0gUmVhZHkgLVxyXG4iKQ0KPj4gICAgICAgICAgLyog
SnVtcCB0byBDIHdvcmxkICovDQo+PiAgICAgICAgICBtb3ZfdyByMiwgc3RhcnRfc2Vjb25kYXJ5
DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L21tdS9oZWFkLlMgYi94ZW4vYXJj
aC9hcm0vYXJtNjQvbW11L2hlYWQuUw0KPj4gaW5kZXggODgwNzVlZjA4My4uZGYwNmNlZmJiZSAx
MDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9tbXUvaGVhZC5TDQo+PiArKysgYi94
ZW4vYXJjaC9hcm0vYXJtNjQvbW11L2hlYWQuUw0KPj4gQEAgLTI2NCwxMCArMjY0LDExIEBAIEVO
RFBST0MoY3JlYXRlX3BhZ2VfdGFibGVzKQ0KPj4gICAqIElucHV0czoNCj4+ICAgKiAgIHgwIDog
UGh5c2ljYWwgYWRkcmVzcyBvZiB0aGUgcGFnZSB0YWJsZXMuDQo+IA0KPiBUaGUgaW5wdXRzIGxp
c3Qgc2hvdWxkIGJlIHVwZGF0ZWQgdG8gbWVudGlvbiB3aGF0IHgxIG1lYW5zLg0KDQpJIHdpbGwg
dXNlIOKAnHgxOiBFeHRyYSBmbGFncyBvZiB0aGUgU0NUTFIu4oCdIGlmIHRoaXMgbG9va3MgZ29v
ZCB0byB5b3UuDQoNCj4+ICAgKg0KPj4gLSAqIENsb2JiZXJzIHgwIC0geDQNCj4+ICsgKiBDbG9i
YmVycyB4MCAtIHg2DQo+IA0KPiBCZWxvdywgeW91IG9ubHkgc2VlbSB0byBpbnRyb2R1Y2UgeDUu
IFNvIHNob3VsZG4ndCB0aGlzIGJlOiAiQ2xvYmJlcnMgeDAgLSB4NSI/DQoNCkhtbW0geWVzIHlv
dSBhcmUgY29ycmVjdCwgSSBibGluZGx5IGNvcGllZCB0aGUgY29kZSBmcm9tIFsyXS4gU29ycnkg
Zm9yIHRoZSBtZXNzLCBJIHdpbGwNCmNvcnJlY3QgaXQgaW4gdjkuDQoNCj4gQ2hlZXJzLA0KPiAN
Cj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDkxMTEzNTk0Mi43OTEyMDYt
Mi1heWFuLmt1bWFyLmhhbGRlckBhbWQuY29tLw0KDQpbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcveGVuLWRldmVsLzRkN2E5ODQ5LTg5OTAtOGRkZC0zNTMxLTkzZjRlMmUyNjJiMUB4ZW4ub3Jn
Lw0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoN
Cg==

