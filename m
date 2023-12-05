Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2DF8055C3
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 14:23:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647865.1011523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAVO3-0004kL-LM; Tue, 05 Dec 2023 13:22:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647865.1011523; Tue, 05 Dec 2023 13:22:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAVO3-0004h3-IK; Tue, 05 Dec 2023 13:22:55 +0000
Received: by outflank-mailman (input) for mailman id 647865;
 Tue, 05 Dec 2023 13:22:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QNL/=HQ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rAVO1-0004eT-KI
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 13:22:53 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20620.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63d484fa-9371-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 14:22:51 +0100 (CET)
Received: from AM0P190CA0010.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::20)
 by AS8PR08MB9792.eurprd08.prod.outlook.com (2603:10a6:20b:613::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 13:22:44 +0000
Received: from AM4PEPF00027A6A.eurprd04.prod.outlook.com
 (2603:10a6:208:190:cafe::b0) by AM0P190CA0010.outlook.office365.com
 (2603:10a6:208:190::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Tue, 5 Dec 2023 13:22:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A6A.mail.protection.outlook.com (10.167.16.88) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Tue, 5 Dec 2023 13:22:43 +0000
Received: ("Tessian outbound 5d213238733f:v228");
 Tue, 05 Dec 2023 13:22:43 +0000
Received: from a45ecf292b01.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BFBEAABB-8970-4A18-9BEE-8E45A0BC6725.1; 
 Tue, 05 Dec 2023 13:22:32 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a45ecf292b01.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 05 Dec 2023 13:22:32 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS4PR08MB7832.eurprd08.prod.outlook.com (2603:10a6:20b:51c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 13:22:30 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838%7]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 13:22:29 +0000
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
X-Inumbo-ID: 63d484fa-9371-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=O9lG0zyAo13dDoYVUCfdgc2peGnk68UNx7edcFd+AlbL1RasDFXw4/52NNp3n1B3ektYhWyTCICY1pMxjYuWaEPpdxRGs1Zo9vjO0RKGbzd/MAVF5g7ej/qJXFEqDd8JnRtUyJjCkOlxCm96WH7D+fU6J5zcoh1T9ZWJEJzL0yZa0m9/GeDuuPbMcolosR4qsqgY8jNGzgnoTkaz/Wa8kpj86SELcDJ6Uggenye7qyHq8vhdiB4NWXZ4/pRRSJO/dexp9K0YzovNL+TImmquTM0X3P8yXvbvDIqVOB0DdYGBxd+CnvUVTfH/HbiMm1AXnXO2P35IZYUVZKf6ZEg3Ag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ze7xFQ4WK5xmWyHHKeDjnMk0qaKjBqmLHcOq3uIH0L0=;
 b=jgD8YNvxNLUBQAUsW6fHcj84gpeVCRxKJyJoo8TmpZKBXi5kLkAJqgk28qOKAYo2EL/KL12JSPuB6DU2vRsY38JgrLcT3RVN65IeEvGrDu7jU7jbJO71cUBcRcHCNzsmQy60vpQa+OU9wBbShJezHLUzvB80mMRDxDLtRhHqZm+BYMSbQuHE/kJNfglbEPc70ZnaU9pz4NJjJF8rk5nAs1J9E4UXan7wdap/iYClKvWU2MGOEae7mU2Ej8x8Xwu8lLhoEmYN/C4Vh/yVo80SYcljxDSKsUXROz1pdcIwrmFy4BHrJBAIS+c74q8YtHGvpxHK/Uh9NaPM6DHAF/CIEg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ze7xFQ4WK5xmWyHHKeDjnMk0qaKjBqmLHcOq3uIH0L0=;
 b=PkXuABAOh964Wwq8P3L/h0nIMQBM+4gveU/WgkAewfDCjxNtLdbr/tcfTCcDBhFql/90Ql+wV9Im+mipvnU5Iz/jQC2FlmEPLgWf0dFh+GyTg5OtU1KGQhOtQ8x8C+jg3C/XXV6QFMNlEaHpHQGZRAIbjLHc413+U7L19AoNa+Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9bfb587bfab14422
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRbIi/lP2SYIvWdBXcGGw1w2eYP0GjLEtnHnpMePlfxV9tXpi2jnjneLXbffDkPh7l30XpZYbjxHDZm3YMo4aUyqSET4DDzYWZWCAClBnzBF60BTLdKiyWThWhQWVR8t8hpWJmM4qDOc8KJP958HJ1ONtBMSHe8q6ZZsEK18ReSk+fvE6A0NW5JObUhgiREavsDl2HmBrpuweHqaJAzOpSy+1ir8lL1zFjTzmBEuqrzhnPSJKO0ZRD45TjvZovBghCBZpNJyyYFyMJzBYHMd4UXCgBLlJxaDjSZz8MIu98gzdTciLy0HQR9eopiLFrxjtCBceIp5X71Yd8Pc3saeBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ze7xFQ4WK5xmWyHHKeDjnMk0qaKjBqmLHcOq3uIH0L0=;
 b=Hvf0yRNt/ZyPezPjU9n9oD8Jhjb2TJAT1a0sYI60GadrUF3OQzyXiVeyR7/KL6kwesMBhb4CqKICmiHzvp224GTPPZGhCYmRXwA7+xFUYs9QNUWJjWIWh2WR/io+KKPZMfOFqOdIRNmEl16RoJUCOY80iTV7UYuMiqCwUcIxyc5bdCtOO23qeDrFjXjvlivURde4MWEVhA3fxBn1clc5lI2+6HAk0nCQnVr8s3WB6gxv2uxjZwdKUqw9FW7CGNwdxLONq8yn/ViMxsyB+/T9rsWHxJ/L5YERT4gYkZUXTeLLpWb0PLJUtg3N/lh35dDTpybFX4wtyksvuo1WNKtGlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ze7xFQ4WK5xmWyHHKeDjnMk0qaKjBqmLHcOq3uIH0L0=;
 b=PkXuABAOh964Wwq8P3L/h0nIMQBM+4gveU/WgkAewfDCjxNtLdbr/tcfTCcDBhFql/90Ql+wV9Im+mipvnU5Iz/jQC2FlmEPLgWf0dFh+GyTg5OtU1KGQhOtQ8x8C+jg3C/XXV6QFMNlEaHpHQGZRAIbjLHc413+U7L19AoNa+Y=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <Michal.Orzel@amd.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>
Subject: SAF-* comment at the end of the line
Thread-Topic: SAF-* comment at the end of the line
Thread-Index: AQHaJ34YkUD/Uc9X1UGSJ1pz/QdYhw==
Date: Tue, 5 Dec 2023 13:22:29 +0000
Message-ID: <27B32A01-F4D9-4A92-BA16-F43D0AF4F29E@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS4PR08MB7832:EE_|AM4PEPF00027A6A:EE_|AS8PR08MB9792:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b3c9f85-ad58-40ff-b91f-08dbf59543d4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FgjhRcI8BObcKeMG6nADIBAco3w8LY3YvGxbVvbL9GLcvR92HPh/k9YZLex3Gcf22OPN5Uc2fxTdAyMnY4ZwNHtqohE7d+G4mDAaIc40sBURjhzrV1TFujnDPAoyD3UarwWjnIb/xg5U5+CDwSLBGt7CPBZ0UhgNWdRzFy5sefH1L/zkwfQg7KcUIoVityQmVmIT57oPPvAPLxDYN7oUzt7hw3IyGi33NNrsZbI2pLwUgk1ApzVUOdRyqy1+WGqvLWsuqSuvqANvFvpOdcUyVq80A9zBQTkmYxfM0yI6CBpPyBiGYdlYHB5xaS5qDCwVCCp1zqI0ay7tY3awUISnMjLofrh8yQeClI1NZ9AS03UkP5k3Eu28XZhQURsCMDg9Cds2ew36aPHRNA21agcw62iJJyZty1k1P6bFp1QMlxLp3V3EHMVVsO68mXwm558CZNBf+k3WAIZ6nfFSQdiuTL9T+vN5W82ewg/hybQWzkO2apJU0cmfVogpXWSch0csGUxM+OZsTuahZCmqjOFmlzv8gZUGjkds/cFQ3OzlHoWQt01X58PAy2XdDoDHLrHlD2jGcfhlDgFhbczn2doS39Y2AikTFkj8WQA3SeznAThz6hcq5IE1ySfef8ewD4fxKOvix9gemiYC4CtitTHp1g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(346002)(39860400002)(136003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(6486002)(478600001)(6512007)(2616005)(6506007)(26005)(71200400001)(316002)(66899024)(66476007)(91956017)(66446008)(64756008)(54906003)(6916009)(66556008)(66946007)(8676002)(86362001)(4326008)(8936002)(41300700001)(36756003)(76116006)(38070700009)(33656002)(2906002)(5660300002)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF5956C9056D734FA00B6BABD2574162@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7832
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a8e7ba3e-150b-4680-699d-08dbf5953b6f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1ECJ7dy0+tkjSZpON3oyzEG6Xf79ga2gcQyGdlx7ZsIo/+rDcQngk7TR8A+Ku7ZEfLyIr4Jms6QjwD+NM4PoHOxzUmCqFmZbaNwdheZl3qkIAVCKq4cqQUigZUICyjse8OA55dO4K0jGAXby9nLQNJVvLj0oUdYwnJ28sMfXYg6+/f8IKAUdd7ymp97/znhDVxzbrlqu2iHLLir1zzwdylPrC8os4Vlj5tqfuRhhgE/j1K3XfUlC5GNe50BRkMa5uQ2JDjVCuysnd08xC344JyzpHK6CfMFWzywLyyeiFN85etFvV0EeX0MWAtpGRSJjmqKqyOzTvgCtVyR6/nAb7RnlFNX61GQCnecvtIA8lDI3+0KJzHkjveeQ3/ChKVXtgIaQ+cVbMHwgV9jH9gv8oyhzK5pes16POkNsBj7mgwdj/3EP1xK2RsXD/5lzAEOjF14eIwfJrx3HeItWKXrmdS/3J51mqDZCw38B/3OsO8+qbnS8raunq2MQVk7efwvyuG74bgm3vPxzryOtIpUR542+AjEDCe2GtrCpczu8E0Y8vb+wY3w7ufsRtQD/z2oK/MVRDrxZN1KfYsL6s/fglQf/SzT3RFfB67G+fZDVVRUkWz6HynwMdZiy5p3sw+JY+zk6bhUFIEly/tpIAMZGvb30HttJqlN8Y6kQxWn6g7iddpSnPm1yCxW9wt/D70tCxfj25y6/06TPFXkoXbBB6V6m704g55iMsgV8plgkJHPepGyABqhtYTSiqeL2OmJY
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(396003)(346002)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(82310400011)(64100799003)(46966006)(36840700001)(40470700004)(40480700001)(40460700003)(6512007)(478600001)(6506007)(6486002)(8676002)(47076005)(2616005)(26005)(336012)(6916009)(54906003)(4326008)(70206006)(70586007)(8936002)(316002)(82740400003)(5660300002)(81166007)(66899024)(33656002)(36756003)(356005)(41300700001)(2906002)(36860700001)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 13:22:43.9535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b3c9f85-ad58-40ff-b91f-08dbf59543d4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9792

SGkgYWxsLA0KDQpJ4oCZbSB3cml0aW5nIHRoaXMgbWFpbCB0byBjb2xsZWN0IHRob3VnaHRzIGFi
b3V0IHRoZSBuZWVkIHRvIGltcHJvdmUgdGhlIFNBRi0qIGNvbW1lbnRzLg0KDQpJIHRoaW5rIHdl
IHJlYWNoZWQgYSBwb2ludCB3aGVyZSB3ZSBuZWVkIHRvIHVzZSBkZXZpYXRpb25zIGZvciBzb21l
IHZpb2xhdGlvbiB0aGF0IHdlIHdhbnQNCnRvIGtlZXAgaW4gdGhlIGNvZGUgd2l0aCBhIHByb3Bl
ciBqdXN0aWZpY2F0aW9uIGFuZCBhbiBpc3N1ZSB3YXMgcmFpc2VkIHdoZW4gdGhlIGNvbW1lbnQN
CmNhbm5vdCBiZSBwdXQgb24gYSBsaW5lIG9uIGl0cyBvd24uDQoNCmUuZy4NCg0KSWYgKCBjb25k
aXRpb24tMSAmJg0KICAgICBjb25kaXRpb24tMiAmJg0KICAgICAgWy4uLl0gKQ0Kew0KICAgIC4u
Lg0KfQ0KDQpGb3IgZXhhbXBsZSBpbiB0aGUgY29kZSBhYm92ZSwgaWYgdGhlIHZpb2xhdGlvbiBp
cyBpbiB0aGUgc2Vjb25kIGNvbmRpdGlvbiwgYnJlYWtpbmcgdGhlIGNvbmRpdGlvbnMNCnRvIGhh
dmUgYW4gZW1wdHkgbGluZSBiZXR3ZWVuIHRoZW0gZm9yIHRoZSBTQUYtKiBjb21tZW50IGlzIG5v
dCBpZGVhbCwgc28gd2UgY291bGQgbWF5YmUNCmltcHJvdmUgdGhlIGluLWNvZGUgY29tbWVudCB0
byBiZSB1c2VkIGF0IHRoZSBlbmQgb2YgdGhlIGxpbmU6DQoNCmUuZy4NCg0KSWYgKCBjb25kaXRp
b24tMSAmJg0KICAgICBjb25kaXRpb24tMiAmJiAvKiBTQUYtKi1zYWZlIFsuLi5dICovDQogICAg
ICBbLi4uXSApDQp7DQogICAgLi4uDQp9DQoNClRoaXMgbWlnaHQgcmVxdWlyZSBhbHNvIGEgZGV2
aWF0aW9uIG9uIHRoZSBjb2Rpbmcgc3R5bGUgdG8gYWxsb3cgdGhlIGNvbW1lbnQgdG8gb3ZlcmNv
bWUgdGhlIGxpbmUgbGVuZ3RoLg0KDQpCZXJ0cmFuZCwgZnJvbSBoaXMgZXhwZXJpZW5jZSB3aXRo
IHNhZmV0eSBjZXJ0aWZpY2F0aW9ucywgZmVlbHMgdGhhdCBhZGRpbmcgdGhpcyBmZWF0dXJlIGNv
dWxkIGJlIGVub3VnaA0KdG8gY292ZXIgdGhlIG1ham9yaXR5IG9mIHRoZSBjYXNlcyB3aGVyZSB3
ZSBuZWVkIHRvIGRldmlhdGUgYSB2aW9sYXRpb24gaW4gdGhlIGNvZGUuDQoNClVzaW5nIGl0IGNv
bnNpc3RlbnRseSBpbiB0aGUgY29kZSBiYXNlIGFzIHRoZSBvbmx5IHdheSB0byBkZXZpYXRlIGEg
dmlvbGF0aW9uIGNhbiBhbHNvIGhlbHAgdGhlIGFkb3B0aW9uDQpvZiB0aGUgcHJvamVjdCB0byBw
ZW9wbGUgd2hvIG1pZ2h0IHdhbnQgdG8gZml4IHRoZW0gaW5zdGVhZCBvZiBkZXZpYXRpbmcgdGhl
bSwgdGhlIG9ubHkgdGhpbmcgdGhleSB3b3VsZCBuZWVkDQp0byBkbyBpcyB0byBncmVwIGZvciBT
QUYtKiB0byBoYXZlIGEgcm91Z2ggaWRlYSBvZiBob3cgbWFueSBqdXN0aWZpZWQgdmlvbGF0aW9u
IGFyZSBpbiB0aGUgY29kZS4NCg0KUGxlYXNlIGxldCBtZSBrbm93IHlvdXIgdGhvdWdodHMgYmVm
b3JlIEkgc3RhcnQgdG8gaW1wbGVtZW50IHRoZSBmZWF0dXJlLg0KDQpDaGVlcnMsDQpMdWNhDQoN
Cg0K

