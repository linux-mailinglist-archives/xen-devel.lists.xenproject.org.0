Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 151795F0C01
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 14:49:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414201.658358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeFRE-0002Qv-Gv; Fri, 30 Sep 2022 12:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414201.658358; Fri, 30 Sep 2022 12:48:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeFRE-0002P2-Dz; Fri, 30 Sep 2022 12:48:20 +0000
Received: by outflank-mailman (input) for mailman id 414201;
 Fri, 30 Sep 2022 12:48:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9lya=2B=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1oeFRC-0002Ow-2S
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 12:48:18 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140042.outbound.protection.outlook.com [40.107.14.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 269ed208-40be-11ed-9374-c1cf23e5d27e;
 Fri, 30 Sep 2022 14:48:15 +0200 (CEST)
Received: from DB9PR01CA0002.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::7) by VE1PR08MB5568.eurprd08.prod.outlook.com
 (2603:10a6:800:1a8::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 12:48:12 +0000
Received: from DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d8:cafe::54) by DB9PR01CA0002.outlook.office365.com
 (2603:10a6:10:1d8::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20 via Frontend
 Transport; Fri, 30 Sep 2022 12:48:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT020.mail.protection.outlook.com (100.127.143.27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Fri, 30 Sep 2022 12:48:11 +0000
Received: ("Tessian outbound 7e4a920b87c0:v128");
 Fri, 30 Sep 2022 12:48:11 +0000
Received: from 6dd2fec3417e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5367F612-DBC9-4400-8498-5755776CF933.1; 
 Fri, 30 Sep 2022 12:48:01 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6dd2fec3417e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 30 Sep 2022 12:48:01 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AS2PR08MB8901.eurprd08.prod.outlook.com (2603:10a6:20b:5f0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 12:47:58 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef%7]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 12:47:58 +0000
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
X-Inumbo-ID: 269ed208-40be-11ed-9374-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=O/lWuoDZS/+9lTTFcokIAProszSZwkX2QsUSIJ0gHKSERQAP+4Moh/7de1F0yqsGMPVxA84FP5MLuHFEep+CAUR0+TuLsv628hQBxa7HPz2uZXFE4zQmnYfNSbuCyVaMY6KZU1KxVOHZMGx+DWVWn/0EqFf8yrAvz3QNL8HSMsfUZ7IwblUL4Gl4NFYU2TyVsShJK//QMZdSVhht1RtsEvHO5U7eUcl7KWXCCdBCftPUd3dcOpvaYJGBW4J1VutLdx5hplduyWTFORaNLDTsN8HcW6RkWmjq2/IWOpdkr4KCr8dgEYDc8cMbP5VYxB18JmK4MmdrIAY8JCYzZHPn1Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TnTgGY9U3j/bL/Zn2HiBAWv15w+rYlWg7GYB2jmkKo=;
 b=ZVVU3QGUqbYzZrZjEh0EREKTvM3p3E8pcuvf1M1ZvjYFGTMBTLdkTbNzLMCar6xe35InvjZCZL1VuxmjklLbbW0GU+mpdAD5FOv6KBBSdezZqYcUCJVfdd9Oj/il0XLoU+eK5AId2FWGygLwsZ6T7co7XW/03JjlMAR/ghVm6n54dypqGErA6xr/rkRD/GSztR4eQVJQdlYl1n2TMWAmgvugqitwDlpKDuFxqg49N2VDx9I9qMor8cUm9Vko6SSVA86YoL0Bx1CLaBtruxlwIO9A5Jb4T2KIwLk4ygEDFuh9U8KOd0rJqY0qOErTbMJn2erLnPsPQqFhkqfdE4jZhg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TnTgGY9U3j/bL/Zn2HiBAWv15w+rYlWg7GYB2jmkKo=;
 b=yIRlLGrXdq8XBTRp36RbZFOXYyJiVXLGf9b9rnl4B3/+RhyUVSZ7mGMiWXbMR9AXWgVovNNdOuy+Y303AFOwPfk+5B+HCKZXxaQaTIi01494nqEXbNbksH7u1nyoocLFmvZ4nXmzyu202BARemdL3HNb6h1rUp+zqqEPoPNg6Rs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c9e7b0682d8b9abc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kfflKIS3xQBIxo4bZdDjn1qXWIiWL8FhqEjcNetYKVFAUMWEz6AXPWDDI27Xxo1+1gelMonLO+FSIK+uGOw1XYphGetcIlDBSnz5NpimeNucDlSVgm7NdfcrR+biL9l3UxWOM6Q10EqRER6dLnzZ9sCjvevSZW4GNOlgQ/hN7sBAX59AXRg2tokJKEvMiytqKn1MbwH3Pr/P1lM6Zn/iOIt5dfUy81+nchtgXTBCLtgAWdLmI286+3sG2GnwOTK67v2X/CWgmK+HIQbJyse420214RQQHH2C+Vt6BgT6YXGVoDZ0xx44LmQuuG3lpdikH+QDbdSMEUomKvMJCtg7tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TnTgGY9U3j/bL/Zn2HiBAWv15w+rYlWg7GYB2jmkKo=;
 b=hC/WFOKTxdzE0/H7ZM+gkCRSCQ1y0X0dYKDr9DyAZ91uSWYFpxSL/oxvVg5eoanAmmnxoE1MLCIk6JY0TpF9PrKHUlOBnYZU7EUnWv3CNX1f9G+e0fj2uKhcZeXDLMxd8UfrOPW2mnzrAMk4rmV2hP4f7Utgf7oiCm3eWJiXCMe3Ow/WU53EfPZqxtMoNRiXKb0eDxtpuAGe6qOmqJrvuNyeynfPCogYaZKhUyej3DG7cbYE3A5HWspZmDkrWPp/X0G7RtZFVcstL7zeveNIwXgzKwVcN57xO73wcpdgBn/OGuYyL8mdkJGN9Dg5vyotjiO7vMdHb6K9qhm5+1PVsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TnTgGY9U3j/bL/Zn2HiBAWv15w+rYlWg7GYB2jmkKo=;
 b=yIRlLGrXdq8XBTRp36RbZFOXYyJiVXLGf9b9rnl4B3/+RhyUVSZ7mGMiWXbMR9AXWgVovNNdOuy+Y303AFOwPfk+5B+HCKZXxaQaTIi01494nqEXbNbksH7u1nyoocLFmvZ4nXmzyu202BARemdL3HNb6h1rUp+zqqEPoPNg6Rs=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <volodymyr_babchuk@epam.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use to
 ordinary RAM
Thread-Topic: [PATCH][4.17] EFI: don't convert memory marked for runtime use
 to ordinary RAM
Thread-Index: AQHY1KFr9QM2MLmHw02Oz3qGbH+jNq337HYA
Date: Fri, 30 Sep 2022 12:47:57 +0000
Message-ID: <DA83C2B0-9023-43B9-8795-9B98DEAA9661@arm.com>
References: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
In-Reply-To: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3809:EE_|AS2PR08MB8901:EE_|DBAEUR03FT020:EE_|VE1PR08MB5568:EE_
X-MS-Office365-Filtering-Correlation-Id: ce9649e0-cdd9-4864-fdec-08daa2e20890
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 r7phDFEtQ7PJKw32maT+MOW/6jMSrcF17/Nk5kng/C/xpgQvy8XkWYs/qkQ9NzrO+++C6Vq0dJ+2tGGw2/32cVbAhQBbKjMoX9zf2Hqha6lnzr8+iIxgvilq/ajcxDWkYHJvaPcdgvz75KoIIrbQOSKaWqawDSR1jyxRwwHgqlTj7+YeZk/6/wLDA+lKOgrI3JMUBsHjTIPeCRu3ohKjflB+gbCQwhaTwjqMWsvW3U2KOzvP0wLVpdhBDB3UqEs/xV9kbLFYUeb01al1slEtgG3+Qw+UsrZeo6CtGcJQJQVg9IYELsOWh7wA7NeHmq6+6jutK/YfR+1NpiR4Ceg/93968530zV0X5bKyliG7bN6VQFCG8dYfb7eI/OcsUxc5rd7DgQsqUszhhjBCACkFSYgfuQ58+9RIrdBnFLypB1SyABOHNahnSlBIWDfJD9X9/MMPlKkSTLjVobywZdBYdxWfebNrfsnh3VOzPz97573FmNhVQBj0wO7rK4DM+3G92R9QShmPU4VAv1JQDZv/JJCx/eQD/+kZKe1zXBAnCzNJHNfTsRLaySYbmov40aiw7SlOTBzMYDt+CFzHGBDr/In/XNYuw+sf7EgRe6CY8vytVtxY+dmnfL1joAGe3gpL4aXKCmqtu6MpHn2LlDldkahElMPuSgb/yyKmBqIIqRdxkfPc1gmEx6+B/vmLUw7v0+3XHFmzSmiRlPh4hnFFliCh8o6XXiHAbi5715NlnOMV7TdV3UHe62foFpF9LI0P8bCGKRTpvwF8da4B/D0Id9j7bFWjTAlAi+OTYLS20ks=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(83380400001)(53546011)(6916009)(316002)(4744005)(5660300002)(8936002)(38070700005)(41300700001)(2906002)(76116006)(66946007)(66556008)(64756008)(66476007)(8676002)(66446008)(33656002)(91956017)(4326008)(122000001)(54906003)(2616005)(186003)(6486002)(36756003)(6512007)(86362001)(26005)(6506007)(478600001)(71200400001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <974668DDB4687B4B8B9392CC69821C5A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8901
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	348a4a7e-41d2-45c0-f829-08daa2e2004b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jx9sBs1tKRW2xezOoSpgNt4Awn7nhQNio0vPHT/V5WHw34/85JLkyHKnBxcvww5dsdsn8DXgpu/qKlK93SryoEGWYjscrrejpE7M/3QNFoRupKQWuK535xrDovXXCJQfEezOfjeidSxe8pCcIeB7c6rBrUV9YgrD9oOfkoAHmpvCDWi88KNQ8YL4js/zrbXSdo4fIJspYoSB/lzr0o5znMFH6HZg2RE4KcJBWecnILrA1f2FBlDE6Ji0nV9j7ZjOEab7dn/ZoAin8ZvmOWCElORgCEUzoNauYIvNhaBaZx0mm++8S4eHDSb/txh+dhxumbD9RFIajCt238/nUOKbqKlL40exy9nJ+ZP+zHh8+LUp3twrMmqjON3rfk56Fzq8sKm3E2NAyoGPezaInlpTtOq4Isyk9VoHvKCA+3R9cl7PPEx79K6OZyek5S5SZSxcWDAzblwq60oKozirajuLNKx5KBl1Q5oHubR8pxC/dsOXKJPmHdM4dMtAl90q2WQFecmLWUfH1lWF4Y9zKZFiezJ8/EBgsMEbbPjDsvg6BmhuMaVELRXOiZ1+61BSlA6NoZe2NmU/3/gPKJU18uCyNEEQYfwZS28TDYpCIFPztn2aAgOm5G8HKF7idfBzOkKNQzVvzCI4GzKgWm6cUaEFQHLDiBAlKmfvfZVkO3U6g4Y4IZ1Yj4t2FIaSp3aOsh41kySKxKQuGhipV8fp2k0m6wYw/MznkWVyBLGzO2U2AWMsZA6Fc+HTl/GrNav5uF0qeU8DH3HfIbhyuqJz2GK96w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(136003)(39850400004)(451199015)(36840700001)(40470700004)(46966006)(356005)(40480700001)(81166007)(36756003)(82740400003)(82310400005)(33656002)(36860700001)(47076005)(478600001)(6486002)(8676002)(26005)(6512007)(2616005)(2906002)(186003)(40460700003)(336012)(4326008)(70586007)(4744005)(53546011)(8936002)(6862004)(70206006)(41300700001)(86362001)(54906003)(316002)(5660300002)(6506007)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 12:48:11.6218
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9649e0-cdd9-4864-fdec-08daa2e20890
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5568

DQoNCj4gT24gMzAgU2VwIDIwMjIsIGF0IDA4OjUwLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gZWZpX2luaXRfbWVtb3J5KCkgaW4gYm90aCByZWxldmFudCBw
bGFjZXMgaXMgdHJlYXRpbmcgRUZJX01FTU9SWV9SVU5USU1FDQo+IGhpZ2hlciBwcmlvcml0eSB0
aGFuIHRoZSB0eXBlIG9mIHRoZSByYW5nZS4gVG8gYXZvaWQgYWNjZXNzaW5nIG1lbW9yeSBhdA0K
PiBydW50aW1lIHdoaWNoIHdhcyByZS11c2VkIGZvciBvdGhlciBwdXJwb3NlcywgbWFrZQ0KPiBl
ZmlfYXJjaF9wcm9jZXNzX21lbW9yeV9tYXAoKSBmb2xsb3cgc3VpdC4gV2hpbGUgb24geDg2IGlu
IHRoZW9yeSB0aGUNCj4gc2FtZSB3b3VsZCBhcHBseSB0byBFZmlBQ1BJUmVjbGFpbU1lbW9yeSwg
d2UgZG9uJ3QgYWN0dWFsbHkgInJlY2xhaW0iDQo+IEU4MjBfQUNQSSBtZW1vcnkgdGhlcmUgYW5k
IGhlbmNlIHRoYXQgdHlwZSdzIGhhbmRsaW5nIGNhbiBiZSBsZWZ0IGFsb25lLg0KPiANCj4gRml4
ZXM6IGJmNjUwMWE2MmU4MCAoIng4Ni02NDogRUZJIGJvb3QgY29kZSIpDQo+IEZpeGVzOiBmYWNh
YzBhZjg3ZWYgKCJ4ODYtNjQ6IEVGSSBydW50aW1lIGNvZGUiKQ0KPiBGaXhlczogNmQ3MGVhMTBk
NDlmICgiQWRkIEFSTSBFRkkgYm9vdCBzdXBwb3J0IikNCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiAtLS0NCg0KSGkgSmFuLA0KDQpGb3IgdGhlIEFy
bSBwYXJ0Og0KDQpSZXZpZXdlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0u
Y29tPg0KDQpJ4oCZdmUgYWxzbyB0ZXN0ZWQgdGhlIEVGSStBQ1BJIGJvb3Qgb24gdHdvIGFybSBi
b2FyZHMNCg0KVGVzdGVkLUJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+
DQoNCg0KDQoNCg==

