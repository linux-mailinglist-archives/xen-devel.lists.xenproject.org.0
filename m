Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D14759FD91
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 16:53:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392771.631334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQrk4-0003Yo-FY; Wed, 24 Aug 2022 14:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392771.631334; Wed, 24 Aug 2022 14:52:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQrk4-0003WX-CV; Wed, 24 Aug 2022 14:52:28 +0000
Received: by outflank-mailman (input) for mailman id 392771;
 Wed, 24 Aug 2022 14:52:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EISj=Y4=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oQrk2-0003WQ-5o
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 14:52:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2056.outbound.protection.outlook.com [40.107.20.56])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ceb5618-23bc-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 16:52:24 +0200 (CEST)
Received: from AM5PR04CA0036.eurprd04.prod.outlook.com (2603:10a6:206:1::49)
 by DB7PR08MB3242.eurprd08.prod.outlook.com (2603:10a6:5:1a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.20; Wed, 24 Aug
 2022 14:52:21 +0000
Received: from AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::53) by AM5PR04CA0036.outlook.office365.com
 (2603:10a6:206:1::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Wed, 24 Aug 2022 14:52:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT056.mail.protection.outlook.com (100.127.140.107) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Wed, 24 Aug 2022 14:52:21 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Wed, 24 Aug 2022 14:52:21 +0000
Received: from a1bfca9c5104.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9F33994A-3A78-4113-B58E-A36B25028053.1; 
 Wed, 24 Aug 2022 14:52:10 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a1bfca9c5104.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 Aug 2022 14:52:10 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DB7PR08MB3355.eurprd08.prod.outlook.com (2603:10a6:5:18::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Wed, 24 Aug
 2022 14:52:08 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5546.022; Wed, 24 Aug 2022
 14:52:07 +0000
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
X-Inumbo-ID: 5ceb5618-23bc-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=eUzTYZjzLNdK69KA3irg9qAvUheINscadPK7dosoPpTt6JjKOJXfKiEOly761TRe87um7R9v1hod0Qeimv978ZIDXNmWTTvZ+XFGr4DuA9I0q930SEIsx7wgdCrD2C3e1x1AaqnNt2TyG1cpfFUk+7hWMSfU5E7JVg464Fqs/DDuZ5jKOt1LpV+YoAORAS8hShJxBNur0L5kqlP58xSEQu8M7Ex5CUPPptUF3fZ3sjwW7Tnc9fVEAVv1Bz1uzJTZf9Gr81dPW8lzgcFnY6rL+jHfRVm05QhbzfGG6g8v2Fl78DSW6sSvSRO4ZVsRKRGLnhyq2cnNANqiQaHswsMDoA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkIUcqbjCVYCOAy3IWm5Zxq0DUuSXQLG5q/JJnWDQek=;
 b=hxvXghiG19KlUIxbzXm7vgN0bJBLy44ydtTjT7nWj3SVhWmnjWYDSXc0A6Hyj5MW0atQ7yojkwaVGtGbTwY8gRArNmkWuYsWP1gs/VZtgJ0YyqLxr8kLz7PdF/dYeB/m7dSUwa8bHTlS/EZoaxFKpz88FlDjnnfzki6fKouw4OSlMuUTDBggTpPU6dFnKdvBC2U+rL9dgZTJzckLOg+EOEioa0+LZV+nbg0RVuI2xflxxFORUq6Ry3yAWrG9mL8ckLnWwRaGuJUHrnFglVzsHVwj4Wk37blYdffBQA9mdla670Q1ZVBECJjKgI1F/MSAxpKHi1VVv5mq2PiQJU0foQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkIUcqbjCVYCOAy3IWm5Zxq0DUuSXQLG5q/JJnWDQek=;
 b=2kPEz4i1uypdo18Cnn2H00g0bctW3i9qaROpes/4hX8hSfW74T1ZxXqGgUAvMVb6xIPogFpMDCfU/LD8VzrAVPO4DHV9ebdKjPonZnI9Aug1tJ8p+XE3+2uFPQa3aldODqc0acF+/WEtsEtxmBHWmN8w77FM2Rx227KPlnarCis=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: dc80505c56781ba5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNkrQ68juaByQo6Mb6X291EZ80eSgLuay1DURc6PA6v3MGnUv6qnFOuRk5vmAaR9aPT17nNib1+5IUV5rbjewLTiTsw1EwJzp4b5I1sIwSXEGUJZwPuWBZDvjm+Uc7cJrmSbC3eLKI0XJd26JrJHIMJWmwGw60uLNWlbeBjYu0rl7j8XuejUmH6C81TDcjC5XjYsrf3xr22GHp+VmCsfVbYsKbIn/N5eNHbPnKTgGnBCemk0I+wNmIL3YDbbELYWZH4F7lyjgOB3aR8LXcoNKs9VTusx6S3fnSgzlCuJo0zRoqaZZYmgPQ0JMLj5ovbOW8iNmwdKBI75afd2CYIdIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkIUcqbjCVYCOAy3IWm5Zxq0DUuSXQLG5q/JJnWDQek=;
 b=QxFzAY/bx/CpaGxCAZJ3rPbn3wL/sjkHqk4iB/aVYBjRnyjkRVpKZuWDbU0W6TbtNajQ4QmrsD8bJqX+f04nIiP4GEYenh989cujFNr0wkh5G0oelP2KeBcV3RwrU6dKLv4t7ye5yA/arwo2pBxnTG/rzQpsUDQj3CE3gSMTKr6soL+/5nmhHVECPwv9EHtl5ZJs91wxYq7F2lKGCQMYJTMgDG2kUulxE5RaA+1mkALR2sWvSMyH9ZURx9b8AvTYxbuNT1I+XeHOMHUUs2acJCvbDe0XRCetkuu5mXG4ERhYDovDh8NzAVK4VB//O9f9Ij4eT0mFHD5LkSMdjgzRSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkIUcqbjCVYCOAy3IWm5Zxq0DUuSXQLG5q/JJnWDQek=;
 b=2kPEz4i1uypdo18Cnn2H00g0bctW3i9qaROpes/4hX8hSfW74T1ZxXqGgUAvMVb6xIPogFpMDCfU/LD8VzrAVPO4DHV9ebdKjPonZnI9Aug1tJ8p+XE3+2uFPQa3aldODqc0acF+/WEtsEtxmBHWmN8w77FM2Rx227KPlnarCis=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 6/7] xen: introduce xen-evtchn dom0less property
Thread-Topic: [PATCH v2 6/7] xen: introduce xen-evtchn dom0less property
Thread-Index: AQHYs7NW3+Fahvka9EWQJqDFDZ/aKq28Pz0AgAHrhYA=
Date: Wed, 24 Aug 2022 14:52:07 +0000
Message-ID: <42597D19-443F-4A04-84B5-937EB3596893@arm.com>
References: <cover.1660902588.git.rahul.singh@arm.com>
 <02993cf398573adf9e9bad62aa8d6e753b2c6ab9.1660902588.git.rahul.singh@arm.com>
 <f8ced254-85d0-ee2b-4f90-2c58926ec75f@xen.org>
In-Reply-To: <f8ced254-85d0-ee2b-4f90-2c58926ec75f@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ab76912b-8297-424d-f357-08da85e03f9e
x-ms-traffictypediagnostic:
	DB7PR08MB3355:EE_|AM7EUR03FT056:EE_|DB7PR08MB3242:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9EhpkO25wB+dkPVbL9ZIziU6sywBsiKYbPVabxKEnUJPq/Sy7gaKu/u/WWXPlSOpgWkBPoRMrMqpaBpvfBOn33feFyt46dPBLg8mVAoycX4w7MOHvvB52zTlGMd00svOYCAu2c+uKGGNk+qbnX0eN9XQp4oaJK2DHUlrtT2UEyE7gn+axaqGZoumghv+Ua/2NwQk21u7NSkp0cUTb4IcvBi12BTTjVMbwlPgz78asM/nq2ZD6QrdhwnU57ry9lXDbYdZ9QavyDbcZcrB6g4TzU0YAFFC5cdUPg5Hn4gblsNpjPj/re8TnLOISzKA12YvrgKe9Fj3tiAnllCMEfHuJ6UnF/yvym41GNG1pVWGcfDQ9fGwdxl2TDz/D6EM9qDd9/mKQ5BBJwpoRM1ov/82XB0QhJ//b0D5HqF4Frl4jyPkNas3yTUHBEqkL93R3fjNrMb2jf9hBo24xMV8FNMh5B2BB67h4CopC45CSXASVShwTyI8O9ozuiLGIetOA4UQLgNryLcQldfGDTXOHPgtgp6TNsTxb0KQvJRG5Qorm1QfR7IOg8tzztfQ+LJ6/OlbwVdtJcLJtlzSOGbOV6LdxvrR1zA2lvuJTiVhLoEZqSx7zzoI9z1hXebxpiUfjqfUddX6jHs2emPZnYw4D20niThYRQUQigMnfhZ6cBKcyqZdBMFnKw77iYJuPaPv336wIJSPBUUrYuQ8evzvxrxUTe0Rvk6TZJlKaOqbX5T9RtO5pFtt8POK0DAITJIEOCN6mHe+Cb0nH0jymoUu8tAud9exFr+WgMJ3ndeTuDDjif8OmOh3kVgpExgyuu6B714Ld+kG/h/FyqMXabm31c3CSw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(2906002)(64756008)(8676002)(30864003)(8936002)(5660300002)(66446008)(66556008)(66476007)(4326008)(53546011)(66946007)(76116006)(91956017)(6486002)(36756003)(26005)(33656002)(41300700001)(2616005)(71200400001)(186003)(478600001)(6512007)(86362001)(6506007)(83380400001)(54906003)(316002)(122000001)(38100700002)(6916009)(38070700005)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE9FB2D9BC9E3D4CA3D174A21782AF89@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3355
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7f5da007-72c3-42ab-575b-08da85e037a5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	euJe6Qs5Eph0I3VfLWct6DPCZza9mqJO4FPVk8fREwq7GDbseZyXozfgb0Wh+LagsjoedG0ADMyBDJu1ZAMYEPDmdKSlDzepib+KtNhPWQtrHkSvl01TKKavF2zQGQVow6Qinjm8SEIGWqokNrnvnEn6LT/UAjEtM8gW4ja7jRaKMR1o9py8mANud8njJA7/BLKJFzGw5txRixRT62+z/LkXeXEiUwrPz2gq20zLt+TSONKGtcuqATOzr6/xr1O/bIJ/9OlLsXlSJgErU74gav2UqLxHOYFVkH9aRwxGIcc/XM4V5ow5CD0ZPNbv+GZbarsn0SoN959xZliGAN2Sx61eMjZtk+gE6UIy9tueUGnWC2Z1qPq5rjm44dAQjQDRzSnE0mk+fvvCFfkTPXKkkOhuDEwTQlx0x+GctQKCjBBdKVuDBeLrB7FDj2PwQzscvbqIL8VaCeBywo42MjYv97Do1/N4RfxtPStqD5dY2+SA/nsmuax5Ug4CS2gWqXdFMweL50gk9jYwOjp1U1hHnSSshzKsd6hgYUhQVz69ae6Ir0TAiMS5bO8ALHWb3oceJmps5/lFm056AWWsc8hKloEpwrTIx6e7h31oG/iV4RjjnB+ePO1rGmT8XdBRJfhFvGMB6TZkkrEzVVuJzrgkzusviRuA068yuUYiYueLrgvQ2oyHFctgo/rXAB4W7mdGmFqESVSF/GvaalURVwNbcFqao3h5K+xDrUyDJ9k4yZyT/+mIpJfNjBOOUX6QK8QpEuzPCYMcO0edyI2v595FIh42DSfvnsrzs2Gs01MowZM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(39860400002)(376002)(346002)(46966006)(36840700001)(40470700004)(6486002)(6512007)(70206006)(5660300002)(8676002)(70586007)(107886003)(30864003)(41300700001)(8936002)(316002)(54906003)(6506007)(2906002)(26005)(83380400001)(478600001)(186003)(53546011)(47076005)(36756003)(2616005)(4326008)(336012)(40480700001)(86362001)(33656002)(356005)(40460700003)(82310400005)(6862004)(36860700001)(81166007)(82740400003)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 14:52:21.2271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab76912b-8297-424d-f357-08da85e03f9e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3242

SGkgSnVsaWVuLA0KDQo+IE9uIDIzIEF1ZyAyMDIyLCBhdCAxMDozMiBhbSwgSnVsaWVuIEdyYWxs
IDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBSYWh1bCwNCj4gDQo+IE9uIDE5LzA4
LzIwMjIgMTE6MDIsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4gSW50cm9kdWNlIGEgbmV3IHN1Yi1u
b2RlIHVuZGVyIC9jaG9zZW4gbm9kZSB0byBlc3RhYmxpc2ggc3RhdGljIGV2ZW50DQo+PiBjaGFu
bmVsIGNvbW11bmljYXRpb24gYmV0d2VlbiBkb21haW5zIG9uIGRvbTBsZXNzIHN5c3RlbXMuDQo+
PiBBbiBldmVudCBjaGFubmVsIHdpbGwgYmUgY3JlYXRlZCBiZWZvcmVoYW5kIHRvIGFsbG93IHRo
ZSBkb21haW5zIHRvDQo+PiBzZW5kIG5vdGlmaWNhdGlvbnMgdG8gZWFjaCBvdGhlci4NCj4+IFNp
Z25lZC1vZmYtYnk6IFJhaHVsIFNpbmdoIDxyYWh1bC5zaW5naEBhcm0uY29tPg0KPj4gLS0tDQo+
PiBDaGFuZ2VzIGluIHYyOg0KPj4gIC0gbm8gY2hhbmdlDQo+PiAtLS0NCj4+IC0tLQ0KPj4gIGRv
Y3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQgfCAgNjMgKysrKysrKysrKystDQo+
PiAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jICAgICAgICAgICB8IDEzNiArKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPj4gIHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9kb21haW4uaCAg
ICAgfCAgIDEgKw0KPj4gIHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9zZXR1cC5oICAgICAgfCAg
IDEgKw0KPj4gIHhlbi9hcmNoL2FybS9zZXR1cC5jICAgICAgICAgICAgICAgICAgfCAgIDIgKw0K
Pj4gIDUgZmlsZXMgY2hhbmdlZCwgMjAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+
IGRpZmYgLS1naXQgYS9kb2NzL21pc2MvYXJtL2RldmljZS10cmVlL2Jvb3RpbmcudHh0IGIvZG9j
cy9taXNjL2FybS9kZXZpY2UtdHJlZS9ib290aW5nLnR4dA0KPj4gaW5kZXggOTgyNTM0MTRiOC4u
ZWM3ZGJjYWY4ZiAxMDA2NDQNCj4+IC0tLSBhL2RvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9v
dGluZy50eHQNCj4+ICsrKyBiL2RvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQN
Cj4+IEBAIC0yMTIsNyArMjEyLDcgQEAgd2l0aCB0aGUgZm9sbG93aW5nIHByb3BlcnRpZXM6DQo+
PiAgICAgIGVuYWJsZSBvbmx5IHNlbGVjdGVkIGludGVyZmFjZXMuDQo+PiAgICBVbmRlciB0aGUg
Inhlbixkb21haW4iIGNvbXBhdGlibGUgbm9kZSwgb25lIG9yIG1vcmUgc3ViLW5vZGVzIGFyZSBw
cmVzZW50DQo+PiAtZm9yIHRoZSBEb21VIGtlcm5lbCBhbmQgcmFtZGlzay4NCj4+ICtmb3IgdGhl
IERvbVUga2VybmVsLCByYW1kaXNrIGFuZCBzdGF0aWMgZXZlbnQgY2hhbm5lbC4NCj4+ICAgIFRo
ZSBrZXJuZWwgc3ViLW5vZGUgaGFzIHRoZSBmb2xsb3dpbmcgcHJvcGVydGllczoNCj4+ICBAQCAt
MjU0LDExICsyNTQsNDMgQEAgVGhlIHJhbWRpc2sgc3ViLW5vZGUgaGFzIHRoZSBmb2xsb3dpbmcg
cHJvcGVydGllczoNCj4+ICAgICAgcHJvcGVydHkgYmVjYXVzZSBpdCB3aWxsIGJlIGNyZWF0ZWQg
YnkgdGhlIFVFRkkgc3R1YiBvbiBib290Lg0KPj4gICAgICBUaGlzIG9wdGlvbiBpcyBuZWVkZWQg
b25seSB3aGVuIFVFRkkgYm9vdCBpcyB1c2VkLg0KPj4gICtUaGUgc3RhdGljIGV2ZW50IGNoYW5u
ZWwgc3ViLW5vZGUgaGFzIHRoZSBmb2xsb3dpbmcgcHJvcGVydGllczoNCj4+ICsNCj4+ICstIGNv
bXBhdGlibGUNCj4+ICsNCj4+ICsgICAgInhlbixldnRjaG4iDQo+PiArDQo+PiArLSB4ZW4sZXZ0
Y2huDQo+PiArDQo+PiArICAgIFRoZSBwcm9wZXJ0eSBpcyB0dXBsZXMgb2YgdHdvIG51bWJlcnMN
Cj4+ICsgICAgKGxvY2FsLWV2dGNobiBsaW5rLXRvLWZvcmVpZ24tZXZ0Y2huKSB3aGVyZToNCj4+
ICsNCj4+ICsgICAgbG9jYWwtZXZ0Y2huIGlzIGFuIGludGVnZXIgdmFsdWUgdGhhdCB3aWxsIGJl
IHVzZWQgdG8gYWxsb2NhdGUgbG9jYWwgcG9ydA0KPj4gKyAgICBmb3IgYSBkb21haW4gdG8gc2Vu
ZCBhbmQgcmVjZWl2ZSBldmVudCBub3RpZmljYXRpb25zIHRvL2Zyb20gdGhlIHJlbW90ZQ0KPj4g
KyAgICBkb21haW4uIE1heGltdW0gc3VwcG9ydGVkIHZhbHVlIGlzIDJeMTcgZm9yIEZJRk8gQUJJ
IGFuZCA0MDk2IGZvciAyTCBBQkkuDQo+PiArICAgIEl0IGlzIHJlY29tbWVuZGVkIHRvIHVzZSBs
b3cgZXZlbnQgY2hhbm5lbCBJRC4NCj4gDQo+IEkgdGhpbmsgeW91IGFyZSBlaXRoZXIgbWlzc2lu
ZyBhICdhJyBvciAnSUQnIHNob3VsZCBiZSAnSURzJw0KDQpBY2suIA0KPiANCj4+ICsNCj4+ICsg
ICAgbGluay10by1mb3JlaWduLWV2dGNobiBpcyBhIHNpbmdsZSBwaGFuZGxlIHRvIGEgcmVtb3Rl
IGV2dGNobiB0byB3aGljaA0KPj4gKyAgICBsb2NhbC1ldnRjaG4gd2lsbCBiZSBjb25uZWN0ZWQu
DQo+PiAgICBFeGFtcGxlDQo+PiAgPT09PT09PQ0KPj4gICAgY2hvc2VuIHsNCj4+ICsNCj4+ICsg
ICAgbW9kdWxlQDAgew0KPj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJtdWx0aWJvb3Qsa2VybmVs
IiwgIm11bHRpYm9vdCxtb2R1bGUiOw0KPj4gKyAgICAgICAgeGVuLHVlZmktYmluYXJ5ID0gIi4u
LiI7DQo+PiArICAgICAgICBib290YXJncyA9ICIuLi4iOw0KPj4gKw0KPj4gKyAgICAgICAgLyog
b25lIHN1Yi1ub2RlIHBlciBsb2NhbCBldmVudCBjaGFubmVsICovDQo+PiArICAgICAgICBlYzE6
IGV2dGNobkAxIHsNCj4+ICsgICAgICAgICAgICBjb21wYXRpYmxlID0gInhlbixldnRjaG4tdjEi
Ow0KPj4gKyAgICAgICAgICAgIC8qIGxvY2FsLWV2dGNobiBsaW5rLXRvLWZvcmVpZ24tZXZ0Y2hu
ICovDQo+PiArICAgICAgICAgICAgeGVuLGV2dGNobiA9IDwweGEgJmVjMj47DQo+PiArICAgICAg
ICB9Ow0KPiANCj4gQUZBSVUsIHRoaXMgaXMgbWVhbnQgdG8gZGVzY3JpYmUgdGhlIHN0YXRpYyBl
dmVudCBjaGFubmVscyBmb3IgZG9tMC4gSSBjYW4ndCBmaW5kIHRoZSBkb2N1bWVudGF0aW9uIGZv
ciBpdC4gRG8gdGhleSBhbHdheXMgbmVlZCB0byBiZSBhIHN1Ym5vZGUgdGhlIG5vZGUgIm11bHRp
Ym9vdCxrZXJuZWwiPw0KPiANCj4gVGhlIHJlYXNvbiBJIGFtIGFza2luZyBpcyBpdCBmZWVscyBz
dHJhbmdlIHRvIGRlZmluZSB0aGVtIGJlbG93IHRoYXQgc3Vibm9kZSB3aGVuIGZvciBkb21Vcywg
Ym90aCBub2RlcyBoYXZlIHRoZSBzYW1lIHBhcmVudC4gU28gSSB0aGluayBpdCB3b3VsZCBtYWtl
IG1vcmUgc2Vuc2UgdG8gZGVmaW5lIHRoZW0gaW4gY2hvc2VuLg0KDQpPay4gSSB3aWxsIG1vdmUg
dGhlIGRvbTAgZXZ0Y2huIG5vZGUgdW5kZXIgY2hvc2VuIGRvbmUuDQo+IA0KPj4gKyAgICB9Ow0K
Pj4gKw0KPj4gICAgICBkb21VMSB7DQo+PiAgICAgICAgICBjb21wYXRpYmxlID0gInhlbixkb21h
aW4iOw0KPj4gICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MHgyPjsNCj4+IEBAIC0yNzcsNiAr
MzA5LDIzIEBAIGNob3NlbiB7DQo+PiAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtdWx0aWJv
b3QscmFtZGlzayIsICJtdWx0aWJvb3QsbW9kdWxlIjsNCj4+ICAgICAgICAgICAgICByZWcgPSA8
MHgwIDB4NGIwMDAwMDAgMHhmZmZmZmY+Ow0KPj4gICAgICAgICAgfTsNCj4+ICsNCj4+ICsgICAg
ICAgIC8qIG9uZSBzdWItbm9kZSBwZXIgbG9jYWwgZXZlbnQgY2hhbm5lbCAqLw0KPj4gKyAgICAg
ICAgZWMyOiBldnRjaG5AMiB7DQo+PiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ4ZW4sZXZ0
Y2huLXYxIjsNCj4+ICsgICAgICAgICAgICAvKiBsb2NhbC1ldnRjaG4gbGluay10by1mb3JlaWdu
LWV2dGNobiAqLw0KPj4gKyAgICAgICAgICAgIHhlbixldnRjaG4gPSA8MHhhICZlYzE+Ow0KPj4g
KyAgICAgICAgfTsNCj4+ICsNCj4+ICsgICAgICAgIGVjMzogZXZ0Y2huQDMgew0KPj4gKyAgICAg
ICAgICAgIGNvbXBhdGlibGUgPSAieGVuLGV2dGNobi12MSI7DQo+PiArICAgICAgICAgICAgeGVu
LGV2dGNobiA9IDwweGIgJmVjNT47DQo+PiArICAgICAgICB9Ow0KPj4gKw0KPj4gKyAgICAgICAg
ZWM0OiBldnRjaG5ANCB7DQo+PiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ4ZW4sZXZ0Y2hu
LXYxIjsNCj4+ICsgICAgICAgICAgICB4ZW4sZXZ0Y2huID0gPDB4YyAmZWM2PjsNCj4+ICsgICAg
ICAgIH07DQo+PiAgICAgIH07DQo+PiAgICAgICAgZG9tVTIgew0KPj4gQEAgLTI5Niw2ICszNDUs
MTggQEAgY2hvc2VuIHsNCj4+ICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm11bHRpYm9vdCxy
YW1kaXNrIiwgIm11bHRpYm9vdCxtb2R1bGUiOw0KPj4gICAgICAgICAgICAgIHJlZyA9IDwweDAg
MHg0ZDAwMDAwMCAweGZmZmZmZj47DQo+PiAgICAgICAgICB9Ow0KPj4gKw0KPj4gKyAgICAgICAg
Lyogb25lIHN1Yi1ub2RlIHBlciBsb2NhbCBldmVudCBjaGFubmVsICovDQo+PiArICAgICAgICBl
YzU6IGV2dGNobkA1IHsNCj4+ICsgICAgICAgICAgICBjb21wYXRpYmxlID0gInhlbixldnRjaG4t
djEiOw0KPj4gKyAgICAgICAgICAgIC8qIGxvY2FsLWV2dGNobiBsaW5rLXRvLWZvcmVpZ24tZXZ0
Y2huICovDQo+PiArICAgICAgICAgICAgeGVuLGV2dGNobiA9IDwweGIgJmVjMz47DQo+PiArICAg
ICAgICB9Ow0KPj4gKw0KPj4gKyAgICAgICAgZWM2OiBldnRjaG5ANiB7DQo+PiArICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJ4ZW4sZXZ0Y2huLXYxIjsNCj4+ICsgICAgICAgICAgICB4ZW4sZXZ0
Y2huID0gPDB4ZCAmZWM0PjsNCj4+ICsgICAgICAgIH07DQo+PiAgICAgIH07DQo+PiAgfTsNCj4+
ICBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJt
L2RvbWFpbl9idWlsZC5jDQo+PiBpbmRleCAxMWE4YzZiOGI1Li41MTAxYmNhOTc5IDEwMDY0NA0K
Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+PiArKysgYi94ZW4vYXJjaC9h
cm0vZG9tYWluX2J1aWxkLmMNCj4+IEBAIC0zMDUyLDYgKzMwNTIsMTQxIEBAIHZvaWQgX19pbml0
IGV2dGNobl9hbGxvY2F0ZShzdHJ1Y3QgZG9tYWluICpkKQ0KPj4gICAgICBkLT5hcmNoLmh2bS5w
YXJhbXNbSFZNX1BBUkFNX0NBTExCQUNLX0lSUV0gPSB2YWw7DQo+PiAgfQ0KPj4gICtzdGF0aWMg
Y29uc3Qgdm9pZCAqX19pbml0IGdldF9ldnRjaG5fZHRfcHJvcGVydHkoDQo+PiArICAgICAgICBj
b25zdCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKm5wKQ0KPj4gK3sNCj4+ICsgICAgY29uc3Qgdm9p
ZCAqcHJvcCA9IE5VTEw7DQo+PiArICAgIHVpbnQzMl90IGxlbjsNCj4+ICsNCj4+ICsgICAgcHJv
cCA9IGR0X2dldF9wcm9wZXJ0eShucCwgInhlbixldnRjaG4iLCAmbGVuKTsNCj4+ICsgICAgaWYg
KCAhcHJvcCApDQo+PiArICAgICAgICByZXR1cm4gTlVMTDsNCj4+ICsNCj4+ICsgICAgaWYgKCAh
bGVuICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgInhlbixldnRj
aG4gcHJvcGVydHkgY2Fubm90IGJlIGVtcHR5LlxuIikNCj4gDQo+IExvb2tpbmcgYXQgdGhlIGNh
bGxlcnMsIHRoZXkgYWxsIGFzc3VtZSB0aGF0IHRoZXJlIGlzIGVub3VnaCBjZWxscyBpbiB0aGUg
cHJvcGVydHkuIFNvIEkgdGhpbmsgeW91IHNob3VsZCBjaGVjayB0aGUgc2l6ZSBhcyB3ZWxsLg0K
DQpBY2ssIA0KPiANCj4+ICsgICAgICAgIHJldHVybiBFUlJfUFRSKC1FSU5WQUwpOw0KPj4gKyAg
ICB9DQo+PiArDQo+PiArICAgIHJldHVybiBwcm9wOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMg
aW50IF9faW5pdCBhbGxvY2F0ZV9kb21haW5fZXZ0Y2huKGNvbnN0IHN0cnVjdCBkdF9kZXZpY2Vf
bm9kZSAqbm9kZSkNCj4+ICt7DQo+PiArICAgIGNvbnN0IHZvaWQgKnByb3AgPSBOVUxMOw0KPj4g
KyAgICBjb25zdCBfX2JlMzIgKmNlbGw7DQo+PiArICAgIHVpbnQzMl90IGRvbVUxX3BvcnQsIGRv
bVUyX3BvcnQsIHJlbW90ZV9waGFuZGxlOw0KPj4gKyAgICBjb25zdCBzdHJ1Y3QgZHRfZGV2aWNl
X25vZGUgKmV2dGNobl9ub2RlLCAqcmVtb3RlX25vZGU7DQo+PiArICAgIHN0cnVjdCBldnRjaG5f
YWxsb2NfdW5ib3VuZCBhbGxvY191bmJvdW5kOw0KPj4gKyAgICBzdHJ1Y3QgZXZ0Y2huX2JpbmRf
aW50ZXJkb21haW4gYmluZF9pbnRlcmRvbWFpbjsNCj4+ICsgICAgaW50IHJjOw0KPj4gKw0KPj4g
KyAgICBkdF9mb3JfZWFjaF9jaGlsZF9ub2RlKG5vZGUsIGV2dGNobl9ub2RlKQ0KPj4gKyAgICB7
DQo+PiArICAgICAgICBzdHJ1Y3QgZG9tYWluICpkLCAqZDEgPSBOVUxMLCAqZDIgPSBOVUxMOw0K
Pj4gKw0KPj4gKyAgICAgICAgaWYgKCAhZHRfZGV2aWNlX2lzX2NvbXBhdGlibGUoZXZ0Y2huX25v
ZGUsICJ4ZW4sZXZ0Y2huLXYxIikgKQ0KPj4gKyAgICAgICAgICAgIGNvbnRpbnVlOw0KPj4gKw0K
Pj4gKyAgICAgICAgcHJvcCA9IGdldF9ldnRjaG5fZHRfcHJvcGVydHkoZXZ0Y2huX25vZGUpOw0K
Pj4gKyAgICAgICAgLyogSWYgdGhlIHByb3BlcnR5IGlzIG5vdCBmb3VuZCwgcmV0dXJuIHdpdGhv
dXQgZXJyb3JzICovDQo+IA0KPiBGcm9tIHRoZSBiaW5kaW5nIGRlc2NyaXB0aW9uLCB0aGUgcHJv
cGVydHkgaXMgbm90IG9wdGlvbmFsLiBTbyBkbyB3ZSB3YW50IHRvIGlnbm9yZSB0aGUgZXJyb3I/
IElmIHlvdSB0cmVhdCBpdCBhcyBhbiBlcnJvciwgdGhlbiAuLi4NCg0KT2suIEkgd2lsbCB0cmVh
dCBpdCBhcyBlbiBlcnJvci4NCj4gDQo+PiArICAgICAgICBpZiAoICFwcm9wIHx8IElTX0VSUihw
cm9wKSApDQo+PiArICAgICAgICAgICAgcmV0dXJuIElTX0VSUihwcm9wKSA/IFBUUl9FUlIocHJv
cCkgOiAwOw0KPiANCj4gLi4uIHlvdSBjb3VsZCByZXR1cm4gRVJSX1BUUigtRU5PTUVNKSBpbnN0
ZWFkIG9mIE5VTEwgYW5kIHRoZW4gc2ltcGxpZnkgdGhpcyBjb2RlIHdpdGg6DQoNCkFjay4gDQo+
IA0KPj4gKw0KPj4gKyAgICAgICAgY2VsbCA9IChjb25zdCBfX2JlMzIgKilwcm9wOw0KPiANCj4g
cHJvcCBpcyBhIHZvaWQgcG9pbnRlci4gU28gdGhlIGNhc3QgaXMgdW5uZWNlc3NhcnkuDQoNCkFj
ay4gDQo+IA0KPj4gKyAgICAgICAgZG9tVTFfcG9ydCA9IGR0X25leHRfY2VsbCgxLCAmY2VsbCk7
DQo+PiArICAgICAgICByZW1vdGVfcGhhbmRsZSA9IGR0X25leHRfY2VsbCgxLCAmY2VsbCk7DQo+
IFRoZSBjb2RlIGlzIGFsc28gZHVwbGljYXRlZCBiZWxvdyBmb3IgdGhlIHJlbW90ZSBwb3J0LiBJ
IHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciBpZiB0aGlzIGlzIHBhcnQgb2YgeW91ciBoZWxwZXIg
Z2V0X2V2dGNobl9kdF9wcm9wZXJ0eSgpLg0KDQpBY2sgLg0KPiANCj4+ICsNCj4+ICsgICAgICAg
IHJlbW90ZV9ub2RlID0gZHRfZmluZF9ub2RlX2J5X3BoYW5kbGUocmVtb3RlX3BoYW5kbGUpOw0K
Pj4gKyAgICAgICAgaWYgKCAhcmVtb3RlX25vZGUgKQ0KPj4gKyAgICAgICAgew0KPj4gKyAgICAg
ICAgICAgIHByaW50ayhYRU5MT0dfRVJSDQo+PiArICAgICAgICAgICAgICAgICAgICJldnRjaG46
IGNvdWxkIG5vdCBmaW5kIHJlbW90ZSBldnRjaG4gcGhhbmRsZVxuIik7DQo+PiArICAgICAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7DQo+PiArICAgICAgICB9DQo+PiArDQo+PiArICAgICAgICBwcm9w
ID0gZ2V0X2V2dGNobl9kdF9wcm9wZXJ0eShyZW1vdGVfbm9kZSk7DQo+PiArICAgICAgICAvKiBJ
ZiB0aGUgcHJvcGVydHkgaXMgbm90IGZvdW5kLCByZXR1cm4gd2l0aG91dCBlcnJvcnMgKi8NCj4+
ICsgICAgICAgIGlmICggIXByb3AgfHwgSVNfRVJSKHByb3ApICkNCj4+ICsgICAgICAgICAgICBy
ZXR1cm4gSVNfRVJSKHByb3ApID8gUFRSX0VSUihwcm9wKSA6IDA7DQo+PiArDQo+PiArICAgICAg
ICBjZWxsID0gKGNvbnN0IF9fYmUzMiAqKXByb3A7DQo+PiArICAgICAgICBkb21VMl9wb3J0ID0g
ZHRfbmV4dF9jZWxsKDEsICZjZWxsKTsNCj4+ICsgICAgICAgIHJlbW90ZV9waGFuZGxlID0gZHRf
bmV4dF9jZWxsKDEsICZjZWxsKTsNCj4+ICsNCj4+ICsgICAgICAgIGlmICggZXZ0Y2huX25vZGUt
PnBoYW5kbGUgIT0gcmVtb3RlX3BoYW5kbGUgKQ0KPj4gKyAgICAgICAgew0KPj4gKyAgICAgICAg
ICAgIHByaW50ayhYRU5MT0dfRVJSICJ4ZW4sZXZ0Y2huIHByb3BlcnR5IGlzIG5vdCBzZXR1cCBj
b3JyZWN0bHkuXG4iKTsNCj4+ICsgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+ICsgICAg
ICAgIH0NCj4+ICsNCj4+ICsgICAgICAgIGZvcl9lYWNoX2RvbWFpbiAoIGQgKQ0KPj4gKyAgICAg
ICAgew0KPj4gKyAgICAgICAgICAgIGlmICggZC0+YXJjaC5ub2RlID09IG5vZGUgKQ0KPj4gKyAg
ICAgICAgICAgIHsNCj4+ICsgICAgICAgICAgICAgICAgZDEgPSBkOw0KPj4gKyAgICAgICAgICAg
ICAgICBjb250aW51ZTsNCj4+ICsgICAgICAgICAgICB9DQo+PiArICAgICAgICAgICAgaWYgKCBk
LT5hcmNoLm5vZGUgPT0gZHRfZ2V0X3BhcmVudChyZW1vdGVfbm9kZSkgKQ0KPj4gKyAgICAgICAg
ICAgICAgICBkMiA9IGQ7DQo+PiArICAgICAgICB9DQo+IA0KPiBUaGUgbG9vcCBjb3VsZCBiZSBh
dm9pZGVkIGlmIHlvdSBzdGFzaCB0aGUgZG9taWQgaW4gdGhlIGZpZWxkICd1c2VkX2J5JyBvZiB0
aGUgZGV2aWNlLXRyZWUgbm9kZSB3aGVuIHRoZSBkb21haW4gaXMgY3JlYXRlZC4NCg0KT2suIEkg
d2lsbCB1c2VkIHRoZSDigJx1c2VkX2J54oCdIHRvIHN0b3JlIHRoZSBkb21pZC4NCj4gDQo+PiAr
DQo+PiArICAgICAgICBpZiAoICFkMSAmJiBkdF9kZXZpY2VfaXNfY29tcGF0aWJsZShub2RlLCAi
bXVsdGlib290LGtlcm5lbCIpICkNCj4+ICsgICAgICAgICAgICBkMSA9IGhhcmR3YXJlX2RvbWFp
bjsNCj4+ICsNCj4+ICsgICAgICAgIGlmICggIWQyICYmIGR0X2RldmljZV9pc19jb21wYXRpYmxl
KGR0X2dldF9wYXJlbnQocmVtb3RlX25vZGUpLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIm11bHRpYm9vdCxrZXJuZWwiKSApDQo+PiArICAgICAgICAg
ICAgZDIgPSBoYXJkd2FyZV9kb21haW47DQo+IA0KPiBBbnkgcGFydGljdWxhciByZWFzb24gdG8g
aGFuZGxlIHRoZSBoYXJkd2FyZSBkb21haW4gZGlmZmVyZW50bHk/DQoNCkFzIEkgaGF2ZSBub3Qg
c2V0IHRoZSAiZC0+YXJjaC5ub2Rl4oCdIGZvciBod2RvbSB0aGF0IHdoeSB0aGVyZSBpcyBkaWZm
ZXJlbnRseSBoYW5kbGluZyBmb3IgaHdkb20uDQpJIHdpbGwgdHJ5IHRvIHVzZSB0aGUg4oCcdXNl
ZF9ieeKAnSBhbmQgd2lsbCBhdm9pZCB0aGlzIGhhbmRsaW5nLg0KDQo+IA0KPj4gKw0KPj4gKyAg
ICAgICAgaWYgKCAhZDEgfHwgIWQyICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAgICAgICBw
cmludGsoWEVOTE9HX0VSUiAiZXZ0Y2huOiBjb3VsZCBub3QgZmluZCBkb21haW5zXG4iICk7DQo+
PiArICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+PiArICAgICAgICB9DQo+PiArDQo+PiAr
ICAgICAgICBhbGxvY191bmJvdW5kLmRvbSA9IGQxLT5kb21haW5faWQ7DQo+PiArICAgICAgICBh
bGxvY191bmJvdW5kLnJlbW90ZV9kb20gPSBkMi0+ZG9tYWluX2lkOw0KPj4gKw0KPj4gKyAgICAg
ICAgcmMgPSBldnRjaG5fYWxsb2NfdW5ib3VuZCgmYWxsb2NfdW5ib3VuZCwgZG9tVTFfcG9ydCk7
DQo+PiArICAgICAgICBpZiAoIHJjIDwgMCAmJiByYyAhPSAtRUJVU1kgKQ0KPiANCj4gUGxlYXNl
IGV4cGxhaW4gaW4gYSBjb21tZW50IHdoeSB5b3Ugd2FudCB0byBoYW5kbGUgLUVCVVNZIGRpZmZl
cmVudGx5Lg0KDQotRUJVU1kgaXMgdXNlZCB0byBjaGVjayBpZiBldnRjaG4gaXMgbm90IGFscmVh
ZHkgY3JlYXRlZCB3aGlsZSB3ZSBzY2FubmluZw0KdGhlIGV2dGNobiBkdCBub2Rlcy4NCg0KPiAN
Cj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUg0KPj4gKyAg
ICAgICAgICAgICAgICAgICAiZXZ0Y2huX2FsbG9jX3VuYm91bmQoKSBmYWlsdXJlIChFcnJvciAl
ZCkgXG4iLCByYyk7DQo+PiArICAgICAgICAgICAgcmV0dXJuIHJjOw0KPj4gKyAgICAgICAgfQ0K
Pj4gKw0KPj4gKyAgICAgICAgYmluZF9pbnRlcmRvbWFpbi5yZW1vdGVfZG9tICA9IGQxLT5kb21h
aW5faWQ7DQo+PiArICAgICAgICBiaW5kX2ludGVyZG9tYWluLnJlbW90ZV9wb3J0ID0gZG9tVTFf
cG9ydDsNCj4+ICsNCj4+ICsgICAgICAgIHJjID0gZXZ0Y2huX2JpbmRfaW50ZXJkb21haW4oJmJp
bmRfaW50ZXJkb21haW4sIGQyLCBkb21VMl9wb3J0KTsNCj4+ICsgICAgICAgIGlmICggcmMgPCAw
ICYmIHJjICE9IC1FQlVTWSApDQo+IA0KPiBBRkFJVSwgRUJVU1kgb25seSB0ZWxscyB5b3UgdGhl
IHBvcnQgaXMgYmVlbiB1c2VkLiBJdCBkb2Vzbid0IHRlbGwgeW91IHRoZSBsaW5rIGlzIHRoZSBz
YW1lLiBTbyBJIHRoaW5rIHlvdSB3YW50IHRvIGFsc28gY29uZmlybSB0aGF0IHRvIGF2b2lkIHRv
IGNvbnRpbnVpbmcgd2l0aCB0aGUgd3Jvbmcgc2V0dXAuDQoNCkFjay4gDQo+IA0KPj4gKyAgICAg
ICAgew0KPj4gKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSDQo+PiArICAgICAgICAgICAg
ICAgICAgICJldnRjaG5fYmluZF9pbnRlcmRvbWFpbigpIGZhaWx1cmUgKEVycm9yICVkKSBcbiIs
IHJjKTsNCj4+ICsgICAgICAgICAgICByZXR1cm4gcmM7DQo+PiArICAgICAgICB9DQo+PiArICAg
IH0NCj4+ICsNCj4+ICsgICAgcmV0dXJuIDA7DQo+PiArfQ0KPj4gKw0KPj4gK3ZvaWQgX19pbml0
IGFsbG9jYXRlX3N0YXRpY19ldnRjaG4odm9pZCkNCj4+ICt7DQo+PiArICAgIHN0cnVjdCBkdF9k
ZXZpY2Vfbm9kZSAqbm9kZTsNCj4gDQo+IEFGQUlDVCwgYWxsIHRoZSB1c2VycyBiZWxvdyBjYW4g
ZGVhbCB3aXRoIGNvbnN0aXNmaWVkIG5vZGUuIFNvIEkgdGhpbmsgeW91IHdhbnQgdG8gYWRkICdj
b25zdCcgaGVyZS4NCg0KQWNrLg0KPiANCj4+ICsgICAgY29uc3Qgc3RydWN0IGR0X2RldmljZV9u
b2RlICpjaG9zZW4gPSBkdF9maW5kX25vZGVfYnlfcGF0aCgiL2Nob3NlbiIpOw0KPj4gKw0KPj4g
KyAgICBCVUdfT04oY2hvc2VuID09IE5VTEwpOw0KPj4gKyAgICBkdF9mb3JfZWFjaF9jaGlsZF9u
b2RlKGNob3Nlbiwgbm9kZSkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgaWYgKCBkdF9kZXZpY2Vf
aXNfY29tcGF0aWJsZShub2RlLCAieGVuLGRvbWFpbiIpIHx8DQo+PiArICAgICAgICAgICAgIGR0
X2RldmljZV9pc19jb21wYXRpYmxlKG5vZGUsICJtdWx0aWJvb3Qsa2VybmVsIikgKQ0KPj4gKyAg
ICAgICAgew0KPj4gKyAgICAgICAgICAgIGlmICggYWxsb2NhdGVfZG9tYWluX2V2dGNobihub2Rl
KSAhPSAwICkNCj4+ICsgICAgICAgICAgICAgICAgcGFuaWMoIkNvdWxkIG5vdCBzZXQgdXAgZG9t
YWlucyBldnRjaG5cbiIpOw0KPj4gKyAgICAgICAgfQ0KPj4gKyAgICB9DQo+PiArfQ0KPj4gKw0K
Pj4gIHN0YXRpYyB2b2lkIF9faW5pdCBmaW5kX2dudHRhYl9yZWdpb24oc3RydWN0IGRvbWFpbiAq
ZCwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBrZXJu
ZWxfaW5mbyAqa2luZm8pDQo+PiAgew0KPj4gQEAgLTMzNTgsNiArMzQ5Myw3IEBAIHZvaWQgX19p
bml0IGNyZWF0ZV9kb21Vcyh2b2lkKQ0KPj4gICAgICAgICAgICAgIHBhbmljKCJFcnJvciBjcmVh
dGluZyBkb21haW4gJXNcbiIsIGR0X25vZGVfbmFtZShub2RlKSk7DQo+PiAgICAgICAgICAgIGQt
PmlzX2NvbnNvbGUgPSB0cnVlOw0KPj4gKyAgICAgICAgZC0+YXJjaC5ub2RlID0gbm9kZTsNCj4g
DQo+IElmIHlvdSBmb2xsb3cgbXkgc3VnZ2VzdGlvbiBhYm92ZSwgdGhpcyBzaG91bGQgbm90IGJl
IG5lY2Vzc2FyeS4gSG93ZXZlciwgaWYgdGhpcyBpcyBzdGlsbCBuZWVkZWQgZm9yIHNvbWUgcmVh
c29uLCB0aGVuIEkgdGhpbmsgd2Ugc2hvdWxkIGFsc28gc2V0IGQtPmFyY2gubm9kZSBmb3IgdGhl
IEhhcmR3YXJlIERvbWFpbiBhbmQgLi4uDQoNCkFjay4gDQo+IA0KPj4gICAgICAgICAgICBpZiAo
IGNvbnN0cnVjdF9kb21VKGQsIG5vZGUpICE9IDAgKQ0KPj4gICAgICAgICAgICAgIHBhbmljKCJD
b3VsZCBub3Qgc2V0IHVwIGRvbWFpbiAlc1xuIiwgZHRfbm9kZV9uYW1lKG5vZGUpKTsNCj4+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZG9tYWluLmggYi94ZW4vYXJjaC9h
cm0vaW5jbHVkZS9hc20vZG9tYWluLmgNCj4+IGluZGV4IGNkOWNlMTliNGIuLjUxMTkyYjI4ZWUg
MTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZG9tYWluLmgNCj4+ICsr
KyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9kb21haW4uaA0KPj4gQEAgLTEwNSw2ICsxMDUs
NyBAQCBzdHJ1Y3QgYXJjaF9kb21haW4NCj4+ICAjZW5kaWYNCj4+ICAgICAgICBib29sIGRpcmVj
dG1hcDsNCj4+ICsgICAgc3RydWN0IGR0X2RldmljZV9ub2RlICpub2RlOw0KPiANCj4gLi4uIHRo
aXMgc2hvdWxkIGJlIGNvbnN0IGFzIHRoZSBub2RlIHNob3VsZG4ndCBiZSBtb2RpZmlhYmxlLg0K
DQpBY2suIA0KDQpSZWdhcmRzLA0KUmFodWw=

