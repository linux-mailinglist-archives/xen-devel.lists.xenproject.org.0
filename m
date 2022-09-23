Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAF45E7160
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 03:28:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410547.653608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obXTW-0000mK-An; Fri, 23 Sep 2022 01:27:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410547.653608; Fri, 23 Sep 2022 01:27:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obXTW-0000jg-7v; Fri, 23 Sep 2022 01:27:30 +0000
Received: by outflank-mailman (input) for mailman id 410547;
 Fri, 23 Sep 2022 01:27:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=stvx=Z2=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1obXTU-0000ja-Sr
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 01:27:29 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140051.outbound.protection.outlook.com [40.107.14.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1c74d81-3ade-11ed-9374-c1cf23e5d27e;
 Fri, 23 Sep 2022 03:27:26 +0200 (CEST)
Received: from FR0P281CA0108.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a8::8) by
 DBBPR08MB6121.eurprd08.prod.outlook.com (2603:10a6:10:204::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.19; Fri, 23 Sep 2022 01:27:20 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a8:cafe::b2) by FR0P281CA0108.outlook.office365.com
 (2603:10a6:d10:a8::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.7 via Frontend
 Transport; Fri, 23 Sep 2022 01:27:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Fri, 23 Sep 2022 01:27:19 +0000
Received: ("Tessian outbound 3c27ae03f5ec:v124");
 Fri, 23 Sep 2022 01:27:18 +0000
Received: from 0e4e8aa097fa.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 423C1DD1-32C3-4483-B0B7-5B77306861D9.1; 
 Fri, 23 Sep 2022 01:27:13 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0e4e8aa097fa.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 23 Sep 2022 01:27:13 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB8475.eurprd08.prod.outlook.com (2603:10a6:150:83::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Fri, 23 Sep
 2022 01:27:11 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a%3]) with mapi id 15.20.5654.018; Fri, 23 Sep 2022
 01:27:11 +0000
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
X-Inumbo-ID: e1c74d81-3ade-11ed-9374-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BssfqdsUVGiUdV1hiJgl57qA4sRAWfRBLlu34cibvWD3Fz/WFUVaUwH8N656K9bdgtzZmNNI2Srdzifrj+XdinS+ylbUtJtLazs9mZNJwHnTaKbbVdZLm9HyIEX8YON8HJGEY888RxzrSEeBhaAjz1rnhXJ4QQvwXoKYk1gEJcBSuWGkwE5uu/fP56zkLdgWixPIolkl8YSFdy+Bp1h8+8+S9v6HH98WxtwM9pNWXgIeX4O1GDoUCfif3hUnbBF58M+DrwmW+7z8ROHcVBpsgiKmQp8/JsvKNSq4r6E7+s7srVUvcl2bB4NBhaxgQq7QTINH7wkT/+92cmAsoXt7Ow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVBCT6sl+qiI7wxRTwf3Npb6ltJvjmU82zh4C/SMI1Y=;
 b=WnG2aL4IpD7OES2eDWqge9uitGomZe28/7L8xflrH+rjR165PcNQ3+oDi0Fhoj6pGXWs6Eoh1pbh8gFeuQKx9SMoQXDSuQHRoQBMzp76NjDKydPwka1eU5JZEIjSbM/7mcb2TAp5wARqgcgn7e8R1tGilkGwLT4mNGsoScayFZFeuzB5YDLEarCLeYq9MogTvzSR2dYq+CxXsC3WbDM90PZeLqMXEdUjqIeYxkDNxeRs6nqUVlXsxoBL80twfF3h2KjE+cXg3Za5GEtAtVBXBh3ignCwbtGyRx0AdcjaGXfkKLYbSia8eKmGzAlpzzjOxo+MqQ6gIeDapXAthZOi7g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVBCT6sl+qiI7wxRTwf3Npb6ltJvjmU82zh4C/SMI1Y=;
 b=5xnsvyBm5WTTPgZ1V/2ejvJLVY4BPNMtcqhW3C5uLWh0oNdQuAjy6DaSBwVbnvcn7d6XgsWbKE70AP59+dRz9Hzrrcjsp/uvfNdbBJ66ko6EjzkxV+4ObNnbpSB8EtJnoXRyq09zTy7TZU+ZquctsqNEOJFU8T4uUN5JWT6H+Lo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lj/wouapa+0AU3vrlxHczgfAr9H5p2xm6GhMWgINYbctO3ac41HY4+BKKQGDdwtdubRr1y4cSDKNKw+AhAHNQud15A0QuR6q9kMkSJpnC6kZhJrr6Vs/VhTceAjzE9+t9muLzEhxGIDPn0acBvV7SMTCBb5yXZSStkRzV5abJ2CRsMyMOikGcH6i6eYjx5uRop+SBoWNs5IJQCuggPnJf3jgYB6DBwRl+lr8MnHob0yzH10vEfPyvr78KS5GWvUR9o8vihyX06MxKDCJ5OVhdNY1HLHkQGT/eNlK65n25N40tQxTvSnkEjcbSAPv5y4srTFIuaWlckjPBRQwXwKZew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVBCT6sl+qiI7wxRTwf3Npb6ltJvjmU82zh4C/SMI1Y=;
 b=KECQjoO7U3SBGexXxrhqmvb41VUwnxqS9JTv3XbXUJnVKJAsL7UNp5WlqXaEUQYxZn/uC4PA5nSOD1o0cO1PXFcXhnBAYhRxVca7Dcx1frF3VuvaewI1JRzTe0arn3Tbrhl7B5fLnMJnkUzjtLAE4ba9IvU3zAz+QJZp16TT7p4sOs0FDJyDU+qNB0knvK6rcV6ZdvyhXI00/wiypkFrWqcVkKOblfKlIA45bUzwaFZxxfobbxtCWLM67PvF0Zwcq4KKlGoZkTLYHQ5bjl0YTUhwQvQK5+K53arNmSffeMk28rCMRHJ4hXcs1cdds6foKTTJt5Z0g5nIWSeVT3bR1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVBCT6sl+qiI7wxRTwf3Npb6ltJvjmU82zh4C/SMI1Y=;
 b=5xnsvyBm5WTTPgZ1V/2ejvJLVY4BPNMtcqhW3C5uLWh0oNdQuAjy6DaSBwVbnvcn7d6XgsWbKE70AP59+dRz9Hzrrcjsp/uvfNdbBJ66ko6EjzkxV+4ObNnbpSB8EtJnoXRyq09zTy7TZU+ZquctsqNEOJFU8T4uUN5JWT6H+Lo=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>
Subject: RE: [PATCH 1/9] automation: Use custom build jobs when extra config
 options are needed
Thread-Topic: [PATCH 1/9] automation: Use custom build jobs when extra config
 options are needed
Thread-Index: AQHYzokNujrks6NSW0iEIqimdlIitq3r+qqAgAA/LlA=
Date: Fri, 23 Sep 2022 01:27:10 +0000
Message-ID:
 <AS8PR08MB79915D04655E4D75413FDA2992519@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220922134058.1410-1-michal.orzel@amd.com>
 <20220922134058.1410-2-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2209221439550.65421@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2209221439550.65421@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: DF59CA58D09105428EC47F7F765E0560.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV1PR08MB8475:EE_|VE1EUR03FT043:EE_|DBBPR08MB6121:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c597e4b-07c4-40fe-dc41-08da9d02c1d9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QCfgOeUvlPKHEyAaTzRskkRbIy8DuVLAGNPKOx8QJR8wxMoS3AChJyKnxak699QvMQEUxiqUaYSDP46brtxkV0z0YSYJQ0Z5fn76wXKvcppwH2yC52cm5VgEv56uTxKBG9o91s1hk+S6m06v84YE8O4lPcH7aTIa7TFEjezGl9CT7Y6zf6T26a2BI4em2fkS3XviaXWOejYZ65djZtat0nhMM3dSR0pLZvGM8U4kgpesyxlPzrpp3fOF4Uw0xNN2HWjaKJehj52VTXvlgLovhp0fl72ef4MzpB02qeDKY87Unh5pKHozc7DGrC97cZNq79r7kv6RKrBPTofwW77ilwPD8r32eExxkSt2MFFRm2una6l5nF/TnnBL238vtJGQUm5++af36FptH7YRpJpEqaZiNx6V5rgoZeWtFCV2yx7Bbbt4rMTJna9Y12K+oAjuzeJHgxfC/oHy+vVmVPwPY5MIT1DYa/uq0WCV/o9ub3jLN0lIxMPkABaMKhd9FEmMwqPHYz77jzbv03G2lCkYd6EIbKy87CfVD/5S+C/inQRudBPYGMthcSYrKc/+YVygjnfN22TyqBL24VsMuT9glUlj+1klNLcEzaduQGd8uU9G+ipqa8nhmAgWx5YKs6+iEF/OvqMboSPCo3AdOOtBqvpNqlPoel9/27rkY7vargtrFvy62xM6K4l9uKu4ufoVBLILrpXoCqyCtlBTvTW6r2Iy9i5HBFIpnfQNZnBEVU9koa7d9tBDLZx6Rumlmoo4WS4pcw3pFLAvc7a9sQpxmA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199015)(52536014)(2906002)(5660300002)(66556008)(66946007)(64756008)(8936002)(4326008)(8676002)(66476007)(66446008)(38100700002)(41300700001)(55016003)(122000001)(86362001)(478600001)(6506007)(26005)(7696005)(9686003)(76116006)(54906003)(38070700005)(110136005)(71200400001)(33656002)(316002)(186003)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8475
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f3b36577-a452-44b3-e218-08da9d02bcd4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gCoclhsgZQmB6DNTFBGk+uc6Tyf1x++GZdZSnqdrfsQdOlemoVr15Vi7/ZPtsxbY2nuI5NvMSZqiC8WJDEfyv4t0vvvL0BEUhuHQjio6aTqNwRWi7AptD72uk27P2GkcsJLFh7pOJ4g24BWaUfnATU74j+F3nuXoj26q1U/+Ggcq3SI15TDdA/ZBfOQAqque9jitJKgPEEJefOGHZC9MJHIKRKpP1ipzyhHBvrz3gNHe1Ffxpj4xe8z0p2zX1m+QzoBNi4N8h+OgwRCYqpaY/W1S/19yDZgPrOPKG9S34Ltr2hEe4zcVBAu3Y7p57tHJ+nhPEVNqPjYdCQm39AGY2JM3AUMXGEr5/9tGDtrP4Lz/9TI0Mxwd0VPxgvHhI+WznvlvK8mYPnrx9jJ+RPzT5+co4CRJHUtaOJJdHkj5jIr+UijFrkomnyWMqpZ4IxovxELnTsCLis1rpNensBEAhtqeCN+ZaK6Zun1q4dYeFY6Gr4Au4qT/x1cfGWk9qS2SeKYok7EjKIXyFTnPArgPVXQjD0ASdsxMBJM5nhO3gv4J6K03P9WWbBl50TK7wFdikgJysZvSX8pAnq42TdiOyBEu2xw7xWSlgInIn6OwaYvynaMsE2nsV1g6McxiO3w2HukeXWRoPF56tf/WpDQYPAjU6IyrzSdxgnQt0IO26aHPaiot9U/nX+Mazmfv60Q4mGpKbemPQY9PYH2HI4X2qDekGkU6SbJpO7TNfV1PbtfWhcG0kADwmX+yVHmJnRc7TqxOGTZqYx1faR52OY3UDQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199015)(46966006)(36840700001)(40470700004)(41300700001)(107886003)(33656002)(478600001)(4326008)(8676002)(7696005)(40480700001)(70206006)(6506007)(55016003)(70586007)(110136005)(316002)(54906003)(82740400003)(36860700001)(81166007)(356005)(40460700003)(186003)(9686003)(83380400001)(336012)(86362001)(26005)(47076005)(82310400005)(8936002)(52536014)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 01:27:19.2899
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c597e4b-07c4-40fe-dc41-08da9d02c1d9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6121

Hi Stefano,

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> Subject: Re: [PATCH 1/9] automation: Use custom build jobs when extra
> config options are needed
>=20
> On Thu, 22 Sep 2022, Michal Orzel wrote:
> > Currently, all the arm64 defconfig build jobs, regardless of the
> > container used, end up building Xen with the extra config options
> > specified in the main build script (e.g. CONFIG_EXPERT,
> > CONFIG_STATIC_MEMORY). Because these options are only needed for
> > specific test jobs, the current behavior of the CI is incorrect
> > as we add the extra options to all the defconfig builds. This means
> > that on arm64 there is not a single job performing proper defconfig bui=
ld.
> >
> > To fix this issue, add custom build jobs each time there is a need for
> > building Xen with additional config options. Introduce EXTRA_XEN_CONFIG
> > variable to be used by these jobs to store the required options. This
> > variable will be then read by the main build script to modify the .conf=
ig
> > file. This will also help users to understand what is needed to run spe=
cific
> > test.
> >
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> > ---
> > This patch could actually be consider to be taken for 4.17 release.
> > The reason why is because currently our CI for arm64 does not even
> > peform clean defconfig build which is quite crucial target to be tested=
.
> > Performing builds always with EXPERT and UNSUPPORTED is not something
> so
> > beneficial for release tests. This is up to the release manager.
>=20
> + Henry
>=20
> I agree this should go in 4.17, so that gitlab-ci can test non-DEBUG
> builds on ARM.

Yes sure, I agree once this series is properly reviewed, this can be
merged to 4.17.

Kind regards,
Henry



