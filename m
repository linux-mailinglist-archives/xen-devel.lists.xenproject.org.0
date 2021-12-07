Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D8046B70C
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 10:29:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240779.417497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muWla-0004d8-A9; Tue, 07 Dec 2021 09:28:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240779.417497; Tue, 07 Dec 2021 09:28:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muWla-0004bJ-65; Tue, 07 Dec 2021 09:28:06 +0000
Received: by outflank-mailman (input) for mailman id 240779;
 Tue, 07 Dec 2021 09:28:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bINN=QY=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1muWlZ-0004bD-86
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 09:28:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9633b73-573f-11ec-a831-37629979565c;
 Tue, 07 Dec 2021 10:28:02 +0100 (CET)
Received: from DB6PR0301CA0057.eurprd03.prod.outlook.com (2603:10a6:4:54::25)
 by AM0PR08MB4499.eurprd08.prod.outlook.com (2603:10a6:208:140::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Tue, 7 Dec
 2021 09:27:59 +0000
Received: from DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::d7) by DB6PR0301CA0057.outlook.office365.com
 (2603:10a6:4:54::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Tue, 7 Dec 2021 09:27:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT050.mail.protection.outlook.com (10.152.21.128) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Tue, 7 Dec 2021 09:27:59 +0000
Received: ("Tessian outbound 157533e214a9:v110");
 Tue, 07 Dec 2021 09:27:59 +0000
Received: from c94bde85efa0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FD41731F-8EF4-4CDC-AF5C-716D632C5386.1; 
 Tue, 07 Dec 2021 09:27:48 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c94bde85efa0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 Dec 2021 09:27:48 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PA4PR08MB6064.eurprd08.prod.outlook.com (2603:10a6:102:e2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Tue, 7 Dec
 2021 09:27:45 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::b9c9:c5dc:15e:b622]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::b9c9:c5dc:15e:b622%5]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 09:27:45 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LNXP265CA0015.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Tue, 7 Dec 2021 09:27:44 +0000
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
X-Inumbo-ID: f9633b73-573f-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DS1JBIXpsevkQ65vXMD/Vgu/Q9G+eJmamkv58oh7SEI=;
 b=cu9PjtSSfqUC7iAq5/gKEEHBXS7A1ATvV0lMAGhIHR4CYk1Kl6U8RP5juZ5ahIwfqKkXaSVK8o3eZAs00Mwn5mM0x8eDn+INDI9qZPbBk+Qv5WQdhHUMnmLqcewa2x0Wo+wtCxxEhgmPbaqRv3eP5S1sxWMAso3TvO4eLBd3z94=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 268b296fae4d5ea4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y8BDS7/Weg2hlqgox48g+KC8FjUwnfPmedrYlyotwHqjafuFCu187zDlA6BHAIsW3bHTCGHyf85AC5gTND0h6cYiQKtjoicPxX/NNFniu03eOcDZz5de+6nqxEbODZjOPUj0Hy7INwKx6JKZZBz8lMZQ/f0QzaKFXA89uYONViW9Jd7Hy61jl4M134ZIwP3wkw2pxHwKnuAAfpbEF6tFOgS/GRbUaz8BSn0wnvy4V5Mwua2MWU+S+A0Y1FBGT3QOTlMRz4FOY7vU2T1YyeBkLeOLsbkkktxavPGs+RSg4S4f/LdVWG4UfQI9OcowxJ3kIHr7tUiDZX2B1PCbMD3ppw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DS1JBIXpsevkQ65vXMD/Vgu/Q9G+eJmamkv58oh7SEI=;
 b=BuyzWErVgGqQTwnz5B23MbKzn4DP97oRVVimISjzTH4IE122If3Dm+EcqRH/swfRdzanYkpRnJurMY6ma9X1ORfZv/D+23IQcUkm1MJ1FSCTdlr3ULkA/3aQtSSQIqn79C+K152SE3hsrRkBc61WvvnOBInWMQngo/27yMqYqTu/XP9oSkLcJyQRAu6q9vO7+/AVRuCb0oSjevyw2OcjaAiAfdbAxdjV6PuWy2/zcllJJh6ENNq9In598AM+Cm62rcEa6GB1lLoRwWLjLFhJpSsCXsdMtAPpo3kkSpgtSOTz1QjQG2fzONw+nXueveiAJuUU8RysJWWofY4EKpn1IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DS1JBIXpsevkQ65vXMD/Vgu/Q9G+eJmamkv58oh7SEI=;
 b=cu9PjtSSfqUC7iAq5/gKEEHBXS7A1ATvV0lMAGhIHR4CYk1Kl6U8RP5juZ5ahIwfqKkXaSVK8o3eZAs00Mwn5mM0x8eDn+INDI9qZPbBk+Qv5WQdhHUMnmLqcewa2x0Wo+wtCxxEhgmPbaqRv3eP5S1sxWMAso3TvO4eLBd3z94=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [RFC PATCH 0/2] Boot time cpupools
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <59e14393-a1fc-5b82-2f6e-5567f218cb3a@suse.com>
Date: Tue, 7 Dec 2021 09:27:43 +0000
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <662C34A2-CCCE-49CC-BA5B-8CC5E24E5DF3@arm.com>
References: <20211117095711.26596-1-luca.fancellu@arm.com>
 <26c01edc-46a9-47eb-0c9d-986b92e02158@xen.org>
 <B20FC780-3E2D-4B4A-BF1D-CF34763D237E@arm.com>
 <d42781c4-b01b-9064-4c90-ff99d960958b@xen.org>
 <1941B2BF-6451-4665-8591-DB14739121A9@arm.com>
 <f744c406-9801-a001-fb8e-90680cebb0c9@xen.org>
 <alpine.DEB.2.22.394.2111171724330.1412361@ubuntu-linux-20-04-desktop>
 <59e14393-a1fc-5b82-2f6e-5567f218cb3a@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LNXP265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::27) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 7cf176aa-83ae-4c0f-c754-08d9b963dc32
X-MS-TrafficTypeDiagnostic:
	PA4PR08MB6064:EE_|DB5EUR03FT050:EE_|AM0PR08MB4499:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB4499CC5D3DB6065257B6F896E46E9@AM0PR08MB4499.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Ujms3BnoEnS3my+0jUwxF130ofLPC0QE1eQ5X/PF/G36LPqU2RUTLX8s86guPeoKPxwTJlPM1Q+d/C8XT/xnEYmwWX++XHWHAyqbyOHioikrvo3+MXLUUKyJgDmTID49OkWcSLpgZ3/qjwTRjsfm78BGBa7QgOrTHSegpbc7/NngfE2qkAe96NFRFGWbGXr1PgkQRQMRYnbAcL0pSThwOypUlue2aXs0sraRbL+jQ4ImzXPiuPrVu3KGkqAiiijKI1C4nqHKX5yw3C4g/AiVpwPx56DCw2JvRb22dgqUlGJUGaIHSkoFf6zib1FHjUFXlA56kEVe1N6SaBfuLguRdVYlrZNxaXnmXJoWRGHZl8rN6kCh6cAMe4XLSLwxy+RFXDkwogG4wqmsJj4bNcs+qAW4luf6rGRFaK2x2ICbMZtbYsZsPHOnsrpUa/P31ZhJb0JmJUrTO0vNcNJYtXWZ68ZU7+rf8/dSvgGShVHvNsLAvbWfzySu1AQ+ymFXcfKv5zC+Rsuw8+LJt4zCbQr8ED+XgSR2JSytVOsLDqgHcceAx2CYEwGSnn7acJ4qjmpMYPSqBzrJ88pClg17nBtm03n3rH3NaToFPzY9KaUPZ37J+19/TE5qyZhfJLh9QCQ5y6/2jHrvywL0S+pJYCSqDN0FnHajbQhPhZaIPgMD9TgXpn2yOrKqNRLELc3ujxHAoOxEUCCNFAapwF33xdC4qoMFmwH4C8i3YB7lKEf6uVg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(6486002)(4326008)(5660300002)(86362001)(8936002)(44832011)(8676002)(6506007)(52116002)(2616005)(110136005)(956004)(33656002)(2906002)(316002)(26005)(6512007)(66946007)(66476007)(36756003)(66556008)(38100700002)(54906003)(38350700002)(508600001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6064
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2de9d51a-f516-453e-279b-08d9b963d382
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kAQmgTDwua9HP+MO/M3PgXFpnynCl8GEBwnrvO9l9VA7RVt+wr3C/BbYeWJBX3NXf58iDOWJ4RZzYb6XMpkxiOyGkcMK0RHI7cieVpk+loGqjPmrDCFF8v4NZ8FcAihq1qfqeDaJKfbv5JDKEImuUp9QhEnNGzloJV4XHhz6OPgV0bcQdD2frE+scWQDtd3BgYf/dpcecUkWh9m/Ms03hcIFQrxbIIdwA/YDaf0NkX7Hu2+6GwZPEMARqfDqpF3NDUqJr9o7765hAO8bwBaZNALn4IDmuaCZNEfAyEAMMEurqi5RyiiFXKUhdfAnOEbXA8iulLMBeVCAudAoZvZDiOVfAcRVc9STD50t5zlgDObCSsUBdtST85wx3TkeCFYbu52UFiRUIKR/x4LAzpeWZwAdJsDGAHzfRuYnGGdyBEFLs+lkE+GHrMQeDDKFge8+dF9zJQx9sv7v3uBu3HX/9OK+y0TAcbQbjjeWTViuv+m37KPfHjKXLhOAk29HvGzUJu/qyLgwJ5SLw1XLZoxcNy+RDi/9329c1rv+JusX/vPmkgUAn8Ez53s4Jftz+87hOBO8Xg4wJGqelYCX4s+ZKbjZ2nxFUdNcSAZ7chgoW9kHDazThen6Q4gRgbTVJEQsFpmvkw1igvVD8XajdGWYScrFXyOEQnk7S+Av/PACks19RhdrCsNBwFYde8ks4FXhOreXsSSBLo5LhPzI+QJNtg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(33656002)(4326008)(86362001)(6512007)(36860700001)(44832011)(70206006)(70586007)(2616005)(107886003)(956004)(54906003)(336012)(316002)(8936002)(110136005)(6506007)(186003)(356005)(5660300002)(6486002)(81166007)(508600001)(82310400004)(8676002)(2906002)(36756003)(47076005)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 09:27:59.6852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf176aa-83ae-4c0f-c754-08d9b963dc32
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4499

Hi all,

Thank you for all your feedbacks, sorry for the late response. Given the am=
ount of suggestions I=E2=80=99ve been working
on a proposal for the boot time cpupools that I hope could be good for ever=
yone.

The feature will be enabled by CONFIG_BOOT_TIME_CPUPOOLS, so without it eve=
rything is behaving as now.

When the feature is enabled, the code will check the device tree and use in=
formations from there to create the cpupools:

a72_1: cpu@0 {
        compatible =3D "arm,cortex-a72";
        reg =3D <0x0 0x0>;
        device_type =3D "cpu";
        [...]
};

a72_2: cpu@1 {
        compatible =3D "arm,cortex-a72";
        reg =3D <0x0 0x1>;
        device_type =3D "cpu";
        [...]
};

cpu@2 {
        compatible =3D "arm,cortex-a72";
        reg =3D <0x0 0x2>;
        device_type =3D "cpu";
        [...]
};

a53_1: cpu@100 {
        compatible =3D "arm,cortex-a53";
        reg =3D <0x0 0x100>;
        device_type =3D "cpu";
        [...]
};

a53_2: cpu@101 {
        compatible =3D "arm,cortex-a53";
        reg =3D <0x0 0x101>;
        device_type =3D "cpu";
        [...]
};

chosen {

    cpupool_a {
        compatible =3D "xen,cpupool";
        xen,cpupool-id =3D <0>;
        xen,cpupool-cpus =3D <&a72_1 &a72_2>;    =20
    };
    cpupool_b {
        compatible =3D "xen,cpupool";
        xen,cpupool-id =3D <1>;
        xen,cpupool-cpus =3D <&a53_1 &a53_2>;
        xen,cpupool-sched =3D "credit2";
    };
   =20
   [=E2=80=A6]

};

So for every node under chosen with the compatible =E2=80=9Cxen,cpupool=E2=
=80=9D, a cpupool is created (if it doesn=E2=80=99t exists).

Mandatory properties of that node are:=20
 - =E2=80=9Cxen,cpupool-id=E2=80=9D which identifies the id of the pool
 - =E2=80=9Cxen,cpupool-cpus=E2=80=9D which lists the handle of the cpus

Optional property is =E2=80=9Cxen,cpupool-sched=E2=80=9D which is a string =
that identifies the scheduler. A cpupool with identifier
0 (zero) can=E2=80=99t have that property, it will get the default schedule=
r from Xen.

A set of rules are applied:

  1) The cpupool with id 0 is always created, being it listed or not in the=
 DT
  2) The cpupool with id 0 must have at least one cpu, if it doesn=E2=80=99=
t the system will panic.
  3) Every cpu that is not assigned to any cpupool will be automatically as=
signed to the cpupool with id 0=20
      (only cpu that are brought up by Xen)
  4) When a cpu is assigned to a cpupool in the DT, but the cpu is not up, =
the system will panic.

So, given this explanation, the above example will create a system with two=
 cpupool:

 - cpupool with id 0 containing 3 cpu a72 (two are explicitly listed, one w=
as not assigned to any other cpupool)
 - cpupool with id 1 containing 2 cpu a53 (cpus explicitly listed)

Clearly the above example works only if Xen is started using the hmp-unsafe=
=3D1 parameter, otherwise some cpus
won=E2=80=99t be started.


Given the above example, we might be able to have an option like this (=E2=
=80=9Cxen,domain-cpupool-id=E2=80=9D) to assign
dom0less guests to cpupools:

chosen {

    cpupool_a {
        compatible =3D "xen,cpupool";
        xen,cpupool-id =3D <0>;
        xen,cpupool-cpus =3D <&a72_1 &a72_2>;    =20
    };
    cpupool_b {
        compatible =3D "xen,cpupool";
        xen,cpupool-id =3D <1>;
        xen,cpupool-cpus =3D <&a53_1 &a53_2>;
        xen,cpupool-sched =3D "credit2";
    };
   =20
    domU1 {
        #size-cells =3D <0x1>;
        #address-cells =3D <0x1>;
        compatible =3D "xen,domain";
        cpus =3D <0x1>;
        memory =3D <0x0 0xc0000>;
        xen,domain-cpupool-id =3D <1>;            /* Optional */
        vpl011;

        module@0 {
            compatible =3D "multiboot,kernel", "multiboot,module";
            [=E2=80=A6]
        };
    };

};


Any thoughts on this?

Cheers,
Luca



