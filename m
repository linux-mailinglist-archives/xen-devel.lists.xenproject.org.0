Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4417258EA0C
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 11:51:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383487.618659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLiN4-0007GO-5Y; Wed, 10 Aug 2022 09:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383487.618659; Wed, 10 Aug 2022 09:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLiN4-0007ED-2X; Wed, 10 Aug 2022 09:51:26 +0000
Received: by outflank-mailman (input) for mailman id 383487;
 Wed, 10 Aug 2022 09:51:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ddlM=YO=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oLiN3-00079r-2v
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 09:51:25 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2059.outbound.protection.outlook.com [40.107.20.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe38e372-1891-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 11:51:24 +0200 (CEST)
Received: from FR0P281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::13)
 by AM0PR08MB3715.eurprd08.prod.outlook.com (2603:10a6:208:10b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 10 Aug
 2022 09:51:20 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:15:cafe::bd) by FR0P281CA0008.outlook.office365.com
 (2603:10a6:d10:15::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11 via Frontend
 Transport; Wed, 10 Aug 2022 09:51:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.16 via Frontend Transport; Wed, 10 Aug 2022 09:51:19 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Wed, 10 Aug 2022 09:51:19 +0000
Received: from da728d39ea7a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 40E66EBA-6905-4625-B89A-B928C202530E.1; 
 Wed, 10 Aug 2022 09:51:08 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id da728d39ea7a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 10 Aug 2022 09:51:08 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DB3PR08MB9058.eurprd08.prod.outlook.com (2603:10a6:10:430::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 10 Aug
 2022 09:51:06 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%4]) with mapi id 15.20.5525.011; Wed, 10 Aug 2022
 09:51:06 +0000
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
X-Inumbo-ID: fe38e372-1891-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=O/uttVfUwJeXVZi4VhWdLAHfe6lnv5oybfpmR2Uuu4oMNWbvFOGb3p+XpHa0mNk/5RBqhCdJCudK/vQGH30xy29G2cyg+H80hY86T1MsJmGAKeZfyyY+64t16Gu2i/sAnE2nlqAcKgDjK9pn/dxFGeehoSSzWo9zEpFCcBfwgOs4NRCe5ThAerLDtgRVNp5mdE/kiC2uaBJVyHac8VDZjUWjNjRdaQOOirYW7PSW93So6pAhCQaGOUWkc9oVHNclOlt/RfxJlUw31GzL6waEsGWTHPE9gRVlo1LzbMrWK1eojyRwfWCi///yEZ+zXZsXYpvImmeLpAqPC0iSBqFvAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUHtNR5I2sUhksranR3Xiofr/HqawJ7BxvPt+dq9Blw=;
 b=LkyfhBjeMOW98koJjuTCfZdRdBoWcqT/Q9gaZaRKNVUpp5MpSPRiyrw9Osb342q2ovBDC8bL7+6nO3VlX2RvfFjCqNBHnykiSkJc+xZPNUiq6PrPwb8u4Phxo53MrBFrZMv3B1q008SA4hQDYFK7vSXSku6eHz9fHViTiqSnVDhIRkivZzQ7sHLEpYsnc0yBTyY3gVwRGnsswhP8LYzXhbiMe1PoiAdTBTmNQnde+6Cg1op1eSCtORab72pMr/gXBqZrJ8EwGoooESOKLyFtCX9WpiSyyNBMlXQj254cTm5fRvZQ6L1oq5Onrx6AdPPrbs5GWckTRy9ka5Grxyj5cA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUHtNR5I2sUhksranR3Xiofr/HqawJ7BxvPt+dq9Blw=;
 b=pexPz39UalTuOoBx9qExUKH1tlekT/FkIp3wy1jvmkg9FUNiKubyPZmSH34OFO4sY9ebRsn8FP2SL1Wt6SCBoqqDCy8s0uGtHCCcyUyiDpL99CDH3lf27k5jZ+alIAH14gIunmvql1kHH7xApLrfG2EChSV9+oKIh2Pi6a1tFpA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 34a6f0617c95abf5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzD8KJjytDKrdbMhdy1Lrir6Kk2nWxyLB9cblfiKXUjSOUXgcNSOk1en242gJSID2ZNEMkcM2A/iEbPc/BGBh6n1eRqDM0MW7WtoFmr0SGhBaS++YeE41/SX4DCM29OyB2jE7lWZEwgDDTpboEIbJfRYKMkXwmAIi8rwPisDVqRJ3rFcZlD3GNHpiW7pdEtU7S3d9jcACI+XY2WbiyFy27gOLL/iWKeU3loFGW8IezYankjjgUjdQ0uN1SqgJZMH/S3hkUnPRChrsktYF/4Gsr9O0bmTyaCr+ThqJayfsxRz1EQO4nK108Wz7NiO1hJXtvlXhUFvrIjruQoqINze9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUHtNR5I2sUhksranR3Xiofr/HqawJ7BxvPt+dq9Blw=;
 b=QtA9Mxuwrxk+E+ZptfHORfj2dzLlPl6fvTI0BnwfGLokGOAaWzsmKx2ufQArfCBOlvt0itiJtL8QNuAse0xVJzEtNyBQa90uEP7PEgvt7ApfXv7KRuVV9h7TeAiWCjWF7Ot+xhzXgy8cCsH/hhQyMn6EfThMoW7fAdEMipTwbIK6prQXluaYao3AnFH/V+2Anu2bO8cOVsYFq6n0jmqLijR3SDCAdB7akYxoF8I3wrWFTrrdFNW1VDGoFEDboqRGjg2IyxOgNlp2TDy+aNZ7dZWVOP74mBwzjxbpn7JIZJJeH4OHKbZ1T0OSy08DGEURu2rX1aIFUzu5fZuTb3SY8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUHtNR5I2sUhksranR3Xiofr/HqawJ7BxvPt+dq9Blw=;
 b=pexPz39UalTuOoBx9qExUKH1tlekT/FkIp3wy1jvmkg9FUNiKubyPZmSH34OFO4sY9ebRsn8FP2SL1Wt6SCBoqqDCy8s0uGtHCCcyUyiDpL99CDH3lf27k5jZ+alIAH14gIunmvql1kHH7xApLrfG2EChSV9+oKIh2Pi6a1tFpA=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: smmuv1: Set s2cr to type fault when the devices
 are deassigned
Thread-Topic: [PATCH] xen/arm: smmuv1: Set s2cr to type fault when the devices
 are deassigned
Thread-Index: AQHYqOJsqJOnAKwEgEyxPjukHtiB2a2m52IAgAEERAA=
Date: Wed, 10 Aug 2022 09:51:06 +0000
Message-ID: <1611FBAB-5F12-4595-88B6-8A4CB9ACADAB@arm.com>
References:
 <5650ddce1de4fd5471823bde44a12a03f157bc11.1659713913.git.rahul.singh@arm.com>
 <e6a8807af0832db752d735e4f9ebddaa6bbd7c12.1659713886.git.rahul.singh@arm.com>
 <0f1e12d0-1c58-8457-b3ff-26048f46430a@xen.org>
In-Reply-To: <0f1e12d0-1c58-8457-b3ff-26048f46430a@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c7da1c85-7530-489d-e96e-08da7ab5e079
x-ms-traffictypediagnostic:
	DB3PR08MB9058:EE_|VE1EUR03FT045:EE_|AM0PR08MB3715:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 E69z9w+tTAaTbds2sCCLtObvSMrKa8jZmTBz4OiCehQMRy8eTlqOaXRzl6ySyuR8bM5O5mglBxN6S7Pc/ihIthaUKAD3xdPleN9HZBSGIBHrELsLzb4O89wq6Xq0fcJicCVhiA09f7Zx2QLTEb438k38VYPulLc0uLIwgonMZz3h2lqTNiGH0mfJVffPi/n8z7gdiAjwRCAGxGRsO591i5k5Lxhr6MRLXNDsE/+/mYHptRMV58js3HG+nMkKmP3sZVCFL2GpZxWYhB6B4cegkMQAo8Pjm8c0uWHH+XihrL7bX1CJr19xAU1oo47sWEhXtyaDHQl2ScrorFEqeim6sBz130lTbsVLN43Q7dwSCmIfRvBFMpKzkFHHnEro/0JiUI8MpjNLzJUOlLNlXQaaeiL3H8zHXqezXit3OVqrwxFobGGyGCfNBPAzoR8Eu8Nt480c2cKx54kO+HZ9bxHFS73QRIpkygj8aJrTOBVO1nFuwkxbzFb1RSw6hhO80YRCvoLxJoSl9kmLxM8Vfyx6SZhMr3EtWpQhKHMaEozbtW+OuEFwKScTejtcq9K50yzKKo8Cf99a9fOo4vjWCuG3lXof79vXDWpsWT5tKPjHcYfHHdvtM668bsJiePqZLpp0NZbfyXUnZ+UjmOP+bL7+JW8pCFPWN2102irjH/VEG+cIBmCVHv8U/71LoA9Trc/SQiMWci6ifpExKp0kpNEFfOIBLe/hsJ7P6smBYbU7LME5VOKxCqY79SA3ahG3zf/tWVxbuKUKPyfsSE9g+AdzjoiluR7LrdSFJNz+5zfhzJyIYe9+P/qJg1yPJWdoTPEq4bx3gir+4JMicQh9BHfezw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(5660300002)(66946007)(54906003)(2906002)(36756003)(33656002)(91956017)(478600001)(71200400001)(6486002)(316002)(8936002)(76116006)(86362001)(122000001)(38100700002)(26005)(53546011)(6512007)(41300700001)(6506007)(38070700005)(2616005)(66446008)(4326008)(66556008)(66476007)(64756008)(6916009)(8676002)(186003)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <ADFA711924B30848BB8B54024D936AC3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9058
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2eee4a43-4d1c-42f7-b91e-08da7ab5d878
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TtR3wZMXyL8WyCusJhpPnqGV1S+YQe4XCNAFWNhI7MIfMzm0WQfq3BCJ20AdcgxcqV4v5tIZp6rXHTBD0Sl+TeVJ47gGfUrOt+ksuqSuvdAqtJddbXNir83tfHpto+gmbODNU9G7d55936U4at0W+L4gLeSe7NAJ1yaNBDMN4BiSeM7Ti3GJc0iFmbLuygHLAVYpiuG1gN0e9Xwj5YbPNIfZUPV+vrv5wA/+IZmDXwP3nsG/akegY1Sswn+/NTW+iu3wGkQjPygDwcfa2z5OhM1Dq/f4vaGtjOZfM+D2xKal2blwhOcr7ULBuV3CvJmR4HV+N1dxZAHN4AysG3tmIwsFl9Hxu0UlNdw7S6fGVTQvDtPc+dW8F48nBPt6rXJmJ/yq4+h9PN/jdAG4r9k+uqU25AYHtuHz4+QTXR81gZt/kyJ1vumGu8eWgzfEOPePOQelhYjKiAwVoJyQUddLqmZ+WhYYYrlFCXpq8zMUgXS4NbYDtEZLFnLpxkeMdz8U4Ca9tqJRqniGhUJVR+wC/g2/R21h7AfRw8VLwizzibWcVdpxTw3ZGRF4KgLMltRuAPtwNdj2MgXX1RjYyaOikqHR3fXUsxRuEXbYyLuf6G0Iz+Vyy+rmu9LHshUTsE9ONY0zGL0P+MzNFRu1sPQcFb6G7LdTlMDx0G8DM0rakT9ECoeD85baSFOF2d+9+FSnFNNcJQNq0Tq0XG7f5mqquQgc0H0rPJnTAYukUoWnxAtryACb0UhveI5Tj2K5/V20HajwTNKb1XPzYbcY6vZhjBj7IsxFPg1iuVtWkdWTxsPYiagK9JHsfvWGn3HQktVt
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(39860400002)(136003)(36840700001)(40470700004)(46966006)(356005)(26005)(6512007)(186003)(6506007)(53546011)(336012)(83380400001)(2616005)(36860700001)(47076005)(82740400003)(4326008)(6862004)(8936002)(5660300002)(81166007)(107886003)(8676002)(2906002)(70586007)(40480700001)(82310400005)(70206006)(41300700001)(6486002)(478600001)(54906003)(40460700003)(36756003)(316002)(33656002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 09:51:19.8644
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7da1c85-7530-489d-e96e-08da7ab5e079
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3715

SGkgSnVsaWVuLA0KDQo+IE9uIDkgQXVnIDIwMjIsIGF0IDc6MTkgcG0sIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gSGkgUmFodWwsDQo+IA0KPiB0aXRsZTogVGhl
IGRyaXZlciBpcyBmb3IgYm90aCBzbW11djEgYW5kIHYyLiBBcmUgeW91IHN1Z2dlc3RpbmcgdGhl
IGlzc3VlIG9ubHkgb2NjdXJzIG9uIHYxPw0KDQpJc3N1ZSBvY2N1cnMgb24gYm90aCB2MSAmIHYy
LiBJIHdpbGwgZml4IHRoaXMgaW4gbmV4dCB2ZXJzaW9uLg0KPiANCj4gT24gMDUvMDgvMjAyMiAx
Njo0MywgUmFodWwgU2luZ2ggd3JvdGU6DQo+PiBXaGVuIGRldmljZXMgYXJlIGRlYXNzaWduZWQv
YXNzaWduZWQsIFNNTVUgZ2xvYmFsIGZhdWx0IGlzIG9ic2VydmVkDQo+PiBiZWNhdXNlIFNNRXMg
YXJlIGZyZWVkIGluIGRldGFjaCBmdW5jdGlvbiBhbmQgbm90IGFsbG9jYXRlZCBhZ2FpbiB3aGVu
DQo+PiB0aGUgZGV2aWNlIGlzIGFzc2lnbmVkIGJhY2sgdG8gdGhlIGd1ZXN0Lg0KPj4gRG9uJ3Qg
ZnJlZSB0aGUgU01FcyB3aGVuIGRldmljZXMgYXJlIGRlYXNzaWduZWQsIHNldCB0aGUgczJjciB0
byB0eXBlDQo+PiBmYXVsdC4gVGhpcyB3YXkgdGhlIFNNTVUgd2lsbCBnZW5lcmF0ZSBhIGZhdWx0
IGlmIGEgRE1BIGFjY2VzcyBpcyBkb25lDQo+PiBieSBhIGRldmljZSBub3QgYXNzaWduZWQgdG8g
YSBndWVzdA0KPj4gU2lnbmVkLW9mZi1ieTogUmFodWwgU2luZ2ggPHJhaHVsLnNpbmdoQGFybS5j
b20+DQo+IA0KPiBBRkFJQ1QsIHRoaXMgaXMgZml4aW5nIDA0MzU3ODRjYzc1ZCAoInhlbi9hcm06
IHNtbXV2MTogSW50ZWxsaWdlbnQgU01SIGFsbG9jYXRpb24iKS4gSWYgSSBhbSBjb3JyZWN0LCBj
YW4geW91IGFkZCBhIEZpeGVzIHRhZz8NCg0KWWVzLCBJIHdpbGwgYWRkIHRoZSBmaXhlcyB0YWcu
DQo+IA0KPj4gLS0tDQo+PiAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYyB8IDMy
ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQ0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBp
bnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkNCj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3Nt
bXUuYw0KPj4gaW5kZXggNjk1MTE2ODNiNC4uMTQxOTQ4ZGVjZCAxMDA2NDQNCj4+IC0tLSBhL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL2FybS9zbW11LmMNCj4+IEBAIC0xNTk4LDIxICsxNTk4LDYgQEAgb3V0X2VycjoN
Cj4+ICAJcmV0dXJuIHJldDsNCj4+ICB9DQo+PiAgLXN0YXRpYyB2b2lkIGFybV9zbW11X21hc3Rl
cl9mcmVlX3NtZXMoc3RydWN0IGFybV9zbW11X21hc3Rlcl9jZmcgKmNmZykNCj4gDQo+IElJVUMs
IHRoZSBmdW5jdGlvbiBuZWVkcyB0byBiZSBtb3ZlZCBiZWNhdXNlIHlvdSBuZWVkIHRvIHVzZSBh
cm1fc21tdV93cml0ZV9zMmNyKCkuIElmIHNvLCBJIHdvdWxkIHN1Z2dlc3QgdG8gbWVudGlvbiBp
biB0aGUgY29tbWl0IG1lc3NhZ2UgYmVjYXVzZSBhdCBmaXJzdCBpdCBzZWVtcyB1bndhcnJhbnRl
ZC4NCg0KQWNrLiBJIHdpbGwgYWRkIHRoYXQgaW4gY29tbWl0IG1zZy4NCj4gDQo+PiAtew0KPj4g
LSAgICBzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpzbW11ID0gY2ZnLT5zbW11Ow0KPj4gLQlpbnQg
aSwgaWR4Ow0KPj4gLQlzdHJ1Y3QgaW9tbXVfZndzcGVjICpmd3NwZWMgPSBhcm1fc21tdV9nZXRf
ZndzcGVjKGNmZyk7DQo+PiAtDQo+PiAtCXNwaW5fbG9jaygmc21tdS0+c3RyZWFtX21hcF9sb2Nr
KTsNCj4+IC0JZm9yX2VhY2hfY2ZnX3NtZShjZmcsIGksIGlkeCwgZndzcGVjLT5udW1faWRzKSB7
DQo+PiAtCQlpZiAoYXJtX3NtbXVfZnJlZV9zbWUoc21tdSwgaWR4KSkNCj4+IC0JCQlhcm1fc21t
dV93cml0ZV9zbWUoc21tdSwgaWR4KTsNCj4+IC0JCWNmZy0+c21lbmR4W2ldID0gSU5WQUxJRF9T
TUVORFg7DQo+PiAtCX0NCj4+IC0Jc3Bpbl91bmxvY2soJnNtbXUtPnN0cmVhbV9tYXBfbG9jayk7
DQo+PiAtfQ0KPj4gLQ0KPj4gIHN0YXRpYyBpbnQgYXJtX3NtbXVfZG9tYWluX2FkZF9tYXN0ZXIo
c3RydWN0IGFybV9zbW11X2RvbWFpbiAqc21tdV9kb21haW4sDQo+PiAgCQkJCSAgICAgIHN0cnVj
dCBhcm1fc21tdV9tYXN0ZXJfY2ZnICpjZmcpDQo+PiAgew0KPj4gQEAgLTE2MzUsNiArMTYyMCwy
MCBAQCBzdGF0aWMgaW50IGFybV9zbW11X2RvbWFpbl9hZGRfbWFzdGVyKHN0cnVjdCBhcm1fc21t
dV9kb21haW4gKnNtbXVfZG9tYWluLA0KPj4gIAlyZXR1cm4gMDsNCj4+ICB9DQo+PiAgK3N0YXRp
YyB2b2lkIGFybV9zbW11X2RvbWFpbl9yZW1vdmVfbWFzdGVyKHN0cnVjdCBhcm1fc21tdV9kb21h
aW4gKnNtbXVfZG9tYWluLA0KPj4gKwkJCQkgICAgICBzdHJ1Y3QgYXJtX3NtbXVfbWFzdGVyX2Nm
ZyAqY2ZnKQ0KPj4gK3sNCj4+ICsJaW50IGksIGlkeDsNCj4gDQo+IE5JVDogSSB3b3VsZCBzdWdn
ZXN0IHRvIHRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIHN3aXRjaCB0byAidW5zaWduZWQgaW50IiBh
bmQgLi4uDQoNCkFjay4gDQo+IA0KPj4gKwlzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpzbW11ID0g
c21tdV9kb21haW4tPnNtbXU7DQo+PiArCXN0cnVjdCBhcm1fc21tdV9zMmNyICpzMmNyID0gc21t
dS0+czJjcnM7DQo+PiArCXN0cnVjdCBpb21tdV9md3NwZWMgKmZ3c3BlYyA9IGFybV9zbW11X2dl
dF9md3NwZWMoY2ZnKTsNCj4gDQo+IC4uLiB1c2UgY29uc3QgaGVyZS4gImNmZyIgYW5kICJzbW11
IiBjYW4ndCBiZSBjb25zaXN0ZW50IGJ1dCAic21tdV9kb21haW4iIHRlY2huaWNhbGx5IGNvdWxk
ICh0aGFua3MgdG8gaG93IEMgd29ya3MpLiBUaGF0IHNhaWQsIEkgcXVpdGUgZGlzbGlrZSBpdCBh
cyB0aGUgY29kZSBlbmRzIHVwIHRvIGJlIGNvbmZ1c2luZy4uLg0KDQpBY2suIA0KPiANCj4+ICsN
Cj4+ICsJZm9yX2VhY2hfY2ZnX3NtZShjZmcsIGksIGlkeCwgZndzcGVjLT5udW1faWRzKSB7DQo+
PiArCQlzMmNyW2lkeF0gPSBzMmNyX2luaXRfdmFsOw0KPj4gKwkJYXJtX3NtbXVfd3JpdGVfczJj
cihzbW11LCBpZHgpOw0KPj4gKwl9DQo+PiArfQ0KPj4gKw0KPj4gIHN0YXRpYyBpbnQgYXJtX3Nt
bXVfYXR0YWNoX2RldihzdHJ1Y3QgaW9tbXVfZG9tYWluICpkb21haW4sIHN0cnVjdCBkZXZpY2Ug
KmRldikNCj4+ICB7DQo+PiAgCWludCByZXQ7DQo+PiBAQCAtMTY4NCwxMCArMTY4MywxMSBAQCBz
dGF0aWMgaW50IGFybV9zbW11X2F0dGFjaF9kZXYoc3RydWN0IGlvbW11X2RvbWFpbiAqZG9tYWlu
LCBzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+PiAgICBzdGF0aWMgdm9pZCBhcm1fc21tdV9kZXRhY2hf
ZGV2KHN0cnVjdCBpb21tdV9kb21haW4gKmRvbWFpbiwgc3RydWN0IGRldmljZSAqZGV2KQ0KPj4g
IHsNCj4+ICsJc3RydWN0IGFybV9zbW11X2RvbWFpbiAqc21tdV9kb21haW4gPSBkb21haW4tPnBy
aXY7DQo+PiAgCXN0cnVjdCBhcm1fc21tdV9tYXN0ZXJfY2ZnICpjZmcgPSBmaW5kX3NtbXVfbWFz
dGVyX2NmZyhkZXYpOw0KPj4gICAgCWlmIChjZmcpDQo+PiAtCQlhcm1fc21tdV9tYXN0ZXJfZnJl
ZV9zbWVzKGNmZyk7DQo+PiArCQlyZXR1cm4gYXJtX3NtbXVfZG9tYWluX3JlbW92ZV9tYXN0ZXIo
c21tdV9kb21haW4sIGNmZyk7DQo+IA0KPiBXaHkgYXJlIHlvdSB1c2luZyBhZGRpbmcgYSAncmV0
dXJuJyBoZXJlPw0KDQpOb3QgcmVxdWlyZWQuIEkgd2lsbCByZW1vdmUg4oCccmV0dXJu4oCdLg0K
DQpSZWdhcmRzLA0KUmFodWw=

