Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A66B54F480
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jun 2022 11:40:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351257.577842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o28SF-0004yr-Ry; Fri, 17 Jun 2022 09:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351257.577842; Fri, 17 Jun 2022 09:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o28SF-0004wg-Oi; Fri, 17 Jun 2022 09:39:51 +0000
Received: by outflank-mailman (input) for mailman id 351257;
 Fri, 17 Jun 2022 09:39:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Utso=WY=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1o28SD-0004wa-W2
 for xen-devel@lists.xenproject.org; Fri, 17 Jun 2022 09:39:50 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0619.outbound.protection.outlook.com
 [2a01:111:f400:fe05::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d7530dd-ee21-11ec-bd2d-47488cf2e6aa;
 Fri, 17 Jun 2022 11:39:48 +0200 (CEST)
Received: from AS9PR06CA0301.eurprd06.prod.outlook.com (2603:10a6:20b:45b::7)
 by DB9PR08MB6556.eurprd08.prod.outlook.com (2603:10a6:10:261::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Fri, 17 Jun
 2022 09:39:37 +0000
Received: from AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45b:cafe::c8) by AS9PR06CA0301.outlook.office365.com
 (2603:10a6:20b:45b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15 via Frontend
 Transport; Fri, 17 Jun 2022 09:39:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT037.mail.protection.outlook.com (10.152.17.241) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Fri, 17 Jun 2022 09:39:36 +0000
Received: ("Tessian outbound d3318d0cda7b:v120");
 Fri, 17 Jun 2022 09:39:36 +0000
Received: from dfe7596f22f5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2C01085B-3ED4-4F39-9738-9EA955BAB181.1; 
 Fri, 17 Jun 2022 09:39:26 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dfe7596f22f5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Jun 2022 09:39:26 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by PR3PR08MB5803.eurprd08.prod.outlook.com (2603:10a6:102:82::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Fri, 17 Jun
 2022 09:39:23 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::50e5:8757:6643:77f8]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::50e5:8757:6643:77f8%9]) with mapi id 15.20.5353.016; Fri, 17 Jun 2022
 09:39:23 +0000
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
X-Inumbo-ID: 6d7530dd-ee21-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=jkgCm7KmaltYUPrfRCOr476n5xsGrFU+C9TyZmaTnEJFHdWxkpEEova7qwnXAowXJKwIO6Br7fPurJ3YL0ypvjHZpT6dEh6GCzCglHHR/gSSV4bqJ6Ty2blCPGKJNUuJ24vABZ/LaDS0l1+U8hsZKt/OjYP7/ZcqlU2+720SMuRdMUvLzvfsJhDyZTyTFdwbvblYCijctQyTnkHuEitRgu5n1eYLcGLjdPZ4oE/T8Pog32CNCJQ6IWhS5qmabtoHTsvGQoPx9SPNG0aprAdg9hx7Ln4YqqcjN/HPNDE5LB34VUayjHu9+iwlYVcMRaPJ/48dVDZlJGPrd4hEMk0hKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BvXRVqzRMxnScxiVlkOgMiqilzZG79r3Y5G4m344iE=;
 b=CJEJGY3P/q+Trb0Ef5TaJA+2l4UibZv64QQ8uDd0S1S3W0XfOc/h6BrqS/bSuDJl9CwbfMkxx57XqgyNvQtsJRVvP92Wd7xypC+HvwjkJvBxeysAQUGfDXAbQxOWqKzgZPQEoA4a2oC9VMMBgISuTl+EP49/7PbiKbZasOaf2XAouWTEVISSt/aXXV2myte2wuKKEGDcclo1sodY1jYVGAoCsz1BnSvzsmsOdGt1AISfn+RTLqBNlQ5NlVizl+JXbJEH7GyetRBtCxwdguXVMmHLXsYkLK6ZEoBgPAWRZt/iztVRC1MYh3gNYd5zx2at9BEC3yzTsE+xqvTbZYTBJw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BvXRVqzRMxnScxiVlkOgMiqilzZG79r3Y5G4m344iE=;
 b=f063PH3fvdqFe08qljczF2ith5rZZE9lxPp6st3c0w4fRygWBVlEucdBxgFgLWq6hz9ax/LXafGPhLJ64QU3ZzkhK1b5xvbVvqU7gLTb/SC8gWoO6KfNGa4L3xTnnPXcU+z82Nk08boRTAB4bPf/1cYynczyq1FPQZxJIS2DAfY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Si0P3w4EDcZkLSJi85cLeHSHzKqg1omrPuDV4xL38PnTHlUekU+tPUH8snB2DwnxP5i9m2uGhY+04Ts88AUimYo1KxBTC60T8yO8LdtpwTVsaUK4wkm6cIETo0WGwlNkWeGgAK8i+Sgzbj4h+ymUPsrcHJa0QT0SFCBDunwCz6ZTEVdL1b1A+F4tMt0LSQ6DDQ/9KasNDangpmjPQkqdL4wGhG6uYqVqm7xUkAiTsfTT4tfF9C5eNkReN5t9BsxfC73wFWwqoZiNQHhNBINAR94x8JVp5vP4NBCqlPpqm3FToBWZdrUEpMqZMsi7K7FzFdodkmmbKmOKZ47mMjy3QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BvXRVqzRMxnScxiVlkOgMiqilzZG79r3Y5G4m344iE=;
 b=dPGppfWO/C5PYLQc0fDtcQrOvsr4XRCz/iZGBTUnkKUmrHxuxjKJlgvMursMJbxG8xojWaC2XxPUDVzUsUtToFR3Pv38+bCtZ2RTJBAzDVu5RjNMRsf3YxXIyjNFmJbs9fj+gg4tIuAlavIKHXIN0ap3LlrhhS+AjXjCxIMEXCAfosVaIPhRyvLxEL2F3WRNZ7ws9vq7RMfMM/vjFwwmIkuZMc9/MSnVpKoYTtKa0sJU53AN4mcPsogKc1QASZXEuh7Av68qs2SygmE8hEKEXpjxXZGF0bmPHFKPFaAVBKAY8ce8gouFI8X82JInMuQ+UJzdjQzk854VdNo5sKbFHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BvXRVqzRMxnScxiVlkOgMiqilzZG79r3Y5G4m344iE=;
 b=f063PH3fvdqFe08qljczF2ith5rZZE9lxPp6st3c0w4fRygWBVlEucdBxgFgLWq6hz9ax/LXafGPhLJ64QU3ZzkhK1b5xvbVvqU7gLTb/SC8gWoO6KfNGa4L3xTnnPXcU+z82Nk08boRTAB4bPf/1cYynczyq1FPQZxJIS2DAfY=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 2/8] xen/arm: allocate static shared memory to the
 default owner dom_io
Thread-Topic: [PATCH v4 2/8] xen/arm: allocate static shared memory to the
 default owner dom_io
Thread-Index: AQHYac1fSwyDVJqZLUSNuimuDmM9e60jOyEAgACwTiCAAEQEAIAvUw8A
Date: Fri, 17 Jun 2022 09:39:22 +0000
Message-ID:
 <DU2PR08MB732548EE76E21ABF9E8232AAF7AF9@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220517090529.3140417-1-Penny.Zheng@arm.com>
 <20220517090529.3140417-3-Penny.Zheng@arm.com>
 <e587d965-819c-993f-f5fc-0d863d372507@suse.com>
 <DU2PR08MB7325ACBD82A63879F770F8BBF7D19@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <385c964d-0d25-3967-5683-3731dc1eb0c2@suse.com>
In-Reply-To: <385c964d-0d25-3967-5683-3731dc1eb0c2@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A3E40837EBD76946AB659099C70B964D.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 86ac944d-e506-4a01-0c9a-08da50454b18
x-ms-traffictypediagnostic:
	PR3PR08MB5803:EE_|AM5EUR03FT037:EE_|DB9PR08MB6556:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB65561202B7620C03C430C6D4F7AF9@DB9PR08MB6556.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 iDgLTJymoySGxHgi1vekxnt+ivPhTZ847MYXoahoF51+TSxZSZAwtQmZBMKCghnwHjWm5uSjRYH0j85KJISCTcr90a7azt5GCs0tZJMcfkstRQUyDQ1KYvMAaYKNiNxkJpUbgAalw5lCetFN8GA2cPmOLGdGKfGhBzv5jBe4kLSKQq9K5WQr7DYyghgnvDU6VWUoMo3H8H/P8V1DHdCxefjqBXE9LOzGU7IXDLceWFYhF83NMpu6RNdKI0faZvSSy5OxiB422vOoZqn/pEK3HIoI3O12WizGn+PdQcpYCiqH/Sina0hLsc18AobtnA43SzoV7rm5o9xgof/4EcCwOXCsdnWSMznlZyS58l5zKm0pfBGxvej+n10pu1jYmO7TrhX0y5TzE59hSHT1HNdkCLWo/JsTDZhpUtewZE+mma2g/ZQvpHjRXJkRjB6LEw0vE8Qt9dznkcQgukBPvqyJZCTxzJ+Qph6ncblQIf2UgQtAVtLZBNMcmEO6EfhmcTuVAy1+79lCx2vDYn8PVi9jGX6xmzFJPwR+R0WZ3plctwqiY8QLeoc4amVfDq6E3022ipA6XAFEYqPe4v/oYmGMnHMYALK9sRZjMi4DQjihv+3ITDjHKgyK7nq69TL4EqrDVVbdeC+P9HA7txVEEpXtTXOEXJXo5DFWbtJpeJXMfVaivifwmCHgkgOfKU7y6N3b7bb1XGLXyjkfXWpKD/rIlPEuGW8UeHKfBBtwcXWNIkUOl0h8kH7u/31myPSe4dNeyBKMU5iZFuD/YvXwY71/CRN9p0GAbOfj1OAKU5mTaGvGWaUizB7tkRzudkATRX/z
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(2906002)(9686003)(83380400001)(8676002)(53546011)(26005)(7696005)(186003)(8936002)(5660300002)(6506007)(52536014)(33656002)(55016003)(54906003)(4326008)(66476007)(76116006)(498600001)(66946007)(122000001)(86362001)(66556008)(66446008)(38070700005)(64756008)(38100700002)(71200400001)(6916009)(966005)(316002)(21314003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5803
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	51c0e075-91f1-4f3e-731c-08da504542d5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7EQB4kqwFfqWJcgq+hlDE+ldYRcrjsTzIpO7Gq6dXMLCfFdqprrNHzKbTm9D6CM3reE/7ViR4gddp7k4bbxTg07eOQ4BtqMp1gZ6o4WzCO5n6JWTolIuZl/INq+mnoGRaiZOmL+kr2lNQMg98dLP/G3C6j5YOcR14ZNh5k7iczgwypjeyoW9A9wHHyJIhtjIAiJfS5JzJ51+SXfHIyjEyMqUoXVj996vH0Js1EfY+Os76M2TraxtvxdbjgobxVbVhIHJQ1Hy68CxhuLy9Cmk9FcUM32jcZgcbRZprtTWahTtpSaNvDgP0i4hgk55swcoSt2jJ+XPJ3nM14McoYElEpjoGvKQYRKa8/2lZ2Vjyy+f/SdHRvFAyS41WCpKp5/xErsbEWG8atPJUMKAYyZ/IbB7bl0zXSA8FnYuy+/K/bL7SWD4okomqId5aYdl5RVTxK5CPpZ9TaHSoAV+aSv76ad/9gnrNmaR/FKMZEErdiGPVH9l8gPeZBBlbdLgWP4XIFpLf4Y3cYIrn5D1BXrXIgDYNSOQXYq40L5Bd1d6yRmJIBaEWxIOsiUlP/HREsW/8DtSAHROEzBu6y5WN5JC8HtDedFoI2oz+N9Gh68151nknWS9IPSVlg86TJ4It/BQJNzXR2wDV863bdrgRZpMC0jYDH/oOgsz8MnTHpFxQlYc0BxKFIArVvJtVIwIWgMMTEkfExhiPbw0PyMHVRuCmkB6ZfteJAgGfrnk6pybWDmcFEWVD0A6TpGKOiRWkuM6il1Qg4yw8pMkdtMbVrl+ckx3+KJOcCVx4KupiBhMcPc=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(40470700004)(46966006)(36840700001)(26005)(40460700003)(70586007)(9686003)(8936002)(70206006)(7696005)(5660300002)(186003)(6506007)(53546011)(55016003)(316002)(6862004)(356005)(81166007)(86362001)(82310400005)(52536014)(33656002)(2906002)(4326008)(47076005)(8676002)(54906003)(966005)(508600001)(36860700001)(83380400001)(336012)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 09:39:36.8325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ac944d-e506-4a01-0c9a-08da50454b18
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6556

SGkgSmFuDQoNClNvcnJ5IGFib3V0IHRoZSBsYXRlIHJlcGx5LCBnb3Qgc2lkZXRyYWNrZWQgYSBm
ZXcgd2Vla3MuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE1heSAxOCwgMjAy
MiAyOjM2IFBNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT4NCj4gQ2M6
IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IEJlcnRy
YW5kIE1hcnF1aXMNCj4gPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFZvbG9keW15ciBCYWJj
aHVrDQo+IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNp
dHJpeC5jb20+Ow0KPiBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMi84XSB4ZW4vYXJtOiBhbGxvY2F0
ZSBzdGF0aWMgc2hhcmVkIG1lbW9yeSB0byB0aGUNCj4gZGVmYXVsdCBvd25lciBkb21faW8NCj4g
DQo+IE9uIDE4LjA1LjIwMjIgMDU6MTQsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IEhpIEphbg0K
PiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4gU2VudDogV2VkbmVzZGF5LCBNYXkgMTgsIDIw
MjIgMTI6MDEgQU0NCj4gPj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPg0K
PiA+PiBDYzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkN
Cj4gPj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPjsgQmVydHJhbmQNCj4gPj4gTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsg
Vm9sb2R5bXlyIEJhYmNodWsNCj4gPj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgQW5k
cmV3IENvb3Blcg0KPiA+PiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5s
YXANCj4gPj4gPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+
Ow0KPiA+PiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gPj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2NCAyLzhdIHhlbi9hcm06IGFsbG9jYXRlIHN0YXRpYyBzaGFyZWQgbWVtb3J5IHRv
DQo+ID4+IHRoZSBkZWZhdWx0IG93bmVyIGRvbV9pbw0KPiA+Pg0KPiA+PiBPbiAxNy4wNS4yMDIy
IDExOjA1LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPj4+IC0tLSBhL3hlbi9jb21tb24vZG9tYWlu
LmMNCj4gPj4+ICsrKyBiL3hlbi9jb21tb24vZG9tYWluLmMNCj4gPj4+IEBAIC03ODAsNiArNzgw
LDExIEBAIHZvaWQgX19pbml0IHNldHVwX3N5c3RlbV9kb21haW5zKHZvaWQpDQo+ID4+PiAgICAg
ICAqIFRoaXMgZG9tYWluIG93bnMgSS9PIHBhZ2VzIHRoYXQgYXJlIHdpdGhpbiB0aGUgcmFuZ2Ug
b2YgdGhlDQo+IHBhZ2VfaW5mbw0KPiA+Pj4gICAgICAgKiBhcnJheS4gTWFwcGluZ3Mgb2NjdXIg
YXQgdGhlIHByaXYgb2YgdGhlIGNhbGxlci4NCj4gPj4+ICAgICAgICogUXVhcmFudGluZWQgUENJ
IGRldmljZXMgd2lsbCBiZSBhc3NvY2lhdGVkIHdpdGggdGhpcyBkb21haW4uDQo+ID4+PiArICAg
ICAqDQo+ID4+PiArICAgICAqIERPTUlEX0lPIGNvdWxkIGFsc28gYmUgdXNlZCBmb3IgbWFwcGlu
ZyBtZW1vcnkgd2hlbiBubyBleHBsaWNpdA0KPiA+Pj4gKyAgICAgKiBkb21haW4gaXMgc3BlY2lm
aWVkLg0KPiA+Pj4gKyAgICAgKiBGb3IgaW5zdGFuY2UsIERPTUlEX0lPIGlzIHRoZSBvd25lciBv
ZiBtZW1vcnkgcHJlLXNoYXJlZCBhbW9uZw0KPiA+Pj4gKyAgICAgKiBtdWx0aXBsZSBkb21haW5z
IGF0IGJvb3QgdGltZSwgd2hlbiBubyBleHBsaWNpdCBvd25lciBpcyBzcGVjaWZpZWQuDQo+ID4+
PiAgICAgICAqLw0KPiA+Pj4gICAgICBkb21faW8gPSBkb21haW5fY3JlYXRlKERPTUlEX0lPLCBO
VUxMLCAwKTsNCj4gPj4+ICAgICAgaWYgKCBJU19FUlIoZG9tX2lvKSApDQo+ID4+DQo+ID4+IEkn
bSBzb3JyeTogVGhlIGNvbW1lbnQgY2hhbmdlIGlzIGRlZmluaXRlbHkgYmV0dGVyIG5vdyB0aGFu
IGl0IHdhcywNCj4gPj4gYnV0IGl0IGlzIHN0aWxsIHdyaXR0ZW4gaW4gYSB3YXkgcmVxdWlyaW5n
IGZ1cnRoZXIga25vd2xlZGdlIHRvDQo+ID4+IHVuZGVyc3RhbmQgd2hhdCBpdCB0YWxrcyBhYm91
dC4gV2l0aG91dCBmdXJ0aGVyIGNvbnRleHQsICJ3aGVuIG5vDQo+ID4+IGV4cGxpY2l0IGRvbWFp
biBpcyBzcGVjaWZpZWQiIG9ubHkgcmFpc2VzIHF1ZXN0aW9ucy4gSSB3b3VsZCBoYXZlDQo+ID4+
IHRyaWVkIHRvIG1ha2UgYSBzdWdnZXN0aW9uLCBidXQgSSBjYW4ndCByZWFsbHkgZmlndXJlIHdo
YXQgaXQgaXMgdGhhdCB5b3Ugd2FudA0KPiB0byBnZXQgYWNyb3NzIGhlcmUuDQo+ID4NCj4gPiBI
b3cgYWJvdXQgSSBvbmx5IHJldGFpbiB0aGUgIkZvciBpbnN0YW5jZSwgeHh4IiBhbmQgbWFrZSBp
dCBtb3JlIGluIGRldGFpbHMuDQo+ID4gIg0KPiA+IERPTUlEX0lPIGlzIGFsc28gdGhlIGRlZmF1
bHQgb3duZXIgb2YgbWVtb3J5IHByZS1zaGFyZWQgYW1vbmcgbXVsdGlwbGUNCj4gPiBkb21haW5z
IGF0IGJvb3QgdGltZSwgd2hlbiBubyBleHBsaWNpdCBvd25lciBpcyBzcGVjaWZpZWQgd2l0aCAi
b3duZXIiDQo+ID4gcHJvcGVydHkgaW4gc3RhdGljIHNoYXJlZCBtZW1vcnkgZGV2aWNlIG5vZGUu
IFNlZSBzZWN0aW9uDQo+ID4gZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9ib290aW5nLnR4dDog
U3RhdGljIFNoYXJlZCBNZW1vcnkgZm9yIG1vcmUNCj4gZGV0YWlscy4NCj4gPiAiDQo+IA0KPiBU
aGlzIHJlYWRzIHF1aXRlIGEgYml0IGJldHRlci4gWWV0IEkgY29udGludWUgdG8gYmUgcHV6emxl
ZCBhYm91dCB0aGUgYXBwYXJlbnQNCj4gY29uZmxpY3Qgb2YgInByZS1zaGFyZWQiIGFuZCAibm8g
ZXhwbGljaXQgb3duZXIiOiBIb3cgY2FuIG1lbW9yeSBiZSAocHJlLQ0KPiApc2hhcmVkIHdoZW4g
dGhlIG93bmVyIGlzbid0IGtub3duPyBTaG91bGRuJ3QgYWxsIG1lbW9yeSBoYXZlIGFuIG93bmVy
Pw0KPiBPciBhbHRlcm5hdGl2ZWx5IGlmIHRoaXMgc2hhcmluZyBtb2RlbCBkb2Vzbid0IHJlcXVp
cmUgb3duZXJzaGlwLCBzaG91bGRuJ3QgYWxsDQo+IHNoYXJlZCBtZW1vcnkgYmUgb3duZWQgYnkg
RG9tSU8/IEluIGFueSBldmVudCwgdG8gbGVhdmUgc3VjaCBkZXRhaWxzIG91dCBvZg0KPiBoZXJl
LCBwZXJoYXBzIHRoZSBjb21tZW50IGNvdWxkIGNvbnNpc3Qgb2YganVzdCB0aGUgZmlyc3QgcGFy
dCBvZiB3aGF0IHlvdQ0KPiB3cm90ZSwgZW5kaW5nIGF0IHdoZXJlIHRoZSBmaXJzdCBjb21tYSBp
cz8NCj4gDQoNCldlIGhhdmUgYSBzaG9ydCBkaXNjdXNzaW9uIGFib3V0IHRoZSBtZW1vcnkgb3du
ZXJzaGlwIG9uIG15IGRlc2lnbiBsaW5rKA0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL2E1
MGQ5ZmRlLTFkMDYtN2NkYS0yNzc5LTllZWE5ZTFjMDEzNEB4ZW4ub3JnL1QvKQ0KLCB3ZSBoYXZl
IHVzZXIgY2FzZXMgZm9yIGJvdGggc2NlbmFyaW8uDQoNCk9rLCBJIHdpbGwgbW9kaWZ5IHRoZSBj
b21tZW50IGFuZCBvbmx5IGtlZXANCiINCkRPTUlEX0lPIGlzIGFsc28gdGhlIGRlZmF1bHQgb3du
ZXIgb2YgbWVtb3J5IHByZS1zaGFyZWQgYW1vbmcgbXVsdGlwbGUNCmRvbWFpbnMgYXQgYm9vdCB0
aW1lLg0KIg0KIA0KPiBKYW4NCg0K

