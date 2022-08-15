Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 424F459335E
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 18:40:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387687.624032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNd7d-0002dP-FC; Mon, 15 Aug 2022 16:39:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387687.624032; Mon, 15 Aug 2022 16:39:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNd7d-0002aI-C2; Mon, 15 Aug 2022 16:39:25 +0000
Received: by outflank-mailman (input) for mailman id 387687;
 Mon, 15 Aug 2022 16:39:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w1rB=YT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oNd7b-0002ZX-VL
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 16:39:23 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80049.outbound.protection.outlook.com [40.107.8.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0fa69b7-1cb8-11ed-bd2e-47488cf2e6aa;
 Mon, 15 Aug 2022 18:39:23 +0200 (CEST)
Received: from AS8PR04CA0143.eurprd04.prod.outlook.com (2603:10a6:20b:127::28)
 by HE1PR0801MB1961.eurprd08.prod.outlook.com (2603:10a6:3:49::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Mon, 15 Aug
 2022 16:39:18 +0000
Received: from VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::38) by AS8PR04CA0143.outlook.office365.com
 (2603:10a6:20b:127::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.18 via Frontend
 Transport; Mon, 15 Aug 2022 16:39:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT038.mail.protection.outlook.com (10.152.19.112) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Mon, 15 Aug 2022 16:39:17 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Mon, 15 Aug 2022 16:39:17 +0000
Received: from 7ee0735a52d6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 859AE13E-45BB-41B8-9E7A-411BF6A11A94.1; 
 Mon, 15 Aug 2022 16:39:10 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7ee0735a52d6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Aug 2022 16:39:10 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB7042.eurprd08.prod.outlook.com (2603:10a6:102:208::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 16:39:08 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5504.025; Mon, 15 Aug 2022
 16:39:08 +0000
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
X-Inumbo-ID: d0fa69b7-1cb8-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=LkD98OvCQoY1eFTot7e9DgXK+ezwKQWQjxBnEs/0L5+AzASHMvIa5DGOZjvw8oiGuQgiHkmvEW2UsYwJK+8VoWgndiyHtYp6G8Ax8Vdjjh/ub0552xzr70I40Uk5aE8HqpB+w16v2SdNH3TrBpfdtjkGotZ1fD84kx06skQ2qPhxENpuL9FI8zztz3fV06ecJkYFpQQOJ0jqN+v0s3lCiwE9nyivh9fu7y03luKCIPYMHvmRft8yerfTuN78UZ1IYkZf3yMFBb8v77YAiVyczpPWlu+YFC88cyTk4KdCzMfN3XYj1SwNQH/XKhcW2Pw2RciwDSXInhpZ1F+vY57KDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfpsNsjbhbCj+pcx7fX0GODGxtw9mPwYtLwvKAQNYXU=;
 b=INhLTz9ZlUYdvBVkW6GNXPUxqV0Jq/ObyIBCAgKkKRDHDVsS3hje06s44yUzgJHWDgX8otLMIhpuVpW5AjQc7J9ypsygt80YOQx4t19gwBZEW3fiIgBjnms42fHkLSJxGt+6vSHFXyFLs0IE+6+qZC4XQACGNHihA67jTAKRkL8nZnh17Eqr8iiuNpkT8L9BWWt4toomhKekYrGiRQ5R0oyply+Fn01aGwOVIlxrDPg4px6ju78zuw+rEZGJ1bwi8u5r97TgUolS8yWveBm10stFL4HgcL1pOL7qJ8tUs58f9Vl5tQafBIAd8wVwZzB2XKKKho4c3jPoB7qs5ZUdnw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tfpsNsjbhbCj+pcx7fX0GODGxtw9mPwYtLwvKAQNYXU=;
 b=UmELiGkO/32g0+y2syt5FP4VK+82yIqb+fi5foL7otw/TGhNFL3vC3BD20v9ZxIJpCP+udcW6bbA12H9m46zjU1f2F+NsskErMzmEvnC9EyQjscT8To7T996oseQr6DaQv3RPHPZ/X2XJC816piN+ANk4xufotINWwC8uwC00l4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f0a7d7d02a6566a6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ltdek6maqaWyY5E5lt4rjQ+I5qdaol6JJLb4X2/I3GYa0JPz9UdhwongM4d9leJiPDcH734YBPdlwkVqeNGnyf6vpsKzlQcvkESfWCLsq0CHJnXDP0YxHt6+sIHliOKmZDVJQ9Wms6GFDASo1Uu+KQlsbIiEQUcCp/+8wd8hHE0yWsAUPkQjtaqzvaZC6NdhLbsI27pRSY8WE3DfxEkfAV9/rBtZLa6xgiDrZIZObnTuI9Cw2P/wMCsMC7R2HqYamtScF/JRDgFzkqgxQvwQgZzjIFMbXxLw4F8PLb5pXBnyF0pSLaepMhb+9NCyFP2enzBx+adcLCHBPKtq7z8acQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfpsNsjbhbCj+pcx7fX0GODGxtw9mPwYtLwvKAQNYXU=;
 b=C068Ui2klDLdFvjynAp3qL7PCY6UMM87yS/tOLPj1Sln05+YQ/bUuBciws0Orm0HrO8oFcMfzSCT1LYI+emV0/Ai/8QHJqDpSSC37V+7+53+0EdS8GJt3C9PqBW5e6rkqqO267h6YwlgibQm2q43MOL7jpzrXBt+h059mF6DvhSoPW5/LAbemMZjsua+GQ+uW/auDOUuyS0Egvg1AZSKxClrqcETCoJibeWkkrVTAXe5zVC19JKFLebHpL1kk/uGVtL8wJvhj4u2xnkGZxnDPSSpX/6gOg4uOw3m10lxBOv4xrCsSRRzpppTJ74nWvN59hy9s4lJ67Q0FhxKqCoCVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tfpsNsjbhbCj+pcx7fX0GODGxtw9mPwYtLwvKAQNYXU=;
 b=UmELiGkO/32g0+y2syt5FP4VK+82yIqb+fi5foL7otw/TGhNFL3vC3BD20v9ZxIJpCP+udcW6bbA12H9m46zjU1f2F+NsskErMzmEvnC9EyQjscT8To7T996oseQr6DaQv3RPHPZ/X2XJC816piN+ANk4xufotINWwC8uwC00l4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 7/7] xen/arm32: traps: Dump more information for
 hypervisor data abort
Thread-Topic: [PATCH 7/7] xen/arm32: traps: Dump more information for
 hypervisor data abort
Thread-Index: AQHYroFFG1SBMYgirU+4BTxPWgpRqa2wLhCA
Date: Mon, 15 Aug 2022 16:39:08 +0000
Message-ID: <C817E0AC-5A5F-46AD-8D1C-A472F9C004CF@arm.com>
References: <20220812192448.43016-1-julien@xen.org>
 <20220812192448.43016-9-julien@xen.org>
In-Reply-To: <20220812192448.43016-9-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a1fee582-71ad-4b2a-075c-08da7edcb26e
x-ms-traffictypediagnostic:
	PAXPR08MB7042:EE_|VE1EUR03FT038:EE_|HE1PR0801MB1961:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QvgCWaTkRpEcCZ5Q8A8RJQzXLr2ED9fnRkToiVW7d8UXc6fAkNmY5t5egk37TXx679/kBMQ3q+4TNsk3wHYLQZjAkx+yLLSVrmraEBQj6DuiUX4eriJSa0p8nuF941DF7lFqjCC0NeZSOnl8LmWT7Wl/kMEDHAp1y6WbxdmbVE82yWiPLWpsi3R9nMgceNlzHrWkVcb1z9pN5vv6zC/goe6U4phF5uZvLmX80LzzkeV8nOSSL6Ugc+TB8Vc1x1b5EHY3wnZpypOUXcdMIPKVk/F5muNa8NLvBAL63AlK3LWmf7HeDjkND7wdzeGfhyA4hoHBx952qHI5yKmiy8hZmjh1Ktvj0Tt655ksxX12jz2sx7KH6WwdN2cauxmkt0oAmqRr179d5/xNglDCR9XkWLCE21SW78yr327HXW01Q6BOF5WWwU/R7f5pgH5ptbVK7XCdkOWPaP15S+kwLQ1pT0hEl/IiVYVdsDncRUSmFnJ8IKopgOG4M5am8SLtueAQwBaJRvOgkGzMHo0EyrOYIrRriEagpJkSuHuWRlhXVzF11PMxX1lMLhmTrmYTxR+AALI1W85IOClZlFK3iS2I/TgtEnoOy79Q9FdX2C8B68fPoS5qcZ7SE8YUjjtbEc7hf06cVD6xuRbpsEZuNyWfFaFbDu01UnIS4xlvZBY0k9ZFAK1epJU5M8niLRtWgZRqr426A6GdDa8BV/qA0RSp7mBB5cNCsvwLFPHRDlLbCB3pIg3QPzPvTyyVBvnGHn0yjYi5NIdTQMuT2QjH7wPYCpCSFZrlFd+wd0Eeq4+/K6ESOBteYHlAvWjpR+9/7fWDcX/zPQAkwc1Deb7iJBGBtg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(54906003)(5660300002)(6916009)(6506007)(53546011)(41300700001)(86362001)(26005)(6512007)(8936002)(71200400001)(66946007)(38070700005)(478600001)(6486002)(66476007)(8676002)(316002)(64756008)(66556008)(66446008)(91956017)(76116006)(2906002)(36756003)(4326008)(122000001)(83380400001)(2616005)(38100700002)(33656002)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <59C68C5345AF1F4593D231D4A7A6FBD5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7042
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	17ae567a-a85c-4881-7023-08da7edcacd2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EPHY6xLzLIjI+o0o1ttCFGmuaMYYIoQWdVTd8QeTABPVc/Vsx/+cwH+Bz2c0lY0n2eOHNetmBonh4o/3EkImIjz7f4pvIZ2Eof3auGRa2mFEdagNQrd6ifNscBCnew8zHOrf/1i7dlgW8929Ie5c+Ib2E1HcI9Kv7lR9mLh/p0vduprm9+/ceHh7ThoQdG2LYULlqXwFwkBJ6snHrOBYvt/tmccHow1Bbq5rOgmxHwcQMh9kYTsp8KPq9O4Zh1Uq0aiuBAsNQ9+KeqauIiRwazA6ENSoLEnwIJN2MEzH90ju35AF74PEWvgMrAqZ1vEAuTPqY/LvkPhSg3czY1GJugrxg16Wl/C7vvTW+HkTYUqqAIV5cf1ghbmJIgH5laJgqTs9+K7kUXB1Iju9wjlkaQnoXPTU1FH8cs5UidI8JSkazMTbQlq/KdH33/m9N4pgyE/zPAetXUsn7mlE/GF0tlTmh4Up71JTP/feTeuNc+5cnA/osIiFmFpE2kaVfZ3agNvOhS+mFFssgMkHW4d8zJdmLP0Wu8Mv/xep26WIZDZfJxueAIhrUUagsU5MwSUrSg+VqYPAmm4PiuVtdQebWa4FSNsSYLu7K/4UWnzh2/7Fe/O+MIqD5mUK4GAc342gpP5AyyOvQbOCstKiPd2kofSf+68ga0rmfHMO6q8Ds5a7gL7UUaWyFXID8oIXC8ePyFjKyZrCsHwMpZEPhUsbNeWJjjMAFqm/AW+uobRM3K5nCA5ZC6DWmkGMVX6HHQbbr7KtBktszJ1Gi2YTG7y/RIMeMKLngen+cfW5rTkJuA9hw/0Qs6KYpIk+JqsDUQCC
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(39860400002)(346002)(136003)(40470700004)(36840700001)(46966006)(36860700001)(356005)(40460700003)(82740400003)(81166007)(83380400001)(86362001)(54906003)(8676002)(70586007)(316002)(8936002)(6862004)(2906002)(5660300002)(70206006)(82310400005)(53546011)(6506007)(26005)(2616005)(6512007)(47076005)(107886003)(336012)(4326008)(40480700001)(186003)(6486002)(478600001)(41300700001)(36756003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 16:39:17.6713
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1fee582-71ad-4b2a-075c-08da7edcb26e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1961

Hi Julien,

> On 12 Aug 2022, at 20:24, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Unlike arm64, on arm32 there are no extra information dumped (e.g.
> page table walk) for hypervisor data abort.

The code in arch/arm/traps.c has nothing arm32 specific like that so
could you explain this statement ?

Here the arm32 code will call the generic function which has only
something specific for BRK handling but the rest is generic.

>=20
> For data abort, the HSR will be set properly and so replace the call
> to do_unexpected_trap() with do_trap_hyp_sync() to dispatch the error.

I agree with that, I just do not understand your previous statement here.

Cheers
Bertrand


>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
> xen/arch/arm/arm32/traps.c       | 2 +-
> xen/arch/arm/include/asm/traps.h | 1 +
> 2 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/arm32/traps.c b/xen/arch/arm/arm32/traps.c
> index a4ce2b92d904..a2fc1c22cbc9 100644
> --- a/xen/arch/arm/arm32/traps.c
> +++ b/xen/arch/arm/arm32/traps.c
> @@ -81,7 +81,7 @@ void do_trap_data_abort(struct cpu_user_regs *regs)
>     if ( VABORT_GEN_BY_GUEST(regs) )
>         do_trap_guest_serror(regs);
>     else
> -        do_unexpected_trap("Data Abort", regs);
> +        do_trap_hyp_sync(regs);
> }
>=20
> void finalize_instr_emulation(const struct instr_details *instr)
> diff --git a/xen/arch/arm/include/asm/traps.h b/xen/arch/arm/include/asm/=
traps.h
> index 08bc0b484c75..883dae368eac 100644
> --- a/xen/arch/arm/include/asm/traps.h
> +++ b/xen/arch/arm/include/asm/traps.h
> @@ -73,6 +73,7 @@ int do_bug_frame(const struct cpu_user_regs *regs, vadd=
r_t pc);
>=20
> void noreturn do_unexpected_trap(const char *msg,
>                                  const struct cpu_user_regs *regs);
> +void do_trap_hyp_sync(struct cpu_user_regs *regs);
>=20
> /* Functions for pending virtual abort checking window. */
> void abort_guest_exit_start(void);
> --=20
> 2.37.1
>=20


