Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A04B59881E
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 17:56:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389669.626756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOhs3-0004An-Gy; Thu, 18 Aug 2022 15:55:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389669.626756; Thu, 18 Aug 2022 15:55:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOhs3-00048d-E2; Thu, 18 Aug 2022 15:55:47 +0000
Received: by outflank-mailman (input) for mailman id 389669;
 Thu, 18 Aug 2022 15:55:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rLbC=YW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oOhs2-00048X-3X
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 15:55:46 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60074.outbound.protection.outlook.com [40.107.6.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38121231-1f0e-11ed-9250-1f966e50362f;
 Thu, 18 Aug 2022 17:55:45 +0200 (CEST)
Received: from DB7PR05CA0025.eurprd05.prod.outlook.com (2603:10a6:10:36::38)
 by VI1PR08MB4432.eurprd08.prod.outlook.com (2603:10a6:803:102::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Thu, 18 Aug
 2022 15:55:42 +0000
Received: from DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::47) by DB7PR05CA0025.outlook.office365.com
 (2603:10a6:10:36::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19 via Frontend
 Transport; Thu, 18 Aug 2022 15:55:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT033.mail.protection.outlook.com (100.127.142.251) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Thu, 18 Aug 2022 15:55:41 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Thu, 18 Aug 2022 15:55:41 +0000
Received: from 952fb6547a9b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 54184866-10AB-4006-BF76-55654F089715.1; 
 Thu, 18 Aug 2022 15:55:33 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 952fb6547a9b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 18 Aug 2022 15:55:33 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB8PR08MB4089.eurprd08.prod.outlook.com (2603:10a6:10:a7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 18 Aug
 2022 15:55:21 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5504.028; Thu, 18 Aug 2022
 15:55:21 +0000
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
X-Inumbo-ID: 38121231-1f0e-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=EwKH5Ko+W2bsEx8fTlbAWXh5DzJvnhVbr4RM9SlPbmbr1NhiPHOKnCiWaVGP4HLW0dhm5VbcZ5DtYnGAZIj8Eof6cyJ1jIgCVwmjyTXaXGdszWminVL7UT75HEFQjtWAVzJy2F5UFMdFIsjcTNf5bxWhtqJW9Z6DMHfqriW4q3opaIvloLn1+XouYokcvJdUydCrV4kiRqNhacmqSrRYOtRwNXRz9iPCTYEOi8iKfOro7oMtRJX2jkRT+1y+RZpDPAiKw3rE40WOPajJwlEruuZo/fyahB8pyc/3gLj+KHMHc3BnEaA/YEk4bOolFddxY+ifAgOK+XD5E/G9Z5l71A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMzkTNH5hvn90NBTpX1W+AG3W0UYyQi/H74H18SiPkI=;
 b=B1rhow40rprQmZjLOp4NWijKLIz0TerYskWcFLspoVgikk5ZTiSd9aUcm5NK7ZD3oCQpEBdQI+mfEGMIVbf1aF8hwkQn6Mvm1IledXk6DrGjZRJhT2Pw6bCkPukvsD90krVeoYl+2+7WM0GKWphNpmtvWEsLy6tUrtndGTlOSFJGI+L5t+jTLehhWXcCYfoS1F89IphDhyDdfSJts4O4ezj85xFhnLbdaWNmsIWrtlK1fyog/CZnL2d+aq6eF4UkSlpRfbeiv5V+nTGBZ+oFaEB7f+6xXAskmfyfzx+/Qr/TPVF33Oh0L8W86GOfDsEARVi1BpoOx07ZjLSF/ff95w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMzkTNH5hvn90NBTpX1W+AG3W0UYyQi/H74H18SiPkI=;
 b=T7YRw7sjqvGPQaOcD3xKzuyHafPCCVERy+0bLLgYQ2cjhtnNFNRghFjeLADxHhh+c1ahDnj+oQz56hf97P4kFSJFYMHj0/+D1usKp5NFepWAZkC8t8SeDLUhgHWMfJrnZvGM8dJGkGcN1lZUfAHu2sH2EwhK+qW8uHNp1EelJXo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 02e97ac081eb1fa0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NWvB7MOoQbWSsZaZ6dk4/pURZDOBbMadT7G+WalVsSzcVSpoJaU28fDm9zqm0wx4vyEYO6PlHcW1jP5mZbL37uOXYz2OgaTdXYlsKorPVYtdJL+kDCd9DetSJKrMhU13t1RtRUXkji8COU5nZ6+OkKrWcCZgRqU0LAmVRlYpEwwDrIPji1Yr59NNHEUZM9plmbe6LgzGCPwwWMttKJZhCh7XowHqwUfpCFjtTTgfPzHLpg/1sNv6pZxdV7P5AjGBOn1as1x4v/HiaIqohijw0rhkIjVSwlu5FyIjyX3jIopaLAvuoAxwV1CIZnH+W6x/Gao+j9wKFq7pEuEGYISzwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMzkTNH5hvn90NBTpX1W+AG3W0UYyQi/H74H18SiPkI=;
 b=gFCcxJQNY7nGWlbfNS+MSaR5v+36xqljP0WEw2K62ZPlh1egkP21I2T0fpxSUt+VhBWzklsiIIAw+Y3vImX4UZOT3Os05pUrRNRTm/BeNWu1eNSk2XXHcOOAJbqBtjbA2W3XqEnfyQ5A9/c6e8vVS9KLxitvYrAra4n73pwyRJaVh+mP0v9wCYOhKrB0hoaYsGJUtJsDm1TBPsk6jLnVvd4nN34Q8LlKtP7X7+dG4j4SnEu6VQnPD64zBOxacdFlWllAl8z6SepYWDqEsDw3+uIJ8Asek3XaUj2Nl2syTSSIoCygWGMEPF1GzV8tYIJTv0Nls7+TOe9vTNVFsTM1CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMzkTNH5hvn90NBTpX1W+AG3W0UYyQi/H74H18SiPkI=;
 b=T7YRw7sjqvGPQaOcD3xKzuyHafPCCVERy+0bLLgYQ2cjhtnNFNRghFjeLADxHhh+c1ahDnj+oQz56hf97P4kFSJFYMHj0/+D1usKp5NFepWAZkC8t8SeDLUhgHWMfJrnZvGM8dJGkGcN1lZUfAHu2sH2EwhK+qW8uHNp1EelJXo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jens Wiklander <jens.wiklander@linaro.org>, xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>, Luca Fancellu <Luca.Fancellu@arm.com>
Subject: Re: [PATCH v5 1/9] xen/arm: smccc: add support for SMCCCv1.2 extended
 input/output registers
Thread-Topic: [PATCH v5 1/9] xen/arm: smccc: add support for SMCCCv1.2
 extended input/output registers
Thread-Index: AQHYsvEkHkqzGWJxi0qzDFcav/qI3620q3mAgAAND4CAABdsgA==
Date: Thu, 18 Aug 2022 15:55:21 +0000
Message-ID: <D8557FC4-C3B1-4F40-A264-2D8DE68E71CD@arm.com>
References: <20220818105601.1896082-1-jens.wiklander@linaro.org>
 <20220818105601.1896082-2-jens.wiklander@linaro.org>
 <EC23C48B-C9ED-4BD0-BD6D-4967A2509B2B@arm.com>
 <4613f385-b11e-6d4f-42df-2febac4440d1@xen.org>
In-Reply-To: <4613f385-b11e-6d4f-42df-2febac4440d1@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d9dbab48-0b2f-4829-80f3-08da81321a31
x-ms-traffictypediagnostic:
	DB8PR08MB4089:EE_|DBAEUR03FT033:EE_|VI1PR08MB4432:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 COChE0FV2SPIjEA7Kh7k6lXWSKV3BUlvxYWqGkRQ8im2lz6eVWtvSVk/vmeH11w1lA9VZJnWqe3wZM5whujvKLhEy6g9tQCHGLgnPtWMeYSvBuTziu93Mk7Pe2ZpiwWm/3kOeDNp/HE1T++wSiG+0E/swtw3Kt4p5GQUigIGfD4Cwsd43bLp90DppwSHpLsF04UdypWI5KPWcRT60tCvzbvXQivk1hFXwi/8siVlcNy8KB2Qt/AJG+BaqzIk2eThsXnoQVuSDO/GIMU608p13UGvVQcQJV81MQUm0aAbku81/4sQEvUqEHDZSgZitUwRRI0ddos2oYmPLG9/KjkxDjbDcP4vbWSDFrxuAYcldJdtGiTUlTRBvb3v823rQPGjDbv9PEXp7YqYF3pDtI/w73z5Su8WcZnt1aTegkp/6+h48EIwEkO/xOTmSI4lERHb2caFGGC10HuLfYnHo/zpSXAcupqvDYHrl252v2TMJbS5VpUN5KafwfCj9Y87Yl410PLa4BL/wlB2Ff2u5kR6itfzvyK3jX4+jRqO+ahgu2kHiHgskyJSF06LeWMh4GBBApuRpEVE/4mHFL85KiItJYD5IfLq7XMXuf8Z2k+ViFhDWyt2BuS8nAdfoTcD+WmhiJeNW5y72syM7Bxhoga8aaMOgrGlO10yikeu+YwT5F+dQmIo9OXctbelC3X3U2U7AOy1GxTRUZEuhokUVlnT2ggH9eLdavo0vIlHrlHrV0wpUlBUjBs/nBLMed7sJ7VtKl0kUfh+5O+9f8nR1iKODNomEX/duqoZtrm8WM/XVJpqGrQnwP64Djhce5IbwQFiD4alyBHuu18GNqctEjpAzQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(478600001)(966005)(186003)(5660300002)(64756008)(6486002)(36756003)(83380400001)(6916009)(8936002)(54906003)(86362001)(33656002)(91956017)(38070700005)(26005)(71200400001)(6506007)(53546011)(41300700001)(316002)(122000001)(76116006)(4326008)(8676002)(66946007)(2616005)(66556008)(2906002)(66446008)(38100700002)(6512007)(66476007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C19BA83CD152D2468B6801EC66768D3C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4089
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cb8b5861-b7f6-4d2d-3b9e-08da81320e71
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LCSeC3ZOeS6jNEENXhXlt7/mZ9jtLTND7tltEn/w3sOsyf8wzJFn6CVZpOZrJlyxOZZ/rxCaIoqLBl4tYI9Z3hFZ/Ow8Ty1mbF3fljC3SZH2WFsvt+x4lrEPb0p6UL5oWe8GrezXg1b74VSVsnYeS5hrF4T3vY6gSPIQIiWb8EXXz+vZ8wjjq3AP7G5O8MMJlMRjBB/AlqDJ1EkxIFSN16x3LboCSTQmgZMg01l8E+0TuK5XsUs8NASaOOcNbO1cMPFjrUAgTBZHtKwVPIsKSfKXT0n0IbU5COIoOJvUdm2C6IKCnfxFx/0GOz/yBc4St19FBRKJuWZq7p7LGR8U7H6GOtw/EV7eqXb3f/K3YBZvNSqc1b1ZmkbY0fbU4352O2zU1mLXhmW0FVbTn8GeJyWRKvjwYyybPh9Ij9Scqk+bf52Vudi0d/D5S1zH7zr9PDvWv1tyhanlMP0KJvWCNH/pHFQ21a/dUgKY5lqJbd2ufpupbklMihJImUUFr2+rQUHoJqF69zzVWjynXKgSfkkOEBvUBkNE9DMuUDnW5WkdKM1mChO2oX7ugTDoQUTvBwj8IGaQQEvsfTH2ALiA+5eWyFRpQqWKDnyOrqH5fVg+EweTMj24vEqA2iVHSNHLBvxJ8F4/Kr/Yg/r7Dh5ObHHa7gAQT1oTXBxKhLAw3SLZwNZo9xyvMUZu69Yb1FpSMhsiwPPLGvmIkO/5rXcAAleOCfm/r6p6gPGZ6Mad9ptS2pK5zZb+DSCTVGzlvd/yHWZCYjYxBW1DmiE4mSeWpE0yMCjPWrOI5O9kUKry8Tg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(396003)(346002)(39860400002)(36840700001)(46966006)(40470700004)(6486002)(6512007)(966005)(82740400003)(6506007)(54906003)(70206006)(70586007)(53546011)(2616005)(336012)(4326008)(8676002)(33656002)(5660300002)(186003)(47076005)(82310400005)(36756003)(86362001)(356005)(40460700003)(81166007)(6862004)(41300700001)(40480700001)(2906002)(26005)(36860700001)(83380400001)(8936002)(478600001)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 15:55:41.4146
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9dbab48-0b2f-4829-80f3-08da81321a31
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4432

SGkgSnVsaWVuLA0KDQo+IE9uIDE4IEF1ZyAyMDIyLCBhdCAxNTozMSwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBCZXJ0cmFuZCwNCj4gDQo+IE9uIDE4LzA4
LzIwMjIgMTQ6NDQsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4gT24gMTggQXVnIDIwMjIs
IGF0IDExOjU1LCBKZW5zIFdpa2xhbmRlciA8amVucy53aWtsYW5kZXJAbGluYXJvLm9yZz4gd3Jv
dGU6DQo+Pj4gDQo+Pj4gU01DQ0MgdjEuMiBbMV0gQUFyY2g2NCBhbGxvd3MgeDAteDE3IHRvIGJl
IHVzZWQgYXMgYm90aCBwYXJhbWV0ZXINCj4+PiByZWdpc3RlcnMgYW5kIHJlc3VsdCByZWdpc3Rl
cnMgZm9yIHRoZSBTTUMgYW5kIEhWQyBpbnN0cnVjdGlvbnMuDQo+Pj4gDQo+Pj4gQXJtIEZpcm13
YXJlIEZyYW1ld29yayBmb3IgQXJtdjgtQSBzcGVjaWZpY2F0aW9uIG1ha2VzIHVzZSBvZiB4MC14
NyBhcw0KPj4+IHBhcmFtZXRlciBhbmQgcmVzdWx0IHJlZ2lzdGVycy4NCj4+PiANCj4+PiBMZXQg
dXMgYWRkIG5ldyBpbnRlcmZhY2UgdG8gc3VwcG9ydCB0aGlzIGV4dGVuZGVkIHNldCBvZiBpbnB1
dC9vdXRwdXQNCj4+PiByZWdpc3RlcnMuDQo+Pj4gDQo+Pj4gVGhpcyBpcyBiYXNlZCBvbiAzZmRj
MGNiNTlkOTcgKCJhcm02NDogc21jY2M6IEFkZCBzdXBwb3J0IGZvciBTTUNDQ3YxLjINCj4+PiBl
eHRlbmRlZCBpbnB1dC9vdXRwdXQgcmVnaXN0ZXJzIikgYnkgU3VkZWVwIEhvbGxhIGZyb20gdGhl
IExpbnV4IGtlcm5lbA0KPj4+IA0KPj4+IFRoZSBTTUNDQyB2ZXJzaW9uIHJlcG9ydGVkIHRvIHRo
ZSBWTSBpcyBidW1wZWQgdG8gMS4yIGluIG9yZGVyIHRvIHN1cHBvcnQNCj4+PiBoYW5kbGluZyBG
Ri1BIG1lc3NhZ2VzLg0KPj4gV2l0aCB0aGlzIHBhdGNoLCB5b3UgYWRkIHNvbWV0aGluZyBzbyB0
aGF0IHlvdSBjb3VsZCBjYWxsIFNNQ0NDdjEuMiBidXQgaW4gcHJhY3RpY2UgeW91IGFyZSBub3Qg
dXNpbmcgaXQgYW55d2hlcmUuDQo+PiBJIGRvIG5vdCB0aGluayB0aGlzIHBhdGNoIHNob3VsZCBi
dW1wIHRoZSB2ZXJzaW9uIHdlIHByZXNlbnQgdG8gZ3Vlc3RzLg0KPiANCj4gSU1ITywgdGhpcyBp
cyBiZXR0ZXIgdG8gYWRkIGl0IGhlcmUgcmF0aGVyIHRoYW4gaW4gYSBGRkEgc3BlY2lmaWMgcGF0
Y2guIE90aGVyd2lzZSwgb25lIGNvdWxkIHJhaXNlIHRoZSBxdWVzdGlvbiBvZiB3aHkgd2UgYXJl
IGFkZGluZyB3cmFwcGVyIHdoZW4gdGhleSBhcmUgbm90IHVzZWQ/DQoNCkkgd2FzIG1vcmUgdGhp
bmtpbmcgb2YgcHVzaGluZyB0aGlzIHVudGlsIHdlIGhhdmUgc29tZXRoaW5nIGNvbXBhdGlibGUg
d2l0aCAxLjIgYnV0IEkgZ2V0IHRoZSBhcmd1bWVudCBzbyBvay4NCg0KPiANCj4+PiANCj4+PiBb
MV0gaHR0cHM6Ly9kZXZlbG9wZXIuYXJtLmNvbS9kb2N1bWVudGF0aW9uL2RlbjAwMjgvYy8/bGFu
Zz1lbg0KPj4+IA0KPj4+IFJldmlld2VkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1
QGFybS5jb20+DQo+Pj4gU2lnbmVkLW9mZi1ieTogSmVucyBXaWtsYW5kZXIgPGplbnMud2lrbGFu
ZGVyQGxpbmFyby5vcmc+DQo+Pj4gLS0tDQo+Pj4geGVuL2FyY2gvYXJtL2FybTY0L2FzbS1vZmZz
ZXRzLmMgfCAgOSArKysrKysrDQo+Pj4geGVuL2FyY2gvYXJtL2FybTY0L3NtYy5TICAgICAgICAg
fCA0MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4+IHhlbi9hcmNoL2FybS9p
bmNsdWRlL2FzbS9zbWNjYy5oIHwgNDAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+
PiB4ZW4vYXJjaC9hcm0vdnNtYy5jICAgICAgICAgICAgICB8ICAyICstDQo+Pj4gNCBmaWxlcyBj
aGFuZ2VkLCA5MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4gDQo+Pj4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9hc20tb2Zmc2V0cy5jIGIveGVuL2FyY2gvYXJtL2Fy
bTY0L2FzbS1vZmZzZXRzLmMNCj4+PiBpbmRleCAyODBkZGI1NWJmZDQuLjE3MjFlMWVkMjZlMSAx
MDA2NDQNCj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvYXNtLW9mZnNldHMuYw0KPj4+ICsr
KyBiL3hlbi9hcmNoL2FybS9hcm02NC9hc20tb2Zmc2V0cy5jDQo+Pj4gQEAgLTU2LDYgKzU2LDE1
IEBAIHZvaWQgX19kdW1teV9fKHZvaWQpDQo+Pj4gICAgQkxBTksoKTsNCj4+PiAgICBPRkZTRVQo
U01DQ0NfUkVTX2EwLCBzdHJ1Y3QgYXJtX3NtY2NjX3JlcywgYTApOw0KPj4+ICAgIE9GRlNFVChT
TUNDQ19SRVNfYTIsIHN0cnVjdCBhcm1fc21jY2NfcmVzLCBhMik7DQo+Pj4gKyAgIE9GRlNFVChB
Uk1fU01DQ0NfMV8yX1JFR1NfWDBfT0ZGUywgc3RydWN0IGFybV9zbWNjY18xXzJfcmVncywgYTAp
Ow0KPj4+ICsgICBPRkZTRVQoQVJNX1NNQ0NDXzFfMl9SRUdTX1gyX09GRlMsIHN0cnVjdCBhcm1f
c21jY2NfMV8yX3JlZ3MsIGEyKTsNCj4+PiArICAgT0ZGU0VUKEFSTV9TTUNDQ18xXzJfUkVHU19Y
NF9PRkZTLCBzdHJ1Y3QgYXJtX3NtY2NjXzFfMl9yZWdzLCBhNCk7DQo+Pj4gKyAgIE9GRlNFVChB
Uk1fU01DQ0NfMV8yX1JFR1NfWDZfT0ZGUywgc3RydWN0IGFybV9zbWNjY18xXzJfcmVncywgYTYp
Ow0KPj4+ICsgICBPRkZTRVQoQVJNX1NNQ0NDXzFfMl9SRUdTX1g4X09GRlMsIHN0cnVjdCBhcm1f
c21jY2NfMV8yX3JlZ3MsIGE4KTsNCj4+PiArICAgT0ZGU0VUKEFSTV9TTUNDQ18xXzJfUkVHU19Y
MTBfT0ZGUywgc3RydWN0IGFybV9zbWNjY18xXzJfcmVncywgYTEwKTsNCj4+PiArICAgT0ZGU0VU
KEFSTV9TTUNDQ18xXzJfUkVHU19YMTJfT0ZGUywgc3RydWN0IGFybV9zbWNjY18xXzJfcmVncywg
YTEyKTsNCj4+PiArICAgT0ZGU0VUKEFSTV9TTUNDQ18xXzJfUkVHU19YMTRfT0ZGUywgc3RydWN0
IGFybV9zbWNjY18xXzJfcmVncywgYTE0KTsNCj4+PiArICAgT0ZGU0VUKEFSTV9TTUNDQ18xXzJf
UkVHU19YMTZfT0ZGUywgc3RydWN0IGFybV9zbWNjY18xXzJfcmVncywgYTE2KTsNCj4+PiB9DQo+
Pj4gDQo+Pj4gLyoNCj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L3NtYy5TIGIv
eGVuL2FyY2gvYXJtL2FybTY0L3NtYy5TDQo+Pj4gaW5kZXggOTFiYWU2MmRkNGQyLi5jNTQ2MTky
ZTdmMmQgMTAwNjQ0DQo+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L3NtYy5TDQo+Pj4gKysr
IGIveGVuL2FyY2gvYXJtL2FybTY0L3NtYy5TDQo+Pj4gQEAgLTI3LDMgKzI3LDQ2IEBAIEVOVFJZ
KF9fYXJtX3NtY2NjXzFfMF9zbWMpDQo+Pj4gICAgICAgICBzdHAgICAgIHgyLCB4MywgW3g0LCAj
U01DQ0NfUkVTX2EyXQ0KPj4+IDE6DQo+Pj4gICAgICAgICByZXQNCj4+PiArDQo+Pj4gKw0KPj4g
UGxlYXNlIG9ubHkgYWRkIG9uZSBsaW5lIG9ubHkgaGVyZQ0KPj4+ICsvKg0KPj4+ICsgKiB2b2lk
IGFybV9zbWNjY18xXzJfc21jKGNvbnN0IHN0cnVjdCBhcm1fc21jY2NfMV8yX3JlZ3MgKmFyZ3Ms
DQo+Pj4gKyAqICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGFybV9zbWNjY18xXzJfcmVn
cyAqcmVzKQ0KPj4+ICsgKi8NCj4+PiArRU5UUlkoYXJtX3NtY2NjXzFfMl9zbWMpDQo+Pj4gKyAg
ICAvKiBTYXZlIGByZXNgIGFuZCBmcmVlIGEgR1BSIHRoYXQgd29uJ3QgYmUgY2xvYmJlcmVkICov
DQo+PiBUaGUgY29tbWVudCBoZXJlIHNob3VsZCBiZSBmaXhlZCwgeW91IGFyZSBjbG9iYmVyaW5n
IHgxOSBoZW5jZSB5b3UgbmVlZCB0byBzYXZlIGl0Lg0KPiANCj4gVGhlIGNvbW1lbnQgaXMgY29y
cmVjdC4geDE5IGlzIG9uZSBvZiB0aGUgZmV3IHJlZ2lzdGVycyB0aGF0IHdpbGwgbm90IGJlIGNs
b2JiZXJlZCBieSB0aGUgU01DIGNhbGwuIEJ1dCB3ZSBzdGlsbCBuZWVkIGEgcmVnaXN0ZXIgYmVs
b3cgdG8gc3RvcmUgJ2FyZ3MnLCBzbyB3ZSBuZWVkIHRvIGZyZWUgaXQgKHdoYXQgeW91IGNhbGwg
Y2xvYmJlcikuDQoNCkFkZGluZyDigJxieSBTTUMgY2FsbCIgd291bGQgbWFrZSB0aGlzIG1vcmUg
Y2xlYXINCg0KPiANCj4+PiArICAgIHN0cCAgICAgeDEsIHgxOSwgW3NwLCAjLTE2XSENCj4+PiAr
DQo+Pj4gKyAgICAvKiBFbnN1cmUgYGFyZ3NgIHdvbid0IGJlIGNsb2JiZXJlZCB3aGlsZSBsb2Fk
aW5nIHJlZ3MgaW4gbmV4dCBzdGVwICovDQo+Pj4gKyAgICBtb3YJeDE5LCB4MA0KPj4gWW91IGRv
IG5vdCBuZWVkIHRvIHNhdmUgYXJncyAoYW5kIG5vIGNvZGUgaXMgcmVzdG9yaW5nIGl0KS4NCj4g
DQo+IFRoZSBuZXh0IGluc3RydWN0aW9uIHdpbGwgb3ZlcndyaXRlIHgwLiBTbyBpZiB5b3UgZG9u
J3Qgc2F2ZSAneDAnIHRvICd4MTknIHRoZW4geW91IHdpbGwgbm90IGJlIGFibGUgdG8gbG9hZCB0
aGUgcmVzdCBvZiB0aGUgcmVnaXN0ZXJzLg0KPiANClJpZ2h0DQoNCj4+PiArDQo+Pj4gKyAgICAv
KiBMb2FkIHRoZSByZWdpc3RlcnMgeDAgLSB4MTcgZnJvbSB0aGUgc3RydWN0IGFybV9zbWNjY18x
XzJfcmVncyAqLw0KPj4+ICsgICAgbGRwCXgwLCB4MSwgW3gxOSwgI0FSTV9TTUNDQ18xXzJfUkVH
U19YMF9PRkZTXQ0KPj4+ICsgICAgbGRwCXgyLCB4MywgW3gxOSwgI0FSTV9TTUNDQ18xXzJfUkVH
U19YMl9PRkZTXQ0KPj4+ICsgICAgbGRwCXg0LCB4NSwgW3gxOSwgI0FSTV9TTUNDQ18xXzJfUkVH
U19YNF9PRkZTXQ0KPj4+ICsgICAgbGRwCXg2LCB4NywgW3gxOSwgI0FSTV9TTUNDQ18xXzJfUkVH
U19YNl9PRkZTXQ0KPj4+ICsgICAgbGRwCXg4LCB4OSwgW3gxOSwgI0FSTV9TTUNDQ18xXzJfUkVH
U19YOF9PRkZTXQ0KPj4+ICsgICAgbGRwCXgxMCwgeDExLCBbeDE5LCAjQVJNX1NNQ0NDXzFfMl9S
RUdTX1gxMF9PRkZTXQ0KPj4+ICsgICAgbGRwCXgxMiwgeDEzLCBbeDE5LCAjQVJNX1NNQ0NDXzFf
Ml9SRUdTX1gxMl9PRkZTXQ0KPj4+ICsgICAgbGRwCXgxNCwgeDE1LCBbeDE5LCAjQVJNX1NNQ0ND
XzFfMl9SRUdTX1gxNF9PRkZTXQ0KPj4+ICsgICAgbGRwCXgxNiwgeDE3LCBbeDE5LCAjQVJNX1NN
Q0NDXzFfMl9SRUdTX1gxNl9PRkZTXQ0KPj4+ICsNCj4+PiArICAgIHNtYyAjMA0KPj4+ICsNCj4+
PiArICAgIC8qIExvYWQgdGhlIGByZXNgIGZyb20gdGhlIHN0YWNrICovDQo+Pj4gKyAgICBsZHIJ
eDE5LCBbc3BdDQo+Pj4gKw0KPj4+ICsgICAgLyogU3RvcmUgdGhlIHJlZ2lzdGVycyB4MCAtIHgx
NyBpbnRvIHRoZSByZXN1bHQgc3RydWN0dXJlICovDQo+Pj4gKyAgICBzdHAJeDAsIHgxLCBbeDE5
LCAjQVJNX1NNQ0NDXzFfMl9SRUdTX1gwX09GRlNdDQo+Pj4gKyAgICBzdHAJeDIsIHgzLCBbeDE5
LCAjQVJNX1NNQ0NDXzFfMl9SRUdTX1gyX09GRlNdDQo+Pj4gKyAgICBzdHAJeDQsIHg1LCBbeDE5
LCAjQVJNX1NNQ0NDXzFfMl9SRUdTX1g0X09GRlNdDQo+Pj4gKyAgICBzdHAJeDYsIHg3LCBbeDE5
LCAjQVJNX1NNQ0NDXzFfMl9SRUdTX1g2X09GRlNdDQo+Pj4gKyAgICBzdHAJeDgsIHg5LCBbeDE5
LCAjQVJNX1NNQ0NDXzFfMl9SRUdTX1g4X09GRlNdDQo+Pj4gKyAgICBzdHAJeDEwLCB4MTEsIFt4
MTksICNBUk1fU01DQ0NfMV8yX1JFR1NfWDEwX09GRlNdDQo+Pj4gKyAgICBzdHAJeDEyLCB4MTMs
IFt4MTksICNBUk1fU01DQ0NfMV8yX1JFR1NfWDEyX09GRlNdDQo+Pj4gKyAgICBzdHAJeDE0LCB4
MTUsIFt4MTksICNBUk1fU01DQ0NfMV8yX1JFR1NfWDE0X09GRlNdDQo+Pj4gKyAgICBzdHAJeDE2
LCB4MTcsIFt4MTksICNBUk1fU01DQ0NfMV8yX1JFR1NfWDE2X09GRlNdDQo+Pj4gKw0KPj4+ICsg
ICAgLyogUmVzdG9yZSBvcmlnaW5hbCB4MTkgKi8NCj4+PiArICAgIGxkcCAgICAgeHpyLCB4MTks
IFtzcF0sICMxNg0KPj4gWW91IHNob3VsZCB1c2UgbGRyIGFuZCBqdXN0IGxvYWQgeDE5IHZhbHVl
IGhlcmUuDQo+IA0KPiBBRkFJVSwgdGhpcyB3b3VsZCBtZWFuIGFuIGV4dHJhIGluc3RydWN0aW9u
IHRvIGluY3JlbWVudCBzcCBieSA4IChjb3ZlcmluZyB0aGUgeHpyIHJlZ2lzdGVyKS4NCg0KUmln
aHQgaW5zdHJ1Y3Rpb24gaXMgYWxzbyBpbmNyZW1lbnRpbmcgc3AsIG15IGJhZC4NCg0KQ2hlZXJz
DQpCZXJ0cmFuZA0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQo+
IA0KDQo=

