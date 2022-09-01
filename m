Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2F15A9496
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 12:28:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396492.636640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oThPv-00036Y-RD; Thu, 01 Sep 2022 10:27:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396492.636640; Thu, 01 Sep 2022 10:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oThPv-00034Z-OJ; Thu, 01 Sep 2022 10:27:23 +0000
Received: by outflank-mailman (input) for mailman id 396492;
 Thu, 01 Sep 2022 10:27:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GjJJ=ZE=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oThPu-00034T-Fi
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 10:27:22 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20057.outbound.protection.outlook.com [40.107.2.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a900e964-29e0-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 12:27:20 +0200 (CEST)
Received: from AM6PR10CA0099.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::40)
 by GV1PR08MB8570.eurprd08.prod.outlook.com (2603:10a6:150:82::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 10:27:17 +0000
Received: from AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::9f) by AM6PR10CA0099.outlook.office365.com
 (2603:10a6:209:8c::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Thu, 1 Sep 2022 10:27:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT056.mail.protection.outlook.com (100.127.140.107) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Thu, 1 Sep 2022 10:27:15 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Thu, 01 Sep 2022 10:27:14 +0000
Received: from 8dee5113608d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 43EF156E-C611-4CC1-8133-B1B8996D306F.1; 
 Thu, 01 Sep 2022 10:27:08 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8dee5113608d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Sep 2022 10:27:08 +0000
Received: from AM9PR08MB7165.eurprd08.prod.outlook.com (2603:10a6:20b:41f::23)
 by PA4PR08MB6301.eurprd08.prod.outlook.com (2603:10a6:102:e9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 10:27:06 +0000
Received: from AM9PR08MB7165.eurprd08.prod.outlook.com
 ([fe80::d117:77a3:a165:3f55]) by AM9PR08MB7165.eurprd08.prod.outlook.com
 ([fe80::d117:77a3:a165:3f55%6]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 10:27:06 +0000
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
X-Inumbo-ID: a900e964-29e0-11ed-82f2-63bd783d45fa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Wl5MqOKiWJ7n9Dd+hM4q36FGvJYeG8xEQJNcXIgCbB7Ez+wf51wuYb99njd51C/YMBrJTYD0rors8BIg+Am3uWoBois9RxjqhwgOozKPpxxPW78bU4V2th0qWMl9F8VfArVwpJID+D9osc3ga0/Bjp4gJtB5id57jqk3Q28yslO/HDfc0mXqhCgaBUtOiYD9ix02lC2kSwM2WE2JUjPD4g2RcH7teFnyldGMcd65ELeqNAbjY1ShrWJULiAxFyUleEq/LQPOJKFi6cEmTLyh4r476wZMLYG40v+9wln8TbSl77A3Z/CjBPhoPQ5w9qSewBxvC6PnjNUZzpYD1VuJbw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpEOhq++szxWDXF4xQFsnoWVpbjQf7cyXJKT9fgBhVQ=;
 b=IxabaAGecWxmbzwsfdzVmVwWqFuqqle1zDZQ9XcF80V6r+hhpHsLY4XcevX0XGnwxQjwacVs9UsFb/elvzdzYry6odaBeqKaMSsBvd/FqmMVQ9p9tgIAu26zE+Yj3d0Oc+4J/nQO2PK8WRjJm1Z0iNGjP4PxreF+4QomX/vUXzWe+ZvFI3/D7Jn4Yal/91Q2Z5L0DSPJW7UNxwu3nGaLU5OG1nBsXYEWaEyC9vcnJFldgcR10bjLxnuEU6JkRdbzZM+382HiA4NQ9KIJwJE1C1oJ/81jzWwmDpVEHFTZRnK2Df5Fs1sp4FXf18T0y3JFE6nrmiH4o7pqjSCpt1Lfpg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpEOhq++szxWDXF4xQFsnoWVpbjQf7cyXJKT9fgBhVQ=;
 b=OpuYiAutrRtoS2K/M64/SsJ4ybPL2bNx191i5GrR3YI/6lvKGQi+JiVPDvtnE2lesRjePIRzkm7sQHJjBw9EB29jmB7D1/ua1ZS9qjXgdEwMrPjh6+nGvHnRCakn1o6+p0z7a12EyGIz1j6C0C+XoQmuoCTvoWKp6UOOfbC0Ung=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 36fe62fd522c0ee7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FANSJOYz9M0HixpINi+kgFR+xtYep1m70mnhdtUgDCSRRGKFYYN6fKb/T0jlfnX2M5Thz5q2bHLNK/+rO+SJN8VI6E/MWeeHYaTyWYqgAtI1PDs8z7n4vYEYF+VbzJAT2Pyn/o2sybyvriqGzOe/ujHF9uLe/aJK1dTaqUsS3fqeH0TjL+lGyifsBn9jAIgvjX+xIlJIV9Em/Wgq00Ly//8Zrj3PQUxVREfKSR64Pb2ptcxXrrC/xorcAbkLJFbEhX1iQ+2iTklfOq1hAUbdNYDP9HoF2AP119iE1ZlJHN1H2OckPkx2jgde49jGKi1UH/LNVZyixHIAZxh5Z7v3zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpEOhq++szxWDXF4xQFsnoWVpbjQf7cyXJKT9fgBhVQ=;
 b=fvNqEjtsG+BP2dpOiOH2IECRVqukjThcqo6KeowRL21TAcrgm0CbgqXeRRux5R7ZZ53FX2E1hhaNtY7ZmgbGNNNgYXvQvvZ8fH2y7tUGhlGIwJPyMyQX2YjFpT+Ldk+gL+SmAfpdcq0pBw+W98UaFucVON8e9VAO9fBSpB1SBJkXREDy5GGMVXK8F/cVUTt0+ibw1MmTFydzQEen8fMp3KW+JHf+VXzy38Y6r9rdorASGT+rSFzLFOKSIBMBZl2DCBkdYdN88zrHZHHmWn4z9sqSIYE1kH3ez4mz7f8PQyyjMcYc4457GCoG1ASEVhzGsvn74gQ+KhecsgxvCJqWlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpEOhq++szxWDXF4xQFsnoWVpbjQf7cyXJKT9fgBhVQ=;
 b=OpuYiAutrRtoS2K/M64/SsJ4ybPL2bNx191i5GrR3YI/6lvKGQi+JiVPDvtnE2lesRjePIRzkm7sQHJjBw9EB29jmB7D1/ua1ZS9qjXgdEwMrPjh6+nGvHnRCakn1o6+p0z7a12EyGIz1j6C0C+XoQmuoCTvoWKp6UOOfbC0Ung=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 01/10] xen/arm: smmuv3: Fix l1 stream table size in the
 error message
Thread-Topic: [PATCH 01/10] xen/arm: smmuv3: Fix l1 stream table size in the
 error message
Thread-Index: AQHYt8DukfAZB3LGK0y8Qp1jO3Tea62+JIcAgAxGuwA=
Date: Thu, 1 Sep 2022 10:27:06 +0000
Message-ID: <454DC664-25A3-4DA2-99F5-BAB20FD8A590@arm.com>
References: <cover.1661331102.git.rahul.singh@arm.com>
 <bd9bd6a259b99d4a0ebbfa914f54d8091b1865f5.1661331102.git.rahul.singh@arm.com>
 <a8675747-d445-173b-2e1d-f06577303371@xen.org>
In-Reply-To: <a8675747-d445-173b-2e1d-f06577303371@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 325efc1a-ff6e-4fd3-ee88-08da8c048a18
x-ms-traffictypediagnostic:
	PA4PR08MB6301:EE_|AM7EUR03FT056:EE_|GV1PR08MB8570:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 janergLdTUOQAgY3XaaInJc598ZY8KkGP2hzh2WCxz8Qpivs7TGcEtg1XC69yPGU79BjTaugbg+fV68NqqriXjg3GdO0wlgYpXeiD1WWuJxRFX/e79hT/bvA8cvwqvm/T4T8xih+xMB5NXXuEIQEK90uK7LIQgCZ8Ga3IRpX1yFqhJEX4hi2GVIxchvCbdFhzp9fiCDi55rOnyo0mfxjR6FAx4L0ZVVWnTOKpEmMzZuPZNGpmtXBcsnrt5Rl/oZO9B01LT6XxDIskqgXXs9slHPqCa67EMtQyW4Kjnb7PaHYQxt4CTaIjoUF73nRwv4yPgdq2cTRAe4KHgrwbIEglaaRxL0vApJmL+wHouHk8k3QGZz7HeplMv9uNhbEDguoAH7hxHge4tikd6Qs8wBvnjbiSzSNHNCgw6CcrkMOW5VL582dzC5fIBX/brBHtm9sKn0AHZ5b4N3l0Mpavh2P19Ggi6f2fT1Rjb38LIkR7y7k5cW1bNr37hWSsM2vvnMe5ZUpmExWF1ryo480XOLCUlV59CxMpTj/aTBNSdrkKgz4Er5Uh9jzGDo7qRExQHzFMXLBEozh7ihFOEDkgUW64JonFY3GC9R7iyHniyjGRJH97aGOzZFAF6FHgqPNIiniZahaC9fMK3yX0os8zJ8JD+pJKsA9RVGEgNKW405h5CCqnbwc6Bq3WxXbm8BBjcmmZOcdMkZWs4sh6eDRJ76brHcstz2KQxeERJwpjF6l54dHHR03Dvp5ENC7wT2TAlMiq/fEbYdVmNSDXXDlcEflBM2K/nrTfPoAllVOPLqFt3qOqzrDNfCy7Ief8vU8Td2w52kqoGI9Z+ciX2AzJc9Bpf0/8J5grUuRybSsL24nUrSVqMtgucVb3+YqtDYPNyHb
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7165.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(4326008)(64756008)(8676002)(26005)(6512007)(53546011)(6506007)(86362001)(8936002)(38100700002)(6486002)(966005)(478600001)(71200400001)(66446008)(91956017)(66556008)(66946007)(54906003)(76116006)(41300700001)(122000001)(6916009)(316002)(38070700005)(15650500001)(83380400001)(66476007)(186003)(33656002)(36756003)(2616005)(2906002)(5660300002)(45980500001)(473944003)(414714003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F1BDDDB802229A4083C3DDBA9A79EDEC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6301
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e15f0a1e-d776-40a1-5c6a-08da8c048516
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c15M1Ucs17MV/xTG9wrr56UKwAn/A/6ISstBXCk3PdAL1yZogw5MbGMLHzV9DHuMWLnXbf+ANtwoMW9RvaPTVJ5l+ldRm2npasGxuu/RntCtrLil7hyUuW8S2P2rPKijY7J92X4KcQYW/8v/Xp0iZz6JE6xjwJesMO9qadW0OSo/CaeZYezKWIPmScOm61bFqPBO7jh4kIswE0o+FFsyoCKIrdVBwtS/5UnnQkskppsTIa2qMyFCWaoqTyrmGhjyMKhNnLgMnZ7YuJgGE01haBgG5roQd4Tk2MZjpZN8Pfw+hMwxxoh24VjI9TwhMQduMq8+l1Qk2rh9oW3nDbLol4kkI1CXT6SZnqE/SpWAaDbyAA5XUBeRenWd+fgwStBcDEWJPsC/Nm/skxJps6gFzLdKJBdHHe70H58DNGivklSLguBH42/Bt6yOTaAB1W8Tp0qb9B8H5yIVjxWMUnMiI/kAPIHO/LhQUVZDgmiVJM3GU+mth7N/kBP22xaGBM/RqSmnUIZ4txxyUwzZS7sCLY3h6Au17Rf1RxSf1WtHHz7Hqw8WhmqOL6oSloPPQDGIcVvZKxe9J9seXZer3c9qpBbgolq44E+c1HVEYq1LAhfaFjytsLlKI6t1npGBz/q1bqAcnXup5Yeo3MZDdKJJ6YeSfBeYRquTNcNiVgT0jxydMKE1V6x+QxS35Lp9uUEqa/wk6E98STYq8aXRkaglqp2Pp1Lf3iP2wPAxfN23nBFvSdLFQEOh98yrQCVH/03csrjdN67hl85FvrwXbyE1VK2UBi1JT8CW1ouPJhSqRF6Lvw8bcvDr+a5lXGC51iKIoVrHI9KI/LbFPR+O80aufkFRqUxJpIBCXP1oqbVrRxdMEeRoSHPkJBcdG8w+Z1A3uCSYzbsimcLzBl5xRDxB9Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(39860400002)(346002)(136003)(40470700004)(36840700001)(46966006)(356005)(82310400005)(81166007)(54906003)(82740400003)(36756003)(316002)(36860700001)(40480700001)(53546011)(26005)(2906002)(6512007)(4326008)(70586007)(70206006)(966005)(6486002)(478600001)(33656002)(5660300002)(40460700003)(107886003)(2616005)(186003)(336012)(6506007)(86362001)(41300700001)(83380400001)(6862004)(8936002)(47076005)(8676002)(15650500001)(36900700001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 10:27:15.0369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 325efc1a-ff6e-4fd3-ee88-08da8c048a18
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8570

SGkgSnVsaWVuLA0KDQo+IE9uIDI0IEF1ZyAyMDIyLCBhdCAzOjU4IHBtLCBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpIFJhaHVsLA0KPiANCj4gT24gMjQvMDgv
MjAyMiAxNDo1MywgUmFodWwgU2luZ2ggd3JvdGU6DQo+PiBCYWNrcG9ydCBMaW51eCBjb21taXQg
ZGM4OThlYjg0YjI1YzM5ZWE0NmYyOGM0OGExNjliZGJkMGUyYzdlMA0KPj4gaW9tbXUvYXJtLXNt
bXUtdjM6IEZpeCBsMSBzdHJlYW0gdGFibGUgc2l6ZSBpbiB0aGUgZXJyb3IgbWVzc2FnZQ0KPiAN
Cj4gV2UgaGF2ZSBhIHRhZyBmb3IgdGhpcyAoc2VlIE9yaWdpbikuIElmIHlvdSB1c2UgaXQsIHRo
ZW7igKYNCk9rLg0KPiANCj4+IE9yaWdpbmFsIGNvbW1pdCBtZXNzYWdlOg0KPiANCj4gWW91IGRv
bid0IG5lZWQgdG8gYWRkICJvcmlnaW5hbCBjb21taXQgbWVzc2FnZSIgaGVyZSBhbmQgdGhlIGNv
bnRlbnQgaXMgZXhhY3RseSB0aGUgc2FtZS4NCk9rLg0KPiANCj4+ICAgICBpb21tdS9hcm0tc21t
dS12MzogRml4IGwxIHN0cmVhbSB0YWJsZSBzaXplIGluIHRoZSBlcnJvciBtZXNzYWdlDQo+PiAg
ICAgVGhlIGFjdHVhbCBzaXplIG9mIGxldmVsLTEgc3RyZWFtIHRhYmxlIGlzIGwxc2l6ZS4gVGhp
cyBsb29rcyBsaWtlDQo+PiAgICAgYW4gb3ZlcnNpZ2h0IG9uIGNvbW1pdCBkMmU4OGU3YzA4MWVm
ICgiaW9tbXUvYXJtLXNtbXU6IEZpeCBMT0cyU0laRQ0KPj4gICAgIHNldHRpbmcgZm9yIDItbGV2
ZWwgc3RyZWFtIHRhYmxlcyIpIHdoaWNoIGZvcmdvdCB0byB1cGRhdGUgdGhlIEBzaXplDQo+PiAg
ICAgaW4gZXJyb3IgbWVzc2FnZSBhcyB3ZWxsLg0KPj4gICAgIEFzIG1lbW9yeSBhbGxvY2F0aW9u
IGZhaWx1cmUgaXMgYWxyZWFkeSBiYWQgZW5vdWdoLCBub3RoaW5nIHdvcnNlDQo+PiAgICAgd291
bGQgaGFwcGVuLiBCdXQgbGV0J3MgYmUgY2FyZWZ1bC4NCj4+ICAgICBTaWduZWQtb2ZmLWJ5OiBa
ZW5naHVpIFl1IDx5dXplbmdodWlAaHVhd2VpLmNvbT4NCj4gDQo+IEFGQUlDVCwgeW91IGRpZG4n
dCBtYWtlIGFueSBjaGFuZ2UgdG8gdGhpcyBwYXRjaC4gU28gdGhlICJGcm9tOiIgc2hvdWxkIHN0
aWxsIGJlIGZyb20gWmVuZ2h1aSBZdS4gRm9yIGFuIGV4YW1wbGUgaG93IHRvIGRvIGJhY2twb3J0
LCBzZWUNCj4gOWM0MzJiODc2YmY1MTg4NjZkNDMxYmRhNzNmMmJlMTI1MGY2ODhlYiAieDg2L213
YWl0LWlkbGU6IGFkZCBTUFIgc3VwcG9ydCIuDQoNCk9rLg0KPiANCj4gQWxzbywgaXQgd291bGQg
YmUgZ29vZCB0byBjbGFyaWZ5IHdoZXRoZXIgdGhleSBhcmUgY2xlYW4gYmFja3BvcnQgYW5kIHJl
cXVpcmVkIHNvbWUgY2hhbmdlcyAob3RoZXIgdGhhbiBjb250ZXh0IGNoYW5nZXMpLiBJIGFzc3Vt
ZSB0aGV5IGFyZSBjbGVhbiBiYWNrcG9ydHM/DQpZZXMgYWxsIHBhdGNoZXMgYXJlIGNsZWFuIGJh
Y2sgcG9ydC4NCiANCkhlcmUgaXMgdGhlIGNvbW1pdCBtc2cgcGxlYXNlIGhhdmUgYSBsb29rIG9u
Y2UuIE9uY2UgeW91IGNvbmZpcm1lZCBJIHdpbGwgbW9kaWZ5IG90aGVyIHBhdGNoZXMgYW5kIHNl
bmQgaXQgZm9yIHJldmlldy4NCg0KQXV0aG9yOiBaZW5naHVpIFl1IDx5dXplbmdodWlAaHVhd2Vp
LmNvbT4NCkRhdGU6ICAgTW9uIEF1ZyAyMiAxNjoxOTowMSAyMDIyICswMTAwDQoNCiAgICB4ZW4v
YXJtOiBzbW11djM6IEZpeCBsMSBzdHJlYW0gdGFibGUgc2l6ZSBpbiB0aGUgZXJyb3IgbWVzc2Fn
ZQ0KICAgIA0KICAgIEJhY2twb3J0IExpbnV4IGNvbW1pdCBkYzg5OGViODRiMjUuIFRoaXMgaXMg
dGhlIGNsZWFuIGJhY2twb3J0IHdpdGhvdXQNCiAgICBhbnkgY2hhbmdlcy4NCiAgICANCiAgICBU
aGUgYWN0dWFsIHNpemUgb2YgbGV2ZWwtMSBzdHJlYW0gdGFibGUgaXMgbDFzaXplLiBUaGlzIGxv
b2tzIGxpa2UgYW4NCiAgICBvdmVyc2lnaHQgb24gY29tbWl0IGQyZTg4ZTdjMDgxZWYgKCJpb21t
dS9hcm0tc21tdTogRml4IExPRzJTSVpFIHNldHRpbmcNCiAgICBmb3IgMi1sZXZlbCBzdHJlYW0g
dGFibGVzIikgd2hpY2ggZm9yZ290IHRvIHVwZGF0ZSB0aGUgQHNpemUgaW4gZXJyb3INCiAgICBt
ZXNzYWdlIGFzIHdlbGwuDQogICAgDQogICAgQXMgbWVtb3J5IGFsbG9jYXRpb24gZmFpbHVyZSBp
cyBhbHJlYWR5IGJhZCBlbm91Z2gsIG5vdGhpbmcgd29yc2Ugd291bGQNCiAgICBoYXBwZW4uIEJ1
dCBsZXQncyBiZSBjYXJlZnVsLg0KICAgIA0KICAgIFNpZ25lZC1vZmYtYnk6IFplbmdodWkgWXUg
PHl1emVuZ2h1aUBodWF3ZWkuY29tPg0KICAgIExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMjAyMDA4MjYxNDE3NTguMzQxLTEteXV6ZW5naHVpQGh1YXdlaS5jb20NCiAgICBTaWduZWQt
b2ZmLWJ5OiBXaWxsIERlYWNvbiA8d2lsbEBrZXJuZWwub3JnPg0KICAgIE9yaWdpbjogZ2l0Oi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4Lmdp
dCBkYzg5OGViODRiMjUNCiAgICBTaWduZWQtb2ZmLWJ5OiBSYWh1bCBTaW5naCA8cmFodWwuc2lu
Z2hAYXJtLmNvbT4NCg0KZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9z
bW11LXYzLmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS12My5jDQppbmRleCBm
MjU2MmFjYzM4Li4zNDA2MDkyNjRkIDEwMDY0NA0KLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvYXJtL3NtbXUtdjMuYw0KKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUt
djMuYw0KQEAgLTIzNDgsNyArMjM0OCw3IEBAIHN0YXRpYyBpbnQgYXJtX3NtbXVfaW5pdF9zdHJ0
YWJfMmx2bChzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpzbW11KQ0KICAgICAgICBpZiAoIXN0cnRh
Yikgew0KICAgICAgICAgICAgICAgIGRldl9lcnIoc21tdS0+ZGV2LA0KICAgICAgICAgICAgICAg
ICAgICAgICAgImZhaWxlZCB0byBhbGxvY2F0ZSBsMSBzdHJlYW0gdGFibGUgKCV1IGJ5dGVzKVxu
IiwNCi0gICAgICAgICAgICAgICAgICAgICAgIHNpemUpOw0KKyAgICAgICAgICAgICAgICAgICAg
ICAgbDFzaXplKTsNCiAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsNCiAgICAgICAgfQ0K
ICAgICAgICBjZmctPnN0cnRhYiA9IHN0cnRhYjsNCg0KDQpSZWdhcmRzLA0KUmFodWwNCg0K

