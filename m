Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 556EA67E3A8
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 12:41:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485510.752794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLN6N-0004Xm-Jt; Fri, 27 Jan 2023 11:41:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485510.752794; Fri, 27 Jan 2023 11:41:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLN6N-0004VN-Fu; Fri, 27 Jan 2023 11:41:03 +0000
Received: by outflank-mailman (input) for mailman id 485510;
 Fri, 27 Jan 2023 11:41:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JKSU=5Y=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pLN6L-0001VA-Pm
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 11:41:01 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7843a840-9e37-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 12:41:00 +0100 (CET)
Received: from DU2PR04CA0313.eurprd04.prod.outlook.com (2603:10a6:10:2b5::18)
 by AM8PR08MB6499.eurprd08.prod.outlook.com (2603:10a6:20b:317::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Fri, 27 Jan
 2023 11:40:57 +0000
Received: from DBAEUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::2b) by DU2PR04CA0313.outlook.office365.com
 (2603:10a6:10:2b5::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22 via Frontend
 Transport; Fri, 27 Jan 2023 11:40:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT004.mail.protection.outlook.com (100.127.142.103) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.21 via Frontend Transport; Fri, 27 Jan 2023 11:40:57 +0000
Received: ("Tessian outbound b1d3ffe56e73:v132");
 Fri, 27 Jan 2023 11:40:57 +0000
Received: from 4773e5d45a32.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 68CF4482-67CA-4F03-8E55-CF6E48E0EF45.1; 
 Fri, 27 Jan 2023 11:40:51 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4773e5d45a32.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 27 Jan 2023 11:40:51 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM8PR08MB5585.eurprd08.prod.outlook.com (2603:10a6:20b:1c5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Fri, 27 Jan
 2023 11:40:49 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%5]) with mapi id 15.20.6043.023; Fri, 27 Jan 2023
 11:40:49 +0000
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
X-Inumbo-ID: 7843a840-9e37-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXV1oY9xm7h5NPYs046MBxQOeZR1Sy82smO3XqCajas=;
 b=zHAQCTL7vJl/+EyFoIi+bQxUwVFHuhC5AkV9y1Gi7cEAa997iVcFS0Hz9XWd1VeWeoZr8UAtmBo6CdlMe0wvn0Cu4SppXbuiEacGErtCktrmrAFN2EwfYQ5p82NcCQcHg2X8CYVHg49A27RY/vyr9PyOBeqA6BJyoNf9I7KnmuM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cyFmpT360gM87IlOUR7yspyNO53JgMrbAWfpec3aruWI3lNBbEzLnxkSYPvw0d0aa2lxJZ3MVC8iZI7lqi/uqwX/L/KcRFfUyjggywj9C7nVuRhYo7dTGoS3Dp6d5EoXc9C3GSEyVQqCwAXGd9Km3ZtrkU7VirmzHyNXHJ01Go+0FLaCmxz8v5u9dZgdf64U9c1oGt8d2ZvHPm0AA/tW+KUxGXrYs+ClOlm8SuqlUBYbKcrCWyQGIYJsGJKBbJCdhW0pJeZKqZGoopaSSpBgnFHfzCUS4/bpJSxJknc3FrIxXvHCmqQ7A+akRL5++SBqEfSfJjhGzqkwLEzDoaQNVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXV1oY9xm7h5NPYs046MBxQOeZR1Sy82smO3XqCajas=;
 b=RHXZgNz3TS4GHu43u6LOeEhybixle94PLWAx4SDOHFWHgZ5QiE2y7mc0vPzfHQZCHCBfBrwaDN7pB2gj3FfkEBzMcYgozVeRbxKS1iDTgi9xyR6tkmslvpwT4AG3CKbDkrN3I+d8FRo09u6i3vLPG3QnLiUpe7pYtWMUF1LTrOi83hvjSblhThtiLgP0EB8ViVimTl3cpoAfW0ZiKl/AoPE07XAdTQtV9xteof7BBeK3muEFFKlGzslXKi4lExUK44MlqNSorXorl5izSSzQJmGt184hNPMz3i/i1mmCmz1T2JQxzj4/TSrjsHelxJiXefG3CykDogwrzHc+K6dRoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXV1oY9xm7h5NPYs046MBxQOeZR1Sy82smO3XqCajas=;
 b=zHAQCTL7vJl/+EyFoIi+bQxUwVFHuhC5AkV9y1Gi7cEAa997iVcFS0Hz9XWd1VeWeoZr8UAtmBo6CdlMe0wvn0Cu4SppXbuiEacGErtCktrmrAFN2EwfYQ5p82NcCQcHg2X8CYVHg49A27RY/vyr9PyOBeqA6BJyoNf9I7KnmuM=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@eu.citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>
Subject: RE: [PATCH] Changelog: Add details about new features for SPR
Thread-Topic: [PATCH] Changelog: Add details about new features for SPR
Thread-Index: AQHZLRqZNJwiiBkqnku+FjPpsLRxRa6yKKGw
Date: Fri, 27 Jan 2023 11:40:49 +0000
Message-ID:
 <AS8PR08MB79918B0D0329A2B722B773EB92CC9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230120220004.7456-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230120220004.7456-1-andrew.cooper3@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4ADB29284D25B54B9F8BC3377AA29FC4.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM8PR08MB5585:EE_|DBAEUR03FT004:EE_|AM8PR08MB6499:EE_
X-MS-Office365-Filtering-Correlation-Id: b48bea97-cbb8-440a-3b8c-08db005b5b4f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 X0c6cufnb+jk/da9qFU3D8FV7xCDen4jyM80RGi+rZ3d8APUM552FTivZZrHB9oLN2e9emqSJf6z9/gP8DHc7YrLwy0iLs5um2NF7dq80Itj49Ef7OGi5YpWSCbdSgI6dHfUL+A0PFcSYH8lbX7DDNCsXuB0CUNjpzsVkRNQjtMgVj3/xWH1/Hf2tBsQ8KhnHXkbDoRS2gvY2ylfWs3+7NHZ+Wrgty0DTGNhj9RcE62zLXVeBkJ6oc2OQjwMMHsrB9+vLBBSITvb85/dThwXxZS2TkXvQzb3yKOoWl2j7StvaP0CDGSrwbUlXNUDsNgrJBLHAfqFcif9eM5MYygpUSBD6MoUPZZ2LgPEo1YDV/YMQTUZmuuHoTPspUXijHDkdIgLbfCYUdX/EpWAu/6ZDwZB+g/qyCq55GFrDMcBtUYlm41adQd/qbvJbjw3uiKWup2+RIQbIhMhp7PxK31x+VSYj+z/zS/M3W7KYu2dic1GiG4cbwhuGMBoMxb6cM7bgbc6y15EMDt9JA1YQx7lrwu7wMaQFKp5sWeiQ3+hrejDWaelclniyAPcs9LDKvFiq0Ue9vG9P5kV8u3xGcu2I4/nFjIb4+EPGY7eoEaRkkrz2vQVucHc/0hFuNNns0PbDYWTJzkNjzpTKW96pFk2lveXCB+AcPQoaO9ZKp03KOZyJwWT24Vg4EmarSPymQnQq8gvriJcueDvPVtgu2lJzxIRrmBDzYqtGnUN2ElF7Sxa80PTzvQUPz6SjzJ3jU+r+dl8S/xFnQN93GOx2BcikRXNOF6Tlui2QwK1s6DlE2o=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(451199018)(71200400001)(41300700001)(7696005)(38100700002)(122000001)(54906003)(86362001)(4744005)(8936002)(110136005)(316002)(5660300002)(38070700005)(52536014)(33656002)(55016003)(2906002)(83380400001)(9686003)(26005)(186003)(8676002)(4326008)(6506007)(76116006)(478600001)(66556008)(66476007)(66946007)(66446008)(64756008)(59356011)(207903002)(219803003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5585
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c4889867-9b5c-46ae-c0b1-08db005b567f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0QXcvtzUWe3MOgS0fPiw7gt8Cp2+evBKQFY7okzYMXEGOVEzPmspJksxnLzuECzjfNN+MlpMMaPdV2U0bMlWdP9Uc1gmGbSYM+LQiDCsGQ3He5KRfnLt/PePRUvHbEmGBfz1JSZ3UUPkp/+BnO5Ex0p5EvUtPofCMhokEW2CIw2SX2INYjHDwJX30vJ9CDNrhG0RmKMjQ+RssO73nMX4AdkQ6BtlYBUB1kVWJSj5o/ekufC1c1RwZK1dEim/IJToTQFa4mR4rEEf1ocDJIlIZcLsTbgI+k2k0REuOle/KF9DfxJyXwAcQEjB6yIHfXsHWfihHsuWjms8xBVAOXzu0NNxom3cOq8DFCsOdoQTVI8bq8RPM7z6Uf4yKnY2r2k8rZncW56VE17MyUmAM48yG8dJ0rEYD2hTq4owj0RKHSYXzuGQOyq1E2AhH9D3VchjogsYvxlD14amsU4Gtx6/j8xZZnJ4oep+HN59a66lx0/BLIbiqwzrg0BbSM9VtE8tuIS4D4q608yTUXDaD1qdi74dptp1bKxKoIUsupxz1yncYWZKlc362QdG4XNqL8Di6Bd2WWUxu+xemZdD9M4xZiW4jn6TjdAR3kUjemaIAUXEMbKl9GLLe/SRKYVrftP8hoZBsl75Ny7/JlFi0Z/KQMlMG1qaddBNtYoKvlqPbbWkm27AbHJwMFWVZfbAvo0uXeh6oQOEAOJ7ZqcWngeUPxEiF08jbbnHKE9dvYxxMBxRjADaipM2oP1icjo1SLVPZG0eV1gT9zLpGLdb5aQheUFcOnjtQEdj4FlwI2IId0I=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199018)(46966006)(36840700001)(40470700004)(4326008)(41300700001)(70206006)(8676002)(70586007)(83380400001)(316002)(52536014)(8936002)(5660300002)(110136005)(55016003)(81166007)(40460700003)(356005)(4744005)(40480700001)(2906002)(33656002)(9686003)(36860700001)(54906003)(47076005)(86362001)(7696005)(478600001)(336012)(82740400003)(6506007)(186003)(82310400005)(26005)(59356011)(219803003)(207903002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 11:40:57.7000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b48bea97-cbb8-440a-3b8c-08db005b5b4f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6499

Hi Andrew,

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Subject: [PATCH] Changelog: Add details about new features for SPR
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks for remembering this :)

Acked-by: Henry Wang <Henry.Wang@arm.com>

> ---
> A reminder to everyone, write the changelog as it happens, rather than
> scrambling to remember 8 months of development just as the release is
> happening.

I wonder if there is a way to automate this in our CI so we can avoid
forgetting this. But currently I am not really sure if the solution in my m=
ind
is simple enough... I will try to keep this issue in my mind so that probab=
ly I
can come back with some solutions.

Kind regards,
Henry

