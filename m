Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4907EC239
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 13:28:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633613.988613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Ezj-0000uZ-Pg; Wed, 15 Nov 2023 12:27:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633613.988613; Wed, 15 Nov 2023 12:27:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Ezj-0000ry-LK; Wed, 15 Nov 2023 12:27:47 +0000
Received: by outflank-mailman (input) for mailman id 633613;
 Wed, 15 Nov 2023 12:27:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8lFI=G4=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r3Ezi-0000np-2A
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 12:27:46 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e19fcd2-83b2-11ee-9b0e-b553b5be7939;
 Wed, 15 Nov 2023 13:27:41 +0100 (CET)
Received: from AS4P190CA0066.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::9)
 by DB9PR08MB6619.eurprd08.prod.outlook.com (2603:10a6:10:257::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Wed, 15 Nov
 2023 12:27:28 +0000
Received: from AM3PEPF0000A79B.eurprd04.prod.outlook.com
 (2603:10a6:20b:656:cafe::2d) by AS4P190CA0066.outlook.office365.com
 (2603:10a6:20b:656::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18 via Frontend
 Transport; Wed, 15 Nov 2023 12:27:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A79B.mail.protection.outlook.com (10.167.16.106) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.20 via Frontend Transport; Wed, 15 Nov 2023 12:27:27 +0000
Received: ("Tessian outbound 385ad2f98d71:v228");
 Wed, 15 Nov 2023 12:27:27 +0000
Received: from 485313b3ff44.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E6E0668F-7721-4160-ACE2-08ACD31806A6.1; 
 Wed, 15 Nov 2023 12:27:21 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 485313b3ff44.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 15 Nov 2023 12:27:21 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB6328.eurprd08.prod.outlook.com (2603:10a6:20b:33e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Wed, 15 Nov
 2023 12:27:18 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db%2]) with mapi id 15.20.6977.029; Wed, 15 Nov 2023
 12:27:18 +0000
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
X-Inumbo-ID: 5e19fcd2-83b2-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UFKHwN+DblJsPFvYB1jrZjM2O2xPhM/cvJIjXmxL5N2Mjaq212v18kXuGihsLc/GdwxtB3SfaLj8BQaH038IJQ72h9LiPa3Gb5PFyAECfFHplnfwoa2IjutRAJk46NOTVsb0bbP2XloZ5vwRjXmM4CidB64iuxs/oO0IQ/e69ZYvKJX3u2plJLakAF8lx47vsmnZvTTsm07ERUA7TxrnrNigvlWlcFy5UXvEFwkeORkGLqgxv+5sOmc6HPHkHTMdzzVW91wqD/fWFPbluNPXxAowbkBmX4Vq6hlk5bPhw3AQSzS5Cq/gtjq0g0hNDCsHQqWBbWWGtA+aaN59M+7Qfw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7I/nlqbGTccXTU5caPS75NMDyMPpLIm3NfBK2cAggZA=;
 b=bNC/aNx9MMGLnqTaO/U9UXLElDouoKVNqWhg6hZChndXdtVXsgFXcgcvyO/GEAwafsXNu3j5CQ/kIarI/ey7wC/TmGFQYa+ZOpNKlP1FwRTnu1kLZN+FcYzrxmjFeZp+hHueHDW7XliLr5zpcdYZv5tPmpjId8dK3/7BIVJ7o+LlzGCvteeU1nY6bkCzntsLKteZmycAKxer3p9jAZx66RdNBS+HQccxbCzOBnFT2AL97w/2kQr3NKGxLQgLZZ4qFd5rWiiHlH5AkOkb4UfRZsu2SphTF0vbkE+8gDYEeEB+IFR0mnPpq+uHSkQt5MUJzEejKe0yGwypgOcZShmqhA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7I/nlqbGTccXTU5caPS75NMDyMPpLIm3NfBK2cAggZA=;
 b=gA82GymkEQ2Gr1PZiovOdZBPGAc1KEQiwyq4kwevVRM8y2E6rthmj0aLdKon7TV//1Hc1alZcKEIjDMHGMUhyC9ll5I0Gzfo4WUIldcLge88ybqP5OjoZ+C/H+WZBn2OoYCSN5TtH0q90xBP6JEdpmYzGWu+QbAiWZZozYJ7gKM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6fc0943692a93314
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ijm6DBv1fIN5ZgICXbDUaIKgpG6OFoHbmHnFeVhKqOwpTIHSOcrPvwqA3aieV3Nil6u8BpBBvNEqTEF26oeRYx27p1+30iFw1R6RiZQ06EfaHHZGGeh2Us1vmehYdBWfG0lzbPYEYtQfMsJ56MFHmK8EFlllivM0m44jxj+fpXF4rfjTyPu5weTWje9ijKwLv9A14pMcOyN9xq79B5d5w3tbeh03jgYyopvlmTa1qeFtG7G7xE8Zzn1POnwwQRqrJDAvLaNeH3OkCL5XCXhrD8DZfKev2GlPFMQhYvZZB/k3JPewEWLc5ovgoW6gFzA/Pf3wJ/0CxXsr9IE6CUgFNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7I/nlqbGTccXTU5caPS75NMDyMPpLIm3NfBK2cAggZA=;
 b=LZB+ytkrnJBD6thgE6CjA/ujASkmvV7vRvi7pWUzatue+cEoBoWuVqemKvgeAB/xxOEF9Y6olgA0hnuXmaqS328nz/V0c4FMa4bDf2tQPp7BTcb5i79+Z68ck3wkjiA2I+ykFwdnLKNDNhfWXwk8b6dFhiA0nFG1hbgsZsX/Fcqq8xbnS/uy9Gm33J9/xgKiIFdTMy4JC0/9TtKs1bPz70CKiNz2+Rp6sumL3A8IoCGLJOX9WmQQhU2CMrJ1kPyXVwvhUtp+93ct+QUvG9fdK4SG4olHBMB6qaoxi9DLclTGzhRVFDTcuzCMksGehA+3deW9ZczRPqvNDDslK8waIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7I/nlqbGTccXTU5caPS75NMDyMPpLIm3NfBK2cAggZA=;
 b=gA82GymkEQ2Gr1PZiovOdZBPGAc1KEQiwyq4kwevVRM8y2E6rthmj0aLdKon7TV//1Hc1alZcKEIjDMHGMUhyC9ll5I0Gzfo4WUIldcLge88ybqP5OjoZ+C/H+WZBn2OoYCSN5TtH0q90xBP6JEdpmYzGWu+QbAiWZZozYJ7gKM=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH for-4.18] SUPPORT.md: Define support lifetime
Thread-Topic: [PATCH for-4.18] SUPPORT.md: Define support lifetime
Thread-Index: AQHaF72b8CvvI5/pmESXrW//HT9C3LB7Tp4A
Date: Wed, 15 Nov 2023 12:27:18 +0000
Message-ID: <AA42890F-2B1D-4DCA-939B-4F7BCB073891@arm.com>
References: <20231115121632.63868-1-julien@xen.org>
In-Reply-To: <20231115121632.63868-1-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB6328:EE_|AM3PEPF0000A79B:EE_|DB9PR08MB6619:EE_
X-MS-Office365-Filtering-Correlation-Id: 83a5a330-217f-484a-f9a4-08dbe5d63b18
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nctedayqTvR7w/YFgfvzL1aOL8N7775NA9XZmw2+Ji1AynH29NSMxaN96O1HT/0eYr5vYH9+9sgdAXe7n1aFuA+7zsqgAN71btxzKwGfG4qsRCmlfVnjljTv3PXO1lsY5l7bf6TYyEnrBhVSJzbSwvJScDCstZarFbfX1in5SLe7zcflAWPO/uANEy7uU2qT0ipcSvGAe7D1eqjlMfuiwqj6znYh/jx0GIIMbCsvrzbtBBm0BtwiQfFcXA5AJqUI7vFP40Scq8Wpshts0R/Z5UMnWmvEerjrFdTv7DC7o2Hktf+NWXKnbq1D4nHcrz1iyG7Vt1sGQo/AOq8p/iYr61TbRS/4JS3SU6PpueJgnos4ezZuaTYyB60yJv9V3aTjEOQJXSy6nFl6/I1MbqTmX4yWktOpZ12wrChrHZrihk//49oa9m5UKFCFRFsu6PyT/Xb8zgkz1gcY+E7YJHBRTJyqb0dMoJkHC/n84E9IgYXYcCVevkh8xBwc75591zDJ1+vNZ2+6WHDx7B/3tkUXUQlhts8W7EKOwW0gb0uM1dXMgFHDH6bCRFc9s2Ns5DAQd09Eu32DuUbf6bGtkWDq7LtpRT43/o/FFUKPbVUt25SmFOSC6sr+Jz0NdxiHGO9ysx4lmgY6mbEYO4anjLq5bQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(376002)(396003)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(33656002)(41300700001)(2906002)(4744005)(86362001)(5660300002)(8676002)(4001150100001)(66946007)(316002)(36756003)(76116006)(66446008)(64756008)(110136005)(91956017)(66476007)(38100700002)(66556008)(54906003)(8936002)(4326008)(38070700009)(478600001)(6486002)(83380400001)(122000001)(71200400001)(53546011)(26005)(6506007)(6512007)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8205EC886188945BC6B65B33143CB8A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6328
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ad0d71a6-4edd-4b8e-a0ca-08dbe5d63598
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l2v8LQdUoHSWkrGDAmpup69E8a227oi8XIUkQJ00pjPu8giCSQO1tyRe6i5qyCOEQEEuJ5rXqpRq32OUwx3/1irAxzbr0s4jHBW02jr2FO2ZapIw8R661W5P+OVfA/yQAr0b1wZfCNQd4PWoHvePv+5Z9xnbRACQANSRyVUFiXfzYVnRPF5lg/JHagOuI4iYlMsHh9jIY7p5vsGf9Ml+55o1VGnsDczpHQOJOh+4e7Akvh2YWxPQ6NDE6sy9QDsZLaTMMKCNWwkAjvsm1dXubrHCUNko4PBbGTwZeXAbxlh1jl0fCgjxQy7p4yb+Fk+ai6y+3a7vIBQsnpv2y17difCnkTCnS+qV0U1sRRHdP13fNfVPo/SLm18kPk7tLNdyfH1qzgVc7eQGoZzh3xcuFsQ6LsqXIoyK+gTuAlb1LhN5H510LN8r01/IegeMDUzIrjqk7UeBO5wgQZeOwbkeDwpu7FLqaber1AeF4/eoZtT0MAUHXrBYFwNXXz/f9NZosVwonk8hcoR+1i684JejJmYWFuSVvd4DwXQgKyFEEZ6N6SUyy78ZUY9OS/eEeOEm8pC71yIi73ReGUpvOgVLdTNwvmyNsYQFaQGtbN8LlyR+TOIPi9iq5TUGrRpsgETKvVvagDN0PVmie++trSMEaud6C+VBiZAL/KB7Wh1pgYYbs0KOpqga57USpDoqzUmrTnS92l+iJTncbPNrvGUNamFhoywO5EmYdyy+64kQS4Z3zPnUYUGE3o1PNIHSwrvT
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(136003)(346002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(82310400011)(46966006)(36840700001)(40470700004)(5660300002)(86362001)(47076005)(33656002)(6486002)(36860700001)(6512007)(356005)(81166007)(36756003)(316002)(4326008)(70586007)(8936002)(8676002)(70206006)(40480700001)(54906003)(41300700001)(4001150100001)(4744005)(2906002)(110136005)(40460700003)(336012)(83380400001)(26005)(2616005)(82740400003)(478600001)(6506007)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 12:27:27.9686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a5a330-217f-484a-f9a4-08dbe5d63b18
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6619

SGkgSnVsaWVuLA0KDQo+IE9uIE5vdiAxNSwgMjAyMywgYXQgMjA6MTYsIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxA
YW1hem9uLmNvbT4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFt
YXpvbi5jb20+DQo+IC0tLQ0KPiBTVVBQT1JULm1kIHwgOCArKysrLS0tLQ0KPiAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L1NVUFBPUlQubWQgYi9TVVBQT1JULm1kDQo+IGluZGV4IGZmZjRiNGM1YmFkNi4uYzQ1MjYzNWVi
NTUyIDEwMDY0NA0KPiAtLS0gYS9TVVBQT1JULm1kDQo+ICsrKyBiL1NVUFBPUlQubWQNCj4gQEAg
LTksMTAgKzksMTAgQEAgZm9yIHRoZSBkZWZpbml0aW9ucyBvZiB0aGUgc3VwcG9ydCBzdGF0dXMg
bGV2ZWxzIGV0Yy4NCj4gDQo+ICMgUmVsZWFzZSBTdXBwb3J0DQo+IA0KPiAtICAgIFhlbi1WZXJz
aW9uOiA0LjE4LXJjDQo+IC0gICAgSW5pdGlhbC1SZWxlYXNlOiBuL2ENCj4gLSAgICBTdXBwb3J0
ZWQtVW50aWw6IFRCRA0KPiAtICAgIFNlY3VyaXR5LVN1cHBvcnQtVW50aWw6IFVucmVsZWFzZWQg
LSBub3QgeWV0IHNlY3VyaXR5LXN1cHBvcnRlZA0KPiArICAgIFhlbi1WZXJzaW9uOiA0LjE4DQo+
ICsgICAgSW5pdGlhbC1SZWxlYXNlOiAyMDIzLTExLTE2DQo+ICsgICAgU3VwcG9ydGVkLVVudGls
OiAyMDI1LTA1LTE2DQo+ICsgICAgU2VjdXJpdHktU3VwcG9ydC1VbnRpbDogMjAyNS0xMS0xNg0K
DQpJIHRob3VnaHQgd2UgaGF2ZSBhIDMgeWVhcnPigJkgc3VwcG9ydCBsaWZldGltZSwgc28gbWF5
YmUgaXQgc2hvdWxkIGJlIDIwMjYtMTEtMTYsIGJ1dCBub3Qgc3VyZQ0KaWYgaXQgaXMgc3RpbGwg
dGhlIGNhc2UuDQoNCkkgd2lsbCBsZXQgSmFuIHRvIGRvdWJsZSBjaGVjay4gTXkgcmVsZWFzZSBh
Y2sgc3RpbGwgaG9sZHMgb25jZSB3ZSBoYXZlIHRoZSBjb25jbHVzaW9uLg0KDQpLaW5kIHJlZ2Fy
ZHMsDQpIZW5yeQ0KDQo+IA0KDQo=

