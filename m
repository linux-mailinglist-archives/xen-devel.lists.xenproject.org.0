Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB66C60FCBB
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 18:13:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431105.683660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo5V0-0002Ql-Nb; Thu, 27 Oct 2022 16:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431105.683660; Thu, 27 Oct 2022 16:12:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo5V0-0002OW-KX; Thu, 27 Oct 2022 16:12:54 +0000
Received: by outflank-mailman (input) for mailman id 431105;
 Thu, 27 Oct 2022 16:12:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WPLX=24=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oo5Uz-0002OP-8S
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 16:12:53 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2045.outbound.protection.outlook.com [40.107.249.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3471218b-5612-11ed-91b5-6bf2151ebd3b;
 Thu, 27 Oct 2022 18:12:51 +0200 (CEST)
Received: from AM6PR08CA0003.eurprd08.prod.outlook.com (2603:10a6:20b:b2::15)
 by DBAPR08MB5845.eurprd08.prod.outlook.com (2603:10a6:10:1a5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.27; Thu, 27 Oct
 2022 16:12:40 +0000
Received: from AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::9b) by AM6PR08CA0003.outlook.office365.com
 (2603:10a6:20b:b2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Thu, 27 Oct 2022 16:12:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT043.mail.protection.outlook.com (100.127.140.160) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Thu, 27 Oct 2022 16:12:40 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Thu, 27 Oct 2022 16:12:39 +0000
Received: from 96e75caddee2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 75336368-189A-4848-BAC4-17A035FEE336.1; 
 Thu, 27 Oct 2022 16:12:29 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 96e75caddee2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Oct 2022 16:12:29 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AS2PR08MB9872.eurprd08.prod.outlook.com (2603:10a6:20b:593::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Thu, 27 Oct
 2022 16:12:21 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::3120:4825:cfd7:e572]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::3120:4825:cfd7:e572%4]) with mapi id 15.20.5709.015; Thu, 27 Oct 2022
 16:12:21 +0000
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
X-Inumbo-ID: 3471218b-5612-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=nqPSWDR0+p/K7KLqCMFlNtChevDgD6VJHwihZVHGYkH1LHwDpNDoIMq2LVo/k7IdLpiztr6MfI1d4L/CtRzQFfGWjzqQu1UJEQGj2pqPftXeLizHoshRjJfzKT+FgLLMsD7sGXPs0d8t0sxl/HkWdALafuij6d+DWHZl9eDj2Yg+c4+71Y+hWWAHYDBqy3vZry19aZh9ZA1FVuFAEzkIikFvqmbLi6BQy9/JSIYBwrt9tsZamekMg0ynfLq0nngnclKiWEeb3V0+Y64N6IJIAAuQNiMqU+U3Yt3d1sMP/ZvhFmoCpKtx4drzBKwH1YlXNNH+UG+wABNMBikV3ueTQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQXFUjz6pUP2jOn1u7TPpY2+qa2Qni+KHtughFLBD+g=;
 b=WJ96zLdc2i/krZo77eBZH3c8UYvbPf2ppef0gsm+ew0cWyMmN7so35moKkW31/bqMit/vgHugc3vrDs5P/qxGU4m5Wv2Y/3vTc/fwMxio0rRlx2XQZZW8PvotAvlzSuoNIADgwHg6eRV0cDyeTDtCrtdlOel1J0vUSlrX2n2LfcaYpaAva+1ppIihFLSybRY2CXGMOa2+45sC6bu5hPfLulUWbUzTengdye8jyouXfQXhu5mbnrLTrDL0GYP6Fl2Xrfe1adTnoE2PovjvyeQ10dqMwSWRIa6jvBextJaKHNaQDuLzQqqKqdg3r95/bmZJfNeFIcbfpWmhnb/OXTWsQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQXFUjz6pUP2jOn1u7TPpY2+qa2Qni+KHtughFLBD+g=;
 b=Llhwq9RbsO1tHy4OeZywwBdpXD7Mkgau5iUkxBG6iSekBWGdTXOT3Dv1+cLf9Sg8Dgl5F3sUYnd9c/cNVEoUEZowOaFMbWh64FkQdIq1kqFq6wZAgvsUTsq359iydBC/XsyXU8hRXuhGdoEP3b3yD+AT4bGDjN8a+RxrtVsFoOY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 763fba3040961573
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J6wuwRuSFvVJz3hn9xP0mX7WvFVkTlpi16N561EQemczYIz/T4lmAnL+Qi2VlcP6cmof3dArZirsB9xT7w2WBQBKJDw51hb3913JSDiFIbA7Sl2q+60Fwxgu+H5rp6+QYP734y735Z33Dh1zAxC5xVAebHVKal0B/lb6QosfVkjvZM6rKmZdujx8wrfPji7HxvHL5M/o59tx/EcA1NSTXqYIAaUFyIPHtIWdcbYpU4dugFujWvvVu3bAsNsG99pzQZQXphsDg/7k7tA6R7lndIhBJzDYNB4Yn3XVBwoCchpr1iOBNDtQ0nhWOrLDyGi2QKQI6K4H1eEH46QyCiWJTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQXFUjz6pUP2jOn1u7TPpY2+qa2Qni+KHtughFLBD+g=;
 b=Nd9/H390Y0gvKv8SGf2n/+DMVoZMoqpUEmDfzg6EomxNH/0DM7F3Ua9TXC2SUvos5l5HiT3ei+OedIyg4o7qNUB2BTdEov7zDgY4cZrHZlhZbT6h1GvG6UuTD4w7NqHAFuCJyeSMNGgQ2QLWMd37R7Ga+B6B13CndT9O+Rf1+rZXOUFiduS1/YdYFtDWEQg0fSG/2x7ndvq8vL73I6JpNe0tUS3Lz3Csc33EJJeqz8x6zk9FYZvu73KwAKc053EIGTx2MotmTjqzMzUS1I99pXeaNPLEV0+uZlP+W4QQvpZzjJCmN7pt6ANvnBxXwROzA4wacSc4yk6y5YalSln93w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQXFUjz6pUP2jOn1u7TPpY2+qa2Qni+KHtughFLBD+g=;
 b=Llhwq9RbsO1tHy4OeZywwBdpXD7Mkgau5iUkxBG6iSekBWGdTXOT3Dv1+cLf9Sg8Dgl5F3sUYnd9c/cNVEoUEZowOaFMbWh64FkQdIq1kqFq6wZAgvsUTsq359iydBC/XsyXU8hRXuhGdoEP3b3yD+AT4bGDjN8a+RxrtVsFoOY=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Julien Grall <julien@xen.org>, Xen developer discussion
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <Michal.Orzel@arm.com>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: Re: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
Thread-Topic: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
Thread-Index: AQHY6T1VjOHHQJGN7kyXeL6pAIKNMa4grXIAgAAQBQCAAC3DgIABgBSA
Date: Thu, 27 Oct 2022 16:12:21 +0000
Message-ID: <3293BDA0-76E5-49E4-A695-B677F9B9AB57@arm.com>
References: <DD70007C-300F-44D3-B314-A5F8C4582CD3@arm.com>
 <75b7665f-66aa-2e11-35a0-edf20a9c0139@xen.org>
 <99E954B0-50F5-4D7B-A7D2-50D1B7B3657C@arm.com>
 <95470820-dc9d-dc3b-eb5f-b4db688fa5b1@amd.com>
In-Reply-To: <95470820-dc9d-dc3b-eb5f-b4db688fa5b1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|AS2PR08MB9872:EE_|AM7EUR03FT043:EE_|DBAPR08MB5845:EE_
X-MS-Office365-Filtering-Correlation-Id: feeaa752-bee6-41b1-a919-08dab8361266
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2Knn2kDS1Lpb8HHQoVppw+roL7ZbuHwSpbwOrAPDeiAcMQdPyPZguOhW4N58NLiKTw5NazrQt+FY1r/yxCqdI7tCVDLuZ/dYYZxiZtjxz3KqJJmjaIsoOAnWEKGM2eMN5SjlLwV6GGYBEMD3M5zPHluuzTgmA3ENnQHle+J1tIMn8Fwr7QEaHqCpUhWHZ622+PGe+2/G5kcil1Jp1xfq2a0nHwa0x0hzQtXpgmIpBViSYUtd4M/a6QyUCNdvc6ay+qy22hFekni05vBiFqBAr7L0syiC8a3lWVlzdKqyCwkLd2UrxW2JaTcMxqxpOzVNFvx6bit+Yj5SX3xjUlFvIX5h09Ha/Gfy46GCcdg3QZhawUaTlWSOrZjiFw4TKMNxHz7uSnqHtQA8NXr9vnujxroFCzZqa/abQtjgv8DGH3jjZVhhuDbmN7YtL+JK/17JcXnZWVFIBe83AeUEKgJBPOU6q1j7LLGX8bLt7xv9ECngdt1eCEyGDnjMx46lf4l82xyPSbcqcDl7oq+O2Nx5zVqKG1xzmfpaeENDSCT7Sr3M0ZSmtUuWL7i6BNKtTHdSrZkF7fhoMB6hmwBTpxP9joWQ9YjOJpG0mHK/HxDBOpiCweBVHD8HaHaKWNdFmiUk8I36G9InuU8uTKSllNPO3XkrJeGGszZNuw7QjerTShW8VqmKD3wac2Xz11fO3+D5aoHlkfZv2kCiAfjkke7vSyPQ8Xd7HD0+mvv4NN0O3zjiAE4Po87HzqG1yeLKLpTkx4ZffACkeShoujbo+iQA/62WhCk3RMsec+FB480qUwJdeePoRwQ8cgHLIXb4+MZ6c262wxuXHUHS9jLJuUP9kw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(451199015)(2616005)(26005)(186003)(478600001)(6512007)(53546011)(6506007)(71200400001)(91956017)(2906002)(66946007)(4326008)(66556008)(83380400001)(6486002)(66446008)(7416002)(54906003)(316002)(8936002)(8676002)(6916009)(5660300002)(41300700001)(76116006)(66476007)(64756008)(36756003)(86362001)(33656002)(38100700002)(38070700005)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B629BF06008634DA854D6CA33A88199@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9872
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bf51a69c-94ac-4e42-4933-08dab836076b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XMiInCxjM0Vn/PymhETCWQmlPptaMBl4HNEFdXxCsL2CiLZzyXTXsXrDUdZeLTSQ/B6Tu15IafevkCFihaYAd5xjB3Bo0Rm3JW+Jm5wnMbdDUqr5p52lp/4enpuQ/3YWcauidAjlgVOJHNg85g1cJljGwP1cYiEIy1qAYF6dkG/slaMYS1qZ4OpQ6AijMNracPo5l9B/LwYU3fuwkrthJrKPyLsjZh6hlI9M5mN8/CPQF3nOwAvZj67e/LQhODxqWbEaCtSnTT3EYd9dWSeEaFeXi4Jl5n0W4EksddjyhJ/NM1WtncNPCTduDxAlccMqD+qYb9c5qoCk2/Stmxk4gGljUqWzlKJ8T2Bh+DSE6ldt700kOMTQEZIXxvtoSpZZNS3K/4kIIupeeDIBSXg8bTuY/I7smj9TUZqxF6fsMq0HKp5Q7EGSSuZg+4epv3uqzbDPJ1ZF3QgE7/7nQ4kBH8z+G2vg7QV2J9i76qDeHN3son0x6MkMRlHV699wiIFK/sqsRG53RQwiKchUqti5c0DEwQmLPvkJz7zmKNjaFfErjWTcuPjugDVHPKfZG/Cib0emPYJa0IVaQbHcZI2ph6YSisbsaFbhrTMx7nyGS47yJc+ejt3TC/kbsxaTHSLg2O7HH3Z1oOBVz5dG4FkP2eGdJrg2t52dsEtReTQh4IE4UAEXCNwEm0lBQABNcYWHizVggWTxn9jMSG4HHxIURRf34RmTg9WJJFWU7VXf0yD+fD65cgxXr+bBTqSbdqLxNt2FfI+Qj6Ckvr4ugqI9xQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199015)(46966006)(36840700001)(40470700004)(81166007)(336012)(83380400001)(47076005)(2616005)(186003)(356005)(86362001)(36860700001)(53546011)(82740400003)(40460700003)(8936002)(5660300002)(6862004)(4326008)(40480700001)(82310400005)(54906003)(6512007)(70206006)(6506007)(70586007)(316002)(478600001)(8676002)(41300700001)(107886003)(6486002)(36756003)(33656002)(2906002)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 16:12:40.2027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: feeaa752-bee6-41b1-a919-08dab8361266
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5845

SGkgTWljaGFsLA0KDQo+IE9uIDI2IE9jdCAyMDIyLCBhdCA2OjE3IHBtLCBNaWNoYWwgT3J6ZWwg
PG1pY2hhbC5vcnplbEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IEhpIFJhaHVsLA0KPiANCj4gT24g
MjYvMTAvMjAyMiAxNjozMywgUmFodWwgU2luZ2ggd3JvdGU6DQo+PiANCj4+IA0KPj4gSGkgSnVs
aWVuLA0KPj4gDQo+Pj4gT24gMjYgT2N0IDIwMjIsIGF0IDI6MzYgcG0sIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+IA0KPj4+IA0KPj4+IE9uIDI2LzEwLzIw
MjIgMTQ6MTcsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+PiBIaSBBbGwsDQo+Pj4gDQo+Pj4gSGkg
UmFodWwsDQo+Pj4gDQo+Pj4+IEF0IEFybSwgd2Ugc3RhcnRlZCB0byBpbXBsZW1lbnQgdGhlIFBP
QyB0byBzdXBwb3J0IDIgbGV2ZWxzIG9mIHBhZ2UgdGFibGVzL25lc3RlZCB0cmFuc2xhdGlvbiBp
biBTTU1VdjMuDQo+Pj4+IFRvIHN1cHBvcnQgbmVzdGVkIHRyYW5zbGF0aW9uIGZvciBndWVzdCBP
UyBYZW4gbmVlZHMgdG8gZXhwb3NlIHRoZSB2aXJ0dWFsIElPTU1VLiBJZiB3ZSBwYXNzdGhyb3Vn
aCB0aGUNCj4+Pj4gZGV2aWNlIHRvIHRoZSBndWVzdCB0aGF0IGlzIGJlaGluZCBhbiBJT01NVSBh
bmQgdmlydHVhbCBJT01NVSBpcyBlbmFibGVkIGZvciB0aGUgZ3Vlc3QgdGhlcmUgaXMgYSBuZWVk
IHRvDQo+Pj4+IGFkZCBJT01NVSBiaW5kaW5nIGZvciB0aGUgZGV2aWNlIGluIHRoZSBwYXNzdGhy
b3VnaCBub2RlIGFzIHBlciBbMV0uIFRoaXMgZW1haWwgaXMgdG8gZ2V0IGFuIGFncmVlbWVudCBv
bg0KPj4+PiBob3cgdG8gYWRkIHRoZSBJT01NVSBiaW5kaW5nIGZvciBndWVzdCBPUy4NCj4+Pj4g
QmVmb3JlIEkgd2lsbCBleHBsYWluIGhvdyB0byBhZGQgdGhlIElPTU1VIGJpbmRpbmcgbGV0IG1l
IGdpdmUgYSBicmllZiBvdmVydmlldyBvZiBob3cgd2Ugd2lsbCBhZGQgc3VwcG9ydCBmb3Igdmly
dHVhbA0KPj4+PiBJT01NVSBvbiBBcm0uIEluIG9yZGVyIHRvIGltcGxlbWVudCB2aXJ0dWFsIElP
TU1VIFhlbiBuZWVkIFNNTVV2MyBOZXN0ZWQgdHJhbnNsYXRpb24gc3VwcG9ydC4gU01NVXYzIGhh
cmR3YXJlDQo+Pj4+IHN1cHBvcnRzIHR3byBzdGFnZXMgb2YgdHJhbnNsYXRpb24uIEVhY2ggc3Rh
Z2Ugb2YgdHJhbnNsYXRpb24gY2FuIGJlIGluZGVwZW5kZW50bHkgZW5hYmxlZC4gQW4gaW5jb21p
bmcgYWRkcmVzcyBpcyBsb2dpY2FsbHkNCj4+Pj4gdHJhbnNsYXRlZCBmcm9tIFZBIHRvIElQQSBp
biBzdGFnZSAxLCB0aGVuIHRoZSBJUEEgaXMgaW5wdXQgdG8gc3RhZ2UgMiB3aGljaCB0cmFuc2xh
dGVzIHRoZSBJUEEgdG8gdGhlIG91dHB1dCBQQS4gU3RhZ2UgMSBpcw0KPj4+PiBpbnRlbmRlZCB0
byBiZSB1c2VkIGJ5IGEgc29mdHdhcmUgZW50aXR5KCBHdWVzdCBPUykgdG8gcHJvdmlkZSBpc29s
YXRpb24gb3IgdHJhbnNsYXRpb24gdG8gYnVmZmVycyB3aXRoaW4gdGhlIGVudGl0eSwgZm9yIGV4
YW1wbGUsDQo+Pj4+IERNQSBpc29sYXRpb24gd2l0aGluIGFuIE9TLiBTdGFnZSAyIGlzIGludGVu
ZGVkIHRvIGJlIGF2YWlsYWJsZSBpbiBzeXN0ZW1zIHN1cHBvcnRpbmcgdGhlIFZpcnR1YWxpemF0
aW9uIEV4dGVuc2lvbnMgYW5kIGlzDQo+Pj4+IGludGVuZGVkIHRvIHZpcnR1YWxpemUgZGV2aWNl
IERNQSB0byBndWVzdCBWTSBhZGRyZXNzIHNwYWNlcy4gV2hlbiBib3RoIHN0YWdlIDEgYW5kIHN0
YWdlIDIgYXJlIGVuYWJsZWQsIHRoZSB0cmFuc2xhdGlvbg0KPj4+PiBjb25maWd1cmF0aW9uIGlz
IGNhbGxlZCBuZXN0aW5nLg0KPj4+PiBTdGFnZSAxIHRyYW5zbGF0aW9uIHN1cHBvcnQgaXMgcmVx
dWlyZWQgdG8gcHJvdmlkZSBpc29sYXRpb24gYmV0d2VlbiBkaWZmZXJlbnQgZGV2aWNlcyB3aXRo
aW4gdGhlIGd1ZXN0IE9TLiBYRU4gYWxyZWFkeSBzdXBwb3J0cw0KPj4+PiBTdGFnZSAyIHRyYW5z
bGF0aW9uIGJ1dCB0aGVyZSBpcyBubyBzdXBwb3J0IGZvciBTdGFnZSAxIHRyYW5zbGF0aW9uIGZv
ciBndWVzdHMuIFdlIHdpbGwgYWRkIHN1cHBvcnQgZm9yIGd1ZXN0cyB0byBjb25maWd1cmUNCj4+
Pj4gdGhlIFN0YWdlIDEgdHJhbnNpdGlvbiB2aWEgdmlydHVhbCBJT01NVS4gWEVOIHdpbGwgZW11
bGF0ZSB0aGUgU01NVSBoYXJkd2FyZSBhbmQgZXhwb3NlcyB0aGUgdmlydHVhbCBTTU1VIHRvIHRo
ZSBndWVzdC4NCj4+Pj4gR3Vlc3QgY2FuIHVzZSB0aGUgbmF0aXZlIFNNTVUgZHJpdmVyIHRvIGNv
bmZpZ3VyZSB0aGUgc3RhZ2UgMSB0cmFuc2xhdGlvbi4gV2hlbiB0aGUgZ3Vlc3QgY29uZmlndXJl
cyB0aGUgU01NVSBmb3IgU3RhZ2UgMSwNCj4+Pj4gWEVOIHdpbGwgdHJhcCB0aGUgYWNjZXNzIGFu
ZCBjb25maWd1cmUgdGhlIGhhcmR3YXJlIGFjY29yZGluZ2x5Lg0KPj4+PiBOb3cgYmFjayB0byB0
aGUgcXVlc3Rpb24gb2YgaG93IHdlIGNhbiBhZGQgdGhlIElPTU1VIGJpbmRpbmcgYmV0d2VlbiB0
aGUgdmlydHVhbCBJT01NVSBhbmQgdGhlIG1hc3RlciBkZXZpY2VzIHNvIHRoYXQNCj4+Pj4gZ3Vl
c3RzIGNhbiBjb25maWd1cmUgdGhlIElPTU1VIGNvcnJlY3RseS4gVGhlIHNvbHV0aW9uIHRoYXQg
SSBhbSBzdWdnZXN0aW5nIGlzIGFzIGJlbG93Og0KPj4+PiBGb3IgZG9tMCwgd2hpbGUgaGFuZGxp
bmcgdGhlIERUIG5vZGUoaGFuZGxlX25vZGUoKSkgWGVuIHdpbGwgcmVwbGFjZSB0aGUgcGhhbmRs
ZSBpbiB0aGUgImlvbW11cyIgcHJvcGVydHkgd2l0aCB0aGUgdmlydHVhbA0KPj4+PiBJT01NVSBu
b2RlIHBoYW5kbGUuDQo+Pj4gQmVsb3csIHlvdSBzYWlkIHRoYXQgZWFjaCBJT01NVXMgbWF5IGhh
dmUgYSBkaWZmZXJlbnQgSUQgc3BhY2UuIFNvIHNob3VsZG4ndCB3ZSBleHBvc2Ugb25lIHZJT01N
VSBwZXIgcElPTU1VPyBJZiBub3QsIGhvdyBkbyB5b3UgZXhwZWN0IHRoZSB1c2VyIHRvIHNwZWNp
ZnkgdGhlIG1hcHBpbmc/DQo+PiANCj4+IFllcyB5b3UgYXJlIHJpZ2h0IHdlIG5lZWQgdG8gY3Jl
YXRlIG9uZSB2SU9NTVUgcGVyIHBJT01NVSBmb3IgZG9tMC4gVGhpcyBhbHNvIGhlbHBzIGluIHRo
ZSBBQ1BJIGNhc2UNCj4+IHdoZXJlIHdlIGRvbuKAmXQgbmVlZCB0byBtb2RpZnkgdGhlIHRhYmxl
cyB0byBkZWxldGUgdGhlIHBJT01NVSBlbnRyaWVzIGFuZCBjcmVhdGUgb25lIHZJT01NVS4NCj4+
IEluIHRoaXMgY2FzZSwgbm8gbmVlZCB0byByZXBsYWNlIHRoZSBwaGFuZGxlIGFzIFhlbiBjcmVh
dGUgdGhlIHZJT01NVSB3aXRoIHRoZSBzYW1lIHBJT01NVQ0KPj4gcGhhbmRsZSBhbmQgc2FtZSBi
YXNlIGFkZHJlc3MuDQo+PiANCj4+IEZvciBkb21VIGd1ZXN0cyBvbmUgdklPTU1VIHBlciBndWVz
dCB3aWxsIGJlIGNyZWF0ZWQuDQo+PiANCj4+PiANCj4+Pj4gRm9yIGRvbVUgZ3Vlc3RzLCB3aGVu
IHBhc3N0aHJvdWdoIHRoZSBkZXZpY2UgdG8gdGhlIGd1ZXN0IGFzIHBlciBbMl0sICBhZGQgdGhl
IGJlbG93IHByb3BlcnR5IGluIHRoZSBwYXJ0aWFsIGRldmljZSB0cmVlDQo+Pj4+IG5vZGUgdGhh
dCBpcyByZXF1aXJlZCB0byBkZXNjcmliZSB0aGUgZ2VuZXJpYyBkZXZpY2UgdHJlZSBiaW5kaW5n
IGZvciBJT01NVXMgYW5kIHRoZWlyIG1hc3RlcihzKQ0KPj4+PiAiaW9tbXVzID0gPCAmbWFnaWNf
cGhhbmRsZSAweHZNYXN0ZXJJRD4NCj4+Pj4gICAgIOKAoiBtYWdpY19waGFuZGxlIHdpbGwgYmUg
dGhlIHBoYW5kbGUgKCB2SU9NTVUgcGhhbmRsZSBpbiB4bCkgIHRoYXQgd2lsbCBiZSBkb2N1bWVu
dGVkIHNvIHRoYXQgdGhlIHVzZXIgY2FuIHNldCB0aGF0IGluIHBhcnRpYWwgRFQgbm9kZSAoMHhm
ZGVhKS4NCj4+PiANCj4+PiBEb2VzIHRoaXMgbWVhbiBvbmx5IG9uZSBJT01NVSB3aWxsIGJlIHN1
cHBvcnRlZCBpbiB0aGUgZ3Vlc3Q/DQo+PiANCj4+IFllcy4NCj4+IA0KPj4+IA0KPj4+PiAgICAg
4oCiIHZNYXN0ZXJJRCB3aWxsIGJlIHRoZSB2aXJ0dWFsIG1hc3RlciBJRCB0aGF0IHRoZSB1c2Vy
IHdpbGwgcHJvdmlkZS4NCj4+Pj4gVGhlIHBhcnRpYWwgZGV2aWNlIHRyZWUgd2lsbCBsb29rIGxp
a2UgdGhpczoNCj4+Pj4gL2R0cy12MS87DQo+Pj4+IC8gew0KPj4+PiAgICAvKiAjKmNlbGxzIGFy
ZSBoZXJlIHRvIGtlZXAgRFRDIGhhcHB5ICovDQo+Pj4+ICAgICNhZGRyZXNzLWNlbGxzID0gPDI+
Ow0KPj4+PiAgICAjc2l6ZS1jZWxscyA9IDwyPjsNCj4+Pj4gICAgICBhbGlhc2VzIHsNCj4+Pj4g
ICAgICAgIG5ldCA9ICZtYWMwOw0KPj4+PiAgICB9Ow0KPj4+PiAgICAgIHBhc3N0aHJvdWdoIHsN
Cj4+Pj4gICAgICAgIGNvbXBhdGlibGUgPSAic2ltcGxlLWJ1cyI7DQo+Pj4+ICAgICAgICByYW5n
ZXM7DQo+Pj4+ICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsNCj4+Pj4gICAgICAgICNzaXpl
LWNlbGxzID0gPDI+Ow0KPj4+PiAgICAgICAgbWFjMDogZXRoZXJuZXRAMTAwMDAwMDAgew0KPj4+
PiAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiY2FseGVkYSxoYi14Z21hYyI7DQo+Pj4+ICAgICAg
ICAgICAgcmVnID0gPDAgMHgxMDAwMDAwMCAwIDB4MTAwMD47DQo+Pj4+ICAgICAgICAgICAgaW50
ZXJydXB0cyA9IDwwIDgwIDQgIDAgODEgNCAgMCA4MiA0PjsNCj4+Pj4gICAgICAgICAgIGlvbW11
cyA9IDwweGZkZWEgMHgwMT47DQo+Pj4+ICAgICAgICB9Ow0KPj4+PiAgICB9Ow0KPj4+PiB9Ow0K
Pj4+PiBJbiB4bC5jZmcgd2UgbmVlZCB0byBkZWZpbmUgYSBuZXcgb3B0aW9uIHRvIGluZm9ybSBY
ZW4gYWJvdXQgdk1hc3RlcklkIHRvIHBNYXN0ZXJJZCBtYXBwaW5nIGFuZCB0byB3aGljaCBJT01N
VSBkZXZpY2UgdGhpcw0KPj4+PiB0aGUgbWFzdGVyIGRldmljZSBpcyBjb25uZWN0ZWQgc28gdGhh
dCBYZW4gY2FuIGNvbmZpZ3VyZSB0aGUgcmlnaHQgSU9NTVUuIFRoaXMgaXMgcmVxdWlyZWQgaWYg
dGhlIHN5c3RlbSBoYXMgZGV2aWNlcyB0aGF0IGhhdmUNCj4+Pj4gdGhlIHNhbWUgbWFzdGVyIElE
IGJ1dCBiZWhpbmQgYSBkaWZmZXJlbnQgSU9NTVUuDQo+Pj4gDQo+Pj4gSW4geGwuY2ZnLCB3ZSBh
bHJlYWR5IHBhc3MgdGhlIGRldmljZS10cmVlIG5vZGUgcGF0aCB0byBwYXNzdGhyb3VnaC4gU28g
WGVuIHNob3VsZCBhbHJlYWR5IGhhdmUgYWxsIHRoZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgSU9N
TVUgYW5kIE1hc3Rlci1JRC4gU28gaXQgZG9lc24ndCBzZWVtIG5lY2Vzc2FyeSBmb3IgRGV2aWNl
LVRyZWUuDQo+Pj4gDQo+Pj4gRm9yIEFDUEksIEkgd291bGQgaGF2ZSBleHBlY3RlZCB0aGUgaW5m
b3JtYXRpb24gdG8gYmUgZm91bmQgaW4gdGhlIElPUkVRLg0KPj4+IA0KPj4+IFNvIGNhbiB5b3Ug
YWRkIG1vcmUgY29udGV4dCB3aHkgdGhpcyBpcyBuZWNlc3NhcnkgZm9yIGV2ZXJ5b25lPw0KPj4g
DQo+PiBXZSBoYXZlIGluZm9ybWF0aW9uIGZvciBJT01NVSBhbmQgTWFzdGVyLUlEIGJ1dCB3ZSBk
b27igJl0IGhhdmUgaW5mb3JtYXRpb24gZm9yIGxpbmtpbmcgdk1hc3Rlci1JRCB0byBwTWFzdGVy
LUlELg0KPj4gVGhlIGRldmljZSB0cmVlIG5vZGUgd2lsbCBiZSB1c2VkIHRvIGFzc2lnbiB0aGUg
ZGV2aWNlIHRvIHRoZSBndWVzdCBhbmQgY29uZmlndXJlIHRoZSBTdGFnZS0yIHRyYW5zbGF0aW9u
LiBHdWVzdCB3aWxsIHVzZSB0aGUNCj4+IHZNYXN0ZXItSUQgdG8gY29uZmlndXJlIHRoZSB2SU9N
TVUgZHVyaW5nIGJvb3QuIFhlbiBuZWVkcyBpbmZvcm1hdGlvbiB0byBsaW5rIHZNYXN0ZXItSUQg
dG8gcE1hc3Rlci1JRCB0byBjb25maWd1cmUNCj4+IHRoZSBjb3JyZXNwb25kaW5nIHBJT01NVS4g
QXMgSSBtZW50aW9uIHdlIG5lZWQgdk1hc3Rlci1JRCBpbiBjYXNlIGEgc3lzdGVtIGNvdWxkIGhh
dmUgMiBpZGVudGljYWwgTWFzdGVyLUlEIGJ1dA0KPj4gZWFjaCBvbmUgY29ubmVjdGVkIHRvIGEg
ZGlmZmVyZW50IFNNTVUgYW5kIGFzc2lnbmVkIHRvIHRoZSBndWVzdC4NCj4gDQo+IEkgdGhpbmsg
dGhlIHByb3Bvc2VkIHNvbHV0aW9uIHdvdWxkIHdvcmsgYW5kIEkgd291bGQganVzdCBsaWtlIHRv
IGNsZWFyIHNvbWUgaXNzdWVzLg0KPiANCj4gUGxlYXNlIGNvcnJlY3QgbWUgaWYgSSdtIHdyb25n
Og0KPiANCj4gSW4gdGhlIHhsIGNvbmZpZyBmaWxlIHdlIGFscmVhZHkgbmVlZCB0byBzcGVjaWZ5
IGR0ZGV2IHRvIHBvaW50IHRvIHRoZSBkZXZpY2UgcGF0aCBpbiBob3N0IGR0Yi4NCj4gSW4gdGhl
IHBhcnRpYWwgZGV2aWNlIHRyZWUgd2Ugc3BlY2lmeSB0aGUgdk1hc3RlcklkIGFzIHdlbGwgYXMg
bWFnaWMgcGhhbmRsZS4NCj4gSXNuJ3QgaXQgdGhhdCB3ZSBhbHJlYWR5IGhhdmUgYWxsIHRoZSBp
bmZvcm1hdGlvbiBuZWNlc3Nhcnkgd2l0aG91dCB0aGUgbmVlZCBmb3IgaW9tbXVfZGV2aWRfbWFw
Pw0KPiBGb3IgbWUgaXQgbG9va3MgbGlrZSB0aGUgcGFydGlhbCBkdGIgcHJvdmlkZXMgdk1hc3Rl
cklEIGFuZCBkdGRldiBwcm92aWRlcyBwTWFzdGVySUQgYXMgd2VsbCBhcyBwaHlzaWNhbCBwaGFu
ZGxlIHRvIFNNTVUuDQo+IA0KPiBIYXZpbmcgc2FpZCB0aGF0LCBJIGNhbiBhbHNvIHVuZGVyc3Rh
bmQgdGhhdCBzcGVjaWZ5aW5nIGV2ZXJ5dGhpbmcgaW4gb25lIHBsYWNlIHVzaW5nIGlvbW11X2Rl
dmlkX21hcCBjYW4gYmUgZWFzaWVyDQo+IGFuZCByZWR1Y2VzIHRoZSBuZWVkIGZvciBkZXZpY2Ug
dHJlZSBwYXJzaW5nLg0KPiANCj4gQXBhcnQgZnJvbSB0aGF0LCB3aGF0IGlzIHRoZSByZWFzb24g
b2YgZXhwb3Npbmcgb25seSBvbmUgdlNNTVUgdG8gZ3Vlc3QgaW5zdGVhZCBvZiBvbmUgdlNNTVUg
cGVyIHBTTU1VPw0KPiBJbiB0aGUgbGF0dGVyIHNvbHV0aW9uLCB0aGUgd2hvbGUgaXNzdWUgd2l0
aCBoYW5kbGluZyBkZXZpY2VzIHdpdGggdGhlIHNhbWUgc3RyZWFtIElEIGJ1dCBiZWxvbmdpbmcg
dG8gZGlmZmVyZW50IFNNTVVzDQo+IHdvdWxkIGJlIGdvbmUuIEl0IHdvdWxkIGFsc28gcmVzdWx0
IGluIGEgbW9yZSBuYXR1cmFsIHdheSBvZiB0aGUgZGV2aWNlIHRyZWUgbG9vay4gTm9ybWFsbHkg
YSBndWVzdCB3b3VsZCBzZWUNCj4gZS5nLiBib3RoIFNNTVVzIGFuZCBleHBvc2luZyBvbmx5IG9u
ZSBjYW4gYmUgbWlzbGVhZGluZy4NCg0KUGxlYXNlIHNlZSB0aGUgb3RoZXIgZW1haWwgdGhhdCBJ
IHJlcGxpZWQgdG8gSnVsaWVuIHRvIGtub3cgdGhlIGFuc3dlciB0byB0aGUgYWJvdmUgcXVlc3Rp
b24uDQoNClJlZ2FyZHMsDQpSYWh1bA==

