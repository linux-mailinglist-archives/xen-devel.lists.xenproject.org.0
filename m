Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E2F615E1C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 09:44:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435626.689241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq9Li-0003iG-2j; Wed, 02 Nov 2022 08:43:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435626.689241; Wed, 02 Nov 2022 08:43:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq9Lh-0003et-UR; Wed, 02 Nov 2022 08:43:49 +0000
Received: by outflank-mailman (input) for mailman id 435626;
 Wed, 02 Nov 2022 08:43:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=unuU=3C=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oq9Lg-0003el-Dq
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 08:43:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2086.outbound.protection.outlook.com [40.107.20.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7662aaf9-5a8a-11ed-8fd0-01056ac49cbb;
 Wed, 02 Nov 2022 09:43:46 +0100 (CET)
Received: from AS8P189CA0056.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:458::33)
 by AM0PR08MB5458.eurprd08.prod.outlook.com (2603:10a6:208:185::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Wed, 2 Nov
 2022 08:43:42 +0000
Received: from VI1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:458:cafe::2c) by AS8P189CA0056.outlook.office365.com
 (2603:10a6:20b:458::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20 via Frontend
 Transport; Wed, 2 Nov 2022 08:43:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT027.mail.protection.outlook.com (100.127.144.103) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Wed, 2 Nov 2022 08:43:41 +0000
Received: ("Tessian outbound 58faf9791229:v130");
 Wed, 02 Nov 2022 08:43:40 +0000
Received: from b615575a6ebb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6C32B0DF-2BF7-4FA7-ACFE-3EEBAD9F6788.1; 
 Wed, 02 Nov 2022 08:43:33 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b615575a6ebb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 02 Nov 2022 08:43:33 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB4PR08MB9336.eurprd08.prod.outlook.com (2603:10a6:10:3f3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Wed, 2 Nov
 2022 08:43:27 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5769.015; Wed, 2 Nov 2022
 08:43:27 +0000
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
X-Inumbo-ID: 7662aaf9-5a8a-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Sg201/zs4/l+dzKRxyU0BiVvIkoaI/u3ykNnotinSu9t6shl9nGwFhMCkWxPMSTm45LHqNproWTsZ5u4tysUCJGDxjk72MsBlkEF8BZjPey26s/K58Fuy9mWhgeouuwNh7MuV+QqHL0z50ya2J0YIcw/WV9zC8cqGplNB2razWuKcGRJ8SMW0dMfCfK/BE/IcSdCouXIv9wxIp+eubjvTjIwAGGCwBCZ9gYQ3Wsf2TTmuaVSJp6SPLwcBURsXxEfPfmkyyQoUkD6DxXbERhmSQuM614brVLcSEVhFVFjlXyPWaJ3s8LTo3kWQoP0axdQ5f7U7+klFLNPSySHIcbeZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhuBIBtjzum9X2+gEP41HhUCDeiUfqibsaK2tCuVjGQ=;
 b=B144Oh1nCsBVnnED1oj+ejjTuHtfphDEHzT/zz2buivJ4HAbCknZE9PW3SfqIHY6enZd9TnFxqt3MlnjxtOpoJGrhRl+QaK5tk7hipmiyHHF0ICgE2b2VAOecDkIZp2nAJUlbhb52cj8+88LRF3q1PyPzSIRZZbFMfh/ac1LlFMNeLfc3SHATSHnHhzq9kaTBK1JV7LEWy4KlrU3YtdpKJQG99v4mA8upnWsm7GQa8XpGw0wr6P/NtEE+dI526hgsaw1gSqevN+hgETTVpQlRyVeUmTmDTL0JhjYple372VZo7nuH8ENzo7D8iwJPe2M2PzjZZjnirsUwpHh0ljAhw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhuBIBtjzum9X2+gEP41HhUCDeiUfqibsaK2tCuVjGQ=;
 b=1AZ6R2vHzBr9zIf7aY0Iz6mR5Ip7Jm1/RkaeYTaeVZnkV8P98wtcKd3VWO1/uWqsTXaPmSSTfUL87C42ingkME8x4Btl0u+fm6W1IN1yRv/avkLuDhnLYO4wHdKAJMrWd8QsQRKlYq3TbSpvKBsJGrJEb7xMdl5oF31ghuo4FXg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h4YlOkNPI0glkm/QgoL+uY5nV0Q3WTNJnxmGk1NlNIL5YHmtcw14+Iilk3W53/SZMutp5Wgeou7Aq66OVMtIt9aJmXI66Kb35UBCj44yvGT1nv0+oA7qTJLqYSwj5hPHgIOMF6yoG2dvr5D0JUYH6291iddIrhA3N1WBFlzc0RMEdqaWbWmUpsiM4FDBq136l5K4i8gIM9wwJNJ/i3biiwKRTg1OYFzOkfkS0VR5q85XQP9hvSGAFWEnSPLcoLGjhfUT0aN34QOSHzwGJ8m8PkzXuwliHV9XS4jpqCPGpYdEhhMqNqEASImZDVog9Eoaj5kuBdWgAacJVQM49s3tQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhuBIBtjzum9X2+gEP41HhUCDeiUfqibsaK2tCuVjGQ=;
 b=QIv/a4QER2DDkWdbBAZfsNjpLmc9Q03Fy6CbXmuDOezZ/KH0FqEOa2oKU6wMXl0TxDbNwJ+FzGU3MnOD81eM3sihJqdtcgMjkrlAk4cOXodTzW8Rzj3QiIRYD3JkDCSP39JTtg04ILuGORw0yEpY3UIZ29rVmODGZzuKIjOWT+3aQ86lhRYU/YA8wHoy/Q4g0M/1FwmzLorTh7MgmwyT2G5zQnIeeQYgT9PknZ4ZS/UBFAv/o6aIezvqJmDQm5b987oTB0O5mWE37ixrL7TW0FzJVQgtve9frik1OLN+Xj1eElpHMSWgG7/KHtwd2tHGkxfmjSOYmMssJ7+UI/1LuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhuBIBtjzum9X2+gEP41HhUCDeiUfqibsaK2tCuVjGQ=;
 b=1AZ6R2vHzBr9zIf7aY0Iz6mR5Ip7Jm1/RkaeYTaeVZnkV8P98wtcKd3VWO1/uWqsTXaPmSSTfUL87C42ingkME8x4Btl0u+fm6W1IN1yRv/avkLuDhnLYO4wHdKAJMrWd8QsQRKlYq3TbSpvKBsJGrJEb7xMdl5oF31ghuo4FXg=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, George Dunlap
	<george.dunlap@citrix.com>, "christopher.w.clark@gmail.com"
	<christopher.w.clark@gmail.com>, "christopher.clark@starlab.io"
	<christopher.clark@starlab.io>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <stefano.stabellini@xilinx.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jgross@suse.com" <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, "Wei Liu (LSG)"
	<liuwe@microsoft.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: Feedback for postponing the 4.17 release to a week later
Thread-Topic: Feedback for postponing the 4.17 release to a week later
Thread-Index:
 Adjqh6nb7bpyTo+8QPKuDS/Y5NDKqwAI6YmAAAA21oAAAA9FIADukS/AAAl2iAAAAjY/AAAAV4vw
Date: Wed, 2 Nov 2022 08:43:27 +0000
Message-ID:
 <AS8PR08MB799181931FF2C148FB82C4E292399@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <AS8PR08MB79919CCB4F14F5FDE8929DF092329@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e7c17d83-d9f2-bb9e-24ae-8bc44005deeb@xen.org>
 <b1312717-15c8-f90a-c84f-1bf8709007ee@suse.com>
 <AS8PR08MB7991F1F7CCC8AC6A56F9F0E492329@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <AS8PR08MB7991C642E1CDFA9B2B97E10392399@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <f2a40ec3-1891-90ef-421c-97febd221127@suse.com>
 <af704b53-c161-7b20-e0d8-1ec9e081fc3e@xen.org>
In-Reply-To: <af704b53-c161-7b20-e0d8-1ec9e081fc3e@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 7C5E489CF1127A41BD3260B975BBCD20.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB4PR08MB9336:EE_|VI1EUR03FT027:EE_|AM0PR08MB5458:EE_
X-MS-Office365-Filtering-Correlation-Id: de1e21ea-d697-410f-d0cb-08dabcae584e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hsVXYb0T99yocW0Q1Dy/JU8tpj/fIxjAebZ1/e/NE+v5kESLqDcC2Qcq+vSG2q8X7uK75yiqeYLDqhZzncoYv6pLp4W85JVLxYjxikEbdOUB9VYIpKaGqUqw7l5F+TO+EHJKwIE/5lxpM1lf6m1QM4UoOuPp0cyOs5xz0I8I6uFi62YDwfFJ9PkiVJXQWzQrQiGyst9d0MgXNMKk+xmGaSBG12YchaBVxp7AgxOW5kppwWaZlFXnlHxzNtcibRRgC0I8oipkg2ALZ5FlA9n7IfZNtbk0IDQsoFPLC+/0g63EJw1zu80EaC/sbGd2Y4CFoEz9uCHRqPf4ERr4QEQNONPeYVvKmOrT7aqmFPFK9wtA0zpI8EBMZ8ufFCSR6GtglstKSoIKrVur77ib9Zd5D5y3exI27/YdYs2ITjNyKlSqgT1dnG5oo48J17r81f6cgK4iYVkF+lggwwpQqhLVNgITv6ayLsZ5dZaI4gMWdP4861f6++9bg3I2/2tIqpuqELGNRukNLTPI0sJ2v3jzUcvL6Y143o+1hrgaQUgazVs+6T0Q1jPKoquySLMbQt9XPtaFZ1Pu8W/t6nt1ABW2C+2sOZdWFIj3ipUpXUIRKdPZ/ZO5vrfmSA/m7OkYtS0soSV859ex4wi25tBQOFkG5hM/zEKX3+9BRfNC05S+MP2L31++ynPBZ32klZHLiXMhXLWfvZlmKnHaXFYTAbrh2xyAoi1bLEOUNp6OATdMFn0p/RxWBu2GGHFMj4hifVDtsAl9EmlnW6taxS0BR82mcTQ/JmfJTZwewInt97Sef40=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(451199015)(53546011)(5660300002)(7416002)(38100700002)(26005)(2906002)(52536014)(33656002)(7696005)(86362001)(9686003)(6506007)(966005)(38070700005)(478600001)(54906003)(122000001)(6916009)(71200400001)(55016003)(41300700001)(64756008)(186003)(76116006)(8676002)(66446008)(66556008)(4326008)(66946007)(66476007)(8936002)(83380400001)(316002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9336
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6c3947ba-c866-4013-3985-08dabcae4f9d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tIExFpZueilIW87i0y3VbCdzSNRO+yBurexKrpeaMhs5RrTUO81EYXKbMTSDzWZgU6lNb6aJvXGgxoAMJ5JMaTSixY2rRYQ9ftv3T9K2F6azKFoDGRQFVQzjDrUUv8GIigR3MNh2KT5RWHFMJPTaKchGJkKZ97YLnofdfOzC9U2xsg18U9RN1YVu9Yv76Dqdz6Eqg4M1hRXrEIMQSk0jTWJIA1La1w++Y+AkDTji8oIfiTXGJ6OWSmtVBoj/m43L/ORZEf4k3B2molDwX68+hiy4ANdKn7gL6o5jO8ikDQKazbnnJA0wyAUKczWDqNLCW/b2DRU1Gm52fegRMxofpOo26JQO4K+YjhUfGKFdNZKUS0QZQgXDK0ybF54jLi88ZWlU7WidYzryA7PWVtH+wHGDEHbKqKnPEBMDn5lVqLIDHgGTFxMFBuS2udHlLtuYbRsOreZyHR+Aq9ia0OZdCFycDwh0CzAViCvUiaKbUmJPicWAz1CYHGuE1PT8eAXJiFFI9/YxoHE0Yi7LKll/XpbhhuJrsmIODZOaf2IUdjXL5bV43KVIth+FB9/vMTPUQK1QJjoHR63Y4bMhY+9RjCtsmUB7mgYAZuOBQ1jdPqjCVw3VheR8cflQSaap1sD+oL6SC4quR1znHOX6E5/Gdz5Cla1uoNfTf3T8bIHOKf0ooNEeGDdS2txjmZBj2NIO6pwgTLQbzYLploZ+KUiO/WFF7RzNle1s73wvYhMzn6BeD0gFdsqHAB6MWjeju0syexqwsWsOSCOdtYeY5U4h8AAdYEqxUo6uCgmqp0yeIpCWd+FX5YLXDVyeDFCmAj3J
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(40480700001)(40460700003)(70206006)(55016003)(53546011)(316002)(54906003)(8676002)(7696005)(70586007)(33656002)(4326008)(6506007)(82740400003)(83380400001)(52536014)(81166007)(356005)(36860700001)(41300700001)(6862004)(82310400005)(9686003)(5660300002)(47076005)(8936002)(26005)(86362001)(336012)(186003)(2906002)(966005)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 08:43:41.6988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de1e21ea-d697-410f-d0cb-08dabcae584e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5458

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IFN1YmplY3Q6IFJl
OiBGZWVkYmFjayBmb3IgcG9zdHBvbmluZyB0aGUgNC4xNyByZWxlYXNlIHRvIGEgd2VlayBsYXRl
cg0KPiBPbiAwMi8xMS8yMDIyIDA3OjI3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPiBPbiAwMi4x
MS4yMDIyIDA0OjAwLCBIZW5yeSBXYW5nIHdyb3RlOiA+Pg0KPiA+PiBBbHNvIEkgdGhpbmsgd2Ug
bmVlZCB0byBzdWJtaXQgYSBwYXRjaCB0byBtYWtlIHRoZSBkZWZhdWx0DQo+IENPTkZJR19ERUJV
Rw0KPiA+PiB0byBuIGluIEtjb25maWc/IFRoYW5rcyENCj4gPg0KPiA+IElpcmMgd2hhdCB3YXMg
ZG9uZSBpbiA0LjE2IHdhcyB0byBzd2l0Y2ggdG8gbm9uLWRlYnVnIGltbWVkaWF0ZWx5IGFmdGVy
DQo+ID4gYnJhbmNoaW5nLCBvbiB0aGUgbmV3IGJyYW5jaCBvbmx5LiBUaGF0IHdhcyBzcGVjaWZp
Y2FsbHkgdG8ga2VlcCBkZWJ1Zw0KPiA+IGVuYWJsZWQgYXQgYWxsIHRpbWVzIChhbmQgbm8gdW5k
dWUgY29kZSBjaHVybikgaW4gc3RhZ2luZy4gRGVidWcNCj4gPiBpbnRlcm1lZGlhdGVseSBvZmYg
d2FzIChlYXJsaWVyIG9uKSBvYnNlcnZlZCB0byByZXN1bHQgaW4gaHVnZSBDb3Zlcml0eQ0KPiA+
IHJlcG9ydHMsIGJlY2F1c2Ugb2YgdGhlIHBlcmNlaXZlZCBkaWZmZXJlbmNlcyBpbiB0aGUgcHJl
LXByb2Nlc3NlZCAvDQo+ID4gcHJvZHVjZWQgY29kZS4NCj4gDQo+IFRoYXQncyBjb3JyZWN0LiBJ
IHdpbGwgc2VuZCB0aGUgcGF0Y2ggb25jZSB3ZSBhZ3JlZWQgd2hlbiB0byBicmFuY2guDQoNClRo
YW5rcy4NCg0KPiANCj4gQEhlbnJ5LCBGcm9tIHRoZSBwcmV2aW91cyBkaXNjdXNzaW9uLCBpdCBz
ZWVtcyBsaWtlIHdlIHN0aWxsIGhhdmUgc29tZQ0KPiBibG9ja2VyLiBEbyB3ZSBoYXZlIGFueSB1
cGRhdGUgb24gdGhlbT8NCg0KSSB0aGluayBjdXJyZW50IHJlbGVhc2UgYmxvY2tlciBib2FyZCBb
MV0gaXMgYWNjdXJhdGUuDQoNCkZvciB0aGUgdXBkYXRlLCBJSVVDLCB0aGUgTVNSX1ZJUlRfU1BF
Q19DVFJMIGZpeC11cCBpcyBhbG1vc3QgdGhlcmUsIHdlDQpoYXZlIDIgb3V0IG9mIDMgcGF0Y2hl
cyBhbHJlYWR5IGJlIHJldmlld2VkIChJIHdpbGwgcHJvdmlkZSBteSByZWxlYXNlIGFjayBub3cp
Lg0KT25seSB0aGUgcGF0Y2ggIzIgbmVlZHMgc29tZSByZXZpZXcgZnJvbSB4ODYgbWFpbnRhaW5l
cnMuDQoNCkZvciB0aGUgb3RoZXIgdGlja2V0cywgSSBhbSBub3QgcmVhbGx5IHN1cmUgaWYgdGhl
cmUgaXMgYW55IHVwZGF0ZXMuIEkgd2lsbCByYWlzZQ0KYSB0b3BpYyB0byBkaXNjdXNzIGluIHRo
ZSBjb21tdW5pdHkgY2FsbC4NCg0KWzFdIGh0dHBzOi8vZ2l0bGFiLmNvbS9ncm91cHMveGVuLXBy
b2plY3QvLS9ib2FyZHMvNDcyMzYwNT9taWxlc3RvbmVfdGl0bGU9UmVsZWFzZSUyMDQuMTcmbGFi
ZWxfbmFtZVtdPVByaW9yaXR5JTNBJTNBUkVMRUFTRSUyMEJMT0NLRVINCg0KS2luZCByZWdhcmRz
LA0KSGVucnkNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQoNCg==

