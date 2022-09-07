Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1655AFFA6
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 10:53:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401006.642669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVqoG-0000eX-MY; Wed, 07 Sep 2022 08:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401006.642669; Wed, 07 Sep 2022 08:53:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVqoG-0000bb-Ij; Wed, 07 Sep 2022 08:53:24 +0000
Received: by outflank-mailman (input) for mailman id 401006;
 Wed, 07 Sep 2022 08:53:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2HvF=ZK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oVqoF-0000bM-DU
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 08:53:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2086.outbound.protection.outlook.com [40.107.21.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86685fe8-2e8a-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 10:53:21 +0200 (CEST)
Received: from AM6PR04CA0057.eurprd04.prod.outlook.com (2603:10a6:20b:f0::34)
 by AS8PR08MB6280.eurprd08.prod.outlook.com (2603:10a6:20b:29b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Wed, 7 Sep
 2022 08:53:19 +0000
Received: from VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::b) by AM6PR04CA0057.outlook.office365.com
 (2603:10a6:20b:f0::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Wed, 7 Sep 2022 08:53:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT033.mail.protection.outlook.com (10.152.18.147) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Wed, 7 Sep 2022 08:53:19 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Wed, 07 Sep 2022 08:53:18 +0000
Received: from 9a7d2633eb94.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1B84BD8C-0255-4AEE-9BE0-848FE606AD7B.1; 
 Wed, 07 Sep 2022 08:53:11 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9a7d2633eb94.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 08:53:11 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU0PR08MB9847.eurprd08.prod.outlook.com (2603:10a6:10:444::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Wed, 7 Sep
 2022 08:53:09 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 08:53:09 +0000
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
X-Inumbo-ID: 86685fe8-2e8a-11ed-af93-0125da4c0113
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=GQOs5kisnbLVYaUT73RTw1k5TXnPFfLzUqk4cymfqoqUfwJwKX5CCo+aEq2l3AD1x4uTuNxlXm3z/PdE1Ajj2Q9qXNdUHJipObS3rpcAOamsu+/XURiTKy7suH0I9cwW4OsirjGVGbWef1RlLwbZ/e0QXyc4SwESw3lY/VRDdjFZhQxg3K3sRD08yE2g+UQfpqTEQchk8rEVW8mA46gAtEwdOshZ341t/mQDdDouaHoF8O9o9LmwYb7jJZyCLrWWvHqXgaPxFmm0MGreGXQ5ogQWJuI89HOZsolDibOX/7Xc5GjCd6M0ux61S1h1GotAkNUYEsRekZOtBpB9Xf8Uuw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aj9lsvqm8Rg65hyLIXtmGhhmT96oPyr4fyxqVrE0XSc=;
 b=TJOoO+8TcPV4/MreWJqq6kGoYPCvKKUJsSNohUwm1yLUKCvIkCzBYWGsioerRGfQTRl6wocx2iPF/mqa/O+88lOAZNGeab0AF+VkQro0VLhmbE0lEuYijK21E443ycXiouzNxqQ/RBxjhpQJkqel9It23woL4f6JnLISEBrZc3pP6qLdUfmyKC/GTmvzkvYrSZx4XKXRznyM8/4cbNRowJhW9UAwqo7TSqvPuSJBUjdtdebrzMQlsy1GuF0IRmmi5iaNfXIQH2F4OuPyssa3usiv/xKp1MNFED6/7CjacTH21iK/wpw5ax0iLNPBIepJblEXIe7UoWT8qLI3q4SvYw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aj9lsvqm8Rg65hyLIXtmGhhmT96oPyr4fyxqVrE0XSc=;
 b=0AIG95ROZ/b43bkcyPCcxEOZ7bjeBam4zoZiKAhDCHStNeAZvJmim5e0p752x9AB8yL6/t3QMjtYUPvel+CtQpS/ziFG7gcPnEnUAJHnewUsf9unWO7joOxp9BsLc9cN48jIqfl3KlAFx4fFOt1L7DKYERut5gC1d2EZTszt1Xo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8dda49ce62b7b37e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMirG2HiiqXKU3VvnsKs8P3yLUV/k4Ae4ep56fOOkE3V59VJSFvGXtLEDtViZ9O8rKZoupvINxIJcSBiQJbBvyeuJplkndlXjRFqFpo5ECUY9MRn0qJ/ZRSfH5V7L/HnRCSJTnNg90UHzhnCSVbZHtvz/Atd1ifP1O4GRDP4saPKX/2yYINV+ZeQoFy0QKHvYKhCC7VmLR3o7vx/TSurHc3aq35lLIG73xWt/lfMXpoJywXp6PriSHz13Po83ywkbqdU9QNBAqEsswhIOCrTimjjGdmAx45HJp+3uLEnoaqx3C4rPjE/4dpNKT1qasEx/E8huLvQ6b9yzaOPjkEhRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aj9lsvqm8Rg65hyLIXtmGhhmT96oPyr4fyxqVrE0XSc=;
 b=FP9saBOQfUUQmJ66JmjRQuQDsofmnxdi8AwvnWHqah/RL0J5llRwBA5pJg2tlcLqiHLMzUHGg9lnYtuXFd5Yht+w5awB0GG1KU99WDfyK8f4RB7RKRt3qCqUqHVZW217kcRV9RDIbDV8iYCV32gh7+9m5nfjBUTEpve9rXEI+Ebd6Vkw9fMyHu2Kr0+osZYD4K3lkQVN6EtyoRris1vJMOZ1TB1lUzQCMLxUDeTRhsJT68vtl+p05cLu2JRt16mhZP7qU+1pfiVeXkQM+Tq0t3d9bLQ+xMKJvftMmu75aq9SvcwFEFG7AD2BuhC0/UZVfGDMoXeS4iloWhRflJaovQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aj9lsvqm8Rg65hyLIXtmGhhmT96oPyr4fyxqVrE0XSc=;
 b=0AIG95ROZ/b43bkcyPCcxEOZ7bjeBam4zoZiKAhDCHStNeAZvJmim5e0p752x9AB8yL6/t3QMjtYUPvel+CtQpS/ziFG7gcPnEnUAJHnewUsf9unWO7joOxp9BsLc9cN48jIqfl3KlAFx4fFOt1L7DKYERut5gC1d2EZTszt1Xo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "leo.yan@linaro.org" <leo.yan@linaro.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: acpi: Include header file for version number
Thread-Topic: [PATCH] xen/arm: acpi: Include header file for version number
Thread-Index: AQHYweQzyVikzADCFE2Bfo+zYT5rgq3ToyoAgAABNgCAAAHYAIAABH8A
Date: Wed, 7 Sep 2022 08:53:09 +0000
Message-ID: <5C05BF68-C788-47AF-A967-338875740D49@arm.com>
References: <20220906113112.106995-1-leo.yan@linaro.org>
 <d8ae8cce-0b05-a920-7439-3a6f5c3520f3@xen.org>
 <DFE32545-1B8A-4121-9D34-FE121CF4D3A7@arm.com>
 <79fa1351-18e5-0a54-c50d-c9b09a6b3d9e@xen.org>
In-Reply-To: <79fa1351-18e5-0a54-c50d-c9b09a6b3d9e@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 316dc10d-c567-4981-9ef3-08da90ae697a
x-ms-traffictypediagnostic:
	DU0PR08MB9847:EE_|VE1EUR03FT033:EE_|AS8PR08MB6280:EE_
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xyF83/V3E0gptACQ3tUkeIRO19a9CQ7vF48/tZmvARH2BIrzuusCt54ZYXxCQYtpFefJBf7z7So6cVh8sSo5uDN4OqT73WbiuwWv6xNUEzdm7AhopFjW1dIS/RjimriW/cKA1pzYrjEsyvoMR899bru9yJvgdhTucCH+wrD2gcTI0tuNKi3EM89Q5JQMuquRWtfc0McAL8u+OetE8xrZuBrIYpp6QS/0RzvOt9h28Gz9Q0TkZnWw914HWesldhU+duR2/hGp5HD0FZ2PJp78g5HCndnxlqTS4a+X56GJpyIFkmxwiN4J8yvh57YP4fO+tWwRBBiwaqbaaxlnH6j6snqzRAckgdzrxBuIEwSwOp+uRr2teXaKUjSRDihThSWuo3ZCEH2vQGd/Enf0vYQn7rdRNGGQ46F/mIC/e/jZrOK23C2A9EQLEd0flpR+yyHqJx8CHL+fArkehhDGTHblJi6RzOjnOB7/sofk1P0Y0ZdzcvaWi8D09Q6Nf55hB+ruefahdVKV4EKCNEt6I4zQytGj0Lr1eq6X/nR9eZd8h3IN6MyqirCRRO1Xbb5oo5ZVakT2kv8Xt2S6OPTqBP8sLlLVJMj0SCkozFhYzmnQSSACx+TRngvFwHRMWNZb/wmw3xVXBCer+VeTGMXTa85gQcELwGhT3rL60znG79qOuV7S7gMqOPQO5frBtwWIJ3TdsrtevFFTzy8V0EcgFav7PUADl8TBxvEdQyhJVVlxkh2s8C5L0805Ocj59MvKgQONOCw5tPlPPHZAfs+DCSalLHvZ7UYCtow2Zg0jZA5qvQQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(83380400001)(186003)(6486002)(316002)(86362001)(6916009)(33656002)(71200400001)(38070700005)(41300700001)(38100700002)(54906003)(2616005)(122000001)(8936002)(91956017)(76116006)(66476007)(4326008)(66556008)(64756008)(66446008)(8676002)(66946007)(478600001)(2906002)(26005)(5660300002)(6506007)(36756003)(53546011)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <34AD469D83F4D74CB2D3A2FE61B9B989@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9847
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0b6dff16-679b-46dc-8128-08da90ae635a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hrOCIIyMe7Gp+lhqWCcia3nH9X4tw6bXWGmicfCUMQbx8pZUVl1antDFo9mzftqknqYIpmBP1HoZSeA8lVEpMD27OQNwwPXOwhIqQo0/Wkg54OUCD3cjtIv4ELGUq1Pg9kJYTHO6HXYV5wfpCl31VdnIDnmCmqthfkdWQRGeikEMxV4siYW3t/ipsCaSpb6XcDd6YdNluFmfsIqkevE2vi69O8rw+bfiLdC+4XSyt6UaazX/ipu+PIPDVkjU5KbDJO0+hWOQYETQEPKvsj0k538GjjfemQeFCSTt6p4pSimGQmI7XKyC8821xrwhBh0/4M4sK7CC01u64zO7OXPW9rn7m4DLaGKy/gpCbfsM/Wj+xaP5NHLuPTueqpqTnK5uJMdBlYphxdMVqCCNlAF8b0An3y/OxezUEbkNVgaFBXIYn1E5s2CUtxl9BDDKXpK++AM0uBZTeMvIf2YnOp2lfJ62A302nzuXXjNCF/cf6wKRe2fx4KAuBHOHJ2VywHh3k67OoSGg1CGqT5YnB2XxWlFQz0oGJ8+Yo8scxraoh6bKVUNsBSk5Gu7b3n8XTF9PPoaKgDIQLY90tXAWjn4CnQBUDy+PPcQoqBaUYnphsmd1W0ri+cPCT9Y/A9ReAfCrLEHeNVL06KaHBM63Vhb7Go2gmgp0MAdmcJcTHes4Dijls4LNHupmJa+fGwDvyokBxZKosRqvehIeOQ93W4PbxJ2YO9xUyca4VtcPbYcjkhJ1DsYnZU/ZjC8PbEsKWtoMJLs2lmfsDKKmhjwEOtTsmw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(396003)(376002)(346002)(46966006)(40470700004)(36840700001)(47076005)(186003)(81166007)(356005)(82310400005)(36860700001)(8676002)(336012)(36756003)(70206006)(70586007)(478600001)(54906003)(4326008)(316002)(6486002)(83380400001)(2906002)(53546011)(6512007)(26005)(40460700003)(8936002)(41300700001)(6862004)(33656002)(2616005)(5660300002)(6506007)(86362001)(40480700001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 08:53:19.3293
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 316dc10d-c567-4981-9ef3-08da90ae697a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6280

SGkgSnVsaWVuLA0KDQo+IE9uIDcgU2VwIDIwMjIsIGF0IDA5OjM3LCBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMDcvMDkvMjAyMiAwOTozMCwg
QmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+PiBPbiA3IFNlcCAyMDIyLCBhdCAwOToyNiwgSnVs
aWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4gSGkgTGVvLA0KPj4+
IA0KPj4+IE9uIDA2LzA5LzIwMjIgMTI6MzEsIExlbyBZYW4gd3JvdGU6DQo+Pj4+IE9uIEFybTY0
IExpbnV4IGtlcm5lbCBwcmludHMgbG9nIGZvciBYZW4gdmVyc2lvbiBudW1iZXI6DQo+Pj4+ICAg
WyAgICAwLjAwMDAwMF0gWGVuIFhFTl9WRVJTSU9OLlhFTl9TVUJWRVJTSU9OIHN1cHBvcnQgZm91
bmQNCj4+Pj4gQmVjYXVzZSB0aGUgaGVhZGVyIGZpbGUgInhlbi9jb21waWxlLmgiIGlzIG1pc3Nl
ZCwgWEVOX1ZFUlNJT04gYW5kDQo+Pj4+IFhFTl9TVUJWRVJTSU9OIGFyZSBub3QgZGVmaW5lZCwg
dGh1cyBjb21waWxlciBkaXJlY3RseSB1c2VzIHRoZQ0KPj4+PiBzdHJpbmcgIlhFTl9WRVJTSU9O
IiBhbmQgIlhFTl9TVUJWRVJTSU9OIiBpbiB0aGUgY29tcGF0aWJsZSBzdHJpbmcuDQo+Pj4+IFRo
aXMgcGF0Y2ggaW5jbHVkZXMgdGhlIGhlYWRlciAieGVuL2NvbXBpbGUuaCIgd2hpY2ggZGVmaW5l
cyBtYWNyb3MgZm9yDQo+Pj4+IFhFTl9WRVJTSU9OIGFuZCBYRU5fU1VCVkVSU0lPTiwgdGh1cyBY
ZW4gY2FuIHBhc3MgdGhlIHZlcnNpb24gbnVtYmVyIHZpYQ0KPj4+PiBoeXBlcnZpc29yIG5vZGUu
DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IExlbyBZYW4gPGxlby55YW5AbGluYXJvLm9yZz4NCj4+PiAN
Cj4+PiBBRkFJQ1QsIHRoZSBwcm9ibGVtIHdhcyBpbnRyb2R1Y2VkIHdoZW4gd2Ugc3BsaXQgdGhl
IEFDUEkgY29kZSBmcm9tIGFyY2gvZG9tYWluX2J1aWxkLmMuIFNvIEkgd291bGQgYWRkIHRoZSBm
b2xsb3dpbmcgdGFnOg0KPj4+IA0KPj4+IEZpeGVzOiA1ZDc5N2VlMTk5YjMgKCJ4ZW4vYXJtOiBz
cGxpdCBkb21haW5fYnVpbGQuYyIpDQo+Pj4gDQo+Pj4gTm93LCB0aGlzIG1lYW5zIHdlIHNoaXBw
ZWQgWGVuIGZvciB+NCB5ZWFycyB3aXRoIHRoZSB3cm9uZyBjb21wYXRpYmxlLiBUaGUgY29tcGF0
aWJsZSBpcyBtZWFudCB0byBpbmRpY2F0ZSB0aGUgWGVuIHZlcnNpb24uIEhvd2V2ZXIsIEkgZG9u
J3QgdGhpbmsgdGhpcyBpcyB1c2VkIGZvciBhbnl0aGluZyBvdGhlciB0aGFuIHByaW50aW5nIHRo
ZSB2ZXJzaW9uIG9uIHRoZSBjb25zb2xlLg0KPj4+IA0KPj4+IEFsc28sIHRoZSBwcm9ibGVtIG9j
Y3VycyBvbmx5IHdoZW4gdXNpbmcgQUNQSS4gVGhpcyBpcyBzdGlsbCBpbiB0ZWNoIHByZXZpZXcs
IHNvIEkgdGhpbmsgd2UgZG9uJ3QgbmVlZCB0byBkb2N1bWVudCB0aGUgaXNzdWUgaW4gdGhlIGRv
Y3VtZW50YXRpb24gKHdlIGNhbiBlYXNpbHkgYnJlYWsgQUJJKS4NCj4+PiANCj4+Pj4gLS0tDQo+
Pj4+ICB4ZW4vYXJjaC9hcm0vYWNwaS9kb21haW5fYnVpbGQuYyB8IDEgKw0KPj4+PiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
YWNwaS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9hY3BpL2RvbWFpbl9idWlsZC5jDQo+
Pj4+IGluZGV4IGJiZGM5MGY5MmMuLjI2NDllMTFmZDQgMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9h
cmNoL2FybS9hY3BpL2RvbWFpbl9idWlsZC5jDQo+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9hY3Bp
L2RvbWFpbl9idWlsZC5jDQo+Pj4+IEBAIC05LDYgKzksNyBAQA0KPj4+PiAgICogR05VIEdlbmVy
YWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4NCj4+Pj4gICAqLw0KPj4+PiAgKyNp
bmNsdWRlIDx4ZW4vY29tcGlsZS5oPg0KPj4+IA0KPj4+IFNvIHRoaXMgaXMgZml4aW5nIHRoZSBp
bW1lZGlhdGUgcHJvYmxlbS4gR2l2ZW4gdGhlIHN1YnRsZXR5IG9mIHRoZSBidWcsIEkgdGhpbmsg
aXQgd291bGQgYmUgZ29vZCB0byBhbHNvIGhhcmRlbiB0aGUgY29kZSBhdCB0aGUgc2FtZSB0aW1l
Lg0KPj4gSSB0aGluayB3ZSBzaG91bGQgY29tbWl0IHRoZSBwYXRjaCBhcyBpcyBhbmQgaGFyZGVu
IHRoZSBjb2RlIGluIGEgc3Vic2VxdWVudCBwYXRjaC4NCj4gDQo+IEkgdGhvdWdodCBhYm91dCB0
aGlzLiBIb3dldmVyLCBpZiB3ZSBkbyB0aGUgaGFyZGVuaW5nIGluIHRoZSBzYW1lIHBhdGNoLCB0
aGVuIGl0IG1ha2VzIGEgbG90IGVhc2llciB0byBjb25maXJtIHRoYXQgdGhlIHBhdGNoIHdvcmtz
IHdoZW4gaW5nZXN0ZWQgaW4gZG93bnN0cmVhbSBjb2RlIG9yIGJhY2twb3J0ZWQuDQo+IA0KPj4+
IA0KPj4+IEkgY2FuIHNlZSB0d28gd2F5IHRvIGRvIHRoYXQ6DQo+Pj4gIDEpIERyb3BwaW5nIHRo
ZSB1c2Ugb2YgX19zdHJpbmdpZnkNCj4+PiAgMikgQ2hlY2sgaWYgWEVOX1ZFUlNJT04gYW5kIFhF
Tl9TVUJWRVJTSU9OIGFyZSBkZWZpbmVkDQo+Pj4gDQo+Pj4gVGhlIGxhdHRlciBpcyBwcm9iYWJs
eSBsaWdodHdlaWdodC4gVGhpcyBjb3VsZCBiZSBhZGRlZCByaWdodCBuZXh0IHRvIGFjcGlfbWFr
ZV9oeXBlcnZpc29yX25vZGUoKSBmb3IgY2xhcmlmeS4NCj4+PiANCj4+PiBTb21ldGhpbmcgbGlr
ZToNCj4+PiANCj4+PiAjaWZuZGVmIFhFTl9WRVJTSU9ODQo+Pj4gIyBlcnJvciAiWEVOX1ZFUlNJ
T04gaXMgbm90IGRlZmluZWQiDQo+Pj4gI2VuZGlmDQo+Pj4gDQo+Pj4gI2lmbmRlZiBYRU5fU1VC
VkVSU0lPTg0KPj4+ICMgZXJyb3IgIlhFTl9TVUJWRVJTSU9OIGlzIG5vdCBkZWZpbmVkIg0KPj4+
ICNlbmRpZg0KPj4+IA0KPj4+IENvdWxkIHlvdSBoYXZlIGEgbG9vaz8NCj4+IFRoZXJlIGFyZSBh
Y3R1YWxseSBzZXZlcmFsIHBsYWNlcyBpbiB0aGUgY29kZSB3aGVyZSB3ZSB1c2UgdGhlIHN0cmlu
Z2lmeSBzeXN0ZW0uDQo+PiBXb3VsZCBpdCBtYWtlIHNlbnNlIHRvIGFjdHVhbGx5IGhhdmUgYSBz
dHJpbmcgdmVyc2lvbiBwcm92aWRlZCBpbiBjb21waWxlLmggYW5kIHVzZSBpdCBpbnN0ZWFkID8N
Cj4gDQo+IEkgdGhpbmsgc28uDQo+IA0KPj4gT3RoZXJ3aXNlIGlmIHdlIHN0YXJ0IGFkZGluZyB0
aG9zZSBraW5kcyBvZiBjaGVja3MsIHdlIHdpbGwgaGF2ZSB0byBhZGQgdGhlbSBpbiBhdCBsZWFz
dCAzIHBsYWNlcyBpbiB4ZW4gY29kZS4NCj4gDQo+IFRoZSBzb2x1dGlvbiBJIHByb3Bvc2VkIGFi
b3ZlIGlzIGVhc3kgdG8gaW1wbGVtZW50IHJpZ2h0IG5vdy4gTXkgZ3V0IGZlZWxpbmcgaXMgdHdl
YWtpbmcgX19zdHJpbmdpZnkgKG9yIGVsc2UpIHdpbGwgdGFrZSBhIGJpdCBtb3JlIHRpbWUuDQo+
IA0KPiBJZiB5b3UgKG9yIExlbykgY2FuIGNvbWUgdXAgd2l0aCBhIHNvbHV0aW9uIHF1aWNrbHkg
dGhlbiBmaW5lLiBPdGhlcndpc2UsIEkgdGhpbmsgd2Ugc3RpbGwgd2FudCBzb21lIGhhcmRlbmlu
ZyBmb3IgYmFja3BvcnRpbmcgcHVycG9zZS4NCg0KSSB0aGluayBhIGRlZmluZSBpbiBjb21waWxl
LmggdXNpbmcgc3RyaW5naWZ5IGlzIHRoZSBlYXNpZXN0IHNvbHV0aW9uOg0KDQojZGVmaW5lIFhF
Tl9TVFJfVkVSU0lPTiAiX19zdHJpbmdpZnkoWEVOX1ZFUlNJT04pIi4iX19zdHJpbmdpZnkoWEVO
X1NVQlZFUlNJT04p4oCdDQoNCkFuZCB0aGVuIGNoYW5nZSB0aGUgY29kZSBpbiB0aGUgZm9sbG93
aW5nIHNvdXJjZSBjb2RlIHRvIHVzZSBpdDoNCmFyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQphcmNo
L2FybS9hY3BpL2RvbWFpbl9idWlsZC5jDQpjb21tb24vZWZpL2Jvb3QuYw0KDQpATGVvOiB0ZWxs
IG1lIGlmIHlvdSBuZWVkIGhlbHAgb3Igd2FudCBtZSB0byBkbyBpdA0KDQpDaGVlcnMNCkJlcnRy
YW5kDQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

