Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC5356826E
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 11:08:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362014.591854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o910g-0005Tx-Ot; Wed, 06 Jul 2022 09:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362014.591854; Wed, 06 Jul 2022 09:07:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o910g-0005RJ-M6; Wed, 06 Jul 2022 09:07:50 +0000
Received: by outflank-mailman (input) for mailman id 362014;
 Wed, 06 Jul 2022 09:07:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qayr=XL=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o910e-0005RD-Su
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 09:07:49 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70042.outbound.protection.outlook.com [40.107.7.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ad2cc15-fd0b-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 11:07:48 +0200 (CEST)
Received: from AS9PR04CA0062.eurprd04.prod.outlook.com (2603:10a6:20b:48b::12)
 by AS1PR08MB7610.eurprd08.prod.outlook.com (2603:10a6:20b:475::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Wed, 6 Jul
 2022 09:07:45 +0000
Received: from AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:48b:cafe::d8) by AS9PR04CA0062.outlook.office365.com
 (2603:10a6:20b:48b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21 via Frontend
 Transport; Wed, 6 Jul 2022 09:07:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT063.mail.protection.outlook.com (10.152.16.226) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Wed, 6 Jul 2022 09:07:45 +0000
Received: ("Tessian outbound f9f15f9daab2:v122");
 Wed, 06 Jul 2022 09:07:45 +0000
Received: from 5cfe01c27468.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C146CBB7-0D65-40FF-B6BE-45DA990B26A1.1; 
 Wed, 06 Jul 2022 09:07:39 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5cfe01c27468.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Jul 2022 09:07:38 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR0802MB2399.eurprd08.prod.outlook.com (2603:10a6:800:bb::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Wed, 6 Jul
 2022 09:07:37 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5395.018; Wed, 6 Jul 2022
 09:07:37 +0000
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
X-Inumbo-ID: 1ad2cc15-fd0b-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=TP/xjKxbJXR/eDogdQ3VXlHVhgHjYjHxxu/sBHITP1giPKIwzREk2OXQlfx05bMMoTnIorOWtJ1hBdF4mrBuY0ZeNUsj/Y322oEKV0qd5y2W1zSB8TyAhE8L5ss5jR2YVU0tyHHw0gnKt4xC7Cd9PI7ioyfwIVjkFYInza48fL9IpMkEOS6tuHJEBudEwTcINHYZx/Y916gQABJK7xn2pr6BCEVwtsAmuVGF9lQoTPsFm9uMRvdu9Q0oKtrpLaKYplPofOhZVI/uGagy80AZy2oqYXvB/YiyTidiJ5jdjyV7d9t1rakc+jxI8Y2pp/j3yWxym+L0MhGAgBTKv+jTWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IyE7le+BAxxg9H7KmKEflE2eP67E8EUeEHmzc/ony9Y=;
 b=OkfElylFaZqDPIXlh7F5o6iAXPqak9SsfNOFFgYVBorSTTtf24O0PUtaBtsoafhIlX7VeZmJSdNHZr4M57gpSBmvoKscrpRz483BK8V305B3YYy15GdhUBoHETnOFV/Ceictrty2WQSnOm96gmPdk01q8C7UGnZtviFfsSvuUZnZGYOqT3pYRByhau9S3AFhbm9hsoX/u3kx8/17W2Hai0W0ltwJQcrHGJ0WqDXjyq+JEe6qTrAhKU3WP1NyNA4Q12hLVjH+kwncqXIFtl0ughMRwEizq9/xSqw5xIlH6VrM2ek+0DjMlJ92JbL+W3NvY13jRy9roS+W+mn4177jhg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IyE7le+BAxxg9H7KmKEflE2eP67E8EUeEHmzc/ony9Y=;
 b=2QCyABGB1QBIE2DnQmPa/IwGWE06lk6STjhBr4Tdj+IBghDAH/kAsWHGcfEl7lviX9mc8Y9HHjsyC6BC1K9Nx+aVEOshm1NDjqO1/b1HAbMfUBswl3L3tOo531TOABjk7qC6vsLNELeF4QG5bScubNd/BuoFxRM4o6qMED17MfQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f728d05cfd85233f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INlQzSNuJEF5kFO6FnanYV70vRliuVPiSffMAhu3EEzBQIWoBsN2MYoOCqsMIgniLiYLQ1lWzmu8B2mdtOtSjBg4Vadviduo8Sy3cfuAs349WQOQOQqJNxJ6eN7XmGkpc8f/frYl3o/fCqSOt3IQm43I+bBvz6E6AaiwedT/DLJ+tcvV2Phs9Q9IKWl5uGwRG6NpZjHi5eHQOi1mqw2mjwz0P4D2c5NMPISHRKw/KqkZIvx/t4s5bmoDmkOWRoGkWWF8tD2pI039E6UiZKkb8ZePs0WyLYkaCjHEY6nBV169cFJHxYNs/L4TaMdRX5JbOJ0/zSjdDi0Z5bsl6H0NHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IyE7le+BAxxg9H7KmKEflE2eP67E8EUeEHmzc/ony9Y=;
 b=iVHsCHG3WkuoPEdlwQZOolIqgNJ6lx7tbXVRbeFe9iYxC/Xnq5riKFUIlcw91T4wZH0RMbcHUcu+2OuBCbRdRo/qjL8PTJ85tUi70HhuWNPWFOZU+RZlQ/P/SSezJuuuplxiolcEuwiQMjpMzid5qaRK/Gute7YCSctdCzt1QH8Rj8HZyzAVA1s0Uh/bZAhg/Ui3DbVj6biu+BE5U7mcBL9G/jIWi1HL2YFFkDMRWcaXBdlGweG8ipydn07cGcBPINhtUkZgU2gZMIGEdNFZl5jQxMC5u2PZjxnixWH+L8kDBfpxl5IZ1a/9UhOzPXnyZEVuYErWvycPCDu++X/IyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IyE7le+BAxxg9H7KmKEflE2eP67E8EUeEHmzc/ony9Y=;
 b=2QCyABGB1QBIE2DnQmPa/IwGWE06lk6STjhBr4Tdj+IBghDAH/kAsWHGcfEl7lviX9mc8Y9HHjsyC6BC1K9Nx+aVEOshm1NDjqO1/b1HAbMfUBswl3L3tOo531TOABjk7qC6vsLNELeF4QG5bScubNd/BuoFxRM4o6qMED17MfQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xenia Ragiadakou <burzalodowa@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: traps: Fix MISRA C 2012 Rule 8.4 violation
Thread-Topic: [PATCH] xen/arm: traps: Fix MISRA C 2012 Rule 8.4 violation
Thread-Index: AQHYkGnF2mJV3nmWm0mEL2tvTat45a1wVMEAgAC6FgA=
Date: Wed, 6 Jul 2022 09:07:37 +0000
Message-ID: <B55A99FA-57F9-4163-A13B-691977EA6A90@arm.com>
References: <20220705122114.419634-1-burzalodowa@gmail.com>
 <bc0c9bcb-9781-6cf5-1189-c29c5cc89b09@xen.org>
In-Reply-To: <bc0c9bcb-9781-6cf5-1189-c29c5cc89b09@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: efbfec3e-3709-4485-541e-08da5f2efda7
x-ms-traffictypediagnostic:
	VI1PR0802MB2399:EE_|AM5EUR03FT063:EE_|AS1PR08MB7610:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 pQpqtO33rOlwSrDptzyAD5SPdog5sRaJUHTBg+VNLGh2xCCfOWJpZLBhLXzSedBgmk9k9R7XdcqTzFA3uZ/U2uZQtTlhiylArHZM5+4f7K86gJ8y3apW0JcVbJsRkuavVMNthM5M3sHQ5D0UxavqoVqdUTFjvUBAL/Ac8sE81enmPsT1WfFC6MVDS96yxuSxRgdNGXQ182a+z9gvGYgNXS3PWkFDkC5/XbpMom9fn/eo98/LxrwEmB8oSgzs9nCgFqLnzXE3hCDE7gbBw8/hIWKOUqtWAeS321JdsTNIQDdDRVesjWXb4c6cdZ8y2fB/e8Y1SZkX8lbP9uVmG/TpyXG4dSeRSv1ahLdMK4nTOfp5gvNBw7hd+6UruhAxcgeloZiog0FZlaQexrwFDnRBWuVGRDzGhH427hCFRiuj1Tc/IF8YMIAYO/ubkb4rss0LiLGSp0MrFq4NSmU8b8gub/NiqgIUEznPZwTgTLz9uUec0DoLCmp/lMSPBO7EZLZDWqo+J7Mis2KsUcIFh4XAL7qifaVCYPeVrQfklnkzP9L+D+qDp0TobCo4qj5Z3jftWRI2GdWQ66Xhu/BnnNctbA3UWXmgLZKvCBEmcExiKpK9CWNpazMyt1W2DPkzHTfsPA9YO5u6/W9YNObx/KBCIYryyXkMQyeYnrrzTD7JBEYaJzbOaQoKhOCoI2Ov7+e97rq8z5Fi/e9XXr3Oi65vtorNNMSwLmMMNCrAGKexScbN/8oiUt8xAFB7iU/E2RSgzdEX+5TAQvsBMpB4P/nfEILfIbB6orhglzmK8Z/HcI2WM1CqABI6YYqhpUsAp/9SGFqJZ7c2ZmX5kNm5lEazPwdqb+G60TU6wo8aa4oGwS8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(54906003)(316002)(2616005)(53546011)(26005)(6506007)(6512007)(186003)(33656002)(36756003)(6916009)(478600001)(6486002)(71200400001)(38100700002)(2906002)(86362001)(8936002)(5660300002)(122000001)(76116006)(8676002)(4326008)(64756008)(66446008)(91956017)(66946007)(66556008)(66476007)(41300700001)(83380400001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BFE567979A3B864480959124D95386FB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2399
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b8720272-6d3b-4d5b-1374-08da5f2ef8a3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pNEZch174/UxmMlld1gDcUDsx3VIzcRDGFyJwiFqhLJshn3vFyVDKPdZUj+sVSVhUAv4tL540rwTzQ1K3IwHCkH61mvvMZYBPC/sw/+tI0ca3kFSPbsNeKcjnmTLBEI5qP6VWpaYZMjZFU/9hF6KHsR6dQvWxKcpVJhllsZsG6XhqB2dB9EoQp5NgFa7bz1J60NGY2uJcQCNo1daqJoDKi447DGTUIXRepKqHObCt/IK3h3hWZAadzJXeJAekQ6X6WCDEY2GVl69/s/pC6pao+Bd8gmGHtmEryEw2dhFQPFZ/G3ZC3VRe3iqV8mAa8InVXQLb2AB2orx4QgWht0PelTJ8IeEv+BqIRqCGorN7w5bsyDJvsZtZYTXQjY5cXhZthYlyHMGCk4mIddhv15IxG/fb3vEwPUy3QrxsjhXrWoM1bzw/JKKfQKDyHNvGu8nThpVfdTybtiJhR6bCah6OILPpQmabShOxX3dYW0Jm7fkmw77od6HHTLEpmmzh0kEluSKGsLC4YrjJ1tt9E0dNO/0tWG0Hmu5zxhy586IKYqIcpQb88MFCEso35EgKPG5byVSUYuuCGg61Ip/gPgORUspS6rD8q0QhXyfF73DidRvkawswiIpbKX2U5o3QyIcrUA1AHW4N7EAQEA75bgNBvywLUYSBm3KqU4jtJVITWOZJrhIdy0xlS8MjN0C8cuL4nsHvnOI+pk79NPRKpCI8ytBamymIjOytx2WpvjvqkYn2DF+O9i4rr0dkoX2gm9ONJI9d6lAL3nreDejQv4mnie88n47KdxE7Foc1L3dIl6KegPDE5DvdZ2X4kOHZuIt
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(39860400002)(396003)(136003)(46966006)(36840700001)(40470700004)(107886003)(6512007)(2616005)(47076005)(336012)(70206006)(8936002)(6862004)(4326008)(8676002)(70586007)(5660300002)(36756003)(41300700001)(33656002)(86362001)(40480700001)(82310400005)(6506007)(2906002)(6486002)(186003)(26005)(53546011)(478600001)(82740400003)(83380400001)(81166007)(356005)(316002)(40460700003)(54906003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 09:07:45.4457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efbfec3e-3709-4485-541e-08da5f2efda7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7610

Hi Julien,

> On 5 Jul 2022, at 23:01, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Xenia,
>=20
> On 05/07/2022 13:21, Xenia Ragiadakou wrote:
>> Add the function prototype of show_stack() in <asm/processor.h> header f=
ile
>> so that it is visible before its definition in traps.c.
>> Although show_stack() is referenced only in traps.c, it is declared with
>> external linkage because, during development, it is often called also by
>> other files for debugging purposes. Declaring it static would increase
>> development effort. Add appropriate comment
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>=20
> With one request below:
>=20
> Acked-by: Julien Grall <jgrall@amazon.com>
>=20
>> ---
>>  xen/arch/arm/include/asm/processor.h | 2 ++
>>  1 file changed, 2 insertions(+)
>> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include=
/asm/processor.h
>> index 4188ec6bfb..c021160412 100644
>> --- a/xen/arch/arm/include/asm/processor.h
>> +++ b/xen/arch/arm/include/asm/processor.h
>> @@ -558,7 +558,9 @@ extern register_t __cpu_logical_map[];
>>  void panic_PAR(uint64_t par);
>>    void show_execution_state(const struct cpu_user_regs *regs);
>> +/* Debugging functions are declared with external linkage to aid develo=
pment. */
>=20
> I agree that those functions are only used for debugging today. But there=
 are no reason they can't be used in code in the future.
> So I would like this comment to be dropped because it could easily become=
 stale.

I think if someone is one day using this somewhere else then he should remo=
ve the comment but in the current state the comment
would be useful so that the next one going through Misra violations is not =
trying to fix it.

In the mid-term, if we have a standard way to document violations then the =
comment should be replaced by it.

>=20
> If the others argue for keeping it, then I think...
>=20
>>  void show_registers(const struct cpu_user_regs *regs);
>> +void show_stack(const struct cpu_user_regs *regs);
>=20
> ... we need a newline here so it is clearer which set of functions you ar=
e referring to (at the moment one may think that dump_execution_state()) is=
 also included.

agree

Cheers
Bertrand

>=20
>>  //#define dump_execution_state() run_in_exception_handler(show_executio=
n_state)
>>  #define dump_execution_state() WARN()
>> =20
>=20
> Cheers,
>=20
> --=20
> Julien Grall


