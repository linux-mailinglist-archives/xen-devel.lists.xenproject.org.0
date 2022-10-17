Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AF560130C
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 17:55:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424500.671966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okSRb-0003nq-GC; Mon, 17 Oct 2022 15:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424500.671966; Mon, 17 Oct 2022 15:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okSRb-0003lA-Cw; Mon, 17 Oct 2022 15:54:23 +0000
Received: by outflank-mailman (input) for mailman id 424500;
 Mon, 17 Oct 2022 15:54:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rSUT=2S=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1okSRZ-0003l4-Mb
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 15:54:21 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20063.outbound.protection.outlook.com [40.107.2.63])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f59aec8f-4e33-11ed-8fd0-01056ac49cbb;
 Mon, 17 Oct 2022 17:54:19 +0200 (CEST)
Received: from DB7PR05CA0024.eurprd05.prod.outlook.com (2603:10a6:10:36::37)
 by AS8PR08MB6022.eurprd08.prod.outlook.com (2603:10a6:20b:295::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 15:54:17 +0000
Received: from DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::bf) by DB7PR05CA0024.outlook.office365.com
 (2603:10a6:10:36::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Mon, 17 Oct 2022 15:54:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT036.mail.protection.outlook.com (100.127.142.193) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 15:54:17 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Mon, 17 Oct 2022 15:54:17 +0000
Received: from c2de487274a2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 750FC7A4-B222-47F3-8FEF-EBC52EDEE1C6.1; 
 Mon, 17 Oct 2022 15:54:06 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c2de487274a2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 17 Oct 2022 15:54:06 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB9868.eurprd08.prod.outlook.com (2603:10a6:20b:5ac::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 15:54:05 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5723.032; Mon, 17 Oct 2022
 15:54:05 +0000
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
X-Inumbo-ID: f59aec8f-4e33-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XsQaHp1wAKtAbsjgDIbxubearosftaXWUWc1fT3HOOAqGeNyfHLkKatutRtYlDLCFgKc0vle+IHmJDF0b5rfwyAhNiw4tqTLDR1gN+WtkRlHf2ukNZ6vSmhrDnHT3jkrM5qEsvU8WGyNrkxYdazzU0Biv7r+cbNbIHJPY5doZZrLl6cd0IYfKhwSzAis0T3xlWDY5BuKRtNi7ChdGjgIZT3kacwBpCIWPpZ28FR2eKnuCJ6/Dq9rcIU/IU+7CLqBWPnM1sy8KKt3xLABg6VI4LxL5k6l+OXpq7MwGRBmACsT4w3UDquTxn+B/6lRNuG7imz94UuTGuiKAZs7vv3KrA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFdxsbDalMzwVZO0L318eW7ifMyVW7uS8kLd+vdvrl4=;
 b=H4DAkZHvxBFdDjSdO97m5/ppHoMcw4+IJFDnwiioWCJ8In8oHf95pE4Us/OHbeFIGVj1v0VPPFEt3qhcC9rYenjYIV8wmE+9W24ODvlo2LblEzqP4f48av4Kr2nrrYnERgXa14Z1nbSz3GZVw85f2sKZGEMMnITH4Gxo3+yCLDVmustCbH4D+G7mRxsEooFHV/eyLFvpAK3fyA2llgKw5L8nHzLf9Pixoqz40Np68C6J+I6WzznDuUK0Kn11QEFzbXjTHBWP36e0VPmD9PeQZysb8YgpTgvnD7zytMCL5pwvhOdJWR98r0LBnWv3cXBOb43OZ+oEUs09cvlpEGujvA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFdxsbDalMzwVZO0L318eW7ifMyVW7uS8kLd+vdvrl4=;
 b=wZ4vhKE/0JAZF6XzK1dkfnjpIIwPoJZcsLoOTP8jxOdrQvioAvbgAU5ozV/1F0adZlFMR6qGWn0yQL5jut9ywaYPRvaCnhbqMxEKbjhfDmnXWqzrSMqqV11oDAzdnAkFJLstpmpJcZOMFq1HyYuCYyBkSihWN0MO7fsexpdzseU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkY9N/OJLiCnfETbHwecTAEO0ZdnPXTupz1ueKgRScBPrL/XM1MctzrlLuHsY3aNb9aRLctd+Kg7l4l4FfyFVUcC8Z/Z/8wI3hXUQk5PcVTQ8Wdxu+r4hyDLViwinTraA7vePRpvpbUa+8dDCyyupzaeAcJOzrflYLWRa71S/7x4j4A71Q/k2yfKgF5neJq41dIHAc55vE3h+3IYlyamfAbhK6sxc2EedvvYi7oWwBTzwFT/yzbKph0oH1mYh8IV9yLF99Bvn65YfGph5tLy3z/0oQ3O63Rsd/YLqFLqH3OMl3JqwLwHgvQvvXTS9kSA5tlr749mUV50eNYD8DDZxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFdxsbDalMzwVZO0L318eW7ifMyVW7uS8kLd+vdvrl4=;
 b=Saz9qO69JNiNoYcBm663qr5Go5SlPUHh9r4IZitK39y83WlmoHRMRMc+sk6xPsvHCITlPqHSI3S+z6fSDEkMotukUQvI+rjhqObER738r1DdpMkerepNZKVOtFcqeF1jbUH11WNuNn2H/97vKeMrKzJOKdMty5blXOhhHoIDR2u+Q8AREojNhsKRi1lQvCyIU/awKNR0vCClKmyubC54cXP6vBBZ6Q32Tmb1PXf8nojWxXlsQNWON+EBzqxLSCWozEBMbLLgkUnhYXLJs9ZaXxX21oTJ3/O7Sm9tKoMaoZd1KvNQQ/BXNFvkt5KYXcX1m1wdijjSQB0lMi/twT1OUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFdxsbDalMzwVZO0L318eW7ifMyVW7uS8kLd+vdvrl4=;
 b=wZ4vhKE/0JAZF6XzK1dkfnjpIIwPoJZcsLoOTP8jxOdrQvioAvbgAU5ozV/1F0adZlFMR6qGWn0yQL5jut9ywaYPRvaCnhbqMxEKbjhfDmnXWqzrSMqqV11oDAzdnAkFJLstpmpJcZOMFq1HyYuCYyBkSihWN0MO7fsexpdzseU=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v3] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Topic: [PATCH v3] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Index: AQHY4fyZYp3iu3IBsEeHODWajPdDU64SurkAgAABF9A=
Date: Mon, 17 Oct 2022 15:54:04 +0000
Message-ID:
 <AS8PR08MB79912598D9CF655D2B68C0E092299@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221017074618.36818-1-Henry.Wang@arm.com>
 <a03729ef-0883-c535-d971-3c265de6b69e@xen.org>
In-Reply-To: <a03729ef-0883-c535-d971-3c265de6b69e@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 68FEDEB3A00BC8489DECB1E642E8EBB6.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB9868:EE_|DBAEUR03FT036:EE_|AS8PR08MB6022:EE_
X-MS-Office365-Filtering-Correlation-Id: 48b166e4-f0fa-4e7c-7fde-08dab057d8c7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 foYUqy00+BIcvfKjsS/zXb3Vic0n2tnOBfQNBZDxSg9C5qd1OT3EwrO8J3Vawu2BO+cORd9ub+kwe9eM3LOCKUbpkTVsKZv99kVLEMrM0JiztGMwK65M6Bm5sXxhbpECKbTwZ1AbuIXwGvhk2W1LIT+bLNRVRw30kMD7lYZx92TjogEuh+tIwKgxRckP68U2ncLyDmxREeutEaBA3ra7sxRIMIy5t/3BglrCPjMFyKjTfvzwXJzN5QZggmG1oJ3ZuSXITpoHS8w7HKnEBAdNrJ9WgPJLPhEFQsHYRa1ZxAk4/QUgu6IYfknp/aNkW5nKn9Z8UHPORp4Eq5rpMnISZ720pVp44Wbp/+r0Bh+/GbS8eeVPu2Wjm6PmWxAG8NOAmRgNoreeCgU/13uJJIaTFF89d6ugZ83HeHA6Wgcz+9V6ZdK/+syBkwRfhRmux8ZfKLO4K6WffqcHxxCECBmoX0hoez1/KXNdVVSyvbot1Z54CKx1bpBDNKwB34F45vY9B3fehvOn48i8kcYg89RlqLn7WRv/vwbrR/t9KD+5Z42VgmKuo1zfxea1heZpeI1lSAsoDcjH01+nncqvckl8jN2NbbiccSRWM9gcTuQfpo+WNwUhic8e97KK3F+IldMmrm+drI4XPUppOwaEeYrYAK0R8Jqloy/KAx0mSR+EMwOWmaTMi0at1dP5fevf6iTSrLv91gd4YuE2s16GWkl/t1or+tLS3Yq3/Y5nCXBHHreun5TGHDEC3+IhVwpo3hT6stRGc549/3/8goMF7hwJLw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(451199015)(86362001)(186003)(83380400001)(38070700005)(38100700002)(122000001)(52536014)(41300700001)(5660300002)(55016003)(8936002)(26005)(478600001)(71200400001)(6506007)(9686003)(53546011)(7696005)(4326008)(8676002)(76116006)(66556008)(66476007)(66446008)(64756008)(66946007)(2906002)(316002)(110136005)(54906003)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9868
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	51b1247d-25d9-496a-63b8-08dab057d181
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ROcMG9XHv2vIFEInhm8tVrRT26VhbomWautSmiuqT2fGuSqHBEy0O8Bnr3AOxCWKunO2x2lnoI0TR8VFj9tQXabCtm4BstEtT0AcCAuHxp1oN0mSKCZv65n3JnKb8YYzTZjpEjWBm4+sGIm5QmLJ5ragx+Q2QvzmKptKyR3z5FBIIPOcdC1t4oe/RDhZOSVQa3G6NNbzBVxF0jo6AG49/d2hRB0nOJMBL1JDtnTN8xxfDi9qND3G/RC6LLxpfNo/cv4CfMlr3Im5XvEYnx0fT21LZJeeqSskaWoRuymdh7cXoQjK5kfH7Jvdh7UgBBF+0ViEwgDKpO1BT+Zs6Efrr9wNkcFWoARPUW/Kh06lWH3mUG4eLSbe5NMjrbi4zwwmfZEHppkQPTELhERQeVPP7uN/2q4UAPNkfhR4ykHGijaBwp9X1LXdbUr1Gu1jTRMgWxqhrTK/ppNGoys3yDTVMxFz2iDTVAcrViJN0nJ/BAKtCipt+2nbIOGyyVZ0jfajGtJzrWYLlgjL69Hg7/IvlahcjvmvzXFTx2q4FaYGbR8skYK4QXxDDlJO/NVHZdVxgnADUIoUccCfalVGKu1gG5p6LZgfUa9Lg1P+sMWiKl/S3t1x9dCZaYtn5RHmeSR+9jK8FXYttoWFfzJe3XTNmIoXBpBs0O0tFyJO0IBsJY8aUp/fOWTX7ShASDQQKtlo4BJN7gBny5FPvwpB90w5MM8/WDvrGRX39FdBnBQCb4BeEoBy1RBPtfFuirJOCJAeEaFCjwvpGql8sjcqyOpAUg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199015)(40470700004)(46966006)(36840700001)(336012)(186003)(47076005)(83380400001)(356005)(81166007)(86362001)(36860700001)(82740400003)(5660300002)(2906002)(41300700001)(52536014)(8936002)(4326008)(82310400005)(55016003)(40480700001)(107886003)(8676002)(40460700003)(478600001)(9686003)(53546011)(6506007)(7696005)(26005)(316002)(70206006)(70586007)(54906003)(110136005)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 15:54:17.1786
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48b166e4-f0fa-4e7c-7fde-08dab057d8c7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6022

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjNdIHhlbi9h
cm06IHAybTogUG9wdWxhdGUgcGFnZXMgZm9yIEdJQ3YyIG1hcHBpbmcgaW4NCj4gYXJjaF9kb21h
aW5fY3JlYXRlKCkNCj4gDQo+IEhpIEhlbnJ5LA0KPiANCj4gT24gMTcvMTAvMjAyMiAwODo0Niwg
SGVucnkgV2FuZyB3cm90ZToNCj4gPiAgICAgICBpZiAoIHAybS0+cm9vdCApDQo+ID4gQEAgLTE3
NjIsNiArMTc3OCwyMCBAQCBpbnQgcDJtX2luaXQoc3RydWN0IGRvbWFpbiAqZCkNCj4gPiAgICAg
ICBJTklUX1BBR0VfTElTVF9IRUFEKCZwMm0tPnBhZ2VzKTsNCj4gPiAgICAgICBJTklUX1BBR0Vf
TElTVF9IRUFEKCZkLT5hcmNoLnBhZ2luZy5wMm1fZnJlZWxpc3QpOw0KPiA+DQo+ID4gKyAgICAv
Kg0KPiA+ICsgICAgICogSGFyZHdhcmUgdXNpbmcgR0lDdjIgbmVlZHMgdG8gY3JlYXRlIGEgUDJN
IG1hcHBpbmcgb2YgOEtCIEdJQ3YyDQo+IGFyZWENCj4gPiArICAgICAqIHdoZW4gdGhlIGRvbWFp
biBpcyBjcmVhdGVkLiBDb25zaWRlcmluZyB0aGUgd29yc3QgY2FzZSBmb3IgcGFnZQ0KPiA+ICsg
ICAgICogdGFibGVzIGFuZCBrZWVwIGEgYnVmZmVyLCBwb3B1bGF0ZSAxNiBwYWdlcyB0byB0aGUg
UDJNIHBhZ2VzIHBvb2wNCj4gaGVyZS4NCj4gPiArICAgICAqIEZvciBHSUN2MywgdGhlIGFib3Zl
LW1lbnRpb25lZCBQMk0gbWFwcGluZyBpcyBub3QgbmVjZXNzYXJ5LCBidXQNCj4gc2luY2UNCj4g
PiArICAgICAqIHRoZSBhbGxvY2F0ZWQgMTYgcGFnZXMgaGVyZSB3b3VsZCBub3QgYmUgbG9zdCwg
aGVuY2UgcG9wdWxhdGUgdGhlc2UNCj4gPiArICAgICAqIHBhZ2VzIHVuY29uZGl0aW9uYWxseS4N
Cj4gPiArICAgICAqLw0KPiA+ICsgICAgc3Bpbl9sb2NrKCZkLT5hcmNoLnBhZ2luZy5sb2NrKTsN
Cj4gPiArICAgIHJjID0gcDJtX3NldF9hbGxvY2F0aW9uKGQsIDE2LCBOVUxMKTsNCj4gPiArICAg
IHNwaW5fdW5sb2NrKCZkLT5hcmNoLnBhZ2luZy5sb2NrKTsNCj4gPiArICAgIGlmICggcmMgIT0g
MCApDQo+ID4gKyAgICAgICAgcmV0dXJuIHJjOw0KPiANCj4gDQo+IHAybV9zZXRfYWxsb2NhdGlv
bigpIHdhbnRzIHRvIGJlIGNhbGxlZCBhZnRlciAncC0+ZG9tYWluJyBpcyBzZXQuIFNvDQo+IHAy
bV90ZWFyZG93bl9maW5hbCgpIHdpbGwgbm90IHJldHVybiBlYXJseSBhbmQgbGVhayBtZW1vcnkg
KGFzIEFuZHJldw0KPiBwb2ludGVkIG91dCkuDQoNClllcyB0aGlzIGlzIGEgcmVhbGx5IHNpbGx5
IG1pc3Rha2UgdGhhdCBJIG1hZGUsIGFuZCBJIGFtIHJlYWxseSBzb3JyeSBmb3IgdGhhdC4NCg0K
PiANCj4gRm9yIHNpbXBsaWNpdHkgSSB3b3VsZCBtb3ZlIHRoZSBjb2RlIHJpZ2h0IGF0IHRoZSBl
bmQgb2YgdGhlIGZ1bmN0aW9uLg0KDQpEZWZpbml0ZWx5Lg0KDQo+IEJ1dCBpZiB5b3Ugd2FudCB0
byBrZWVwIGl0IGhlcmUgdGhlbi4uLg0KPiANCj4gPiArDQo+ID4gICAgICAgcDJtLT52bWlkID0g
SU5WQUxJRF9WTUlEOw0KPiANCj4gLi4uIHRoaXMgbmVlZHMgdG8gYmUgZG9uZSBmaXJzdCBhcyB3
ZWxsLg0KDQpJIGFncmVlIG1vdmluZyB0aGF0IHBhcnQgdG8gdGhlIGVuZCB3b3VsZCBiZSBhIGJl
dHRlciBzb2x1dGlvbi4NCg0KPiANCj4gPg0KPiA+ICAgICAgIHJjID0gcDJtX2FsbG9jX3ZtaWQo
ZCk7DQo+IA0KPiBOb3RlIHRoYXQgaWYgeW91IG1vdmUgdGhlIGNvZGUgYXQgdGhlIGVuZC4gVGhl
biB5b3Ugd2lsbCBuZWVkIHRvIGFkZDoNCj4gDQo+IGlmICggcmMgKQ0KPiAgICByZXR1cm4gcmM7
DQo+IA0KPiBhZnRlciB0aGUgY2FsbCB0byBwMm1fYWxsb2NfdGFibGUoKTsNCg0KWWVzLCB0aGFu
a3MgdmVyeSBtdWNoIGZvciB0aGUgcmVtaW5kZXIuDQoNCj4gDQo+IE90aGVyIHRoYW4gdGhhdCB0
aGUgY29kZSBsb29rcyBnb29kIHRvIG1lLg0KDQpBcyBBbmRyZXcgc3RhdGVkIGluIGhpcyBlbWFp
bCB0aGF0IGhlIHdpbGwgZHJhZnQgYSBwYXRjaCwgVEJIIEkgYW0gbm90DQpzdXJlIGlmIG15IHBh
dGNoIHdvdWxkIGJlIHN1cGVyc2VkZWQgYnkgaGlzLCBidXQgSSB3aWxsIHRyeSB0byBzZWUgaWYg
aXQNCmlzIHBvc3NpYmxlIGZvciBtZSB0byBzZW5kIGEgdjQgdG9kYXkuDQoNCktpbmQgcmVnYXJk
cywNCkhlbnJ5DQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

