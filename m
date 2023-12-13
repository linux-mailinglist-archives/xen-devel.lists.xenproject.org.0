Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90283811461
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 15:13:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654016.1020658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDPzB-0001aI-Nn; Wed, 13 Dec 2023 14:13:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654016.1020658; Wed, 13 Dec 2023 14:13:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDPzB-0001Wz-KY; Wed, 13 Dec 2023 14:13:17 +0000
Received: by outflank-mailman (input) for mailman id 654016;
 Wed, 13 Dec 2023 14:13:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ieRt=HY=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rDPz9-0001Wt-HH
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 14:13:15 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2070.outbound.protection.outlook.com [40.107.7.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdfb8147-99c1-11ee-9b0f-b553b5be7939;
 Wed, 13 Dec 2023 15:13:09 +0100 (CET)
Received: from AS9PR05CA0294.eurprd05.prod.outlook.com (2603:10a6:20b:492::28)
 by GV1PR08MB10424.eurprd08.prod.outlook.com (2603:10a6:150:15e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Wed, 13 Dec
 2023 14:12:35 +0000
Received: from AM2PEPF0001C715.eurprd05.prod.outlook.com
 (2603:10a6:20b:492:cafe::58) by AS9PR05CA0294.outlook.office365.com
 (2603:10a6:20b:492::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33 via Frontend
 Transport; Wed, 13 Dec 2023 14:12:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C715.mail.protection.outlook.com (10.167.16.185) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.26 via Frontend Transport; Wed, 13 Dec 2023 14:12:34 +0000
Received: ("Tessian outbound 26ee1d40577c:v228");
 Wed, 13 Dec 2023 14:12:34 +0000
Received: from dc1b8797008f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E6BE790B-8B01-4B6A-A63A-1656181BC50A.1; 
 Wed, 13 Dec 2023 14:12:28 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dc1b8797008f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 Dec 2023 14:12:28 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PA6PR08MB10417.eurprd08.prod.outlook.com (2603:10a6:102:3cd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Wed, 13 Dec
 2023 14:12:26 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a045:911e:2349:3d8b]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a045:911e:2349:3d8b%6]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 14:12:24 +0000
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
X-Inumbo-ID: bdfb8147-99c1-11ee-9b0f-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AlPgVnqXfE8udOL50Bd8KeDpieXbrQ2nqxqaRSRuI8V+yjawEjeyflByjiXxzs7WSGBT3Qva/FVeZ/REunU5Y4TcUsaFOCFbRC1trV4jojoqYoelwY2keWWXwgqncw1FZaLw+ziAvApgnDh1LE53FsK9QMC0/h1A+ciFxYnBNq2myXyaizx64NYqOFPhUBMhhd+E9Daq4/f84Lt/5ggWA8ldtMzagdigl0RfPgcE+8wm7OkG/pIuZgUNHpF3q8Iyzs/wnNQKpJ9pXatZCu8kquQufhZz+IhR2JikH/ulrHYElcqK+WWMgNC802+CoM44DSopqwZqsxKv/KnpuPKkEA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zXvCi0VToAqo8eGsgipSbL9qnm6d03x9sVDBPq3nMlw=;
 b=L7unJMdlMo5Ar48ff2O7FuCxOx3QOGO3uAOqY1cyD8hSYzu7nsMkHqdTudExed5Y0RHPNJE4FFZiFrqvsKJ9zR0CYpvReUqiZwZClPjNlzWhyibq33TK4h37Vj7RbVUrbyGNq2kQ3Uv83WOZCULoH9JraPZD3fepbL6CLTl2BwSh3hVWs8JEJUr0bOw//M72lvWHY8eMZQLBuqgL5F1Yy2wqdEIc9qcU5Qwii36LWeX3cxMKXfQflzi1KHO9tvAJh59IFi4HcYa73S4TOvZYhWhmvNlqICWwxg8CYqJp4wFJU4VBtJCQRzdAqE8XpQYvBGjK5HoWSfo22/UAoEHdjA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXvCi0VToAqo8eGsgipSbL9qnm6d03x9sVDBPq3nMlw=;
 b=tFMmvD2FLIsgJZFZ6RJ/hLNbNiouIIbrr+tCd8jNsRFFVbbQHbcinwZIcbKUMLF4iFoHDDTXiqope9SNX84OYXyjDrzevha/05CoPJoz5le7UFQBTHn3/1CHXgg5zb7jB3sy8oe1CmbLTkFBoytLRU8qk2jOYt09ssYqHiwMGI0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 112ba88f2c48a028
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ayg+l5atxpPAZYOsqjoM16rNhXTznyOBOFGPULX4C/vDAQH/4jsxEx4D7bE7bKRZ5V28ZjSAgNy4ug9ABxP1SOlr6GQ6np0wB3548kX8aPdradAJJwGKU1WkLnboxindopvjmenh/xjpX7VQ5JXo6rDVFuxY2J+k9XTrjMNA16Vx5KR5VzdxHEg7xwA7z9JsOtP/c1ytcWfgFi50FZSrpMTjd2d8JAZJRNqhVuaUhKAX0SRfQGp0fFEhXcfM3GII1IFNNb+vg4kWrQbb/dLYcTpkpYtUI39HeJqE0H4sdWO+QngXlQQ1CZ1t1BiALrZWc0G2Enb8hGc13cOu2vLCqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zXvCi0VToAqo8eGsgipSbL9qnm6d03x9sVDBPq3nMlw=;
 b=ODr0t6biUUU4aa4czfT3ggRUM9zw4ecouBK6n5yQnOkbR6vhNPeZ6VfLt71I9Jiltw90ux9uWxzX9CfHJv+i3nr9VpaaCfZIPFNyQGDf0dvcrDBCKo+GX9+c3L2kLjIDtNqsZPcxfW3JG5ZcGu+prQXGSMGHlZiRH6YOqBLuLe0hImIK5joDXf+PKgGV0AHBoRviq7Baa08iRzvpjeuv6rW6rrL3rkD63Z6DmbevYsQu8ElzUpFAM6ba5QyRE2fdIL5+QHVibgB1Te5RO27Ip7Z3MK28FCw1h6jWyCv1MfaDq5n5iIQGHPWL0l945b++GeNghNYe1zrmeYW2iA1QPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXvCi0VToAqo8eGsgipSbL9qnm6d03x9sVDBPq3nMlw=;
 b=tFMmvD2FLIsgJZFZ6RJ/hLNbNiouIIbrr+tCd8jNsRFFVbbQHbcinwZIcbKUMLF4iFoHDDTXiqope9SNX84OYXyjDrzevha/05CoPJoz5le7UFQBTHn3/1CHXgg5zb7jB3sy8oe1CmbLTkFBoytLRU8qk2jOYt09ssYqHiwMGI0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "patches@linaro.org"
	<patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH] xen/arm: ffa: return FFA_RET_NOT_SUPPORTED on
 unhandled calls
Thread-Topic: [XEN PATCH] xen/arm: ffa: return FFA_RET_NOT_SUPPORTED on
 unhandled calls
Thread-Index: AQHaLa+9f2NgKntfU0yyvul3VTpCb7CnQV2A
Date: Wed, 13 Dec 2023 14:12:24 +0000
Message-ID: <26C1D752-3FDB-43C4-9A28-8C1060C4AB70@arm.com>
References: <20231213103241.2346813-1-jens.wiklander@linaro.org>
In-Reply-To: <20231213103241.2346813-1-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PA6PR08MB10417:EE_|AM2PEPF0001C715:EE_|GV1PR08MB10424:EE_
X-MS-Office365-Filtering-Correlation-Id: e8578701-9e91-4a04-fa45-08dbfbe58de9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FlAyA5KHAIYMI3gzjc6V8jazJK0bnj0JF1A8KQjWC1mjSiD+MyZBM0M5aCS9rk81EAg38rrXvZt3mvoST2VZx5lmiynOuW16cv6uWfbCvyyq5El3klRVhgvdQysZFfyIO0zHz4i2PURLFU3dEdI7bj8bVumGzTY1oy9tlOLM13tBEthChxsXNOn8MSJt+BKB8UdRpL3/DbCxBYgyLB5G20aqNSNNxafR4YCli87rlAYxoxaUiZ65AFCS3M+2dci5kxHs/URLozqSuhzH1N4yR0PYzQfwgiiGwJcZLgWsR9aNl71Flu8a9Gpge+z6ImnmruJjHoY8zG49RohNgEq/FW2HpmwLyHhVRaHrFHpMU4U2HTU3cT8jiDUoLW1UZRA6Y24UlnJ4kEc9xdI6sfALHenhH8tQFvUu19OcxbqsoIK3P2g9hneai4KvShI/9wMFBDShK1bIZsB2JXBfvUcxkEi57uG3t4UkJ67mj+t9NhalIm3ha+FVVC/KkDafYzGlTFPXMsLzcqVV8tQbcDuKQIik1U8u9l/UBgB1tLIwWMnawDrx5JRf7qjkc93zuV/7RIbz/I//Bg/xMu/oEefUq3wmdLYYmOeQNN2aqreR1WSNp9a8oB0/0ev0ix9OJCy6cXjhwaGCD6KwB8IzMFxrDA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(136003)(376002)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(2616005)(86362001)(122000001)(38100700002)(38070700009)(36756003)(33656002)(83380400001)(5660300002)(316002)(66946007)(53546011)(71200400001)(76116006)(91956017)(6486002)(8676002)(8936002)(66556008)(64756008)(6916009)(66446008)(66476007)(6512007)(54906003)(41300700001)(2906002)(6506007)(478600001)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5A5385EEB4A3BC46A50C21B1BC6B5DF1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10417
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4dcc92d4-fd04-4695-b525-08dbfbe58779
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	28LgmWkrQ29LuM9NJV1+QsOA3MmZGuE02H/1aa0z0tYLYvvNwKulBo6mlDmR9/Yhrr0tayCsaVmXWB9vyt5PsqXfKey+fTLr5u1Tefj1AmNiM2nDClaPQ0IQ4/hOT++F48JZGLqB0TouH7oSsDENIortpe473W/SPUE6ghCkwJnef/UsXwFCL45XnnJvqVJmPlaOIyjlQAXqpSwdCFNlGFO8J8gcZzM0fP25qSxYUJda0rE8LGPl2CYwJ54le+YcAFDqDzbsJw/FvFzVSJ6rY2FCEv1py8tGD9UXYO2OeauFqYSTXVys+2jJ+7TtTFuuf8Pfs4b3WpILmaTcIbqJwy7zEwozf3mp3GpZlmlEDWq2tj5rztE33wyYak9jtCEesKneS1gYemtbod0gkfgX+AFUv0C5QyIbTQAebIovOblbzyqEyPJPRhuMGFD+gp5Wuzc8IpXID5M5Jv0xFDINiXD41Twb6eaWE47sp4nMquaZ/luV7AX8IiHokZvl3jtR3F9YJ7LpkM/1GJ+odJY3fqUS2xm09WIAtK+ZaM8qEfyy9BLW6raL9a6HYIqU+YsM6xh628KNM0BHA0fdIahe06oGM0JFm81meBRmPWjHJ12wCY7xkStLvP3vranAs0KIALgI/hINsyMQ3jRdQdnPTEvbmhhIHDnelzaCTgYakgbixxjSFvzQKM7CieMW/gnESD7Rbfgi1hufXEd4r8CiMjwnLYLYoDMHzRdrYYOIQrPX8l6T9eePdVADjMZrkqpn
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(346002)(39860400002)(230922051799003)(82310400011)(186009)(64100799003)(451199024)(1800799012)(40470700004)(36840700001)(46966006)(40480700001)(40460700003)(36756003)(70586007)(54906003)(82740400003)(26005)(81166007)(356005)(86362001)(33656002)(70206006)(47076005)(36860700001)(53546011)(83380400001)(6506007)(6512007)(2616005)(6486002)(316002)(2906002)(8676002)(478600001)(336012)(5660300002)(4326008)(8936002)(41300700001)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 14:12:34.9592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8578701-9e91-4a04-fa45-08dbfbe58de9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10424

Hi Jens,


> On 13 Dec 2023, at 11:32, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Until now has an unsupported FF-A request been reported back with
> ARM_SMCCC_ERR_UNKNOWN_FUNCTION in register x0. A FF-A caller would
> rather expect FFA_ERROR in x0 and FFA_RET_NOT_SUPPORTED in x2 so update
> ffa_handle_call() to return true and with the cpu_user_regs updated.
>=20
> Fixes: 38846de2176b ("xen/arm: tee: add a primitive FF-A mediator")
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

With the Nit from Michal fixed in the commit message (could be done on comm=
it):
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/tee/ffa.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 183528d13388..98905fec7967 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -1477,7 +1477,8 @@ static bool ffa_handle_call(struct cpu_user_regs *r=
egs)
>=20
>     default:
>         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
> -        return false;
> +        set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        return true;
>     }
> }
>=20
> --=20
> 2.34.1
>=20


