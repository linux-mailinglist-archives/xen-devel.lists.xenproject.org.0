Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FD2568382
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 11:32:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362056.591921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o91O5-00040c-87; Wed, 06 Jul 2022 09:32:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362056.591921; Wed, 06 Jul 2022 09:32:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o91O5-0003ye-49; Wed, 06 Jul 2022 09:32:01 +0000
Received: by outflank-mailman (input) for mailman id 362056;
 Wed, 06 Jul 2022 09:31:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uO3f=XL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1o91O3-0003yT-By
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 09:31:59 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30081.outbound.protection.outlook.com [40.107.3.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b00b74b-fd0e-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 11:31:58 +0200 (CEST)
Received: from AS9PR05CA0057.eurprd05.prod.outlook.com (2603:10a6:20b:489::35)
 by VE1PR08MB5853.eurprd08.prod.outlook.com (2603:10a6:800:1a5::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Wed, 6 Jul
 2022 09:31:55 +0000
Received: from AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:489:cafe::99) by AS9PR05CA0057.outlook.office365.com
 (2603:10a6:20b:489::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21 via Frontend
 Transport; Wed, 6 Jul 2022 09:31:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT014.mail.protection.outlook.com (10.152.16.130) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 09:31:53 +0000
Received: ("Tessian outbound 6f9e7ef31fa8:v122");
 Wed, 06 Jul 2022 09:31:52 +0000
Received: from f06b5ce9ab52.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0B5F325F-476F-46BE-BCC4-9458451A6873.1; 
 Wed, 06 Jul 2022 09:31:46 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f06b5ce9ab52.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Jul 2022 09:31:46 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA4PR08MB6223.eurprd08.prod.outlook.com (2603:10a6:102:e8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Wed, 6 Jul
 2022 09:31:44 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%6]) with mapi id 15.20.5395.020; Wed, 6 Jul 2022
 09:31:44 +0000
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
X-Inumbo-ID: 7b00b74b-fd0e-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=WQrIWINJZBQnJ9iK9xziXyfl0xebvVAfLe5uYDWhPNqgnJbrDAKfkxBtPl+nP3v+ZYa3l3Dwjmi4SdXpuhlt5/CyBGzFdFc182tnW9HA/K1Qlv7z8un3Tl0OKJDJ50bsrKevRGNLeMKK976+yTnSvYO2x1i5FIWCB2Hoi0oqD+q2gUG7aXjZk9y6sdhjOA6+ZF69qr0BsQPCnc6wF3CyfCn4ADlH5RDmZABYCImYwrRHYUL2vkrDvx04BCmidSUvZvFAsLWI9EBMzuqXVpEfkq+aLz68hk3OMtdZ0e3H5Te+DVQIg/HcgjsdJgWDDA6KcpDwCJm1vTRudCB2RXLrWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22ugatgv8nquhOB/unRC+y5p5HIkbMis6iMPszAY0Is=;
 b=WnnmxJb56tI4zDd16yHTYVpzAr1Kf9/T0Jg4lPJeguWMjLi5ncp7jOKpRYk8aEmPgnGKLKbUUxRhLsroALIpdk2CqUNBMkBkFkNJfDX2OxYNuLF1EJcBVHK+4kbxeWPPCDV5SRyvdE5QBXr1JccKMifdejt6q5evYxpqzFr2W8NJi3SNvXmeiTF2xBt5RGat3n3Ml72Mg7KJWLUdZd2436+DlkQZPDP/WCAWw0nrBq98bHaePkiR6Y5jUY2hNtVlgrrkVnlC/j9wmK7WeIua7db8LpDh1Itw0yr9PD/50MYnkWQYKiahNL2bUvUZZ0r0bvlYQ4VIojbkFv+lajd9Pw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22ugatgv8nquhOB/unRC+y5p5HIkbMis6iMPszAY0Is=;
 b=bZelORMLlmR9OYugQDiyQecXkgYZar2OX2Rfm5yND2gyPrHexwe5hQaNMcG+t8hJu4r/0WtQejhB5pjKeekE8wSlZqwSY/NpyERlMICIuBxXietOuMf6fCgJqgYPSfGASXLA/+PZ+YOjjdFbj4gAWzUq9fu6zfUhDLgKHJm1aDQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQ4L5TCK7irSpO7Zm+Xy1hY8t+yX+VaD2bhphCoOQIxF8itti/KxijlLwSlvBGLBz9dVH8gxT4KIYhPhaLC0k0TQ7EDiaXw9Nhv5sA2MqHycpyUl/ToVh98rtLOAHAlII5K18sasfyf+/+i/QmvslB81FAam5ynb22kBJwuXoaMmOF9zmzDuN6BL/JMBlp0iGppv/nu8FkRTElK9g3cc9yZMfNmGbBz6DzTAjQwncOPl38WdgmBcDhbo6o46N/Ju8wXU3fJaqQlvJxs67cHHgC9DBt0bSWueki5bnv+V9wQB2+ObORqKfULVs+1oJvBAkbaiayVYozEbF97jxyyAUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22ugatgv8nquhOB/unRC+y5p5HIkbMis6iMPszAY0Is=;
 b=AfIrtHMTd1Gib35qvW1XYPMRmh4vCU65ycYtIaoTiZD2gUBPMGKbl6qZ/o22Xgg+Pj6X9+OoqnrulwhzEEz5yC1vsdphzXBquavy+7sgjbHq+V9evmZdYlnlPwBxx+4YidgoMzS85dO9JPOgIESup2ZkCRCRRO8L7BciQiD2QA5uJ1YVi64pnJdVP0FKAKcn1L4O1g/QysxKryxsEnA6rCG4ZJcLJy3CpQcID+PxRqZB+FiiiFM8meYIjq4veIe4o7npraUZsuuJO8QhYDLKAZtpWo09063o2DWwkWMeF1vKAkjA9oBGPNdu4rR2oYMrvRIcDBNEIwTg+ADLoZFARA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22ugatgv8nquhOB/unRC+y5p5HIkbMis6iMPszAY0Is=;
 b=bZelORMLlmR9OYugQDiyQecXkgYZar2OX2Rfm5yND2gyPrHexwe5hQaNMcG+t8hJu4r/0WtQejhB5pjKeekE8wSlZqwSY/NpyERlMICIuBxXietOuMf6fCgJqgYPSfGASXLA/+PZ+YOjjdFbj4gAWzUq9fu6zfUhDLgKHJm1aDQ=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul
 Durrant <paul@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH] iommu: add preemption support to iommu_{un,}map()
Thread-Topic: [PATCH] iommu: add preemption support to iommu_{un,}map()
Thread-Index: AQHYfKTqlNAQrdLOhUWuhz9XAirPe61xGNzwgAAcjwCAAAbb8A==
Date: Wed, 6 Jul 2022 09:31:44 +0000
Message-ID:
 <AS8PR08MB7991DE759F88068B0D7051E692809@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220610083248.25800-1-roger.pau@citrix.com>
 <AS8PR08MB7991720A18EC4E6941C5B9B292809@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <2377d0fc-1234-56af-fdef-935bdf8322a3@suse.com>
In-Reply-To: <2377d0fc-1234-56af-fdef-935bdf8322a3@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E55B6877E7C26D4DAF347E3A247E92E5.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1d704e63-b449-4f99-5823-08da5f325cb9
x-ms-traffictypediagnostic:
	PA4PR08MB6223:EE_|AM5EUR03FT014:EE_|VE1PR08MB5853:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oRr8c2qMjmglGnhg8JA0peMlNUANdYoFzfkBLjwk9ulgqFE3+CrZQXRvfPvaMKNMMbhIA2uOV46r7GlCvTRnjyooYQ9/es4+5MJsRyQREmSYNPMbVaB0xtDUIl7ihjlkD6sIiPaGBWExFgqQ/fLMay5mzTZ/lwqT5q49KXg8raitV0SEzMCjW5K6nt92gxyX/3s9Sfg5dzolbXMSSIBugejavnI3apaRR088QzcqNrpx3OMFSXoNRBlnUm6Y/Fk0gIGWdjojyy+IYfKXXnyrxOuAckTWOfi/G9dj6rzV3gUchZ9MzfxoOd+qDGtN6KQlcmTb3u2glsx7d5JFiO8j74g7ynelRaGpyecqtm2qy4sb7IEya5qhwVSEeb7pj4wbTNQCfKNuttA74yrNVROiHxja16belVwqw4LN1jtExIBFTsOb3pB/4+qhRK9cTxapE8OHMvr6aDD8i/IBNUKJbdeOUlhUewrkOHjgYOz4kEMoaROsCYrWYTFAuTFJD+T8kftDHXenZajmQseE4QgAo50ersBbOx7J0AzKOh0WubaLpnwdzgwD+T9xZbrVzsvbZly1UIXDN9f9DhN13dQyLe+Sp9mGfKyHiqynTqM8dg8QfVCoMHenQHE84HGTJ0pC5ZMZCrPn4D9Ac2Wc3sAW22rqwOmJUZTB7Jm1Mt0iUk8UAtbobwZSCu5uFiYnQbuuN/Sy2jknAo3g64aVHo1qsI5Wct0MfsKkWjRJ5rn1EgnjbJi0YUXQgnb5TX2JMV38sZdUEq5K3up6lHYstzbNNqCYVqKdehTMP/Xs6orniMn4BCyTzVezBiAfgLZFdcMibCKCcz9oQyp4Kmw8ULE4fA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(478600001)(38100700002)(966005)(71200400001)(186003)(2906002)(7696005)(6506007)(41300700001)(53546011)(33656002)(66556008)(54906003)(6916009)(122000001)(316002)(8936002)(5660300002)(86362001)(4744005)(38070700005)(52536014)(26005)(9686003)(4326008)(83380400001)(55016003)(66946007)(66476007)(66446008)(64756008)(76116006)(8676002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6223
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7a2e6287-c696-44cd-0401-08da5f32576e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UPJNrf9O+f08Ets29J8pXx7P6X5cMQPcDVXAzyA7WRYM6YZLrWT+pX3ysLrUD1bVL/OuVIOnr0RB7DGHBXKYbUId6nrMG3MKFgh64JTmnT3sronPCW2+U7jPv2Bh8C6d1ejRhnzIcSrpXofe6B/KZ6XRPeAX7Iak1imRQ9kN+XRkzaZhzf0TfKSXOLWqZHGn8+1lxNhmqBnxZT5dUOBsgENozZoJ2xHbruWkcbJd2hvNH2l++sVxXycTwgOF8umLEWr/yH7qGZdDE+4SLaYl+cJ909EpZn2y3giHVn+QCy32HLSlqFe4z5p4A3Sulm1qU8W/MmwZG/T63ZXgN3L434cpA9SKGmr1N7qPthzVMkzYMUkFbqARABN9eRFbEkPEtcOkzrYb0rjPVITrE76ALHYf8Ko4ZIh9hZnJibdUCmKAEy4WboaAof1qd/kcELz6RWblVkzZ9TN9PXsh3Ww4/CokChhes9NU2u5jIFlsM/5DSduG/rAe8YQWywnBFh+OoRwqqL2sPdhSsIfuY5oYuKOrLGVEKqOF4I0W0eHm655jdMnEoLEcXShtgWczVmtL8f00e5I2nKIks9qMwf8ydAxsnsAtEx6ChXVax33RQAkYb/+jXpIVBqBUmYO8mzu3aBZsPMNyVMBM0wGOv6JP+RCk9UArRbs+OJq9iAfkzebEfAbFlzYqoqEmJAk0ILZ3wkPJOia8Zd4210okMGtDD8Zz2Cpb0GHufKJdc0GlvyaRYGjjNRPubHD8ca19CR7roaYs69vWENEQbOqNWopbrhY902nPIYPQd79NElYTBf3wDt0flVbp93Jq9tLt676OYqiSsWct4U0q6iFr1MJE6psQ/k8vVIW85liqiLv1PkE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(376002)(396003)(136003)(46966006)(40470700004)(36840700001)(7696005)(6506007)(356005)(81166007)(40480700001)(54906003)(53546011)(36860700001)(316002)(86362001)(82740400003)(55016003)(82310400005)(2906002)(4744005)(8676002)(83380400001)(41300700001)(4326008)(966005)(5660300002)(336012)(9686003)(47076005)(26005)(70206006)(70586007)(40460700003)(186003)(33656002)(8936002)(6862004)(52536014)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 09:31:53.4375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d704e63-b449-4f99-5823-08da5f325cb9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5853

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gaW9tbXU6IGFk
ZCBwcmVlbXB0aW9uIHN1cHBvcnQgdG8gaW9tbXVfe3VuLH1tYXAoKQ0KPiANCj4gT24gMDYuMDcu
MjAyMiAwOTozMSwgSGVucnkgV2FuZyB3cm90ZToNCj4gPiBJdCBzZWVtcyB0aGF0IHRoaXMgcGF0
Y2ggaGFzIGJlZW4gc3RhbGUgZm9yIGEgbW9udGgsIHdpdGggYWN0aW9ucyBuZWVkZWQNCj4gPiBm
cm9tIHRoZSBhdXRob3IuIFNvIHNlbmRpbmcgdGhpcyBlbWFpbCBhcyBhIGdlbnRsZSByZW1pbmRl
ci4gVGhhbmtzIQ0KPiANCj4gVGhlcmUncyBubyBhY3Rpb24gbmVlZGVkIGhlcmUgZnJvbSB0aGUg
YXV0aG9yLiBTZWUNCj4gaHR0cHM6Ly9saXN0cy54ZW4ub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRl
dmVsLzIwMjItMDcvbXNnMDAxNjYuaHRtbA0KDQpJbmRlZWQsIHNvcnJ5IGFib3V0IG1pc3Npbmcg
dGhpcyBpbmZvcm1hdGlvbi4gSSB0aGluayBJIG5lZWQgdG8gZW5oYW5jZSB0aGUNCnRvb2wgaW5z
dGVhZCBvZiBtZXJlbHkgcmVseWluZyBvbiBwYXRjaHdvcmsuDQoNCktpbmQgcmVnYXJkcywNCkhl
bnJ5DQoNCj4gDQo+IEphbg0K

