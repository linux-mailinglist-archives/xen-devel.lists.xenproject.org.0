Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3361E5931C6
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 17:29:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387636.623963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNc10-0000XO-2B; Mon, 15 Aug 2022 15:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387636.623963; Mon, 15 Aug 2022 15:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNc0z-0000V0-UR; Mon, 15 Aug 2022 15:28:29 +0000
Received: by outflank-mailman (input) for mailman id 387636;
 Mon, 15 Aug 2022 15:28:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w1rB=YT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oNc0y-0000Uu-UH
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 15:28:29 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2043.outbound.protection.outlook.com [40.107.21.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e90a2a50-1cae-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 17:28:28 +0200 (CEST)
Received: from AS9PR06CA0191.eurprd06.prod.outlook.com (2603:10a6:20b:45d::9)
 by GV1PR08MB8155.eurprd08.prod.outlook.com (2603:10a6:150:91::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Mon, 15 Aug
 2022 15:28:25 +0000
Received: from VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45d:cafe::8) by AS9PR06CA0191.outlook.office365.com
 (2603:10a6:20b:45d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.16 via Frontend
 Transport; Mon, 15 Aug 2022 15:28:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT061.mail.protection.outlook.com (10.152.19.220) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Mon, 15 Aug 2022 15:28:24 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Mon, 15 Aug 2022 15:28:23 +0000
Received: from 9e78f5de13ef.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5224F011-C517-42E0-9A17-C52F901ABBF8.1; 
 Mon, 15 Aug 2022 15:28:16 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9e78f5de13ef.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Aug 2022 15:28:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB4210.eurprd08.prod.outlook.com (2603:10a6:208:108::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Mon, 15 Aug
 2022 15:28:14 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5504.025; Mon, 15 Aug 2022
 15:28:13 +0000
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
X-Inumbo-ID: e90a2a50-1cae-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OTYXBLbmlQEgo/g9sHXFCyLmLXe5DIjPGKE1tKMRTSve2iTIlXy8gXpuWsDFllwg1ZuIdQlI+WJsBJHpo3pUY+GPs46GNRcCB2b7ELF5q8wadntwPiKabxc8bzwtzwZq29f2PVZ13RzMyX0K54znp/BVJ6OE0+NcRoWKglZzD5UBIN8yG5hp9QiHH4OAnfy7fi3UTLsu43n3NfMYSckhLDyKWiDWk0mf7hEMzTRznw6t2OmjRFD7yE/3pFKdfp3e3ZXxT4dK8XeJJaNHyXx/9ggaI7pCTgQ5se8soBIbOdbmh7qH1QnfoUxorfms5qcfQEqkMvCmjv4Dx/KAvIBafg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocm9Y/BX5RQq8BnWrPndfckZxYD0NJjTZS4toOM1YdA=;
 b=DbyFsyArKoDo6yWXg21DjGhmyPj4BBM9I8PYiZGU8DXAYB6V/Bae4al7Vsvec9qgGTRNP0i21RJ1hdHL9Qq5jmRvt6xhBr+aHhLMr8ny2gXXRcfrSv8x05q2eYUH7MO5y0CkUocu5910uunyW4j72OifyIwgm06otXHA5BwUaF2FDmSJk14jKqkdyQYk5kjswcQrFI1qfUwtdLy7nK1sYPkTr7K+eHxqsekWLM6LLNoUCjyP+2nFIIUL3neMA3GAbnL0i6CzB0TIi1+KPGw0fXqXJrwAMpLv9ysor0l1wYZT+LyuPvd+32h1p7XOPspFISYCFcHdkwV2DH195DXeGQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocm9Y/BX5RQq8BnWrPndfckZxYD0NJjTZS4toOM1YdA=;
 b=sGwNtG6+Blu+uNEd3Bq6T9mzzDYAz3V7ZS9jjA8e3oGXPodFZjwgFHI83JOGLArXPSi5UhDNF9CIO5A4gTd0X3ZBJJgiAYAkZT8H3QTw0r7WuKNKn5m22rBADFpekDJVl7oFjiOF3lZ/6Mtekyps7r3y/mGfsrv1aHL/is9rvdk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fdeee46e0ca5c0fc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VbAr3kBt2Sl8GUtlaejHEuDlXTL0frji9h9HCB01C4Ml1I6QuQc+D8b1MrMbrUanhVVhjite/orYswN3EelLYFJVytjghSYXoq51n+5hgkMfFvwlqVJm0dueOhUMteCN1AWCcxj76QB3ogEml/sDUyM8gnBH0eN4TgME2vv0LCe9BGrTSN1PQ9p7vIAnKkDoP7wLRqEb/Gjt7BAYdYGJb2x2VHAmjBS1OHBPixohK10d1+nyF5myMv//XbV1ZeBsE9uZI//Aff3bVCMAjKjNrTDlqhXrhdpe7u+tbR8n4svSIWwWvdzAs2ekcal7J7p7Wopdek/ZVFm4TWAran620g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocm9Y/BX5RQq8BnWrPndfckZxYD0NJjTZS4toOM1YdA=;
 b=GJbzYEoYv3qmdMe14ppDyCrH0GRiobP4WTMHtx0D2PKXa5c8czU1A+YkdhZkZ5+QCBVJ5y0YvFBKe71UBPMzNCBe1Bsh3uLDYd/qje+snCvC221gcqvNynu+/OatI8Awkn6lENTXXLntwvX8a2ciQ/ASFEMALZ9bgkyOZx5fROvQGP7TCQNin75tBsDHJ++ET5y4nIL3HLPATswfttjRrUmzTM8/ZfLuXXSPDdsdAJjlLSRe++81WEBA74eRN1ad+OeMiYoNKeB1ceIgTtQtVyE0oKJsoYJ8QMZR/ATQD8AcCbnL4i6XOaLEq0evZqhmyYOb4UqeCKKo45p8FEAdJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocm9Y/BX5RQq8BnWrPndfckZxYD0NJjTZS4toOM1YdA=;
 b=sGwNtG6+Blu+uNEd3Bq6T9mzzDYAz3V7ZS9jjA8e3oGXPodFZjwgFHI83JOGLArXPSi5UhDNF9CIO5A4gTd0X3ZBJJgiAYAkZT8H3QTw0r7WuKNKn5m22rBADFpekDJVl7oFjiOF3lZ/6Mtekyps7r3y/mGfsrv1aHL/is9rvdk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 4/7] xen/arm32: heap: Rework adr_l so it doesn't rely on
 where Xen is loaded
Thread-Topic: [PATCH 4/7] xen/arm32: heap: Rework adr_l so it doesn't rely on
 where Xen is loaded
Thread-Index: AQHYroFEnhiNblCzmE6X2LNZiEt2p62wGkGA
Date: Mon, 15 Aug 2022 15:28:13 +0000
Message-ID: <5AFEC486-EF58-4318-AEA9-811E66C4F0F9@arm.com>
References: <20220812192448.43016-1-julien@xen.org>
 <20220812192448.43016-5-julien@xen.org>
In-Reply-To: <20220812192448.43016-5-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: f1759b39-0b86-4114-dea0-08da7ed2cb43
x-ms-traffictypediagnostic:
	AM0PR08MB4210:EE_|VE1EUR03FT061:EE_|GV1PR08MB8155:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GycMbOh4kjts1WAyKTJtE10YnV9bun41QyNMvTEwXz3ZgsrGHM9NXSMW5rkPwvDc1NO6TkRWnzElVjjB8Ko8CXZopW2HuCP2OqCfVICZF5QtPK6RBW8JOSj5DJTyRKeDBlj8UKvwfNhaexrsCKj0E+kvCSPfNFvfpWC94LN9pga6pk6W8QkKkdSqgHYdgblIhr9QPNGB4HotqZiG8cQpjWh9LXJmgEDCv/hmX7VoPjwOXwKPsy2buWMpC5vRh7RegCJz+4oec96ns/JzLujLssiD10T4bPu6F3CSJ298GNsjN54hREj0XUpMgLWLMA8G9v0qjVOlDuoWbbmZ8PzvMpgttp3M5JBBkkNw5nTR9/KURYCskkbHDW/pI2Kq0qbGKsRaLZ1OW4fXJnLrTFMV1buOf3WMqY29IeZXF0zpps+Ns+nCR/P3tgeQurOOtg/RVFytz78aNJG0j57kIyB+lDXHkRzh2jLCJLZjYPnSvZc3LgzvYTez31IrEyyeSu6+a3Y7tYf4aVJRJ2on4yX68x5YyjgRsc+D0vioaULN89+3DskGJIZoxETaoMnv6cX9jfEmiN02fgOfKer9USYNQ46daP2S5bS1KvGshcW6zA5w8aARXwMKVN3PRQSe95XnSwbgA2+8VnzJhN5zYf6CXun/OPpnUdDh8Y9QzC1fr4A/SXE+0zUZcoWNlKFeEW/IHZzsPboKbiROgPmKN1CijSNiXHYOQ14xhrlbSNhUyf+8/BVl5ae+eyx6RbtETHRvZdcYaN4AXwcwzuqAr9XjeIi7Aida/H4rSQF66xtOrnFd2iVwkO3uHaGtXpMLDawlJIQl4FoDufRY9drNgPQYZQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(8936002)(26005)(66946007)(91956017)(66556008)(66476007)(66446008)(64756008)(8676002)(6512007)(4326008)(53546011)(33656002)(5660300002)(2906002)(6506007)(478600001)(41300700001)(186003)(86362001)(83380400001)(6486002)(2616005)(76116006)(122000001)(38070700005)(38100700002)(36756003)(71200400001)(6916009)(54906003)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E8BC8F54C454FF4F8E2C3EA68365BA58@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4210
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c3ebf85b-2b49-4e43-c67d-08da7ed2c4f7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BXA0g138wnyE1IIprDD0E03S9rL7BCgGiesMz4gutpRBf4DYqotvHrNSOjOYywnsFjFQHW8vfnddDS6UiweJrTRoAQcPzfKihLVRYfnh/NpJxtWdED75rm8jsujLkFw+hP2hosOniEZuEmgiKqbhKioWzxMSpzbpp3Ef4o3KIcuz29abs4XqTracSVSbpZqXai9f19YfgGGFL3l5GBwxcIUVkB+soBDuv2uu7bUtnjBALYRdRRr4770jYvMSibGrUwVg+Ghxw0HJGXROxdchRJn9kc0men0r+lvfXgixmg2AYv+scBV33UiUH2dyo68fzm4h8ypji7LIYkk2ffDIJHW0XuJf0TL/o612evkV3XHJC6vk3sRCGpvElP7CXKkTwPBiZTcGDbgLpc1M7CFOO1R5o9HzldVuF6+LL+F6nWnRvgjctRMS2hjjk6Z4Al7go2BETG08/IKRhHpqEG550VfCgqrnqLGDp8wLzTYrs6pfMaY2dbtKuUxsbW6DA0XtnXA8EJTOetTwZpDyWPVqsiJnah7W3Vuoufab/8uxa7qp0NFeCQQwXkOJqObj3z+tzi0LkO2ab9rXBvkHbyOk/KtNwD0DWn0WxYrEFU11/B40OX2KWqGs4yi9wlUFNgRez1TOltykae87dhqF2Cr2YoR65sPtQN4KXcB+zIwjBvV7Oo4NzO3I4uTA6gqnlt2TU6K40CaasUG/vlcVoenfw7lUyw+pGrPxmDdPHJNv2+6BuJ2WWM+WBIhmgc/ixKJxdI+ANheaOlaYbQecJTtrynhdQiabUfnqNmnkL946iluO7aerACk1fZFlqB+CCXNY
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(136003)(346002)(376002)(36840700001)(46966006)(40470700004)(8936002)(36756003)(6862004)(83380400001)(47076005)(107886003)(36860700001)(2906002)(4326008)(8676002)(33656002)(70206006)(70586007)(5660300002)(86362001)(316002)(186003)(478600001)(41300700001)(82310400005)(40480700001)(6486002)(6506007)(6512007)(26005)(53546011)(54906003)(336012)(81166007)(82740400003)(40460700003)(356005)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 15:28:24.3238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1759b39-0b86-4114-dea0-08da7ed2cb43
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8155

Hi Julien,

> On 12 Aug 2022, at 20:24, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> At the moment, the macro addr_l needs to know whether the caller
> is running with the MMU on. This is fine today because there are
> only two possible cases:
> 1) MMU off
> 2) MMU on and linked to the virtual address
>=20
> This is still cumbersome to use for the developer as they need
> to know if the MMU is on.
>=20
> Thankfully, Linux developpers came up with a great way to allow
> adr_l to work within the range +/- 4GB of PC by emitting a PC-relative
> reference [1].

This is indeed a great solution :-)

>=20
> Re-use the same approach on Arm and drop the parameter 'mmu'.
>=20
> [1] 0b1674638a5c ("ARM: assembler: introduce adr_l, ldr_l and str_l macro=
s")
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

>=20
> ----
>    I haven't added an Origin tag because this is quite different
>    from the Linux commit. I am happy to add one if this is desired..

I think the reference in the commit message is enough as you reuse the
idea but not the code per say.

Cheers
Bertrand

> ---
> xen/arch/arm/arm32/head.S | 38 +++++++++++++++-----------------------
> 1 file changed, 15 insertions(+), 23 deletions(-)
>=20
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 50f6fa4eb38d..27d02ac8d68f 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -49,20 +49,16 @@
> .endm
>=20
> /*
> - * There are no easy way to have a PC relative address within the range
> - * +/- 4GB of the PC.
> + * Pseudo-op for PC relative adr <reg>, <symbol> where <symbol> is
> + * within the range +/- 4GB of the PC.
>  *
> - * This macro workaround it by asking the user to tell whether the MMU
> - * has been turned on or not.
> - *
> - * When the MMU is turned off, we need to apply the physical offset
> - * (r10) in order to find the associated physical address.
> + * @dst: destination register
> + * @sym: name of the symbol
>  */
> -.macro adr_l, dst, sym, mmu
> -        ldr   \dst, =3D\sym
> -        .if \mmu =3D=3D 0
> -        add   \dst, \dst, r10
> -        .endif
> +.macro adr_l, dst, sym
> +        mov_w \dst, \sym - .Lpc\@
> +        .set  .Lpc\@, .+ 8          /* PC bias */
> +        add   \dst, \dst, pc
> .endm
>=20
> .macro load_paddr rb, sym
> @@ -383,7 +379,6 @@ ENDPROC(cpu_init)
>  * tbl:     table symbol to point to
>  * virt:    virtual address
>  * lvl:     page-table level
> - * mmu:     Is the MMU turned on/off. If not specified it will be off
>  *
>  * Preserves \virt
>  * Clobbers r1 - r4
> @@ -392,7 +387,7 @@ ENDPROC(cpu_init)
>  *
>  * Note that \virt should be in a register other than r1 - r4
>  */
> -.macro create_table_entry, ptbl, tbl, virt, lvl, mmu=3D0
> +.macro create_table_entry, ptbl, tbl, virt, lvl
>         get_table_slot r1, \virt, \lvl  /* r1 :=3D slot in \tlb */
>         lsl   r1, r1, #3                /* r1 :=3D slot offset in \tlb */
>=20
> @@ -402,7 +397,7 @@ ENDPROC(cpu_init)
>         orr   r2, r2, r4             /*           + \tlb paddr */
>         mov   r3, #0
>=20
> -        adr_l r4, \ptbl, \mmu
> +        adr_l r4, \ptbl
>=20
>         strd  r2, r3, [r4, r1]
> .endm
> @@ -415,17 +410,14 @@ ENDPROC(cpu_init)
>  * virt:    virtual address
>  * phys:    physical address
>  * type:    mapping type. If not specified it will be normal memory (PT_M=
EM_L3)
> - * mmu:     Is the MMU turned on/off. If not specified it will be off
>  *
>  * Preserves \virt, \phys
>  * Clobbers r1 - r4
>  *
> - * * Also use r10 for the phys offset.
> - *
>  * Note that \virt and \paddr should be in other registers than r1 - r4
>  * and be distinct.
>  */
> -.macro create_mapping_entry, ptbl, virt, phys, type=3DPT_MEM_L3, mmu=3D0
> +.macro create_mapping_entry, ptbl, virt, phys, type=3DPT_MEM_L3
>         mov_w r2, XEN_PT_LPAE_ENTRY_MASK
>         lsr   r1, \virt, #THIRD_SHIFT
>         and   r1, r1, r2             /* r1 :=3D slot in \tlb */
> @@ -438,7 +430,7 @@ ENDPROC(cpu_init)
>         orr   r2, r2, r4             /*          + PAGE_ALIGNED(phys) */
>         mov   r3, #0
>=20
> -        adr_l r4, \ptbl, \mmu
> +        adr_l r4, \ptbl
>=20
>         strd  r2, r3, [r4, r1]
> .endm
> @@ -468,7 +460,7 @@ create_page_tables:
>         create_table_entry boot_second, boot_third, r0, 2
>=20
>         /* Setup boot_third: */
> -        adr_l r4, boot_third, mmu=3D0
> +        adr_l r4, boot_third
>=20
>         lsr   r2, r9, #THIRD_SHIFT  /* Base address for 4K mapping */
>         lsl   r2, r2, #THIRD_SHIFT
> @@ -632,11 +624,11 @@ setup_fixmap:
> #if defined(CONFIG_EARLY_PRINTK)
>         /* Add UART to the fixmap table */
>         ldr   r0, =3DEARLY_UART_VIRTUAL_ADDRESS
> -        create_mapping_entry xen_fixmap, r0, r11, type=3DPT_DEV_L3, mmu=
=3D1
> +        create_mapping_entry xen_fixmap, r0, r11, type=3DPT_DEV_L3
> #endif
>         /* Map fixmap into boot_second */
>         mov_w r0, FIXMAP_ADDR(0)
> -        create_table_entry boot_second, xen_fixmap, r0, 2, mmu=3D1
> +        create_table_entry boot_second, xen_fixmap, r0, 2
>         /* Ensure any page table updates made above have occurred. */
>         dsb   nshst
>=20
> --=20
> 2.37.1
>=20


