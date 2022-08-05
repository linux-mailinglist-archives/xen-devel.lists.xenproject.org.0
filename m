Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 077B958ADE8
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 18:11:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381399.616061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJzu0-0006Vb-3l; Fri, 05 Aug 2022 16:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381399.616061; Fri, 05 Aug 2022 16:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJzu0-0006T1-0P; Fri, 05 Aug 2022 16:10:20 +0000
Received: by outflank-mailman (input) for mailman id 381399;
 Fri, 05 Aug 2022 16:10:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fcVI=YJ=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oJztx-0006Sv-Te
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 16:10:18 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80079.outbound.protection.outlook.com [40.107.8.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 178496a9-14d9-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 18:10:15 +0200 (CEST)
Received: from AM5PR0601CA0040.eurprd06.prod.outlook.com
 (2603:10a6:203:68::26) by DB7PR08MB3355.eurprd08.prod.outlook.com
 (2603:10a6:5:18::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Fri, 5 Aug
 2022 16:10:13 +0000
Received: from VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::cf) by AM5PR0601CA0040.outlook.office365.com
 (2603:10a6:203:68::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14 via Frontend
 Transport; Fri, 5 Aug 2022 16:10:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT005.mail.protection.outlook.com (10.152.18.172) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.16 via Frontend Transport; Fri, 5 Aug 2022 16:10:12 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Fri, 05 Aug 2022 16:10:11 +0000
Received: from e5b718851d47.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1C561093-23A1-4896-BE36-57F312C04C45.1; 
 Fri, 05 Aug 2022 16:10:05 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e5b718851d47.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 05 Aug 2022 16:10:05 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DB7PR08MB3258.eurprd08.prod.outlook.com (2603:10a6:5:20::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14; Fri, 5 Aug
 2022 16:10:02 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5504.016; Fri, 5 Aug 2022
 16:10:02 +0000
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
X-Inumbo-ID: 178496a9-14d9-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=I+YvdefhrC9Qau7lv7UihBN4MUlidfoCR3ueweApe2Y6UdjI13Yq/h9UXXYdNUO15i1WMblxenpMfSnWQI6MlvUIS4BkoT9S1t/YlRkzsKpXoDG3obL5gdEOa15bhl/FQZSbfilmYmQUKZT7IO68/kQVjyXZXpqFDi7hbUCQW1DiwzIxVB8/8wig5mVxEPsCL1+aOultPGaHTIhjs1xQGXfuJVL7Tf720qUFbU6lDqNr9gj9yaaVX8tyJ++H5OIx0XsaeJlnxEnuiN6GpLyY9PZISUFq29KN3uZ7JsT7nb4f9X1MBc/BpxwqkoiaGGaEsw0pH2U1ZJzJduTXEr7Swg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fkv2TXGSGdP8MJxcQkTVVcK3+7Dx1+KwTSkxmIxAeQ=;
 b=X8vxt6G/WBLsFKeUzkuwlaZs49bnlrxoHl0N4nZ7syOhUsgEE0OIlUa7+NaMNlsrj1B/xYIalNUk8pKLiil2rDYcZUAnFnHrfPLqPbg7KBg9l/4gGIjg1pvbb3mPja5tfs9S2Wr8xLtqP4xf+MOvxAZTIgsoyLjSTfiOVFlsKN5ltiHLz8P+ZqdtAPAa8wBMKOboITy2LI3srsDm+tsBU1jUF5bZvD3g2Zz0JXkrRn7Ry6eiVZNZvhgUplXZSkirAMlsXkfGEAM4E9myC6A3CcNc7DOdcpoyuU03nR3MLlXq+3SlokG1DVd8O0VtSgDpXX7r+LPL9uCVii4L+JIraQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fkv2TXGSGdP8MJxcQkTVVcK3+7Dx1+KwTSkxmIxAeQ=;
 b=fDOLvxRlSIyKbRIGJ1Ov/K/hJtAOQA+gSLzey4F47/orCQFTB4Kupr3SUOSA5z9/BX7PGIDYlVzZhyp4jak99FvoGz00pmZ94wwvdhZbRy8ubJV5HYamwq/5ndc9lOfc/DczLnUz1hwbycWFSQC1mDM7i7cpyE9fITQcgW9CTe4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a08be334e8a542ad
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YstDgAOKaHktdYWY7iRZeJlW/dokvSwbFh2PLXuspBzIW2t8mduGzHdy8P7wxd5wa/syLi99C4vDOI+cYg6nU4Uo3/ESkHIQmBU/zAr05itD8Id5hY43L35n0xOXupDV9+5RI7vMQ55BTqCkjnq3jnfPabnZF8YssvJLdFme/Im+oEiA7jjDVcqi6UaMe4/LZCych4xm7eX8VXCvaG0VGsuI51elQZubYillnzpIjykGK3/rhwRm8mVtzFVCMXVPnqHGtPS//g7f4b4Fa73z/5JG49h6YYKj5ReMuuY+KHTWFF7k5ovYALVNvqusmYrfy1aRAwK7531iYlVf5gSOzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fkv2TXGSGdP8MJxcQkTVVcK3+7Dx1+KwTSkxmIxAeQ=;
 b=g8zt+VFyK10QeOHlpjrGhEBOUmMmaKcUBh7EppuwZmtbbKN0F9pFjW6z8djhnnRFwMsc3V5q09HMXdt4sGk/PMW13t53bpNFwb2Z99vq3UWikGdzluqJVL9b1790kKwBjPfB+d+c2zliKoLlSc0pgHgZx6rJr0TvCxH1dgoL1gqiQp+7G248PsFB9tOTiyl8Q5/nfRJMiblnHCHII/JJzxzM8XcGT3Q3KPx+/WNhUD1tcnbmnUXcWiAoDS5nr2mqvSZ20wLPOPL6KV4CPJrO6znICp7VkIsm0JabzdJOlFutFVb6aWpcjFuGWNvxWLo0y3Z7oehEG5AXKAdz+DsGlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fkv2TXGSGdP8MJxcQkTVVcK3+7Dx1+KwTSkxmIxAeQ=;
 b=fDOLvxRlSIyKbRIGJ1Ov/K/hJtAOQA+gSLzey4F47/orCQFTB4Kupr3SUOSA5z9/BX7PGIDYlVzZhyp4jak99FvoGz00pmZ94wwvdhZbRy8ubJV5HYamwq/5ndc9lOfc/DczLnUz1hwbycWFSQC1mDM7i7cpyE9fITQcgW9CTe4=
From: Rahul Singh <Rahul.Singh@arm.com>
To: xen-devel <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 7/8] xen: introduce xen-evtchn dom0less property
Thread-Topic: [PATCH 7/8] xen: introduce xen-evtchn dom0less property
Thread-Index: AQHYhkYA1mUxDH8Iek+Bi6llJii6za2gvxYA
Date: Fri, 5 Aug 2022 16:10:02 +0000
Message-ID: <B91E9B3F-27DA-4412-9F1D-AFD1287D0898@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <f2bc792f8dea59648b011cda4fe7c42929c4e3d7.1655903088.git.rahul.singh@arm.com>
In-Reply-To:
 <f2bc792f8dea59648b011cda4fe7c42929c4e3d7.1655903088.git.rahul.singh@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: faa0820e-153b-4276-a27c-08da76fcf9ce
x-ms-traffictypediagnostic:
	DB7PR08MB3258:EE_|VE1EUR03FT005:EE_|DB7PR08MB3355:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MA7+Hf8vDMO1vJ9zYqNgfSrJKKC//6jz2VsFFGurvl8TJmE9PGcmJek79RXgJsIRzEUrNyMC7UsVqBcC7PmAmRHgfSd6b01sxzkBhkcwSnUPHvLA2vSDkMhqYhBvco85MX1OuLygI4A2CUUp6dnCGwQz460y/BUGNoSmb2UPht5QoTpayIg6nX4aG+EN+IjI8Jg519Hwo3P64qTKX17EYx2jMuAib1K/2HdCSxz8M9qknWiU1VI6ffThFgstOg2xeAjixvCYF8x9ZCJwoJey58URx48tZHNAvZnEh0YS3MiYgi0kuqPq8YPnBITsn3xUKmo7g7rxVbt+3jdICpYSEzMKz8Q/FF28p2W8FOdqAn/C56fgKHiamrkxznK2r8HyWQIMCvmDWXMDZCeJ5LOzwsOfiJevJ+YrVa9vMhZQbUMiB4XTZSn2OxjQ2eZacmbPnD1olNaBVxT+MyHTmBtYcrc609kSljmkdefw5u1I3+tm2369CtqeFzmLrwz0/oWLOWiwD7DamQv3qg+b57qh8c8uIdKvgY9ARmHM1c8QEph/8va6Z/gxLFZi4CqhWnQ1kJu6t20OYbVZvQM07xqyWq+ASZGf205SwsCeT0Lent0uw2gd5zkuqjAomw95oU0ez0LqO2W4DQIkRTLHPg0x9oxrMyLaWMv85g++kn2B4ucr/P3VjmoHB402BZTPo31qvlN1D/FcADsZVjV2PupH95bRq2OA8XDtDwpa98FZXUUUEswiXulyj/wokFtUrhCTRj/JgBsrgrZKh0OvzBTQ9zCsPmOohTxdPodNIqp3wX/2XKdZtAJ/pxAdCIHb0xsiqvuiMeHTkld4qBF+PjeD5uyUNA5+AENQB0HZsWy8LQc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(53546011)(36756003)(54906003)(26005)(316002)(41300700001)(6512007)(478600001)(6506007)(6916009)(86362001)(71200400001)(6486002)(38070700005)(38100700002)(122000001)(186003)(66446008)(2616005)(66476007)(64756008)(83380400001)(4744005)(8676002)(4326008)(91956017)(66946007)(66556008)(2906002)(33656002)(76116006)(5660300002)(8936002)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FB703D0AE41B84409EA37F71A2D4103D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3258
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d4faffff-a099-4c23-c9da-08da76fcf43c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4hSGPTyfrcJoHFQYZRbWL4FwkAo6Iza38YoCKO7U6Q3peM/Qj1HmNJHjUDd649PEGRBEstZMBvvEZfkrPYZo5gHf9j++uecd78sIf89j+VgrGDySlFSD253IY9PoU82n5+Qb3egVqZWGIDK0K/GHV5bT93xCWwmUCv8vtwoqMpNjDiJ5hU1212nJrT4xgyYNsjoozHiKeQw1wEDySm2oKvKlt0lyjVFx8Fahp451+WFvAEbgJVsL4aw/7nhU8DQjI8RLoKK3564WqwMiQUhWFGk3OCy+5BXEBH7mTu0RVU82WXKA+Yo10xoGoTFS/aXVuBf25JcsITTFakUDG9qiuzBPcPiz5zUMMVnoD8C+wQxvxmQ7rqKQip7CgSo2StnTaRIXoavBObCIkRoCD30FUdH1lpv6fYYIOofcYNeipTA5foqxw/6t84hd1MnSzt49GTHihnW0TLrg/mAhTb5Z6h2tjMFkJIhSHmnxfxXholUL82BVIQZ9nyz6VYhEUVCbvN6Bt2/YU193FGAd2FyEcCednrQMdXr0VNLVKXXyO6cxIIawbhj8tW6QL7X86ycDJmYPA/YjuDJRVMWBbS63r4zxjPklQagnMvwUjyn9wQKCBfNK8s1C+PGe14W1Mt41GF31cvOVEAxj4SlkgvCDQmeybf4sOcMTbUKW+isXxaY2eSNAYLltBbI0RzaKqXj/4im1tGWP08Yan69F1PyHaspziAqGJwc4ZznhKHXqn/BdozWm0nuTgdghvv9RZfaSApDZJ9N3q6gJ42FqNvF1gdCiAx/5aPTDrOYAA+N+600VbGc2PmfS72jQvoDEuqA9PajEjUw3Nzw5GH+P3+K1UQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(376002)(136003)(39860400002)(36840700001)(40470700004)(46966006)(6486002)(6916009)(5660300002)(54906003)(36860700001)(82310400005)(478600001)(4744005)(316002)(70586007)(8936002)(4326008)(8676002)(70206006)(36756003)(6512007)(107886003)(47076005)(41300700001)(2906002)(2616005)(26005)(6506007)(33656002)(336012)(53546011)(186003)(81166007)(83380400001)(356005)(40460700003)(40480700001)(82740400003)(86362001)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 16:10:12.0001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: faa0820e-153b-4276-a27c-08da76fcf9ce
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3355

Hi ,=20

> On 22 Jun 2022, at 3:38 pm, Rahul Singh <Rahul.Singh@arm.com> wrote:
>=20
> Introduce a new sub-node under /chosen node to establish static event
> channel communication between domains on dom0less systems.
>=20
> An event channel will be created beforehand to allow the domains to
> send notifications to each other.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> docs/misc/arm/device-tree/booting.txt |  62 +++++++++++-
> xen/arch/arm/domain_build.c           | 139 ++++++++++++++++++++++++++
> xen/arch/arm/include/asm/domain.h     |   1 +
> xen/arch/arm/include/asm/setup.h      |   1 +
> xen/arch/arm/setup.c                  |   2 +
> 5 files changed, 204 insertions(+), 1 deletion(-)

I am waiting for a review for this patch and the next patch in the series b=
efore
I send the next version. Sending this email as a gentle reminder.

Thanks in advance.=20

Regards,
Rahul=

