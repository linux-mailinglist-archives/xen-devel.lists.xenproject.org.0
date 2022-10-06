Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A285F6306
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 10:47:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416733.661401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogMWb-0003JC-Gb; Thu, 06 Oct 2022 08:46:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416733.661401; Thu, 06 Oct 2022 08:46:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogMWb-0003Fy-Dj; Thu, 06 Oct 2022 08:46:37 +0000
Received: by outflank-mailman (input) for mailman id 416733;
 Thu, 06 Oct 2022 08:46:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=olH1=2H=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ogMWa-0003Fs-7D
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 08:46:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2075.outbound.protection.outlook.com [40.107.20.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 612a2d66-4553-11ed-9377-c1cf23e5d27e;
 Thu, 06 Oct 2022 10:46:33 +0200 (CEST)
Received: from AM6P194CA0006.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::19)
 by AM7PR08MB5525.eurprd08.prod.outlook.com (2603:10a6:20b:107::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Thu, 6 Oct
 2022 08:46:27 +0000
Received: from VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::27) by AM6P194CA0006.outlook.office365.com
 (2603:10a6:209:90::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.26 via Frontend
 Transport; Thu, 6 Oct 2022 08:46:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT030.mail.protection.outlook.com (10.152.18.66) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Thu, 6 Oct 2022 08:46:26 +0000
Received: ("Tessian outbound 937eed45f6ed:v128");
 Thu, 06 Oct 2022 08:46:26 +0000
Received: from 8cbf56838016.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4F514C12-8224-4435-98D4-9F45BA19AA5F.1; 
 Thu, 06 Oct 2022 08:46:15 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8cbf56838016.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 06 Oct 2022 08:46:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM9PR08MB5972.eurprd08.prod.outlook.com (2603:10a6:20b:280::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Thu, 6 Oct
 2022 08:46:14 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a%4]) with mapi id 15.20.5676.028; Thu, 6 Oct 2022
 08:46:14 +0000
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
X-Inumbo-ID: 612a2d66-4553-11ed-9377-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=H14UV8MEfawhCI3nLDO77Ij4Fpj7acnmrmjPYeTMp3lZDBd3HE+gHuSsmFI27CB91BaLOOrlnUmAhUZJfWzRzE5RxqNELqkr16lBfuZKcQ25lVRKUevLKZ2KEQgTPOpn3Mw8vKjuzSmDzoAN/ZJY07jE9+zlG44bFAq5M7kN0c1/Yeuttx/rjArk6ElsbZors+e2c2mtrD9eTMln26bjzPkEfZGr37RMTJZjKS2EXWQewqn/8jMroM7VZPaRUyjkD/P9rAMC5sNhswr0puU0zbqXkPx5bIjLHgO48iQvG4XXic5XvKDOO27kyN347i7QXVqvIjJPAK5xP64UT5XaIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52xC3eWi0jFfNxW1eJDDev8LqQZiW+lfEJt3l7ZI8HQ=;
 b=bZ0y2qPIltsOBK7tYh6nmCMhqJzADUcudYfsGZQ+z9mblY4tkCNSTgsWRnKIJmc74Li4NCOCSoU490MdRP0G2lhJm9Oh7xkSbd3sdK5C666SYZC3k9TdnwPIGB9BcKUF7VciNimvvwWMtD//F/QC/gnB/A67/eoI/eH2+g9TUwebfq8D6RjcIfQFD+g8NtTwCAErPOmuVs/9a/3TZZyBVc5CTbl+dOAU7pjYZQ7Q1MIqWPsMInn+PLOXaEg6Fgtd4rv8jErZ8lo9cmtX5n0eL4IHUnwGgWSOadyBlnSpch4fFi7CBQKLW17vZMs+KHNEWixhzo1Q9ZhJNRZpeSyN7A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52xC3eWi0jFfNxW1eJDDev8LqQZiW+lfEJt3l7ZI8HQ=;
 b=KUISvdwdmMsx7HpLGmgGvEFEoH+0fA0NiJRVLMjGBozu1iuJGrilTwG0R4io/THhOfTvAjP1APe1OolPXlr+qNKXFeIWMY9JWosqi8+NgrJWHdM/S4gdFBNGhp/GAqzUTl1RL+wH0x2GoIzREfkNniyKPuC7kDzDGeLE5vlE1Kc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j6QYbXOdW8roGZ68shIQ8/E4D6zX8D7kRPSbdqSUOq6KQbQzGpbtaSFaVQZxBE8zIyuwbqd7a9q9LzzXSUG1V+j97yvmX+vaO/3jyRvq2VXJ5Gadg0XIKwvh21GclYaUL17nYilimYFKcQ6A/njUeK/wAVym3EO17fJ3doJmoHDCTGR0L+cLpyL5cmEimP7E5E/hDK33GS75rwo+gTHYeVhbyARGcUC2uOknuU+4JzptxIyf91lV3sCX+4jueup9e6Z1QbjwcuPSjkSiQEUUeHzlme6pf5oQ21m5PCPLFv3qz/kZO/PIJ9mySG4Jf4YKKrDpMZ+R2jRelAsbANMfCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52xC3eWi0jFfNxW1eJDDev8LqQZiW+lfEJt3l7ZI8HQ=;
 b=XYfHBO1KNte5Qay6IKZrxPRF99l35z5TYsGCtskdlw5c/KyV9e1YxPkjVm1kDX1gknOARPDZ7oXHxwbXxQSP2VRASeY8nAUj7Xzzd5MDp1Qerf3f9mLGvoKx0iXkbq/XxTf50hd9aKDRra4xj05Btpqdz/K6KpgDdW0zodhKS0Ei5GzhNdh4lG+Ifb6S7LY72zn1MfUpb+ZcSqJPmSmRnxrm7UD9XKMr5pBJktP+GAvICF1/bwy1gvQHsqgCXM/LVpFvRMESGZ8IHyCdAccgANt8gAMKS9rlIGQPqcJ2XyAR6nmycfYZG5iS/6Iwt1G/mv/FAwpDgIK9ieoiaCFhFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52xC3eWi0jFfNxW1eJDDev8LqQZiW+lfEJt3l7ZI8HQ=;
 b=KUISvdwdmMsx7HpLGmgGvEFEoH+0fA0NiJRVLMjGBozu1iuJGrilTwG0R4io/THhOfTvAjP1APe1OolPXlr+qNKXFeIWMY9JWosqi8+NgrJWHdM/S4gdFBNGhp/GAqzUTl1RL+wH0x2GoIzREfkNniyKPuC7kDzDGeLE5vlE1Kc=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <volodymyr_babchuk@epam.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [PATCH v2][4.17] EFI: don't convert memory marked for runtime use
 to ordinary RAM
Thread-Topic: [PATCH v2][4.17] EFI: don't convert memory marked for runtime
 use to ordinary RAM
Thread-Index: AQHY2V9kZReqhAfkvEGGvlXoyp07JK4BDUEw
Date: Thu, 6 Oct 2022 08:46:13 +0000
Message-ID:
 <AS8PR08MB7991C4AB16708177EBB3BA11925C9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <ca557de7-88e9-bf2b-0f5e-6a42dca3f9f7@suse.com>
In-Reply-To: <ca557de7-88e9-bf2b-0f5e-6a42dca3f9f7@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9161D3D68E61514BB3608DCAA754A409.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM9PR08MB5972:EE_|VE1EUR03FT030:EE_|AM7PR08MB5525:EE_
X-MS-Office365-Filtering-Correlation-Id: c087eafe-7e64-4d0b-d0f8-08daa7774194
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VBub/505EZVDkvi/VjGSnjTTx2fot4TpUSxax/7vsCGWO9fmPZR7uqb9fzwFFjqQLpymMzXv0dbkfWccDLXcDdOoxGmnBSrmwZ3QTMz6Gk/WqGLJJ3JLdItRDZFk57MYW1o750peS7Ju/zmO5KagIMoarA1yj0Kr4Pg3SiVb9A63aw3xiFyG1lFl4L01vexxvqvOstg/wlUJkJ3yG6zKG9HBvGJnGSsNHBnkAdUi073V25lBpjVVHWXbvLIdqVr1puPT6X8WsgEaTAI+ORwmPRr+cutnffftxhnS3KxxOHxIrV4t109sKomPJ+0Yf1zYf/kLe4+JVygc1Ox/BEeu9B9/a1tlj8H+WP/M+yUR4Vwa03JWInWBrUKNWF0RTZ1MBIPTb/gAKza3RmULeLd6J5oXbOwP3o3duY9cNVtVxjtTp7nuyk6R+klPrqdj8Aw6PKWwmPbJYQyQnJCTTxzP8WZsWS1xBiN04ngObreclxZt97PpaxIf4oanSgC9JDhjoSLSWBZjNPeyujvsHA7WuAnYpNdC4hDUpVARNGKtL9fBRiRTx1udZK90v39E3cw6aDEO/ZCPIlAGNs8K020p6WYZy4bgOEA+cDgmrU/I+wH2Gcc3dkWETsa1IGey6tig1iBy0PiHlJ/W0DspqFPiI5wYKRLra/YA0znt6oruroGVvxVPDgU9wEr+AW1Zb4QmLusPSG3ykUniS3byp26B/wo9y45+oVbJNkuNgQmUQUYO05DlRUtCnfYG6lVMkTITzRANNGvBFw3GxBv9ZJwXEg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(136003)(39860400002)(396003)(376002)(451199015)(54906003)(316002)(38100700002)(41300700001)(71200400001)(86362001)(66946007)(8936002)(5660300002)(76116006)(110136005)(52536014)(66446008)(8676002)(64756008)(66476007)(33656002)(478600001)(66556008)(4326008)(38070700005)(26005)(122000001)(83380400001)(55016003)(9686003)(186003)(7696005)(6506007)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5972
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	848b355a-dde5-4df8-dcec-08daa77739d9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FhaiailrUPy2gfx2KZO92oSQARVuwJxuP14RpDCxGYzNIVl9e0sWrlKCJtbEINdQfyb1YUUL2/fsDMGMFq3ghLN6DiSgbXgMbzXY7RcFa8qZ8tyz/+2YjiQ4jznxLPcXtc1hv/VsDF0ZGv69UMu+gK02ZmdyYCteQ5l6fMfd5xH1d4vj59IpCO+n8ims9QmRH1CkO2gp7+p6aK/RfhUHKqvEjpQuSRwMMaoty2F2iayXW2np7uzXj8nkpbMM6jz9NV/G51Ck5SV2vqdmZJspSDHRYbxNX0koK0EZ+RluhkrZaMcSc+axZ2RfuCeT0Uy+5j2apAYNlGsalO13jpAr2CLsKZQ2MHmQ0yh3pK4IHyOHaCKg1b1nK9i+BsSX+sVwFpdgxMBRrTEaloqwJQ+0T3OUvKpKFo8QQtTcHaMBrHlkht1tEfyEiyRaa7nYwqClkFC1NsMaMJidOCyoOiH/bmYGwVN3B4Yho80ILvR0STGkF1wkb177GeNh2wjknxn+PT6hohWxLDMPfxhUpLntzHdjP24dlc2ErY7MsUuv/odEAyeSyyavwKk+8BsnGDy4B+DUBFJjaCTSBw7IILMtbYdoSpatodLfTQohhRYPmsYadnIYbmwP8SNXZ6EkqB0oED68ttQ/Sor65CEAVL3KThOGFVOscOWCsEjfc3jiDWXSWttYnvYnw3aiW0qObV+8/6hEBiRlicQW/r1im1PYUJt3TrUBOs84lROrxPI4XWU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(396003)(136003)(346002)(376002)(451199015)(46966006)(36840700001)(316002)(4326008)(8676002)(70586007)(110136005)(70206006)(54906003)(478600001)(336012)(26005)(82740400003)(7696005)(2906002)(9686003)(6506007)(33656002)(41300700001)(36860700001)(83380400001)(8936002)(5660300002)(55016003)(40480700001)(52536014)(86362001)(81166007)(82310400005)(186003)(356005)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 08:46:26.8327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c087eafe-7e64-4d0b-d0f8-08daa7774194
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5525

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIHYyXVs0LjE3XSBFRkk6
IGRvbid0IGNvbnZlcnQgbWVtb3J5IG1hcmtlZCBmb3IgcnVudGltZSB1c2UNCj4gdG8gb3JkaW5h
cnkgUkFNDQo+IA0KPiBlZmlfaW5pdF9tZW1vcnkoKSBpbiBib3RoIHJlbGV2YW50IHBsYWNlcyBp
cyB0cmVhdGluZyBFRklfTUVNT1JZX1JVTlRJTUUNCj4gaGlnaGVyIHByaW9yaXR5IHRoYW4gdGhl
IHR5cGUgb2YgdGhlIHJhbmdlLiBUbyBhdm9pZCBhY2Nlc3NpbmcgbWVtb3J5IGF0DQo+IHJ1bnRp
bWUgd2hpY2ggd2FzIHJlLXVzZWQgZm9yIG90aGVyIHB1cnBvc2VzLCBtYWtlDQo+IGVmaV9hcmNo
X3Byb2Nlc3NfbWVtb3J5X21hcCgpIGZvbGxvdyBzdWl0LiBXaGlsZSBvbiB4ODYgaW4gdGhlb3J5
IHRoZQ0KPiBzYW1lIHdvdWxkIGFwcGx5IHRvIEVmaUFDUElSZWNsYWltTWVtb3J5LCB3ZSBkb24n
dCBhY3R1YWxseSAicmVjbGFpbSINCj4gRTgyMF9BQ1BJIG1lbW9yeSB0aGVyZSAoYW5kIGl0IHdv
dWxkIGJlIGEgYnVnIGlmIHRoZSBEb20wIGtlcm5lbCB0cmllZA0KPiB0byBkbyBzbywgYnlwYXNz
aW5nIFhlbidzIG1lbW9yeSBtYW5hZ2VtZW50KSwgaGVuY2UgdGhhdCB0eXBlJ3MgaGFuZGxpbmcN
Cj4gY2FuIGJlIGxlZnQgYWxvbmUuDQo+IA0KPiBGaXhlczogYmY2NTAxYTYyZTgwICgieDg2LTY0
OiBFRkkgYm9vdCBjb2RlIikNCj4gRml4ZXM6IGZhY2FjMGFmODdlZiAoIng4Ni02NDogRUZJIHJ1
bnRpbWUgY29kZSIpDQo+IEZpeGVzOiA2ZDcwZWExMGQ0OWYgKCJBZGQgQVJNIEVGSSBib290IHN1
cHBvcnQiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQo+IFJldmlld2VkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+ICMg
QXJtDQo+IFRlc3RlZC1CeTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPiAj
IEFybQ0KPiBSZXZpZXdlZC1ieTogQmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bh
cm0uY29tPiAjYXJtDQoNClJlbGVhc2UtYWNrZWQtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdA
YXJtLmNvbT4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiAtLS0NCj4gdjI6IEFtZW5kIGRl
c2NyaXB0aW9uLg0KDQo=

