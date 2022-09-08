Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 130A95B1CA6
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 14:21:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403296.645363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWGWS-0003e7-Sc; Thu, 08 Sep 2022 12:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403296.645363; Thu, 08 Sep 2022 12:20:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWGWS-0003c3-Pm; Thu, 08 Sep 2022 12:20:44 +0000
Received: by outflank-mailman (input) for mailman id 403296;
 Thu, 08 Sep 2022 12:20:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymCA=ZL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oWGWR-0003bx-5x
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 12:20:43 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50066.outbound.protection.outlook.com [40.107.5.66])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a73c62f4-2f70-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 14:20:41 +0200 (CEST)
Received: from AM6PR08CA0043.eurprd08.prod.outlook.com (2603:10a6:20b:c0::31)
 by GV1PR08MB8452.eurprd08.prod.outlook.com (2603:10a6:150:84::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 12:20:38 +0000
Received: from AM7EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::49) by AM6PR08CA0043.outlook.office365.com
 (2603:10a6:20b:c0::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Thu, 8 Sep 2022 12:20:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT014.mail.protection.outlook.com (100.127.140.163) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Thu, 8 Sep 2022 12:20:37 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Thu, 08 Sep 2022 12:20:37 +0000
Received: from 145b6464d17b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A3A6A688-82DD-4032-B9E1-60FDE89D407A.1; 
 Thu, 08 Sep 2022 12:20:28 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 145b6464d17b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Sep 2022 12:20:28 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBBPR08MB6009.eurprd08.prod.outlook.com (2603:10a6:10:1f5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 12:20:25 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Thu, 8 Sep 2022
 12:20:25 +0000
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
X-Inumbo-ID: a73c62f4-2f70-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UzltbDZB8d0WoEiBOKmR1YBgi13QCoVnXupJptqXgY/nFhHRDmQm52hSMOGQVoHWDbDDsOusGubaGVm4gJ2AAvObcMppIv8HpWtP9Jk9BYdoxhYv2Y688mFMniPyj4ZXuBxgw3ri0FJRBNxNuGZJ7C9gkjd5PG6901SgXpc7kdpSuYKJf+UoRx8jb0/kKw2treCowMYhF+cQGz+D4EtrU6+CvmQ0wSI8qyWQutcFROBCk3zCPZ4aNhwxmcSXYtmS+jXgn+HVNOGi0oOgwN7CSNy9LmCjO2Nt69Wb18pfoIlf9zP7ek0uY8+SGyfFs+O3N0IUH9eEI71Bs79mz8s8Fg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z82F4EPGqp02NKo0C0gyevuhSIkEumDNmZjeE1poCp4=;
 b=b5JVJtiM3zBUUudHLdW7zKX1p0ME8rrTeWaQ2ycQ0tukg6LMSqTOrkY+C04i8FQxWTUA83+0050qRPVV5l/R4cX86tJvhacgqPti5LbGl9JAwByHqc61Ppicgc4jNn28fl53hrfcjftu7YiII3sumqiLAM4asQDEX5WPLkJw+jD4xKVM5KqT0NfAsu/ahn8u79/q6S8o/wR84qVnWKozMo6rCkVCx0wWraooBPq65w0cBCoRT3tgiqXYVdr+C9IasOwJL3HusQFpw573ny0kVLvwLc82AbfFG4tKE6NtV1S4QWiD9TiufwKhzE3B/xY8qQdVjkJvokx0AF2estrJbQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z82F4EPGqp02NKo0C0gyevuhSIkEumDNmZjeE1poCp4=;
 b=fEjgOV8p6SYHn0rEht7JomtROlthdbHNIt5k9jilmGnApKXm6NIocvFf/c5R80ueBFQnXv2yVtRSItwJow1vPM76c3YP7viedWgIIipGwWwV0uJyi1lFD5zb/x/IUD9MTn7JTRWZpXt3UO9JD+9IUzjOrf+Um7QDGbkKgUVtZ/Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+IGR14JQzitljevu1t3SuTrksX/nORcoSInlSs6SZKgqG8pjhYZ60KmNtal99CEE9L7HpeVAUvqbLu3Vekkl8yzF85Blk1j5lHhYIRd/XcfLnrM/Xtilr8xsdmQlH5FxM7FQuL5uA3HJWjPVWPzfS7tzG3vgzz+2YSXodd61s1xQ1A/nw+kWF/4/Z8OzdGUGKdXf1SrA+o6qwKm+5Xts3yAE1k2jbxaNZN4ZqNKMlrfDRkMn2C4RwzvQGUyELlck/fg6TZ4JI89o9vfvU7WC7lii0MbaPI2UhJRmUVre20JQnwACRR4n/ty4Nvr3xhVn4wZtEwcTlHrwvKw0pQZCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z82F4EPGqp02NKo0C0gyevuhSIkEumDNmZjeE1poCp4=;
 b=abjpj2J911mcZjohJUXPl8wO/erVmgyJdtg1fLG1qdp7MbT31Jxk6fUpm9ZcVfJx2GlY+LzVmHOX4m7jPAfoYaP/HdXXVRM2RGaFlxAjgLCp1Jdo1XASqawrddn6gkxYModE2S3UqumE7yk1gbKZGJea9h6Dn3iz01uYY+ond5GCtxFJy87EADiWuP/zccAaGhWqguuos8A1dPpDe+giSoKKqeB5G3iYQqXL77fjvux/bcClVUFXQ6Au8XDReoKJ3l7oxz/x555iqjFoB2f/HEVuRfScTctEUHfz468NongRjgZ7h0uuNz9ZDLdGD78IRrO/IJ7IFzhNM3/iR+Oi2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z82F4EPGqp02NKo0C0gyevuhSIkEumDNmZjeE1poCp4=;
 b=fEjgOV8p6SYHn0rEht7JomtROlthdbHNIt5k9jilmGnApKXm6NIocvFf/c5R80ueBFQnXv2yVtRSItwJow1vPM76c3YP7viedWgIIipGwWwV0uJyi1lFD5zb/x/IUD9MTn7JTRWZpXt3UO9JD+9IUzjOrf+Um7QDGbkKgUVtZ/Y=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH] xen/arm, device-tree: Make static-mem use
 #{address,size}-cells
Thread-Topic: [PATCH] xen/arm, device-tree: Make static-mem use
 #{address,size}-cells
Thread-Index: AQHYw2XP4kTWxhuEi0Wfg39PE1aR463VV3SAgAAAWqCAABXxgIAABIfA
Date: Thu, 8 Sep 2022 12:20:25 +0000
Message-ID:
 <AS8PR08MB7991AAA1E69317EFE1E5F0F392409@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220908093129.30124-1-Henry.Wang@arm.com>
 <f9874353-6060-61b1-3faa-9698f85c7ac4@amd.com>
 <AS8PR08MB799177FFC8C90D870DED79B792409@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <f6018070-2ecb-99cd-cde9-d8c1f52ce74f@xen.org>
In-Reply-To: <f6018070-2ecb-99cd-cde9-d8c1f52ce74f@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 34903B92A021544883C03196C5978A3D.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7641f162-af26-4e28-8bac-08da919489c4
x-ms-traffictypediagnostic:
	DBBPR08MB6009:EE_|AM7EUR03FT014:EE_|GV1PR08MB8452:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xUxkDh6SJ2RSry0nU/1LROgbwMt6L929kWnCmVvAO9WI2GhlbRn7JCn9Z28Tmz+iJSMiBxrdgRi/AbZMkdBItUlz6dciou0lKaqXLvqkbc5+AHZkd8a9Xq9+lbqjHSaXBqK4rP0OarH7eEuBhfoXHyNHzWQAT2z40aTF0H2HPicWBMr87ReXBsJgX5p9yKZJNDy/B/FIK1o6G/F1fRj4vFsr4oAvjtNkW6pBq33ly5TmCAkihL5WbgkQ78ONe3L5/Hh/jtCaHCiTEPrlOt+3ZV/WPGvleZ/FnDHNv4qu/tq+SbP4Ql8NbN2K7sMFptaAklSl9fzY/NIVYLYYqYh2cXVHuTExHpBznVPbo2ua/W3fnOLVb/kneS6MBPDH0Do0SkC+pkt2xcBXMIqqXWdQkthvHnpszxnkfuFEIf5apMl7PytHoUZfzFUOqy6836BUksSAOZNIvqCLwIMSxper3tnDpyrV43EzeVee7+pl3aBrCC2uYBe97xcWPoqCHeTa89mDMu+Hizlf9cWB3UkqeQuNaGnpFwq+HcjAK+ajqoRu/gwZl6LsNTLXTYJZoR361R23g6ccGYyq4hWOY0Tul4siikq205FvPYnn3wy/+ESTJyYj61TafgOkXCVbpSShk+OhKMrAUQlzY/4O2JF07mA3XMDVCmhfu5WPkno/4KtTfnqKA7tbWySjXiWIBZ3QHKKCiakGAiR02owwV9iBf+byN/hi581GJW7zf6ZKphKKDewhd12eHhbxErAjasy8friwkG/jX+3d7KfOvzOKUw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(8936002)(52536014)(5660300002)(186003)(2906002)(55016003)(86362001)(6506007)(26005)(7696005)(9686003)(33656002)(83380400001)(71200400001)(478600001)(41300700001)(38070700005)(4326008)(8676002)(66476007)(66556008)(66946007)(110136005)(66446008)(64756008)(54906003)(76116006)(316002)(122000001)(38100700002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6009
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bb51ddfe-5d8e-47d5-caf6-08da91948220
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MckpzKSjSTn+0gw3aHCOKQGKHfp9cmFKnVzTS7dTSOrftish1uwr3Hwr94uTRhvskMqkgy0pPwv2Mqs9hwECZ2fp1kGLLsehhbH+17fNSUYm6y5IX/ybIpy9/X2dJZ8IDdAH4G0JIWq+A9HBpv+7Jd12Kg1q/p3uGtA0ghfd8ps0MunSdCNJAboOfqGvVCA1OTJuS8yZg+ewieCi0Qe9Te4Y8AgBAV1CwP03nTtKMyPkUXmxqlDlXvzYN0vPnIA4lCJJ7AXNJIdBTjhXQWFdD5IcdaAgfXWwEkokO+iCDz08tmZ7DyoL1QPVkxIpFNMBl7XQzWvMIWrM0coxmx/Uopxtgx3qeeSQMR3TGzs+kTD9ki8gMa6aaCL17biV/Ayw7+hM6yFawZPhcmHSXExhDwM64ZL8sc4WrF0iH/6qHF81Hgi6QdF/wimwPe5B2OMeE3b20ckJIaAyIIWdmSRbTtP8DS6KklvZffx6z9iDix91eekukPJtWidtj7mJdRh6ckZh83bEsnDg7ymvxL9przgRixX2AM8fHf81v2b/wMIEWwFAyvRvCI7BtMtgMi6a93BS1YEDbg/PiC0TLz2gbM6uN1e0aJtwtMb5xOL6vdh6lMah/NRmVT/liFTUuze/6QtNVSKRbwvIy/ncfy4BQkJpOlYr+NQGtZVnTlCwYEUlh6jEvVPbafuHn2WAbimSPVLjnT7BUlFG4cjW5AhJT4GDUF2/AscHPQsMZUZYPlp2c2e5/jtsBSQHy/TTqoL8HRTVJzcuxHhwguIf2qq7xA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(136003)(376002)(346002)(36840700001)(40470700004)(46966006)(52536014)(5660300002)(356005)(2906002)(6506007)(82310400005)(9686003)(26005)(8676002)(41300700001)(81166007)(8936002)(54906003)(86362001)(110136005)(186003)(82740400003)(7696005)(70586007)(336012)(4326008)(478600001)(316002)(33656002)(107886003)(83380400001)(40460700003)(36860700001)(40480700001)(70206006)(55016003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 12:20:37.8112
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7641f162-af26-4e28-8bac-08da919489c4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8452

SGkgSnVsaWVuIGFuZCBNaWNoYWwsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gPj4+ICAgICAgIC8gew0KPiA+
Pj4gICAgICAgICAgIGNob3NlbiB7DQo+ID4+PiArICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMg
PSA8MHgxPjsNCj4gPj4+ICsgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwweDE+Ow0KPiA+Pj4g
KyAgICAgICAgICAgIC4uLg0KPiA+Pj4gICAgICAgICAgICAgICBkb21VMSB7DQo+ID4+PiAgICAg
ICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInhlbixkb21haW4iOw0KPiA+Pj4gLSAgICAgICAg
ICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwweDI+Ow0KPiA+Pj4gLSAgICAgICAgICAgICAgICAj
c2l6ZS1jZWxscyA9IDwweDI+Ow0KPiA+PiBXaHkgZGlkIHlvdSByZW1vdmUgdGhpcyBzZXQgaWYg
aXQgcmVsYXRlcyB0byB0aGUgY2hpbGRzIG9mIGRvbVUxIChlLmcuDQo+IGtlcm5lbCwNCj4gPj4g
cmFtZGlzaykgYW5kIG5vdCB0byBkb21VMSBpdHNlbGY/DQo+ID4NCj4gPiBXZWxsLCBJIHRoaW5r
IGhlcmUgdGhlIGV4YW1wbGUgaXMganVzdCBob3cgd2Ugc2V0dXAgdGhlIHN0YXRpYyBtZW1vcnks
IHNvDQo+IHdlIGp1c3QNCj4gPiB3YW50IHRvIGVtcGhhc2l6ZSB0aGUgcmVsYXRlZCBwYXJ0LiBJ
IGFncmVlIHVzZXJzIGNhbiBhZGQgYW5vdGhlcg0KPiAjYWRkcmVzcy1jZWxscw0KPiA+IGFuZCAj
c2l6ZS1jZWxscyBmb3IgZG9tVTEgbm9kZSBmb3IgdGhlIHBhcnRzIHRoYXQgeW91IG1lbnRpb25l
ZCwgYnV0IHRoYXQNCj4gaXMNCj4gPiBub3QgcmVmbGVjdGVkIGJ5IHRoZSBjdXJyZW50IGV4YW1w
bGUgKEkgY2FuJ3QgZmluZCBhbnl0aGluZyByZWxhdGVkIHRvIGtlcm5lbCwNCj4gPiByYW1kaXNr
LCBldGMuIGluIGN1cnJlbnQgZXhhbXBsZSkuIEkgbWlnaHQgZ2V0IGl0IHdyb25nIGJ1dCBoYXZp
bmcgdHdvDQo+ICNhZGRyZXNzLWNlbGxzDQo+ID4gYW5kICNzaXplLWNlbGxzIGluIHRoYXQgY2Fz
ZSB3b3VsZCBiZSBxdWl0ZSBtaXNsZWFkaW5nIGZyb20gbXkNCj4gdW5kZXJzdGFuZGluZy4NCj4g
DQo+IEkgYWdyZWUgd2l0aCB0aGF0LiBBcyB0aGlzIGlzIG9ubHkgYSBzbWFsbCBwYXJ0IG9mIHRo
ZSBEVCB3ZSB3YW50IHRvDQo+IGZvY3VzIG9uIHdoYXQgaXMgbmVjZXNzYXJ5IGZvciB0aGUgY3Vy
cmVudCBzZWN0aW9uLg0KPiANCj4gPiBTbyBJIGRlY2lkZWQgdG8gcmVtb3ZlIGl0Lg0KPiANCj4g
SSB3b3VsZCBtZW50aW9uIGl0IGluIHRoZSBjb21taXQgbWVzc2FnZSBiZWNhdXNlIHRoZSBjaGFu
Z2Ugc2VlbXMNCj4gdW5yZWxhdGVkIG90aGVyd2lzZS4NCg0KU3VyZS4NCg0KPiANCj4gVGhlIHNh
bWUgYXBwbHkgZm9yIHJlcGxhY2luZyBhZGRpbmcgZXh0cmEgIj09PT0iLiBCdXQgVEJILCB0aGlz
IGNoYW5nZQ0KPiBmZWVscyBjb21wbGV0ZWx5IHVucmVsYXRlZCB0byB0aGlzIHBhdGNoLiBTbyBJ
IHRoaW5rIGl0IGlzIGJldHRlciB0bw0KPiBoYXZlIGEgc2VwYXJhdGUgcGF0Y2guDQoNCkkgd291
bGQgcmV2ZXJ0IHRoaXMgY2hhbmdlIGZvciAiPT09PSIsIGFzIHNlbmRpbmcgYSBwYXRjaCBhZGRp
bmcNCiI9PT09IiBzZWVtcyB0byBub3QgbWFrZSB0b28gbXVjaCBzZW5zZS4uLi4uDQoNCj4gDQo+
IFsuLi5dDQo+IA0KPiA+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9ib290ZmR0LmMgYi94
ZW4vYXJjaC9hcm0vYm9vdGZkdC5jDQo+ID4+PiBpbmRleCBlYzgxYTQ1ZGU5Li5jZDI2NDc5M2Q1
IDEwMDY0NA0KPiA+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYw0KPiA+Pj4gKysrIGIv
eGVuL2FyY2gvYXJtL2Jvb3RmZHQuYw0KPiA+Pj4gQEAgLTM1MiwxMSArMzUyLDYgQEAgc3RhdGlj
IGludCBfX2luaXQgcHJvY2Vzc19kb21haW5fbm9kZShjb25zdA0KPiB2b2lkDQo+ID4+ICpmZHQs
IGludCBub2RlLA0KPiA+Pj4gICAgICAgICAgIC8qIE5vICJ4ZW4sc3RhdGljLW1lbSIgcHJlc2Vu
dC4gKi8NCj4gPj4+ICAgICAgICAgICByZXR1cm4gMDsNCj4gPj4+DQo+ID4+PiAtICAgIGFkZHJl
c3NfY2VsbHMgPSBkZXZpY2VfdHJlZV9nZXRfdTMyKGZkdCwgbm9kZSwNCj4gPj4+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiN4ZW4sc3RhdGljLW1lbS1hZGRyZXNz
LWNlbGxzIiwgMCk7DQo+ID4+PiAtICAgIHNpemVfY2VsbHMgPSBkZXZpY2VfdHJlZV9nZXRfdTMy
KGZkdCwgbm9kZSwNCj4gPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IiN4ZW4sc3RhdGljLW1lbS1zaXplLWNlbGxzIiwgMCk7DQo+ID4+PiAtDQo+ID4+PiAgICAgICBy
ZXR1cm4gZGV2aWNlX3RyZWVfZ2V0X21lbWluZm8oZmR0LCBub2RlLCAieGVuLHN0YXRpYy1tZW0i
LA0KPiA+PiBhZGRyZXNzX2NlbGxzLA0KPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHNpemVfY2VsbHMsICZib290aW5mby5yZXNlcnZlZF9tZW0sIHRydWUpOw0KPiA+
Pj4gICB9DQo+ID4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+
IGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+ID4+PiBpbmRleCBiNzZhODRlOGY1Li4y
NThkNzQ2OTlkIDEwMDY0NA0KPiA+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5j
DQo+ID4+PiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4gPj4+IEBAIC01NjMs
MjEgKzU2Myw5IEBAIHN0YXRpYyBpbnQgX19pbml0IHBhcnNlX3N0YXRpY19tZW1fcHJvcChjb25z
dA0KPiA+PiBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKm5vZGUsDQo+ID4+PiAgICAgICBjb25zdCBz
dHJ1Y3QgZHRfcHJvcGVydHkgKnByb3A7DQo+ID4+Pg0KPiA+Pj4gICAgICAgcHJvcCA9IGR0X2Zp
bmRfcHJvcGVydHkobm9kZSwgInhlbixzdGF0aWMtbWVtIiwgTlVMTCk7DQo+ID4+PiAtICAgIGlm
ICggIWR0X3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICIjeGVuLHN0YXRpYy1tZW0tYWRkcmVzcy1j
ZWxscyIsDQo+ID4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFkZHJfY2VsbHMp
ICkNCj4gPj4+IC0gICAgew0KPiA+Pj4gLSAgICAgICAgcHJpbnRrKFhFTkxPR19FUlINCj4gPj4+
IC0gICAgICAgICAgICAgICAiZmFpbGVkIHRvIHJlYWQgXCIjeGVuLHN0YXRpYy1tZW0tYWRkcmVz
cy1jZWxsc1wiLlxuIik7DQo+ID4+PiAtICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPj4+IC0g
ICAgfQ0KPiA+Pj4NCj4gPj4+IC0gICAgaWYgKCAhZHRfcHJvcGVydHlfcmVhZF91MzIobm9kZSwg
IiN4ZW4sc3RhdGljLW1lbS1zaXplLWNlbGxzIiwNCj4gPj4+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc2l6ZV9jZWxscykgKQ0KPiA+Pj4gLSAgICB7DQo+ID4+PiAtICAgICAgICBw
cmludGsoWEVOTE9HX0VSUg0KPiA+Pj4gLSAgICAgICAgICAgICAgICJmYWlsZWQgdG8gcmVhZCBc
IiN4ZW4sc3RhdGljLW1lbS1zaXplLWNlbGxzXCIuXG4iKTsNCj4gPj4+IC0gICAgICAgIHJldHVy
biAtRUlOVkFMOw0KPiA+Pj4gLSAgICB9DQo+ID4+PiArICAgICphZGRyX2NlbGxzID0gZHRfbl9h
ZGRyX2NlbGxzKG5vZGUpOw0KPiA+Pj4gKyAgICAqc2l6ZV9jZWxscyA9IGR0X25fc2l6ZV9jZWxs
cyhub2RlKTsNCj4gPj4gVGhlcmUgaXMgYSB0eXBlIG1pc21hdGNoIGhlcmUgYXMgZS5nLiBhZGRy
X2NlbGxzIGlzIHUzMiBhbmQNCj4gZHRfbl9hZGRyX2NlbGxzDQo+ID4+IHJldHVybiB0eXBlIGlz
IGludC4NCj4gPj4gQnV0IEkgZG9uJ3QgdGhpbmsgdGhpcyBjYW4gYmUgaGFybWZ1bCBhbmQgYWxz
byBpdCdzIHN0cmFuZ2UgZm9yIG1lIHRoYXQNCj4gPj4gZHRfbl9hZGRyX2NlbGxzDQo+ID4+IGlz
IGRlZmluZWQgdG8gcmV0dXJuIGludCBnaXZlbiB0aGF0IGl0IGVpdGhlciByZXR1cm5zIDIgb3Ig
YmUzMl90b19jcHVwLA0KPiB3aGljaA0KPiA+PiBtZWFucyBpdCBzaG91bGQgcmV0dXJuIHUzMi4N
Cj4gPg0KPiA+IFllYWguIEkgYWdyZWUuIEkgZGlkIGEgZ2l0IGJsYW1lIGhlcmUgYW5kIGZvdW5k
IHRoaXMgZnVuY3Rpb24gaXMgaW50cm9kdWNlZCA5DQo+ID4geWVhcnMgYWdvIGluICJkYmQxMjQz
IHhlbi9hcm06IEFkZCBoZWxwZXJzIHRvIHVzZSB0aGUgZGV2aWNlIHRyZWUiLiBTbyBJDQo+IHRo
aW5rDQo+ID4gcHJvYmFibHkgaXQgd291bGQgYmUgZWFzaWVyIHRvIGFzayB0aGUgYXV0aG9yIGZv
ciB0aGUgZm9sbG93aW5nIGFjdGlvbg0KPiBkaXJlY3RseSA6KSkNCj4gDQo+IFRoZSBjb2RlIHdh
cyBpbXBvcnRlZCBmcm9tIExpbnV4IHdoZXJlIGl0IHNlZW1zIHRvIGJlIG1vcmUgY29tbW9uIHRv
DQo+IHVzZQ0KPiAiaW50IiByYXRoZXIgdGhhbiAidW5zaWduZWQiLg0KPiANCj4gPg0KPiA+IEBK
dWxpZW4sIHdoYXQgZG8geW91IHRoaW5rPyBTaGFsbCB3ZSBtb2RpZnkgdGhlIHJldHVybiB0eXBl
IG9mIHRoZXNlIHR3bw0KPiA+IGZ1bmN0aW9ucz8NCj4gDQo+IEkgdGhpbmsgaXQgd291bGQgYmUg
Z29vZCB0byBiZSBjb25zaXN0ZW50LiBIb3dldmVyLCB0aGVyZSBhcmUgb3RoZXINCj4gdXNlcnMg
b2YgZF9uX2FkZHJfY2VsbHMoKSAoc29tZSBhcmUgZXhwZWN0aW5nICdpbnQnKS4gU28gaWYgeW91
IHN3aXRjaA0KPiB0byBhIGRpZmZlcmVudCB0eXBlIHRoZW4gdGhpcyB1c2Ugd2lsbCBiZSBjb25z
aXN0ZW50IGJ1dCBub3QgdGhlIG90aGVycy4NCj4gDQo+IEkgd291bGQgb25seSBzdWdnZXN0IHRv
IGxvb2sgYXQgaXQgaWYgeW91IGhhdmUgaWYgeW91IGhhdmUgY29waW91cyB0aW1lDQo+IGFuZCBm
YW5jeSBnb2luZyBkb3duIHRoZSByYWJiaXQgaG9sZSA6KS4NCj4gDQo+IEFzIHRvIHdoaWNoIHR5
cGUgdG8gY2hvc2UsIHdlIGFyZSBwaGFzaW5nIG91dCB1c2Ugb2YgdVhYIGluIG5ldyBjb2RlLiBT
bw0KPiB0aGlzIHNob3VsZCBiZSAndWludDMyX3QnLiBJIHdvdWxkIGFsc28gYmUgZmluZSB0byB1
c2UgJ3Vuc2lnbmVkIGludCcNCj4gZm9yIHRoZSBvdXRzaWRlIGludGVyZmFjZS4NCj4gDQo+IEkg
ZG9uJ3QgaGF2ZSBhIHN0cm9uZyBvcGluaW9uIGVpdGhlciB3YXkuDQoNCkkgcGVyc29uYWxseSB3
b3VsZCBsaWtlIHRvIGtlZXAgdGhlIGN1cnJlbnQgd2F5LCBjaGFuZ2luZyB0aGUgdHlwZSB0byBt
ZQ0Kc291bmRzIGxpa2Ugb3V0IG9mIHNjb3BlIHdpdGggdGhpcyBwYXRjaCBhbmQgd2lsbCBicmlu
ZyB1cyB0aGUgcmlzayBvZiBicmVha2luZw0Kb3RoZXIgcGxhY2VzLg0KDQpTbyBJIHdpbGwgYWRk
cmVzcyB0aGUgY29tbWl0IG1lc3NhZ2UgYW5kICI9PT09IiBjaGFuZ2VzIGFuZCBzZW5kIGEgdjIu
DQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4g
SnVsaWVuIEdyYWxsDQo=

