Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA45535168
	for <lists+xen-devel@lfdr.de>; Thu, 26 May 2022 17:30:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337635.562291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuFPo-0005PW-Co; Thu, 26 May 2022 15:28:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337635.562291; Thu, 26 May 2022 15:28:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuFPo-0005Me-9W; Thu, 26 May 2022 15:28:44 +0000
Received: by outflank-mailman (input) for mailman id 337635;
 Thu, 26 May 2022 15:28:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/0Dc=WC=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nuFPl-0005MY-UC
 for xen-devel@lists.xenproject.org; Thu, 26 May 2022 15:28:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84801eff-dd08-11ec-837f-e5687231ffcc;
 Thu, 26 May 2022 17:28:39 +0200 (CEST)
Received: from AM6P195CA0016.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::29)
 by VI1PR08MB3216.eurprd08.prod.outlook.com (2603:10a6:803:3d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Thu, 26 May
 2022 15:28:36 +0000
Received: from AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::7e) by AM6P195CA0016.outlook.office365.com
 (2603:10a6:209:81::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Thu, 26 May 2022 15:28:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT017.mail.protection.outlook.com (10.152.16.89) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13 via Frontend Transport; Thu, 26 May 2022 15:28:35 +0000
Received: ("Tessian outbound 361d68419a2f:v119");
 Thu, 26 May 2022 15:28:35 +0000
Received: from 32ee17437866.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5F782911-7C36-4FF0-A278-13940F2BAD92.1; 
 Thu, 26 May 2022 15:28:29 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 32ee17437866.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 26 May 2022 15:28:29 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AM0PR08MB5204.eurprd08.prod.outlook.com (2603:10a6:208:161::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 26 May
 2022 15:28:27 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::1017:8b09:6681:c914]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::1017:8b09:6681:c914%5]) with mapi id 15.20.5293.013; Thu, 26 May 2022
 15:28:27 +0000
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
X-Inumbo-ID: 84801eff-dd08-11ec-837f-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=MRsFpK0KPCBQ9DnN8JnDthpTy76XxHOGqngO7IAt6DNxRaTjBmQYCFSSiT+GKJCQ3WkGQ/amiQeV2N1YKVbs8DBQQTuIVfp+mefJViFUjC5EjDKu6Kns5XM7FC6y6N2OfmTrLbxIh2Q2X+NVCmKUWTvJVLV9S3knosLHD3zMMuSFp6t+8E8GWHY9vuxinwy0TZj0opX3a7ygNtAqBhDFvOseY/a3StNF/eXJ6Kq1hUcAfqwk+rYewlzvqn/Oxd9lXfq3sZxlFrdPKvMiqDVim+l2s7saS/n4PYJT8WvagOH+Aif2a6K13c9UIQpwReKIllfK6RuhUKHW1h+pjZXGSA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/dZO9F/JpceSmK/6Dk5FDFn8mBgGPLxpqcatbNoNdHs=;
 b=FtD9idBfiPPwkLwsYLSBsVQJo6hO5aOhmSRxfo130KaJ88pwoHccLNDxxnFji2SFW54ig7apQnrdwdrEn5XxZ8FJcSyeo6OEMIo4/oKF4yDnbt/rHk56YY5mhx/Ddrpsz6xeqh9iHQ3jff7gg/ww8Qt3s/Naysez2NeN8jfsYrwN1M9yzpzFr5LAXeB0CNROfxg/VkYOe8UvlHTaoruJ0tnMrxaaKtGnuvyZlMc+75HDkc/qn39dF6LXvs+7d66dC9O5kYBizfEakUCrNj/t7bdWDchtXYP04L+Wfrkbq66VM1PqK7nqCDsf6A1e6jGQB+jnRiCQ6VzN874e7oysoA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/dZO9F/JpceSmK/6Dk5FDFn8mBgGPLxpqcatbNoNdHs=;
 b=Z7gt8dIm8DeOHiWm+a8/s+FzJICn1KFcfkgHSS42xBi7G1mmRbG4/3YK4wiO6to48AJfHCeoMZh+tf3w+iYhC6n8XPxVphQI2NWTpNyAdzVMyTPO+B8engny6TaBD2hn3UL8cJCeOIV9DVa+jMI6BYiOKuvrMR1D+YNdpYWZd0M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d9c1373760a22933
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XXQ6IbxqVie+hmKkxzmENGh+HU43SgAUbYKKLLVFpqKyCvC1f9VNMxAOzM7t2KRS2lGHCm7PaRNnPLZEyVlElDSEqTvpp0qsFI/onDFTbKoFA6vqyOWMT/Q1IkQmHznsyZ6Pm9REVc4F5wbRo9F1i5pc+t3cKF8a+P9cl2ykaID3HUG5Asz936ya1WoD4ogJ2XKS7zXiCu1AnPSeRswOElIxXajWYwvjcjMdN1P/Efu+DKX9GFfdIW16vVt2w6n48X8TI+U51OXudSDRoCG7o1ivuxR0cA4yKybsM+dDwQaQV4QLCAqBdm9qq2crC0N69vVsRi9XDMi18HIj7R0u+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/dZO9F/JpceSmK/6Dk5FDFn8mBgGPLxpqcatbNoNdHs=;
 b=FnVi8NfiAx8v+s2BPSuUzjEaJS1+L39DzozmjDo0OEq8DRAD+7o+9zfrqskTAMXVpH8spoxZCTmIGpMPIZh2aeqxEz8ntVd4IvXWL8oT2gWxXuLXpJtzkAv6O+YDk9ab70ePp7AXD3p8py5fbAzlc7EUN7B52epksFO/JTzPq56LLq2uGeyTqRut3MlW2LKBs+am7SK3FgoxOXlZAzWotYQ7nRMYPtCVI1KGJRMo/NarTlwdmyGhTkd4RhARHPizdylqElepGiptu+jz+/y/0siWFyOPVFRqkPjPR7EgR7pd/Q+/SvrzNWz7TI90hSLYFnF89oYXRa8NIemhWK6Daw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/dZO9F/JpceSmK/6Dk5FDFn8mBgGPLxpqcatbNoNdHs=;
 b=Z7gt8dIm8DeOHiWm+a8/s+FzJICn1KFcfkgHSS42xBi7G1mmRbG4/3YK4wiO6to48AJfHCeoMZh+tf3w+iYhC6n8XPxVphQI2NWTpNyAdzVMyTPO+B8engny6TaBD2hn3UL8cJCeOIV9DVa+jMI6BYiOKuvrMR1D+YNdpYWZd0M=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 03/16] xen/arm: mm: Avoid flushing the TLBs when mapping
 are inserted
Thread-Topic: [PATCH 03/16] xen/arm: mm: Avoid flushing the TLBs when mapping
 are inserted
Thread-Index: AQHYbEKl21ixnwqV4kWdLSxbd0iWW60xUfcA
Date: Thu, 26 May 2022 15:28:27 +0000
Message-ID: <AE77E678-DA52-4C6E-AB63-365DA5F8A82B@arm.com>
References: <20220520120937.28925-1-julien@xen.org>
 <20220520120937.28925-4-julien@xen.org>
In-Reply-To: <20220520120937.28925-4-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2b919042-3b78-41a4-ad8b-08da3f2c66ad
x-ms-traffictypediagnostic:
	AM0PR08MB5204:EE_|AM5EUR03FT017:EE_|VI1PR08MB3216:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB32166A5BCC946365526ADC7CE4D99@VI1PR08MB3216.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 g5EqyBDvSQiWKwrcvkCujLs7hnWzuiwvBkdr5GpODUmSyQMw8vF0YV4WU23uDp2YZ4CFedJAAlkg3IdodSDo7K82txjnTxU+MCEP6XkcKZK1Vqjo4iplVkYfSvfBiAQa+HrgJcQPIeTEFnlbrM51wRcC0JPZxJNAvAW/YY904cAzJsePHevz7G7oVzQmOVfGnaQzVNzFmbaouKL+dkGG9CXvxrIbEmKgnDEkt+ULFqwJ2sYt6yx4LsqnysmfsXFwHYpILHFf9ynpAaf7XRYEqINLj1N7AM4HWcjITiuxGoTNpFYpVRB+z2s1o4jAFZDdRnJaifS/O3pj7gRQ6Z+pRwtcXURcKfoje4jKi97NIPjjQIvJyiQfbr4ezrxn+WGpcmFhHfaV9NJ19OSCSunYTfDi75viuWkItyDloO0mewhoxOHHDHA5TsPHjvLUOWT70wGzP5mfhzMk6c2yaGxlgduberIbKn+Z4ZSGVl5gUaCjFbNdXHbPUpcv81wB38jRRoea9oK5qpg1wpNbx2af22n3epUzyFjTtwAMuDfrv483r0hdHG936PnKzcBWouG5168fSeZCD75oqFifIeiotGV68tUFYoWOlIuNM+UeKJiQxxy0KDOlLiiCp6eTlN8Vpod4AquVAdhmkqjE/xF8e9WTGKPf5+8/LkjADgtegn9M4Bknmb942bQHWIFVWI44CiPri9YpO0XyPjV8athWMs87i3majl7OJ+eF83ISsssgM4v+TlQNjHWfMb0wgUKB
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(186003)(6486002)(2906002)(33656002)(4744005)(26005)(6512007)(36756003)(66476007)(66446008)(66946007)(66556008)(76116006)(91956017)(4326008)(83380400001)(64756008)(54906003)(6916009)(38100700002)(38070700005)(86362001)(5660300002)(8676002)(2616005)(71200400001)(316002)(122000001)(53546011)(8936002)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE0EFB79EED71944919E111184510EC1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5204
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0660c5af-4b12-4247-239a-08da3f2c6183
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mLab9X2ki2DQxedaKODhAwdMeUBlnnOcnqIIP/y73QPAhD7cjmiL5YW17jOLiQIIVXQExugkB5wFiQzDM6srye2ArVYyv9BaIoJqxwQYyXttTewepO8ZsLdFdELiLcwGjFG3varBzygq8KZTURVewdOsIhyNXqPRfFbTq6jP67pyBKcvjYxN197kTpn88Pc/n2YxwG0r2bICIEW7YKd6xEve2tMdDJxnsVVdRPbe6TdlOgnjvp7B6L5GrvEdVAz3iEI4VK4FAdQqjNTa5kh/8lQwuNuDcvxLevGEO9HV6amg8JsM6SodgMEVJlY9PAOTEh6x1a0WhCIgnQ9UoDYwVaYlb7V36VP4GjcoHEYb4b4MxsTWiNy0Z4lQGDhleJIafuMyri7XkRgz9zzWm+2Pa9sYwhomD6SdQ74xzI3hwWcq7DYxeUVEJrQIXsC8tJQ/a1QndKtUQotkdhXhXdlDeqswPQrqKibgbdyN2cjmF9QZVucQbaSNegafxqpQeID9PlpQDl+EBoBhwinozCYc2cJCqJQmxr6FuMEjfzEq8BzprxRoT6hFvWYoc8L5aePRCAW8tWxLnEssg9fPcmIK8oTFHn5JW/56U+yAZrYbTjIMaiUXNhEeQb/Yg7KuOdpmavBx2DfCPuDGZC2UkAQOAAD/DiQCWZz3aPOduW8RtQSMmTOTaxX29s26iMZq6xA2
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(508600001)(83380400001)(356005)(33656002)(53546011)(2906002)(6486002)(107886003)(36860700001)(40460700003)(2616005)(54906003)(8936002)(316002)(4326008)(82310400005)(70586007)(70206006)(8676002)(6512007)(26005)(6862004)(86362001)(36756003)(47076005)(336012)(6506007)(186003)(5660300002)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 15:28:35.9490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b919042-3b78-41a4-ad8b-08da3f2c66ad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3216

DQoNCj4gT24gMjAgTWF5IDIwMjIsIGF0IDEzOjA5LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+
DQo+IA0KPiBDdXJyZW50bHksIHRoZSBmdW5jdGlvbiB4ZW5fcHRfdXBkYXRlKCkgd2lsbCBmbHVz
aCB0aGUgVExCcyBldmVuIHdoZW4NCj4gdGhlIG1hcHBpbmdzIGFyZSBpbnNlcnRlZC4gVGhpcyBp
cyBhIGJpdCB3YXN0ZWZ1bCBiZWNhdXNlIHdlIGRvbid0DQo+IGFsbG93IG1hcHBpbmcgcmVwbGFj
ZW1lbnQuIEV2ZW4gaWYgd2Ugd2VyZSwgdGhlIGZsdXNoIHdvdWxkIG5lZWQgdG8NCj4gaGFwcGVu
IGVhcmxpZXIgYmVjYXVzZSBtYXBwaW5nIHJlcGxhY2VtZW50IHNob3VsZCB1c2UgQnJlYWstQmVm
b3JlLU1ha2UNCj4gd2hlbiB1cGRhdGluZyB0aGUgZW50cnkuDQo+IA0KPiBBIHNpbmdsZSBjYWxs
IHRvIHhlbl9wdF91cGRhdGUoKSBjYW4gcGVyZm9ybSBhIHNpbmdsZSBhY3Rpb24uIElPVywgaXQN
Cj4gaXMgbm90IHBvc3NpYmxlIHRvLCBmb3IgaW5zdGFuY2UsIG1peCBpbnNlcnRpbmcgYW5kIHJl
bW92aW5nIG1hcHBpbmdzLg0KPiBUaGVyZWZvcmUsIHdlIGNhbiB1c2UgYGZsYWdzYCB0byBkZXRl
cm1pbmUgd2hhdCBhY3Rpb24gaXMgcGVyZm9ybWVkLg0KPiANCj4gVGhpcyBjaGFuZ2Ugd2lsbCBi
ZSBwYXJ0aWN1bGFybHkgaGVscCB0byBsaW1pdCB0aGUgaW1wYWN0IG9mIHN3aXRjaGluZw0KPiBi
b290IHRpbWUgbWFwcGluZyB0byB1c2UgeGVuX3B0X3VwZGF0ZSgpLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCg0KSGkgSnVsaWVuLA0KDQpJ
dCBsb29rcyBvayB0byBtZS4gSeKAmXZlIGFsc28gdGVzdGVkIGl0IHN0YXJ0aW5nLCBjb25zb2xl
LWluZywgZGVzdHJveWluZyBmZXcgZ3Vlc3RzDQphbmQgSeKAmXZlIGdvdCBubyBwcm9ibGVtDQoN
ClJldmlld2VkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQpUZXN0
ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCg0K

