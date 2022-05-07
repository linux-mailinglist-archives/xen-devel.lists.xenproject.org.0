Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0870A51E4AB
	for <lists+xen-devel@lfdr.de>; Sat,  7 May 2022 08:44:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323601.545340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnEAI-0004jd-P2; Sat, 07 May 2022 06:43:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323601.545340; Sat, 07 May 2022 06:43:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnEAI-0004gV-L8; Sat, 07 May 2022 06:43:42 +0000
Received: by outflank-mailman (input) for mailman id 323601;
 Sat, 07 May 2022 06:43:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJZu=VP=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nnEAG-0004gP-2g
 for xen-devel@lists.xenproject.org; Sat, 07 May 2022 06:43:40 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0522b857-cdd1-11ec-8fc4-03012f2f19d4;
 Sat, 07 May 2022 08:43:36 +0200 (CEST)
Received: from AS8PR04CA0012.eurprd04.prod.outlook.com (2603:10a6:20b:310::17)
 by VI1PR08MB4207.eurprd08.prod.outlook.com (2603:10a6:803:ed::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Sat, 7 May
 2022 06:43:32 +0000
Received: from VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::50) by AS8PR04CA0012.outlook.office365.com
 (2603:10a6:20b:310::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21 via Frontend
 Transport; Sat, 7 May 2022 06:43:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT022.mail.protection.outlook.com (10.152.18.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Sat, 7 May 2022 06:43:31 +0000
Received: ("Tessian outbound 78191104f1b7:v118");
 Sat, 07 May 2022 06:43:31 +0000
Received: from 0158c3fa1218.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B14774C5-6F5D-42C0-A8D6-96582F17B614.1; 
 Sat, 07 May 2022 06:43:20 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0158c3fa1218.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 07 May 2022 06:43:20 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AM9PR08MB7071.eurprd08.prod.outlook.com (2603:10a6:20b:415::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Sat, 7 May
 2022 06:43:18 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9%3]) with mapi id 15.20.5206.024; Sat, 7 May 2022
 06:43:18 +0000
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
X-Inumbo-ID: 0522b857-cdd1-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=KtBIBoPTFLOdCeKXpGMrNhN4uf+jGeH45NtKrSplykV2dAyngvP9CYpxFhHUmg/jgStPibUi5DPV/eaEs2k0CtTUjqbjEqKnv0yC2W/uZLt40qErbbGXqiXawNgLGjOc2azOQvp/f46qX2Sev0KEceTV/9l9VMW5feoykrSG8roBaUKV4QEQjtx8J4GEgjNCvrHv3q0dKocRnESjNJZITyi3A8nJqmWGUsKArW0HXVb2hWM2T1dNuC9jaelstg5khgSUWyiESNIwKq0qI1TkF9l49IU4ErnMIu/6jDVLjRLktcpdrn7qvVaWoYyIQVYH2upYbAKPL/VNPjHOMODc/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yEiiX07JvvGPBAErHzJhNAJamY4VBqiqKSdmZWhzzOo=;
 b=YVuJ4myuZCvu/9sd3/sG7o1OjoyYkER0zdQi8FW2EyRO00hvrsuo2L/eVYG4gMIkT5Cup4U3Jucx7cAL1hohSflbj+kCca64020mpGcf0ut1+eNtlPyT00OmeDk5KzA4eicxZoeRJ6kBn43qDVASPqJGqOJI/YbYIBkPv+dFf5xUPaxEiwJoIKN5D0vFgX9kU9aX+ilYeYHYqKBYY6GyCBrX+oN56mTco+qLHfoQnlZ6B1wln+Bd13QjsBUF9gk08sdemkxpu5QU+sNsm4txwn8e56QbE2+04ILHZSbUGnD5GdXNtdzpQ8qTY3t8TfEUgfxsOgGPu4dOJu3350pgSw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yEiiX07JvvGPBAErHzJhNAJamY4VBqiqKSdmZWhzzOo=;
 b=sZY7Ilwd3fXNI2mS4AqwGsV9X826OUK8nHUnpH4GPCOyFjZehjJOQ3PGrjJDOuZ43xMW8Y3SYlrcPrEID3EIB/Fwy+dFYrYTR4sAty4+NbW/RcRhNpF7h2IxdOzUR/vVAlknF2P15oQLDpKdEa409/2C6shMxPat/1JWNGv0FzE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 50d55c62ad8f6493
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KkO4E+h0z8ZzKIrp3hOUF2MVb9+NQC+lW65uWeYfUl2QXBLByCx0MJO5PlRrt6/v8vyVCLQ/xdBeNmpwmk+PtMBwd95z7mEeXBStlurgJKGtnIa+V0URlYsGaKF6Cnli9habJfwMNN8xod2N4EBFDVF5SLBhctzXHc2gwMMSDNSGCqe8EzXXud632R06ULfdqOXegB9dyqyseQt/XtoWY9qEpU6GxPng3jZsOowVG1XKGBd+ny4G3pRV7RtDcEqPI4w8EJXJS3qoUdIKc0ZyQC7Vlfho8+yefRyhtB2KJ5Fgyidp7sA9NCyDZp8obRLbke7H76KOlfe6vs5R6uUmnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yEiiX07JvvGPBAErHzJhNAJamY4VBqiqKSdmZWhzzOo=;
 b=OAtbJQaMMa5JHTH5EVBaPv/gcmHGROlQdUerXhbh5ZGiMdkHGoNdBMlKZPyZmaquRPKMyN0TayopsYyRScMUmUwc1i6PZKtapWAVO9D/EGW01+wRs+BhESPKZsQGpTkpbhqWHjmZf8Rwq8NFi/lK0Tb3tBUjZM4SdttM7wye5k+3u2lZiVPEbedwEZm2u8qBOTt/ghTQmvUHZYfNLyaBB6Fvh+UiBjUywW7FqHYUXLBcMTuVB3B6KyemecTXASlJolVvkUzssk15KMnGmysiPFVdI49wfc8wrHfy74OWkoVItsKxqtTR5VPKqqx/NMUbMWjFfb8O+YqbTo975lQS9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yEiiX07JvvGPBAErHzJhNAJamY4VBqiqKSdmZWhzzOo=;
 b=sZY7Ilwd3fXNI2mS4AqwGsV9X826OUK8nHUnpH4GPCOyFjZehjJOQ3PGrjJDOuZ43xMW8Y3SYlrcPrEID3EIB/Fwy+dFYrYTR4sAty4+NbW/RcRhNpF7h2IxdOzUR/vVAlknF2P15oQLDpKdEa409/2C6shMxPat/1JWNGv0FzE=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Chen <Wei.Chen@arm.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 1/9] xen/arm: introduce static shared memory
Thread-Topic: [PATCH v2 1/9] xen/arm: introduce static shared memory
Thread-Index: AQHYYRqKvHG5G59kK0mtK53ka20rwa0Sm7eAgABc2oA=
Date: Sat, 7 May 2022 06:43:18 +0000
Message-ID:
 <DU2PR08MB7325298C1CD5B6EFEB042265F7C49@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220506072502.2177828-1-Penny.Zheng@arm.com>
 <20220506072502.2177828-2-Penny.Zheng@arm.com>
 <alpine.DEB.2.22.394.2205061744400.43560@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2205061744400.43560@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 85DE39E766A24C4B99039503DCD7AA5F.0
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: dfdcfa57-5247-4ee7-74db-08da2ff4e6e6
x-ms-traffictypediagnostic:
	AM9PR08MB7071:EE_|VE1EUR03FT022:EE_|VI1PR08MB4207:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB420706A273E6B376F0D13BEDF7C49@VI1PR08MB4207.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NXIj/gXDCnFJ9jFd9hd3yDDWiYTRVgdrZbONPSqJQOxDkPNNQrgpR5vavr938BwLYrKMGuA7nX5ui9AffvfaZ0Gtr9sSILClbQy7gwXwyFnHSAVpi0NjebcX7bz3PjjRgX9RAq+jJacx1Bw7TiMFKBGa0v69AIpQ395PZD/+H6fCBfHC+aK9Nh2dFnGZFnIP/M7nH+8uiEJcNJpnrd7Kb9VlunScQrmkzctNUzBtMBXuD9ZERQjh+c/TAj6fVjpNg9YzkzIxN3RMHMQaBtnhcbPHhJaGrKXLGlDxCixKyRkzXTTliFmNw2z2RQpdRI2GA0sKmjxTOTd5DecLbHcHA1zanPWlqVyHJXK9rHwNRZuDHggOCJPzaH4tUrAUE79GjVg6hRur46IFJ1Yf7lFcQZm4Bz19DpHJdmARhKnysU5Q4jLTp0qHZ8TPz14XuhzEZbe5GbjgQxknXt8fKI5UvlhPD5LQ1EXQbKxWbiIw06KsKCF1vt5p/d8HKLClKSFnH9W+gt6mOhIeWLVWEH1AuAyrbJn/uUzIGE0YAiDJidsdVNybTCAj3UZ80tHje33EvZGf0sJzDSZ2C7b0HWxw3fkAeefV9sSnIYU+zhVM1fJjSdTfqjGVjDJdegLfOGANSigwhgGabjY3IoC9D7L/mkRc71OWprwknScIPczus+mtJm9p0G5HNp+dpJDIjHOW4DK3coWnLGlOhWrdxzyAQv7SbxJy5OKyZ3Tl+FvWGKS4W4gO8UM3oWfJd/MEEIeB
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(33656002)(122000001)(71200400001)(4326008)(9686003)(38100700002)(8676002)(55016003)(38070700005)(26005)(7696005)(66476007)(53546011)(508600001)(66946007)(5660300002)(66446008)(6916009)(52536014)(54906003)(76116006)(316002)(64756008)(8936002)(186003)(83380400001)(86362001)(2906002)(30864003)(66556008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7071
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fef89b69-b8f3-41ce-4d83-08da2ff4deb6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T/csahFeg7hIciyhOFG7ZYXnVMqljv7kOpGvabZIu0cwZSH8MgmF+sWzWEuktrX1RS78N05weQw5qEgSP6TSyv76bu+Za7IySPnZf8n9ytgbZtSDXbv8hBSaRz1wRLvuHZt4LjGybtaCQqi2G3ajf5M6sPusM0GWew1qL9UduNHv1wu3yIf1ksYTZrgKO2gkJXgF8YaohA8MiWAF/qMqq2tMYXq+7WA0COua49EF7k8W5W02deNDkIwyf04qRMUad5snyQCRhT2/qi+1ZTV0xoI9abt+xvZFF8DgEz01HiPExvN+eDPdRLX2wpkz7kdqXcWoJ9sHJsblH/tuOFvlu0eD2pjX6kyYclZ9b3rXWe9HjOAHEmQ9tcS+tMDGYiba2D1ExsrZIDKNRy4v1/0UOSCzUkeYUOhEO2gWzE007U3lwgx6HNUVBAVqFb/2DDuX6OHd62PX2r1xdibUvRC4jr0A0SAkFZLSgXPC/YNV7SBX3KprSZz6kQFCnJy5UiK4jJg0K/k2V47pYnkRpbgVkKB690CcqGafa8aZQ10shLIhbV/580nogAjjungnmISLLMdpsaUSZ9OL107dHFduEntqYbMXGLcbQUKQvg1+g0EhyATUxCfax3xybgxhNpwICd/83GRYWCXAxexEAWvylNJbgwF2otKYVazcZcx5SD1EowvFuFwGkbJ/FZLuqnpe
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(9686003)(26005)(7696005)(336012)(53546011)(6506007)(186003)(83380400001)(107886003)(47076005)(508600001)(86362001)(70206006)(70586007)(4326008)(6862004)(8676002)(54906003)(82310400005)(40460700003)(36860700001)(316002)(55016003)(33656002)(356005)(5660300002)(30864003)(81166007)(2906002)(8936002)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2022 06:43:31.7387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfdcfa57-5247-4ee7-74db-08da2ff4e6e6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4207

Hi Stefano

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> Sent: Saturday, May 7, 2022 9:08 AM
> To: Penny Zheng <Penny.Zheng@arm.com>
> Cc: xen-devel@lists.xenproject.org; Wei Chen <Wei.Chen@arm.com>; Stefano
> Stabellini <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; Bertr=
and
> Marquis <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
> <Volodymyr_Babchuk@epam.com>
> Subject: Re: [PATCH v2 1/9] xen/arm: introduce static shared memory
>=20
> On Fri, 6 May 2022, Penny Zheng wrote:
> > From: Penny Zheng <penny.zheng@arm.com>
> >
> > This patch serie introduces a new feature: setting up static shared
> > memory on a dom0less system, through device tree configuration.
> >
> > This commit parses shared memory node at boot-time, and reserve it in
> > bootinfo.reserved_mem to avoid other use.
> >
> > This commits proposes a new Kconfig CONFIG_STATIC_SHM to wrap
> > static-shm-related codes, and this option depends on static memory(
> > CONFIG_STATIC_MEMORY). That's because that later we want to reuse a
> > few helpers, guarded with CONFIG_STATIC_MEMORY, like
> > acquire_staticmem_pages, etc, on static shared memory.
> >
> > Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>=20
> Thanks Penny, this version of the series is already so much better than v=
1! I
> have only few minor comments left on the series. One NIT at the bottom of
> this file.
>
>=20
> > ---
> > v2 change:
> > - document refinement
> > - remove bitmap and use the iteration to check
> > - add a new field nr_shm_domain to keep the number of shared domain
> > ---
> >  docs/misc/arm/device-tree/booting.txt | 120
> ++++++++++++++++++++++++++
> >  xen/arch/arm/Kconfig                  |   6 ++
> >  xen/arch/arm/bootfdt.c                |  68 +++++++++++++++
> >  xen/arch/arm/include/asm/setup.h      |   3 +
> >  4 files changed, 197 insertions(+)
> >
> > diff --git a/docs/misc/arm/device-tree/booting.txt
> > b/docs/misc/arm/device-tree/booting.txt
> > index a94125394e..e63ce171fc 100644
> > --- a/docs/misc/arm/device-tree/booting.txt
> > +++ b/docs/misc/arm/device-tree/booting.txt
> > @@ -355,3 +355,123 @@ device-tree:
> >
> >  This will reserve a 512MB region starting at the host physical
> > address
> >  0x30000000 to be exclusively used by DomU1.
> > +
> > +Static Shared Memory
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The static shared memory device tree nodes allow users to statically
> > +set up shared memory on dom0less system, enabling domains to do
> > +shm-based communication.
> > +
> > +- compatible
> > +
> > +    "xen,domain-shared-memory-v1"
> > +
> > +- xen,shm-id
> > +
> > +    An u8 value represents the unique identifier of the shared memory =
region.
> > +    The maximum identifier shall be "xen,shm-id =3D <0xff>".
> > +
> > +- xen,shared-mem
> > +
> > +    An array takes a physical address, which is the base address of th=
e
> > +    shared memory region in host physical address space, a size, and a=
 guest
> > +    physical address, as the target address of the mapping. The number=
 of
> cells
> > +    for the host address (and size) is the same as the guest pseudo-ph=
ysical
> > +    address and they are inherited from the parent node.
> > +
> > +- role (Optional)
> > +
> > +    A string property specifying the ownership of a shared memory regi=
on,
> > +    the value must be one of the following: "owner", or "borrower"
> > +    A shared memory region could be explicitly backed by one domain, w=
hich
> is
> > +    called "owner domain", and all the other domains who are also shar=
ing
> > +    this region are called "borrower domain".
> > +    If not specified, the default value is "borrower" and owner is
> > +    "dom_shared", a system domain.
> > +
> > +As an example:
> > +
> > +chosen {
> > +    #address-cells =3D <0x1>;
> > +    #size-cells =3D <0x1>;
> > +    xen,xen-bootargs =3D "console=3Ddtuart dtuart=3Dserial0 bootscrub=
=3D0";
> > +
> > +    ......
> > +
> > +    /* this is for Dom0 */
> > +    dom0-shared-mem@10000000 {
> > +        compatible =3D "xen,domain-shared-memory-v1";
> > +        role =3D "owner";
> > +        xen,shm-id =3D <0x0>;
> > +        xen,shared-mem =3D <0x10000000 0x10000000 0x10000000>;
> > +    }
> > +
> > +    domU1 {
> > +        compatible =3D "xen,domain";
> > +        #address-cells =3D <0x1>;
> > +        #size-cells =3D <0x1>;
> > +        memory =3D <0 131072>;
> > +        cpus =3D <2>;
> > +        vpl011;
> > +
> > +        /*
> > +         * shared memory region identified as 0x0(xen,shm-id =3D <0x0>=
)
> > +         * is shared between Dom0 and DomU1.
> > +         */
> > +        domU1-shared-mem@10000000 {
> > +            compatible =3D "xen,domain-shared-memory-v1";
> > +            role =3D "borrower";
> > +            xen,shm-id =3D <0x0>;
> > +            xen,shared-mem =3D <0x10000000 0x10000000 0x50000000>;
> > +        }
> > +
> > +        /*
> > +         * shared memory region identified as 0x1(xen,shm-id =3D <0x1>=
)
> > +         * is shared between DomU1 and DomU2.
> > +         */
> > +        domU1-shared-mem@50000000 {
> > +            compatible =3D "xen,domain-shared-memory-v1";
> > +            xen,shm-id =3D <0x1>;
> > +            xen,shared-mem =3D <0x50000000 0x20000000 0x60000000>;
> > +        }
> > +
> > +        ......
> > +
> > +    };
> > +
> > +    domU2 {
> > +        compatible =3D "xen,domain";
> > +        #address-cells =3D <0x1>;
> > +        #size-cells =3D <0x1>;
> > +        memory =3D <0 65536>;
> > +        cpus =3D <1>;
> > +
> > +        /*
> > +         * shared memory region identified as 0x1(xen,shm-id =3D <0x1>=
)
> > +         * is shared between domU1 and domU2.
> > +         */
> > +        domU2-shared-mem@50000000 {
> > +            compatible =3D "xen,domain-shared-memory-v1";
> > +            xen,shm-id =3D <0x1>;
> > +            xen,shared-mem =3D <0x50000000 0x20000000 0x70000000>;
> > +        }
> > +
> > +        ......
> > +    };
> > +};
> > +
> > +This is an example with two static shared memory regions.
> > +
> > +For the static shared memory region identified as 0x0, host physical
> > +address starting at 0x10000000 of 256MB will be reserved to be shared
> > +between
> > +Dom0 and DomU1. It will get mapped at 0x10000000 in Dom0 guest
> > +physical address space, and at 0x50000000 in DomU1 guest physical
> > +address space. Dom0 is explicitly defined as the owner domain, and Dom=
U1
> is the borrower domain.
> > +
> > +For the static shared memory region identified as 0x1, host physical
> > +address starting at 0x50000000 of 512MB will be reserved to be shared
> > +between
> > +DomU1 and DomU2. It will get mapped at 0x60000000 in DomU1 guest
> > +physical address space, and at 0x70000000 in DomU2 guest physical
> > +address space. DomU1 and DomU2 are both the borrower domain, the
> > +owner domain is the default owner domain dom_shared.
> > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig index
> > ecfa6822e4..5ee9921f56 100644
> > --- a/xen/arch/arm/Kconfig
> > +++ b/xen/arch/arm/Kconfig
> > @@ -106,6 +106,12 @@ config TEE
> >
> >  source "arch/arm/tee/Kconfig"
> >
> > +config STATIC_SHM
> > +	bool "Statically shared memory on a dom0less system" if
> UNSUPPORTED
> > +	depends on STATIC_MEMORY
> > +	help
> > +	  This option enables statically shared memory on a dom0less system.
> > +
> >  endmenu
> >
> >  menu "ARM errata workaround via the alternative framework"
> > diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c index
> > e318ef9603..9bd08776a7 100644
> > --- a/xen/arch/arm/bootfdt.c
> > +++ b/xen/arch/arm/bootfdt.c
> > @@ -363,6 +363,70 @@ static int __init process_domain_node(const void
> *fdt, int node,
> >                                     size_cells,
> > &bootinfo.reserved_mem, true);  }
> >
> > +#ifdef CONFIG_STATIC_SHM
> > +static int __init process_shm_node(const void *fdt, int node,
> > +                                   u32 address_cells, u32 size_cells)
> > +{
> > +    const struct fdt_property *prop;
> > +    const __be32 *cell;
> > +    paddr_t paddr, size;
> > +    struct meminfo *mem =3D &bootinfo.reserved_mem;
> > +    unsigned long i;
> > +
> > +    if ( address_cells < 1 || size_cells < 1 )
> > +    {
> > +        printk("fdt: invalid #address-cells or #size-cells for static =
shared memory
> node.\n");
> > +        return -EINVAL;
> > +    }
> > +
> > +    prop =3D fdt_get_property(fdt, node, "xen,shared-mem", NULL);
> > +    if ( !prop )
> > +        return -ENOENT;
> > +
> > +    /*
> > +     * xen,shared-mem =3D <paddr, size, gaddr>;
> > +     * Memory region starting from physical address #paddr of #size sh=
all
> > +     * be mapped to guest physical address #gaddr as static shared mem=
ory
> > +     * region.
> > +     */
> > +    cell =3D (const __be32 *)prop->data;
> > +    device_tree_get_reg(&cell, address_cells, size_cells, &paddr, &siz=
e);
> > +    for ( i =3D 0; i < mem->nr_banks; i++ )
> > +    {
> > +        /*
> > +         * A static shared memory region could be shared between multi=
ple
> > +         * domains.
> > +         */
> > +        if ( paddr =3D=3D mem->bank[i].start && size =3D=3D mem->bank[=
i].size )
> > +            break;
> > +    }
> > +
> > +    if ( i =3D=3D mem->nr_banks )
> > +    {
> > +        if ( i < NR_MEM_BANKS )
> > +        {
> > +            /* Static shared memory shall be reserved from any other u=
se. */
> > +            mem->bank[mem->nr_banks].start =3D paddr;
> > +            mem->bank[mem->nr_banks].size =3D size;
> > +            mem->bank[mem->nr_banks].xen_domain =3D true;
> > +            mem->nr_banks++;
> > +        }
> > +        else
> > +        {
> > +            printk("Warning: Max number of supported memory regions
> reached.\n");
> > +            return -ENOSPC;
> > +        }
> > +    }
> > +    /*
> > +     * keep a count of the number of domains, which later may be used =
to
> > +     * calculate the number of the reference count.
> > +     */
> > +    mem->bank[i].nr_shm_domain++;
> > +
> > +    return 0;
> > +}
> > +#endif
> > +
> >  static int __init early_scan_node(const void *fdt,
> >                                    int node, const char *name, int dept=
h,
> >                                    u32 address_cells, u32 size_cells,
> > @@ -383,6 +447,10 @@ static int __init early_scan_node(const void *fdt,
> >          process_chosen_node(fdt, node, name, address_cells, size_cells=
);
> >      else if ( depth =3D=3D 2 && device_tree_node_compatible(fdt, node,
> "xen,domain") )
> >          rc =3D process_domain_node(fdt, node, name, address_cells,
> > size_cells);
> > +#ifdef CONFIG_STATIC_SHM
> > +    else if ( depth <=3D 3 && device_tree_node_compatible(fdt, node,
> "xen,domain-shared-memory-v1") )
> > +        rc =3D process_shm_node(fdt, node, address_cells, size_cells);
> > +#endif
> >
> >      if ( rc < 0 )
> >          printk("fdt: node `%s': parsing failed\n", name); diff --git
> > a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> > index 7a1e1d6798..38e02ced36 100644
> > --- a/xen/arch/arm/include/asm/setup.h
> > +++ b/xen/arch/arm/include/asm/setup.h
> > @@ -27,6 +27,9 @@ struct membank {
> >      paddr_t start;
> >      paddr_t size;
> >      bool xen_domain; /* whether the memory bank is bound to a Xen
> > domain. */
> > +#ifdef CONFIG_STATIC_SHM
> > +    unsigned long nr_shm_domain;
> > +#endif
>=20
> This is a NIT but unsigned int would be more than enough. The benefit is =
that
> the following uint8_t end up not needing extra memory on arm64. I realize
> this is an overoptimization so it is fine anyway.
>=20

Oh, padding! Learned it, I'll fix thanks~~~

> Other than this, the patch looks good to me.

