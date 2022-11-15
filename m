Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 648B86291A0
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 06:42:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443723.698478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouoiC-0003E7-UU; Tue, 15 Nov 2022 05:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443723.698478; Tue, 15 Nov 2022 05:42:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouoiC-0003An-R2; Tue, 15 Nov 2022 05:42:20 +0000
Received: by outflank-mailman (input) for mailman id 443723;
 Tue, 15 Nov 2022 05:42:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=30Ns=3P=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ouoiB-0003Ah-85
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 05:42:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42acd2ee-64a8-11ed-8fd2-01056ac49cbb;
 Tue, 15 Nov 2022 06:42:17 +0100 (CET)
Received: from FR3P281CA0186.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a4::13)
 by DB8PR08MB5306.eurprd08.prod.outlook.com (2603:10a6:10:117::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.5; Tue, 15 Nov
 2022 05:42:13 +0000
Received: from VI1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a4:cafe::3c) by FR3P281CA0186.outlook.office365.com
 (2603:10a6:d10:a4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Tue, 15 Nov 2022 05:42:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT012.mail.protection.outlook.com (100.127.145.22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Tue, 15 Nov 2022 05:42:12 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Tue, 15 Nov 2022 05:42:12 +0000
Received: from 62078704a11a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0E44828C-8A6F-42D5-ADD4-20723F9B2040.1; 
 Tue, 15 Nov 2022 05:42:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 62078704a11a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Nov 2022 05:42:06 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AS8PR08MB6119.eurprd08.prod.outlook.com (2603:10a6:20b:290::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.7; Tue, 15 Nov
 2022 05:42:05 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684%5]) with mapi id 15.20.5834.007; Tue, 15 Nov 2022
 05:42:05 +0000
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
X-Inumbo-ID: 42acd2ee-64a8-11ed-8fd2-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XYI6VlvVQxIfL5gXU9hov6LxcV9z3W3QPV0yCWQi92TATERE8YQL60SbgeH7/akO4UUw9Uzr7w9k8kfzrOAfxhQAdicXFtDzHf5LcVUxcYhXb1wNTjbi/IXOzPnNVpFB+9spwjGLWY1Zi5bw7bhmmywPQyKwVSkLUPQ6WxRYSTG0kbayjtXMGt1HnasrgUJeSaXFSfXnJftYRuKaM7s+vTgh3fUmI+hasEPHpDAaVvoykTYC+nDxroAjOeA8RXkN/8GkJSUFgD4oMe0WP+zO4q8OyyUynH0S+4k1c3xEYssvX5X8H/39iFUCQUOiXS0R41liGKARWMIe1zyFPcD9rg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=db7451ttiCh7dV5ZMLW0rg0RU7rzdaVSd+BOQ0ZTPEM=;
 b=m0qbDA4hE72JPi2xn61jAqPWRF2mNPrxSTFMj/fdTg1Z+Zbseo7n1D7XFzSFPxyOIt9bydqRAghh9/MA+BgImxT7X+D3Tb4mx+KxZ0z8CQMZ4DAgkDtpwdnQJ3/OwSu3ryFVo0yz/JEOJNUfe0OduialhGWTbFnK+DALR0fp+hZjz6qjTtgm/MCcIuLDNOgVVFP4Kw6bA6s409ud5qVSI35BU1BghYRJEdLHHQNrK8/xO15jU88SXiZbcSc+olFQN0rhRwB88dxyxA4PtUKp9RbzGGz+CoCwu0+tvdPb2f02m/73pwYuElIFUfc1NUNE6zC6CYbG2ToeTjFbm7gqNQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=db7451ttiCh7dV5ZMLW0rg0RU7rzdaVSd+BOQ0ZTPEM=;
 b=2Wew6a4+tHjMp3Hj2SuuVyq7mVdf1alYfoL+06YiPXVH0DkToA+lVzGphiGt8p1B9NLsExe6vdg12NbqTuI7RL/JyUdMLvNBySXJDsXY/9GjNEE1+C7pWdUzbwTbjBs++9tLy9yoRYui6gJHfhMwO+CPYMVI96OVbewIhtsC2P8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XnwGltIHX0Ajx0E31m47ZCyKeDdkiL+wXUGxM6J1by3TCDdCkU5bbOSoRWTeJkTL0csrBlvZIpzubE1aO2MFOFHEkJqg7sEdMexXThhAdIv2R9U4RM//qQq0kSsW76VRGLpPF4sItDtKj3YtCxG2LCtfVsXN+WiKDS+wZUo3UgKrR7C6VKG0PdoBqaQ5XKpHI5jsGTxidG4S1ZzOqRs8XaMIoUAdGbtouPCd6NjxCO6NYVCfWs+1K8yifK+hdPF6nPcuL/2HMbK1359kLvWew9+nmaTtdbwJQ2UB9nCWzBVMlT8QwIjqzUWVzS2o/Kk0aHvHwSw8XgKl+C/v+nFyLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=db7451ttiCh7dV5ZMLW0rg0RU7rzdaVSd+BOQ0ZTPEM=;
 b=BtQpgLmynE9n+lQhcHrUgKeSYH/1uoscchmm6kZE0hyRJwbxJorHiP1WtyTDeIJ7YeLbjXVZFuBQgeAaDBqP+NONYTnfIeVh9u96fEUQ0hcLAp7C/wOzzvXvCiqJmMfcpRcbqgv758dkGRU4gXpLFkilEfUPEk+MV2hWlvTiOPQv/W+Tu0Xrt7r40lRb35vY2zQDxHuirF8oynHZW06z6elQZ9qb2SId89etYtfNXMI7RVK9YIvSEujE382oefp17/gobXaMiahcZgHQmYw/lpcQVgTokgJdOL9o5UmuzVamjv84Y/EyxiGOydpDwh7BvyTQ7XiphAyt5y0e4MPyCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=db7451ttiCh7dV5ZMLW0rg0RU7rzdaVSd+BOQ0ZTPEM=;
 b=2Wew6a4+tHjMp3Hj2SuuVyq7mVdf1alYfoL+06YiPXVH0DkToA+lVzGphiGt8p1B9NLsExe6vdg12NbqTuI7RL/JyUdMLvNBySXJDsXY/9GjNEE1+C7pWdUzbwTbjBs++9tLy9yoRYui6gJHfhMwO+CPYMVI96OVbewIhtsC2P8=
From: Wei Chen <Wei.Chen@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jiamei Xie <Jiamei.Xie@arm.com>
Subject: RE: [PATCH v6 05/11] xen/arm: define Xen start address for FVP BaseR
 platform
Thread-Topic: [PATCH v6 05/11] xen/arm: define Xen start address for FVP BaseR
 platform
Thread-Index: AQHY8DVkWYjGQuvcKkq0uEcag43TF64+1B8AgACyDEA=
Date: Tue, 15 Nov 2022 05:42:05 +0000
Message-ID:
 <PAXPR08MB742076D14962730FF69651009E049@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-6-wei.chen@arm.com>
 <a6417c35-e765-c5c5-1acb-90537d0335db@amd.com>
In-Reply-To: <a6417c35-e765-c5c5-1acb-90537d0335db@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 494239AF524BBC4091C55862EA06A8BC.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|AS8PR08MB6119:EE_|VI1EUR03FT012:EE_|DB8PR08MB5306:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c297a31-3382-48e7-94e3-08dac6cc254e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3YxFnavgaBWNP9RnMO9mqUxGjtovQo31+dMjyJyR9BUifOi9r0AOOrVJSbmfH6HzlJajCOY2AySPJbaJn/fWNTrJkNrkAMwwJIva0sC6hKbc276HCwEtiyUfOjUv72WXkCRuGMUa7fsq4shKCqL9mKCOizQmLyBRpvbulzWPZRZYvaH/6kLcPXT2YsqJe0QEa6za7ldNRcg6cg6I80ytSZRD9/LmiRp2EjJ7ATPNbDc/Ztug8ptHVzXvdmv7OxeEYpUh8cou6uk+DolzJr9xPULM5nj7UNY5au/cKybOt7EO6UEBE24HFJkUhjzl1QoX8jJswnLD+76kWJGyMBxWOyN6XtbdBfno/eYGOniJrpKvZUlcfo3FAuHjRHpjcCIWb5JewdlOLjz+lS5UyN3XfVedRgLfgzoQfd4vie8csOcZ1946mkiuGhfuqn9RhJXgNdQSZYrmRa6JFTCXttOI8AsOp//9zh7hedSlbrLRF93CzphcmKSlFbN3uSflRSasHs6Cw1vSWjVyA+vNLXpsW3UGj0aPI+oyU96tw9bvzvgTw8ERnblLreVNibCtlADxVWxUsH0w6FqqTzGlJDi7lFA9QfrF54R58NeYCTpM+F40XTi42P3qh74VAKA6saPCDu6H+HaVwEaVZBBDgiHAQO7pd8KkCUXTxdt/we1MSrh3dB6FPJMxYDITCEE0VcrpOGr5x/aX+G9sOnXJ995OYoCq31ZT5doopNMXvZh1kd0i4Wzs+NEUSsDW/4mUGd9QUclNfHSFd0FFbhNDNPBqFA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199015)(6506007)(7696005)(86362001)(55016003)(9686003)(54906003)(110136005)(38070700005)(478600001)(122000001)(71200400001)(38100700002)(186003)(2906002)(33656002)(83380400001)(8936002)(316002)(41300700001)(52536014)(66446008)(66476007)(64756008)(66556008)(66946007)(76116006)(8676002)(4326008)(5660300002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6119
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	15feb503-4deb-4a6d-351c-08dac6cc20bd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n7sOH6TjTmWJLpC46t3Bo3ZIYsMI0p6bcFYqcEuBezfrRgsMwXB5vS/knBp+4+WFOlehOzYy3N15b4AhdMqjATkRMKwsPPE1+IvU66kfdi048Ob0MRv7MDuBlcNH8NmEz4AmgdIQDf6z3sfLPtYuJbeAmS60Xe5k2yeZD4/a9XnHpD2HhiK3LuxH/OSNT5VKd9PolU3HHa5xJJCju/UfPewW0i22TQM2V8IeL/2X1mc6gUnxakXLRzETv//RedSR/4+AzM10SE6utmZZY1m4NZBiV8BMnz5Veji3IoyhyQrToJNXm7s5PGKI/AvclmqKA2Rw2FrwGJ7wYaSK64FlurIN88VlbwJEwNCd1OsoQMUCL+M6uX4vQCBp0R6waQiz6bzgbYV0TdndVCo72ZtEVvz3Skkn8jRaEV+2tUmwZVwi81828gldj6gUeyDGpKC/zgqKjfW1TuQJcvU7DWUfQh5abdsixpCj3vKX898vUmJDVEiyMlcYRdatAlvGKgFGxSQf5VhwXEtOcquvmuzW5c9u6HKd4R6DuQQ77EjE97CJ9f4LiShyIyWFqciTrl+CWMTRZJfHUPAUzzKVzK6lUYxYB9j6Sukaf6iY6fshCBo3VjvMqQutMRFSnco4crGj1FK9hj0O2PB7oMiRmvHsXmLpbWfGCcwzXU8GWgdTyitYKfJkf+kF1o7WjuSUz5re8S8YCRowTUvNsJRWAuMehxpQAwFp//aTV/NNfQ0ellK63HKOEg1zJSPv9D+l/b54BIMw/dKmNh0eoAfcJvyf3Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199015)(46966006)(36840700001)(40470700004)(36860700001)(83380400001)(86362001)(356005)(82740400003)(40460700003)(81166007)(2906002)(41300700001)(54906003)(5660300002)(52536014)(40480700001)(8936002)(7696005)(9686003)(6506007)(55016003)(8676002)(26005)(4326008)(316002)(47076005)(70586007)(478600001)(110136005)(70206006)(82310400005)(336012)(186003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 05:42:12.6787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c297a31-3382-48e7-94e3-08dac6cc254e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5306

SGkgQXlhbiwNCg0KPiA+ICsNCj4gPiArI2VuZGlmIC8qIF9fQVNNX0FSTV9QTEFURk9STVNfRlZQ
X0JBU0VSX0hfXyAqLw0KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL0tj
b25maWcNCj4gYi94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL0tjb25maWcNCj4gPiBpbmRleCBjOTNh
NmIyNzU2Li4wOTA0NzkzYTBiIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9wbGF0Zm9y
bXMvS2NvbmZpZw0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvS2NvbmZpZw0KPiA+
IEBAIC0xLDYgKzEsNyBAQA0KPiA+ICAgY2hvaWNlDQo+ID4gICAgICAgICAgcHJvbXB0ICJQbGF0
Zm9ybSBTdXBwb3J0Ig0KPiA+ICAgICAgICAgIGRlZmF1bHQgQUxMX1BMQVQNCj4gPiArICAgICAg
IGRlZmF1bHQgRlZQX0JBU0VSIGlmIEFSTV9WOFINCj4gDQo+IEkgY291bGQgbm90IHNwb3QgdGhl
IHBhdGNoIHdoaWNoIGludHJvZHVjZWQgQVJNX1Y4Ui4NCj4gDQoNClRoYXQgcGF0Y2ggaXMgbm90
IGluIHRoaXMgcGFydCwgaXQgd2lsbCBiZSB0aGUgbGFzdCBvbmUgb2YgTVBVIHN1cHBvcnQNCnBh
dGNoIHNlcmllcy4gWW91IGNhbiBmaW5kIGl0IGdpdGxhYiBicmFuY2gncyBmdWxsIHNlcmllcy4N
Cg0KPiBDYW4geW91IHJlbmFtZSB0aGlzIHRvIEFSTTY0X1Y4UiA/IFRoZSByZWFzb24gYmVpbmcg
dGhlIHVuZGVybHlpbmcgY29kZQ0KPiBpcyBzcGVjaWZpYyB0byBSODIgaWUgNjQgYml0IFY4Ui4N
Cj4gDQoNCkkgcmVuYW1lZCBBUk02NF9WOFIgKGluIFJGQyBwYXRjaCkgdG8gQVJNX1Y4UiBpcyBi
ZWNhdXNlICJBcm02NCB2OHIiIGlzDQpub3QgYW4gb2ZmaWNpYWwgQXJtIGFyY2hpdGVjdHVyZSBu
YW1lLiBUaGUgQXJtIG9mZmljaWFsIG5hbWUgaXMgQXJtdjgtUg0KQUFyY2gzMi9BQXJjaDY0LiBB
bmQgY3VycmVudGx5LCBNUFUgd2lsbCBvbmx5IGJlIHNlbGVjdGVkIGJ5IEFybTY0LCBzbw0KY3Vy
cmVudCBNUFUgY29kZSBjYW4gb25seSB3b3JrIGluIEFBcmNoNjQgc3RhdGUuIFdoZW4geW91J3Jl
IHRyeWluZyB0bw0KZW5hYmxlIEFybXY4LVIgQUFyY2gzMiBsaWtlIFI1MiwgeW91IGNhbiByZW1v
dmUgdGhpcyBsaW1pdGF0aW9uLCBhbmQgdXNlDQpDT05GSUdfQVJNNjQgb3IgQ09ORklHX0FSTTMy
IHRvIGRpc3Rpbmd1aXNoIGNvZGUgYmV0d2VlbiByODIgYW5kIHI1MiBjb2RlLg0KDQpDaGVlcnMs
DQpXZWkgQ2hlbg0KDQo+IC0gQXlhbg0KPiANCj4gPiAgICAgICAgICAtLS1oZWxwLS0tDQo+ID4g
ICAgICAgICAgQ2hvb3NlIHdoaWNoIGhhcmR3YXJlIHBsYXRmb3JtIHRvIGVuYWJsZSBpbiBYZW4u
DQo+ID4NCj4gPiBAQCAtOCwxMyArOSwxNCBAQCBjaG9pY2UNCj4gPg0KPiA+ICAgY29uZmlnIEFM
TF9QTEFUDQo+ID4gICAgICAgICAgYm9vbCAiQWxsIFBsYXRmb3JtcyINCj4gPiArICAgICAgIGRl
cGVuZHMgb24gIUFSTV9WOFINCj4gPiAgICAgICAgICAtLS1oZWxwLS0tDQo+ID4gICAgICAgICAg
RW5hYmxlIHN1cHBvcnQgZm9yIGFsbCBhdmFpbGFibGUgaGFyZHdhcmUgcGxhdGZvcm1zLiBJdCBk
b2Vzbid0DQo+ID4gICAgICAgICAgYXV0b21hdGljYWxseSBzZWxlY3QgYW55IG9mIHRoZSByZWxh
dGVkIGRyaXZlcnMuDQo+ID4NCj4gPiAgIGNvbmZpZyBRRU1VDQo+ID4gICAgICAgICAgYm9vbCAi
UUVNVSBhYXJjaCB2aXJ0IG1hY2hpbmUgc3VwcG9ydCINCj4gPiAtICAgICAgIGRlcGVuZHMgb24g
QVJNXzY0DQo+ID4gKyAgICAgICBkZXBlbmRzIG9uIEFSTV82NCAmJiAhQVJNX1Y4Ug0KPiA+ICAg
ICAgICAgIHNlbGVjdCBHSUNWMw0KPiA+ICAgICAgICAgIHNlbGVjdCBIQVNfUEwwMTENCj4gPiAg
ICAgICAgICAtLS1oZWxwLS0tDQo+ID4gQEAgLTIzLDcgKzI1LDcgQEAgY29uZmlnIFFFTVUNCj4g
Pg0KPiA+ICAgY29uZmlnIFJDQVIzDQo+ID4gICAgICAgICAgYm9vbCAiUmVuZXNhcyBSQ2FyMyBz
dXBwb3J0Ig0KPiA+IC0gICAgICAgZGVwZW5kcyBvbiBBUk1fNjQNCj4gPiArICAgICAgIGRlcGVu
ZHMgb24gQVJNXzY0ICYmICFBUk1fVjhSDQo+ID4gICAgICAgICAgc2VsZWN0IEhBU19TQ0lGDQo+
ID4gICAgICAgICAgc2VsZWN0IElQTU1VX1ZNU0ENCj4gPiAgICAgICAgICAtLS1oZWxwLS0tDQo+
ID4gQEAgLTMxLDE0ICszMywyMiBAQCBjb25maWcgUkNBUjMNCj4gPg0KPiA+ICAgY29uZmlnIE1Q
U09DDQo+ID4gICAgICAgICAgYm9vbCAiWGlsaW54IFVsdHJhc2NhbGUrIE1QU29DIHN1cHBvcnQi
DQo+ID4gLSAgICAgICBkZXBlbmRzIG9uIEFSTV82NA0KPiA+ICsgICAgICAgZGVwZW5kcyBvbiBB
Uk1fNjQgJiYgIUFSTV9WOFINCj4gPiAgICAgICAgICBzZWxlY3QgSEFTX0NBREVOQ0VfVUFSVA0K
PiA+ICAgICAgICAgIHNlbGVjdCBBUk1fU01NVQ0KPiA+ICAgICAgICAgIC0tLWhlbHAtLS0NCj4g
PiAgICAgICAgICBFbmFibGUgYWxsIHRoZSByZXF1aXJlZCBkcml2ZXJzIGZvciBYaWxpbnggVWx0
cmFzY2FsZSsgTVBTb0MNCj4gPg0KPiA+ICtjb25maWcgRlZQX0JBU0VSDQo+ID4gKyAgICAgICBi
b29sICJGaXhlZCBWaXJ0dWFsIFBsYXRmb3JtIEJhc2VSIHN1cHBvcnQiDQo+ID4gKyAgICAgICBk
ZXBlbmRzIG9uIEFSTV9WOFINCj4gPiArICAgICAgIGhlbHANCj4gPiArICAgICAgICAgRW5hYmxl
IHBsYXRmb3JtIHNwZWNpZmljIGNvbmZpZ3VyYXRpb25zIGZvciBGaXhlZCBWaXJ0dWFsDQo+ID4g
KyAgICAgICAgIFBsYXRmb3JtIEJhc2VSDQo+ID4gKw0KPiA+ICAgY29uZmlnIE5PX1BMQVQNCj4g
PiAgICAgICAgICBib29sICJObyBQbGF0Zm9ybXMiDQo+ID4gKyAgICAgICBkZXBlbmRzIG9uICFB
Uk1fVjhSDQo+ID4gICAgICAgICAgLS0taGVscC0tLQ0KPiA+ICAgICAgICAgIERvIG5vdCBlbmFi
bGUgc3BlY2lmaWMgc3VwcG9ydCBmb3IgYW55IHBsYXRmb3JtLg0KPiA+DQo+ID4gLS0NCj4gPiAy
LjI1LjENCj4gPg0KPiA+DQo=

