Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFXJHj+yAWppigEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 12:41:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A92F350C08E
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 12:41:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1305988.1578085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMO4D-0002bA-MY; Mon, 11 May 2026 10:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1305988.1578085; Mon, 11 May 2026 10:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMO4D-0002YX-JO; Mon, 11 May 2026 10:40:53 +0000
Received: by outflank-mailman (input) for mailman id 1305988;
 Mon, 11 May 2026 10:40:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wMO4B-0002YR-L4
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 10:40:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMO4B-005pqu-1z
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 12:40:51 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a01b221-e002-0a2a0a5209dd-0a2a450cd6ba-34
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 12:40:50 +0200
Received: from [40.107.162.45]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a01b231-62f1-0a2a450c0019-286ba22d5cbe-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 12:40:49 +0200
Received: from DUZP191CA0047.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::14)
 by DU4PR08MB11269.eurprd08.prod.outlook.com (2603:10a6:10:61d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 10:40:44 +0000
Received: from DB5PEPF00014B8F.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::fe) by DUZP191CA0047.outlook.office365.com
 (2603:10a6:10:4f8::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 10:40:44 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8F.mail.protection.outlook.com (10.167.8.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Mon, 11 May 2026 10:40:43 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DB4PR08MB9287.eurprd08.prod.outlook.com (2603:10a6:10:3f5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 10:39:37 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 10:39:37 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SEEMIO0ytTT9Lp6NuFQzrkaQ+B9Ntk4KhvfFApZokBOJMkwBeMGHfQhfJD6mQR7x1MNjm/tchEZ45SSfWLLd8NUMM040MnFfWrzeei70Rr6rhQaJiqJ4cqYRSu7Xy2xCa9SqWq/eD64Kqe+F8ELozRGiEEKfS+LBWUL0TSgNguLxgW0l0yyPLe//PJu+D4c7U+dWgLGjfLn8C1b/NADhpNhSMQtbatr9/xCXutJ6uTmLEK0ohs6wanzIAAdCZwt1TqbswRDC+anTqLyvIfKejTE1v8yBuQN/D8+bthRFg2hlE6rMZcfS57KYr+sfpIiBKH+pZ50voyWQy9DK73egJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JgJDG/5mgcxmN6oUqi5VaSKghnPgVzUskTU5CM0QXBY=;
 b=OHj2pzH0PiYxul5lrUJbEDPRARzmwXnrFnkAN/dkVcx3kg2pdZOx/hCfoGsHQ/ZrTg+04sfklPbrQrkVFK+On5iIto3XGbbsI0xo1K9b9JBZonfQN3ieFde+6OEHyHyIf1tvSi4UVPo8mu9U+mpMPnQ1JQN1uQyCUs9xVff+R/88DzQPu2DnTTa/coBh4emp+tRppwqtIawF4G7zUJiIL+Rq40Wh1HzThoGFQjk4pb8mWlpJJpM632R7aIM95GEWX64DFOMtJ1N5wxpPl2iNnrC1UjZr9ZpwYzQriykZVu09EUIGiY8e9RclDMDM/wwW2/7R/ASjZweEbe8o2lzcMA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgJDG/5mgcxmN6oUqi5VaSKghnPgVzUskTU5CM0QXBY=;
 b=eXRYVoA3tLOxHLCb2/NSO2hWm9vepT+MwaN79tBaSrx2f5M4zKjvXVV9R5FCKXGkOnZ+AB2QOXqznXLjGKqr/tvUXKobqFPLACpDbtjZHy9KNKHkVzg/EdYFUDSE5yBeZXivzTbUOoKiCRJ1MP1QyEQNSBnlsDgTFFWZwaYZXwM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ls1VG1c/t7wbh7+f4aUZl++LmtLPz2r/rSk6CgvMiBCosRc8vhgDl2ZRtSNcoO0Gmr6rR6uV6VyEbQFwdQL/IfpjUuA+9OfIYxAiG2GOw6uBjxIEwUw6mWcm2/SLbRYZNsYP/qrE55zMAFgmn+Wuqp5bfopt2aiXWRJZenihqdZbX340JwpFuBSU9M0uu8GG/3kjKTe/X+cV0L3Zd8jxwfoDoDgR1fOYmhySNK1bVRsQoWa2bIUzx4R24i8ZuGE8uhqIQXuuGoKIm/eJNhspjtzwuFH2fw//4rMOPWDAE4SpZ3z++CoJLF89NQpN4b2ALwQUdZxpXQX5Z5HTd9m3pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JgJDG/5mgcxmN6oUqi5VaSKghnPgVzUskTU5CM0QXBY=;
 b=nenKPSvEYwUalweBnXPkBgy0rCAGDQ1/7Q48LR+uJlLmsGlM5xZ0nQJQ3P9/3FSdMaFdDKDQGs7upIzd0JpCqEIcm903V68oC3ovzd8Q6kXytKvwwIaYLaN6GeOStCMqROqkY3BuWcBeWjWovlJHZ7DAU3BaDygFzhFElKAuMTYa5rRLLxs9kqM1rgTP7n7MLYhWoK9zFHf2TRCj4tn83uBDSpKK82txgmU8YcqWwonwVQeDnMpC7BNM9iRR4lZu4VWcLxHbf96hrFLjwr8/aCTA5bRwxDuWZ9b3EddpoUt4j5l+cTvDzHe5AsCBMpsfzqrwG/DGnDwhbji0/1RTfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgJDG/5mgcxmN6oUqi5VaSKghnPgVzUskTU5CM0QXBY=;
 b=eXRYVoA3tLOxHLCb2/NSO2hWm9vepT+MwaN79tBaSrx2f5M4zKjvXVV9R5FCKXGkOnZ+AB2QOXqznXLjGKqr/tvUXKobqFPLACpDbtjZHy9KNKHkVzg/EdYFUDSE5yBeZXivzTbUOoKiCRJ1MP1QyEQNSBnlsDgTFFWZwaYZXwM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Harry
 Ramsey <Harry.Ramsey@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 3/3] arm/mpu: Implement p2m tables
Thread-Topic: [PATCH v5 3/3] arm/mpu: Implement p2m tables
Thread-Index: AQHc3vfIzyH7Owu7tEuG8ufNQ6r2lLYIphwAgAAAvoA=
Date: Mon, 11 May 2026 10:39:37 +0000
Message-ID: <0A9C53BD-D9FD-4CBF-B874-E7465C8E421E@arm.com>
References: <20260508143353.3512004-1-luca.fancellu@arm.com>
 <20260508143353.3512004-4-luca.fancellu@arm.com>
 <a9460f33-1798-461d-95dc-c40cdf2f7f68@amd.com>
In-Reply-To: <a9460f33-1798-461d-95dc-c40cdf2f7f68@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DB4PR08MB9287:EE_|DB5PEPF00014B8F:EE_|DU4PR08MB11269:EE_
X-MS-Office365-Filtering-Correlation-Id: d0744bce-608a-4ed3-a474-08deaf49c103
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|38070700021|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 GznBrYcrpCnMGViyNhGnFdigmXTLO8gM0/6yd/stQTOQbYQV2UxAsknJTfqVoBwl36UXTGx5YDDusOUJXrEYsLNHCM9NHLdMpv/0YdzF3iYyxVJXSZilrfiVmez0clpxXN1RIe/Cg9ws3LJ6uvey2A7jYKZEuu/zLGSPpqWKVqCBgE7oKqJdj8tCHndna6jETdZNJbm6aW9d/VC7IsfX7PHR5nrWpqVa7XhNBQfau8SlN7obLF6P13O8Rai6MqCdbPVxxjeiHMYAhVxQHCCHFtKwPR7Puu7nwqyqoTsT40glmfLUNgUm0jEssouurnxS4eIz0M146/OFrlAnB8xz6wGvdPZwleK+Co29Bdusdz6iYgy2vN/b35WoHRwatnp1oYiy2/KKyIdCnzL4qIoX3UBVyN4qwJnL/yLPAekoqtW9BTYcD/OcujKTIZG+IkrnW+UL+0l7CuDbAUrTAsOl99tW2lh4I5MEvgjM9Ri9C5kwZMnwHQKRQnZWAt545fuT1sg8DQP50lsB3hENCKHqRcvzcVtHHzrHeLXrxO4A4CQi8bIYYQI3qZQdNiyzfYunLnAX4ASYuXFaF92qyXSthjEth8P53pg0Wbd7FS8JuQdo6XKTMBzZE27jFrNzv2YWnagj6LcfW0p+6uPM4Bs5H/Zyo34PFDg4olc699peBV0uZNp3qoaFodsCx+3XBDcMcEv9vEKD43yygnu/Adk/NbrbItRirczfXRdWFJgb712t/dNHKetvHP/vpRXBDYVx
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(38070700021)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6A2B6BA3B43A7F46A4E2601321DAFC30@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 gnx9o12EnjqnpDWrVwvGHQW9vr/prYZSOf8yHFY7YULYwhHjzG02ZBsAcl2lLHDZyE6oJvAIHuGFfM8m4hYQ3ScLVfTahV+z0IYgtv7Q+YHalNbI01QuZX8L4Kx7FEGjKBL2lr+SRXMeqku4lh8L4W5sKaLIa78zSAwaLhzSEx29oRAmxqxSWSWd6dHKA2F9XiKguPNq7zvsx9j3DiLv/RsObrBqdRz998nMpYVSlgFE6GMstzTy/V83hOi4+ZDmrc/+bn56GhicP5mLzVBEoDx8ScJ+yx+sfj7Ix2+hdD6v6oOTmpy1M7jBVkq5zaG6efJmCVh40Gve7vbniP+jNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9287
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c7fbe06f-e79f-4c51-b295-08deaf499984
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|14060799003|35042699022|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IvKk63LbE06sgtpQ5CEvp164Ob3GRz8CFbRPcaDzfz4mAL9ng5wJjv32M9Hx54Cewn0QSNV/AYLxBHdhKkdDkSHcllOe/XZyKidaaP7UYjYlIaXRDbM+Zn9rZdeFqHevxU40/pZV/rPA2o5hoMjby5Ghnn9nzIDX5ijplmN/jaVd/Z1wQ6AF2MVwDU7BFSa1+aLIZxRNCWFe6uPnECdiomKPYEumcemuKlj+BJKsEkoNnPp5fd8WSM+IBH45gK1O5MZGFCrYavCgyb2M9yk3gJF4Gr30IE+Mlyz96biYlAllMbMSsi7yXYkX2jIpXsbyaSyu/P881/yZD/Q9HrR4J0ohyVKhRZIfSR3Ye1V3UFixRPjZNRadquvzKnk6/3JBENWnX/0zTa3Rr0UzkiCT62FpHxq35KBLO/IF5y7cU8I+VGVukq055+mXYnQK+mrt5jnoFWs09nFoLofXAW/fRARSeFOo/oBaLoHyf7T4nlgl8xVxo/9WkqN6TAfJzDQ5PEkpi/nGZAvtfaoqZwoIR4/8RyeyUbj5hLV0w8rZ7EPjyvCveXHzK/CGm0s98qSVopElMq1/LjDgtd5oOS9JNWZDLE/tnpBLcBQWjOC4D7pohzL73Xj+jKRpsBxQ/b6oqU/uoZkMeO2CZUJ20oQHWucUd9ekuUty8DHzhfDu2786Ums6ox+IfNsZhPkqq0b4kiBqr43g7JCrYUWqq1C1cJSIKaYYSMA9tCE1ZluPZT0=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(14060799003)(35042699022)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	k40qL4HsZUQcDHvIG2vT+IVmuZxPC0QAHhtXOHnJWDr7vO2aXhAgS7oBCvYWD1PZQTnRs3kb3C9QVYojW5vxAHHhMbXm9hQTZLg/xTDEjRXU3kzq5Q5x49lZh50RfTffz4jctSHaC3RRa5bL9BKe49oj9CIo3Qdi7jWgfxC7vXNh9HjYj69VY3M9AR+7JQic+FgsAUeGZ5xNexRC2zqT2FQWIFuaWm/z5eJYVlQV9pmKpzxW6HxSISzEQh4155eVUm/fLcEHXO52n8xumXSWKtP+mQwfwx6C2mVh7CpZhFnsMyMA2GZcudYzuflQmLoGZU+JrlllZKHGZn+kBrynxXmokr6vCViAxl9IdzAOFtZyLQ1kzftlOQ8c/LCnVCMFhPBWMETMTVZgZWPlhX2quA7USU5zc+VKyRLVvc3tELfyI7r5646Rm3weF+NUKJ5C
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 10:40:43.7847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0744bce-608a-4ed3-a474-08deaf49c103
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11269
X-purgate-ID: tlsNG-d25034/1778496050-E2F72CF5-23B48D95/0/0
X-purgate-type: clean
X-purgate-size: 4374
X-Rspamd-Queue-Id: A92F350C08E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Michal.Orzel@amd.com,m:xen-devel@lists.xenproject.org,m:Harry.Ramsey@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:mid,arm.com:dkim,amd.com:email]
X-Rspamd-Action: no action

SGkgTWljaGFsLA0KDQoNCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20v
bXB1L3AybS5oIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21wdS9wMm0uaA0KPj4gaW5kZXgg
ZTQ2ZDllNzU3YTFkLi4wZDQxNDljNzE5ODcgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0v
aW5jbHVkZS9hc20vbXB1L3AybS5oDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20v
bXB1L3AybS5oDQo+PiBAQCAtMyw4ICszLDE1IEBADQo+PiAjaWZuZGVmIF9fQVJNX01QVV9QMk1f
SF9fDQo+PiAjZGVmaW5lIF9fQVJNX01QVV9QMk1fSF9fDQo+PiANCj4+ICsjaW5jbHVkZSA8eGVu
L2JpdG9wcy5oPg0KPj4gKyNpbmNsdWRlIDx4ZW4vbWFjcm9zLmg+DQo+PiArI2luY2x1ZGUgPHhl
bi9wYWdlLXNpemUuaD4NCj4+ICsNCj4+IHN0cnVjdCBwMm1fZG9tYWluOw0KPj4gDQo+PiArI2Rl
ZmluZSBQMk1fUk9PVF9QQUdFUyBESVZfUk9VTkRfVVAoTUFYX01QVV9SRUdJT05fTlIgKiBzaXpl
b2YocHJfdCksIFBBR0VfU0laRSkNCj4gWW91IHNob3VsZCBpbmNsdWRlIG1wdS5oIGZvciBNQVhf
TVBVX1JFR0lPTl9OUiBkZWZpbml0aW9uDQoNCnJpZ2h0LCBJ4oCZbGwgaW5jbHVkZQ0KDQo+IA0K
Pj4gKyNkZWZpbmUgUDJNX1JPT1RfT1JERVIgZ2V0X2NvdW50X29yZGVyKFAyTV9ST09UX1BBR0VT
KQ0KPj4gKw0KPj4gc3RhdGljIGlubGluZSB2b2lkIHAybV9jbGVhcl9yb290X3BhZ2VzKHN0cnVj
dCBwMm1fZG9tYWluICpwMm0pIHt9DQo+PiANCj4+IHN0YXRpYyBpbmxpbmUgdm9pZCBwMm1fdGxi
X2ZsdXNoX3N5bmMoc3RydWN0IHAybV9kb21haW4gKnAybSkge30NCj4+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vcDJtLmggYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20v
cDJtLmgNCj4+IGluZGV4IDAxMGNlOGM5ZWJiZC4uZWQxYjZkZDQwZjQwIDEwMDY0NA0KPj4gLS0t
IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3AybS5oDQo+PiArKysgYi94ZW4vYXJjaC9hcm0v
aW5jbHVkZS9hc20vcDJtLmgNCj4+IEBAIC00OCw4ICs0OCwxMyBAQCBzdHJ1Y3QgcDJtX2RvbWFp
biB7DQo+PiAgICAgLyogQ3VycmVudCBWTUlEIGluIHVzZSAqLw0KPj4gICAgIHVpbnQxNl90IHZt
aWQ7DQo+PiANCj4+ICsjaWZkZWYgQ09ORklHX01NVQ0KPj4gICAgIC8qIEN1cnJlbnQgVHJhbnNs
YXRpb24gVGFibGUgQmFzZSBSZWdpc3RlciBmb3IgdGhlIHAybSAqLw0KPj4gICAgIHVpbnQ2NF90
IHZ0dGJyOw0KPj4gKyNlbHNlDQo+PiArICAgIC8qIEN1cnJlbnQgVmlydHVhbGl6YXRpb24gU3lz
dGVtIENvbnRyb2wgUmVnaXN0ZXIgZm9yIHRoZSBwMm0gKi8NCj4+ICsgICAgcmVnaXN0ZXJfdCB2
c2N0bHI7DQo+PiArI2VuZGlmDQo+PiANCj4+ICAgICAvKiBIaWdoZXN0IGd1ZXN0IGZyYW1lIHRo
YXQncyBldmVyIGJlZW4gbWFwcGVkIGluIHRoZSBwMm0gKi8NCj4+ICAgICBnZm5fdCBtYXhfbWFw
cGVkX2dmbjsNCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbXB1L3AybS5jIGIveGVuL2Fy
Y2gvYXJtL21wdS9wMm0uYw0KPj4gaW5kZXggZjdmYjU4YWI2YWE4Li44ZDVjNjViMTAwM2YgMTAw
NjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vbXB1L3AybS5jDQo+PiArKysgYi94ZW4vYXJjaC9h
cm0vbXB1L3AybS5jDQo+PiBAQCAtMjgsMTAgKzI4LDYzIEBAIHZvaWQgcDJtX2R1bXBfaW5mbyhz
dHJ1Y3QgZG9tYWluICpkKQ0KPj4gICAgIEJVR19PTigidW5pbXBsZW1lbnRlZCIpOw0KPj4gfQ0K
Pj4gDQo+PiArc3RhdGljIGludCBwMm1fYWxsb2NfdGFibGUoc3RydWN0IGRvbWFpbiAqZCkNCj4+
ICt7DQo+PiArICAgIHN0cnVjdCBwMm1fZG9tYWluICpwMm0gPSBwMm1fZ2V0X2hvc3RwMm0oZCk7
DQo+PiArICAgIGNoYXIgKnRhYmxlID0gYWxsb2NfeGVuaGVhcF9wYWdlcyhQMk1fUk9PVF9PUkRF
UiwgMCk7DQo+IFdoeSBjaGFyIGFuZCBub3Qgdm9pZD8gV2UgdXNlIHZvaWQgYW5kIHBvaW50ZXIg
YXJpdGhtZXRpYyBpcyBkb25lIGJ5IHRyZWF0aW5nDQo+IHRoZSBzaXplIG9mIGEgdm9pZCBhcyAx
Lg0KDQpJIGRpZCBpdCBvbiBwdXJwb3NlIHNpbmNlIGl04oCZcyBhIGNvbXBpbGVyIGV4dGVuc2lv
biwgYnV0IGlmIHlvdSBzYXkgaXTigJlzIG9rIEnigJlsbCBjaGFuZ2UgaXQgdG8gdm9pZC4NCg0K
Pj4gKyAgICB1bnNpZ25lZCBpbnQgaTsNCj4+ICsNCj4+ICsgICAgaWYgKCAhdGFibGUgKQ0KPj4g
KyAgICB7DQo+PiArICAgICAgICBwcmludGsoWEVOTE9HX0dfRVJSICIlcGQ6IHAybTogdW5hYmxl
IHRvIGFsbG9jYXRlIFAyTSBNUFUgbWFwcGluZyB0YWJsZVxuIiwNCj4+ICsgICAgICAgICAgICAg
ICBkKTsNCj4+ICsgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPj4gKyAgICB9DQo+PiArDQo+PiAr
ICAgIHAybS0+cm9vdCA9IHZpcnRfdG9fcGFnZSh0YWJsZSk7DQo+PiArDQo+PiArICAgIGZvciAo
IGkgPSAwOyBpIDwgUDJNX1JPT1RfUEFHRVM7IGkrKyApDQo+PiArICAgICAgICBjbGVhcl9wYWdl
KHRhYmxlICsgKGkgKiBQQUdFX1NJWkUpKTsNCj4+ICsNCj4+ICsgICAgcmV0dXJuIDA7DQo+PiAr
fQ0KPj4gKw0KPj4gaW50IHAybV9pbml0KHN0cnVjdCBkb21haW4gKmQpDQo+PiB7DQo+PiAtICAg
IEJVR19PTigidW5pbXBsZW1lbnRlZCIpOw0KPj4gLSAgICByZXR1cm4gLUVJTlZBTDsNCj4+ICsg
ICAgc3RydWN0IHAybV9kb21haW4gKnAybSA9IHAybV9nZXRfaG9zdHAybShkKTsNCj4+ICsgICAg
aW50IHJjID0gMDsNCj4+ICsgICAgdW5zaWduZWQgaW50IGNwdTsNCj4+ICsNCj4+ICsgICAgcnds
b2NrX2luaXQoJnAybS0+bG9jayk7DQo+PiArDQo+PiArICAgIHAybS0+dm1pZCA9IElOVkFMSURf
Vk1JRDsNCj4+ICsgICAgcDJtLT5tYXhfbWFwcGVkX2dmbiA9IF9nZm4oMCk7DQo+PiArICAgIHAy
bS0+bG93ZXN0X21hcHBlZF9nZm4gPSBfZ2ZuKFVMT05HX01BWCk7DQo+PiArDQo+PiArICAgIHAy
bS0+ZGVmYXVsdF9hY2Nlc3MgPSBwMm1fYWNjZXNzX3J3eDsNCj4+ICsgICAgLyogbWVtX2FjY2Vz
cyBpcyBOT1Qgc3VwcG9ydGVkIGluIE1QVSBzeXN0ZW0uICovDQo+IHMvaW4vb24NCg0Kd2lsbCBm
aXgNCg0KPiANCj4gV2l0aCB0aGUgYWJvdmUgZml4ZWQ6DQo+IFJldmlld2VkLWJ5OiBNaWNoYWwg
T3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPg0KDQpUaGFua3MhDQoNCkNoZWVycywNCkx1Y2EN
Cg0K

