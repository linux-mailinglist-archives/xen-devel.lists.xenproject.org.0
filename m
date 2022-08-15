Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFD6593117
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 16:57:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387573.623879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNbWE-00021W-Ot; Mon, 15 Aug 2022 14:56:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387573.623879; Mon, 15 Aug 2022 14:56:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNbWE-0001ye-LI; Mon, 15 Aug 2022 14:56:42 +0000
Received: by outflank-mailman (input) for mailman id 387573;
 Mon, 15 Aug 2022 14:56:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w1rB=YT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oNbWC-0001yV-EA
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 14:56:40 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130075.outbound.protection.outlook.com [40.107.13.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7773ba68-1caa-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 16:56:39 +0200 (CEST)
Received: from AS9P251CA0008.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:50f::12)
 by AS8PR08MB6709.eurprd08.prod.outlook.com (2603:10a6:20b:395::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.22; Mon, 15 Aug
 2022 14:56:37 +0000
Received: from VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:50f:cafe::46) by AS9P251CA0008.outlook.office365.com
 (2603:10a6:20b:50f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19 via Frontend
 Transport; Mon, 15 Aug 2022 14:56:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT062.mail.protection.outlook.com (10.152.18.252) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Mon, 15 Aug 2022 14:56:36 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Mon, 15 Aug 2022 14:56:36 +0000
Received: from bffc86e602fe.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DB89D234-EC55-4B81-9FE1-B14C2065F0D5.1; 
 Mon, 15 Aug 2022 14:56:29 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bffc86e602fe.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Aug 2022 14:56:29 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB6907.eurprd08.prod.outlook.com (2603:10a6:10:26d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Mon, 15 Aug
 2022 14:56:26 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5504.025; Mon, 15 Aug 2022
 14:56:26 +0000
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
X-Inumbo-ID: 7773ba68-1caa-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=eG8IxSRFq6Q5+E3els5vz2lB9ylHI2LLIS5MgJazsB1qqeOZaM7DLZmkli3aVqJrbK45coP3zK/60MfWRUNedczsTpeWSxHtyBVJyXFbMEcRxNJLPDSwdb8ni1nafqOJiKheu6mPEXRI0VgxFX8ON9k28QX7JGRMIns7XRaupuh8zIInNmlK3BKuzMyeFg+HWVLe65uyteK8uZNMFbsHQVeJY9aYhiNuzDOcMUOxD/5WfsAaaum0bmw31qR8eiy0zCfawhh1WQgHKFK33f7HSuy2DteM0o3RLq1WsJ2JKY7sTp5KZVwB7TAbB1Ghm+FpNayBuHNX75Oul34PyCUaUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tb3QTD12c3WDUlUGs3+CJwFApA3fmyTQZWW85PfWcWw=;
 b=fSLFZsOu6hM/lOYNp30y9ILcj00yaE47+q8zI5vvkl/65RJNAvVenKJCgzaoJHI/AIbsKOTnKTIDLc5GK96ie09aB6NYoEjRS+MxEnE6evLo518Cp52mPK5NGC64PS1f+9jgYpfY/7+z7ZqTST0sk4Aon/a3xU5IfLHbiO0LdMpKcP2AtSxDSsqo+XeIAG0CLZSuAQF7XItsB+e3jEwQ2wtFn0SgkN9SbwzxyaLb1H+SIwS9xXy4SuDZnWOlGPayAYMMoh8LyPCaEh7xBoC/4O/3BarnJw/fzB5g37wbsKpR67ESHFvuOQ7sVETxgXB9OGuvDS7j2yDEnkHh9FB4rg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tb3QTD12c3WDUlUGs3+CJwFApA3fmyTQZWW85PfWcWw=;
 b=IphmlyXiqD6b2S7Yned5trxD5iwSNqad1GM9ZnmNKVUX5/I9CWmnOq1GjgjEZx6eyxM8c+NKbvvU5UgSHteNkGqQA85jYoms8tT8PVkdomJCzvTSdWqqKA3PX1+m3ZXTFD/zjqX7A9vxd/z9BKT9Z/nIrIBMI8uTksFWsMJwkKQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ba437cc6d66216c8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMSHdMj/eTbweiKBXAy8Y/4CQj40QZvwToozdxB94tS54kOJv3l6Hd2hw2v/8Dk7B86NVBs/XCvn/DEj3rBCAmaMl5DWXL8BhMh82HSytgxO+nYfhH9HyxWRSWIcY8I75U73Y2oXUxyuh4pJUo37yyRneLWW9tFiPrqv7a0LwSunAOMCIZyytZX+PY49Ui7po01RY9BLLd2WEUAv6hs79tr65LYigx9S0JL+BtmNYC6WZXXhr0vVoxt7y/oXAD/o0n6Du150gh6wlIjmMpJsu6M3VWimB4d0Fdr3EwpPIUeOaWcFh5SGk6Z9KuyA8tK9wLLfmZffIrDtzxKhwlVBxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tb3QTD12c3WDUlUGs3+CJwFApA3fmyTQZWW85PfWcWw=;
 b=Sgwx8fsgSszK4lpCa8upJHkUgLYkGPbbZ3q4EGicriNiTAy9JMEAMUbD+cfhfuN7/7T4XRKa2ZAf34+zdCKFCHPOP6CiRSFk6Jx08P8qTeR49kiouf8/K5Y0fPrV38QyZDvfMhAt223L0UcQtidmDYQH0HcijWlHBHIrYLRrsLpy8btZSGh/bbb+/vJ8scU4I1Y2Zxc4qatj2R52k3d5C8gQ7N6j1BAPw5iAeGsKXg3q6/kfGRf2N6dKsB4kCWJC2YciQacc5BRjUcxrNZQl5tPnHFTKS35wbUFUR9gxswbSbAk6/SkbyaLUsAfv4JMQP+zfcruPz0hWfA3bXuzC5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tb3QTD12c3WDUlUGs3+CJwFApA3fmyTQZWW85PfWcWw=;
 b=IphmlyXiqD6b2S7Yned5trxD5iwSNqad1GM9ZnmNKVUX5/I9CWmnOq1GjgjEZx6eyxM8c+NKbvvU5UgSHteNkGqQA85jYoms8tT8PVkdomJCzvTSdWqqKA3PX1+m3ZXTFD/zjqX7A9vxd/z9BKT9Z/nIrIBMI8uTksFWsMJwkKQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/7] xen/arm32: head: Introduce get_table_slot() and use
 it
Thread-Topic: [PATCH 3/7] xen/arm32: head: Introduce get_table_slot() and use
 it
Thread-Index: AQHYroFG3JZDThh1+UydeUUbxrxvlK2wEWAA
Date: Mon, 15 Aug 2022 14:56:26 +0000
Message-ID: <AD5B8AAA-2E0C-4F2B-AC76-73F876FF0B36@arm.com>
References: <20220812192448.43016-1-julien@xen.org>
 <20220812192448.43016-4-julien@xen.org>
In-Reply-To: <20220812192448.43016-4-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a2dcaca9-3d0c-4329-6efd-08da7ece5a26
x-ms-traffictypediagnostic:
	DB9PR08MB6907:EE_|VE1EUR03FT062:EE_|AS8PR08MB6709:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 da2TqrkdPePRunYVjn75nTP+o8cK8IHNg0MKMV1nLq1obm8fdVLjHlakY2J/0JMbfDF9+AyALUJ1HciCGOK4MBTjHf/mY9RDMOQwI2fKDghUXkxVOTQYkG6t2u1ldshBGleCkpWocPrgVRJH8CbccUEV4HM/ZxFt2QdYKEndMpm5NFE4Ye8qsT1Mzl9oSnaXlk3/pByAqsIf7iSv3EXluPitlus+4hwraWbn5GKmuvrYEvg8AT6HLikxinoJnQQFBqb30sLfbKRHm3ylBdBCAlPpZhN5BR8XlUtrErICnSrcDT3hsfUjk0pD+Q0h7ElkJ5ocJ9xBrFQ02pXTWb+HIUlOgyi1kWfHMfsLIUpcYC+WQCUnmWByP8ftsdEnFI6G62yH33Z8nEqIFVhGS2T8cZzx/tmCOfkqC3S4vJk5XjPRnBkhJ4yU3lN7FeWUDNqidrBVSH8JU2qL/6BubUCJrbBYVx7kN2gF4C5JLz7tvsxSvwPuvuVbSGGf6MpLZukwRDrIHXAwh9jJMOyoyG5Pt5cNoWfU8gqt5JIyS2PjpDWKvqy23UQRKIZN805JYmXYE0m/h6rYJHRB3re6qiUeUAym4yqjpRn6CvNipVGAqFO6wWFwPeZRKCBnCVa8WTLYrq6Mak0moIY3dwdWUcavbhr5HlQl1uwcJwKwHRc2p8yHlRENACJLJldNgojJ5hJWrSbCky0H8EXeRXumC2S7qO1UKBvDyRda+wKoyAlkwgRZ0qEm1KuHpYCath2TjqRDKA/RLJANltAKdaQdHj543tFwUkN/WBk43zi7bP7ESF/uz6uEZU5XlE/hvVTV79WjfuIFxlBjF71PKz8IvL8C7A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(64756008)(66556008)(4326008)(66946007)(66476007)(8676002)(316002)(76116006)(6916009)(54906003)(91956017)(5660300002)(8936002)(2906002)(66446008)(122000001)(38100700002)(33656002)(38070700005)(86362001)(478600001)(6506007)(53546011)(36756003)(71200400001)(41300700001)(6486002)(83380400001)(6512007)(2616005)(26005)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F984DAE780E07C49A45EC11C4A1C4BA8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6907
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	195a01f9-fb7c-4ee4-2c56-08da7ece541d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MVZDdeJolNnVuobMajTxr11AhnOYeq17Gnkd8tthCCYBsl01ebrW8ki9fRBY+i8RcRnres0EK1QQUcZDyGqD1RMW0+H1jhOKByCJCqOklbDF2cCIOq6YJdYpX6fAyZKMhHd42862xowT6P2sCWR7BjM1SM/zCM5wOv+H7giPPYziYz2xOGzGFu4P1iahaKoe4p5rbITov/SHDcDSbfZ2TZALbUBb862NFIdL8BzsNJk9LvDrloWhg2CDlVpborEF8YH2K1iJD8kDG/DW5uPnyP7UfmMsaClEQSB2R/utAm2OGkMO0tGqEzR0rcdrDYEkJU4JTdkRPqhbXdda5VYF/D8ucIV+YGQ2phVkbKAwMjgA+5kf2L3hkVQwgsQ4QffpTozfBoFAEMyUFJTyicTOVK68mPDSgnx98lzeLEye33u6860RIkiB7G8i3Dcn81lbmkXCzn8RXWulGTvt/+EXQ25ip4qZ7l/+ZmQDWMNpJ067ayCZInR42MnfHeH/rfXfXP/KM1ZkHhkkkxM4xE5T26UxGO59bc0CN5LLzwFxUCahgJrDfn/Az0GhOSF7Zrimwkx/wWw50FLHosOxenwiNtTWr99IpkaM9o9/sU1zaFGRUhSdfHuH0QpxuQ3Ck4kAlYCa8InUtC8iKgW94f/tPP1AbLBvFVkahcNSmfPoWMVEs1U5XOApMYfbjviC7sv6dHUAvuvj5xu8fJF4VHiklGYyKsiwz2DhjbivQ1QUdO6wn5xfv3SJBEkV779z8nqaDVU+ONVJClBn5xfdHOsQ4oyrMo/74PtPSnKy8M8GuWk1XMqU+dX5UdgrOi9t1MlY
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(376002)(396003)(136003)(46966006)(36840700001)(40470700004)(2906002)(40480700001)(4326008)(8676002)(8936002)(36756003)(82310400005)(70206006)(70586007)(478600001)(6512007)(6506007)(316002)(54906003)(6486002)(53546011)(26005)(33656002)(41300700001)(82740400003)(356005)(81166007)(86362001)(107886003)(2616005)(47076005)(186003)(336012)(36860700001)(5660300002)(40460700003)(83380400001)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 14:56:36.5771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2dcaca9-3d0c-4329-6efd-08da7ece5a26
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6709

Hi Julien,

> On 12 Aug 2022, at 20:24, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> There are a few places in the code that need to find the slot at a
> given page-table level.
>=20
> So create a new macro get_table_slot() for that. This will reduce
> the effort to figure out whether the code is doing the right thing.
>=20
> The new macro is using 'ubfx' (or 'lsr' for the first level) rather
> than the existing sequence (mov_w, lsr, and) because it doesn't require
> a scratch register and reduce the number of instructions (4 -> 1).
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Also I passed our test suite on arm32 qemu so:
Tested-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


> ---
> xen/arch/arm/arm32/head.S | 56 ++++++++++++++++++++++-----------------
> 1 file changed, 32 insertions(+), 24 deletions(-)
>=20
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 46d93bebbabe..50f6fa4eb38d 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -358,13 +358,31 @@ cpu_init_done:
>         mov   pc, r5                        /* Return address is in r5 */
> ENDPROC(cpu_init)
>=20
> +/*
> + * Macro to find the slot number at a given page-table level
> + *
> + * slot:     slot computed
> + * virt:     virtual address
> + * lvl:      page-table level
> + *
> + * Note that ubxf is unpredictable when the end bit is above 32-bit. So =
we
> + * can't use it for first level offset.
> + */
> +.macro get_table_slot, slot, virt, lvl
> +    .if \lvl =3D=3D 1
> +        lsr   \slot, \virt, #XEN_PT_LEVEL_SHIFT(\lvl)
> +    .else
> +        ubfx  \slot, \virt, #XEN_PT_LEVEL_SHIFT(\lvl), #XEN_PT_LPAE_SHIF=
T
> +    .endif
> +.endm
> +
> /*
>  * Macro to create a page table entry in \ptbl to \tbl
>  *
>  * ptbl:    table symbol where the entry will be created
>  * tbl:     table symbol to point to
>  * virt:    virtual address
> - * shift:   #imm page table shift
> + * lvl:     page-table level
>  * mmu:     Is the MMU turned on/off. If not specified it will be off
>  *
>  * Preserves \virt
> @@ -374,11 +392,9 @@ ENDPROC(cpu_init)
>  *
>  * Note that \virt should be in a register other than r1 - r4
>  */
> -.macro create_table_entry, ptbl, tbl, virt, shift, mmu=3D0
> -        lsr   r1, \virt, #\shift
> -        mov_w r2, XEN_PT_LPAE_ENTRY_MASK
> -        and   r1, r1, r2             /* r1 :=3D slot in \tlb */
> -        lsl   r1, r1, #3             /* r1 :=3D slot offset in \tlb */
> +.macro create_table_entry, ptbl, tbl, virt, lvl, mmu=3D0
> +        get_table_slot r1, \virt, \lvl  /* r1 :=3D slot in \tlb */
> +        lsl   r1, r1, #3                /* r1 :=3D slot offset in \tlb *=
/
>=20
>         load_paddr r4, \tbl
>=20
> @@ -448,8 +464,8 @@ ENDPROC(cpu_init)
> create_page_tables:
>         /* Prepare the page-tables for mapping Xen */
>         ldr   r0, =3DXEN_VIRT_START
> -        create_table_entry boot_pgtable, boot_second, r0, FIRST_SHIFT
> -        create_table_entry boot_second, boot_third, r0, SECOND_SHIFT
> +        create_table_entry boot_pgtable, boot_second, r0, 1
> +        create_table_entry boot_second, boot_third, r0, 2
>=20
>         /* Setup boot_third: */
>         adr_l r4, boot_third, mmu=3D0
> @@ -486,12 +502,10 @@ create_page_tables:
>          * then the 1:1 mapping will use its own set of page-tables from
>          * the second level.
>          */
> -        lsr   r1, r9, #FIRST_SHIFT
> -        mov_w r0, XEN_PT_LPAE_ENTRY_MASK
> -        and   r1, r1, r0              /* r1 :=3D first slot */
> +        get_table_slot r1, r9, 1     /* r1 :=3D first slot */
>         cmp   r1, #XEN_FIRST_SLOT
>         beq   1f
> -        create_table_entry boot_pgtable, boot_second_id, r9, FIRST_SHIFT
> +        create_table_entry boot_pgtable, boot_second_id, r9, 1
>         b     link_from_second_id
>=20
> 1:
> @@ -501,16 +515,14 @@ create_page_tables:
>          * third level. For slot XEN_SECOND_SLOT, Xen is not yet able to =
handle
>          * it.
>          */
> -        lsr   r1, r9, #SECOND_SHIFT
> -        mov_w r0, XEN_PT_LPAE_ENTRY_MASK
> -        and   r1, r1, r0             /* r1 :=3D second slot */
> +        get_table_slot r1, r9, 2     /* r1 :=3D second slot */
>         cmp   r1, #XEN_SECOND_SLOT
>         beq   virtphys_clash
> -        create_table_entry boot_second, boot_third_id, r9, SECOND_SHIFT
> +        create_table_entry boot_second, boot_third_id, r9, 2
>         b     link_from_third_id
>=20
> link_from_second_id:
> -        create_table_entry boot_second_id, boot_third_id, r9, SECOND_SHI=
FT
> +        create_table_entry boot_second_id, boot_third_id, r9, 2
> link_from_third_id:
>         create_mapping_entry boot_third_id, r9, r9
>         mov   pc, lr
> @@ -571,9 +583,7 @@ remove_identity_mapping:
>          * Find the first slot used. Remove the entry for the first
>          * table if the slot is not XEN_FIRST_SLOT.
>          */
> -        lsr   r1, r9, #FIRST_SHIFT
> -        mov_w r0, XEN_PT_LPAE_ENTRY_MASK
> -        and   r1, r1, r0              /* r1 :=3D first slot */
> +        get_table_slot r1, r9, 1     /* r1 :=3D first slot */
>         cmp   r1, #XEN_FIRST_SLOT
>         beq   1f
>         /* It is not in slot 0, remove the entry */
> @@ -587,9 +597,7 @@ remove_identity_mapping:
>          * Find the second slot used. Remove the entry for the first
>          * table if the slot is not XEN_SECOND_SLOT.
>          */
> -        lsr   r1, r9, #SECOND_SHIFT
> -        mov_w r0, XEN_PT_LPAE_ENTRY_MASK
> -        and   r1, r1, r0             /* r1 :=3D second slot */
> +        get_table_slot r1, r9, 2     /* r1 :=3D second slot */
>         cmp   r1, #XEN_SECOND_SLOT
>         beq   identity_mapping_removed
>         /* It is not in slot 1, remove the entry */
> @@ -628,7 +636,7 @@ setup_fixmap:
> #endif
>         /* Map fixmap into boot_second */
>         mov_w r0, FIXMAP_ADDR(0)
> -        create_table_entry boot_second, xen_fixmap, r0, SECOND_SHIFT, mm=
u=3D1
> +        create_table_entry boot_second, xen_fixmap, r0, 2, mmu=3D1
>         /* Ensure any page table updates made above have occurred. */
>         dsb   nshst
>=20
> --=20
> 2.37.1
>=20


