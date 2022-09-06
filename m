Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEB55AE0D4
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 09:20:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399484.640669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVSsN-0001nE-7F; Tue, 06 Sep 2022 07:20:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399484.640669; Tue, 06 Sep 2022 07:20:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVSsN-0001iP-3j; Tue, 06 Sep 2022 07:20:03 +0000
Received: by outflank-mailman (input) for mailman id 399484;
 Tue, 06 Sep 2022 07:20:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nuBZ=ZJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oVSsL-0001Pj-Eu
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 07:20:01 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00089.outbound.protection.outlook.com [40.107.0.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51bf437d-2db4-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 09:20:00 +0200 (CEST)
Received: from FR0P281CA0050.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::13)
 by GV1PR08MB8692.eurprd08.prod.outlook.com (2603:10a6:150:86::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 07:19:58 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:48:cafe::2b) by FR0P281CA0050.outlook.office365.com
 (2603:10a6:d10:48::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Tue, 6 Sep 2022 07:19:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 07:19:57 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Tue, 06 Sep 2022 07:19:57 +0000
Received: from 6366550728e4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 48282156-987C-461D-8ABA-539C02AA1DB1.1; 
 Tue, 06 Sep 2022 07:19:50 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6366550728e4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Sep 2022 07:19:50 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PR3PR08MB5740.eurprd08.prod.outlook.com (2603:10a6:102:87::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Tue, 6 Sep
 2022 07:19:45 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 07:19:45 +0000
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
X-Inumbo-ID: 51bf437d-2db4-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=G4UT95SlIDX3jTJfGPL7AgWXUlgXb9MCBowMm1eoHPAt+9vra6ftnieWu6srh7eU8QHqJKQIkHrjy/kDyvbNNpeJYnXvLZeT78aImh4i5Y7+0q2CkgEARCFYgxnAnr0azYjBhfxJRCX18MGc33KJ6ri4/xI9m6bMEtbNAozELo7ciL4SEUdEe+4FPhsW8DCGaMB+HnIR8bb4yQQM5Y6fOLm0UunfBmEW303nCd8K/2Xb1PfJKVQRTMPbI8RVpld/CldftCTrkuHCSZ4wvtj5EBCWTno7GRtWeRtJh9cRxiRuFR9SZQJyeqZ9H3l45NpDv+JweFUkOnujXSMiRe3K3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QqqIbKntsO1D9Nj1iz8XQZOoYYfriM9zZHKegE4N9A=;
 b=OA5sa4RT7EgU5Uf6bDqZ6NvTppMALh8ShtFJQe/Rwio2iBpvM/aLS3Ag9HgBiVGBEDQngBzkd2vBrz0t6b5IKsh4B6Nz9pJ3VqdlAg3ZNUVokPPgsOcuRwBIrQRCyexps6Mc/1IYECh89RmwSStq2pLsOWHgGvFBt1s5OVjUML0c3kchdrB7BHIy9rAdjMF42LiR89q6n0+M5CKw3ffzClX8K8cLoG1VGGMHWd0mocBu+8aktM2F1CpJjyApLgl4dwOmyC6p1e9FqYdcegbVzvKfRmWfY06V1siMJZpZ4Sv0AfJqyIRxC/XOERkdBhbVgxyRMAEOhngfg389t9DIIA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QqqIbKntsO1D9Nj1iz8XQZOoYYfriM9zZHKegE4N9A=;
 b=t7Fg3ZjlKFz01ylz/R8fmO7QJmlDGK+HqBT4HVVbeFD9NLAzKks7u3oZyFNA0yRsCzzTgdyWiuuAaASeAGve+6ryqPDay01uBMl/jtA04jfA4M97M/oJPOENokb2IkDR9Myqrrv5ECfOr+FkhF+YvEHQsuZCgozxy9Ds6/1VLEA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4dd57dc163130151
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DEoKhcxVXa8gOjHLEwuWCZkszg8ao4DtSdKzzWdZ7N1Dbh2MSAB+pEVRvKSxsuqyrh32dsS86W/cYL4AELlaacUJy7uaDCmp7gv4r6vW9mjkj9bF7otEfmKBiESsJnE/VYXraKLKAGo5q9L3+23EViw9RKUcFYzDgRRPKqX5rg15ooUzeBLyDnN4K4poeAYTXQhDlXMaUjT+3ZUUzCKVr6gd6c5ZKDfrsjSfQeCdRXeOUoVOqY7mrttUSuQnunHs2LeXOH6lCGbVopwi3DmD26GxCF0CRIcNO9w+ZIOoydtwzQh+huxYRLfz1xto9mJVfxpPEnXc33E5frlkkrBmXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QqqIbKntsO1D9Nj1iz8XQZOoYYfriM9zZHKegE4N9A=;
 b=O4GnhACa68xTvMDd5UgiFRAJXUQw6tbHEU3SEvGPphzhTE+fgOH7jHIz4HtXin6izv9ZQ24fLEov3Gddj8zOwW8JYEsI0y3W20zDBbWAwFJ6WR7ZuCG/NQ8IUfc53gk3zKbJSqzCjLgsvFl3z3Nkh12y3tjTrslE6UwHhWXqMpQQgU1DRca40dXzK6Evk1w1q0NAdZYcutyBOcp3L47PENL8bvMG0pckB36/1t3pK/bdOeYlQWk2sa1lRrE9gzwu8GIzG9MYJbd6aoois9Tbg3undWTc5Q14o4e1CnreXAppeWiqiK3nUJTxq5WnQeGzG/FtU7XVJHPElV8DIa65Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QqqIbKntsO1D9Nj1iz8XQZOoYYfriM9zZHKegE4N9A=;
 b=t7Fg3ZjlKFz01ylz/R8fmO7QJmlDGK+HqBT4HVVbeFD9NLAzKks7u3oZyFNA0yRsCzzTgdyWiuuAaASeAGve+6ryqPDay01uBMl/jtA04jfA4M97M/oJPOENokb2IkDR9Myqrrv5ECfOr+FkhF+YvEHQsuZCgozxy9Ds6/1VLEA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Rahul Singh <Rahul.Singh@arm.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Zhou Wang <wangzhou1@hisilicon.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 03/10] xen/arm: smmuv3: Ensure queue is read after
 updating prod pointer
Thread-Topic: [PATCH v3 03/10] xen/arm: smmuv3: Ensure queue is read after
 updating prod pointer
Thread-Index: AQHYwUUWFmEvVlJX+EKYMZGC5n14Aq3RCQUAgAADdwCAAAGWAIAA8XYA
Date: Tue, 6 Sep 2022 07:19:45 +0000
Message-ID: <F04F8A8F-25A7-494E-AE3E-2C83EF74E278@arm.com>
References: <cover.1662394710.git.rahul.singh@arm.com>
 <bd55c05d7197b72cb4597c7412fc4911fa2281d1.1662394710.git.rahul.singh@arm.com>
 <885a4f6b-8350-229d-55da-4171eeafb800@xen.org>
 <41229BFA-D9F9-442D-92D2-67354897B5EA@arm.com>
 <5c0e3697-96cd-c4e5-4de0-a01d4d699c69@xen.org>
In-Reply-To: <5c0e3697-96cd-c4e5-4de0-a01d4d699c69@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 88510204-c9a7-4409-3bda-08da8fd83420
x-ms-traffictypediagnostic:
	PR3PR08MB5740:EE_|VE1EUR03FT043:EE_|GV1PR08MB8692:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wDn/O9QQ7iyya61lFWKz0vVgSZgQ3QRcqRBl28/Eld1vmMSeLFc7neXswh8wDfkUGs2kS9JFLkfzrHUIrgZ7lPhNrWmM+Ha34WMv3IGo6ZPw3eldjBptFHNqd5cpvqqGSwihKq/5PsUyBFMGRwexbVP8qJ7vTt5KHwsbpdAHbkYBzbzJuNsgLwljmZXcy8v0tnJUU2RcAHsVIX3GL9XyoR1SlP4MwegROr+iYIdCKIE6U3qjjsaC34ZJXx3iWzC6pf4p0vntcWjmFx233QT1K9R4VBtE7vsBVZWCXqeE8e+8uMLoiP4K3W35ke6h1RRRP7MVAheRcRQp13/UAgOUOtm5K5TGhFRU3YcxRQoiBTl8jbhF2kZ3GCMBjsu43RQaRWVws98xshhI2esMiaO7Hof5KQnRqJZpaBw9eDH2u8qS/SGEDJxPrl4kWg45QcZpkstrGBOGuP57BB0WZDrVg5m7CeDkJSIGODzqontksP2PS3fVYwOUNcHZSMETHDCDethTt+O2rsDULxt+h9t6uNJqQWu3fmEIsF9Q9XR6A+4nRdhSr4K5vl4ntG6ixZciWpxzG/teG2T62SXTptb57md1O62ZxwTQpUIxa65UxTUiYzKaAb2rCMZwv6ObUVQrkNeo5I4xli4x5oSc+4Ao6ZnaG3e+9nNuuSEnI+DoaugW5K28LERTnF6UOE7Z+JGrgjWOOTlPwA/OFTgKpAG3azWMVLCoNqQagFHF5z9fny9b/ouwl5IImJgREltahbqYvk847cqbArB6+QewzWIz4ZBGlUrtKEBQJeLVZzQXHpsN6H2XxTsXiYnFTwab0DEE84ODRpRCQABBMjTxBq7c3Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(396003)(136003)(366004)(376002)(66476007)(66446008)(91956017)(66556008)(64756008)(76116006)(4326008)(8676002)(478600001)(8936002)(966005)(6486002)(6506007)(66946007)(83380400001)(6512007)(41300700001)(26005)(2906002)(38070700005)(5660300002)(33656002)(86362001)(53546011)(122000001)(38100700002)(316002)(36756003)(71200400001)(54906003)(2616005)(6916009)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B00C0D584254B245B5FCD33D76CA3658@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5740
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a0af1738-d967-4cb1-e120-08da8fd82ccc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F3ZSxpfC7lj9mR/BFsvn59rZZXwYdIoVS+DEYYvBGq6+UoZHkM+pC+CZ7qDZKRUQ6g5V76FMFlYRTIeWz91le8QNnuyFBBrHldwBn3F0C3p7/y/O9tUcs/zZ9X2gABPBvfosxwCUFwnysSN/HxXRfQBlRs9qjhzI3Fv1I5dKeAL3v/qGLfCy/mg3B9urku6kx/l3rBA1dyN1PieyNfe5iavbEzUnxgZXwM5dxF2klLQ/Et2dkqH8oW4c7VGFvOw80zl1ZwydKC1PEPVy4CPYiJ1ViDOASuT8B7bvuZDExEq6Srnoenj+sq4P9K2y/B9vm9ziQEBUdleb1BGleAfwhjSnz3F9wHt8zwuaVZg2nGsvsKDPZGtu9g71FP7ZUOrFSwC6HAQx1wolHlNeb8pL982NztAdow0e0D1VJ1eanRZPWtJibV/doWZ2Pyz/hPELuWVP/dXL3LT0W9kVti1nuRW0doW4U6yqaWM6FKgCk5Lg3Fk5/TJbziP9huex2ke577alzKJd+FlcJGsCWxLrPozAglsbxVN2jzbEVMEkGf7B63v5fghN5J/yE60O6DJnJCtfY8b2TO1zOhU95Oso/lAQLantzKJXehJPIKwP9yQwFkT61+Z/8KMZvO14ZA6npmOVadTn8XHy41+4465w9k9NKrNYHZmLuVhlJHutudbjbO6yLKmhx3Xgt2wOsUMrn6Z4tD1DLEv3Ir3Wpo5LI/UyBZbFl8qQGes3GvBUbl+kby0CkQuTBS0YYnvzKUpRTxIxFw7FQUDoJXGvoCvzomBwzfRc9oUCUXrYuOKjFdM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(396003)(39860400002)(40470700004)(46966006)(36840700001)(36860700001)(356005)(8676002)(4326008)(70206006)(70586007)(82740400003)(2616005)(6486002)(336012)(47076005)(41300700001)(81166007)(186003)(966005)(40460700003)(6506007)(6512007)(26005)(53546011)(54906003)(316002)(107886003)(478600001)(83380400001)(6862004)(36756003)(2906002)(86362001)(5660300002)(33656002)(82310400005)(8936002)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 07:19:57.5488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88510204-c9a7-4409-3bda-08da8fd83420
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8692

SGkgSnVsaWVuLA0KDQo+IE9uIDUgU2VwIDIwMjIsIGF0IDE3OjU1LCBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMDUvMDkvMjAyMiAxNzo0OSwg
UmFodWwgU2luZ2ggd3JvdGU6DQo+PiBIaSBKdWxpZW4sDQo+IA0KPiBIaSBSYWh1bCwNCj4gDQo+
Pj4gT24gNSBTZXAgMjAyMiwgYXQgNTozNyBwbSwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9y
Zz4gd3JvdGU6DQo+Pj4gDQo+Pj4gDQo+Pj4gDQo+Pj4gT24gMDUvMDkvMjAyMiAxNzozMCwgUmFo
dWwgU2luZ2ggd3JvdGU6DQo+Pj4+IEZyb206IFpob3UgV2FuZyA8d2FuZ3pob3UxQGhpc2lsaWNv
bi5jb20+DQo+Pj4+IEJhY2twb3J0IExpbnV4IGNvbW1pdCBhNzZhMzc3NzdmMmMuIFJlbmFtZSBf
X2lvbWIgdG8gaW9tYigpIHdoaWxlDQo+Pj4+IG1lcmdpbmcgdG8gZ2V0IGluIHN5bmMgd2l0aCBv
dGhlciBYZW4gZGVmaW5pdGlvbnMuDQo+Pj4+IFJlYWRpbmcgdGhlICdwcm9kJyBNTUlPIHJlZ2lz
dGVyIGluIG9yZGVyIHRvIGRldGVybWluZSB3aGV0aGVyIG9yDQo+Pj4+IG5vdCB0aGVyZSBpcyB2
YWxpZCBkYXRhIGJleW9uZCAnY29ucycgZm9yIGEgZ2l2ZW4gcXVldWUgZG9lcyBub3QNCj4+Pj4g
cHJvdmlkZSBzdWZmaWNpZW50IGRlcGVuZGVuY3kgb3JkZXJpbmcsIGFzIHRoZSByZXN1bHRpbmcg
YWNjZXNzIGlzDQo+Pj4+IGFkZHJlc3MgZGVwZW5kZW50IG9ubHkgb24gJ2NvbnMnIGFuZCBjYW4g
dGhlcmVmb3JlIGJlIHNwZWN1bGF0ZWQNCj4+Pj4gYWhlYWQgb2YgdGltZSwgcG90ZW50aWFsbHkg
YWxsb3dpbmcgc3RhbGUgZGF0YSB0byBiZSByZWFkIGJ5IHRoZQ0KPj4+PiBDUFUuDQo+Pj4+IFVz
ZSByZWFkbCgpIGluc3RlYWQgb2YgcmVhZGxfcmVsYXhlZCgpIHdoZW4gdXBkYXRpbmcgdGhlIHNo
YWRvdyBjb3B5DQo+Pj4+IG9mIHRoZSAncHJvZCcgcG9pbnRlciwgc28gdGhhdCBhbGwgc3BlY3Vs
YXRlZCBtZW1vcnkgcmVhZHMgZnJvbSB0aGUNCj4+Pj4gY29ycmVzcG9uZGluZyBxdWV1ZSBjYW4g
b2NjdXIgb25seSBmcm9tIHZhbGlkIHNsb3RzLg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBaaG91IFdh
bmcgPHdhbmd6aG91MUBoaXNpbGljb24uY29tPg0KPj4+PiBMaW5rOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9yLzE2MDEyODE5MjItMTE3Mjk2LTEtZ2l0LXNlbmQtZW1haWwtd2FuZ3pob3UxQGhp
c2lsaWNvbi5jb20NCj4+Pj4gW3dpbGw6IFVzZSByZWFkbCgpIGluc3RlYWQgb2YgZXhwbGljaXQg
YmFycmllci4gVXBkYXRlICdjb25zJyBzaWRlIHRvIG1hdGNoLl0NCj4+Pj4gU2lnbmVkLW9mZi1i
eTogV2lsbCBEZWFjb24gPHdpbGxAa2VybmVsLm9yZz4NCj4+Pj4gT3JpZ2luOiBnaXQ6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0IGE3
NmEzNzc3N2YyYw0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBSYWh1bCBTaW5naCA8cmFodWwuc2luZ2hA
YXJtLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IENoYW5nZXMgaW4gdjM6DQo+Pj4+ICAtIHJlbmFtZSBf
X2lvbWIoKSB0byBpb21iKCkgYW5kIGFsc28gbW92ZSBpdCBmcm9tIGNvbW1vbiBmaWxlIHRvDQo+
Pj4+ICAgIHNtbXUtdjMuYyBmaWxlDQo+Pj4gDQo+Pj4gSG1tbS4uLiBRdW90aW5nIEJlcnRyYW5k
Og0KPj4+IA0KPj4+ICJXZSBuZWVkIHRoZSBfX2lvbWIgYXMg4oCcbGludXggY29tcGF0aWJpbGl0
eeKAnSBpbiBmYWN0IHNvIEkgd291bGQgc3VnZ2VzdCBmb3Igbm93IHRvIG9ubHkgaW50cm9kdWNl
IGl0IGF0IHRoZSBiZWdpbm5pbmcgb2Ygc21tdS12My5jIHdpdGggb3RoZXIgbGludXggY29tcGF0
aWJpbGl0eSBzdHVmZiB0byBwcmV2ZW50IGFkZGluZyB0aGlzIHRvIFhlbiBvdmVyYWxsLiINCj4+
PiANCj4+PiBXaGljaCBJIGFsc28gYWdyZWVkLiBJIGNvdWxkbid0IGEgbW9yZSByZWNlbnQgY29u
dmVyc2F0aW9uIGV4cGxhaW5pbmcgeW91ciBhcHByb2FjaC4gQ2FuIHlvdSBvdXRsaW5lIHdoeSB5
b3UgZGlkbid0IGZvbGxvdyB0aGUgYXBwcm9hY2hlZCBkaXNjdXNzZWQ/DQo+Pj4gICANCj4+IEkg
YW0gcmVhbGx5IHNvcnJ5IHRoYXQgSSBtaXNzZWQgdGhlIG5hbWluZyBhbmQgd2hlbiBJIG1hZGUg
dGhlIHBhdGNoIGluIG15IG1pbmQgdGhlcmUgd2FzIGEgY29tbWVudCBmcm9tIFN0ZWZhbm8gdG8N
Cj4+IHJlbmFtZSB0aGUgX19pb21iKCkgdG8gaW9tYigpLiBJIHdpbGwgc2VuZCBvbmx5IHRoaXMg
cGF0Y2ggYWZ0ZXIgZml4aW5nIG9yIGRvIHlvdSB3YW50IG1lIHRvIHNlbmQgdGhlIHdob2xlIHNl
cmllcz8NCj4gDQo+IEkgd291bGQgYmUgZmluZSBpZiB5b3Ugb25seSByZXNlbmQgdGhpcyBwYXRj
aC4NCj4gDQo+IEFsc28sIGxvb2tpbmcgYXQgdGhlIG90aGVyIHBhdGNoZXMsIHlvdSBhZGRlZCB0
aGUgQWNrZWQtYnkgYmVmb3JlIHlvdXIgU2lnbmVkLW9mZi1ieS4gSW4gZ2VuZXJhbCwgdGhlIHRh
Z3MgYXJlIG9yZGVyZWQgY2hyb25vbG9naWNhbGx5LCBzbyB0aGlzIHNob3VsZCBiZSBpbnZlcnRl
ZC4gSSBjYW4gZGVhbCB3aXRoIHRoYXQgb24gY29tbWl0IG9uY2UgQmVydHJhbmQgY29uZmlybWVk
IGhlIGlzIGhhcHB5IHdpdGggdGhlIHNlcmllcy4NCg0KV2l0aCB0aGUgYWNrZWQtYnkgbmVlZGlu
ZyB0byBiZSBtb3ZlZCBhbmQgdGhlIGlvbWIgcGFydCwgaXQgd2lsbCBtYWtlIHlvdXIgbGlmZSBl
YXNpZXIgaWYgUmFodWwganVzdCByZXNlbmQgdGhlIHNlcmllIHNvIFJhaHVsIHBsZWFzZSBzZW5k
IGEgdjQuDQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0gDQo+
IEp1bGllbiBHcmFsbA0KDQo=

