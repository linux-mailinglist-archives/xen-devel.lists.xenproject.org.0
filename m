Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E62F77E61CB
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 02:23:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629431.981695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0tl9-0003xf-5i; Thu, 09 Nov 2023 01:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629431.981695; Thu, 09 Nov 2023 01:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0tl9-0003wM-24; Thu, 09 Nov 2023 01:23:03 +0000
Received: by outflank-mailman (input) for mailman id 629431;
 Thu, 09 Nov 2023 01:23:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UNjr=GW=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r0tl7-0003f4-N6
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 01:23:01 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8502fe0c-7e9e-11ee-9b0e-b553b5be7939;
 Thu, 09 Nov 2023 02:23:00 +0100 (CET)
Received: from AS9PR06CA0764.eurprd06.prod.outlook.com (2603:10a6:20b:484::18)
 by DU2PR08MB7341.eurprd08.prod.outlook.com (2603:10a6:10:2f0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Thu, 9 Nov
 2023 01:22:56 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:20b:484:cafe::cb) by AS9PR06CA0764.outlook.office365.com
 (2603:10a6:20b:484::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Thu, 9 Nov 2023 01:22:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.16 via Frontend Transport; Thu, 9 Nov 2023 01:22:55 +0000
Received: ("Tessian outbound 385ad2f98d71:v228");
 Thu, 09 Nov 2023 01:22:55 +0000
Received: from 050143db9a9b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2F92A79E-FA28-422F-8AB9-5463DB6EF2D3.1; 
 Thu, 09 Nov 2023 01:22:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 050143db9a9b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 09 Nov 2023 01:22:49 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB9249.eurprd08.prod.outlook.com (2603:10a6:10:418::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Thu, 9 Nov
 2023 01:22:46 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db%2]) with mapi id 15.20.6977.019; Thu, 9 Nov 2023
 01:22:46 +0000
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
X-Inumbo-ID: 8502fe0c-7e9e-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Ho3H2tja2jEGaQ1Y92UOxz7G3lB2WNIH0sgKgzlDRqrBXhF2BdnnxNr42l4Uh3D+3pF+1trNDvH2S7XU58UD9nGNNM+2Q3wSnrut0nfl41V1qO1hGViWjZjyV9Wx9bSB/kQkKu66snlhz6kIvS/SVh8FYLtFHiekaJqbhZk4kjgb1DnuYxCWuqG0xEQ8zRMDWDvmFz4dIqXlFJBOUZO8XhSzpfQv+8KSqkiElCmwMZDPJBH6eZHoW9C6d3NAJJKxMbOKwSPaT6ZUpEgpWbJFh2cR+yNYr1mPpt0RAq0qve0s8/OTOM+ZJjKJq2qgDGh6rwaRdV5DZDqNUsl5H+PswQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOGYa65Y6bj9F0gfIBshg3N5r7jS0Ox3u7mbQtTrWBs=;
 b=aPASuR9jUotmb8LVcl7ZLD2Iy4YLKzo8MKEJOhphRXTxDZNPV9+1P3f8oRe+S9YnfsU3EWi4p2ZhC/N9FPRETxdPN3dUFXLxFKbLqeMRKBbrIj4qMlAc/9oSGHVipBSF6ONhP6O+SyCfmEF5qeyktls4gjfJSXVcFtpPcswbtIIntTJ/EuekNvXR+pjtvxf5AEqajH+J2GzJqK44i7PsH/VDzD812E2cd6FM+OOTIho3zqUOXpizXmimG9Gm+ytJiML1XYpfik5fab8FVttjF4+LEN9d2TpHNnPCb0oapojm/QV3jw2disFi5cs2PoYjS5m0DXFovMLZ0U62lcsfzQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOGYa65Y6bj9F0gfIBshg3N5r7jS0Ox3u7mbQtTrWBs=;
 b=pOmEQ1EO2+EVf/I1KTjlpOn3hYkUsU00mdrVgWRhhE1gKymO70sVwJgomItUECyudgovaAxweiHFD87IaazCgWsAwwB9Kv4sQ8g6FgYr9BtYhYmwbStHAQglkFEN6olEopfzFaH4d21j+XLzzPzn5OvZvwhtvei27VBoWMLCxFU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 058bac3eba953740
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNxYJ+zjXKLoTMjxzqtMJm5+f4qk6JqPsLIbMEeM+HIl1lMuiFySFJKEswzZUVOVH+amu1FmyZisb53yRxcO7uUazBeL/v2G3LAn04S8zQvoyyAmenDPXpyxdEJ+Tk6tF0bmL4yAN57D/klO3J03TRL6I+WLacE+o1VdyuJziQHmwczxx77ZwR4j6Uib/cFbB/r1+vCFe2ZGrhcAmRb5eEyuwRFFzcJjsqtMK4+Pvsm+4xg4nf0Cq5BmOlHyNfVqh52BpCg+xFFwpdOKdF4Mm1hQ5O3K5AAJlP9gcrD9J7Pn2V9QhE46xtPmWY7jCBDa3t26rlapaHRvyuLiYGxbZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOGYa65Y6bj9F0gfIBshg3N5r7jS0Ox3u7mbQtTrWBs=;
 b=bWS8SsNXvEWcS3Wo3/lMIrpPoN6JbHwt26ylgAGbpScIwZvw1C4cm0by3xiLs5O7iWpBvxTUm4xHFWDdc0zh2IteAqUmN1wkg2iHj/c7MA2jE63XCdrGhsGbhdxkA0456N2o1LBKSWh0tQLlmTKTYQVKyzc6CJaC5W9O/91RjCu/PZROVQ9/TXPRh/rENP4vLz0ZfFvMl+eJPwG6TWypUMaBg1szdeMi0DHId7jEuL/zBECA1eWObH0mIZ6pJ04hR4hQaw1brn4mSxCIBIUiSrLFQvmaHp5x5SomWAd2wjlGNib7N0WVwIeG2ksqsTjwTnxYzCddcLRYvPfx4gImgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOGYa65Y6bj9F0gfIBshg3N5r7jS0Ox3u7mbQtTrWBs=;
 b=pOmEQ1EO2+EVf/I1KTjlpOn3hYkUsU00mdrVgWRhhE1gKymO70sVwJgomItUECyudgovaAxweiHFD87IaazCgWsAwwB9Kv4sQ8g6FgYr9BtYhYmwbStHAQglkFEN6olEopfzFaH4d21j+XLzzPzn5OvZvwhtvei27VBoWMLCxFU=
From: Henry Wang <Henry.Wang@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH for-4.18 2/3] docs/sphinx: Fix syntax issues in
 exclude-list.rst
Thread-Topic: [PATCH for-4.18 2/3] docs/sphinx: Fix syntax issues in
 exclude-list.rst
Thread-Index: AQHaElgouQCqTbk0NEq6GmHeWdAzdLBwjF2AgAClYwA=
Date: Thu, 9 Nov 2023 01:22:46 +0000
Message-ID: <07BDA6A5-A7E3-4570-8FB3-1A39CE3AD8DE@arm.com>
References: <20231108152727.58764-1-andrew.cooper3@citrix.com>
 <20231108152727.58764-3-andrew.cooper3@citrix.com>
 <4477F755-39D5-4560-98F1-92D37343088F@arm.com>
In-Reply-To: <4477F755-39D5-4560-98F1-92D37343088F@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB9249:EE_|AMS0EPF0000019B:EE_|DU2PR08MB7341:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ac8982c-23dc-4bc4-e841-08dbe0c266d7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 H1h/tj8KIoRXI2dpTDNEwxL1X6IZswbrXVTYB1DkHIQiQz+Yln9re+l9Sde7s6muDP3ECE/xjx1wPfJ3ole9SJfqlqwaZJSCQYhs+Hklt1NZXkYsVCg9oc3ehqQLL6sjejNsOvd3ruJFex55xNbOq3gt0U9nMI2iPhhgPV+XjpuiRHxyPy9Bq5a42F6F207JD+4APuyaZmBB8/e7X6Uzf6xHkaw5Q4h/NHykMH2BU7f/QH3EnIced8iI7ko4FsEmrlXJNgvXClAtvaVL5gyTEPU3n+GF68+PU88cGUpPffhJ4snB7wHRygcGnYyq+qKDFggeOmf6L1Llavkzz55nl2pwwXEGvM+2x6k464CsoVCk/NZOSts8WWf8TzGoTR5FpmKXx3cpluew/lZVCPx7yhmQ9BLGFlepWuSe0DAuZ19qTBOGXMuB78SeHS+xLqW8Q0ZyGstOTjAQbjQ1URGHR8/lmwGOWBwj8UFZ02GyYCMnjii76EFG5CYvG6NeUfSWfRVzjLGSnOJnu8gaO83ylDH5CL8rhNZcd5GwVNf1DLVSm7+WiOkLj9kwnb9ljMRPmJgx2mXi7RXsM+5KjZgoh4CfZf0cSTuWjT2oUpEIPsjLGdWEVArDO+yaIofkukcnGZgT0efSP/f6qod6mc4l8fKTUTg4gvbwMK6rMAvpA4oIgsuXL/vCV4UowwToY3VY
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(136003)(376002)(396003)(230273577357003)(230173577357003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(8936002)(36756003)(4326008)(8676002)(41300700001)(38100700002)(5660300002)(2906002)(6512007)(53546011)(6486002)(66476007)(33656002)(54906003)(66446008)(64756008)(316002)(4744005)(86362001)(91956017)(66556008)(83380400001)(26005)(2616005)(122000001)(38070700009)(76116006)(110136005)(66946007)(71200400001)(478600001)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7386946F214D16479D2BB78315FF46BA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9249
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	de70b769-417b-4603-65f2-08dbe0c2618f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XgA/33EVFzo1KQ4rPMvxJwn0SkfGmEDqKCNByK73dzUBUS+CAcOoC9BZyEy/HYWGIeKL4VPeI24r2nD/UVWSoE2I4C0GzSfftI8EWkZ2aoGOLGSDvSYpNLlpMQwZoK6gxo+d56Y42TrWlxGClTexQJ7QQy6GRli+JZTXfCJkmIC5NSlNmFtlXylXycFEcDMKzPCYi9Ht+ctAfL5w9n9PWggGYA1LWczytyrOWY4c+HBDgMgFQaALt76M/XplSgAgFYZ/P24MGWQmfwSRCxXmt3CwYXu7wlKvWalLVASsQaWU3QmOcskizF0PU7KUHQYHvM+vHD+AfMYgQuaUhgLffoBJT1WK8KcKZBGIYZeGd/XT0WxD5R6fbtt1T4A3WKeICeyYrl/C5zKBYlQq0+T23YUUzoEpNdlxzGUoqDkwDli/kiUM2cJw75RDE/eJeB84pFOEdhWoU/+T4pjqwh1JLzpD4xyQOKefMpWfe99gZe+1MI73q3/T6YiMDybyqzt7Ne76w2Hj/8Or8UyvSCOTn7VRo54ZTlK8YJE5n4jxIQW2usv1cQfVbxMHxnKsoRIA7N3MWywFVPgnMbcfCykNWhV4cPZbCctZg8DctgpPhVWdQpuJvi4fhROGVr3VRDY6bknEdwuqEoCAf6E0nFGKk+RgKu2jSvb2XRBPpdGAasdsd6z3/KiEhjBCtxwrCkW5Nm7PxDBoa4/DsFkKALfJulN1r8I4og1VzJ7TXaM8pFR0I1qBMlI99heCadWPQw5Lsa1T20OW3IQCXcOvfFWt65EVatXN3ygxG8vBmftXIkI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39850400004)(136003)(396003)(346002)(230173577357003)(230273577357003)(230922051799003)(1800799009)(82310400011)(451199024)(64100799003)(186009)(46966006)(36840700001)(40470700004)(40460700003)(36756003)(33656002)(336012)(8936002)(316002)(8676002)(83380400001)(4326008)(70206006)(36860700001)(54906003)(110136005)(70586007)(5660300002)(4744005)(478600001)(6512007)(41300700001)(2906002)(47076005)(40480700001)(6486002)(6506007)(2616005)(53546011)(82740400003)(81166007)(86362001)(26005)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 01:22:55.6291
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ac8982c-23dc-4bc4-e841-08dbe0c266d7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7341

Hi,

> On Nov 8, 2023, at 23:30, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
>> On 8 Nov 2023, at 15:27, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>>=20
>> sphinx-build reports:
>>=20
>> docs/misra/exclude-list.rst:47: WARNING: Unexpected indentation.
>> docs/misra/exclude-list.rst:50: WARNING: Inline emphasis start-string wi=
thout end-string.
>>=20
>> Nested lists require newlines as delimiters, and * either needs escaping=
, or
>> put in a literal block.
>>=20
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>=20
> Thanks for that.
>=20
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


>=20
> Cheers,
> Luca
>=20
>=20
>=20


