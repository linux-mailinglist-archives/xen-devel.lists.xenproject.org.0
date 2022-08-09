Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9799E58DB82
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 18:00:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383062.618167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLReR-00059K-Oy; Tue, 09 Aug 2022 16:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383062.618167; Tue, 09 Aug 2022 16:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLReR-00057J-Ld; Tue, 09 Aug 2022 16:00:15 +0000
Received: by outflank-mailman (input) for mailman id 383062;
 Tue, 09 Aug 2022 16:00:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rEZx=YN=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oLReQ-00057D-7l
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 16:00:14 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2083.outbound.protection.outlook.com [40.107.21.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a1c38ae-17fc-11ed-924f-1f966e50362f;
 Tue, 09 Aug 2022 18:00:13 +0200 (CEST)
Received: from AS9PR06CA0607.eurprd06.prod.outlook.com (2603:10a6:20b:46e::10)
 by DB9PR08MB6393.eurprd08.prod.outlook.com (2603:10a6:10:25a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Tue, 9 Aug
 2022 16:00:10 +0000
Received: from AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46e:cafe::34) by AS9PR06CA0607.outlook.office365.com
 (2603:10a6:20b:46e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15 via Frontend
 Transport; Tue, 9 Aug 2022 16:00:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT054.mail.protection.outlook.com (10.152.16.212) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.16 via Frontend Transport; Tue, 9 Aug 2022 16:00:10 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Tue, 09 Aug 2022 16:00:09 +0000
Received: from ebe538af5c51.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4D768DF2-9185-4DD2-9420-2933445F562B.1; 
 Tue, 09 Aug 2022 16:00:03 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ebe538af5c51.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 09 Aug 2022 16:00:03 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by GV1PR08MB7379.eurprd08.prod.outlook.com (2603:10a6:150:23::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 16:00:01 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 16:00:01 +0000
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
X-Inumbo-ID: 5a1c38ae-17fc-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=a1J1KAJ8N392GvQRdBtGJ4ye4iBm6Y+yjopbsYk/SQEGDnkhlf9EeSPQ89Z0xU5pWJDCEGgR3HY0aUqn9Ybq6oXcGW6Dvsz7+KXB+S2pAINuEHr//fNU5PNuYcRDVYw82dV85NWCzXDUBX7xR2gAl3aXSHcDlUz0I/DLEhInL2AGuRzCfzzVQNGQdssFVutz0t/C5rhO+UjRDyVgiNRSvEY1vzhP52/tCwnxwaEhh2X+6TwkX2v14MjdSx6G3HijLxLN0Dw2bSrBz/ZnEYqJMCamTz5WxsuLm5G9/Va/jFXzKru++80TOsg5U9jhz5C/z43HRQndQ7okSAhOxbEZmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KpjXxok5CH/DHk54ul3iEJBpe4C3OhxMRY1cptw8V8=;
 b=Zz+F5NQ5C5ijteYC90qhyWPrqw9YhhxPkZd4vycTrYiVYdfZV/rxiFPiK6MSK5/cE/TSlOFznf/3H7+FINfJWHslNYpeRgGJek4u4uDlNwPagt6BXM/wTZrFaSntkI293laRYuvjB4I+dgKIog8Glgy2kBMmq1m5JRvBi6u45Xv993WHP94R1UE/2nB/wkWIK/bghSv1njScj2BgKKiVynOJTlSOv7yT/VR0SbVhNqJWZqYJ5sZa0YG1Hu0brZ3/Z1XFHOn1bwmEpKcu/hG7RpGvhRSsC6UQsyLi9MzlCcwnH9pNI9t5J0GhJGhJkRJb8fFttbefwKeadgvQEotsXQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KpjXxok5CH/DHk54ul3iEJBpe4C3OhxMRY1cptw8V8=;
 b=wehMtJn1aIrAQ8V77DUjsvFDuABEEm8mtBHJPYxOjXpc8rydG2klAwv/i485P+fSJT5hhRqb+1InzMFVBZ6+CKiXE535e/dgUN2H5/OWThdSLB3qN0BswB37hHDp48UiA6luqmJJYauPrKahraOaOqOw4cZbb2wqliIxtaHp8wA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 692b4e29555827fe
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BuNLPP2HXPRyZ6SbGLvW30FjUapSfSdfs5vw/qRuMTcji32RjBwHuWf2wiuBOmYrUN43fkPdlfdUz7zQAuBTCGMm6XnYl0YjijEV3btMZ/1bFPafpuhLz84yPcpYOya3vOyzpZQSjJu4OMwRyeh2BBCKuxzFaYduPYweYg8keysoOBBg8cisQ8e2ksKMLzSVL55KQP0CcpUH7YQSzIiUSUjr7Zmk+9RFAxJvUyT28MQ0m1jBlzkeXsvm9FW+zr5jxodKYEARGq7cx/HBy/RbEG+cNSjNBqL1uyPRZGMz5WuTOaoTlrdX5xrkWDZYXfuxXPXFCH+6fx7d978ke1aV0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KpjXxok5CH/DHk54ul3iEJBpe4C3OhxMRY1cptw8V8=;
 b=mjHiCuR/U2imriXVd8Rfte4znWQ7yo7/vaaoMkkMuO6eI9cSb9JNvN1GMHUFgb4mAM/DbSMmVnKqUEznBtvzGewU43iPyPiKZQba20mEctqh3gddHd549iW3BSQ/09pMJCri59oLyY/cDlQduR+Dd3DlfNMIK0eVPFD+rWH0gaagvmhIYxUPbmbjTk1B3n9xsG5d4T07fZLrSo0H6suzQoYFM9UgYlZs36MQFQSx2BD2/2/3FeBDsRRcKq+EODrFrqOn/yjfJtxmxibZ4CsMNlPd0GvAe7uo3QCZz1tkfqby0RTTaLiz48k1Kku0XGTqmuyMORKfo/Q6LkSyLTwA0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KpjXxok5CH/DHk54ul3iEJBpe4C3OhxMRY1cptw8V8=;
 b=wehMtJn1aIrAQ8V77DUjsvFDuABEEm8mtBHJPYxOjXpc8rydG2klAwv/i485P+fSJT5hhRqb+1InzMFVBZ6+CKiXE535e/dgUN2H5/OWThdSLB3qN0BswB37hHDp48UiA6luqmJJYauPrKahraOaOqOw4cZbb2wqliIxtaHp8wA=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Paul Durrant <paul@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] [RFC] xen/vpci: modify pci_get_pdev_by_domain() &
 pci_get_pdev()
Thread-Topic: [PATCH] [RFC] xen/vpci: modify pci_get_pdev_by_domain() &
 pci_get_pdev()
Thread-Index: AQHYqOI28IdG0PHJfUiTCQKz3s6xa62mXF0AgABVF4CAAAHhAIAADQ4A
Date: Tue, 9 Aug 2022 16:00:01 +0000
Message-ID: <1C1C3167-C8D8-42D7-BCD3-C130D9CA0525@arm.com>
References:
 <5650ddce1de4fd5471823bde44a12a03f157bc11.1659713913.git.rahul.singh@arm.com>
 <dd0ad0a4-6a01-7e35-51dc-614477bb9556@suse.com>
 <9F5E81CD-858B-44CA-8BE3-B518111E2E85@arm.com>
 <bd7d16b4-f11b-48ee-07d9-0f2e3d533964@suse.com>
In-Reply-To: <bd7d16b4-f11b-48ee-07d9-0f2e3d533964@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 01327b14-c517-4cbf-03dd-08da7a203cb4
x-ms-traffictypediagnostic:
	GV1PR08MB7379:EE_|AM5EUR03FT054:EE_|DB9PR08MB6393:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Y1gSh/SB9NuIHKy2ASQdba6iqBRed5uEKPVbI3WwzzX76AjhOMlfKWjussVbCpNaWvSyKABSMphjSm8zYuYZ/kRPBDGUHx0DWkBy43JPgKKD5PgErKuTEApXWeotRCpwR5sgXGQHB2YT+ggVnNF2pzl0MHfNAJ8aCkkXUQN0+QdepQCLjxy2FUFTmpLrSOk2XE6syh+qusQWG+3s7W0XnEDZ5nDAVgTmKolqO0eAu0PDO0Z0XTFNaZmaXPyb65gvq2EuQbPQoq8nTz1UnDtye7XCrFZzzF5FswOSQXAdwCsjQh5RcxcnkwZ4GWJUij0kpmyvKxqjw2ZoJEHiwULTik/kSqr3+tBHSzJe1L4tl73oXRcfyl93HDaja8/rBCd+0ZXs35CxJCsA4Z1MdQFSDEfxxieZuCfPuCJJ17SE7AjT8c7F96+z/vsSrngTB4zr15rEEHgwhsGH4NdYD6MBCpxGgE57vMdbGNa8vOL9sVNbVwDQge8CqJeZJHlxtJTKF4+w4YY8OXpAHznBvgu2gsXGYln2Vy4d5qg8Cid0wJ71QMpf4LbP28+eh/WCh67kn2deYzhBuH94PrGlVW2XrvCHNoJPYaC4ivaea9+0VEk6Oe9GZxqwgPBRsl9rdde3XxVygHLnf+cPbicLkk1glzJPAilZ+pkSF1v/LyLIly5/ER2RBQboffVKafWWNbMLojgYX+QkwhtHMUdllwelxf6rwV6nYS5D0+xSL6dRbayuc9e8QEQxBNhXBPr36mI753E1EnrHR15O3+MnVDskfppi7klW0VCBoUzrsiNIDNq0cg71OSkjvK+VtO08YMVHQVP8AnEj79sUnPt8d1Fo4Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(5660300002)(33656002)(2906002)(66946007)(76116006)(36756003)(316002)(71200400001)(478600001)(54906003)(8936002)(6486002)(53546011)(6916009)(38100700002)(38070700005)(2616005)(41300700001)(26005)(6506007)(122000001)(86362001)(4326008)(66446008)(64756008)(66556008)(6512007)(66476007)(8676002)(91956017)(186003)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <503498BA77C4AF4FAC5908465EF10B31@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7379
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	aa6be657-5837-4935-1421-08da7a203774
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A1UlMaAbGRw0GUpmPWwl+jBkjrVArflPLE7XwvjydtCw8GajfcsfupHgJpSXb9L5jZpuBsYAvmzVGIeVJ6j7Ez3B2yXLSM3j0VLK3ljb8Rxq7fZhvytFp7lbKwEUr+10Wj3wa2kpstv4IPtY5RCcYPo5xfoMwn2gupUW+Z2Le5uWYoWY0Iyrv58Hbi+g95i8teLdP0+wcuuklmjnlCCZ6ySkFghFm7HS57TSq6ydslgrGdmBBvYa+nYqwKRUmM09hjz6u3DUGhwkjOmUKIucv4iNX+Tj9AMozmFEMFmC1aWwEUh6jhjw07wONL/KZ6NumGexHbI+yI1Ja3b+QeC4QeV7gie2ra2PemhQn/uhc4j/YeGyDdc85qKhnQxvQnYqXsqt16ljl0mtN6j8EZVRVC/cFdTQ7Liw0FbIuMZQwQ07D7d0M6Y3nVM5oRkmfeV64Qv+TDqSlCmxnXNHuTH1dIcWpVhYVHw7wR1fKEgRXI9V3/UiqNoK3nmQHFv4yBEmkgbTHNV4ssuJuSX3SaBzpDVJG5upOaId2bKlaxKzAG0A3cfAocgoyAaX3zL5r1GS6fTeC+BAHE//JBZLndlVh6lyvz+Dj7cD567Hh4wPOcPF5pOjlojvOmXyQaq+9CKFqvkBRl6IsUSqux4i9dRtOXLOVFRmOiORYMlxiAjo8tqRkCqFBut3hnL9+fPcEWyZltHaMq+BcYef8B+BCNNWjsON7NIdNh6apvBM+qkn9AXgIGKE9/jNjquOaxpJLHHikXrvFDokACoOcWHsLupve8e6FNpSP0PGgB35IO12AqdM6PhgiScCu/XLPcAQNeSa
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(396003)(376002)(346002)(46966006)(36840700001)(40470700004)(6862004)(83380400001)(2616005)(8676002)(82310400005)(8936002)(70586007)(4326008)(70206006)(40460700003)(6486002)(186003)(47076005)(316002)(36860700001)(86362001)(54906003)(36756003)(478600001)(5660300002)(82740400003)(336012)(40480700001)(41300700001)(33656002)(6512007)(356005)(26005)(53546011)(81166007)(6506007)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 16:00:10.1537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01327b14-c517-4cbf-03dd-08da7a203cb4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6393

SGkgSmFuLA0KDQo+IE9uIDkgQXVnIDIwMjIsIGF0IDQ6MTMgcG0sIEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwOS4wOC4yMDIyIDE3OjA2LCBSYWh1bCBT
aW5naCB3cm90ZToNCj4+PiBPbiA5IEF1ZyAyMDIyLCBhdCAxMTowMiBhbSwgSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+PiBPbiAwNS4wOC4yMDIyIDE3OjQzLCBSYWh1
bCBTaW5naCB3cm90ZToNCj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMN
Cj4+Pj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+Pj4gQEAgLTU5Mywx
MyArNTkzLDEwIEBAIHN0cnVjdCBwY2lfZGV2ICpwY2lfZ2V0X3BkZXYoaW50IHNlZywgaW50IGJ1
cywgaW50IGRldmZuKQ0KPj4+PiAgICAgICAgICAgIHJldHVybiBOVUxMOw0KPj4+PiAgICB9DQo+
Pj4+IA0KPj4+PiAtICAgIGRvIHsNCj4+Pj4gLSAgICAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeSAo
IHBkZXYsICZwc2VnLT5hbGxkZXZzX2xpc3QsIGFsbGRldnNfbGlzdCApDQo+Pj4+IC0gICAgICAg
ICAgICBpZiAoIChwZGV2LT5idXMgPT0gYnVzIHx8IGJ1cyA9PSAtMSkgJiYNCj4+Pj4gLSAgICAg
ICAgICAgICAgICAgKHBkZXYtPmRldmZuID09IGRldmZuIHx8IGRldmZuID09IC0xKSApDQo+Pj4+
IC0gICAgICAgICAgICAgICAgcmV0dXJuIHBkZXY7DQo+Pj4+IC0gICAgfSB3aGlsZSAoIHJhZGl4
X3RyZWVfZ2FuZ19sb29rdXAoJnBjaV9zZWdtZW50cywgKHZvaWQgKiopJnBzZWcsDQo+Pj4+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHNlZy0+bnIgKyAxLCAxKSApOw0K
Pj4+PiArICAgIGxpc3RfZm9yX2VhY2hfZW50cnkgKCBwZGV2LCAmcHNlZy0+YWxsZGV2c19saXN0
LCBhbGxkZXZzX2xpc3QgKQ0KPj4+PiArICAgICAgICBpZiAoIChwZGV2LT5idXMgPT0gYnVzIHx8
IGJ1cyA9PSAtMSkgJiYNCj4+Pj4gKyAgICAgICAgICAgICAocGRldi0+ZGV2Zm4gPT0gZGV2Zm4g
fHwgZGV2Zm4gPT0gLTEpICkNCj4+Pj4gKyAgICAgICAgICAgIHJldHVybiBwZGV2Ow0KPj4+PiAN
Cj4+Pj4gICAgcmV0dXJuIE5VTEw7DQo+Pj4+IH0NCj4+Pj4gQEAgLTY0MiwxNCArNjM5LDExIEBA
IHN0cnVjdCBwY2lfZGV2ICpwY2lfZ2V0X3BkZXZfYnlfZG9tYWluKGNvbnN0IHN0cnVjdCBkb21h
aW4gKmQsIGludCBzZWcsDQo+Pj4+ICAgICAgICAgICAgcmV0dXJuIE5VTEw7DQo+Pj4+ICAgIH0N
Cj4+Pj4gDQo+Pj4+IC0gICAgZG8gew0KPj4+PiAtICAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5
ICggcGRldiwgJnBzZWctPmFsbGRldnNfbGlzdCwgYWxsZGV2c19saXN0ICkNCj4+Pj4gLSAgICAg
ICAgICAgIGlmICggKHBkZXYtPmJ1cyA9PSBidXMgfHwgYnVzID09IC0xKSAmJg0KPj4+PiAtICAg
ICAgICAgICAgICAgICAocGRldi0+ZGV2Zm4gPT0gZGV2Zm4gfHwgZGV2Zm4gPT0gLTEpICYmDQo+
Pj4+IC0gICAgICAgICAgICAgICAgIChwZGV2LT5kb21haW4gPT0gZCkgKQ0KPj4+PiAtICAgICAg
ICAgICAgICAgIHJldHVybiBwZGV2Ow0KPj4+PiAtICAgIH0gd2hpbGUgKCByYWRpeF90cmVlX2dh
bmdfbG9va3VwKCZwY2lfc2VnbWVudHMsICh2b2lkICoqKSZwc2VnLA0KPj4+PiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBzZWctPm5yICsgMSwgMSkgKTsNCj4+Pj4gKyAg
ICBsaXN0X2Zvcl9lYWNoX2VudHJ5ICggcGRldiwgJnBzZWctPmFsbGRldnNfbGlzdCwgYWxsZGV2
c19saXN0ICkNCj4+Pj4gKyAgICAgICAgaWYgKCAocGRldi0+YnVzID09IGJ1cyB8fCBidXMgPT0g
LTEpICYmDQo+Pj4+ICsgICAgICAgICAgICAgKHBkZXYtPmRldmZuID09IGRldmZuIHx8IGRldmZu
ID09IC0xKSAmJg0KPj4+PiArICAgICAgICAgICAgIChwZGV2LT5kb21haW4gPT0gZCkgKQ0KPj4+
PiArICAgICAgICAgICAgcmV0dXJuIHBkZXY7DQo+Pj4+IA0KPj4+PiAgICByZXR1cm4gTlVMTDsN
Cj4+Pj4gfQ0KPj4+IA0KPj4+IEluZGVlZCBwcmVzZW50IGJlaGF2aW9yIGlzIHdyb25nIC0gdGhh
bmtzIGZvciBzcG90dGluZy4gSG93ZXZlciBpbg0KPj4+IGJvdGggY2FzZXMgeW91J3JlIG1vdmlu
ZyB1cyBmcm9tIG9uZSB3cm9uZ25lc3MgdG8gYW5vdGhlcjogVGhlDQo+Pj4gbG9va3VwIG9mIGZ1
cnRoZXIgc2VnbWVudHMgX2lzXyBuZWNlc3Nhcnkgd2hlbiB0aGUgaW5jb21pbmcgInNlZyINCj4+
PiBpcyAtMSAoYW5kIGFwcGFyZW50bHkgd2hlbiB0aGlzIGxvZ2ljIHdhcyBpbnRyb2R1Y2VkIHRo
YXQgd2FzIHRoZQ0KPj4+IG9ubHkgY2FzZSBjb25zaWRlcmVkKS4NCj4+IA0KPj4gSWYgSSB1bmRl
cnN0YW5kIGNvcnJlY3RseSB0aGVuIGZpeGVkIGNvZGUgc2hvdWxkIGJlIGxpa2UgdGhpczogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQo+PiANCj4+IOKAlHNuaXDigJQg
DQo+PiDigKYuICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgDQo+PiAgICBpZiAoICFwc2VnICkgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQo+PiAgICB7ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgDQo+PiAgICAgICAgaWYgKCBzZWcgPT0gLTEgKSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQo+PiAgICAgICAgICAg
IHJhZGl4X3RyZWVfZ2FuZ19sb29rdXAoJnBjaV9zZWdtZW50cywgKHZvaWQgKiopJnBzZWcsIDAs
IDEpOyAgICAgICAgDQo+PiAgICAgICAgaWYgKCAhcHNlZyApICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQo+PiAgICAgICAgICAgIHJl
dHVybiBOVUxMOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgDQo+PiANCj4+ICAgICAgICBkbyB7ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4+ICAgICAgICBsaXN0
X2Zvcl9lYWNoX2VudHJ5ICggcGRldiwgJnBzZWctPmFsbGRldnNfbGlzdCwgYWxsZGV2c19saXN0
ICkgICAgICAgICANCj4+ICAgICAgICAgICAgaWYgKCAocGRldi0+YnVzID09IGJ1cyB8fCBidXMg
PT0gLTEpICYmICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4+ICAgICAgICAgICAgICAg
ICAocGRldi0+ZGV2Zm4gPT0gZGV2Zm4gfHwgZGV2Zm4gPT0gLTEpICkgICAgICAgICAgICAgICAg
ICAgICAgICANCj4+ICAgICAgICAgICAgICAgIHJldHVybiBwZGV2OyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4+ICAgICAgICB9IHdoaWxlICgg
cmFkaXhfdHJlZV9nYW5nX2xvb2t1cCgmcGNpX3NlZ21lbnRzLCAodm9pZCAqKikmcHNlZywgICAg
ICAgICANCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBzZWctPm5yICsg
MSwgMSkgKTsgICAgICAgICAgICAgICAgICAgICAgICANCj4+ICAgICAgICByZXR1cm4gTlVMTDsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICANCj4+ICAgIH0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4+IA0KPj4gICAgbGlzdF9mb3JfZWFjaF9l
bnRyeSAoIHBkZXYsICZwc2VnLT5hbGxkZXZzX2xpc3QsIGFsbGRldnNfbGlzdCApICAgICAgICAg
ICAgIA0KPj4gICAgICAgIGlmICggKHBkZXYtPmJ1cyA9PSBidXMgfHwgYnVzID09IC0xKSAmJiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KPj4gICAgICAgICAgICAgKHBkZXYtPmRl
dmZuID09IGRldmZuIHx8IGRldmZuID09IC0xKSApICAgICAgICAgICAgICAgICAgICAgICAgICAg
IA0KPj4gICAgICAgICAgICByZXR1cm4gcGRldjsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KPj4gDQo+PiAgICByZXR1cm4gTlVMTDsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgDQo+PiB9ICANCj4gDQo+IFRoYXQgd291bGQgYWJvdXQgZG91YmxlIHRoZSBjb2RlIGluIHRo
ZSBmdW5jdGlvbnMuIEltbyBhbGwgaXQgdGFrZXMNCj4gaXMgdG8gYWx0ZXIgdGhlIHdoaWxlKCkg
Y29uZGl0aW9ucywgcHJlZml4aW5nIHdoYXQgaXMgdGhlcmUgd2l0aA0KPiAic2VnID09IC0xICYm
Ii4NCg0KSSBhZ3JlZSB3aXRoIHlvdSB0aGlzIHdpbGwgYXZvaWQgZHVwbGljYXRpb24gb2YgdGhl
IGNvZGUuDQoNCj4gDQo+IEFjdHVhbGx5IHdoaWxlIGxvb2tpbmcgdGhlcmUgSSd2ZSBub3RpY2Vk
IHRoZSBnZXRfcHNlZygpIHVzZXMgaW4NCj4gYm90aCBmdW5jdGlvbnMgYXJlbid0IHF1aXRlIHJp
Z2h0IGZvciB0aGUgInNlZyA9PSAtMSIgY2FzZSBlaXRoZXIuDQo+IEknbGwgbWFrZSBhIHBhdGNo
IHRoZXJlLCB3aGljaCBJIHRoaW5rIHNob3VsZG4ndCBjb2xsaWRlIHdpdGggeW91cnMuDQoNCk9r
LiBJIHdpbGwgdGVzdCB0aGUgcGF0Y2ggb25jZSB5b3Ugc2VudCBpdC4uDQoNClJlZ2FyZHMsDQpS
YWh1bA0KDQo=

