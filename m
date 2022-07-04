Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 488AD564FBB
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 10:28:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359936.589221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8HRj-0003Xy-9g; Mon, 04 Jul 2022 08:28:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359936.589221; Mon, 04 Jul 2022 08:28:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8HRj-0003Vx-5T; Mon, 04 Jul 2022 08:28:43 +0000
Received: by outflank-mailman (input) for mailman id 359936;
 Mon, 04 Jul 2022 08:28:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TmxG=XJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o8HRh-0003Vr-Rk
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 08:28:41 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60070.outbound.protection.outlook.com [40.107.6.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ef05855-fb73-11ec-a8e4-439420d8e422;
 Mon, 04 Jul 2022 10:28:40 +0200 (CEST)
Received: from AS9PR0301CA0044.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::16) by DB7PR08MB3897.eurprd08.prod.outlook.com
 (2603:10a6:10:7e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Mon, 4 Jul
 2022 08:28:38 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:469:cafe::e2) by AS9PR0301CA0044.outlook.office365.com
 (2603:10a6:20b:469::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.21 via Frontend
 Transport; Mon, 4 Jul 2022 08:28:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT011.mail.protection.outlook.com (10.152.16.152) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Mon, 4 Jul 2022 08:28:37 +0000
Received: ("Tessian outbound 3c5325c30453:v121");
 Mon, 04 Jul 2022 08:28:37 +0000
Received: from b9eea51a1eb9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8ECF8AD7-6BB1-4A03-8D8D-AB60572A230C.1; 
 Mon, 04 Jul 2022 08:28:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b9eea51a1eb9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 04 Jul 2022 08:28:30 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB3057.eurprd08.prod.outlook.com (2603:10a6:208:57::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Mon, 4 Jul
 2022 08:28:29 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5395.018; Mon, 4 Jul 2022
 08:28:27 +0000
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
X-Inumbo-ID: 4ef05855-fb73-11ec-a8e4-439420d8e422
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=YJv07i5zWz9mai3VVLKimttv+pt00s9MFXJVjZlrbfQnQZZyVrLDBdPiwdsVH5/jThWEuBmrtsTGn5UcjCjCwokAkX5/dYsV1rWuOYm6vsyjXkX6/+0rSlhPhuIc9ZdFF8lyODQKFxvgKdLMyxq6eKXQkgxzV6EfuzFVesVuYOtqyPQoOPC4M3Hyrc4IXAx/Dsz7oPQJzrqeNH190fHpJM/ofQOp3N3W2u+ABNgj6MZiWjn6m0gqHz5xBHoLv4n3GctX9vHZn//HfqXN/K/4hpZAxcw3DRHGxeVGreLW2fQWRtXXo5WFDyJ7TImj+4pns6KStNKG+4u4A6AiS6BXyw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29IMshbie5ViWXGGr5MDzRHkggHdrqM96r8mXJe8s4Y=;
 b=EN3UfxjqnmosTPXeew2JXzOkuYfJ9jka50tS8DkhlQg6kruO8rpymCtK8G3S0Kyq17QpiHS3gpVAdMFAIuSlzs1R+DuOvRB0Hj8iKhh26EhEiDOHH4b3HRWlyU2Eq6EcDos8JQJN4BRZCNUBK0SZ4QHo7jErtTrhLlbpNsz1tBvgeIAbDkfgJMTn2afHiH6msSwkGzvgojsWxMDdAMyhCGRnSyqz5cVhnlmSsTYc3m2ju0XaxKlLWAn9V9UroRxGUjvNfrBGXV0LnE5MmqNFAZHcsR7v1k6qKQ+2axw3pLMMn53XMdCVGU+zEFw9r4ha+O+2Q9UhNQNLrynQOe4ghA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29IMshbie5ViWXGGr5MDzRHkggHdrqM96r8mXJe8s4Y=;
 b=au9uVpNbgKw7wQINWYY+IW4c4UNCf6x5GHKs3CfPwERWJ5xla3YVFydEL3Fb5dwu5UPOQAxBnA8HNJmcwZ1I98cefPNJ86E/vdG0Rs7t9XDvpRlBy6/HAspuCKJ4nXrUpzV2cndu103v+nf9tLn7KicrMSZ52UfidH9krmNXSdw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: da9a8b7041059061
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NqZlVRqf4cKhqjoKfD75FIftrZKTe5Ev9deB+O5LwKa+EujAgYxuaS+S0UsWngsQvmWW65WmoCRB6HMAyjtgRnbT+UewdFoxre+USUEWDe4TO/pkUWxz0dthoAexZC9Lskp/Jl4M6pStadKolWF9f5IMylrVbgbzz/aRW1AkQiGo6TNG0l2LAQ7GIKhLv7kY5Kwb5FdJmevHIqhvyAtJVTsfVBZqDcOkXX9BzDF0+Qim8aLVlpLtfQzavyh5rDzC/PDMbohYVoiQrOLu5B2+HudHgrlTRb3LBxEQnbBpgMU4uDOIFQA0Vdri+ue+/W7s+MiZNnAn66hPiFHiknblYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29IMshbie5ViWXGGr5MDzRHkggHdrqM96r8mXJe8s4Y=;
 b=Fw5hM0kDowBUVPlifWi1y1iVdNV04nIQORBoeq+nNDy8R4VQjEpgGmofid8J7StooQz4L/J9F3NSjpYcuehkQCDnmKZz7dRN6pQhXb8Opi0SRuLkPEqSKNI0D1wzsYduGmnCe0qugTXwI8SAcsX/F5yc6jh+idNCFHCz4Y2jj/4nfDsWf9aKgFKYKrBQ8dTK2FawLZsDQlIK7R/FYPdIy3DjpJy7mRLwZNIsh2gfeHye42rn5RBSRNadxo3k4xepB09IHpTVdnySsH4UCYLhTAJYQc19lBpp6eWZAl+otZaCUqrsrdZfJSvYN4I9SITSLA+vhRA6e7uI+BemsVDLwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29IMshbie5ViWXGGr5MDzRHkggHdrqM96r8mXJe8s4Y=;
 b=au9uVpNbgKw7wQINWYY+IW4c4UNCf6x5GHKs3CfPwERWJ5xla3YVFydEL3Fb5dwu5UPOQAxBnA8HNJmcwZ1I98cefPNJ86E/vdG0Rs7t9XDvpRlBy6/HAspuCKJ4nXrUpzV2cndu103v+nf9tLn7KicrMSZ52UfidH9krmNXSdw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xenia Ragiadakou <burzalodowa@gmail.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: traps: fix MISRA C 2012 Rule 8.7 violation
Thread-Topic: [PATCH] xen/arm: traps: fix MISRA C 2012 Rule 8.7 violation
Thread-Index: AQHYj3bjMrWoDl4sYkqZXzEqwsl1S61t0/kAgAAEv4CAAAIygIAABXWAgAAAwwA=
Date: Mon, 4 Jul 2022 08:28:27 +0000
Message-ID: <E56D7BDD-8DA6-4131-A60F-26239A9BBEA2@arm.com>
References: <20220704072232.117517-1-burzalodowa@gmail.com>
 <EB360E93-8353-48D0-844F-CB529B94B9C1@arm.com>
 <BB492376-6171-4ECB-8F24-6F419E9A5926@arm.com>
 <e623d9c9-0f61-144b-61ea-51367c938b03@gmail.com>
 <E77F6E48-80EE-4874-B560-D57ACFF0C264@arm.com>
In-Reply-To: <E77F6E48-80EE-4874-B560-D57ACFF0C264@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 88cc88d4-4652-4356-81e8-08da5d973191
x-ms-traffictypediagnostic:
	AM0PR08MB3057:EE_|AM5EUR03FT011:EE_|DB7PR08MB3897:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PWjvgpItsCNUL22PCWaLb7bdNFD3LQlR+7GvuObtkNDKBQ20etp7NpYL1TvOqAUUFiRg/bMmIY3Bzh3rXmZq/4nkidf+Quc7jaoYtFPYQB/EsL9MpN1irMs8+0vHs8baG69GavunH+8o06fcAa0qDFkjaaKLgvyQkHRAvrF2B0X/fGZrFYbTzdgQZZRnprNQx/X9Tij2sh/cqQnkpAVp/wCNICw7tyzNFT2Kg7LyAeAaN2hXZGKS3NXviFTqMWPuB/bsAchDP4AFfCaznpkLqF3W0S5KrSvuxUzkFo+rIbqUwU2PxT3gZDzxU/+iBxXPFr5GSelEa0rGIowN9x9ZZpZHzBVoaqEGdrG5MaN2yRAXgL3t6yBRuSVMUpy2lq9jh/w+KpZezQWv2X+7q/Ko8Q556VDhWZ6P7umXNXxCKh7I6vyG9rHL/25uVo7g2jVVOMxYRcmhg1htLQwJgikSUJ0tuPcfQ+jbO0QyTu2ZUuY9DPD+iuEbl3ptaxuq2RFf5qx2AzA6t8I6GCw7Aj0YF2ZtQ+Ar+iCu84udktjE6bggn0AdDGjOg7bZrhobapw5Wbbf2EJtiprrdYQUe2B3lXJBXJ1Uh4cnZUbD5momsb4w5869HS57xt+HenOhKhWqr3jmvaypMxZdulC9C5/MKOT9wb1FDu6ysWIL2ORSQXmC1WTkxMZGXWBN56hcFLGKBpEZGuBpvXCcbGA69nhAPoan1vjH6GmHnVx0b9qQotz1MLgdx+rEpSyk/9uy9m0MkTsBAk9kzrmYlgxgUEcFoYRn/EdH/ioeIe0f28r2i11LjSZXuTUhKzaJN7cNe3XhLBCt4SqKC2EikMCmYvLmz08cKwboUO5SJr0IXVfhWFE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(6636002)(37006003)(86362001)(38100700002)(91956017)(316002)(6486002)(66446008)(76116006)(66556008)(66946007)(64756008)(36756003)(54906003)(4326008)(8676002)(66476007)(5660300002)(2906002)(186003)(53546011)(33656002)(41300700001)(122000001)(38070700005)(8936002)(6862004)(2616005)(478600001)(26005)(6512007)(6506007)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2ECECEF8BD3A0147849BE8E617FB2082@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3057
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cfa538f3-f88d-469c-4c62-08da5d972b23
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ro/MyDqW5hEeN0dImuqiDPOXKy3CkjGVmpwvROYOo6prLteFn+awLjx9M8agdI/Q+t81UVi0nPy8TUTSLYjPJMdaioXed2G9LeoDWvdboA2S9JamFBVv/uMV1f0p7qMKorOOhhRkuHhMLX5KM31ZblDQsVH3fIr/dKP07bIEJjdkOFY19f6yD7SMdIJ9Jjdl9EBj70v4WXsBY1wsuGOuCmnMX9MptSdpMreAMfBFKB1q2Yff3Zr7mtmQfFckXViTrwIdXPQak6y8HjnAgEawMIRzaQ8ZueJcGyRW5UYd389CVlK3/Oy+qRSGne6/QmMaGhtfI3MhwpmY54ZKx+MqBSfWID0KyBuCsNO1yWEcZkLEzBQkgsEc2mNR34Fy1pZW+5W1gYFWvJWynJ3bu6mm97NVOwKpem88bHLyUDb+BRDcFny73Ah4xp1cW8xMTMAcj6agezkK+lDNV00YKBd2J14/IVoBESsLMp9u/sSce0QNziD45tMjyFpGu3s3h+mQ85S7IjGo6/AizQ06nuBPyWXZIcTnvzr1XDNn6dVM1Q8ELPeFdQ3/8w7W5ZeNdsYX82fGHaqy635d8fGufEL/8YnV/UIgSB3SO6AcUIjhoN39KKfZt2dKE/CbC0WebBmCfe7D2m8oPxIzSP7OEAnBqyHrwiojeBHCVOofW8mYW1alP3VpMeLy6jsrC8yCFrxYVm1X+b/umN0n48ryGVix6kSUK3jXoGhjgKDSnAwhsvHSIIHCPRsFP/T/7JE7auDHj8ledAqo3+aYPjgLC6I1kbSCxHGq1lTsRS32PmF4k64=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(396003)(346002)(376002)(136003)(46966006)(36840700001)(70206006)(86362001)(6486002)(478600001)(6512007)(53546011)(70586007)(316002)(26005)(8676002)(6636002)(41300700001)(6506007)(4326008)(82310400005)(37006003)(54906003)(36860700001)(82740400003)(81166007)(2616005)(356005)(336012)(107886003)(83380400001)(47076005)(40480700001)(2906002)(36756003)(186003)(8936002)(5660300002)(33656002)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 08:28:37.8629
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88cc88d4-4652-4356-81e8-08da5d973191
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3897

DQoNCj4gT24gNCBKdWwgMjAyMiwgYXQgMDk6MjUsIEx1Y2EgRmFuY2VsbHUgPEx1Y2EuRmFuY2Vs
bHVAYXJtLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+PiBPbiA0IEp1bCAyMDIyLCBhdCAwOTow
NiwgWGVuaWEgUmFnaWFkYWtvdSA8YnVyemFsb2Rvd2FAZ21haWwuY29tPiB3cm90ZToNCj4+IA0K
Pj4gDQo+PiANCj4+IE9uIDcvNC8yMiAxMDo1OCwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+Pj4+
IEkgYW0gbm90IDEwMCUgc3VyZSBhYm91dCB0aGlzIHBhdGNoLg0KPj4+Pj4gSSB0aGluayBzaG93
X3N0YWNrKCkgc2hvdWxkIGJlIGRlY2xhcmVkIHRoZSBzYW1lIHdheSBhcyBzaG93X3JlZ2lzdGVy
cygpLg0KPj4+Pj4gU28gZWl0aGVyIGJvdGggb2YgdGhlbSB3aWxsIGJlIGRlY2xhcmVkIHdpdGgg
ZXh0ZXJuYWwgbGlua2FnZSBvciBib3RoIG9mIHRoZW0NCj4+Pj4+IHdpbGwgYmUgZGVjbGFyZWQg
d2l0aCBpbnRlcm5hbCBsaW5rYWdlLg0KPj4+PiANCj4+Pj4gSSB0aGluayB0aGF0IHRob3NlIDIg
c2hvdWxkIGJlIGRlY2xhcmVkIHdpdGggZXh0ZXJuYWwgbGlua2FnZSB3aXRoIGEgY29tbWVudA0K
Pj4+PiBleHBsYWluaW5nIHdoeSB0aGV5IGFyZS4gRm9yIG1lIHRob3NlIGFyZSB1c2VmdWwgd2hl
biBkZXZlbG9waW5nIG9yIGRlYnVnZ2luZw0KPj4+PiBhbmQgSSBzb21ldGltZSBjYWxsIHRob3Nl
IHRvIGZvcmNlIGR1bXBpbmcgdGhlIHN0YXR1cy4NCj4+Pj4gU28gSSB3b3VsZCB2b3RlIHRvIGtl
ZXAgdGhlIGV4dGVybmFsIGxpbmthZ2UuDQo+Pj4+IA0KPj4+Pj4gSSBkZWNpZGVkIHRvIGRlY2xh
cmUgYm90aCBvZiB0aGVtIHN0YXRpYyBiZWNhdXNlIHRoZXkgYXJlIHJlZmVyZW5jZWQgb25seSBp
bg0KPj4+Pj4gdHJhcHMuYyBidXQgSSBjb3VsZCBoYXZlLCBhbHNvLCBhZGQgdGhlIGRlY2xhcmF0
aW9uIG9mIHNob3dfc3RhY2soKSBpbg0KPj4+Pj4gYXNtL3Byb2Nlc3Nvci5oIGhlYWRlciBpbnN0
ZWFkLiBSdWxlIDguNyBpcyBhZHZpc29yeS4NCj4+Pj4gDQo+Pj4+IEFzIHNhaWQgSSB3b3VsZCB2
b3RlIGZvciBleHRlcm5hbCBsaW5rYWdlIGhlcmUgYnV0IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSBv
dGhlcg0KPj4+PiBkZXZlbG9wZXJzIHZpZXcgb24gdGhpcy4NCj4+Pj4gDQo+Pj4gSW4gYWRkaXRp
b24gdG8gdGhpcywgaWYgd2UgZG9u4oCZdCB3YW50IHRvIHByb3ZpZGUgYSBqdXN0aWZpY2F0aW9u
IGZvciB0aG9zZSwgc2luY2UgdGhleSBzZWVtcyB0byBtZQ0KPj4+IGNvZGUgcmVsYXRlZCB0byBk
ZWJ1Z2dpbmcgdGhleSBjYW4gYmUgcmVtb3ZlZCBmcm9tIOKAnHByb2R1Y3Rpb27igJ0gY29kZSBp
biBzb21lIHdheS4NCj4+IA0KPj4gUnVsZSA4LjcgaXMgYWR2aXNvcnksIHNvIEkgdGhpbmsgdGhh
dCBmb3JtYWwganVzdGlmaWNhdGlvbiBvZiBkZXZpYXRpb25zIGlzIG5vdCBuZWNlc3NhcnkuDQo+
IA0KPiBZZXMgdGhhdCBpcyB0cnVlLCBpbiB0aGF0IGNhc2Ugd2Ugd291bGQgb25seSBuZWVkIHRv
IGRvY3VtZW50IGl0IHdpdGhvdXQgYSBmb3JtYWwganVzdGlmaWNhdGlvbiwgaG93ZXZlcg0KPiBp
ZiB0aGUgY29kZWJhc2UgZG9lc27igJl0IGluY2x1ZGUgdGhlbSAoYmVjYXVzZSBub3QgaW4gcHJv
ZHVjdGlvbiBjb2RlKSBJIGd1ZXNzIHRoZSBwcm9ibGVtIGRvZXNu4oCZdCBleGlzdC4NCg0KSGF2
aW5nIHRoZSBwcm9kdWN0aW9uIGNvZGUgdXNpbmcgc3RhdGljIGFuZCB0aGUgbm9uIHByb2R1Y3Rp
b24gdXNpbmcgZXh0ZXJuYWwgbGlua2FnZSB3b3VsZCBiZSBraW5kIG9mIHdlaXJkIGhlcmUuDQpJ
IHRoaW5rIGhhdmluZyB0aGVtIGFsd2F5cyB3aXRoIGV4dGVybmFsIGxpbmthZ2Ugd2l0aCBhIGp1
c3RpZmljYXRpb24gaXMgdGhlIGNsZWFuZXN0IHdheS4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+
IA0KPj4gDQo+Pj4+IENoZWVycw0KPj4+PiBCZXJ0cmFuZA0KPj4gDQo+PiAtLQ0KPj4gWGVuaWEN
Cg0K

