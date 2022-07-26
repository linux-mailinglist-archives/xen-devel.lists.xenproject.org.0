Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B39E95815AE
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 16:49:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375376.607716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGLrb-00023R-Lq; Tue, 26 Jul 2022 14:48:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375376.607716; Tue, 26 Jul 2022 14:48:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGLrb-00020H-J1; Tue, 26 Jul 2022 14:48:47 +0000
Received: by outflank-mailman (input) for mailman id 375376;
 Tue, 26 Jul 2022 14:48:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+jxi=X7=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oGLrZ-00020B-WD
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 14:48:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2050.outbound.protection.outlook.com [40.107.22.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b7aa94c-0cf2-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 16:48:43 +0200 (CEST)
Received: from AS8PR07CA0044.eurprd07.prod.outlook.com (2603:10a6:20b:459::17)
 by AM0PR08MB3508.eurprd08.prod.outlook.com (2603:10a6:208:e1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Tue, 26 Jul
 2022 14:48:41 +0000
Received: from AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:459:cafe::13) by AS8PR07CA0044.outlook.office365.com
 (2603:10a6:20b:459::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.7 via Frontend
 Transport; Tue, 26 Jul 2022 14:48:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT061.mail.protection.outlook.com (10.152.16.247) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Tue, 26 Jul 2022 14:48:40 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Tue, 26 Jul 2022 14:48:40 +0000
Received: from 2b7f6ee6c0c1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BC06DE17-B273-4434-9119-A3956C0BA213.1; 
 Tue, 26 Jul 2022 14:48:33 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2b7f6ee6c0c1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Jul 2022 14:48:33 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AM6PR08MB4373.eurprd08.prod.outlook.com (2603:10a6:20b:70::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.20; Tue, 26 Jul
 2022 14:48:32 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7%9]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 14:48:31 +0000
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
X-Inumbo-ID: 0b7aa94c-0cf2-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=CwbMs2aKmxuFMuEqHBiJnyP8ZdUEzpBZ6Ic6ZJrEMjTl9YLa9GkUtLw68UvkKYTCUwxGaguCexSrFytIVJKi0s6YDIFbYNlcX0mwKsGW7CTlRVlmArpOIIVSVFPaiM8tA0iw4ffkRzjlGrIPhPeuKQY88unaBBZivVh+aEOhn1E7uaIhc0NG9Y5ydQ7/cbuAV1SeubVaMrnXrCc92xGX5HIaGYzgVXQ/kx3tXMF95flrXxpmqZz5jTqhZ039ulKvcIwuOYpgJXJZ64rdaDmpMIOlRtYMzGxbCSrMJz5cuZ++jGyIsWBf0coUGd9xYe3a2GK77QGb/zr6LULUxJ4qTg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2Sdvd7kpsWyMQqQOIsNw/DIvnnUJ/yTjMJS9l6doAI=;
 b=jSI34CsAVB+94rqmYSLgOCoLVwTT9rZyMNeMReaZNVUvtIt6MriubDTdRnU2WSP/J6woDznctj96NDo1oVsSCqkQQ756hwauPl7dLRFigwdLEyCbEw30UKhnYo8qwgH3WLp3sD2AivZHEAun9LETo14KjJfd4h0aeaReZw9N5BOi1cgDfSIS750DBN7EdBB+idhDq8sYOQ0fEu369TSwUmqrBIDpciVMlBWqLPg19KCAoxkKWFWRBX8SiweLvGFO/1qpAsN/YYtDSh2EO66zIC2a2hrcB6hVokhuM8e6Ey5QH3RGWsoJH69Xvi3cDm43KbG7Yof5Jox16rYu89FPEw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2Sdvd7kpsWyMQqQOIsNw/DIvnnUJ/yTjMJS9l6doAI=;
 b=dM3BGeHfB9ahc/met/3JoP6SNaCGLZaOjE4lP1JhuxX/1FkrAMQWfZG+w1PWd2kb9Ue9CsL8EEbZKqx1yGQ41aFcXoRhBxwIMDjjAd5s+dPHqv9ZoK165psEx4SJFiHgPXGsCeICfJLQJIsZs3MJbWYX9VLJ5As99rOTXuq/0rk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bc0711f33ca28f02
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqV0qDIe3suect2LitfxEhwzaxvUJqC9ltsCNqZi29dWzb/skrFPmogheXm2wayB3RK5PWUh9Nmz+WCWT+sP4LvSoJ1w5yIWmZ7ZjjQe9iLGRn96eIVADY2ozVsY/msjVf3S9BXPp+//Idc9Klx5DGEN0p0AtJrYc0FKPf3RQE/KSZTIMBRGheKfoEkXTjryPHMGVh1VFcqhZsZHg6EfPt+NXVH7z/5MLVnJTLhua93IHM+rbm0RGJm7J4hsU4QzVYv8yEgs04HHw+2EOrLpSibxd7ykMAp/0ZkKuPKKyI5PYmtYzeiB78CTHVGtcRWWmORRjHd71z7GT7Wg71XSkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2Sdvd7kpsWyMQqQOIsNw/DIvnnUJ/yTjMJS9l6doAI=;
 b=nnzxx4uJoF24HO1F9yj5dXn6Dx+6xMwbd5kvMq5anVjA2zokz5VtEfC3rSFbu/jnkVVxWcnBxtmkvLd1G5YGE7DMqsqZJK4fY/+zTyImve8EJ54iczfFkCr7SOAMgYk1yq/b96txOzaI6nw2vzTS1ZYbx8L+ZZHt1OWMdtW1cPtSlF6jH27mf3UdX6Ibux62Woj9+kO9PUD/h6hSAOg3g+o2TL819quXtWyppWd0S5+FuUD317ltMgF2QnofrWJ1wGhVvDegF4tlzoC4kd1IQubCr5fFjM3ngZYPfknEhbs0wTrSKtjFxj2kWx99wzU92eNxGqDXOmkMdV8Yyr6Cqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2Sdvd7kpsWyMQqQOIsNw/DIvnnUJ/yTjMJS9l6doAI=;
 b=dM3BGeHfB9ahc/met/3JoP6SNaCGLZaOjE4lP1JhuxX/1FkrAMQWfZG+w1PWd2kb9Ue9CsL8EEbZKqx1yGQ41aFcXoRhBxwIMDjjAd5s+dPHqv9ZoK165psEx4SJFiHgPXGsCeICfJLQJIsZs3MJbWYX9VLJ5As99rOTXuq/0rk=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH V7 04/11] rangeset: add RANGESETF_no_print flag
Thread-Topic: [PATCH V7 04/11] rangeset: add RANGESETF_no_print flag
Thread-Index: AQHYm5cO6TaiKD6of0yQx8q1sDkLSq2Qxl2A
Date: Tue, 26 Jul 2022 14:48:31 +0000
Message-ID: <0A19A62B-0705-4C65-A3BF-CFDC0FA1547A@arm.com>
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <20220719174253.541965-5-olekstysh@gmail.com>
In-Reply-To: <20220719174253.541965-5-olekstysh@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 5c29fe41-8ad9-49ff-dcdd-08da6f15ee43
x-ms-traffictypediagnostic:
	AM6PR08MB4373:EE_|AM5EUR03FT061:EE_|AM0PR08MB3508:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xVg13fqBwI5hV6PZsrGOnCBXhHowsNqN0Ug0ezFs23GpRv75ny8M07XblrfY+iddV9+JvtjIYHlAJiuKbzJI2JHziCyDytFJN7bbu9BAZfrO2hgnsD91efDV1VGLpwbgKpzCGARRD4Q65wrYSwrCSRd+OPfAd9aR+Vq+dqebseiqf3TvxuWIkW4yYCpVSMhRPRac0FjJrhLQ2XKHkgnuQvYmIum200CnT407iK7Be6eELbTkJgiVN5KFWoC2X7QpE/wNkwRR7xbCKjfBFj30q0Q6wHcKo3xCIr61hkx8Tjs915fbuUowg67/oTxQY3vaxq7bl1DfBP0gpILf0Q5isbKbtaO9PHGyX2HZ9YyicdMAa00YHPfhIotKgmAxN2TflJSjVE0T30m7w/94u8V0Kgeh3sZoUFAxV5bXa+sP7BVk330Xsd6GAthwCsrcFMuzGb8XyxXGR+Lui4rVml7Ya6oRJJ5MkYJgejKyIgcllNJJ7j1+nN+oKEMc7UZOaI+aPSdL7yC8LSwsW+B6U08TQ+ou45Wed2UlvYGe5NZeKUZU3hqeyg5pu2wFNSuukxQm/D58wSYCmWrB3uXiYIGRmJWec6F1k7lrQQz8I3QAy+28DPEdDyEbm64Ficz7po/AyPU8aDWLEHcVP/CTTlYFsy/VivcxAh3N5HLbInxMK/+/rlNYKOp5++Pl1+NDAjKTHUxLVRgBoBl4+hGCEUvLLZi7dU7xDWCk78MsTQiob0qwBaKT77pqfC1tBzSI6aY/Yfb9f732BpO6Bh2FwLgrcYODsg4k3/5rt5eWfXghPreecLdXdhPEuCPSwlp7VYJr+qZ9jSUeDYdPupKU8dV5NQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(396003)(136003)(376002)(39860400002)(5660300002)(8676002)(4326008)(8936002)(4744005)(54906003)(76116006)(6916009)(316002)(66446008)(6506007)(86362001)(6512007)(66946007)(66556008)(6486002)(66476007)(26005)(71200400001)(38070700005)(64756008)(41300700001)(91956017)(478600001)(53546011)(2616005)(36756003)(122000001)(186003)(33656002)(38100700002)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <117359476E236D4CB7CF4D2563497B3C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4373
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a8bd4a53-6e61-4235-af70-08da6f15e8ba
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5JhxVi4dFtz1wsQL76bO3KtFQ97KEbM66UtTR6JNTxiOruWhz2xjQ+lKcabNLTkruQU4Udy0UXZytXyWe8ooaF4NYgmOfPzUW/6cBINDD6vKpmA9qyeYil6EwFUoeISAISq+7WPeeGGaAvtJ56UWyUCDYzJXL0zeJN7Phnd+urV19i5F+7yxolUVMFJAtAL8AZNDsjCFiQGTBR9YgiTR0h5Xtkv8N85djdxFANYIn63YDT62CF+h6HJ1gi8jbNJJmdLwiTa8yQlk2I7kZ5m/MyVQxaK20p2vgp1IzJiDtQ8N6pF2XsPgyB5hY1Z6/IBrNO6eIwSwS4R8Eb7r0eDFbEND/VJhioH5Et2TfrvgyNANMuaNRLvkiFTpZy+qN79Jp7fVbjb4BjeorE+Gqe5uMMAE+M70qzPbYlIag+qeqSiS6hEy5c6/maimzK9G9D/sWEAVooVtzgRxWj1UOUu30CdbL+pm7O+MrqambMnN+cwEiO9rjC07zpBlM8RcGo5VP8r36AHx2LXk+QTJVoG+ivXpeWWMFj+D9Ks3RpE4BqbdksxVwJ8PB7iKQcM++OLlTW3qOg4zuFEsydrjMhQgKYTy093jsgCsS8D9veL9Oc+LBITLkiPe0JGTpnBcKdPSRF65ATWDQ9sl0TfKGus34yZdyk2wArYLjF+tKPWkCyasief3bO39xQ3obi2tC4IZdfWype+WcJccLGP+R0+o6TXfPKZIzAM5/WqD1fLeXMgzdkZoDdEdcKXvHD4b4ajsHFlHBgGlEs/EYO5MLtFE8igtPp2gnR6eUq4n7KVmu4gzzvTd8U1jNNLQIu31j3ff
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(376002)(346002)(39860400002)(40470700004)(46966006)(36840700001)(36860700001)(53546011)(6506007)(40460700003)(2616005)(478600001)(6486002)(2906002)(4744005)(41300700001)(5660300002)(33656002)(86362001)(8936002)(316002)(36756003)(54906003)(6862004)(82310400005)(40480700001)(81166007)(336012)(186003)(6512007)(26005)(47076005)(4326008)(8676002)(70206006)(82740400003)(356005)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 14:48:40.8043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c29fe41-8ad9-49ff-dcdd-08da6f15ee43
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3508

Hi Oleksandr,

> On 19 Jul 2022, at 6:42 pm, Oleksandr Tyshchenko <olekstysh@gmail.com> wr=
ote:
>=20
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>=20
> There are range sets which should not be printed, so introduce a flag
> which allows marking those as such. Implement relevant logic to skip
> such entries while printing.
>=20
> While at it also simplify the definition of the flags by directly
> defining those without helpers.
>=20
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>
=20
Regards,
Rahul


