Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF2A51B764
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 07:13:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321415.542410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmTnI-0003NW-Aw; Thu, 05 May 2022 05:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321415.542410; Thu, 05 May 2022 05:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmTnI-0003L9-7o; Thu, 05 May 2022 05:12:52 +0000
Received: by outflank-mailman (input) for mailman id 321415;
 Thu, 05 May 2022 05:12:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HxCF=VN=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nmTnG-0003Kh-PI
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 05:12:50 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01c5512a-cc32-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 07:12:49 +0200 (CEST)
Received: from DB6P18901CA0013.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::23)
 by AM5PR0801MB2051.eurprd08.prod.outlook.com (2603:10a6:203:4c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 5 May
 2022 05:12:35 +0000
Received: from DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::d) by DB6P18901CA0013.outlook.office365.com
 (2603:10a6:4:16::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13 via Frontend
 Transport; Thu, 5 May 2022 05:12:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT062.mail.protection.outlook.com (100.127.142.64) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Thu, 5 May 2022 05:12:35 +0000
Received: ("Tessian outbound 9613c00560a5:v118");
 Thu, 05 May 2022 05:12:35 +0000
Received: from e06e04e781c1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B410CB8C-FDBD-447D-9910-3D358550603A.1; 
 Thu, 05 May 2022 05:12:29 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e06e04e781c1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 05 May 2022 05:12:29 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AM0PR08MB3793.eurprd08.prod.outlook.com (2603:10a6:208:fc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 05:12:27 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9%3]) with mapi id 15.20.5206.024; Thu, 5 May 2022
 05:12:27 +0000
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
X-Inumbo-ID: 01c5512a-cc32-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AjhkM2a+UE4UJwkfIE/+yw3uaHcT2wDeI4teEJ6kdZs41XT++YJQMMprpUonoPwaueu2SHlyXYX475STeYJ2SK9w3gxtxC0Q3xRkwe+Ogt9m9LXygZ4SUTIBLMJ085NVI4I+1J/e8mg8IiVJS+GNrVPZoZ98r72jbbG3/jKVkgxkJlfkEkKOdUfIk8SiiY4tIxfw213muf+00VJXvwOnXrHNxzdTvD17vjMOVh83hNvV1LEYAFSG5/g8/3YjvMvT2BEiDeC1YDaVq8u7NgjK9fSbyF+UqWD/G94HbYKgQNwy4aU5uZ89cgyTZwHmPsazJ2sFitXfEEhrRIC65izF9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7rbIplsgsshtyg3MjoASS19Py1Ag1wvmhbDkdc8Cv8=;
 b=lI/SXP9ouS7P46cbCPt5sUxsCUfQke+q6/VcfMr10qxL2b4h0lyC+x32/3Iw7aPRem4p/oyJbjwJOfDL4WAKe0nRIlYm+/nZHl88yfmneOw6ea6dgkza+eiQwp4scXZfgRN9rYyWE/oF+R2m6q6xsaOyHLUOIL3POnoaCz/+FWlIqLoFYvhQFS8DDDZdgvdkPhaiDxh4epoCZ0cFhi2WGsjxOLStFyMfeWVDrk5Ip/26D7hn+AOpZwv86g2uf3We62OXjGv6IaaNPDt993cMqCQlTvda0wv93hYZDbCzzMXzSSJZ/jYVSLRDL0lPsh79zDYYrWbnSn7fv0XAMF1dpg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7rbIplsgsshtyg3MjoASS19Py1Ag1wvmhbDkdc8Cv8=;
 b=IynsbezpJrwoZG5KDDgtFS4ZEwpUduB6NUv/KFrca6WiiCP6nD4vDteIkfp9j9w/+p6GORdWsBpNc/T3j9LKqU1E6qdB/x80WdmTPwNxuHHOCns6owcdxSK7+sb2VEoLFfy8/bWAscHSQesb30412JgnuEKb7I2kosullMqYWgI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P5Dy1wAazm9PViZ4YRwnd2sp5gaZxxlN6KOs3sV6xpk5PD6sg4nSoowaneMdc+qjvfKprBrFG5mGF0BwE/LiqtPijKkBFAulgVORB0TIBJTccnA11CU5N556BCYeoq1PBdHtPcRF5uuTQ/MUgIEe51kWqZm4J2M0AtIL0ULpQ/Ep9YGr4AhF+XdiQbxCKg3+7RYFqG0iIJhenZmqSpiiN+IkVa5BH6VljbsDahA28bfEJKFjj5Z2Y/365/VZnbV+tewBZDO5KjNmUQUvTL0ERB+MD2BLLCylYOVkVE7zUuLjfw+859n9P4I+JyudhQ9tefr/x5nJ40SL5526Qaeclw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7rbIplsgsshtyg3MjoASS19Py1Ag1wvmhbDkdc8Cv8=;
 b=AEpyzYO1hst7HwZkrecmXAfGHToqXtOZp+tRE+ekcsyp8aVHEQu2I1yWQGZ/Upk0q0w4pFxj4cH6n0MViim+zFHhKwE6wkKtYOMMfSoe+ML4Xu9h2u/QM76AjuGVb/4Lz1vS04Qn2kXEIc5U+BKusSk4vLR3AeTU49oBrbvxUhrgOlfRltoyA9406ZkcKGy8SXB0zx7WOFGSxxrb1U9+uNsAeph9ienGctxnxwbPIaZPOoWZxWlT4vhbweZUvxSgmxXKZ6nKjAduB9Llzs1zpK4qSew7xDWLd9b4vtxyxk7/cCdGmxRWW1jDOnFvRyR6T9MHzvmWX+/iw2RbzCUYPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7rbIplsgsshtyg3MjoASS19Py1Ag1wvmhbDkdc8Cv8=;
 b=IynsbezpJrwoZG5KDDgtFS4ZEwpUduB6NUv/KFrca6WiiCP6nD4vDteIkfp9j9w/+p6GORdWsBpNc/T3j9LKqU1E6qdB/x80WdmTPwNxuHHOCns6owcdxSK7+sb2VEoLFfy8/bWAscHSQesb30412JgnuEKb7I2kosullMqYWgI=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 1/6] xen: do not free reserved memory into heap
Thread-Topic: [PATCH v3 1/6] xen: do not free reserved memory into heap
Thread-Index: AQHYWqxrPp+knbswwky8XjTDnza4CK0Ov/mAgADdzUA=
Date: Thu, 5 May 2022 05:12:26 +0000
Message-ID:
 <DU2PR08MB73257B9A5603EC772DFB124BF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220428030127.998670-1-Penny.Zheng@arm.com>
 <5de2f283-f6fc-95e7-808c-4f3d96b25926@suse.com>
In-Reply-To: <5de2f283-f6fc-95e7-808c-4f3d96b25926@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 55429DD6869B7047B38827212B5CCEC5.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4afe8e1d-b68d-41b0-5265-08da2e55ddc1
x-ms-traffictypediagnostic:
	AM0PR08MB3793:EE_|DBAEUR03FT062:EE_|AM5PR0801MB2051:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0801MB2051934BA1D9B1C18E1856EAF7C29@AM5PR0801MB2051.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 E6XSE9oyiEIfYDsB5D57UNnHASjdBurZoIU/V9KgegPOrN+b8Dwj6e5SwZgvq0BwyZ7hCrijgYufNTcBkRDyTvZbxZUDjb3oCEsecTwElxROCET9KA/7E7AeDJUTvX0+EA+RMa7tN9dsZF7ZILrSm1ELRJqNGllXE15XI/eV1Ty/FM3RuwPUWrnGL4kGOpLwJwsiy1JAJOIO2h+70l0C6p/9Ah/MxpLbuuha/El+uE+j6OqGaG37roNo/i1XQBWRiw0VGNXQ7fk1qWVBf08h7aEmpFpDdwYg8POnrCR6u7Kmh2X3SHl4RRbEyc7bFSae9q4vMaVwRSjGYRJgh/YBwY2PvLqeukXwXgsqa3fkzwID723+Yu0OR8WhkbW56xUqCliZg2dZs4LMk+n6ytKBK302I/LBgCvZPfOSup1SGdA77VANfY+1yGcXOo4ysRhc2yIs5WYQRKAY/0wh3cywgzvYhmPkrPpe0UUsExGAsd6BUdDb+dCVxUwND0EjI7pKJrqjC/nzCHNOboxC/2LiYdYJ/B6PPwMq0t79Ha4Jcm1HF8cMp6pKI5NxFn1G757matTj4aNCMWWERSdTEXHTfUXERPP/lP33lPwTlKFvhYYnrc33WaNcN4O2a5UJSuDwQ5QymGdmx7W0M49JRmgMneoP1BrvHv+8XATCk2ku587BJVvoS6fZ64fJ2J7rOtikpt9kyojVEknm7xNgJ7Ldnw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(186003)(66476007)(66556008)(66946007)(26005)(66446008)(64756008)(76116006)(53546011)(8676002)(71200400001)(9686003)(6506007)(86362001)(55016003)(7696005)(316002)(38070700005)(6916009)(122000001)(8936002)(52536014)(5660300002)(54906003)(38100700002)(508600001)(83380400001)(2906002)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3793
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6f6592be-8a19-4b3a-c303-08da2e55d8c2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	itkfIIzSi1a2A3ekiUuATVUDnHTYXFrDxPGSowQpgg94TgaxMcWKdE9FmWm3Wq48JR24JIcwjt9rM0YnoUx11wi4aPdcTdZFZFE4l0N76eXW3BlIeW77N6q/lYJSQYG3X78jbmct7cDDnchKGPBCYZb894GCNHfdAB7NkXdf4mCw8SHuk9lT+k96psGqVEH2T9kagkgmR37FqPiokADZE07mdQMCbmXHH8ZA2FcfrLBDrE9T7131bT8s//a6O4rG5Kz/FS2kEJUpxez1XksDXgdo5beYzDdZUSNpMkPVXmUMqtqxoVGwa6YK3oX+PeXW00XenGO90l+HQDy8c0vlJNXkO+4/oQGLmgkvPWDRmpFNhyM0FPLcSddW8sZx0WU7toCnvWL8kJL5NDnhdM9p06BQG+ZpVgt8HDT6FkqgKRWYpN1wxOW+Evr0vWFezg4f29ANXTYhkpq2wc+AB8zxP+eeKLtGWZKBp5qelUGLvXwrwwgu6EPJMaRs4Rx2qq1izBwxhGBOO+KQku0/GjKzJSp89WZ4DIYdkApPMWsXAMuhzHh3R8uPGNPDiznRBnaQA2sLal92IvkyoAL3ZcVwbPCuwvbRrG32Szk1pKjxikO6yycdDlFkHUdRP+YI8G0cOITkffokGfKFtJ255nXweDKxeLKXxEJYm4DFGbIJh86J/Fj2T+vFlYeqtlASgntR
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(508600001)(54906003)(5660300002)(8936002)(52536014)(316002)(26005)(9686003)(186003)(47076005)(336012)(83380400001)(86362001)(40460700003)(356005)(33656002)(55016003)(36860700001)(6506007)(70206006)(2906002)(4326008)(70586007)(8676002)(6862004)(7696005)(53546011)(81166007)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 05:12:35.3878
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4afe8e1d-b68d-41b0-5265-08da2e55ddc1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2051

SGkgamFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE1heSA0LCAyMDIyIDk6
MjcgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPg0KPiBDYzogV2Vp
IENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPjsgR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsN
Cj4gSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz47IFdlaQ0KPiBMaXUgPHdsQHhlbi5vcmc+OyB4ZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAxLzZdIHhlbjog
ZG8gbm90IGZyZWUgcmVzZXJ2ZWQgbWVtb3J5IGludG8gaGVhcA0KPiANCj4gT24gMjguMDQuMjAy
MiAwNTowMSwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gLS0tIGEveGVuL2NvbW1vbi9wYWdlX2Fs
bG9jLmMNCj4gPiArKysgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYw0KPiA+IEBAIC0xNDQzLDYg
KzE0NDMsMTAgQEAgc3RhdGljIHZvaWQgZnJlZV9oZWFwX3BhZ2VzKA0KPiA+DQo+ID4gICAgICBB
U1NFUlQob3JkZXIgPD0gTUFYX09SREVSKTsNCj4gPg0KPiA+ICsgICAgaWYgKCBwZy0+Y291bnRf
aW5mbyAmIFBHQ19yZXNlcnZlZCApDQo+ID4gKyAgICAgICAgLyogUmVzZXJ2ZWQgcGFnZSBzaGFs
bCBub3QgZ28gYmFjayB0byB0aGUgaGVhcC4gKi8NCj4gPiArICAgICAgICByZXR1cm4gZnJlZV9z
dGF0aWNtZW1fcGFnZXMocGcsIDFVTCA8PCBvcmRlciwgbmVlZF9zY3J1Yik7DQo+IA0KPiBXaXRo
IFBHQ19yZXNlcnZlZCBiZWluZyB6ZXJvLCB0aGUgY29tcGlsZXIgc2hvdWxkIENTRSB0aGlzIGNh
bGwuIEhlbmNlIC4uLg0KPiANCg0KSSBhc3N1bWUgdGhhdCB5b3Ugc3VnZ2VzdCB0aGF0IHdlIHJl
bW92ZSB0aGUgc3R1YiBmdW5jdGlvbiBhbmQganVzdCBsZXQNCmZyZWVfc3RhdGljbWVtX3BhZ2Vz
IG5vdCBndWFyZGVkIGJ5IENPTkZJR19TVEFUSUNfTUVNT1JZIGFueSBtb3JlPw0KIA0KSG1tbW0s
IG9uIHg4NiwgUEdDX3Jlc2VydmVkIHdpbGwgYmUgemVybyBhcyBub3QgZGVmaW5lZCwgYW5kIENT
RSB3aWxsIGxlYXZlDQpubyBjYWxsZXIgaGVyZS4gIGJ1dCBvbiBhcm0sIENTRSBjb3VsZCBub3Qg
Z3VhcmQgdGhpcz8NCiANCj4gPiBAQCAtMjc2Miw2ICsyNzY3LDEyIEBAIGludCBfX2luaXQgYWNx
dWlyZV9kb21zdGF0aWNfcGFnZXMoc3RydWN0DQo+ID4gZG9tYWluICpkLCBtZm5fdCBzbWZuLA0K
PiA+DQo+ID4gICAgICByZXR1cm4gMDsNCj4gPiAgfQ0KPiA+ICsjZWxzZQ0KPiA+ICt2b2lkIGZy
ZWVfc3RhdGljbWVtX3BhZ2VzKHN0cnVjdCBwYWdlX2luZm8gKnBnLCB1bnNpZ25lZCBsb25nIG5y
X21mbnMsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBuZWVkX3NjcnViKSB7
DQo+ID4gKyAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsNCj4gPiArfQ0KPiA+ICAjZW5kaWYNCj4g
DQo+IC4uLiBJIGRvbid0IHRoaW5rIHRoaXMgaXMgbmVlZGVkPw0KPiANCj4gSmFuDQoNCg==

