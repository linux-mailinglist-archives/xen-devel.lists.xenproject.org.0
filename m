Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0836058023D
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 17:52:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374683.606823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG0NG-0003ro-0F; Mon, 25 Jul 2022 15:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374683.606823; Mon, 25 Jul 2022 15:52:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG0NF-0003pH-Sh; Mon, 25 Jul 2022 15:52:01 +0000
Received: by outflank-mailman (input) for mailman id 374683;
 Mon, 25 Jul 2022 15:52:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ymx=X6=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oG0NE-0003jA-43
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 15:52:00 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140085.outbound.protection.outlook.com [40.107.14.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7084c4f-0c31-11ed-bd2d-47488cf2e6aa;
 Mon, 25 Jul 2022 17:51:58 +0200 (CEST)
Received: from AM6P195CA0016.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::29)
 by AS4PR08MB7758.eurprd08.prod.outlook.com (2603:10a6:20b:515::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.23; Mon, 25 Jul
 2022 15:51:56 +0000
Received: from AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::a7) by AM6P195CA0016.outlook.office365.com
 (2603:10a6:209:81::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18 via Frontend
 Transport; Mon, 25 Jul 2022 15:51:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT026.mail.protection.outlook.com (10.152.16.155) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Mon, 25 Jul 2022 15:51:56 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Mon, 25 Jul 2022 15:51:56 +0000
Received: from e4ba0395712b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2A4722A5-B0C9-4352-8514-E676B0CBBCE1.1; 
 Mon, 25 Jul 2022 15:51:48 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e4ba0395712b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 25 Jul 2022 15:51:48 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by HE1PR0802MB2281.eurprd08.prod.outlook.com (2603:10a6:3:c0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Mon, 25 Jul
 2022 15:51:46 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5438.026; Mon, 25 Jul 2022
 15:51:45 +0000
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
X-Inumbo-ID: b7084c4f-0c31-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ih5y2lz/J7QifjnWNGRMDmQSOwo6A5YXabHTc2O7P9pufJNuS9e8d3dEi2/nNcNm4s2vpQKpDpjqHw5tLFM/CUbn6lYr5IpS3vrwUa9EvIMWvJSUwUVQJx8A19evTy69mTbRo5mMYTz8uq+uIK9wb/vc/3B/mnvJIcDsmECT1LXsQnRsfP1E678zrgm9ZvnpNrZLAPzM69F0VBE8FYmguiJ7yD6y0fNGnty2aavh3BhC0eK1euVNza8WZt+Bo18UIKyyH5ksp6k0etQYKDnAfIIPLgazc8xgBOxT21L2/QRV46rRYNXsn7BdlBKhPw7ki7nEViqLMKArvzkeKQkEFA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPlSXKsfflmUNxZ8WYhL1yB5p1uk9h6zIXGh2wIUor0=;
 b=of+e83822KmW6SxSCECuMoy/NqAGv+MXRXkMQAhdjz+gxApniYFTC/E7msL1+wFjBTHROx+yIrMITE9tSGuzjPIytha2shfk+F0xQdU5d8t+xQ2lLyrmB00AhfwDd3cWsnoovJqHbx+hwO23D4Pg5GWI9jntOYjFg3dGVA/gNNzAva9aBvOguDg1J2TftnceO4BhqbORXxUi8VVMHkZsqppvsSWlAhtPpgOLDznrFSSLDbkiBbASO3f7Wk0cc+9iFe0+QASeKMFwp91VHfUJGgzCdIoqf5NMmkBjsMDRxtAdHLbG8uIeeMxenzf2g2+DDYANa4TG+RxagneGXJZa9g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPlSXKsfflmUNxZ8WYhL1yB5p1uk9h6zIXGh2wIUor0=;
 b=2h/cjaFZXi/a+PVtNw7BvVDBDyfGgBgtXPMSXzIyqrq59eYfQr6RwYxkLT18Mr+K7X8EaakyK0FGrpgB+Jlk63LF7fna+YGMmuEDaJ1OeORAGrZmX9aA2KBhePw4fO4vKgRWSDnXNMtQbiNMxp299BomnILbcFemd4lZQcdnAms=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bf49dd52388c20b9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WZ5j6cn+fdrqDtoh/8bSM86igy080RH38Fi+iLe1OYxFPvOm1nc0omPg1T7pSk1FfpwgMaHb1eUju3aR1usT6JTh7ZJQ0u8p4ZJeEznsxrng6BWzKVhqezXtl4hC/fl9SlgSZDhl18nRE0BUIf0vMRaqSM3LL1DRXpUe6VjU3QEnJQ6qvERbXIMa0Q2GleQcLfRfkH7GVHihUDiWUjj95vGv3J5mwTrzRaKkI7JkSpbtBkzx32ZIpnF0fIPorabfMdkjH1Kg130gxo1w9Z9uuUPEVKbZ9adf0Cn1WcGe+/PgIeGtcaI1HQIE9Bbikl9ydV+h+kI3LG2WziHXXNwmmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPlSXKsfflmUNxZ8WYhL1yB5p1uk9h6zIXGh2wIUor0=;
 b=Ye9QdmspcQclVUMFjNh1qYCIFiOlGjzAT+THV7GzJKhO1HG1KEyNsHys42U8OhPFjk39/f4hO6HhkKkIrrLYH50prS9f0zZiXzInidu9hxIoI7PHu2mLKt2EDaQq5IwWevxHkzi+WMZ4oV5srVWFhTUCtiwKitRmVLtu30Rvn53CWLIihaO8FkC46jfnjp2mmmlfg7hiDTpUTZ1MOavRq9iK0vMLv5WMECYZRuL9DK2fLQv0cC++V3JLmg3zgISnlLsxa9duy5jKEbXpGBxOQEGxEkpUgZPmxB6uEJyiq4V2hQnWJUY2z8l+MlmT6hPAdmhe1+oBMHySrI01oZxKuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPlSXKsfflmUNxZ8WYhL1yB5p1uk9h6zIXGh2wIUor0=;
 b=2h/cjaFZXi/a+PVtNw7BvVDBDyfGgBgtXPMSXzIyqrq59eYfQr6RwYxkLT18Mr+K7X8EaakyK0FGrpgB+Jlk63LF7fna+YGMmuEDaJ1OeORAGrZmX9aA2KBhePw4fO4vKgRWSDnXNMtQbiNMxp299BomnILbcFemd4lZQcdnAms=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: Random crash during guest start on x86
Thread-Topic: Random crash during guest start on x86
Thread-Index: AQHYoD5xlH8T1cfPDEKhJmKe7Gw5BA==
Date: Mon, 25 Jul 2022 15:51:45 +0000
Message-ID: <65C0A220-EC7E-4915-AC45-77D87F4E411E@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 194214bd-78a2-47c3-e31b-08da6e559a05
x-ms-traffictypediagnostic:
	HE1PR0802MB2281:EE_|AM5EUR03FT026:EE_|AS4PR08MB7758:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +OGb+UPpMtXuqQ+E8KdY1Smx9mY6S/IE8OCCn3Z1+Bx76RaiuuvmSNxBVuzvPSVnxsc0pqlcX9W91DT1M/+Z0QvN7bfiQ0BzGRw9+08SVRo5sXuY6XcKFk9AOLIt/uxeG+zGKA5/G24ETrhpqIS1y42du3e+jnBGojlttZVHsRmY79mQDacSOq/n8EkK126unSAUAzg1oQBbvNwD1EODX5denSK3ArvrPCcsuezobko/WolapMTUVVI69eopAOPGmR0fNCsR/3MUOySecgPJyU4HLHllpJF29QKx4U5ZoYoYorsMnjhZhxPI2ChI42fPJkaUu2IUg97+MGQ6b+h3tttGPpAHAeERbVZaL58eT2yfZF8FtQlHMpig8RuZHqY3r3py9Y+9fEHmsf2OC/RQi/WecIahNpmMpg6JIgeZ5d3pSOPcJvzJ8kXj49unbCU/5E0DRK3v2JDlrs1+5r52fYVhTTzlsSlSwmcijccmZBUGROwqOpe/JZlM0Kio+dGYlmdt9PalbhZkStWVOOj3Kpj5i3IKYkfaTEhfx7AM3ZCvojmewhVCOQjn8x2x21oCkTv5jN+fq/knfG2F7Jp7PaFeUzZE6rkuayXhbEyuoifOVy4zZbXBLWhaaRVi+sbcL8p1zZSCkhEJg92i2rVnB622tGriV8T88jhUF/mLSzXUcVfqL+PMiXHv2Ies/w28LW5zLlHDcDsO2E8Eq9Qi4cn7NixxFQc7I53kE9ah8HyqYeG4ZZdtaSW+OLNAsrLSYJ08Qm2iVWmyDG3Iu8zgABOc/fL/8Gh7Zl34m8ERyZ9mknCIBzQJcY7HLgRt7qjzi1MSmmSasCCg7dfVRq5Y/g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(366004)(346002)(396003)(66556008)(83380400001)(38070700005)(66946007)(91956017)(38100700002)(122000001)(66476007)(76116006)(66446008)(5660300002)(54906003)(8676002)(4326008)(6916009)(30864003)(186003)(6512007)(2906002)(316002)(2616005)(26005)(478600001)(6486002)(8936002)(45080400002)(86362001)(41300700001)(6506007)(64756008)(71200400001)(33656002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <5717D13B01FF8E4CA0E065CB35038E29@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2281
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6e4b6203-7054-475f-18b5-08da6e5593e8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8PjvkyWqaB72w0VeKFGYyrCXkzwomV+vsvjRn3u2kQvQiHYYNqUUEy9aIcV1ROvC/HkL7oacfUVwjGRiyCF2cmwcDHsIsfD26kWtcYoTADZO6X2YOrUn3FSuZkKpbkr8CVbsoqrURubF7czDAA/0hEV/T1A/B6Do0TEfXmc/H+3OUEgB8YJq9pWGpkIxfvCfA26lpjF3TT+EeXeaRI+8dHypjVUEGVCuht2Q66PHCKeiG3PLF55PRf/m2NYulHON2yB76FEiu6kQhk0EOQAACq7XNQD5ZPVTBUnZ2pna+Re9wDEQikyHUWGRVQYCghLq7dFx3v+yT0B4MQB14zebxqlQLDFvTlZagFpWFpaOzhzFWoqYfO1g125YbQpKYzpGUD84ne108tENH3PerZAX9CPYfj29ERdwceH8mwVCeh/Jdd3N598gk0eO5NxxaDCkn9RtMCcOTUoNRSOqgCtxMpHBcWtCKucCdFgwirJ42F0lrUy63PZI4gT5xf1tO4dWXAFqKJCAz2f/KEfQeZ6EKZYBEigyIsFEfP2GPNI7N3ADUk2/Wrl886/cpzn8ofvDOuEvwU8NslFEqbI4C701ETR2Ti6+Ot4UyXdxeuvdBtIiP9a0WvTNF3Jn6UMieVHw89jkmU02dkP5rZjWrnOcdUQO3bI4oV8PAZHsXWYk/8V/F7xrofWW5AZ1zG9qMY1wh+9mYmXFBcsuv89WNEdNHhdZ0SebQMKgzPVsedPPgVJHD4nRi6g//0IqFZok8tgyR7oNwreVjORKeLgXwuHJQgiJxmos8RBjw4s8hnhKZ8Mk8hf93+DAV9VOjgqnCjah
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(39860400002)(396003)(46966006)(36840700001)(40470700004)(82310400005)(36860700001)(33656002)(40460700003)(86362001)(81166007)(356005)(478600001)(6486002)(8936002)(82740400003)(5660300002)(316002)(40480700001)(6916009)(70586007)(4326008)(70206006)(47076005)(336012)(36756003)(54906003)(2616005)(107886003)(186003)(83380400001)(8676002)(6506007)(6512007)(41300700001)(45080400002)(30864003)(2906002)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 15:51:56.0917
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 194214bd-78a2-47c3-e31b-08da6e559a05
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7758

Hi,

On our CI we have randomly a crash during guest boot on x86.

We are running on qemu x86_64 using Xen staging.
The crash is happening randomly (something like 1 out of 20 times).

This is always happening on the first guest we start, we never got it after=
 first guest was successfully started.

Please tell me if you need any other info.

Here is the guest kernel log:
[    0.000000] Linux version 5.17.6 (@ip-100-64-206-234.eu-west-1.compute.i=
nternal) (gcc (Ubuntu 11.2.0-19ubuntu1) 11.2.0, GNU ld (GNU Binutils for Ub=
untu) 2.38) #1 SMP PREEMPT Mon Jul 25 14:54:50 UTC 2022
[    0.000000] Command line: console=3Dhvc0 rdinit=3D/sbin/init
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point=
 registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Enabled xstate features 0x3, context size is 576 by=
tes, using 'standard' format.
[    0.000000] signal: max sigframe size: 1520
[    0.000000] ACPI in unprivileged domain disabled
[    0.000000] Released 0 page(s)
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] Xen: [mem 0x0000000000000000-0x000000000009ffff] usable
[    0.000000] Xen: [mem 0x00000000000a0000-0x00000000000fffff] reserved
[    0.000000] Xen: [mem 0x0000000000100000-0x000000001fffffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] DMI not present or invalid.
[    0.000000] Hypervisor detected: Xen PV
[    4.842670] tsc: Fast TSC calibration failed
[    4.842916] tsc: Detected 2799.922 MHz processor
[    4.845741] last_pfn =3D 0x20000 max_arch_pfn =3D 0x400000000
[    4.845871] Disabled
[    4.845953] x86/PAT: MTRRs disabled, skipping PAT initialization too.
[    4.846227] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WC  WP  UC  UC=
 =20
[    4.848955] Kernel/User page tables isolation: disabled on XEN PV.
[    5.214349] RAMDISK: [mem 0x03400000-0x04158fff]
[    5.221796] NUMA turned off
[    5.221926] Faking a node at [mem 0x0000000000000000-0x000000001fffffff]
[    5.222712] NODE_DATA(0) allocated [mem 0x1ff17000-0x1ff1afff]
[    5.374020] Zone ranges:
[    5.374146]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    5.374349]   DMA32    [mem 0x0000000001000000-0x000000001fffffff]
[    5.374450]   Normal   empty
[    5.374562] Movable zone start for each node
[    5.374647] Early memory node ranges
[    5.374730]   node   0: [mem 0x0000000000001000-0x000000000009ffff]
[    5.376184]   node   0: [mem 0x0000000000100000-0x000000001fffffff]
[    5.376586] Initmem setup node 0 [mem 0x0000000000001000-0x000000001ffff=
fff]
[    5.377581] On node 0, zone DMA: 1 pages in unavailable ranges
[    5.378034] On node 0, zone DMA: 96 pages in unavailable ranges
[    5.385508] p2m virtual area at (____ptrval____), size is 40000000
[    6.156878] Remapped 0 page(s)
[    6.160205] smpboot: Allowing 1 CPUs, 0 hotplug CPUs
[    6.161126] PM: hibernation: Registered nosave memory: [mem 0x00000000-0=
x00000fff]
[    6.161230] PM: hibernation: Registered nosave memory: [mem 0x000a0000-0=
x000fffff]
[    6.161425] [mem 0x20000000-0xffffffff] available for PCI devices
[    6.161565] Booting kernel on Xen
[    6.161636] Xen version: 4.17-unstable (preserve-AD)
[    6.162085] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 1910969940391419 ns
[    6.179113] setup_percpu: NR_CPUS:64 nr_cpumask_bits:64 nr_cpu_ids:1 nr_=
node_ids:1
[    6.200627] percpu: Embedded 53 pages/cpu s179864 r8192 d29032 u2097152
[    6.204411] Fallback order for Node 0: 0=20
[    6.204883] Built 1 zonelists, mobility grouping on.  Total pages: 12876=
8
[    6.204954] Policy zone: DMA32
[    6.205071] Kernel command line: console=3Dhvc0 rdinit=3D/sbin/init
[    6.211967] Dentry cache hash table entries: 65536 (order: 7, 524288 byt=
es, linear)
[    6.214335] Inode-cache hash table entries: 32768 (order: 6, 262144 byte=
s, linear)
[    6.220677] mem auto-init: stack:off, heap alloc:off, heap free:off
[    6.242643] Memory: 463112K/523900K available (16396K kernel code, 2697K=
 rwdata, 5140K rodata, 1380K init, 1032K bss, 60536K reserved, 0K cma-reser=
ved)
[    6.250830] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D1, N=
odes=3D1
[    6.292059] Dynamic Preempt: voluntary
[    6.296486] rcu: Preemptible hierarchical RCU implementation.
[    6.296556] rcu: 	RCU event tracing is enabled.
[    6.296636] rcu: 	RCU restricting CPUs from NR_CPUS=3D64 to nr_cpu_ids=
=3D1.
[    6.296805] 	Trampoline variant of Tasks RCU enabled.
[    6.296954] rcu: RCU calculated value of scheduler-enlistment delay is 1=
00 jiffies.
[    6.297045] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D1
[    6.538636] Using NULL legacy PIC
[    6.538760] NR_IRQS: 4352, nr_irqs: 32, preallocated irqs: 0
[    6.542021] xen:events: Using FIFO-based ABI
[    6.560876] random: get_random_bytes called from start_kernel+0x4a3/0x68=
0 with crng_init=3D0
[    6.573619] Console: colour dummy device 80x25
[    6.575908] printk: console [tty0] enabled
[    6.590639] printk: console [hvc0] enabled
[    6.592790] clocksource: xen: mask: 0xffffffffffffffff max_cycles: 0x1cd=
42e4dffb, max_idle_ns: 881590591483 ns
[    6.593865] installing Xen timer for CPU 0
[    6.599636] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles:=
 0x285bf6ea05e, max_idle_ns: 440795246805 ns
[    6.604322] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 5599.84 BogoMIPS (lpj=3D2799922)
[    6.605421] pid_max: default: 32768 minimum: 301
[    6.607341] LSM: Security Framework initializing
[    6.608878] SELinux:  Initializing.
[    6.612563] Mount-cache hash table entries: 1024 (order: 1, 8192 bytes, =
linear)
[    6.613569] Mountpoint-cache hash table entries: 1024 (order: 1, 8192 by=
tes, linear)
[    6.646968] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
[    6.647269] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
[    6.647785] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user=
 pointer sanitization
[    6.648329] Spectre V2 : Mitigation: Retpolines
[    6.648540] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB=
 on context switch
[    6.648854] Speculative Store Bypass: Vulnerable
[    6.649437] MDS: Vulnerable: Clear CPU buffers attempted, no microcode
[    6.679020] general protection fault, maybe for address 0x8800: 0000 [#1=
] PREEMPT SMP NOPTI
[    6.679020] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.17.6 #1
[    6.679020] RIP: e030:error_entry+0xaf/0xe0
[    6.679020] Code: 29 89 c8 48 39 84 24 88 00 00 00 74 15 48 81 bc 24 88 =
00 00 00 63 10 e0 81 75 03 0f 01 f8 90 90 90 c3 48 89 8c 24 88 00 00 00 <0f=
> 01 f8 90 90 90 eb 11 0f 20 d8 90 90 90 90 90 48 25 ff e7 ff ff
[    6.679020] RSP: e02b:ffffffff82803a90 EFLAGS: 00000046
[    6.679020] RAX: 0000000000008800 RBX: 0000000000000000 RCX: ffffffff81e=
00fa7
[    6.679020] RDX: 0000000000000000 RSI: ffffffff81e009f8 RDI: 00000000000=
000eb
[    6.679020] RBP: 0000000000000000 R08: 0000000000000000 R09: 00000000000=
00000
[    6.679020] R10: 0000000000000000 R11: 0000000000000000 R12: 00000000000=
00000
[    6.679020] R13: 0000000000000000 R14: 0000000000000000 R15: 00000000000=
00000
[    6.679020] FS:  0000000000000000(0000) GS:ffff88801f200000(0000) knlGS:=
0000000000000000
[    6.679020] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[    6.679020] CR2: 0000000000000000 CR3: 000000000280c000 CR4: 00000000000=
50660
[    6.679020] Call Trace:
[    6.679020]  <TASK>
[    6.679020] RIP: e030:native_irq_return_iret+0x0/0x2
[    6.679020] Code: 41 5d 41 5c 5d 5b 41 5b 41 5a 41 59 41 58 58 59 5a 5e =
5f 48 83 c4 08 eb 0a 0f 1f 00 90 66 0f 1f 44 00 00 f6 44 24 20 04 75 02 <48=
> cf 57 0f 01 f8 eb 12 0f 20 df 90 90 90 90 90 48 81 e7 ff e7 ff
[    6.679020] RSP: e02b:ffffffff82803b48 EFLAGS: 00000046 ORIG_RAX: 000000=
000000e030
[    6.679020] RAX: 0000000000008800 RBX: ffffffff82803be0 RCX: ffffffff81e=
00f95
[    6.679020] RDX: ffffffff81e00f94 RSI: ffffffff81e00f95 RDI: 00000000000=
000eb
[    6.679020] RBP: 00000000000000eb R08: 0000000090001f0f R09: 00000000000=
00007
[    6.679020] R10: ffffffff81e00f94 R11: ffffffff8285a6c0 R12: 00000000000=
00000
[    6.679020] R13: ffffffff81e00f94 R14: 0000000000000006 R15: 00000000000=
00006
[    6.679020]  ? asm_exc_general_protection+0x8/0x30
[    6.679020]  ? restore_regs_and_return_to_kernel+0x1b/0x27
[    6.679020]  ? restore_regs_and_return_to_kernel+0x1b/0x27
[    6.679020]  ? restore_regs_and_return_to_kernel+0x1c/0x27
[    6.679020]  ? restore_regs_and_return_to_kernel+0x1b/0x27
[    6.679020]  ? restore_regs_and_return_to_kernel+0x1c/0x27
[    6.679020] RIP: e030:insn_get_opcode.part.0+0xab/0x180
[    6.679020] Code: 00 00 8b 43 4c a9 c0 07 08 00 0f 84 bf 00 00 00 c6 43 =
1c 01 31 c0 5b 5d c3 83 e2 03 be 01 00 00 00 eb b7 89 ef e8 65 e4 ff ff <89=
> 43 4c a8 30 75 21 e9 8e 00 00 00 0f b6 7b 03 40 84 ff 75 73 8b
[    6.679020] RSP: e02b:ffffffff82803b70 EFLAGS: 00000246
[    6.679020]  ? restore_regs_and_return_to_kernel+0x1b/0x27
[    6.679020]  insn_get_modrm+0x6c/0x120
[    6.679020]  ? restore_regs_and_return_to_kernel+0x1b/0x27
[    6.679020]  insn_get_sib+0x40/0x80
[    6.679020]  insn_get_displacement+0x82/0x100
[    6.679020]  insn_decode+0xf8/0x100
[    6.679020]  optimize_nops+0x60/0x1e0
[    6.679020]  ? rcu_nmi_exit+0x2b/0x140
[    6.679020]  ? restore_regs_and_return_to_kernel+0x1b/0x27
[    6.679020]  ? native_iret+0x3/0x7
[    6.679020]  ? restore_regs_and_return_to_kernel+0x1c/0x27
[    6.679020]  ? restore_regs_and_return_to_kernel+0x1b/0x27
[    6.679020]  apply_alternatives+0x165/0x2e0
[    6.679020]  ? insn_get_opcode.part.0+0xab/0x180
[    6.679020]  ? insn_get_modrm+0x6c/0x120
[    6.679020]  ? rcu_nmi_enter+0x2b/0xf0
[    6.679020]  ? rcu_nmi_exit+0x2b/0x140
[    6.679020]  ? irqentry_exit+0x29/0x30
[    6.679020]  ? exc_xen_hypervisor_callback+0x8/0x10
[    6.679020]  ? relocate_restore_code+0x22a/0x240
[    6.679020]  alternative_instructions+0x8b/0x13a
[    6.679020]  check_bugs+0xa87/0xadf
[    6.679020]  ? __get_locked_pte+0xa8/0xf0
[    6.679020]  start_kernel+0x64c/0x680
[    6.679020]  xen_start_kernel+0x592/0x59f
[    6.679020]  startup_xen+0x3e/0x3e
[    6.679020]  </TASK>
[    6.679020] Modules linked in:
[    6.679020] ---[ end trace 0000000000000000 ]---
[    6.679020] RIP: e030:error_entry+0xaf/0xe0
[    6.679020] Code: 29 89 c8 48 39 84 24 88 00 00 00 74 15 48 81 bc 24 88 =
00 00 00 63 10 e0 81 75 03 0f 01 f8 90 90 90 c3 48 89 8c 24 88 00 00 00 <0f=
> 01 f8 90 90 90 eb 11 0f 20 d8 90 90 90 90 90 48 25 ff e7 ff ff
[    6.679020] RSP: e02b:ffffffff82803a90 EFLAGS: 00000046
[    6.679020] RAX: 0000000000008800 RBX: 0000000000000000 RCX: ffffffff81e=
00fa7
[    6.679020] RDX: 0000000000000000 RSI: ffffffff81e009f8 RDI: 00000000000=
000eb
[    6.679020] RBP: 0000000000000000 R08: 0000000000000000 R09: 00000000000=
00000
[    6.679020] R10: 0000000000000000 R11: 0000000000000000 R12: 00000000000=
00000
[    6.679020] R13: 0000000000000000 R14: 0000000000000000 R15: 00000000000=
00000
[    6.679020] FS:  0000000000000000(0000) GS:ffff88801f200000(0000) knlGS:=
0000000000000000
[    6.679020] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[    6.679020] CR2: 0000000000000000 CR3: 000000000280c000 CR4: 00000000000=
50660
[    6.679020] Kernel panic - not syncing: Attempted to kill the idle task!

Cheers
Bertrand


