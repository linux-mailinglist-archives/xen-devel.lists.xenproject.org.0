Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC42F59292D
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 07:47:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387020.623075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNSw1-0007NL-7i; Mon, 15 Aug 2022 05:46:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387020.623075; Mon, 15 Aug 2022 05:46:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNSw1-0007Kq-49; Mon, 15 Aug 2022 05:46:45 +0000
Received: by outflank-mailman (input) for mailman id 387020;
 Mon, 15 Aug 2022 05:46:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=krio=YT=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oNSw0-0007Kk-3w
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 05:46:44 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140049.outbound.protection.outlook.com [40.107.14.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a29e4dc3-1c5d-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 07:46:40 +0200 (CEST)
Received: from AS9PR06CA0213.eurprd06.prod.outlook.com (2603:10a6:20b:45e::12)
 by DB7PR08MB2971.eurprd08.prod.outlook.com (2603:10a6:5:1c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Mon, 15 Aug
 2022 05:46:38 +0000
Received: from VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45e:cafe::da) by AS9PR06CA0213.outlook.office365.com
 (2603:10a6:20b:45e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.16 via Frontend
 Transport; Mon, 15 Aug 2022 05:46:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT007.mail.protection.outlook.com (10.152.18.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Mon, 15 Aug 2022 05:46:37 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Mon, 15 Aug 2022 05:46:36 +0000
Received: from 84a514d51b01.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2E13FC0B-CA37-4685-8DBA-689193B68387.1; 
 Mon, 15 Aug 2022 05:46:25 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 84a514d51b01.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Aug 2022 05:46:25 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA4PR08MB6301.eurprd08.prod.outlook.com (2603:10a6:102:e9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 05:46:23 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::240a:5b52:7540:5772]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::240a:5b52:7540:5772%3]) with mapi id 15.20.5504.028; Mon, 15 Aug 2022
 05:46:23 +0000
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
X-Inumbo-ID: a29e4dc3-1c5d-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=jspE3iVMvazDyjSObRetJLKv5zAYMoWYXuXPARjxq5DZBMsH410r7oc186WBs9VD06bLpSWhXk69/gkowsaRhbuglrq6vqlRM3cYEzQAwzX1T7y+FU4oX++f3Uzmlfpzqz5UMvVP4aZwq6ip+PuRAnw3108v0lUZWtfCaeET5vHNu4RspJUFOlzXzse+Tih6goZjzIZY+5fZcc1e/TriXcZcWlw54sVMXX/4+o4FzMBQgXyQ6vtlV4Qbzf3LLW6eK11M7SjvYzPIYiPKKVEdGcQFYBAMljZ2BVRiKHHi4DE8RQGED3AbhjNwl+98C7f7fb7Qr9QubHKdmeX0dEr5xQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYoWWg6GKOlbSGmJ0zJca36vTHu24ztCsVE1HXq+KTg=;
 b=VfPKNFWtxcrYFXS+/ITb8nhPSMwc/q2FWdXUw8/FL9z/OyHupPCO5DtmpiJBrIVWYikNGw+blvsK9XesQ1dBIHfrtRk2M9kIEke6xDc9+j3NyG33AxMPR6/TnFEXcwyyCX8mBurZGSZWvHgHKLfN44BdAsCDEVKeeTbOz0hbm7Q6IayYEV7tQmoGyZ/4zHBZyN5AF6yhCkl9hXmv/otVnHTccYu3TppEEBNAZdsQ6rYsk+wBzc80ydIXMA9WWHu7R6BDlyj363pjmFDr1OoDcjj3bEWEdZXepL0xZ6GNSNFJMt0yOZiatuWhfz/V+6cRMZUOy84kUBb/+ya2K91sAQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYoWWg6GKOlbSGmJ0zJca36vTHu24ztCsVE1HXq+KTg=;
 b=JwDCeRQBzaeLupJwyvDyKp15MoqnRlwIO8ZahoUefxelIqTNM9MGSG9n+76yGiePhN9XNstlknfBI48K5wrrorL0EL7k4HilLAkJmmabA+yfQzEMCArjQ46jPyRo4gfvkZ4CTrHZbA9Tj7gKqu04amV61PKXnvoaxYA71O3hF5Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RqjRyLl9atISj6h1fcxEej8VcWUB2td9ZKG7eZPLNLlu9DW3GuMC0X91J9B1qSoofuRqQluCEXm1C0I0REGc38tuIppiN+kaIjtmSei/zb9tkhXF64dzORMpJuY1VjCxVO+MoZ6dMkmfSv4D8M72vWb1E1XVG90LW8ALhRtmf2Q3QNHuqTeNjuqOhF2VleVnW9G6RiUzSFcceO3YeexCdK2RrjMAREIhbHGSQq/g0zDx2ZW553acs2qd6FxB6lX8P1SWFwFpUOb5QRclzwle9vciqX0u/z/riEzfn2WmqH9FQYQgiO+f1Ttc+sLM39fxU1oqsu7ZCXhHg4tYNXL8Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYoWWg6GKOlbSGmJ0zJca36vTHu24ztCsVE1HXq+KTg=;
 b=Gm+fTNs/AWil/SJr5O/bzxxMJ7XxqxzQcgKUF8SDHYwIis5jG3MfZuWiPQ3ghX1LhObkNmrfUAogV+3z1ialBc4nag6cILtT9nda8aK1VREvHuSvDxJEZ0tcQbh+rI3p5Vcd1uQhB8SVIo2Mkrz86slmKuZgHKNHh8CeCk5bznS88ZXIJ9lke/JCnTsAGOJSjGSQ3BC0R25IeTzfZXcMnxX/XKh6XUQlFT4NGPPe+Y8UGxAlpdC7eHaGYNEkxzZtXkFPHGbcl1JWaEUsz5BYXqb8B4Zf/RsaULUG73aGOAmgcUDFntyhmbal3//N7tPL8xeVhbP5SAWlxVtBbAhU9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYoWWg6GKOlbSGmJ0zJca36vTHu24ztCsVE1HXq+KTg=;
 b=JwDCeRQBzaeLupJwyvDyKp15MoqnRlwIO8ZahoUefxelIqTNM9MGSG9n+76yGiePhN9XNstlknfBI48K5wrrorL0EL7k4HilLAkJmmabA+yfQzEMCArjQ46jPyRo4gfvkZ4CTrHZbA9Tj7gKqu04amV61PKXnvoaxYA71O3hF5Q=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jgross@suse.com" <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, "Wei Liu (LSG)"
	<liuwe@microsoft.com>
Subject: Xen 4.17: Current status of series floating in ML
Thread-Topic: Xen 4.17: Current status of series floating in ML
Thread-Index: AdiwaSAsLXrq8BcIQ6OGhWLWfPbjFw==
Date: Mon, 15 Aug 2022 05:46:23 +0000
Message-ID:
 <AS8PR08MB7991375F9A36B36AE5ADF3E092689@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: AA08157E589B2F4CBC35B860539D49AE.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 3dfc8d6c-5ace-4c34-8f91-08da7e818532
x-ms-traffictypediagnostic:
	PA4PR08MB6301:EE_|VE1EUR03FT007:EE_|DB7PR08MB2971:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 sa9nkaZNsgwOUSlbx3XgAbVcYUrpcTlNBFQKnzvhupx8e7PrjsMzi/DE/CSidC9EBvcqZHPTKHwJQzYXswCs9e87KIiPtRQpdVLh1p20dghf15bl07sPNY1EiOwc1hlQqbH7Rw36UcFrNJYQ7HB7thReYS//bk6XL7GFEk60W1Fu7Nj1Drd1r8MQL9GjZB2+f9YcEsN1mPbfjBbwTVHyzMuwgiNOuwjPGqiqJtFXjeElWQ4i2nHeAmitQZ5IzjORd7mmjGQuvBQiPv4Hm8w7Y7Ko1OO5RfE8/AJxxOPAvontFoc797eUmn7Xx04lsni8GwzBXZJ4eKPBOzrq/940e6Hc3eWs3dNqUqf+Oj3g2iAEI9IiCnq29aNq1yo2RhCBGWN8BfihC84De8zbqcteg1Owkoq/sKVVbRufZZ7juH8KwBzFDQTpTvqfNHmg3uR8rwv4ggumSBljUItxAHbMm9aAs+w3TPlD104MugIDIaVA34osjFSNKpGundsUpn3eR4hrxTMywqbT8aakVgSFqHpJA1JBdFUO1eGDE9sLuaCd8H7g3aLRaoYCpRtOD4VLRs5cdD4fe+zA0s0KdlTZ/bIPDHYfpp9Naek50BnYIt5vgj28P7/e3iRmoh9WHUz+uC5u/C/GJlA7WjKY8nFzGy/Fg4rj1YeoeonPyaX17n9RXCzHmasaQ8vDEjfApStOUQdDFp/rbXpbfojK7GpXTtxwbjagCROLjbRSKJ9OAPaAHkGHMvYtFaLfsDjOGI5O7+IIfBdz3tMqxAF5CogPcKsx/qMHqxPZWI9e8A7VfLlZiLh+1q9gk6PzPfIilc2+18aRVp4GzFm3LjDT6g/VKtz4m6MR8QtobacKCX23WQqRNgNSyAYC5B+ycMVx6A6N
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(86362001)(186003)(122000001)(38070700005)(9686003)(83380400001)(55016003)(7696005)(33656002)(6506007)(26005)(316002)(54906003)(478600001)(966005)(71200400001)(41300700001)(8936002)(64756008)(7416002)(8676002)(66946007)(66446008)(52536014)(6916009)(2906002)(66556008)(76116006)(66476007)(5660300002)(4326008)(38100700002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6301
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ac53cda2-4081-4a90-efc2-08da7e817cb1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MEiLRVyNHqgGpYkI3Ok2Jj8eRC1igAytBP2KS1x7eIQIfpGEhXMxd1QEHxu7TctSpmhYSkC8smAfjpwzU3WHvX7EbBUXluaV8Mlz658V6XIg1xprdGviXKkh8w2C5aYXF+81ztvkdSaMTZ9SwQ+ZBZFS/Qdf5gi+iF+mkqSyoAPnXWVc5vYfKTL4WpY7gJZWlOt/CZU2FDuAcUYFYZ5OddECc6uKpq2pE5l5+kztpvk/vvVJkEsflL3WFNoH8Z3pasiJ4f5f0HGTTxZQCExpN9G/Jl+Z/XrbNXUjPabWjX+o5aLora6rh4fq4a1P9DiAdF6lQemvKyL/zapjNTqEGsKLQFGGkrFqDbF7hVJZLK7N0zfXcHrhw/8LAnnZkhjL4joomlGSokcmt2TjT0K/UhEowmro9SVXiO7DntnCEAjRdc5aWaraG7shk5hw6Bpympi8iUG6uZHaAQhnuuqhDKX1gKa7KxyHFdFivGpQy1CCnY4deHx54zPBYS5CYSc7o0iC6QnboF3yCbDlGluSIHPry00H5V+zgOeY06rtdS3NSg068Y4aU+jPdGwf+lqFq7oX+aHfu6ZhDgp4fhZ7MIznD7tJbPo31+f3bTMVhTBikb+bg6CC6oCYbEoFMRu1f/tLXPKEXcd7z01HfaXLzKt+kWhLwDTWdwt8wc+7dySqBmWtZDYotk1GWJEzr1tBML1SXouMSfLVhmD9JzQodVcQOjfnCrFN94wZJaLpg6o1VPZXifARbsZr7+s7ctCGfZCokahNfKdtJtQku8hkGA62dOaLM7kZeKPYbsRK9PmTnA4Gv/r9/3Vfar+PELhYsiGauKA4YiG5K3G3hRoKJlD9TamkB2F9iNakfUUhrYo=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(39850400004)(396003)(46966006)(36840700001)(478600001)(26005)(6506007)(9686003)(33656002)(7696005)(86362001)(336012)(186003)(47076005)(41300700001)(966005)(83380400001)(55016003)(40480700001)(82310400005)(4326008)(8676002)(70206006)(70586007)(107886003)(6916009)(316002)(54906003)(5660300002)(81166007)(356005)(36860700001)(2906002)(8936002)(82740400003)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 05:46:37.5348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dfc8d6c-5ace-4c34-8f91-08da7e818532
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2971

Hi all,

As planned, we are now 3 weeks from feature freeze date (Fri Sep 2, 2022).
Below is the current status of series from last two months. I've grouped
them to blocks for easier search. If I missed your series, please let me kn=
ow,
thanks!

** Blocker List **:
1. Patch: x86: enable interrupts around dump_execstate()
https://patchwork.kernel.org/project/xen-devel/patch/e717897f-980d-ad44-31d=
9-39f5e7e1c45e@suse.com/
Status: Waiting for review.

2. tools/xenstore: add some new features to the documentation
https://patchwork.kernel.org/project/xen-devel/list/?series=3D665064
Status: Patch #2 merged. Only patch #5 is not properly reviewed/acked.
Discussion seems going on and (probably?) needs a respin.

3. The fix of libvirt after the virtio support in toolstack
Status: The OSSTEST seems to work properly, apart from what Jan
asked in IRC - the qemu and omvf OSSTEST might need a force push.

** Arm **:
1. xen/arm: More clean-ups and improvement
https://patchwork.kernel.org/project/xen-devel/list/?series=3D667258
Status: Mostly reviewed from Arm people, but need maintainers
confirmation.

2. static shared memory on dom0less system
https://patchwork.kernel.org/project/xen-devel/list/?series=3D661838
Status: Need reviews for #1 #2 #9.

3. populate/unpopulate memory when domain on static allocation
https://patchwork.kernel.org/project/xen-devel/list/?series=3D661326
Status: Penny will send v10 soon, reviews needed there.

4. add SPDX to arch/arm/*.c
https://patchwork.kernel.org/project/xen-devel/list/?series=3D667294
Status: Discussions going on.

5. xen/arm: Add xen/arch/arm/efi/stub.c in .gitignore
https://patchwork.kernel.org/project/xen-devel/list/?series=3D667257
Status: Reviewed from Arm people.

6. [v2] xen/arm: smmu: Set s2cr to type fault when the devices are deassign=
ed
https://patchwork.kernel.org/project/xen-devel/list/?series=3D666944
Status: Reviewed from maintainer with one NIT, not merged.

7. [XEN,v1] xen: arm: Check if timer is enabled for timer irq
https://patchwork.kernel.org/project/xen-devel/list/?series=3D666559
Status: Waiting actions from author.

8. xen/pci: replace call to is_memory_hole to pci_check_bar
https://patchwork.kernel.org/project/xen-devel/list/?series=3D665681
Status: Waiting actions from author.

9. arm/domain: fix comment for arch_set_info_guest
https://patchwork.kernel.org/project/xen-devel/list/?series=3D665636
Status: Reviewed from maintainer with one NIT, not merged.

10. PCI devices passthrough on Arm, part 3
https://patchwork.kernel.org/project/xen-devel/list/?series=3D661197
Status: Waiting actions from author.

11. vpci: first series in preparation for vpci on ARM
https://patchwork.kernel.org/project/xen-devel/list/?series=3D660828
Status: Patch #1 needs actions from author. Patch #2 #3 need review.
Patch #4 acked but not merged.

** x86 **:
1. x86/traps: Make nmi_show_execution_state() more useful
https://patchwork.kernel.org/project/xen-devel/list/?series=3D667235
Status: Need reviews.

2. [v2] x86: show_hvm_stack() requires enabled interrupts
https://patchwork.kernel.org/project/xen-devel/list/?series=3D667114
Status: Need reviews.

3. [v2] x86: help inlining of functions involving alternative_call()
https://patchwork.kernel.org/project/xen-devel/list/?series=3D667117
Status: Need reviews.

4. x86/P2M: allow 2M superpage use for shadowed guests
https://patchwork.kernel.org/project/xen-devel/list/?series=3D667092
Status: Need reviews.

5. x86/spec-ctrl: Reduce HVM RAS overhead
https://patchwork.kernel.org/project/xen-devel/list/?series=3D666983
Status: Discussions in patch #2.

6. x86/cpu: Drop _init from *_cpu_cap functions
https://patchwork.kernel.org/project/xen-devel/list/?series=3D666830
Status: Need review.

7. Intel Hardware P-States (HWP) support
https://patchwork.kernel.org/project/xen-devel/list/?series=3D666690
Status: Need reviews.

8. x86/hvm: Improve hvm_set_guest_pat() code generation again
https://patchwork.kernel.org/project/xen-devel/list/?series=3D666603
Status: Waiting actions from author.

9. x86/AMD: check microcode size against CPUID-supplied limit
https://patchwork.kernel.org/project/xen-devel/list/?series=3D666515
Status: Need review.

10. xen/x86: import linkage.h and clean up x86/kexec.S and x86/entry.S
https://patchwork.kernel.org/project/xen-devel/list/?series=3D665401
Status: Patch #1 #3 reviewed. Patch #2 #4 need actions from author.

11. x86: rework hypercall argument count table instantiation & use
https://patchwork.kernel.org/project/xen-devel/list/?series=3D663480
Status: Need review.

12. x86: XSA-40{1,2,8} follow-up
https://patchwork.kernel.org/project/xen-devel/list/?series=3D663143
Status: Patch #7 #8 need replies from maintainer, the others merged.

13. x86: limit issuing of IBPB during context switch
https://patchwork.kernel.org/project/xen-devel/list/?series=3D662741
Status: Need replies from maintainer

14. [v2] x86/mem_sharing: support forks with active vPMU state
https://patchwork.kernel.org/project/xen-devel/list/?series=3D661567
Status: Waiting actions from author.

15. [v2] x86/PV: issue branch prediction barrier when switching 64-bit gues=
t to kernel mode
https://patchwork.kernel.org/project/xen-devel/list/?series=3D661061
Status: Need review.

16. XSA-407 followon fixes
https://patchwork.kernel.org/project/xen-devel/list/?series=3D660818
Status: Patch #3 reviewed with further actions from author.

17. x86: Add MMIO Stale Data arch_caps to hardware domain
https://patchwork.kernel.org/project/xen-devel/list/?series=3D660729
Status: Waiting actions from author.

18. x86/irq: switch x2APIC default destination mode
https://patchwork.kernel.org/project/xen-devel/list/?series=3D655330
Status: Patch #1 merged. Others need review.

** toolstack **:
1. Toolstack build system improvement, toward non-recursive makefiles
https://patchwork.kernel.org/project/xen-devel/list/?series=3D666960
Status: Need reviews from patch #22

2. libxl smbios support
https://patchwork.kernel.org/project/xen-devel/list/?series=3D666694
Status: Need reviews.

3. Virtio toolstack support for I2C and GPIO on Arm
https://patchwork.kernel.org/project/xen-devel/list/?series=3D666202
Status: Need reviews.

4. libxl: replace deprecated -sdl and -soundhw qemu options
https://patchwork.kernel.org/project/xen-devel/list/?series=3D666029
Status: Reviewed but not merged.

5. tools/libxl: env variable to trusted default
https://patchwork.kernel.org/project/xen-devel/list/?series=3D664081
Status: Need reviews.

6. tools/ocaml code and build cleanups
https://patchwork.kernel.org/project/xen-devel/list/?series=3D664150
Status: Patch #2 #5 #6 merged. Others need actions from author.

7. [v2,1/4] tools: remove xenstore entries on vchan server closure
https://patchwork.kernel.org/project/xen-devel/list/?series=3D659375
Status: Need reviews for patch #3 #4.

** XSM **:
1. [v12] xsm: refactor flask sid alloc and domain check
https://patchwork.kernel.org/project/xen-devel/list/?series=3D666302
Status: Need review.

** drivers **:
1. Add Xue - console over USB 3 Debug Capability
https://patchwork.kernel.org/project/xen-devel/list/?series=3D667299
Status: Need reviews apart from patch #2 #3 #8

2. PCI: avoid bogus calls to get_pseg()
https://patchwork.kernel.org/project/xen-devel/list/?series=3D666322
Status: Waiting for v2.

** Common **:
1. xen: add late init call in start_xen
https://patchwork.kernel.org/project/xen-devel/list/?series=3D664963
Status: Need actions from author.

2. xen/wait: Improvements
https://patchwork.kernel.org/project/xen-devel/list/?series=3D660565
Status: Need reviews for patch #4 #5.

3. xen/sched: fix cpu hotplug
https://patchwork.kernel.org/project/xen-devel/list/?series=3D664817
Status: Need actions from author.

4. Hyperlaunch
https://patchwork.kernel.org/project/xen-devel/list/?series=3D657187
Status: Need actions from author.

Kind regards,
Henry

