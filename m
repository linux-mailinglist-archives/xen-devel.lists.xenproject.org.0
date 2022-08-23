Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEFF59E5B9
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 17:10:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392029.630149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQVXU-00085v-RK; Tue, 23 Aug 2022 15:10:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392029.630149; Tue, 23 Aug 2022 15:10:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQVXU-00083o-N9; Tue, 23 Aug 2022 15:10:00 +0000
Received: by outflank-mailman (input) for mailman id 392029;
 Tue, 23 Aug 2022 15:10:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jact=Y3=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oQVXT-00083i-TU
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 15:10:00 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10057.outbound.protection.outlook.com [40.107.1.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6f1ba6e-22f5-11ed-9250-1f966e50362f;
 Tue, 23 Aug 2022 17:09:58 +0200 (CEST)
Received: from AS8PR04CA0002.eurprd04.prod.outlook.com (2603:10a6:20b:310::7)
 by AM6PR08MB3223.eurprd08.prod.outlook.com (2603:10a6:209:4d::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Tue, 23 Aug
 2022 15:09:55 +0000
Received: from AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::76) by AS8PR04CA0002.outlook.office365.com
 (2603:10a6:20b:310::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.24 via Frontend
 Transport; Tue, 23 Aug 2022 15:09:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT022.mail.protection.outlook.com (100.127.140.217) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Tue, 23 Aug 2022 15:09:54 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Tue, 23 Aug 2022 15:09:54 +0000
Received: from 8021bb462ca7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1E3B9F03-95F5-4EE5-8BF9-3D8810C3A1EA.1; 
 Tue, 23 Aug 2022 15:09:47 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8021bb462ca7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 Aug 2022 15:09:47 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB4295.eurprd08.prod.outlook.com (2603:10a6:20b:b7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Tue, 23 Aug
 2022 15:09:43 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 15:09:43 +0000
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
X-Inumbo-ID: a6f1ba6e-22f5-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=MHaRY/PS0pftNB4Q4cDqtaXIOfl6NJKUdKHvzQHApQwnyp/6+HUIO1KsfQv3r4ZV8LHprFq6ZD+QT3B04OaE0p8rH90edXme1CzKSp5xgkMpmmhVx+d7kNPXRSHyHXY6cx5e5bnt3EumXbH26UrVfgxKLgC/WSqA2IiGIpV0jGvOXSDAJ3TeDxHGKRr8rE7EJ1Hs6fHiFtcr0FhfPmOzHyTQODD4Ir5uocc8WwNmM34uiGbPromU1lxq7BOQnugOupyh/vj3cEHq5I4z5ES5AT4v9GrYIGCYpASFSOhgdskjOfpsk5ZTTpwYnqXWB1skA0onOCbzHuYwCnld686vfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSNSUwYWXETMBCQr7zkLdC306uf/ozGoBy2IoMyu8xQ=;
 b=X6iggAZDXIfjaYHnMzF+hMJOkZx04id/ojirdOnj6sQSFLmQjm1bIYWKFNsLLunezN6W1D4MNcgOnu/YSBzVoYWY2uEgI1oSU2Y2d+cX8Avj0KeEH+DydnSnz7m4IoqcdUoZraCSBZEfi+uiry5gPoRo8Y3V9YzatkFl4gokLf4JJi+3HzKvNxQq2nTniE/l4Qi6jDDhn17OCuoa/K/QPfFCoSmVbZqcvzCXxB9YUJkTnl3yjGq8fHtCIXMhOmaL8YGZCc2gsurd7WhDNO6Z2zRNHB1mCt7jvzt0LVjok+FVj2FWZVAx1Nl/qWuXfeGdm99fhSzemcjRG2+726XUcw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=temperror (sender ip
 is 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=arm.com; dmarc=temperror action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSNSUwYWXETMBCQr7zkLdC306uf/ozGoBy2IoMyu8xQ=;
 b=oj5h4RUZE9UwMV6ZoJlmIybFsMyC27gGysfJyWgqS5lkQXMDMV074fUTWcRQlLeqDESmg16Vdw5zhZnNv1DGQbatI8zPrnDL5XbjdiQk0HNy1gGwOMCjqHJmXUk1nt78Zw3aXHU1GR37nnTubsqzev53xXnk57kcEWy3rBV0o6w=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
X-CheckRecipientChecked: true
X-CR-MTA-CID: 065299be57632626
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRVRh4mfjyXxxLOUYVAZHZ3/aEmnRoWea/zwvZ+mcAa5iWXHC1UfAY6pZL9FjhuxTZiRBGVUCSqzedNd6MfSlFn2uUbpLM+xNHIdO2iT8SPIXkk3Fr71H+QjFzwheVtRX8vv7TsSsZgUQPlJtbNk76kFUlSZVwbtcFD2yensDwYoLudZf4GB2GKCW1F8DuEMmoTvwLaF8I6PG4iHwLssur0MltdRPxIRt38m1qFQcu+r0lrZYtphp+bksg1ohJdMGXYJobSRfJiSJaB/n3HoqLjp3TEr7EsW7XDT3dnUVQYDJvjk11vQmXivuXM3oJ15u2+fyyTxFE+tsalA8mix7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSNSUwYWXETMBCQr7zkLdC306uf/ozGoBy2IoMyu8xQ=;
 b=MLpzqs64x5uOmkjQ4hII9SiTgC7JvrNpZvvmTh/sNKNVyvM8RqWl+o+Y5sWk3WIqHyr9r/WA22xSS4zNMAyypRyvE8A2ANKcfL0LYh67U35lJNRagyMyHeeWgbc4TKARVNjzk9VZ+wO2iZX5SCUJ9Zrv2HkFXC8gGq448bZGDiMK5y0GZ+k4k0p6IDN0Fbj4u54Ir8aZYKUInV52JxYycMUnkydGStMPA2prt4CFatdk/9ZlzP5TGFKNC+N4sR2I/+pXqv8rvcyCqAVvy13gh7SqQ4VtILZ1yyRjgZtnpGgyR8FTnDbGYDE0TlmvO/p0ouAcsWoiMAxbB4CvfZUD4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSNSUwYWXETMBCQr7zkLdC306uf/ozGoBy2IoMyu8xQ=;
 b=oj5h4RUZE9UwMV6ZoJlmIybFsMyC27gGysfJyWgqS5lkQXMDMV074fUTWcRQlLeqDESmg16Vdw5zhZnNv1DGQbatI8zPrnDL5XbjdiQk0HNy1gGwOMCjqHJmXUk1nt78Zw3aXHU1GR37nnTubsqzev53xXnk57kcEWy3rBV0o6w=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] libacpi: Fix cross building x86 on arm
Thread-Topic: [RFC PATCH] libacpi: Fix cross building x86 on arm
Thread-Index: AQHYttqU3r7Sk/IKHkKroerrTRS8F628a1KAgAARJACAABAJgIAAAokAgAAIAAA=
Date: Tue, 23 Aug 2022 15:09:42 +0000
Message-ID: <C7766EB8-B741-4443-99C3-EB14C1EA9804@arm.com>
References:
 <c3d431217010f669de809a76c2f1c15a0313ae53.1661246753.git.bertrand.marquis@arm.com>
 <844e0164-96b1-8a56-a9c0-0f432b9e648a@suse.com>
 <B2DC2AC4-E59C-4C96-8993-D4812D73E799@arm.com>
 <74994bdd-8c70-7f5c-2146-157a36c843a0@suse.com>
 <87AD61AE-5C50-4F04-AF60-300C6A113A85@arm.com>
In-Reply-To: <87AD61AE-5C50-4F04-AF60-300C6A113A85@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2330ccb6-83ff-4323-3833-08da85198922
x-ms-traffictypediagnostic:
	AM6PR08MB4295:EE_|AM7EUR03FT022:EE_|AM6PR08MB3223:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7fzo7E2cV8oeHKvmWaR4Xr1MFuI/BdG1prssvOupW0u6ZLeEg+89+k68PsitSiER32uXFv7s27JmuTmlEkI1jzup7psCzh+DXTPkllD2WNMCTI86od6J41StCE99BEktXt1k70J0a7YAfzR/LKLc0LxSmaPNLvLfkBWfCN2xh917vtpZXcHiProal7onCbylk0/8KrXw+ypMcVpRInly/SQBqb0f7yAqL93HlpAeYzgbkvkoI4xNpVu8CevBDYMuj2kdPNuvzviUMFKMduEGnnB1nSyvg0V7hBTw2WZZJ420rXUvXI3aMIZZy8G0LtxelfRJOykECeF3J24EJt0DxT5NTbEZ4+ajFhLDt48Bs0edYQhbzGrYoa5uhGcUtlU3e35yd3lyjavmQmpBX2N51r/BJIKQMaw9R4lv38LabYgQe2PpOkHk6nUh9CjwoSWsNvJ4T2YD/MFKfqbLfjOJjY1iVdm4O6l5QC/hTJe7zoMz1ngclPxYGl0HbuvFepMm+ISGKwzS7FE8KEhPlF784k/xt9T7PZvQ0YZep44PlU6dkQYQJWcWYbIekqyiseRD4uX+ppczQ5wFLXFi5jotD6WvxDpkGTAKsRGFMx+Ks74cPxrbXFMulGzEWvrf4ZNM7HkHmaYLPEZdopaHb/xsrvnaArQ14AaRtCxqupzRZIKUZ651rRAMP9FIJv2iHga7iXuTb0oFoG9vDty0t68bxKrY+RWsGmloJc/KjmGyBXGT/Y3GSibpkZ/0iFhtN2uWAgmCo1rEl8YlGDURvg/S4V+D7bRId3/pZrh5aG77HJM6a3S8yJTl6Gd0MUUxalTX7dBvd9Im0HbfnLh5/2TXjA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(316002)(966005)(6486002)(76116006)(66476007)(64756008)(91956017)(66556008)(8676002)(66446008)(66946007)(71200400001)(8936002)(41300700001)(6916009)(54906003)(83380400001)(53546011)(2906002)(6506007)(6512007)(4326008)(478600001)(26005)(36756003)(186003)(2616005)(5660300002)(86362001)(33656002)(38070700005)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8C90D564CB3FA4598034F70D24A9278@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4295
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	18da8dc1-118d-4b51-75e2-08da8519821b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gSJZsq4wF0SBPQDa8o4PADFjCAHT4FLy9k2qreoECJVB3JtA84LOgXrK9pOII9E7xEp+u8MhgY1bS+9c3nwrsBUEtLLBUDauBsycib2UoFJIk9q513SzNAAiolnF52XvVZ4n97op86CKGZgOW6JbvchxLElN6kMYlyf182ZOQf5MwFx0iAuPKZDLPTpi70W/z8GluycmQI3xCq+EKxI5stShaBWCfIWYSEjmkxvcclwPlrXCMtUZ2+c88q5vNmDOgOxcTax5GAjU1t9TDLB0YMhyl3ttrtZ1TjY0Q2vlcJVQpoGpj8KxleXGqSDrfUAz4QXBmjv0wWxvjmnkiJOq//+frpcnv8IFdM3+z+J+VH52QsWPFBs2jfvTw21XfiqjuPgVESDKx01BqcD+yL+k5ptJR7eIIAVGrv1ETGTi32RmAGBN5lIvb02XPV6WgTmiPuYM4sHLIcQzPus3g5TdQu4FIvOc27SPDrdcRTO7wsZ6C2aXDM80smZgB7jPmWTIJ9PwlFzGh9jcwdnCGO3VZTVf9zb78aGkoc/AfuSqlNHFl94ZOnKiQjh1QJXYJ7xcgZB4Yibw/s417klCGLxGw1VgjJH6n5TWPpitEpCTGu1txoTaD2n3IwyQtTvlEmv4afAe9fq1E7S3GGk1sGhMoO4gmecMlDBExbgY1MbUMjNgz5h/FLlC4h7v3HG3+tkSB/sdXC+IXApEENwvKwJZCFu4sAcwpsKuBlGy5CBbtmSFhMVN7in1RGREBONYNkJDrwRvDBpJAd3GE0AMFBNxISH4nM7NeC8CP/w9LjR4rB83Jsqd8wcP9b6Mb5Xj2E91Ah+f2WSYdw+UxrZ+oIIqtQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(396003)(346002)(39860400002)(36840700001)(46966006)(40470700004)(6512007)(82310400005)(26005)(82740400003)(81166007)(40480700001)(6506007)(41300700001)(53546011)(5660300002)(36756003)(8936002)(6862004)(2906002)(70586007)(70206006)(4326008)(6486002)(966005)(2616005)(83380400001)(336012)(8676002)(86362001)(316002)(33656002)(40460700003)(54906003)(356005)(186003)(478600001)(47076005)(63350400001)(63370400001)(36860700001)(45980500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 15:09:54.6963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2330ccb6-83ff-4323-3833-08da85198922
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3223

SGksDQoNCj4gT24gMjMgQXVnIDIwMjIsIGF0IDE1OjQxLCBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0
cmFuZC5NYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPj4gT24gMjMgQXVnIDIw
MjIsIGF0IDE1OjMxLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPj4g
DQo+PiBPbiAyMy4wOC4yMDIyIDE1OjM0LCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+PiBP
biAyMyBBdWcgMjAyMiwgYXQgMTM6MzMsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4g
d3JvdGU6DQo+Pj4+IE9uIDIzLjA4LjIwMjIgMTI6MjQsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6
DQo+Pj4+PiAtLS0gYS90b29scy9saWJhY3BpL21rX2RzZHQuYw0KPj4+Pj4gKysrIGIvdG9vbHMv
bGliYWNwaS9ta19kc2R0LmMNCj4+Pj4+IEBAIC0xOCw2ICsxOCwxNiBAQA0KPj4+Pj4gI2luY2x1
ZGUgPHN0ZGxpYi5oPg0KPj4+Pj4gI2luY2x1ZGUgPHN0ZGJvb2wuaD4NCj4+Pj4+ICNpZiBkZWZp
bmVkKENPTkZJR19YODYpDQo+Pj4+PiArLyoNCj4+Pj4+ICsgKiBXaGVuIGJ1aWxkaW5nIG9uIG5v
biB4ODYgaG9zdCwgYXJjaC14ODYveGVuLmggd2lsbCBpbmNsdWRlIHhlbi5oIHdoaWNoIHdpbGwN
Cj4+Pj4+ICsgKiB0cnkgdG8gaW5jbHVkZSB0aGUgYXJjaCB4ZW4uaCAoZm9yIGV4YW1wbGUgaWYg
YnVpbHQgb24gYXJtLCB4ODYveGVuLmggd2lsbA0KPj4+Pj4gKyAqIGluY2x1ZGUgeGVuLmggd2hp
Y2ggd2lsbCBpbmNsdWRlIGFyY2gtYXJtLmgpLg0KPj4+Pj4gKyAqIFRvIHByZXZlbnQgdGhpcyBl
ZmZlY3QsIGRlZmluZSB4ODYgdG8gaGF2ZSB0aGUgcHJvcGVyIHN1YiBhcmNoIGluY2x1ZGVkIHdo
ZW4NCj4+Pj4+ICsgKiB0aGUgY29tcGlsZXIgZG9lcyBub3QgZGVmaW5lIGl0Lg0KPj4+Pj4gKyAq
Lw0KPj4+Pj4gKyNpZiAhKGRlZmluZWQoX19pMzg2X18pIHx8IGRlZmluZWQoX194ODZfNjRfXykp
DQo+Pj4+PiArI2RlZmluZSBfX3g4Nl82NF9fDQo+Pj4+PiArI2VuZGlmDQo+Pj4+IA0KPj4+PiBC
ZXNpZGVzIGJlaW5nIGNvbmZ1c2luZyB0aGlzIGRlcGVuZHMgb24gdGhlIG9yZGVyIG9mIGNoZWNr
cyBpbiB4ZW4uaC4NCj4+Pj4gDQo+Pj4+PiAjaW5jbHVkZSA8eGVuL2FyY2gteDg2L3hlbi5oPg0K
Pj4+Pj4gI2luY2x1ZGUgPHhlbi9odm0vaHZtX2luZm9fdGFibGUuaD4NCj4+Pj4+ICNlbGlmIGRl
ZmluZWQoQ09ORklHX0FSTV82NCkNCj4+Pj4gDQo+Pj4+IEF0IHRoZSB2ZXJ5IGxlYXN0IHlvdSB3
aWxsIHdhbnQgdG8gI3VuZGVmIHRoZSBhdXhpbGlhcnkgZGVmaW5lIGFzIHNvb24NCj4+Pj4gYXMg
cHJhY3RpY2FsbHkgcG9zc2libGUuDQo+Pj4gDQo+Pj4gQWNrDQo+Pj4gDQo+Pj4+IA0KPj4+PiBC
dXQgSSB0aGluayBhIGRpZmZlcmVudCBzb2x1dGlvbiB3aWxsIHdhbnQgZmluZGluZy4gRGlkIHlv
dSBjaGVjayB3aGF0DQo+Pj4+IHRoZSAjaW5jbHVkZSBpcyBuZWVkZWQgZm9yLCByZWFsbHk/IEkn
dmUgZ2xhbmNlZCB0aHJvdWdoIHRoZSBmaWxlDQo+Pj4+IHdpdGhvdXQgYmVpbmcgYWJsZSB0byBz
cG90IGFueXRoaW5nIC4uLiBBZnRlciBhbGwgdGhpcyBpcyBhIGJ1aWxkIHRvb2wsDQo+Pj4+IHdo
aWNoIGdlbmVyYWxseSBjYW4ndCBjb3JyZWN0bHkgdXNlIG1hbnkgb2YgdGhlIHRoaW5ncyBkZWNs
YXJlZCBpbiB0aGUNCj4+Pj4gaGVhZGVyLg0KPj4+IA0KPj4+IEFzIHN0YXRlZCBpbiB0aGUgY29t
bWVudCBhZnRlciB0aGUgY29tbWl0IG1lc3NhZ2UsIHRoaXMgaXMgbm90IGEgZ29vZA0KPj4+IHNv
bHV0aW9uIGJ1dCBhbiBoYWNrLg0KPj4+IA0KPj4+IE5vdyBJIGRvIG5vdCBjb21wbGV0ZWx5IGFn
cmVlIGhlcmUsIHRoZSB0b29sIGlzIG5vdCByZWFsbHkgdGhlIHByb2JsZW0NCj4+PiBidXQgdGhl
IGhlYWRlcnMgYXJlLg0KPj4gDQo+PiBXZWxsIC0gdGhlIGlzc3VlIGlzIHRoZSB0b29sIGRlcGVu
ZGluZyBvbiB0aGVzZSBoZWFkZXJzLg0KPiANCj4gWWVzIGJ1dCB0aGUgdG9vbCBpdHNlbGYgY2Fu
bm90IHNvbHZlIHRoZSBpc3N1ZSwgd2UgbmVlZCB0byBoYXZlIHRoZSB2YWx1ZXMNCj4gaW4gcHJv
cGVybHkgYWNjZXNzaWJsZSBoZWFkZXJzLg0KPiANCj4+IA0KPj4+IFRoZXJlIGlzIG5vdCBzdWNo
IGFuIGlzc3VlIG9uIGFybS4NCj4+IA0KPj4gVGhlbiB3aHkgZG9lcyB0aGUgdG9vbCBpbmNsdWRl
IHhlbi9hcmNoLWFybS5oIGZvciBBcm02ND8NCj4gDQo+IEJlY2F1c2UgdGhpcyBoZWFkZXIgZGVm
aW5lcyB0aGUgdmFsdWVzIHJlcXVpcmVkIGFuZCBhcyBubyBzdWNoIHRoaW5nIGFzIGluY2x1ZGUg
eGVuLmguDQo+IFRoZSBwb2ludCBpcyBvbiBhcm0sIHRoZSBhcmNoLWFybS5oIGhlYWRlciBkb2Vz
IG5vdCBkZXBlbmQgb24gcGVyIGNwdSBkZWZpbmVzLg0KPiANCj4+IA0KPj4+IFRoZSB0b29sIG5l
ZWRzIGF0IGxlYXN0Og0KPj4+IEhWTV9NQVhfVkNQVVMNCj4+PiBYRU5fQUNQSV9DUFVfTUFQDQo+
Pj4gWEVOX0FDUElfQ1BVX01BUF9MRU4NCj4+PiBYRU5fQUNQSV9HUEUwX0NQVUhQX0JJVA0KPj4+
IA0KPj4+IFdoaWNoIGFyZSBkZWZpbmVkIGluIGFyY2gteDg2L3hlbi5oIGFuZCBodm1faW5mb190
YWJsZS5oLg0KPj4+IA0KPj4+IEkgYW0gbm90IHF1aXRlIHN1cmUgaG93IHRvIGdldCB0aG9zZSB3
aXRob3V0IHRoZSBjdXJyZW50IGluY2x1ZGUNCj4+IA0KPj4gMSkgTW92ZSB0aG9zZSAjZGVmaW5l
LXMgdG8gYSBzdGFuZGFsb25lIGhlYWRlciwgd2hpY2ggdGhlIG9uZXMNCj4+IGN1cnJlbnRseSBk
ZWZpbmluZyB0aGVtIHdvdWxkIHNpbXBseSBpbmNsdWRlLiBUaGUgdG9vbCB3b3VsZCB0aGVuDQo+
PiBpbmNsdWRlIF9vbmx5XyB0aGlzIG9uZSBoZWFkZXIuDQo+IA0KPiBTaG91bGRu4oCZdCB3ZSB0
cnkgdG8gdW5pZnkgYSBsaXR0bGUgYml0IHdoYXQgaXMgZG9uZSBvbiBhcm0gYW5kIHg4NiBoZXJl
ID8NCj4gTm90IG9ubHkgZm9yIHRoaXMgdG9vbCBidXQgaW4gZ2VuZXJhbCBpbiB0aGUgcHVibGlj
IGhlYWRlcnMNCj4gDQo+IEkgd2lsbCB0cnkgdG8gcmVkdWNlIHRoZSBwcm9ibGVtIGEgYml0IG1v
cmUgdG8gZmluZCB3aGF0IHdlIHdvdWxkIG5lZWQgdG8NCj4gcHVsbCBvdXQgaW4gYSBzdGFuZGFs
b25lIGhlYWRlci4NCg0KT25seSB0aGUgMyBYRU5fQUNQSV8gYXJlIG5lZWRlZCBhbmQgdGhvc2Ug
YXJlIGluIGZhY3Qgb25seSB1c2VkIGJ5IG1rX2RzZHQuYy4NCkhvdyBhYm91dCBtb3ZpbmcgdGhv
c2UgdG8gYSB4ZW4tYWNwaS5oIGhlYWRlciBhbmQgaW5jbHVkZSB0aGF0IG9uZSBpbiB4ZW4uaCA/
DQoNCk90aGVyIHNvbHV0aW9uIGFzIHRob3NlIGFyZSBvbmx5IHVzZWQgaW4gbWtfZHNkdCwgSSBj
b3VsZCBqdXN0IGRlZmluZSB0aGVtIHRoZXJlIOKApg0KDQpUaGlzIGlzIHRoZSBjb21taXQgd2hp
Y2ggY3JlYXRlZCB0aGUgaXNzdWU6DQpodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9
eGVuLmdpdDthPWNvbW1pdDtoPWQ2YWM4ZTIyYzdjNTUyNWRiMWRhNzlmZDFkMWYwM2VlNmI1NTdm
MGQNCg0KQW55IG90aGVyIGlkZWEgaG93IHRvIHByb3Blcmx5IGZpeCB0aGlzID8NCg0KQ2hlZXJz
DQpCZXJ0cmFuZA0KDQo+IA0KPj4gDQo+PiAyKSBTZWRkZXJ5IG9uIHRoZSBoZWFkZXJzLCBwcm9k
dWNpbmcgYSBsb2NhbCBvbmUgdG8gYmUgdXNlZCBieSB0aGUNCj4+IHRvb2wuDQo+IA0KPiBZb3Ug
bWVhbiBhdXRvZ2VuZXJhdGluZyBzb21ldGhpbmcgPyBUaGlzIHdvdWxkIGp1c3QgbW92ZSB0aGUg
cHJvYmxlbS4NCj4gDQo+IEJlcnRyYW5kDQo+IA0KPj4gDQo+PiBKYW4NCg0K

