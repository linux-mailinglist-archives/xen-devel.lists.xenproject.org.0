Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E11CB5FD735
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 11:41:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421807.667445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiuhu-0007hI-EM; Thu, 13 Oct 2022 09:40:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421807.667445; Thu, 13 Oct 2022 09:40:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiuhu-0007f5-BE; Thu, 13 Oct 2022 09:40:50 +0000
Received: by outflank-mailman (input) for mailman id 421807;
 Thu, 13 Oct 2022 09:40:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j8+s=2O=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oiuht-0007ez-4Z
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 09:40:49 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2046.outbound.protection.outlook.com [40.107.247.46])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d284c8d-4adb-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 11:40:46 +0200 (CEST)
Received: from AS9PR06CA0314.eurprd06.prod.outlook.com (2603:10a6:20b:45b::16)
 by AS8PR08MB6021.eurprd08.prod.outlook.com (2603:10a6:20b:23c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 09:40:44 +0000
Received: from AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45b:cafe::67) by AS9PR06CA0314.outlook.office365.com
 (2603:10a6:20b:45b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.25 via Frontend
 Transport; Thu, 13 Oct 2022 09:40:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT020.mail.protection.outlook.com (100.127.140.196) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Thu, 13 Oct 2022 09:40:44 +0000
Received: ("Tessian outbound 7761be2ecf00:v128");
 Thu, 13 Oct 2022 09:40:44 +0000
Received: from fe62364efc7f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 23428810-055E-4829-8D4E-313DE47E03CA.1; 
 Thu, 13 Oct 2022 09:40:38 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fe62364efc7f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Oct 2022 09:40:38 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB6601.eurprd08.prod.outlook.com (2603:10a6:10:23e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 09:40:37 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%7]) with mapi id 15.20.5709.015; Thu, 13 Oct 2022
 09:40:37 +0000
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
X-Inumbo-ID: 1d284c8d-4adb-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ntOsT/G/hcZE5mywaIN84jOR4ncBZnv4mo8ByfV5U0E6K5ViDC2e+0oedFClz6uFL0LQnC/Zbt5SrVj25frVCT/Qu8oB7DMZ7wOoir0ED9Kp0aKBLB7A5TrToKLy3MoJJHviszEwtaQ9fr2v591ndLFG595/x2Z3BuwuYND9nBUqhiXr/uTpButPgmCyQDkRGWHkByfBEa1DaMCBw6KbZrZD6szC4AYyUU2ec7Y9sk2E73IQxbPLD0i63OE2iU2ci1bAjKBWwVobER2rV4sbC+BQjCX7JQE2gND+b+k/f/m762U7JtA1zvkOoepC08OKDuL6F2p6+EeXbOtS8ZYGLw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oC0meC2W1Kz8dB5+yrDcSqlJtevWH88cFRtHoxbjs1s=;
 b=fOTR5VgRa+at2noXeq4Fsx19eO/lBA/jjjYJaduf2X6OosbBD/nZSlRxg29XxqKPDTkkU4xNVZ30PPavhrOvhnlFhmsVQ+hOddn8GGJkoWhigc9+YgDhkc5KySfrPZt5Ry4Rklx1DqQnzTB5feDXdQ9IdIlUgxlvEGYJ9i+Xuj0sm0PJwB1kIny5aYsrLwdR6PKc/ON+XC7dxYU2cu/f/izR4jZOCEAU4VKuu78SDv11DZHc557FNBkYOgJulM4h4BDalqndWJyFvZ8FIFiEL4zxJp/hs+9nIOgbNS82i+cHklyZugUJMIpVFTSY97qe/q22Et0ViViOCg9/w4FPAw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oC0meC2W1Kz8dB5+yrDcSqlJtevWH88cFRtHoxbjs1s=;
 b=Y786WKfk//ZYsjKOk/nVR/3iI3gHycQ7Qd9CSDviA9J3HvaK1IsxaxTmhyjATBGFNh5EhBJsr78E0yTifhQ5Z7OdLHe1LlL6vp56hpqmnen7sLwwecyGX1cvnpC2oC7BcCtfev+PLlrBQjoEq24kNTqYCSG+gnoUuIUld/zYlGI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QVEIwOdxEoKIMz5KWhZHlL2jL6t3dGX0bWHrQjCuo9vwLwhSdHGiYW6NlbMdVc+5ma0e16Vsz24wND87gZ0rlKaSMgNJIz6JvCnix452qk8vSbyBgjQN1hT34n3T1Ne0RDMLbEYYQlMO2r0TSrCbEfeflh208lW+2/aFKGhnASwjvpVgYJzDF4/7qJsvBK9JfvihWSS+LVRIkozxSQB4FLZOQwexwtIc3d3MdIgkEoXaERKG5hnzPrghgqCCVmx/EoswThk41vxvSf6XhTcrX0oywyYttFQl3HVxuQAE8D5+Si3QlfWiOf1j20OR7Brn5/4fj2MxY7RpQG0SAsiXLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oC0meC2W1Kz8dB5+yrDcSqlJtevWH88cFRtHoxbjs1s=;
 b=LiPY6TMKmH3ewUL1CMVbS3NAtYqdGPtedrdR7l9YCdkD4uRYjZbNKKTgvz/LrfRaDz8wtvCvES9WMOeWIBKt74wSb3ctfDQqJiQ3ehspZBp+rh1zO8PUIwlPKUZRcKGx66SlYC7pgMJkCJ5WeRXkjTuUEK76UKSCTooyL5A75oMrudaUeZpQ8/d9A2bw63X7sLxYwwTYbYzFJ9xQulNo2yfki/lA1oTpZRHWz7X+7sCLf9pd3LS/ZO1G/zdDD09gulP+RX2wLAL4p+L508oYE5+j+lspxtldyqe+NfAmc5S36Uq9bSPQJI0VaDABTUSEzsk0bhuITJGJEXi0I2q69A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oC0meC2W1Kz8dB5+yrDcSqlJtevWH88cFRtHoxbjs1s=;
 b=Y786WKfk//ZYsjKOk/nVR/3iI3gHycQ7Qd9CSDviA9J3HvaK1IsxaxTmhyjATBGFNh5EhBJsr78E0yTifhQ5Z7OdLHe1LlL6vp56hpqmnen7sLwwecyGX1cvnpC2oC7BcCtfev+PLlrBQjoEq24kNTqYCSG+gnoUuIUld/zYlGI=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Topic: [PATCH] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Index: AQHY3t81xdeRddBbSEGLoF20gErPe64MD6gAgAAAmHA=
Date: Thu, 13 Oct 2022 09:40:36 +0000
Message-ID:
 <AS8PR08MB7991FF3E7EEA46F11ED4376092259@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221013083818.36209-1-Henry.Wang@arm.com>
 <6cf1c4a9-f339-217c-4557-b0a9ff37938a@citrix.com>
In-Reply-To: <6cf1c4a9-f339-217c-4557-b0a9ff37938a@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: FBFECC74CBEDCB479075D790D106DA26.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB6601:EE_|AM7EUR03FT020:EE_|AS8PR08MB6021:EE_
X-MS-Office365-Filtering-Correlation-Id: d0d44251-8f51-4517-4fb7-08daacff003f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lFKdhIPnzSxfb0ufh3A6EE1HeHCI2h3S7ZT9uYfptvZLa6o1LFW/8lCkIHQnzEIH2sD/Ao6y1UFF1nzzH3PNFsCPVJguzyOLYHzvDQVYOMzKl8GitWl8TNul0Wv5x1bP+4QJ9Ane4kje2L79LZRdy99iRytbzxJcUaCE9QxJG5LPGXWVqFEnHZs5/LaXdMAZWuDuATOokbVTrA0DPkZtGqXe87RrtMXyQhQYq0+rCwYY3b5iDNCxRnWMO7oc8jxlZNGpaw+zIvH08+8rI02QrdTFKzid7NZqvayRwnXAdtAPJLAXwlFloUcafTPzy78EuueeggWVerNSKOr4f6RtbrHUSu1eLHZ8yHwLuEyK4ZGon/wbVgiU3dc9hfZjApZgrArKIh7+22HsuUGgo5dIdxZrpG4dYBh6hPbqWyQae3ov0et7i44x9U5EBXv8QEm6+fNR95h3B1MJ1MH1qLG16JqebhHfXDMQ6HHshkQVetln45nuAjrtaRKgQXynIiM2PVqjSiMKXOWANAjJZa+LK94fDQUUm29Y0zpBqwwkRoyTN8x2XQbswi6ZWGws17/B0o17oueSbmj3cr1qgnlQKHcEFZ5Qm2JK9dkIlwjRyg/RbeBftMq5R4hv0aIqa0K6vhfmLjVMbPqirm/ZLG1mNiZRJ1z5uOsqo9L3Fu3yd6NRsDrD0HUA7ILXFyFYMwAyafoxrApmZp4SBVzu14YNUgiH3fTs42H2kNywmpjfmfNEmJaGQ8m4AMnqGDTJJip2U0K+UtRYiK+dXZIX9fSy3A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(366004)(346002)(376002)(396003)(451199015)(186003)(9686003)(26005)(53546011)(55016003)(2906002)(122000001)(52536014)(316002)(33656002)(110136005)(8936002)(54906003)(41300700001)(66556008)(66476007)(66446008)(66946007)(64756008)(8676002)(4326008)(76116006)(86362001)(38100700002)(7696005)(6506007)(478600001)(71200400001)(38070700005)(5660300002)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6601
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b35ea3a7-6255-4fde-d6b3-08daacfefb52
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+xiD91r8LdKPlkzYwolj9sf5uDmwtXMIW3B1VNfSzpuiNinV+PZq24pSyB0oWl7QSSqQxhpuPIaTXGZPkU8UxmpRT07kJ5IaeLDzm0L1GIGeCpeZe0xxipGysVrmObihd8xJvvcw17lWocud4RC9oYopR5Jani713i5vXvsa0YFUOpYmcB0qqFYZVkQxCketLTeYb3mhAhcBETMvFS3VniJM2FCkV6PEeuK8pouBB1tEDot8UaFf0tn3rdDncjFdnI/MgpBlW8YVYUH6wmo7s8Boxnt/c8S3ctal196mW+NVzJRxSJy7iA24Y9e+UHK4jCVOsCAqAU1D4gtYrTtxPCqKkAT1mkohS6VnI7d8oRrs5pLmzLgIZwjJZ/Lpe2/z521qI5+zAnR/TQpdvTn15vJhgxT513fWbjTqJFZxsd8hkVoHiPbCFoZCOr037qFdc7VUbVSsVJJtJFE4OAtDXpsKRnjorOHfJjJgeJW+qL/LJ9jhR6MDDtZymkk/MwrYjnJduR9WjMgJydzmIAy52Efz1GFJ4cFXryOlfYRPtJFHrS9YqQgk5OfqnhtcMAkLBx7xU4S7EiFksY8P22U5emFaBJ+10XVlx1Qk2rAmLBxA1kR771tDUhPMgFU6z8XKjw4lUkehRYNApdG7RCBvcmhj5xMKidxFtPHGpHZoFQ5bpjm8+QqzRtYrrLXmwdCZoNRCrOtdcj6d/PjGQ00J0Hc4bt/qI3jCwkQy+aijk/o39EbwD5EoHSKEg3TSK6WypuH+eUvIzlnqGu7r14E30w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(136003)(396003)(451199015)(40470700004)(36840700001)(46966006)(70206006)(70586007)(107886003)(4326008)(8676002)(186003)(336012)(2906002)(83380400001)(36860700001)(40460700003)(86362001)(47076005)(7696005)(26005)(41300700001)(53546011)(55016003)(6506007)(5660300002)(40480700001)(52536014)(9686003)(33656002)(8936002)(82310400005)(82740400003)(110136005)(81166007)(54906003)(356005)(316002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 09:40:44.6664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0d44251-8f51-4517-4fb7-08daacff003f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6021

SGkgQW5kcmV3LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFuZHJl
dyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0hdIHhlbi9hcm06IHAybTogUG9wdWxhdGUgcGFnZXMgZm9yIEdJQ3YyIG1hcHBpbmcgaW4NCj4g
YXJjaF9kb21haW5fY3JlYXRlKCkNCj4gDQo+IE9uIDEzLzEwLzIwMjIgMDk6MzgsIEhlbnJ5IFdh
bmcgd3JvdGU6DQo+ID4gSGFyZHdhcmUgdXNpbmcgR0lDdjIgbmVlZHMgdG8gY3JlYXRlIGEgUDJN
IG1hcHBpbmcgb2YgOEtCIEdJQ3YyIGFyZWENCj4gPiB3aGVuIHRoZSBkb21haW4gaXMgY3JlYXRl
ZC4gQ29uc2lkZXJpbmcgdGhlIHdvcnN0IGNhc2Ugb2YgcGFnZSB0YWJsZXMNCj4gPiBhbmQga2Vl
cCBhIGJ1ZmZlciwgcG9wdWxhdGUgMTYgcGFnZXMgYXMgdGhlIGRlZmF1bHQgdmFsdWUgdG8gdGhl
IFAyTQ0KPiA+IHBhZ2VzIHBvb2wgaW4gYXJjaF9kb21haW5fY3JlYXRlKCkgYXQgdGhlIGRvbWFp
biBjcmVhdGlvbiBzdGFnZSB0bw0KPiA+IHNhdGlzZnkgdGhlIEdJQ3YyIHJlcXVpcmVtZW50Lg0K
PiA+DQo+ID4gRml4ZXM6IGNiZWE1YTExNDljYSAoInhlbi9hcm06IEFsbG9jYXRlIGFuZCBmcmVl
IFAyTSBwYWdlcyBmcm9tIHRoZSBQMk0NCj4gcG9vbCIpDQo+ID4gU3VnZ2VzdGVkLWJ5OiBKdWxp
ZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEhlbnJ5IFdh
bmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4NCj4gPiAtLS0NCj4gPiBUaGlzIHNob3VsZCBhbHNvIGJl
IGJhY2twb3J0ZWQgdG8gNC4xMywgNC4xNCwgNC4xNSBhbmQgNC4xNi4NCj4gPiAtLS0NCj4gPiAg
eGVuL2FyY2gvYXJtL2RvbWFpbi5jIHwgMTQgKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDE0IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9h
cm0vZG9tYWluLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluLmMNCj4gPiBpbmRleCAyYzg0ZTZkYmJi
Li5lNDBlMmJjYmExIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW4uYw0KPiA+
ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW4uYw0KPiA+IEBAIC03NDAsNiArNzQwLDIwIEBAIGlu
dCBhcmNoX2RvbWFpbl9jcmVhdGUoc3RydWN0IGRvbWFpbiAqZCwNCj4gPiAgICAgICAgICBCVUco
KTsNCj4gPiAgICAgIH0NCj4gPg0KPiA+ICsgICAgc3Bpbl9sb2NrKCZkLT5hcmNoLnBhZ2luZy5s
b2NrKTsNCj4gPiArICAgIC8qDQo+ID4gKyAgICAgKiBIYXJkd2FyZSB1c2luZyBHSUN2MiBuZWVk
cyB0byBjcmVhdGUgYSBQMk0gbWFwcGluZyBvZiA4S0IgR0lDdjINCj4gYXJlYQ0KPiA+ICsgICAg
ICogd2hlbiB0aGUgZG9tYWluIGlzIGNyZWF0ZWQuIENvbnNpZGVyaW5nIHRoZSB3b3JzdCBjYXNl
IGZvciBwYWdlDQo+ID4gKyAgICAgKiB0YWJsZXMgYW5kIGtlZXAgYSBidWZmZXIsIHBvcHVsYXRl
IDE2IHBhZ2VzIHRvIHRoZSBQMk0gcGFnZXMgcG9vbA0KPiBoZXJlLg0KPiA+ICsgICAgICovDQo+
ID4gKyAgICBpZiAoIChyYyA9IHAybV9zZXRfYWxsb2NhdGlvbihkLCAxNiwgTlVMTCkpICE9IDAg
KQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIHAybV9zZXRfYWxsb2NhdGlvbihkLCAwLCBOVUxM
KTsNCj4gPiArICAgICAgICBzcGluX3VubG9jaygmZC0+YXJjaC5wYWdpbmcubG9jayk7DQo+ID4g
KyAgICAgICAgZ290byBmYWlsOw0KPiA+ICsgICAgfQ0KPiA+ICsgICAgc3Bpbl91bmxvY2soJmQt
PmFyY2gucGFnaW5nLmxvY2spOw0KPiANCj4gR2VuZXJhbGx5LCB0aGlzIHdvdWxkIGJlIGJldHRl
ciB3cml0dGVuIGFzDQo+IA0KPiBzcGluX2xvY2soKTsNCj4gaWYgKCByYyA9IHAybV9zZXRfYWxs
b2NhdGlvbigxNikgKQ0KPiDCoMKgwqAgcDJtX3NldF9hbGxvY2F0aW9uKDApDQo+IHNwaW5fdW5s
b2NrKCk7DQo+IA0KPiBpZiAoIHJjICkNCj4gwqDCoMKgIGdvdG8gZmFpbDsNCj4gDQo+IHRvIHJl
ZHVjZSB0aGUgbnVtYmVyIG9mIHNwaW5fdW5sb2NrKCkgY2FsbHMgYW5kIG1ha2UgdGhlIGVycm9y
IHBhdGhzDQo+IG1vcmUgY2xlYXIuwqAgSG93ZXZlci4uLg0KDQpJIHRoaW5rIGluIEFybSdzIGFy
Y2hfZG9tYWluX2NyZWF0ZSgpLCBhbGwgdGhlIGVycm9yIGhhbmRsaW5nIGFyZSB0aGUNCnNhbWUg
c3R5bGUgdXNpbmc6DQoNCmlmICggKHJjID0gPGZ1bmN0aW9uPikgIT0wICkNCiAgICBnb3RvIGZh
aWw7DQoNCmFuZCB3ZSBuZWVkIHRvIGtlZXAgdGhlbSB0aGUgc2FtZT8gQnV0IEkgdGhpbmsgSSB3
aWxsIGRyb3AgdGhlDQpwMm1fc2V0X2FsbG9jYXRpb24oZCwgMCwgTlVMTCk7IGFzIHRoZSBhcmNo
X2RvbWFpbl9kZXN0cm95KGQpIGluDQoNCmZhaWw6DQogICAgZC0+aXNfZHlpbmcgPSBET01EWUlO
R19kZWFkOw0KICAgIGFyY2hfZG9tYWluX2Rlc3Ryb3koZCk7DQoNCndpbGwgY2xlYW4tdXAgdGhl
IHBvb2wuDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+ID4gKw0KPiA+ICAgICAgaWYg
KCAocmMgPSBkb21haW5fdmdpY19yZWdpc3RlcihkLCAmY291bnQpKSAhPSAwICkNCj4gPiAgICAg
ICAgICBnb3RvIGZhaWw7DQo+ID4NCj4gDQo+IC4uLiB5b3UndmUgZ290IGEgcHJvYmxlbSBvbiB0
aGlzIGVycm9yIHBhdGgsIHNvIHRoZSBzZXQgYWxsb2NhdGlvbiB0byAwDQo+IG5lZWRzIHRvIGJl
IGluIHRoZSBmYWlsOiBwYXRoIHdpdGggc3VpdGFibGUgbG9ja2luZy4NCj4gDQo+IFRoZXJlIGFy
ZSBwZXJoYXBzIGJldHRlciB3YXlzIG9mIGRvaW5nIGl0IGluIDQuMTUoPykgYW5kIGxhdGVyLCBi
dXQgbm90DQo+IGluIGVhcmxpZXIgdmVyc2lvbnMuwqAgQXMgdGhpcyBpcyBhIGZpeCB0byBhIGJ1
ZyBpbiBhIHNlY3VyaXR5IHBhdGNoLA0KPiBzaW1wbGljaXR5IGlzIGdlbmVyYWxseSB0aGUgYmV0
dGVyIGFwcHJvYWNoLg0KPiANCj4gfkFuZHJldw0K

