Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A682B5FD660
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 10:44:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421756.667352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oitou-0006Yq-CV; Thu, 13 Oct 2022 08:44:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421756.667352; Thu, 13 Oct 2022 08:44:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oitou-0006W4-9Q; Thu, 13 Oct 2022 08:44:00 +0000
Received: by outflank-mailman (input) for mailman id 421756;
 Thu, 13 Oct 2022 08:43:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j8+s=2O=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oitos-0006Vy-3j
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 08:43:58 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60064.outbound.protection.outlook.com [40.107.6.64])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c5fe3c1-4ad3-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 10:43:56 +0200 (CEST)
Received: from FR3P281CA0019.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::6) by
 PAXPR08MB6653.eurprd08.prod.outlook.com (2603:10a6:102:15f::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.26; Thu, 13 Oct 2022 08:43:54 +0000
Received: from VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1c:cafe::b5) by FR3P281CA0019.outlook.office365.com
 (2603:10a6:d10:1c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.6 via Frontend
 Transport; Thu, 13 Oct 2022 08:43:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT064.mail.protection.outlook.com (10.152.19.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Thu, 13 Oct 2022 08:43:53 +0000
Received: ("Tessian outbound c2c2da38ad67:v128");
 Thu, 13 Oct 2022 08:43:53 +0000
Received: from e0bd9f0fd5e1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 88D87D27-D322-4EBF-B3AB-E1830405D5A9.1; 
 Thu, 13 Oct 2022 08:43:47 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e0bd9f0fd5e1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Oct 2022 08:43:47 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM8PR08MB5825.eurprd08.prod.outlook.com (2603:10a6:20b:1d6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 08:43:45 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%7]) with mapi id 15.20.5709.015; Thu, 13 Oct 2022
 08:43:45 +0000
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
X-Inumbo-ID: 2c5fe3c1-4ad3-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=iLOzuANRGKzMj/yQopKrZqQcZvBBpMHED6vDx/JMq7YA7dYduKZAQTaCPLTYpaRkG7lE7iZSoulF7AKha5T/NDnhEuJFTDdKrho5zPUhliti0qDt4K+ax7Gaf7YSJgVoF66RTtLQv5gtfYaPim4tLGkXATx2EEhsDA6C5iixH76Cm8m6L0HUmOQmijVUXHasANSoUZ+vmIHwGmhHE2u3s+aCpjf4/tUMKicjBWrnaOO+bdGEO+b5ohSbyaw11rsqcxOGDsmGwLlJNNgbY/CiXJzbOjVfTtTi4PVH7LTlXNGlE23aywNWUtm0anKzLKsDOT1yrlECOgUjhJ8uMHPCXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=72qxzXZ5v/aB6gik4lK8c7wqzTbAVYb4n6jBP7DEARs=;
 b=IbCfDmiDxKHLQDAUZAtDu9dPq6LSn0ieHW0TJr9oTBVwJhrrRjI0ROUMTbRjGuX3cyhW1skdmova/dUhwwLX6Zehn1MqLuugHp3ypIYbZdCLzaQdz6rCmiJ9tXyNv4SmnOv7uMHK85ISr5Z4zSVvAnUEAKe1uAI9Qdwrr6mul/3zXP/gW4n2MpX9WTn7uOWnSHrkJvkfyw/VwCjAMmi+Zuxm60q0NQMJQjM493wq/BN6TKQ/PS+rc0/WRV6BmxxCGqK6Mr1UrtWL9HjzlogsFoAx0XgKsqKUuqEWGMp1pX4E6zRPPZ8Okif9zj+0FBFYKcLV/xtKkNgxCTmai/oJmQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=72qxzXZ5v/aB6gik4lK8c7wqzTbAVYb4n6jBP7DEARs=;
 b=SdL23j303JC2ceiOJIwpCrflucEF32b5DMH9ilALXYGKwtKubEgKc942n3UGFNrLBR8ZtcrCYJqg4hzOXx/EPhRbC4+ys1lnn+8FqrFK2d/hpmsEIXCVdM6dfWsJbsIL9XIOsdz0H+mDVwgHBpHgPgApfm55TFUqCRwyYfE+tKg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MSOYBSk5NdqWw3Ujv+sTKb1ot51QHwoBXfLeNWOIsaTM6/3gmW9YmJJd9Yzdr+wzzYpPKQ33Wjl78+oIwYhfqheGjLTFfgPmMNFmR0tSRtVdoPNy8ZSxfKIR50YmybJC7UZFS+Uq3bfOEWXNZZJBsQjn9WZQgeMXGfs88uTgv44A3y6DME86QljdFsl/ZQdTDzN7eijH0i+YnLPk9xeZxWqaDrdDlIiDV3OJ6kMsYUNpW1ws9eJK9KPFRplhHbK1Nh1UsNRMSi8ImjlcvVPKxPeLMHOAZ7Llz+gRI++33b7FykgUoRow2bXN7ZRsVE1Vg+gNzrElq7DMLOD2SiLEOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=72qxzXZ5v/aB6gik4lK8c7wqzTbAVYb4n6jBP7DEARs=;
 b=ZYYyKpZlJgKIVnCw/lUR75RmDxEngZU4J0+VL2IUO/6SM9s95nyFCKb0XCFMhPeaLL4b5Q0YmRuzObihaZC6Fxz2gk+fN3t5Tp3f3D4jA4ou9ZHh3CUI63tZP+B4AkANvO5udgtHZd7K7huy/F9JtuR9cTK/qJIlEpMha5gJCcItyG1vLsC5K6+ctGE40zvbIlh2tvAYDpdcOXnZaZEiC6kT1YzJ2K+B5eWnK3/WVINUOZXZ6lOjMFToqDnnOs9Ow3Hk/uo5glp+rp3PmRc+ZRNSasuK+dfYNCjTZ4YKn30Xze5rDi6+teN6RBnKD2EMW39j2Bc51F+uLQiHuoh2Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=72qxzXZ5v/aB6gik4lK8c7wqzTbAVYb4n6jBP7DEARs=;
 b=SdL23j303JC2ceiOJIwpCrflucEF32b5DMH9ilALXYGKwtKubEgKc942n3UGFNrLBR8ZtcrCYJqg4hzOXx/EPhRbC4+ys1lnn+8FqrFK2d/hpmsEIXCVdM6dfWsJbsIL9XIOsdz0H+mDVwgHBpHgPgApfm55TFUqCRwyYfE+tKg=
From: Henry Wang <Henry.Wang@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
	<rosbrookn@gmail.com>, Wei Liu <wl@xen.org>
Subject: RE: [XEN PATCH v4 32/32] tools/golang/xenlight: Rework gengotypes.py
 and generation of *.gen.go
Thread-Topic: [XEN PATCH v4 32/32] tools/golang/xenlight: Rework gengotypes.py
 and generation of *.gen.go
Thread-Index: AQHYraPN+b7hfd/pvkWBASbwKELmZ64MZAOA
Date: Thu, 13 Oct 2022 08:43:44 +0000
Message-ID:
 <AS8PR08MB799164CA74689972AE96D42792259@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
 <20220811164845.38083-33-anthony.perard@citrix.com>
In-Reply-To: <20220811164845.38083-33-anthony.perard@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9DBD07C18E1CE04F9B77BD2EBEDE302E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM8PR08MB5825:EE_|VE1EUR03FT064:EE_|PAXPR08MB6653:EE_
X-MS-Office365-Filtering-Correlation-Id: 4739c56d-fe2c-4745-3d36-08daacf70f45
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 t8b60qTlB3Ch4UD6zpSsv5AZ8mScgM/h0TnRFsB4GeYSoF0Ng3tL1bBLNKwz+rEWlS5gWu9e66ZMn6G4YVAEGkN+GUptt8wAkWmqdxuoeXgcCujV6KtYQznuKe8vMqNzimBNDqCLHQ0HYrVnAvbb1u4wbkgKVB/1ySkbf4KuElAa7TLkPsMP11uLAT8gfxUNYeXXMtmVJ4/qky4wONKbn56QPPFbOqPUtqfQ5CoTtHNLIL7F4YuIkmkHETfRKodO9jpqyknZxT0FitDhSt9HM+hIq0ZkXbtodY2GhL07nBxneA9xY8Rm1dUsSUGc15VBmG3m/KEQo8GjL7pNvI1jK15MhjaxlFmVEeiyXD79m0U3qmUlnhk0s2ND1PTn5CtPcYtL+jeMa2zTL5uRkg+mNMrVdPM8CRMIrVb7OiYB5dfmGGFGSR2Yd3TUvQBhkKpvM0zu+CKETiQo+G5Mv/jAdFldIgWJk4fSF2p3k7jnhX/qwAwtNwhguw4LEGgiQbjfOAF9Kv5VRn6DFY4gsPMLGhKOofJevhL1JWLHw1L+qzB6wkIGk1TNan/jNVCEUgi46faYtaxriKp39YD4NBNwc0OkqCLxU6Vy/ZOSJ60Bjivf6LhiNoHARqDaUNa18d/TMIxBnAClPS6JlzPc45pG9MlCDqD89bTLLrYssGmtwks/gfofsr0OzFZKDl9Kb6uWFC4TcHY9dk2qRkqoH0e7qUpDb3duVnqS/XLi+dQd3MCcGe9fUqLjreMAAWwUMSnOOU4iISD+kLp3467dnarSkg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(451199015)(38070700005)(71200400001)(54906003)(110136005)(316002)(478600001)(186003)(38100700002)(66556008)(76116006)(66476007)(66946007)(66446008)(122000001)(64756008)(8676002)(4326008)(55016003)(7696005)(5660300002)(26005)(41300700001)(6506007)(33656002)(4744005)(52536014)(8936002)(9686003)(83380400001)(2906002)(86362001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5825
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3d7961d9-767d-42a4-a359-08daacf709e9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wNKHCkcD76FA5k99gnkuSCn+6x3FD/+1Y+k+XAUapN3B23VJ2lZb/DRx5PKD42GD40py1ujkTchUSvoIC3qWa7GTNRHeB73b4/WYBB5iC5H6Rm/C9z/Iq25ruve0Qy4+3OKwHoqdZOmyOfF5V2OV9xmkC8Owpg1oo9iFDuLAAZZhI334LA668LA2YOjY0J5NdDSz2AScZVwCLPog0i511x6s97qAoiDSG8kb/H+bLir2f54wLg/x0EHzRhL+I2fFjZ1gnMnlnqnkjH0ua2LTjlZeytIE537stXU/XpQsWEieao6piSIU2xK0hRyFscg5Uj2664BhR4yLH1UgMwBJogJZEuLcqp7/8VVGCsPihXd/Gk7itQgErtJbmMyL1D2FQNGZxKLiRFIyhQHMFS6muiD4CAif1maZvaj/0Yn0AdF1eoKgBYyGLr1cWfo6g1snZGVGTDDBJmrhzUQOsifiUHehhuO9cFJP+DU+Fp1QTQBQabadEUnjZV0oO/1s5AwYcKL0Hq2ZIyAX7T+7R6eEfRPddedRz1EZ3Ictc1jEFtcbBw/stNOtM7xLmp+K5qg6kEVwvafHJ8+7Y4b7M5+uw0LP9hmfLsXA1/LXBOC46soRux2VwId6hqtl98o62pFoZ0VBlvyJpQrfqjffKzTkwsjtyuD7EuGtxMfBywA1rTyjjlJbfUk7BgaShAafk24aZJdG6ohGs9DzD6/0eTUVZpLX6kwfXMaknKN+8t2hZjnxkIXIKZFQNckMoH7qM57P7TAorN4geinRSQqC35CU6g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(376002)(396003)(451199015)(46966006)(36840700001)(40470700004)(40480700001)(186003)(336012)(9686003)(26005)(55016003)(2906002)(82740400003)(52536014)(316002)(33656002)(110136005)(8936002)(54906003)(41300700001)(8676002)(4326008)(70586007)(70206006)(86362001)(81166007)(356005)(7696005)(6506007)(82310400005)(478600001)(5660300002)(40460700003)(4744005)(36860700001)(47076005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 08:43:53.8259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4739c56d-fe2c-4745-3d36-08daacf70f45
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6653

Hi Anthony,

> -----Original Message-----
> Subject: [XEN PATCH v4 32/32] tools/golang/xenlight: Rework gengotypes.py
> and generation of *.gen.go
>=20
> gengotypes.py creates both "types.gen.go" and "helpers.gen.go", but
> make can start gengotypes.py twice. Rework the rules so that
> gengotypes.py is executed only once.
>=20
> Also, add the ability to provide a path to tell gengotypes.py where to
> put the files. This doesn't matter yet but it will when for example
> the script will be run from tools/ to generate the targets.
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

IIUC this is a fix for the occasionally failure in gitlab CI, so:
Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

