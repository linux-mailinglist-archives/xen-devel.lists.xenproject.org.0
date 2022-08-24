Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3A859FD76
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 16:42:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392765.631324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQraO-00024K-JI; Wed, 24 Aug 2022 14:42:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392765.631324; Wed, 24 Aug 2022 14:42:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQraO-00021u-G9; Wed, 24 Aug 2022 14:42:28 +0000
Received: by outflank-mailman (input) for mailman id 392765;
 Wed, 24 Aug 2022 14:42:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EISj=Y4=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oQraM-00021n-J4
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 14:42:26 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2040.outbound.protection.outlook.com [40.107.105.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8108d8d-23ba-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 16:42:25 +0200 (CEST)
Received: from AM5P194CA0003.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::13)
 by DB6PR08MB2853.eurprd08.prod.outlook.com (2603:10a6:6:1d::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 24 Aug
 2022 14:42:20 +0000
Received: from AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::5) by AM5P194CA0003.outlook.office365.com
 (2603:10a6:203:8f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14 via Frontend
 Transport; Wed, 24 Aug 2022 14:42:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT063.mail.protection.outlook.com (100.127.140.221) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Wed, 24 Aug 2022 14:42:19 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Wed, 24 Aug 2022 14:42:19 +0000
Received: from 74c934ce890e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8BC39B87-501B-4D53-9FBA-5F9625FE7711.1; 
 Wed, 24 Aug 2022 14:42:09 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 74c934ce890e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 Aug 2022 14:42:09 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DU0PR08MB8495.eurprd08.prod.outlook.com (2603:10a6:10:404::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 24 Aug
 2022 14:42:07 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5546.022; Wed, 24 Aug 2022
 14:42:07 +0000
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
X-Inumbo-ID: f8108d8d-23ba-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AE0+CoKLyl04h3hplP/Nx516XiS2/DTy2GrG8JYMVtqjflGOkgJid6IXiQxi5fclBVzKseCuKOLcP3AdIgqk0h6ci79RWrpLN8IweMq5/QSR7WErD6yjwU1fDp5PmL4iuK0pml1QsHYjqKufBZPmQHXnPCaaYBmm2v5CShxyTN2NmchTpgyVIVVugtSqStH8NqMRyBZyFIc014Pb2VZ7/TluZQ+U22k7VpPdtLb4aKefYcj2mjovpo+vCOPPAzbYzNhlA83I1bHROAL4ayp62APbr77y4oHsOJ/13HGLPhU8xJtLoHf6C1PA+aY3kFA22Wxrl3OJ8ZMoEjRH7CHChw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYzLOy85i8ksr3gQDKRbA4+ll4/deoogWansLh9DBs8=;
 b=hG/EpiCuQ/6BpvV+q2tVB+cYHkoN9ggSvM36AJUIdlD36DmjQUmsCIdb40g4Z+xKbQP0A3wwE6He4eWz2XFUY8kyxXOUk4GX7jNIwlR4+Wvy1r/R2XLBn7UVzcD77eM4MGGNRL2oksCUiiHCK00favpTvgz7wkWPvsWkGoI7buDxyKpP28gz6NgbjfM7D2E7RWTntlF/sz6Oh7kQ5wC3lsoClKJsmsuwSiZmqQvv+WMPwpRX37V2MTNb4zY0dzouHxfHnKy+sSlUwfFmvxueToOin8Zg6Ndmt3EgnbHYlRn0RE9oBJrW0SkaFvIvSfqen9vUTQYIKcgf4ocvdEGNDg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYzLOy85i8ksr3gQDKRbA4+ll4/deoogWansLh9DBs8=;
 b=LIZFhnWEC3AlFSWndU6LWaKVs5wYTshxLfGa/s6ovIY0qearGrVM7naiPgI/u49HNZALLjzU1IEJlgCZ5K2GHbKRFuX9Gbw6nYni5uRhcOIGe+1uW9GKIga1uOaUlIwJpSxnpVPkevk7ydtPxwebCeGsmhrokjnS5W3cJ4BK9Hk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 216334c9318a0ab5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hNUmm52Xg/4Fs/W0bhChQ659+bUYvn+sg+8kkZ/96OcRLJWvyHgUP/2HdkFZHru+kRy3ghGPcDzk1vIzYpoeCYhIJP98AEE/6G7lOAQOxH+4cL7h7AZTiGukZFFnhWw91itN/U9X70U+M19R3j8Bktvj5ZStcjmxNMlBGB1DT/EZ0JIIpWGS2i2GodrQgh1JbjETLCltgXiRVxQtBQUIDaC0ek7NCbSoUcfR5//syRyQs4e9DlgdrZKOktVEDr3GWAa8TKMAuyD9dnE1sNkH14FTbzDR55gthzjBdaZ16HAYHuEog8MaZG7OXw8sT+VTPAcvnFmd4W+evVcG+P0HRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYzLOy85i8ksr3gQDKRbA4+ll4/deoogWansLh9DBs8=;
 b=IIgqD9fT476/rVG0+0b5GwtzKZJg14rmlbrOBC/13zyPpd/yCPv+3dbZtKpXCEEQm8wu6fEbso+YuV1U8KmJHv+IZFUMrRYjf734nyBlsG10895HvCM58IZhbAnBDleZrd43yIVz3FIo4DK5iEGtpc/u7VhjQHozDcMLGCnIkiGElaKc9y+jyNHion0Li/JrejgPNsgsxZG070p00rkkpiBiH56s/Nc/VmNpWUotMLsPYl2oMOOAEzEvyGzKlQ6IRVUOwgYj4g6jDvZ4cVAYyU92bnoVPZdYgF3NAeMbjp2dwpAMqTd63BT16lrK6ZS27n4icp1trexaShKx40w90Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYzLOy85i8ksr3gQDKRbA4+ll4/deoogWansLh9DBs8=;
 b=LIZFhnWEC3AlFSWndU6LWaKVs5wYTshxLfGa/s6ovIY0qearGrVM7naiPgI/u49HNZALLjzU1IEJlgCZ5K2GHbKRFuX9Gbw6nYni5uRhcOIGe+1uW9GKIga1uOaUlIwJpSxnpVPkevk7ydtPxwebCeGsmhrokjnS5W3cJ4BK9Hk=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 7/7] xen/arm: introduce new xen,enhanced property value
Thread-Topic: [PATCH v2 7/7] xen/arm: introduce new xen,enhanced property
 value
Thread-Index: AQHYs7NVSZ6RtK1DJkmDvOUuzqeVhq28SEyAgAG2wACAAAxAgIAAHKoA
Date: Wed, 24 Aug 2022 14:42:07 +0000
Message-ID: <3D33311C-5FBA-4C46-A18F-105DE814C306@arm.com>
References: <cover.1660902588.git.rahul.singh@arm.com>
 <2fb69ff7cf9a36dd1294da4f9f4b968ff7076d42.1660902588.git.rahul.singh@arm.com>
 <d5ed6097-8a08-eb4d-35a0-ab28f82b881f@xen.org>
 <1E823DBF-8576-4E26-B12D-B69CE581F36F@arm.com>
 <c9330b72-193c-5478-9bad-9593ac7398a9@xen.org>
In-Reply-To: <c9330b72-193c-5478-9bad-9593ac7398a9@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8cd32e5f-7385-4359-dc47-08da85ded937
x-ms-traffictypediagnostic:
	DU0PR08MB8495:EE_|AM7EUR03FT063:EE_|DB6PR08MB2853:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 e2nJCpPWMZ2OQ79tZPmNodVwN2bMDYzUZcDhNnODjIE+muc0cZt4p1HYTQeJslGxeNsXh1w12jHoLmDDUheGu84DGRobuavDRp8walAsi96GX+EPZQzd2nPtCwPODwmaKlvMU8JiJabXKRcGCNwGyhiz/TbUFrdkyxXAouF6KLuhpYouBtLSf1JRWwMvSxjAjjVz7Vjiy6tyPqU8vGu6RhDHvHpupPJtus0Go7uVVUVAMyqvG05H3Z90OaPZnxzk+EgeUGqhKbnqDELZs5SovBdMZ1LsvJj5LNqeyc4ay48nq9IMPL7928xHhXhJ1iOKfP7uduFJZykjUzByzTesRNLdhFTWzZqaZYHnwCf3faJWpjqQvHZGx/pbuLdZwz4BCwNAdNSzBpOJQenyVidywobKrOk4KYtuO9OqrO1JCSU2AavduTQw9iLxEAX28nexmO2tL2xt9pWgfTsxPfZ5f22jGy40lB/ktuW0xeMC118vPSznav/z9AC3HaHl/E4iofo6Hl9n4L+lQPPHKwUdAytF6GPjs8KqmcYcHm6S0VGEDL+pD9VerCcvCdNFNg8up35wdm7us13OwUWdk3QVog9vtydXfH/Wz4AMljEm8H2oA15ZbPwaKP/sD/XFdfEQ9Zb+zYJI6xqxFYmiFy83KIXwH9cRpQrj2/dkkiBe88XJ6+g8PnQEjr9tZWBC/NDU3AaQ+QUkZXe0p5EVPvzxCVE1MDdKhvyPswfq9mPx6iCIJDibx5zYKmzNj6Ik3ToGzVPDeIN+sbEksbLg3543lxebk6tTn28DZFEc56KxpXk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(36756003)(66476007)(316002)(2616005)(6506007)(38070700005)(186003)(2906002)(6916009)(54906003)(71200400001)(91956017)(76116006)(38100700002)(8676002)(4326008)(66556008)(64756008)(122000001)(6486002)(66946007)(66446008)(8936002)(26005)(86362001)(478600001)(53546011)(41300700001)(5660300002)(33656002)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD210A6CC80F24449073BAA9108738B5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8495
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e7d1e706-93d7-422a-6901-08da85ded194
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DwYmwshbMud1jC78vmKqNtReBa3tFWWs2DYDfo2w90Cq+dSz7MQJZjkU8fnMXSttRvsTDsljAX/TIQi5ihn1HzQSUk1tt9bUIzx2EWJxqmTemZ5Dgf3GTdtJlsoOoRyaX/T9axPU5QA18ptjgbbg0a2KY1ebZCS+yG2ZVDVC+8FP6uBzq+cAlWHic0uYXooNhotIAsJ32dfdQ3RMc4ZEXmrgMpj4uALKGWI1FBQWGPDqs4MN1D2wqdTdC0uvbvmEPXa6BxAH/7GGDhZOqUZxIxKTOojV2dEmEUlJskVXeepSxXexSRvhC/PBNOdNxPyHceVZiFDUvh8Vhgi0N6oIgOdref1du/5WJuwcqI4P3Eh/GVx22F6wWOXWa3w4G6h0AcmrTHOj/tIjFLVZB+O4aRwgvllT/gz8aZNiuxoxtSiDSdBIr2Ulo3eLaSmmb+PErg0ZBLrQ6g6tY2GgIQfeEOEmtD/yG/XTirLcgbvkH1uwHdw9xw3kt0cTww5RhxURqQKNzxYN7g/ei87jpXPSXwKjIgpK5z/DgGBJ6NSm0M4qXBGll9wtQiu/PXe6gntDOtcGShbFeh3gNf5Tku4auiSCOLXg1ycC6A0nSdNsEFUoKcqgNKgXlMCDUb0p+MWU3xXZuEYXlnIjB9+p357gVN+udYpf8NJOwvJLTDu3jft16Y+U0snSYGPd0oN9VvefAYmkPhxRfQWwQ4MOEk9Z0RLQY+q75blnFzUDpSFu57juIksiB7JxDIy6X1BqVCYoLrZlQww9QXi4svj/i4GFaw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39860400002)(376002)(396003)(36840700001)(40470700004)(46966006)(2616005)(5660300002)(36756003)(40480700001)(47076005)(33656002)(6486002)(316002)(82740400003)(54906003)(2906002)(81166007)(478600001)(356005)(40460700003)(8936002)(41300700001)(53546011)(4326008)(8676002)(82310400005)(26005)(186003)(6512007)(6506007)(107886003)(336012)(70206006)(6862004)(86362001)(70586007)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 14:42:19.9272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd32e5f-7385-4359-dc47-08da85ded937
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2853

SGkgSnVsaWVuLA0KDQo+IE9uIDI0IEF1ZyAyMDIyLCBhdCAxOjU5IHBtLCBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMjQvMDgvMjAyMiAxMzox
NSwgUmFodWwgU2luZ2ggd3JvdGU6DQo+PiBIaSBKdWxpZW4sDQo+IA0KPiBIaSBSYWh1bCwNCj4g
DQo+PiBQbGVhc2UgbGV0IG1lIGtub3cgeW91ciB2aWV3IG9uIHRoaXMuDQo+PiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWls
ZC5jDQo+PiBpbmRleCBiZmU3YmM2YjM2Li5hMWUyM2VlZTU5IDEwMDY0NA0KPj4gLS0tIGEveGVu
L2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1
aWxkLmMNCj4+IEBAIC0zNTYyLDEyICszNTYyLDcgQEAgc3RhdGljIGludCBfX2luaXQgY29uc3Ry
dWN0X2RvbVUoc3RydWN0IGRvbWFpbiAqZCwNCj4+ICAgIGlmICggcmMgPT0gLUVJTFNFUSB8fA0K
Pj4gICAgICByYyA9PSAtRU5PREFUQSB8fA0KPj4gICAgICAocmMgPT0gMCAmJiAhc3RyY21wKGRv
bTBsZXNzX2VuaGFuY2VkLCDigJxlbmFibGVk4oCdKSkgKQ0KPj4gLSAgew0KPj4gLSAgICBpZiAo
IGhhcmR3YXJlX2RvbWFpbiApDQo+PiAgICAgICAga2luZm8uZG9tMGxlc3NfZW5oYW5jZWQgPSB0
cnVlOw0KPj4gLSAgICBlbHNlDQo+PiAtICAgICAgcGFuaWMo4oCcVHJpZWQgdG8gdXNlIHhlbixl
bmhhbmNlZCB3aXRob3V0IGRvbTBcbuKAnSk7DQo+PiAtICB9DQo+IA0KPiBZb3UgY2FuJ3QgdXNl
ICJ4ZW4sZW5oYW5jZWQiIHdpdGhvdXQgZG9tMC4gSW4gZmFjdCwgeW91IHdpbGwgZW5kIHVwIHRv
IGRlcmVmZXJlbmNlIE5VTEwgaW4gYWxsb2NfeGVuc3RvcmVfZXZ0Y2huKCkuIFRoYXQncyBiZWNh
dXNlICJ4ZW4sZW5oYW5jZWQiIG1lYW5zIHRoZSBkb21haW4gd2lsbCBiZSBhYmxlIHRvIHVzZSBY
ZW5zdG9yZWQuDQo+IA0KPiBOb3cgaWYgeW91IHdhbnQgdG8gc3VwcG9ydCB5b3VyIGZlYXR1cmUg
d2l0aG91dCBhIGRvbTAuIFRoZW4gSSB0aGluayB3ZSB3YW50IHRvIGludHJvZHVjZSBhbiBvcHRp
b24gd2hpY2ggd291bGQgYmUgdGhlIHNhbWUgYXMgInhlbixlbmhhbmNlZCIgYnV0IGRvZXNuJ3Qg
ZXhwb3NlIFhlbnN0b3JlZC4NCg0KSWYgd2UgbW9kaWZ5IHRoZSBwYXRjaCBhcyBiZWxvdyB3ZSBj
YW4gdXNlIHRoZSAieGVuLGVuaGFuY2VkIiBmb3IgZG9tVXMgd2l0aG91dCBkb20wLg0KSSB0ZXN0
ZWQgdGhlIHBhdGNoIGFuZCBpdHMgd29ya3MgZmluZS4gRG8geW91IHNlZSBhbnkgaXNzdWUgd2l0
aCB0aGlzIGFwcHJvYWNoPw0KDQoNCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1
aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCmluZGV4IGNmZmQ1MDhhZjIuLjg3
MDg0NmI3NDIgMTAwNjQ0DQotLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCisrKyBi
L3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KQEAgLTM1NjgsMTIgKzM1NjgsNyBAQCBzdGF0
aWMgaW50IF9faW5pdCBjb25zdHJ1Y3RfZG9tVShzdHJ1Y3QgZG9tYWluICpkLA0KICAgICBpZiAo
IHJjID09IC1FSUxTRVEgfHwNCiAgICAgICAgICByYyA9PSAtRU5PREFUQSB8fA0KICAgICAgICAg
IChyYyA9PSAwICYmICFzdHJjbXAoZG9tMGxlc3NfZW5oYW5jZWQsICJlbmFibGVkIikpICkNCi0g
ICAgew0KLSAgICAgICAgaWYgKCBoYXJkd2FyZV9kb21haW4gKQ0KICAgICAgICAgICAgIGtpbmZv
LmRvbTBsZXNzX2VuaGFuY2VkID0gdHJ1ZTsNCi0gICAgICAgIGVsc2UNCi0gICAgICAgICAgICBw
YW5pYygiVHJpZWQgdG8gdXNlIHhlbixlbmhhbmNlZCB3aXRob3V0IGRvbTBcbiIpOw0KLSAgICB9
DQogDQogICAgIGlmICggdmNwdV9jcmVhdGUoZCwgMCkgPT0gTlVMTCApDQogICAgICAgICByZXR1
cm4gLUVOT01FTTsNCkBAIC0zNjEzLDkgKzM2MDgsOCBAQCBzdGF0aWMgaW50IF9faW5pdCBjb25z
dHJ1Y3RfZG9tVShzdHJ1Y3QgZG9tYWluICpkLA0KICAgICBpZiAoIHJjIDwgMCApDQogICAgICAg
ICByZXR1cm4gcmM7DQogDQotICAgIGlmICgga2luZm8uZG9tMGxlc3NfZW5oYW5jZWQgKQ0KKyAg
ICBpZiAoIGtpbmZvLmRvbTBsZXNzX2VuaGFuY2VkICYmIGhhcmR3YXJlX2RvbWFpbiApDQogICAg
IHsNCi0gICAgICAgIEFTU0VSVChoYXJkd2FyZV9kb21haW4pOw0KICAgICAgICAgcmMgPSBhbGxv
Y194ZW5zdG9yZV9ldnRjaG4oZCk7DQogICAgICAgICBpZiAoIHJjIDwgMCApDQogICAgICAgICAg
ICAgcmV0dXJuIHJjOw0KIA0KDQpSZWdhcmRzLA0KUmFodWwNCg0K

