Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3376565014
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 10:54:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359981.589302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8HqZ-0001TZ-RD; Mon, 04 Jul 2022 08:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359981.589302; Mon, 04 Jul 2022 08:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8HqZ-0001RP-Ng; Mon, 04 Jul 2022 08:54:23 +0000
Received: by outflank-mailman (input) for mailman id 359981;
 Mon, 04 Jul 2022 08:54:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=byhi=XJ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1o8HqX-0001PS-Lg
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 08:54:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2051.outbound.protection.outlook.com [40.107.22.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e481961a-fb76-11ec-a8e4-439420d8e422;
 Mon, 04 Jul 2022 10:54:20 +0200 (CEST)
Received: from FR0P281CA0037.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::19)
 by VI1PR08MB4590.eurprd08.prod.outlook.com (2603:10a6:803:c3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Mon, 4 Jul
 2022 08:54:18 +0000
Received: from VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:48:cafe::a6) by FR0P281CA0037.outlook.office365.com
 (2603:10a6:d10:48::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.13 via Frontend
 Transport; Mon, 4 Jul 2022 08:54:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT013.mail.protection.outlook.com (10.152.19.37) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Mon, 4 Jul 2022 08:54:17 +0000
Received: ("Tessian outbound d5fa056a5959:v121");
 Mon, 04 Jul 2022 08:54:16 +0000
Received: from adca620d8b7f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 29CD4477-65E4-457E-A283-AE302BF87B47.1; 
 Mon, 04 Jul 2022 08:54:06 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id adca620d8b7f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 04 Jul 2022 08:54:06 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by DU2PR08MB7238.eurprd08.prod.outlook.com (2603:10a6:10:2d1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Mon, 4 Jul
 2022 08:54:04 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 08:54:04 +0000
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
X-Inumbo-ID: e481961a-fb76-11ec-a8e4-439420d8e422
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=R5EuJMPXHSDJg+dakPHU+VVHA+wrmuxsF+z4FAEWhnJCL8XrYVHt4FkFpUeeZxaoX06TkKkSSDzWago5U4mD6rekOJzqoBJiwVadIF3WYhvNyVD1glrULMBgx/ql9SgpMfFnSBjCK7p36a+asGGfS7y4bESkvYvKmBwAn36HuZ+qrEtAyGuQr4HkGQIC1zf8K2cMeSKHcL8s1HquJu0kH+ZD0kWpVAMyKci0LqLMRGtcJy+G4OTwaIeV7qpt1t9FbL5oVB65rXQ6aRx5kZf0HSRyeJKEzDAJBLxH/Y948nZe9vRDRb2h6nwi+lZI1ryBrETrjw+qAFXGyMnUm66XKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ffi6JJLQ5BF3CUzzlUVg3HLCClMSucEA7cdEB5BKdZc=;
 b=j/vWycgmyU4iVYqEhvoj4JPpVwCKk5QbcWvO9WicL3xiNAgukwDGcLgi+cQIm4scHbQd0jig45s4Y7Sas05xtWziqRU56rjjmr0LW98q/zTL5kVZYOm4yHUOyYbMQaVz8jL4GBv2lN7FwRw6LQntJ8hXYreXTntJATuAuYRnG02Ix9TBDNVLBIRUg0Sm/yfjoXMCBEXqR04txJ4Xepd7k4vTfcCbsh62QLbMiE6fik8ESZKCpmazItAK4+4PU7po56Z3WwS6G7Cz3EeO+rlubdks76BnJbUwoHDaM+ipPCD6joovsdgN8BvgmDB/85f9vGzUXNh96ifSYhQk+0cVuw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ffi6JJLQ5BF3CUzzlUVg3HLCClMSucEA7cdEB5BKdZc=;
 b=C9fKUuTMAhMlhvbg8ttC37nRZXYB+93qFJZWzbHmP/sq/UGhCGyUhIIUksz+mkMOHKfDlN68Br0zrbh+GvdWvDde9fTAbqpxM6sRmaM5mn8OGviFNCfCyvV5+Ag3JqYoBGJak6GC9fF0Gr7UJjESo7YwL/PB5JEaHjqSm77VA/w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2c076e7992baf2f6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g63tzO12k0PAJyJGS/YFlgHnN/1wQRs53dWphSu6xPXJ6ymEEwioCReDrjknRgA/Mlm/88wn4ZJKZVKF2xDNi3wTjIQ9r80kRrh/d+HLOhJuPoPr5FQgQG6M8AnMUxrzNkWIKecri0bsBOjyuz1ubu07br29FghUsqaSPf/0geFuD0aD3ZObrHNaZxzBJzg5m+0rmuPK/FsMauavEZQfEfQazloNSFJGcyM3esMKOmfS0lPa/LCRE3FWRWPAcvItBgvfVr8//wO0RY3R8RRUdR2XvjUynwqvdagEg2B7WNUNGlaoyPAXuoYgGGEgwxZlTqzKK47OMbavS0kJ54zniw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ffi6JJLQ5BF3CUzzlUVg3HLCClMSucEA7cdEB5BKdZc=;
 b=aefJk4T0AZgjNW4T39ul9yxBGR27w9LifWsjErwzKgHrYdwIML1uMManQsEXNDe7tgNjwliK4hckEq8DQ4Nv/aszvHH6mW01UI48lGu9E4+5oIInjQr8yt1+fQtRf10ZxU5WLVBduN7Rz6g0a7CDSwAAbLCkCUbZ7Zbg90ZP+3xoLSigMOEYn2Kj6gb5StglxYXvYW6NDswR7R1O6QAP7WXrXOkgjg4Nv/pmyx++pqsaf55bb7AeR3byvJdPXk3Z/Zx6ZRg5cfkskGLwvttRxTsgj7usyE1UgQUzSKXRzOiT/orJKRIa2ubYutumcKUYRNojwQCPRbLc2PXS75kUBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ffi6JJLQ5BF3CUzzlUVg3HLCClMSucEA7cdEB5BKdZc=;
 b=C9fKUuTMAhMlhvbg8ttC37nRZXYB+93qFJZWzbHmP/sq/UGhCGyUhIIUksz+mkMOHKfDlN68Br0zrbh+GvdWvDde9fTAbqpxM6sRmaM5mn8OGviFNCfCyvV5+Ag3JqYoBGJak6GC9fF0Gr7UJjESo7YwL/PB5JEaHjqSm77VA/w=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Xenia Ragiadakou
	<burzalodowa@gmail.com>, Xen-devel <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: traps: fix MISRA C 2012 Rule 8.7 violation
Thread-Topic: [PATCH] xen/arm: traps: fix MISRA C 2012 Rule 8.7 violation
Thread-Index:
 AQHYj3bsMO2Y3PSLZ0WCUDTYt37uBq1t0/kAgAAEvQCAAAI0gIAABXOAgAAAxoCAAACbgIAABosA
Date: Mon, 4 Jul 2022 08:54:04 +0000
Message-ID: <7C0683EE-4D8C-490E-997F-D54514312022@arm.com>
References: <20220704072232.117517-1-burzalodowa@gmail.com>
 <EB360E93-8353-48D0-844F-CB529B94B9C1@arm.com>
 <BB492376-6171-4ECB-8F24-6F419E9A5926@arm.com>
 <e623d9c9-0f61-144b-61ea-51367c938b03@gmail.com>
 <E77F6E48-80EE-4874-B560-D57ACFF0C264@arm.com>
 <E56D7BDD-8DA6-4131-A60F-26239A9BBEA2@arm.com>
 <8970b2a7-d754-7db3-7f43-f2d30c626dc4@xen.org>
In-Reply-To: <8970b2a7-d754-7db3-7f43-f2d30c626dc4@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d13c9609-a3aa-4d9f-fb7a-08da5d9ac72a
x-ms-traffictypediagnostic:
	DU2PR08MB7238:EE_|VE1EUR03FT013:EE_|VI1PR08MB4590:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7/LlCF9Pnc44MNj8MgvX2Wu12YCrcehnSX+9hX0xDMThGyXxtq8OqMzXD+pjCeRL9CH0Ou+Hi5RMJiYAc2zm4reEpMCgRtxX0S/H6D2ITfd82J/wD1VbKBN6slw9wqir3gJtoQXb3yUw7fvNP1A+fDUluYfAybr2tK0vKoEIJemlVcw5IRLe9fP6e1LrAziUnZVcQUDX83p7dJzYEJ/VRWV44gm6MeKQ4JP11GSRXeZk4uUCD0ZyDAmkOnlZAcSYzSDjG35pOJpQOcRGAZgIvhKEGXCHPmzUuE5aaP/+JLTSeZinXE/f0angeOiS+4nHe6pRGEN+aNg2dYB4vw/4vGyqockQnO5oz5vFTZ0aXTBH29/7OVPTYePoXVYvyX0qIBMKwWSh86n/hvet7AoFj3tG/D/9zQCx9YCpHZdm/U6cbGH2MOj3U1Dw1+vW3XOJDNAscKLL+HibfnCP0eQWK+DOTsrg+h9DEuj20S0hARUANnJ7PrTML9hTmh1+L9tWP11OzjxmW1z98Ygalbfb4JkO99VD5M2p+5lKp/SMYdNbipte9NCeOxhVSWB4OMQ/az2DeU4YcHQ5OweSTc65/dRUwU9oLA3VH5XXkan/3h7fmKdE5JQdWh8QbLUgQwI+T2WWChYvpVP6Cm82ZExC8rNrRFZm9kqJ2oQsIUHvnO4c3EthZHS0xCw7hvm5NijKEUtRWBBxMWja8fN0By7CCMIUrNvmUiULidn7ga7BmJfNMnOCSQfgHu5aSyxuihZi+8DNiaCtw1nlqKAm7k1IWopHqLeOpM2PuwL1viv9hF/vwjR2Ibazh8pL/wWX+YCK6MrIY2jXwsHcJXQKIvw1ji4VnjtA3vZgILUeOCCPcrk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(91956017)(66476007)(66446008)(4326008)(64756008)(66556008)(8676002)(66946007)(76116006)(36756003)(122000001)(316002)(38100700002)(71200400001)(38070700005)(6916009)(54906003)(26005)(6512007)(41300700001)(8936002)(6486002)(186003)(5660300002)(33656002)(6506007)(2616005)(2906002)(86362001)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A00F71C522F6E341AE42E926D662E3B7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7238
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	013b2010-0d07-4ae2-3d79-08da5d9abf41
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X9x33bNMN9BnH80vOH6XTEd4jLo+zBv6Gs/LKysRWBWp1mxqVB2Juwz262NELItBuVkSHTYYCPU1757J79pYPpMrXVCh3Ya1j8dZAGAKAvPSBFoyPCrAvPKv93uPaCePq7ELkKd+4bqj0Bo0OpTIR5ElONs2asoy03K2G7LDpc6zQhgtWRg56wwzx7ha2M2HdE7k+fKOVc8oAEdJWH4cCKsQOxuyx5q9qplzl+7TkCFerR7V00/ycXVgaCurDrPIY8Hoe43PZWwQAPocTojqDF4RH6Pd6WHOMV73PfkS7Cqifu3ceI0//coRwYFLD8ikzNUHOV7Lpep3cHHETzlwBryx1XWp5wrm0zNwfhGL0PIQvBmHalwEZZ7aPnILh6sRlmGdpZ+aZYkts8wMxvlN6PtLCq33iDWmZTC33guQGQFbiPzZKzByEyW7Iui1BFCNYhboNnxUCqcjEhZoM5AeszfVLt0DuMUKTiOHZEB9YK7eoMWOszzD6/M/TQ1Ks6Rwi47TEaW1RvzzNKXKMfZ1U+BDfKFe0Fa4jm9m+B5Y+j8SNS7BWTFqq1AxGXU1CGZDgMZYbuDguZ5naUvPZlLFKfmMCH34uPXTxT/61NB3iB2tYYpYqRs9rLEgaAJJbW7iETzy78mqImzdd1p8perEwwMV6O1Gl0hPU6I1TKeHIV0tEr8ZOwLDlqmjzsWN0xQ05dSGgSgPqRDvxjzbx54P7FcF3xxqv551eqoabSEveLKImQUTstgndNS4oQSGWEGTUsBK672JWjwmJFfVRflfYJvVTpebA7kPGiEgpnBoioM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(346002)(376002)(39850400004)(46966006)(36840700001)(47076005)(336012)(5660300002)(478600001)(6486002)(26005)(6862004)(8936002)(36860700001)(2616005)(6512007)(41300700001)(2906002)(86362001)(6506007)(82310400005)(107886003)(70586007)(186003)(316002)(356005)(54906003)(8676002)(70206006)(4326008)(82740400003)(36756003)(40480700001)(81166007)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 08:54:17.3082
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d13c9609-a3aa-4d9f-fb7a-08da5d9ac72a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4590

Pj4+Pj4+IA0KPj4+Pj4+IEFzIHNhaWQgSSB3b3VsZCB2b3RlIGZvciBleHRlcm5hbCBsaW5rYWdl
IGhlcmUgYnV0IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSBvdGhlcg0KPj4+Pj4+IGRldmVsb3BlcnMg
dmlldyBvbiB0aGlzLg0KPj4+Pj4+IA0KPj4+Pj4gSW4gYWRkaXRpb24gdG8gdGhpcywgaWYgd2Ug
ZG9u4oCZdCB3YW50IHRvIHByb3ZpZGUgYSBqdXN0aWZpY2F0aW9uIGZvciB0aG9zZSwgc2luY2Ug
dGhleSBzZWVtcyB0byBtZQ0KPj4+Pj4gY29kZSByZWxhdGVkIHRvIGRlYnVnZ2luZyB0aGV5IGNh
biBiZSByZW1vdmVkIGZyb20g4oCccHJvZHVjdGlvbuKAnSBjb2RlIGluIHNvbWUgd2F5Lg0KPj4+
PiANCj4+Pj4gUnVsZSA4LjcgaXMgYWR2aXNvcnksIHNvIEkgdGhpbmsgdGhhdCBmb3JtYWwganVz
dGlmaWNhdGlvbiBvZiBkZXZpYXRpb25zIGlzIG5vdCBuZWNlc3NhcnkuDQo+Pj4gDQo+Pj4gWWVz
IHRoYXQgaXMgdHJ1ZSwgaW4gdGhhdCBjYXNlIHdlIHdvdWxkIG9ubHkgbmVlZCB0byBkb2N1bWVu
dCBpdCB3aXRob3V0IGEgZm9ybWFsIGp1c3RpZmljYXRpb24sIGhvd2V2ZXINCj4+PiBpZiB0aGUg
Y29kZWJhc2UgZG9lc27igJl0IGluY2x1ZGUgdGhlbSAoYmVjYXVzZSBub3QgaW4gcHJvZHVjdGlv
biBjb2RlKSBJIGd1ZXNzIHRoZSBwcm9ibGVtIGRvZXNu4oCZdCBleGlzdC4NCj4+IEhhdmluZyB0
aGUgcHJvZHVjdGlvbiBjb2RlIHVzaW5nIHN0YXRpYyBhbmQgdGhlIG5vbiBwcm9kdWN0aW9uIHVz
aW5nIGV4dGVybmFsIGxpbmthZ2Ugd291bGQgYmUga2luZCBvZiB3ZWlyZCBoZXJlLg0KPj4gSSB0
aGluayBoYXZpbmcgdGhlbSBhbHdheXMgd2l0aCBleHRlcm5hbCBsaW5rYWdlIHdpdGggYSBqdXN0
aWZpY2F0aW9uIGlzIHRoZSBjbGVhbmVzdCB3YXkuDQo+IA0KPiArMSB0aGlzIGlzIHdoYXQgSSB3
YXMgZ29pbmcgdG8gYW5zd2VyIDopLg0KPiANCg0KWWVzIHByb2JhYmx5IEkgZGlkbuKAmXQgZXhw
bGFpbmVkIHZlcnkgd2VsbCwgSeKAmW0gaW4gZmF2b3VyIGZvciBleHRlcm5hbCBsaW5rYWdlLCBo
ZW5jZSB3ZSBhcmUgZ29pbmcgdG8gaGF2ZSBhbiBhZHZpc29yeSB0bw0KZG9jdW1lbnQuDQoNCkkg
d2FzIGp1c3QgdGhpbmtpbmcgaWYgd2UgbmVlZCB0byBkb2N1bWVudCB0aGF0ICppZiogdGhlIGNv
ZGViYXNlIGRvZXNu4oCZdCBpbmNsdWRlIHRoZW0sIHdoaWNoIGlzIGEgY29tbWVudCBub3QgcmVs
YXRlZA0KdG8gdGhpcyBwYXRjaCBzbyBhcG9sb2dpZXMgZm9yIHRoZSBub2lzZSBvbiB0aGF0LiAN
Cg0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

