Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCA355BEC6
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 08:35:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356988.585377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o64oo-0002ck-8e; Tue, 28 Jun 2022 06:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356988.585377; Tue, 28 Jun 2022 06:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o64oo-0002aC-5N; Tue, 28 Jun 2022 06:35:26 +0000
Received: by outflank-mailman (input) for mailman id 356988;
 Tue, 28 Jun 2022 06:35:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+rg=XD=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1o64om-0002a6-6Z
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 06:35:24 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150050.outbound.protection.outlook.com [40.107.15.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ba6e4f1-f6ac-11ec-b725-ed86ccbb4733;
 Tue, 28 Jun 2022 08:35:21 +0200 (CEST)
Received: from DBBPR09CA0041.eurprd09.prod.outlook.com (2603:10a6:10:d4::29)
 by DBBPR08MB6025.eurprd08.prod.outlook.com (2603:10a6:10:203::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Tue, 28 Jun
 2022 06:35:19 +0000
Received: from DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::27) by DBBPR09CA0041.outlook.office365.com
 (2603:10a6:10:d4::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16 via Frontend
 Transport; Tue, 28 Jun 2022 06:35:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT007.mail.protection.outlook.com (100.127.142.161) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Tue, 28 Jun 2022 06:35:19 +0000
Received: ("Tessian outbound d3318d0cda7b:v120");
 Tue, 28 Jun 2022 06:35:19 +0000
Received: from ce655a689f97.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 72D7B2CA-A58C-45DF-9651-F7C8071684F8.1; 
 Tue, 28 Jun 2022 06:35:13 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ce655a689f97.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 28 Jun 2022 06:35:13 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com (2603:10a6:20b:523::11)
 by HE1PR0801MB1642.eurprd08.prod.outlook.com (2603:10a6:3:86::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Tue, 28 Jun
 2022 06:35:10 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::69e7:f6d2:15e6:d90]) by AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::69e7:f6d2:15e6:d90%6]) with mapi id 15.20.5373.016; Tue, 28 Jun 2022
 06:35:09 +0000
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
X-Inumbo-ID: 7ba6e4f1-f6ac-11ec-b725-ed86ccbb4733
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=CDes4tHhCMeWc4X8urhDz2aoEsMJoKcyZrt4jVZ/mIDj1GxQiNoSWmut7FB91MGyHOk9iQ93yPeelgFCGMBPMYtyP871fAZhIOqLNSFYLpavUz5WC6BTI4BPQWg6gwfoSFRNwFpa1nMMLPshcoQVFNFG2o0+AIsFxDFNhCdAsf6jaYXWugurzg8APdKXeawdt8Y3Peq47j42Le1chpC8XoRVkm37iKk8YxNFX6qwcsIw0JXrgatSQMYnEyiigvTbXOBuoGGQC0Daf6dctnfH9lo2+hHH6C2H5tcFGqjnOUCIEMiHRvDNef7E58E3m0PrPaeN6e0gA0kY62YmARkLCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UH+cqtypElYfY90Wuyq0LIWrsJrUyePK4fCJonffO00=;
 b=QHdixmv1ESTXoG/zDvOyCWo/TyM+sC8bpqxr5F8l9Bh2wdYLg5wkGJpgPJFt7CvSVXoiPG+osM7wRKsiqtZo4iNfb+tUyhl0sD+bhqiW2gl5fp9yTY/93uHgbaEpgdcb/OLel7UGLWDDtpwFkj/KLrJ7RlHmeWRbIyuhzAcdC7q8Lmcr5/OC0+kcAqUUL52MvLh7MHD2xASzi9mVXSMJIAmc4I/Z6GJinDqYU4b6Ot3c1u8kB1LJsR5ekvPtq3zTEfQnl2UPyphV1bmWgcpEFyspLVrZD3oQzOdcHLpuLMWP6QidWjCe0f5ZfUtq1lW8HhHtllIDf1NkvoU7tBUJPg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UH+cqtypElYfY90Wuyq0LIWrsJrUyePK4fCJonffO00=;
 b=IKLMC2LJRTJWAepXmrb3G4NYoFOOC8nABGgVbsWDbUuA0os0KKVXrZjJY770HR3zBEoVxVo+Q0vL4waKTwXxR6M7Znqu1EUYx5vZ8aBCTup1nCKAb2jHD/2dc38/Hj/A/UA/Rlfw4ro+UDLw6ipYAMqr0teAoIbtVN9+aRD8NOY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=af+ZZ7oV3AJzVHaHlXTSwGhObS4zDiY3qSr57OKdqPZfOC4L5HVvcQQ9bmHBH0Qx2Qzu4aKLAjzbWURKoYyPfuQmhkkYatin6NqutdWkStMLJlXr20gX88LqdfXb7f12DgFkgVzCYD5uiir8D70tc3T8oFnmRnTTUGv4lY6Yi/HROxYObG9kVAs0+k4xPgwEmlzBdnOQtFmRCRsfZZTYgJd8R+pErZ2FjLER8Es2v3xd24Ld2CTNlbQNSyFzYQwpZwASweufCjJMIKYc1v1eXXCscDf8fUNqlPk7QhKOrtEsp7oCpiA7QE7rbyjTsfujm6ou8H3bm7ZXaWa7pI/hag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UH+cqtypElYfY90Wuyq0LIWrsJrUyePK4fCJonffO00=;
 b=PEcaaSZlw2QG+EOJE6aTARl3eSIERmeNFyefugKUS3Mty8pF4hG/KkWmZeUp+yN1jN/Y+Q59MbzxEj3Xi31GyP5EAnnraJJu5aC/UmwUDu5Uuxqp/6zxLKQzEo0pKUQz2hK7awlh2YhRtVqJWpNQH6WKom2p+ACWxySMZuHdRn/pvFNHH91FLLSZBZr8Vt8OSKpcIm81LeNUReArYr29KIZisIiB8lDpO9kCsXky5wCKCCqnIwc1IfjzV1NUVJpzCP/Vq3uIm4e5wDdlCi4T+iCeAaPXpSfMPnWF5P25OdGnkg+jhlvb0rj9O1uP3NsHG9dL7oVF11qOumoGdtDJaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UH+cqtypElYfY90Wuyq0LIWrsJrUyePK4fCJonffO00=;
 b=IKLMC2LJRTJWAepXmrb3G4NYoFOOC8nABGgVbsWDbUuA0os0KKVXrZjJY770HR3zBEoVxVo+Q0vL4waKTwXxR6M7Znqu1EUYx5vZ8aBCTup1nCKAb2jHD/2dc38/Hj/A/UA/Rlfw4ro+UDLw6ipYAMqr0teAoIbtVN9+aRD8NOY=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Chen <Wei.Chen@arm.com>
Subject: RE: [PATCH] xen/arm: avoid extra caclulations when setting vtimer in
 context switch
Thread-Topic: [PATCH] xen/arm: avoid extra caclulations when setting vtimer in
 context switch
Thread-Index: AQHYidHeBWnNLqFeFEKI7B/maNA44q1jD7IAgAFN1oA=
Date: Tue, 28 Jun 2022 06:35:09 +0000
Message-ID:
 <AS8PR08MB76964C46AE16A6CEF6DE221892B89@AS8PR08MB7696.eurprd08.prod.outlook.com>
References: <20220627025809.1985720-1-jiamei.xie@arm.com>
 <cbb7a231-0f61-7170-3fc4-d4ae55398f3a@xen.org>
In-Reply-To: <cbb7a231-0f61-7170-3fc4-d4ae55398f3a@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A830DB3F2C79624E866F1B99E7D1065E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 3585c526-3633-4c91-d439-08da58d05ebf
x-ms-traffictypediagnostic:
	HE1PR0801MB1642:EE_|DBAEUR03FT007:EE_|DBBPR08MB6025:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6Gg/iVYkcYtu6RdQ/MOl0u+6FBIifatUWIBmEQUpIZbAIbHMt9xYtelTfZHdbu504ZLy7Ao51RweITXk2pIvCczsWTs0cOthSTpNb6R4eEXYx+VDdtydr7Ds0zlVAB6qVpc3m4A6LC811mLKLXrZAdANbWsr3cyGxyLMpu7bMENHdOIAQlpifXgSwrv0tN70K9IKUoVgmRakDJG4aydRsciseULXEOz2mjNcwUBa//LGTpPOBQXfdXOfW/5AHGkM2o9VVx+xJOjPOg49nczkxoHow/8c4R3YjM6hQdk/vhElguc/WN/3SqJrpbb+8q6+wRy8K399nYIrMGffLtKARmkQAFPeVf8UR2Z4YR8zE3IIuu1IZgStAeFEAN1ismCuwxwZhC7s3M8BSxFNJ2qjAGprkm0AfaovS8comQoWVukOas0jZaNaF66oBAocSV84MNwVqtiQC6gVjXZBAVb2r8vVvnOfwFP89hcA1Of8rggKn00ukYLauf7Smo62bmHFGOJ0ZC+wWDa3bm0dKsnodQhUUOghNSY0RVyqeuxP9VtSxkPzKZ/OuANb1wtFFtsmLdY3JCxGA58607Cg9UR9RqzNJHfGPPm1wXrAIQQpAQVCM8yVrJ5sTrcm1cYFsGA1BX6qenagYsmQzZCMwkI592izyz5n4KkHAwxzo48E/F84iCM0X9Lz8TUTcn+Lm1GoV9/CgwxvEpBpDSIXZFG+UzmHA++54nLdQ9gLtekkjKklXK7YZdKAdzVtg4vDINnc6He922IAnZmPx34OxZxVFOI2Gbo9ZasI3R3SwGY3Fft+4Ax/NnGl/wjxSPt4OOblT/AsfWecJ+xwwexVL/EoHucma6B8h2KDSVG2lA77GMY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(6506007)(83380400001)(186003)(53546011)(478600001)(26005)(41300700001)(54906003)(66476007)(7696005)(38070700005)(8676002)(9686003)(8936002)(4326008)(33656002)(52536014)(5660300002)(38100700002)(2906002)(966005)(76116006)(71200400001)(316002)(55016003)(86362001)(110136005)(66946007)(66556008)(122000001)(66446008)(64756008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1642
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	85d82fa2-20be-4be8-726e-08da58d05925
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nQyfBkBt+H+s2JFwY2wyo2rarUFvrlGy6aYoXMNMlEkP5Do274YFLU/NBFqpzvpb0+rUku7Xy4s5zE1UEkno7F61xdr/2Z6QkunELuFWZUxd6eYdorUZnw6OxhtztLYS+2Tx8PcMV2ICe+UD5orxRa26aU8YPgmQMpYzPE+3YsdasEhIHVf3UWM/R8sByVl2bi7ryq369NfmCprB8tU8Cdr2OXy6Yvq0t/Al1h7YL63tp2bUSMN8bq0uSaYB8hl9S5M3kWHsHE7xr5TZ3yhezY0YkC6j9ICYKGf7nigDjeTzmCSwfYpzZDyvqFE/tnZKIzudj2apw/ClcgvWhJEM2lOt5dyCYOLOrgQ0beV+piw+v4ZPTj2fUu0yJgjA03JEz2om/KSYQb58lPgabwDOmTL6Ldcg5Fi6Iu5u9F7Mutof+BAyh9T2kDtPRHduXIjv40z5u+WU8sOAW6kUuiRuqxx2YmcAoshqHOmSEbOjr7/lPv+4og4YcT+qUxu9KmwcE2KgwHTHUPd6UrYuj2Y4/Qob1AAwj3CXc+b+D2R6P6aOyxQxRtuRbOH9/YUKq6CY0yR2y6S3uX0qWYIWWhvBvedr1zyVRCrXQC+PPUavgfry3Huxzl7hF2C5u+cKjU9PovGcx9+mqQgIQE4DPZAolpW3rtlFlrDo7S8/DPwCOyW4wihHcWVAl7+2ur9+jYIkJZ/nn1M59ZKgnvrbwHdif5WbxndtIq5LF4I89rIy+9prZeaG70Grie1Irf+vrW7/k4VItUrKLAthh4QvduEV/5szno+nS8tclsapv1r/p8E6tck4EWl1AL700wqQsnaI7CUU7sh+Ztmz4ARDxw1JRp71lMX2FFOK63LVhKJ93jE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(346002)(396003)(136003)(46966006)(40470700004)(36840700001)(70206006)(26005)(9686003)(2906002)(70586007)(47076005)(83380400001)(186003)(41300700001)(336012)(8676002)(7696005)(6506007)(5660300002)(478600001)(33656002)(86362001)(8936002)(52536014)(55016003)(4326008)(110136005)(54906003)(40480700001)(81166007)(316002)(40460700003)(82740400003)(356005)(36860700001)(966005)(82310400005)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 06:35:19.2418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3585c526-3633-4c91-d439-08da58d05ebf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6025

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjLlubQ25pyIMjfml6UgMTg6MzYN
Cj4gVG86IEppYW1laSBYaWUgPEppYW1laS5YaWVAYXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZw0KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPjsgQmVydHJhbmQgTWFycXVpcw0KPiA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsg
Vm9sb2R5bXlyIEJhYmNodWsNCj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgV2VpIENo
ZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHhlbi9hcm06IGF2
b2lkIGV4dHJhIGNhY2x1bGF0aW9ucyB3aGVuIHNldHRpbmcgdnRpbWVyDQo+IGluIGNvbnRleHQg
c3dpdGNoDQo+IA0KPiBIaSBKaWFtaQ0KPiANCj4gVGl0bGU6IHMvY2FjbHVsYXRpb25zL2NhbGN1
bGF0aW9ucy8NCj4gDQo+IEhvd2V2ZXIsIEkgdGhpbmsgdGhlIHRpdGxlIHNob3VsZCBtZW50aW9u
IHRoZSBvdmVyZmxvdyByYXRoZXIgdGhhbiB0aGUNCj4gZXh0cmEgY2FsY3VsYXRpb25zLiBUaGUg
Zm9ybWVyIGlzIG1vcmUgaW1wb3J0YW50IHRoZSBsYXR0ZXIuDQo+IA0KSSB3aWxsIGNoYW5nZSB0
aGUgdGl0bGUgdG8gIiB4ZW4vYXJtOiBhdm9pZCBvdmVyZmxvdyB3aGVuIHNldHRpbmcgdnRpbWVy
IGluIGNvbnRleHQgc3dpdGNoIg0KDQo+IE9uIDI3LzA2LzIwMjIgMDM6NTgsIEppYW1laSBYaWUg
d3JvdGU6DQo+ID4gdmlydF92dGltZXJfc2F2ZSBpcyBjYWxjdWxhdGluZyB0aGUgbmV3IHRpbWUg
Zm9yIHRoZSB2dGltZXIgaW46DQo+ID4gInYtPmFyY2gudmlydF90aW1lci5jdmFsICsgdi0+ZG9t
YWluLT5hcmNoLnZpcnRfdGltZXJfYmFzZS5vZmZzZXQNCj4gPiAtIGJvb3RfY291bnQiLg0KPiA+
IEluIHRoaXMgZm9ybXVsYSwgImN2YWwgKyBvZmZzZXQiIG1pZ2h0IGNhdXNlIHVpbnQ2NF90IG92
ZXJmbG93Lg0KPiA+IENoYW5naW5nIGl0IHRvICJ2LT5kb21haW4tPmFyY2gudmlydF90aW1lcl9i
YXNlLm9mZnNldCAtIGJvb3RfY291bnQgKw0KPiA+IHYtPmFyY2gudmlydF90aW1lci5jdmFsIiBj
YW4gcmVkdWNlIHRoZSBwb3NzaWJpbGl0eSBvZiBvdmVyZmxvdw0KPiANCj4gVGhpcyByZWFkIHN0
cmFuZ2UgdG8gbWUuIFdlIHdhbnQgdG8gcmVtb3ZlIHRoZSBvdmVyZmxvdyBjb21wbGV0ZWx5IG5v
dA0KPiByZWR1Y2luZyBpdC4gVGhlIG92ZXJmbG93IGlzIGNvbXBsZXRlbHkgcmVtb3ZlZCBieSBj
b252ZXJ0aW5nIHRoZQ0KPiAib2Zmc2V0IC0gYm91bnRfY291bnQiIHRvIG5zIHVwZnJvbnQuDQo+
IA0KPiBBRkFJQ1QsIHRoZSBjb21taXQgbWVzc2FnZSBkb2Vzbid0IGV4cGxhaW4gdGhhdC4NClRo
YW5rcyBmb3IgcG9pbnRpbmcgb3V0IHRoYXQuIEhvdyBhYm91dCBwdXR0aW5nIHRoZSBjb21taXQg
bWVzc2FnZSBsaWtlIHRoZSBiZWxvdzoNCiAgICB4ZW4vYXJtOiBhdm9pZCBvdmVyZmxvdyB3aGVu
IHNldHRpbmcgdnRpbWVyIGluIGNvbnRleHQgc3dpdGNoDQoNCiAgICB2aXJ0X3Z0aW1lcl9zYXZl
IGlzIGNhbGN1bGF0aW5nIHRoZSBuZXcgdGltZSBmb3IgdGhlIHZ0aW1lciBpbjoNCiAgICAidi0+
YXJjaC52aXJ0X3RpbWVyLmN2YWwgKyB2LT5kb21haW4tPmFyY2gudmlydF90aW1lcl9iYXNlLm9m
ZnNldA0KICAgIC0gYm9vdF9jb3VudCIuDQogICAgSW4gdGhpcyBmb3JtdWxhLCAiY3ZhbCArIG9m
ZnNldCIgbWlnaHQgY2F1c2UgdWludDY0X3Qgb3ZlcmZsb3cuDQogICAgQ2hhbmdpbmcgaXQgdG8g
InRpY2tzX3RvX25zKHYtPmRvbWFpbi0+YXJjaC52aXJ0X3RpbWVyX2Jhc2Uub2Zmc2V0IC0NCiAg
ICBib290X2NvdW50KSArIHRpY2tzX3RvX25zKHYtPmFyY2gudmlydF90aW1lci5jdmFsKSIgY2Fu
IGF2b2lkIG92ZXJmbG93LA0KICAgIGFuZCAidGlja3NfdG9fbnMoYXJjaC52aXJ0X3RpbWVyX2Jh
c2Uub2Zmc2V0IC0gYm9vdF9jb3VudCkiIHdpbGwgYmUNCiAgICBhbHdheXMgdGhlIHNhbWUsIHdo
aWNoIGhhcyBiZWVuIGNhY3VsYXRlZCBpbiBkb21haW5fdnRpbWVyX2luaXQuDQogICAgSW50cm9k
dWNlIGEgbmV3IGZpZWxkIHZpcnRfdGltZXJfYmFzZS5uYW5vc2Vjb25kcyB0byBzdG9yZSB0aGlz
IHZhbHVlDQogICAgZm9yIGFybSBpbiBzdHJ1Y3QgYXJjaF9kb21haW4sIHNvIHdlIGNhbiB1c2Ug
aXQgZGlyZWN0bHkuDQo+IA0KPiA+ICwgYW5kDQo+ID4gImFyY2gudmlydF90aW1lcl9iYXNlLm9m
ZnNldCAtIGJvb3RfY291bnQiIHdpbGwgYmUgYWx3YXlzIHRoZSBzYW1lLA0KPiA+IHdoaWNoIGhh
cyBiZWVuIGNhY3VsYXRlZCBpbiBkb21haW5fdnRpbWVyX2luaXQuIEludHJvZHVjZSBhIG5ldyBm
aWVsZA0KPiA+IHZ0aW1lcl9vZmZzZXQubmFub3NlY29uZHMgdG8gc3RvcmUgdGhpcyB2YWx1ZSBm
b3IgYXJtIGluIHN0cnVjdA0KPiA+IGFyY2hfZG9tYWluLCBzbyB3ZSBjYW4gdXNlIGl0IGRpcmVj
dGx5IGFuZCBleHRyYSBjYWNsdWxhdGlvbnMgY2FuIGJlDQo+ID4gYXZvaWRlZC4NCj4gPg0KPiA+
IFRoaXMgcGF0Y2ggaXMgZW5saWdodGVuZWQgZnJvbSBbMV0uDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBKaWFtZWkgWGllIDxqaWFtZWkueGllQGFybS5jb20+DQo+ID4NCj4gPiBbMV0gaHR0cHM6
Ly93d3cubWFpbC1hcmNoaXZlLmNvbS94ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
L21zZzEyMzEzOS5odG0NCj4gDQo+IFRoaXMgbGluayBkb2Vzbid0IHdvcmsuIEJ1dCBJIHdvdWxk
IHBlcnNvbmFsbHkgcmVtb3ZlIGl0IGZyb20gdGhlIGNvbW1pdA0KPiBtZXNzYWdlIChvciBhZGQg
LS0tKSBiZWNhdXNlIGl0IGRvZXNuJ3QgYnJpbmcgdmFsdWUgKHRoaXMgcGF0Y2ggbG9va3MNCj4g
bGlrZSBhIHYyIHRvIG1lKS4NClNvcnJ5LCBhICdsJyBpcyBtaXNzaW5nIGF0IHRoZSBlbmQgb2Yg
dGhlIGxpbmsuICBUaGUgbGluayBpcyAgaHR0cHM6Ly93d3cubWFpbC1hcmNoaXZlLmNvbS94ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcvbXNnMTIzMTM5Lmh0bWwgLg0KSSB3aWxsIHB1dCBp
dCBhZnRlciAtLS0gaW4gdjMuDQo+IA0KPiA+IC0tLQ0KPiA+IHhlbi9hcmNoL2FybS9pbmNsdWRl
L2FzbS9kb21haW4uaCB8IDQgKysrKw0KPiA+ICAgeGVuL2FyY2gvYXJtL3Z0aW1lci5jICAgICAg
ICAgICAgIHwgNiArKysrLS0NCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNs
dWRlL2FzbS9kb21haW4uaA0KPiBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9kb21haW4uaA0K
PiA+IGluZGV4IGVkNjNjMmI2ZjkuLjk0ZmU1YjY0NDQgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2Fy
Y2gvYXJtL2luY2x1ZGUvYXNtL2RvbWFpbi5oDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL2luY2x1
ZGUvYXNtL2RvbWFpbi5oDQo+ID4gQEAgLTczLDYgKzczLDEwIEBAIHN0cnVjdCBhcmNoX2RvbWFp
bg0KPiA+ICAgICAgICAgICB1aW50NjRfdCBvZmZzZXQ7DQo+ID4gICAgICAgfSB2aXJ0X3RpbWVy
X2Jhc2U7DQo+ID4NCj4gPiArICAgIHN0cnVjdCB7DQo+ID4gKyAgICAgICAgaW50NjRfdCBuYW5v
c2Vjb25kczsNCj4gDQo+IFRoaXMgc2hvdWxkIGJlIHNfdGltZV90IHRvIG1hdGNoIHRoZSBhcmd1
bWVudCBvZiBzZXRfdGltZXIoKSBhbmQgcmV0dXJuDQo+IG9mIHRpY2tzX3RvX25zKCkuDQo+IA0K
PiA+ICsgICAgfSB2dGltZXJfb2Zmc2V0Ow0KPiANCj4gV2h5IGFyZSB5b3UgYWRkaW5nIGEgbmV3
IHN0cnVjdHVyZSByYXRoZXIgdGhhbiByZS11c2luZyB2aXJ0X3RpbWVyX2Jhc2U/DQpTdXJlLCBJ
J2xsIGFkZCB0aGlzIGZpZWxkIGluIHZpcnRfdGltZXJfYmFzZS4NCiAgICAgc3RydWN0IHsNCiAg
ICAgICAgIHVpbnQ2NF90IG9mZnNldDsNCiAgICAgICAgIHNfdGltZV90IG5hbm9zZWNvbmRzOw0K
ICAgICB9IHZpcnRfdGltZXJfYmFzZTsNCj4gDQo+ID4gKw0KPiA+ICAgICAgIHN0cnVjdCB2Z2lj
X2Rpc3QgdmdpYzsNCj4gPg0KPiA+ICAgICAgIHN0cnVjdCB2dWFydCB7DQo+ID4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS92dGltZXIuYyBiL3hlbi9hcmNoL2FybS92dGltZXIuYw0KPiA+IGlu
ZGV4IDZiNzhmZWE3N2QuLjU0MTYxZTVmZWEgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gvYXJt
L3Z0aW1lci5jDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL3Z0aW1lci5jDQo+ID4gQEAgLTY0LDYg
KzY0LDcgQEAgaW50IGRvbWFpbl92dGltZXJfaW5pdChzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QN
Cj4geGVuX2FyY2hfZG9tYWluY29uZmlnICpjb25maWcpDQo+ID4gICB7DQo+ID4gICAgICAgZC0+
YXJjaC52aXJ0X3RpbWVyX2Jhc2Uub2Zmc2V0ID0gZ2V0X2N5Y2xlcygpOw0KPiA+ICAgICAgIGQt
PnRpbWVfb2Zmc2V0LnNlY29uZHMgPSB0aWNrc190b19ucyhkLT5hcmNoLnZpcnRfdGltZXJfYmFz
ZS5vZmZzZXQgLQ0KPiBib290X2NvdW50KTsNCj4gPiArICAgIGQtPmFyY2gudnRpbWVyX29mZnNl
dC5uYW5vc2Vjb25kcyA9IGQtPnRpbWVfb2Zmc2V0LnNlY29uZHM7DQo+IA0KPiBIbW1tLi4uIEkg
ZmluZCBvZGQgdG8gYXNzaWduIGEgZmllbGQgIm5hbm9zZWNvbmRzIiB0byAic2Vjb25kcyIuIEkg
d291bGQNCj4gc3VnZ2VzdCB0byByZS1vcmRlciBzbyB5b3UgZmlyc3Qgc2V0IG5hbm9zZWNvbmRz
IGFuZCB0aGVuIHNldCBzZWNvbmRzLg0KPiANCj4gVGhpcyB3aWxsIG1ha2UgbW9yZSBvYnZpb3Vz
IHRoYXQgdGhpcyBpcyBub3QgYSBtaXN0YWtlIGFuZCAic2Vjb25kcyINCj4gd2lsbCBiZSBjbG9z
ZXIgdG8gdGhlIGRvX2RpdigpIGJlbG93Lg0KSXMgaXQgb2sgdG8gcmVtb3ZlIGRvX2RpdiBhbmQg
d3JpdGUgbGlrZSBiZWxvdz8NCiAgICBkLT5hcmNoLnZpcnRfdGltZXJfYmFzZS5uYW5vc2Vjb25k
cyA9DQogICAgICAgIHRpY2tzX3RvX25zKGQtPmFyY2gudmlydF90aW1lcl9iYXNlLm9mZnNldCAt
IGJvb3RfY291bnQpOw0KICAgIGQtPnRpbWVfb2Zmc2V0LnNlY29uZHMgPSBkLT5hcmNoLnZpcnRf
dGltZXJfYmFzZS5uYW5vc2Vjb25kcyAvDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAx
MDAwMDAwMDAwOw0KDQpCZXN0IHdpc2hlcw0KSmlhbWVpIFhpZQ0KDQoNCj4gDQo+ID4gICAgICAg
ZG9fZGl2KGQtPnRpbWVfb2Zmc2V0LnNlY29uZHMsIDEwMDAwMDAwMDApOw0KPiA+DQo+ID4gICAg
ICAgY29uZmlnLT5jbG9ja19mcmVxdWVuY3kgPSB0aW1lcl9kdF9jbG9ja19mcmVxdWVuY3k7DQo+
ID4gQEAgLTE0NCw4ICsxNDUsOSBAQCB2b2lkIHZpcnRfdGltZXJfc2F2ZShzdHJ1Y3QgdmNwdSAq
dikNCj4gPiAgICAgICBpZiAoICh2LT5hcmNoLnZpcnRfdGltZXIuY3RsICYgQ05UeF9DVExfRU5B
QkxFKSAmJg0KPiA+ICAgICAgICAgICAgISh2LT5hcmNoLnZpcnRfdGltZXIuY3RsICYgQ05UeF9D
VExfTUFTSykpDQo+ID4gICAgICAgew0KPiA+IC0gICAgICAgIHNldF90aW1lcigmdi0+YXJjaC52
aXJ0X3RpbWVyLnRpbWVyLCB0aWNrc190b19ucyh2LQ0KPiA+YXJjaC52aXJ0X3RpbWVyLmN2YWwg
Kw0KPiA+IC0gICAgICAgICAgICAgICAgICB2LT5kb21haW4tPmFyY2gudmlydF90aW1lcl9iYXNl
Lm9mZnNldCAtIGJvb3RfY291bnQpKTsNCj4gPiArICAgICAgICBzZXRfdGltZXIoJnYtPmFyY2gu
dmlydF90aW1lci50aW1lciwNCj4gPiArICAgICAgICAgICAgICAgICAgdi0+ZG9tYWluLT5hcmNo
LnZ0aW1lcl9vZmZzZXQubmFub3NlY29uZHMgKw0KPiA+ICsgICAgICAgICAgICAgICAgICB0aWNr
c190b19ucyh2LT5hcmNoLnZpcnRfdGltZXIuY3ZhbCkpOw0KPiA+ICAgICAgIH0NCj4gPiAgIH0N
Cj4gPg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

