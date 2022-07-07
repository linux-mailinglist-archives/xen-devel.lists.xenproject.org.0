Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 009685698D1
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 05:32:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362719.592897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9IET-0007xX-5J; Thu, 07 Jul 2022 03:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362719.592897; Thu, 07 Jul 2022 03:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9IES-0007w7-Vv; Thu, 07 Jul 2022 03:31:12 +0000
Received: by outflank-mailman (input) for mailman id 362719;
 Thu, 07 Jul 2022 03:31:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IxOD=XM=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1o9IES-0007uX-57
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 03:31:12 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10048.outbound.protection.outlook.com [40.107.1.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e0c57d1-fda5-11ec-bd2d-47488cf2e6aa;
 Thu, 07 Jul 2022 05:31:09 +0200 (CEST)
Received: from AS9PR04CA0122.eurprd04.prod.outlook.com (2603:10a6:20b:531::24)
 by AM6PR08MB3991.eurprd08.prod.outlook.com (2603:10a6:20b:a8::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 7 Jul
 2022 03:31:06 +0000
Received: from AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:531:cafe::84) by AS9PR04CA0122.outlook.office365.com
 (2603:10a6:20b:531::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Thu, 7 Jul 2022 03:31:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT043.mail.protection.outlook.com (10.152.17.43) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 03:31:05 +0000
Received: ("Tessian outbound e5f49c5d38f9:v122");
 Thu, 07 Jul 2022 03:31:05 +0000
Received: from f8a3c7e6a6b0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2AEA2DA7-7EDA-4754-9BB3-30CF903CC43D.1; 
 Thu, 07 Jul 2022 03:31:00 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f8a3c7e6a6b0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 07 Jul 2022 03:31:00 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com (2603:10a6:20b:523::11)
 by AM9PR08MB7032.eurprd08.prod.outlook.com (2603:10a6:20b:41e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Thu, 7 Jul
 2022 03:30:58 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::74fd:9baa:fd29:7ef7]) by AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::74fd:9baa:fd29:7ef7%4]) with mapi id 15.20.5417.015; Thu, 7 Jul 2022
 03:30:58 +0000
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
X-Inumbo-ID: 3e0c57d1-fda5-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=T+lZ6GTIMMfiqf82O6h4mC3CkUUkHY/TA/NNwzVrfUXjbJpxnky0ixHJnA/ptPmpbeI1ZQNyicsGf1LQVTzAvHkL1tjR85Ut0gbeYwmQPcjn5I3I4vW6rY5QhmDTysp82zueXDh/t3D8n2JawbG/lAaMBue0PWypQG6D70+ZdtxLZ2+bXuCEO8bsLxivcEfZGBmv2p+6agGYYMqyJEvElpsrOHNmd8Nc/N9cZu9M4JggLUig0JGF5a96wYFy66qEysnwqdPO9OQTJeNKyWv4XJU8ILoCmgTenffZSoAb6aq4sm/4cUiNk/UjbxoQd1+bpeSkqKBvjiEU4RxPizNoyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AS0SBTOWGJQLdu77eJQoj3EcSdOsUilKvSb+THZxMdc=;
 b=IErxdtLMXTdZF7rj2oc+ApmVEbeZFJZ0PV+oc6tfcddDUCPRx0v+crMBr73gvhh3BEx0hFs05t6tmCCMXO71UTtJiGkbtbUS4LwZ2rLDl264JrGw9rVqodWaBrQyWO62onnXWgxL49VPFGIHxGqDoWMM+9+ZTGL+QAwCsD+5+wMr4PwZ8amAfHS2eThCOj6k+8IAbJLrsBccXAiGoYLxg9CoXNl7xeZMD9hJS70AybAq/IMnx+hdEvVCe2Fh3UsN7TNhC5GPPcqOGXAofLBSQIyef2KsaYnj4F2OTjDM8ZXXK1LirB0Qp+V0QyYGmTuvoT/J2GmLgrnn5KzFgXxcPw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AS0SBTOWGJQLdu77eJQoj3EcSdOsUilKvSb+THZxMdc=;
 b=FDZ4n3Erjpi+7KNShaWHQxJBxq4+/jyU1sL2lsl+gggQTu1P68X+qnGVThreMMWgWNUOtRSdJxtcz6TyMcCWGX/cTGk5CCRInIUbo4/8hW1UwdFxZtNqSy/2JF+XVsCHlFiS6ELM0D/sccJsyHXtbkXAbWcMxqWgzLNV/puK4xI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHxJgnpZKlSt+ZYN3NkTfyR/saV4yVDpslwT8NaRHEPbVSENA1YwOg2yWgn0xse7rAHsCcioPIU1crSk7V2NQelasd9cVHOATL9iUuRxLSUsBj5kYyv6ZOG9/ej7OtD1Iej/KQ6OR4QaRZbfOpScXdpES/lbFf2kVv8KC1P8ihb4JqeuBBpMvrcQj90l5a0bYcXdXJ5pnoUmbD83ICT32twi6evc6X4NnDrO++4reyS/tNFN/d8vJjjx1FQ3WkxIm2/DutYXf0k8Hgw9T6s2qoKvI8O5l8nse5Mam7sRdlZWYWvgA993AfC43gsTTu2xi0c4AM3Zd/C895xCmUf5VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AS0SBTOWGJQLdu77eJQoj3EcSdOsUilKvSb+THZxMdc=;
 b=WJwvercPGJdRMBks4Goe3YnhqcqGWWtf4snQSvpPcnASeWGXup1FayUfBmfLLT5yLiMGCAvuSxAbaqryPPObwQM8e4Eck0HX7YjqTTNue0dsya6imv2sq7Xf0sG5KppceAu6YqVPHtPRDf7nGy4uTrSoi/+TzBmIeSI5PTC5xPwE19gk9H9TN1HrS0bJPvnqobwQjpVWtEb1ftIgPqQWhy+QoPkiByffXK613JuD/HFXt4Gt833QJHG2TykHM2CHngY33E3EwsMgo75ZVJPjiEQF9Woo6g02EHJbG0vGxAXKXUrZX2eZ3/u/cC/2KJNqihmJmuAEkDBrKMQBSysD0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AS0SBTOWGJQLdu77eJQoj3EcSdOsUilKvSb+THZxMdc=;
 b=FDZ4n3Erjpi+7KNShaWHQxJBxq4+/jyU1sL2lsl+gggQTu1P68X+qnGVThreMMWgWNUOtRSdJxtcz6TyMcCWGX/cTGk5CCRInIUbo4/8hW1UwdFxZtNqSy/2JF+XVsCHlFiS6ELM0D/sccJsyHXtbkXAbWcMxqWgzLNV/puK4xI=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: RE: [PATCH] xen/char: pv_console: Fix MISRA C 2012 Rule 2.1 violation
Thread-Topic: [PATCH] xen/char: pv_console: Fix MISRA C 2012 Rule 2.1
 violation
Thread-Index: AQHYkWD/iwSB6pN2ukOyl9oTmyPHm61yPTaA
Date: Thu, 7 Jul 2022 03:30:57 +0000
Message-ID:
 <AS8PR08MB7696E4CB87B64063C9D37C3192839@AS8PR08MB7696.eurprd08.prod.outlook.com>
References: <20220706175013.675258-1-burzalodowa@gmail.com>
In-Reply-To: <20220706175013.675258-1-burzalodowa@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: FB83FB282B08C0479274D9E783CC850C.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 3749b008-bc89-4faa-be18-08da5fc92036
x-ms-traffictypediagnostic:
	AM9PR08MB7032:EE_|AM5EUR03FT043:EE_|AM6PR08MB3991:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2qFGpEfw+Z+V3Gt418U6eC4LTVOtvdblNJk2P6atpCjt4ae6fSAmjUl6SR5aFJEcC4Qje+b1yAlbfFaWode7ZLi8h7KX5hanF2Z2xnjIM+PAaf7lFgcn02nshO2xo8s9MUZ56VSdb+TZ1FK3As9tTZsICgbPVMlp8h2NsxtIEuJwMFjNDesGFBdOlS2mYQjMR8G9A1LoSR5LBHS0pwuhmxS/ZE+HGw50Cz00QFl+3jyMqVmuRgVY8BnJkcH146BvHyUukCHQrx3VbTaFV0Qd5MO5C6arOd9vCOZWuYsOB2170beHq99yusXShnexFEkJkVvP3ex5CuYNa9aJ+0cWCa5xvwSggihUbFoRJNQDpgKKG2KLtyt2gN5f7WDUrmkLp7MA4inw1m4Lv2pdch+pOAhPlxaMqL3AZiE6PJFsA3VzK32hgJDXhx5x9hBUpIWU9vYngegkfJsdNQKqEF4UqAgcPkgeLM75AYWbpOBOU3R26HhyQH66pDc1ENHEofigZjQFGdQk9E0vRiQ7n/4e8y9ibZIdDN2BPiwLAi5a3NuvkcC2JZtYAgPIy/Q4H6OGlJPu4N3pqxlDF/9F9WnRqsYvKOOwrE7uZiKOaJwd8Jl3iFpV80xKbqZQXiQPJiIw7htJmhjI6U3rrC4R49CnrOysCLKynUsdQw4T3SSuwpN+m55LYvbddZc3ZAn5ep76IXDGs6aqbFGGtDWy7+5yqDrk1ylibAxhHz8X5WI1IVNpUcGGp5IvXYU9lFYM49bwKCTLo62OCJPJyTlT/5XmUd2FvitLzUK+Jp72okfK/thFAmoKrE+NXjBsdaiYSYMB
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(316002)(83380400001)(122000001)(38070700005)(71200400001)(38100700002)(110136005)(54906003)(8936002)(4326008)(66946007)(76116006)(8676002)(66556008)(66446008)(9686003)(64756008)(5660300002)(66476007)(26005)(6506007)(53546011)(478600001)(41300700001)(2906002)(33656002)(186003)(55016003)(7696005)(52536014)(86362001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7032
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ab6e92cc-b60f-4d4d-9e69-08da5fc91b6f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	opzZqQOoD/90Yx5cdiu6lff7kTvqsSVr9cJbT6CACazhDA6UNMj9FzfAfKcpcG1bHOJKvf2OlBlBY8nT5u2BKmnxVr6j+4Jh1T8KJc7fMlycNHxYE8R1UhiVpP730KL7ZEa2Y8XbeM1zHCarGP4tvIPY14MmdTXw8rVIkDB0UZLZ1pIfyz5SgOl+lez7mvC5worjbjsfZd9Q9iTAHELSAQozNvv3+khoTGGH3rrNgH3gVrV+1b1O3L3BuAoVv8hrvIatG7NL4cnr3lq95nSuSOwIfL2wYq+O/lUnBIgxW2KM80BYXPN5N5JlAZVXtn6Jd3e+AiI5qmKK+6lfIT9jElKPxlQTbQjm3uxs+YpsBl31CuDL9hshZU3f/kkSmadWLmJBW31CZr/XjMBNp/nZeSvEX4cwJ04s2+kX863p9Tm1z8W4zNMDFt/UO7SS1Sgy9Nnp9kl3FA6/SwgkLdC/AnwMpR0usFBTiYAJ1U+E2JmJdLNFa7K5L6qVx5HR4KBSlk8LJeEcsnQtcMV097k6+lLilyJv8xI8dpNPoLpRYMGZZkLN7F/zMj8bhfMarhuMCEGPUxzTFpsN9b2YoT258+A1z0UdO56IJfsj160PbXQDB/GI945fC6BQVUhI+OMkUF5DC5KsG4WxfPZTM/EKq3HpnBmKn1Ysy274McKQWRQgBooYz9nIRabGCeuTeBe4p5YJk9uZr+hzUyZzqukzNBVjNU32udfxpDrvHfPbgU3XgXBG9GpNnjsVQYMooLh1X3I7nOZSeBZD53nU9Gn3fUiP+ZKHdaNUcteUxyCCNz+NOa4WKm9/1LnH97tb9HSG
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(346002)(39860400002)(376002)(40470700004)(46966006)(36840700001)(54906003)(86362001)(36860700001)(33656002)(81166007)(70206006)(4326008)(82740400003)(70586007)(40460700003)(40480700001)(316002)(356005)(110136005)(55016003)(53546011)(5660300002)(52536014)(8936002)(336012)(47076005)(83380400001)(9686003)(186003)(82310400005)(478600001)(26005)(41300700001)(2906002)(7696005)(6506007)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 03:31:05.9245
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3749b008-bc89-4faa-be18-08da5fc92036
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3991

Hi Xenia,

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> Xenia Ragiadakou
> Sent: Thursday, July 7, 2022 1:50 AM
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap
> <george.dunlap@citrix.com>; Jan Beulich <jbeulich@suse.com>; Julien Grall
> <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Wei Liu
> <wl@xen.org>
> Subject: [PATCH] xen/char: pv_console: Fix MISRA C 2012 Rule 2.1 violatio=
n
>=20
> Remove the definition of the function pv_console_evtchn(),
> when CONFIG_XEN_GUEST is not set, because the function is not used.
>=20
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> ---
>  xen/include/xen/pv_console.h | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/xen/include/xen/pv_console.h b/xen/include/xen/pv_console.h
> index 4745f46f2d..55b20323fb 100644
> --- a/xen/include/xen/pv_console.h
> +++ b/xen/include/xen/pv_console.h
> @@ -19,11 +19,6 @@ static inline void
> pv_console_set_rx_handler(serial_rx_fn fn) { }
>  static inline void pv_console_init_postirq(void) { }
>  static inline void pv_console_puts(const char *buf, size_t nr) { }
>  static inline size_t pv_console_rx(struct cpu_user_regs *regs) { return =
0; }
> -evtchn_port_t pv_console_evtchn(void)
> -{
> -    ASSERT_UNREACHABLE();
> -    return 0;
> -}
>=20
>  #endif /* !CONFIG_XEN_GUEST */
>  #endif /* __XEN_PV_CONSOLE_H__ */
> --
> 2.34.1
>=20

I have run it on arm64, booting Xen+Dom0 and starting few guests, connectin=
g consoles. It all works fine.
Tested-by: Jiamei Xie <jiamei.xie@arm.com>

