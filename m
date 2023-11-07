Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE537E3209
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 01:11:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628517.980079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r09fi-00083N-Kt; Tue, 07 Nov 2023 00:10:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628517.980079; Tue, 07 Nov 2023 00:10:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r09fi-000800-HT; Tue, 07 Nov 2023 00:10:22 +0000
Received: by outflank-mailman (input) for mailman id 628517;
 Tue, 07 Nov 2023 00:10:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7kXw=GU=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r09fg-0007zq-GU
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 00:10:20 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0868d5db-7d02-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 01:10:18 +0100 (CET)
Received: from AM0PR07CA0034.eurprd07.prod.outlook.com (2603:10a6:208:ac::47)
 by GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Tue, 7 Nov
 2023 00:10:00 +0000
Received: from AM3PEPF0000A79C.eurprd04.prod.outlook.com
 (2603:10a6:208:ac:cafe::52) by AM0PR07CA0034.outlook.office365.com
 (2603:10a6:208:ac::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.16 via Frontend
 Transport; Tue, 7 Nov 2023 00:10:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A79C.mail.protection.outlook.com (10.167.16.107) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 00:09:59 +0000
Received: ("Tessian outbound 7671e7ddc218:v228");
 Tue, 07 Nov 2023 00:09:59 +0000
Received: from fde633c079c4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A58920FE-A9F4-4233-8271-5E2787C3B205.1; 
 Tue, 07 Nov 2023 00:09:52 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fde633c079c4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 Nov 2023 00:09:52 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA4PR08MB5981.eurprd08.prod.outlook.com (2603:10a6:102:e2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 00:09:50 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9%4]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 00:09:49 +0000
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
X-Inumbo-ID: 0868d5db-7d02-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=J4zxhEj3pB+GDFH7HlyvUvHv9vjZ1bJIu+FkOUjCVkn+ZTWvj4oALCR3b3PFJXpefEEA/Vqk75NXocQVGCy02Xh26+5+odYk8q8iQxxnisoGFpw/BLWx0N9ObEsBi1rWQphr+I/FbwqICXCUZ+Va/7/qnhBXU+Z4BcSL79wNtqZwmERd/AiXA8jKhuUi9QtavhGQ4i31BxD8G45eM4iLSdoOW7oS3XTc8aG7rhPx7eg3cKNM45tJwUJQKdWUD8m4mgUOI394Sbu+7eMEc8PeG2bpmdnlqrNITEz8ost5SqHhIBqsMQ0cHuXfxqttujgz5wgJMMVxOv4dY/LeWt+neg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtqyCPIUyHaSeEENDJNns8yZ6jT+ClT1ngFWOl0+vTA=;
 b=I8fBuP5uvRUeTvXozCWCHMJZWar5eK1gBJlA2DvTBFNF98QN+YoW0JA/vumvhN381Obn9UhfUZ4WZ+4Asae3bbUh269nY18qq++aXcFjMYSn1LGYzZE27x6CaCCt1AqQoGTTzoX5L83zKmGdaG3gW/RSSF1ZAmPWsR2U/j3Sbt7t4emoyZuqzWkr58T2V01G5DV2cAW/4UUDn8OIOUvsYBNtn3MEDuTMQEBbAngfqq6EAgkYRvPzBS6B75RQydup9b1NzOioWNvEZRnBPs2AM+k9AgvCcIIoLCO7yzX30DZN2Ph2qvilu7MI0g4CNt40j5WWYJVbCo694aks6sjuVw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtqyCPIUyHaSeEENDJNns8yZ6jT+ClT1ngFWOl0+vTA=;
 b=G9JoOaoo6y/b05rALKPPrqtRvNKiKqWe7/Fjf/QSlVLE3zXTuMB2zmJIpYJCJmefIAi7SV5f1XIZU7tQ9NfZR2RKqBuD+cIa3f17cxIl6qePWDOBrb9qH2FOJNvbvj6qvzp3dDghre1uWtnmV48xZ5eFNO6Kd+9btaojuoVArDc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3d877c471d95e95d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbhMhhPorF5kDeamQqre8W0ATeTPJJ84gCJdNkUrHn9KxHySI4e2jIJtgSuISCNvfWfpgVXUkr4Wvja3G7lUFIuFELVNPzvEsPOQUW0foxdDdPQScqZ7tVOdEE2sZ82+y+gGH30RPaVFc5o9hkCvPqNLDcC8XInMNrsLHDqku3NFX1L69tXHezOei1Dx4fEaeXa4Ad60RVAlLjYLAMpLKOkH6pZi8pV+mocwl5f6VFfMg9WtDSGC9dqzpcfBbe2R0holYhbe8gseF+FpGuxO9m/m9/VT9Geh/DtzAd5vXgo7Ox28s8WdL+4+uNJSR75NOGQQFLxQzys+n1754VsRxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtqyCPIUyHaSeEENDJNns8yZ6jT+ClT1ngFWOl0+vTA=;
 b=J13Fe8nBHbyFWZYZ6w0Zyj67Uv7h2Izi5O9gFUbSt6oIEuHADNnf1bO9+nNVuXRFTS3nHjzvkdQi08AzGXUUxBlrtwhL4fGcavwubTjlvqI6VH+jiIVKxEt+kVVSO5A4mgptIGsKlgi+JI0lcLm+2A8xVJPwfnQLxH+sA2+8nnLVHYGEKmUpI1m6f+2PCgYDDO7Ob0ZAxcaCxRZHPVA04ReKlPxrTq5tlgc8OqUJ4zjI4iWPsESlyXg2Q2XwJq8oNsnjX/V9BzuAxmcrbP8jx2yGToJN3yjDmgkKoX4/wTb6jJYSE5rowLBB9eK1/xw9HbaQqlT4rqV7/KBzsl7iWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtqyCPIUyHaSeEENDJNns8yZ6jT+ClT1ngFWOl0+vTA=;
 b=G9JoOaoo6y/b05rALKPPrqtRvNKiKqWe7/Fjf/QSlVLE3zXTuMB2zmJIpYJCJmefIAi7SV5f1XIZU7tQ9NfZR2RKqBuD+cIa3f17cxIl6qePWDOBrb9qH2FOJNvbvj6qvzp3dDghre1uWtnmV48xZ5eFNO6Kd+9btaojuoVArDc=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Community Manager
	<community.manager@xenproject.org>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4] x86/x2apic: introduce a mixed physical/cluster mode
Thread-Topic: [PATCH v4] x86/x2apic: introduce a mixed physical/cluster mode
Thread-Index: AQHaEL2HdnKn60ZZBkKY+yRAm03LbrBtdQ4AgACG2QA=
Date: Tue, 7 Nov 2023 00:09:46 +0000
Message-ID: <299C4640-236C-4EE1-AD70-07DBE4CE2144@arm.com>
References: <20231106142739.19650-1-roger.pau@citrix.com>
 <e52bf34c-0aca-4204-8502-11a45ecdb94d@citrix.com>
In-Reply-To: <e52bf34c-0aca-4204-8502-11a45ecdb94d@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PA4PR08MB5981:EE_|AM3PEPF0000A79C:EE_|GV2PR08MB8121:EE_
X-MS-Office365-Filtering-Correlation-Id: 7752b097-5ba1-49a4-c9d0-08dbdf25e1e9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 y82L3HY+TMLTmLZL8anfFOc6IohXbZwXB2rukx7weXwwRJ3e5Fk+rfl1FV+/fyBFzHUUVJ7uDpBtNaVoT8iff+FRa31bE5GzyVFl37wxFGXw2oNKE7pfrC09Gnz2/NReIC/iM/MLwvH9LXVv3AKkB5k4lv0Pu7gJjAdJFDQvZ6wJ1g9YxHfCGmduyruIB4i/Uq5p2GvnKGwvpPszqebAUNUUSMc1diwuiOCDAruZ8VU4MGw8LxuIVSXDsoj7yBK7h153wZFwwjITNUXsr7hYF8m2ICnjm+HGxLQ4gRlY1dNhQP/qnBCc9+7CHUwGfJElAIQ0YGjPtqTR7fXBd0RjYqQCsHOdp3bIgCQSf5BU00UofTSRq9OPMOb7lCIoXZWWx4gAvaKH0A0bhunGGGRZ+LvY8T1S6gnZBFNN6l+/VdE11BK+o5TKiV2u+sfEtE2fdYTCnuHrvwHuAsXTh5FDDr4hpur8u54JH98t4C3qAeyG8pmaTZvu7G08Ohlqup50J210kwYarlXTSBgik+irS+oE2SdSZocrf+uv2wlH4e2MfT3wmLBMUJTSI1Cp0s394/vFYcyayC1+JdnXIodmsJrYMdsit8tCKOcQkJ2mX/FIxMLPmeq1FQ/43kPCEfdKM7bmO9bmkhAD9xYai6+UoPsMh0RwSglu6ygaM2R+8FUtA2PY7+Gn9iu9Wqf8OFr1
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(366004)(376002)(396003)(230922051799003)(230273577357003)(230173577357003)(186009)(64100799003)(1800799009)(451199024)(38100700002)(6506007)(53546011)(6512007)(6486002)(478600001)(71200400001)(6666004)(36756003)(64756008)(54906003)(316002)(6916009)(122000001)(91956017)(2616005)(83380400001)(66556008)(66946007)(66446008)(66476007)(26005)(76116006)(8676002)(4326008)(8936002)(86362001)(2906002)(41300700001)(33656002)(38070700009)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C6689DD89A68442BDCBFD97E34E9BD3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5981
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2e204f13-4caa-4020-fe34-08dbdf25da1c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0FfJ9lswitazYj3yKc1tcQYSQt36mUCYss0IcIdh92oAZ7hiRgVQ3T6Eho1abY+pLeaB/t0ZbBNNFGxyhShRGPgMRzS6+q0+rztbOnOhAK0V/6cv4de/UylO4xTQ8jsWCI/jAQyhlBqoP0ujynN3Ah8bh605CLU5wYwqaIVIeTNjj9+l8dmtYVp2SUAroM11K504RurthsQO8N4wmBKcO29Sv7W95tx03PFRSetUXy/do6v7HmJeYr3jHkmmL3cXmmib3fqBrb8EJAmNT+kor7Frl7FMx1IhB0kO3rUFQHgWIJVXPxOEm/uw81dRGat7+oeBlIez77gxiXlLrc8M6EZWY1TCpgV0zbcfO1kojB4j7SnaGEpUQPGvPE99hPp8a7I+xW3v8Y22tCcjbT2AMaQyZHsYjod6OL4IPlj9FgCxXtNkUeaFdswwRL91osErdYAARS2X75imVcXmxNpRMR+o9Hl4O3P6AQTlsPbQV6PB7+kzIi1A8uTyHtTOVxb6j6MJ243S0duL8cyTZafcEQU9exIRw9aVWP0D7SEOYwHlgRdSs5aBDYPj6Oibi6Yw5SJmt3fnAuuyN9FaujgI97/0AAHDs90fvfdvscXNUV713zDsyWP+Ctqw8ALUk+vR8FameFRY+bH7O88IRoevwdY+ZnFQe8WtPKHUwRUDZ9OCQDUW3RWHtSEXFSrZVgxT8YKD9JKBMVrjoK2nf9JLmHeKqMtC3KGBB1kEXCM6asDb8oSM9mBrOgCSGP6PAxt/L5hJq5g9FDReXpJ7eWnQPM+r0GXdI8meY82eNL1fCbA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(136003)(39860400002)(230273577357003)(230173577357003)(230922051799003)(64100799003)(1800799009)(186009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(478600001)(41300700001)(6512007)(47076005)(53546011)(6506007)(2616005)(6486002)(6666004)(5660300002)(336012)(83380400001)(8676002)(8936002)(6862004)(4326008)(36860700001)(2906002)(26005)(54906003)(70206006)(70586007)(316002)(86362001)(82740400003)(356005)(81166007)(40480700001)(36756003)(40460700003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 00:09:59.9567
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7752b097-5ba1-49a4-c9d0-08dbdf25e1e9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8121

SGkgUm9nZXIsDQoNCj4gT24gTm92IDcsIDIwMjMsIGF0IDAwOjA2LCBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIDA2LzExLzIwMjMgMjoy
NyBwbSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPj4gVGhlIGN1cnJlbnQgaW1wbGVtZW50YXRp
b24gb2YgeDJBUElDIHJlcXVpcmVzIHRvIGVpdGhlciB1c2UgQ2x1c3RlciBMb2dpY2FsIG9yDQo+
PiBQaHlzaWNhbCBtb2RlIGZvciBhbGwgaW50ZXJydXB0cy4gIEhvd2V2ZXIgdGhlIHNlbGVjdGlv
biBvZiBQaHlzaWNhbCB2cyBMb2dpY2FsDQo+PiBpcyBub3QgZG9uZSBhdCBBUElDIHNldHVwLCBh
biBBUElDIGNhbiBiZSBhZGRyZXNzZWQgYm90aCBpbiBQaHlzaWNhbCBvciBMb2dpY2FsDQo+PiBk
ZXN0aW5hdGlvbiBtb2RlcyBjb25jdXJyZW50bHkuDQo+PiANCj4+IEludHJvZHVjZSBhIG5ldyB4
MkFQSUMgbW9kZSBjYWxsZWQgTWl4ZWQsIHdoaWNoIHVzZXMgTG9naWNhbCBDbHVzdGVyIG1vZGUg
Zm9yDQo+PiBJUElzLCBhbmQgUGh5c2ljYWwgbW9kZSBmb3IgZXh0ZXJuYWwgaW50ZXJydXB0cywg
dGh1cyBhdHRlbXB0aW5nIHRvIHVzZSB0aGUNCj4+IGJlc3QgbWV0aG9kIGZvciBlYWNoIGludGVy
cnVwdCB0eXBlLg0KPj4gDQo+PiBVc2luZyBQaHlzaWNhbCBtb2RlIGZvciBleHRlcm5hbCBpbnRl
cnJ1cHRzIGFsbG93cyBtb3JlIHZlY3RvcnMgdG8gYmUgdXNlZCwgYW5kDQo+PiBpbnRlcnJ1cHQg
YmFsYW5jaW5nIHRvIGJlIG1vcmUgYWNjdXJhdGUuDQo+PiANCj4+IFVzaW5nIExvZ2ljYWwgQ2x1
c3RlciBtb2RlIGZvciBJUElzIGFsbG93cyBmZXdlciBhY2Nlc3NlcyB0byB0aGUgSUNSIHJlZ2lz
dGVyDQo+PiB3aGVuIHNlbmRpbmcgdGhvc2UsIGFzIG11bHRpcGxlIENQVXMgY2FuIGJlIHRhcmdl
dGVkIHdpdGggYSBzaW5nbGUgSUNSIHJlZ2lzdGVyDQo+PiB3cml0ZS4NCj4+IA0KPj4gQSBzaW1w
bGUgdGVzdCBjYWxsaW5nIGZsdXNoX3RsYl9hbGwoKSAxMDAwMCB0aW1lcyBvbiBhIHRpZ2h0IGxv
b3Agb24gQU1EIEVQWUMNCj4+IDk3NTQgd2l0aCA1MTIgQ1BVcyBnaXZlcyB0aGUgZm9sbG93aW5n
IGZpZ3VyZXMgaW4gbmFubyBzZWNvbmRzOg0KPj4gDQo+PiB4IG1peGVkDQo+PiArIHBoeXMNCj4+
ICogY2x1c3Rlcg0KPj4gICAgTiAgICAgICAgICAgTWluICAgICAgICAgICBNYXggICAgICAgIE1l
ZGlhbiAgICAgICAgICAgQXZnICAgICAgICBTdGRkZXYNCj4+IHggIDI1IDMuNTEzMTMyOGUrMDgg
My41NzE2NDQxZSswOCAzLjU0MTA5ODdlKzA4IDMuNTQzMjY1OWUrMDggICAgIDE1NjY3MzcuNA0K
Pj4gKyAgMTIgIDEuMjMxMDgyZSswOSAgMS4yMzg4MjRlKzA5IDEuMjM3MDUyOGUrMDkgMS4yMzU3
OTgxZSswOSAgICAgMjg1Mzg5Mi45DQo+PiBEaWZmZXJlbmNlIGF0IDk1LjAlIGNvbmZpZGVuY2UN
Cj4+IDguODE0NzJlKzA4ICsvLSAxLjQ2ODQ5ZSswNg0KPj4gMjQ4Ljc3NCUgKy8tIDAuOTY1NjYl
DQo+PiAoU3R1ZGVudCdzIHQsIHBvb2xlZCBzID0gMi4wNTk4NWUrMDYpDQo+PiAqICAxMSAzLjUw
OTkyNzZlKzA4IDMuNTU2MTQ1OWUrMDggMy41NDYxMjM0ZSswOCAzLjU0MTU2NjhlKzA4ICAgICAx
NDE1MDcxLjkNCj4+IE5vIGRpZmZlcmVuY2UgcHJvdmVuIGF0IDk1LjAlIGNvbmZpZGVuY2UNCj4+
IA0KPj4gU28gTWl4ZWQgaGFzIG5vIGRpZmZlcmVuY2Ugd2hlbiBjb21wYXJlZCB0byBDbHVzdGVy
IG1vZGUsIGFuZCBQaHlzaWNhbCBtb2RlIGlzDQo+PiAyNDglIHNsb3dlciB3aGVuIGNvbXBhcmVk
IHRvIGVpdGhlciBNaXhlZCBvciBDbHVzdGVyIG1vZGVzIHdpdGggYSA5NSUNCj4+IGNvbmZpZGVu
Y2UuDQo+PiANCj4+IE5vdGUgdGhhdCBYZW4gdXNlcyBDbHVzdGVyIG1vZGUgYnkgZGVmYXVsdCwg
YW5kIGhlbmNlIGlzIGFscmVhZHkgdXNpbmcgdGhlDQo+PiBmYXN0ZXN0IHdheSBmb3IgSVBJIGRl
bGl2ZXJ5IGF0IHRoZSBjb3N0IG9mIHJlZHVjaW5nIHRoZSBhbW91bnQgb2YgdmVjdG9ycw0KPj4g
YXZhaWxhYmxlIHN5c3RlbS13aWRlLg0KPj4gDQo+PiBNYWtlIHRoZSBuZXdseSBpbnRyb2R1Y2Vk
IG1vZGUgdGhlIGRlZmF1bHQgb25lLg0KPj4gDQo+PiBOb3RlIHRoZSBwcmludGluZyBvZiB0aGUg
QVBJQyBhZGRyZXNzaW5nIG1vZGUgZG9uZSBpbiBjb25uZWN0X2JzcF9BUElDKCkgaGFzDQo+PiBi
ZWVuIHJlbW92ZWQsIGFzIHdpdGggdGhlIG5ld2x5IGludHJvZHVjZWQgbWl4ZWQgbW9kZSB0aGlz
IHdvdWxkIHJlcXVpcmUgbW9yZQ0KPj4gZmluZSBncmFpbmVkIHByaW50aW5nLCBvciBlbHNlIHdv
dWxkIGJlIGluY29ycmVjdC4gIFRoZSBhZGRyZXNzaW5nIG1vZGUgY2FuDQo+PiBhbHJlYWR5IGJl
IGRlcml2ZWQgZnJvbSB0aGUgQVBJQyBkcml2ZXIgaW4gdXNlLCB3aGljaCBpcyBwcmludGVkIGJ5
IGRpZmZlcmVudA0KPj4gaGVscGVycy4NCj4+IA0KPj4gU3VnZ2VzdGVkLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg0KQWNrZWQtYnk6IEhlbnJ5
IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4gIyBDSEFOR0VMT0cNCg0KS2luZCByZWdhcmRzLA0K
SGVucnkNCg0KDQo=

