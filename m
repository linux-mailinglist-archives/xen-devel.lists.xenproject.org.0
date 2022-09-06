Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEDB5AE0F3
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 09:24:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399509.640703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVSwV-000457-BC; Tue, 06 Sep 2022 07:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399509.640703; Tue, 06 Sep 2022 07:24:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVSwV-000420-7e; Tue, 06 Sep 2022 07:24:19 +0000
Received: by outflank-mailman (input) for mailman id 399509;
 Tue, 06 Sep 2022 07:24:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nuBZ=ZJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oVSwT-0003TN-T0
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 07:24:18 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2067.outbound.protection.outlook.com [40.107.22.67])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea954b80-2db4-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 09:24:17 +0200 (CEST)
Received: from AS9PR07CA0028.eurprd07.prod.outlook.com (2603:10a6:20b:46c::30)
 by DB9PR08MB6570.eurprd08.prod.outlook.com (2603:10a6:10:251::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Tue, 6 Sep
 2022 07:24:14 +0000
Received: from AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46c:cafe::2b) by AS9PR07CA0028.outlook.office365.com
 (2603:10a6:20b:46c::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Tue, 6 Sep 2022 07:24:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT028.mail.protection.outlook.com (100.127.140.192) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 07:24:14 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Tue, 06 Sep 2022 07:24:14 +0000
Received: from 50cf23498f71.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BB7E1E5D-4FC7-487C-BCDA-0544C9A813CD.1; 
 Tue, 06 Sep 2022 07:24:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 50cf23498f71.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Sep 2022 07:24:06 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DBBPR08MB6106.eurprd08.prod.outlook.com (2603:10a6:10:202::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 07:24:05 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 07:24:05 +0000
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
X-Inumbo-ID: ea954b80-2db4-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=MZE2GuoOVkczEc07poGmo+WlLuCYajxVV3OWexsSfPljzZiVQ6UyfeSB2QjuXxfUx3ku2a9/nRz3L14F1sm9IUGCjEWk0aHa7/fBdsiRWzV4jJzhiebY3DD+3N+ZCr+4Lke877ed9ltcKijqV/y1rOIVNs1mB6dLYOz7TgTMuF3xgm5ltfqIj46/qyU2YCkyqs0bIHfj660JERMtA2RSuaXHivKFDOm1TyjiZtvslVkfLUXXxPhkxwwzuY5l/ae+h0EjSVanwHUBZqml0kUjvyfMo8QIjAMBiMfA8a46yLl8mMOZ/aRLRqaYUEYbY4187RKhhAyJaMeL6QH8/CGxnQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59AoVz2istsXFBBqxHue9M0HNmlUglvw20I7+sBJ31c=;
 b=joPWL3KeZLbyPviPcuOr2msCTrsISV6ZW+v4InbORn4Vs0/daUDLw+zO6lFP/cUfY7lpSz+AhD/IAPttg1gMZXonQ73SJjaRuZUWfVSst944GMA/X9Obmvh03yQgGXf9dGnJSK6XNh0motjkeS7cdHNtgLxudFNuoJ8U3eYIIU4o3bPCiZytIGbk8iLAvtPtRRAjfHdVbTYGbfGz5SEjjqtRdbmr8rbbhVOrrDHE3EC3TRBJcqiJnl9sYtcn0FHSsFaB8RCtIzr+FKiHwL0TXVFmfTruJ5HAEd4tXZQRLuT7Ag8Ua0JsB8NerZTebMwXQFG+s9U7QmYs1ol+mMd9Cw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59AoVz2istsXFBBqxHue9M0HNmlUglvw20I7+sBJ31c=;
 b=mBDPTo68GJJErhDUp7zsIlGSuK+XE2GqzCre59g603O8Y7kuc4tbBtVtmsEqvuDm3w9F/4/uUQGubFApY3CMjdCHxIPUY2xFs5lSp5k31RTI4myzbKAj0mrLQbNh9WMVkrIun4YoPvmLEn31JSw9yn1L3qXc0AplqezLgwHMAkE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 78d2e71fab0a6df3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FC5vdW7sY/c/FbVOXdUZaXNS49umovAJnYr542NyCNRiqoaOnN39S2yJh7aOs//M38x2Gfdn4ZmYiigOT0AGB9XRotY3GIq8mZMPVqP/igqV/OWr4pLhTmWkoohW5leNEEO5aH7gwK+tx5AInY+cXklSmBVP27Mng259DAtrwvq2GxcO+5iZ4yRF/hISM/JIF9oGXVXVMSz8/rqAvIPLpk/xMEDAisve5+72mApm9eIP9+xsALYOdKgBgyue2kNefy/rYLms5kt9ExUt4SYw4YFNUaKNB1q7ZG7vMUR3w+L/4/T9DM8lSdZHTu6J6rg1f8tgjDqq3Lca+4hUhSmIHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59AoVz2istsXFBBqxHue9M0HNmlUglvw20I7+sBJ31c=;
 b=FEWK+j7uocb6/+Yz6+bwM4Np9nPvTA5bLcn2+o9GLhjjQPNHdkd/ei5nrGmLhDlfMJ5MLhc6R7mZ2HzN744ylqfsrXjCmiRBWwX/Y/yuOsG4bPOMx8dHsSXdcCTES4CQfhdcUi3XOYRjXKCKYmupfSHhhZv6DMG17+mlkConC1ItzkDZvfKvQD/1nMCquQcgqrIVPuRDQvm4dEPa0JdU8qFHlUK4wycLA1r/AS5TldeXX60F0P7mHCkI5yGQfj0a7GH/XPPuKe+xm8DiRuU29ZGU1JZJv2q8q6+2P0R7LlJTi9WLfu0uZAfy9W15AR50vHAnbho5w9L4q+72YvK7pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59AoVz2istsXFBBqxHue9M0HNmlUglvw20I7+sBJ31c=;
 b=mBDPTo68GJJErhDUp7zsIlGSuK+XE2GqzCre59g603O8Y7kuc4tbBtVtmsEqvuDm3w9F/4/uUQGubFApY3CMjdCHxIPUY2xFs5lSp5k31RTI4myzbKAj0mrLQbNh9WMVkrIun4YoPvmLEn31JSw9yn1L3qXc0AplqezLgwHMAkE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Rahul Singh <Rahul.Singh@arm.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 7/7] xen/arm: introduce new xen,enhanced property value
Thread-Topic: [PATCH v3 7/7] xen/arm: introduce new xen,enhanced property
 value
Thread-Index:
 AQHYveOAeMLlOwX5Mka7ZrpAabJW7K3K4ewAgAFZKACAAAQoAIAADY8AgAAHN4CABGESgIAACJcAgAADEoCAAAPFgIAADnWAgAAKUACAAJguAIAAkgwA
Date: Tue, 6 Sep 2022 07:24:05 +0000
Message-ID: <D1317300-F801-47B6-B54A-E0788F6477EF@arm.com>
References: <cover.1662023183.git.rahul.singh@arm.com>
 <d8dae49b05e6c59715016e0995b1275f3cb6e7fc.1662023183.git.rahul.singh@arm.com>
 <28b9679c-8223-ae71-d629-4ec31a72dcb2@xen.org>
 <36A408C8-36C5-4A39-80B4-F564445635C7@arm.com>
 <616b36ec-5a42-cb9a-2131-3aea1bec7c67@xen.org>
 <46897765-5063-49CE-8A8A-F4DA50570A08@arm.com>
 <a669182c-dab1-35b7-9bf7-caac1813e3ad@xen.org>
 <C27FD0DE-D8FA-4A67-AE0B-DF4030A65127@arm.com>
 <a14b4d4a-5ae6-4af0-2d00-49bbc688cd4a@xen.org>
 <6B0D4F4B-C7CC-4C04-9BA4-71976CAA82C5@arm.com>
 <cf2872c6-23e3-ced4-d7c5-2a5e6ade98ad@xen.org>
 <1874D575-E3B3-4221-925F-AF71D3EF0289@arm.com>
 <EBF5412F-F932-4D25-A2E3-9F53D59ABBCC@arm.com>
 <alpine.DEB.2.22.394.2209051530250.3931@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2209051530250.3931@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1e257f07-9599-49ff-2d7c-08da8fd8cd1f
x-ms-traffictypediagnostic:
	DBBPR08MB6106:EE_|AM7EUR03FT028:EE_|DB9PR08MB6570:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 n0WGGTsmwMXhrFsofcDP0KNENT24Ln65FIRgTiC9v+AtFTzIMapoElOIOt6VmtVM/qDFZyXEgCd0+TuzQfDOprLrbIgePn4kuArb2CjLvCQKdDIjVF01G1cAvq4yYVnNg4MYj3x/xIyDzRkx/XjPJb6W3htvk+ULjHTyOcr+Be7lowmAU+4YT/I0ySuPiRekWOP+XzGZSUh/BwRsKJJHmg4b1/k/Szd/lMJSPJ1l4Qkd3W8YcNv1QnYlgnRDcQXAnFY/gnY8TvH4uPAv5kxvWnhelj0fcF54F4x9w5RPaqdIiqjHuCF92DsRHUfiZqc14UCBbiAloRmkuSMvkY+3gOBx0MiUVt0HkqnkJ9mn3jaf3LhlyJTcZGeUvVinFGRmBOEqfoG+GTBPytJBw4/0iipThNXw7ewwODleo3DfdrWIHo9G/cIoUdkq24FOuJk4qcb5Mr2CHKSxfQfgJafcaM/ioi/wbvyNp2I6tiUuyFfhjlDPLZlvYZguJEUHr1QAXMf5jQ6xZRHewKD1OBvm5mufIYIVkCOO5500Vke7uu87N/vHVxCs35qS3OsMYdodgVGP1uKVbf7AF5G+qgQRkw1RH1sYx4SgK3yT4sv1rXRV/2Aky9UzGKZC8hTMTr0XHKBcO6azYXWcdLEm7noQgYHZiJBpELQqt0X6wN6RQr8zE3N8UuVTSK3aAbSRl66Pv1mqX6PxY0DG1aMAa3yXipNE9Szh+vcE3Pzg8ljaOJDWF9sqk3mSwHSiB9gzcEboNkha5aUxd3YnoRtz1xxSZqfZGqoUJXZ2LADJ/UDhTS8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(366004)(376002)(39860400002)(136003)(36756003)(6512007)(54906003)(6916009)(316002)(38100700002)(122000001)(38070700005)(2906002)(33656002)(8936002)(5660300002)(66556008)(66476007)(76116006)(4326008)(86362001)(83380400001)(8676002)(66446008)(64756008)(91956017)(66946007)(71200400001)(6486002)(41300700001)(2616005)(186003)(6506007)(53546011)(26005)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3C571312861434FA6A0D63FBDCBD249@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6106
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3c95cdb4-3a7f-4760-8deb-08da8fd8c7cd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ekontJ8S2gYXf7JGLIm9GteatibEEng9/gPeIDere8DkEzRPesBA9clZuut6OPvzBoAdCIxJIS0oGTYyOKC3Bb0aNInABAWSRdTGiNEpNX2UrHEIg+mgkrhCcOS8PFpUVjnqnN/5IOrftdzv/eeEZXrMuoXGDsLiAEzLOeov9xpCnm8rhBoVdeXcq/9F5RWuO5VVtiFEp+Bs6oTdv+KXy15ZTYOVneH2oFhxZRg81mOzj4AQfKQT3e/lgltXhlo+817OZWYMbHkKX85Z40pDG2/xvsG2TeO9wWJ0tD+aKsiLVCdpDoQnsyxhw0FM5Kbxw6RFg3jm4XiPNOP/ZAcwztfPnwqCIs7G5xyORBckd/JWWw2pkrguQpXOb47TCFkyQkz9Pv84SYhoO+ZfxscBNT+6ZX/IRBW8AXjVAbD5eQFmaKyrLnj2dsKcUeABfztE1fn7QK0HiseOUVGai3mUUDslC9XURVG5huCjAi4gKgigeFQS/dStZVh/Bt7PN3ZlEE/CCthR1fJlRE6OuV1bQj7yhm7WwpdTNKr1gRAkTLkFyd6eKNDwk1jNcBW/3QQK0qDpVjZfVKLEKp5+1RKOkaRY2y3EZZST/7cAXEXda8+OylCu19BLMR0680XuQvofQRFmS8ZA5H5tt/IOmvamZ7HYop24xQ0YDwyTvCLmEpEfrNIkFY8sjd7bd1BuQzmNW0j8be3+WwrBMmpLIcBYNkZlBywtqWvNyg6YDkK+aILTws2DysAc5jv8IHhSig4gBBLa1C4538/O4NgoZRYM9A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(376002)(346002)(136003)(36840700001)(40470700004)(46966006)(82310400005)(336012)(186003)(2616005)(6512007)(40480700001)(41300700001)(6486002)(478600001)(26005)(83380400001)(6506007)(86362001)(47076005)(356005)(81166007)(107886003)(40460700003)(82740400003)(53546011)(54906003)(4326008)(2906002)(70586007)(8676002)(36860700001)(70206006)(316002)(33656002)(8936002)(6862004)(5660300002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 07:24:14.2801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e257f07-9599-49ff-2d7c-08da8fd8cd1f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6570

SGkgU3RlZmFubywNCg0KPiBPbiA1IFNlcCAyMDIyLCBhdCAyMzo0MSwgU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgNSBTZXAg
MjAyMiwgUmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4gT24gNSBTZXAgMjAyMiwgYXQgMTo1OSBwbSwg
QmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPiB3cm90ZToNCj4+PiAN
Cj4+PiBIaSBKdWxpZW4sDQo+Pj4gDQo+Pj4+IE9uIDUgU2VwIDIwMjIsIGF0IDEzOjA4LCBKdWxp
ZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+Pj4gDQo+Pj4+IA0KPj4+PiANCj4+
Pj4gT24gMDUvMDkvMjAyMiAxMjo1NCwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+IEhp
IEp1bGllbiwNCj4+Pj4+PiBPbiA1IFNlcCAyMDIyLCBhdCAxMjo0MywgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4+Pj4gDQo+Pj4+Pj4gDQo+Pj4+Pj4gDQo+Pj4+Pj4g
T24gMDUvMDkvMjAyMiAxMjoxMiwgUmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4+Pj4+IEhpIEp1bGll
biwNCj4+Pj4+PiANCj4+Pj4+PiBIaSBSYWh1bCwNCj4+Pj4+PiANCj4+Pj4+Pj4+IE9uIDIgU2Vw
IDIwMjIsIGF0IDU6MjAgcG0sIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0K
Pj4+Pj4+Pj4gDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gT24gMDIvMDkvMjAyMiAx
Njo1NCwgUmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4+Pj4+Pj4gSGkgSnVsaWVuLA0KPj4+Pj4+Pj4g
DQo+Pj4+Pj4+PiBIaSBSYWh1bCwNCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+PiBPbiAyIFNlcCAyMDIy
LCBhdCA0OjA1IHBtLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+Pj4+
Pj4+Pj4gDQo+Pj4+Pj4+Pj4+IEhpIEJlcnRyYW5kLA0KPj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4g
T24gMDIvMDkvMjAyMiAxNTo1MSwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+Pj4+Pj4+
PiBPbiAxIFNlcCAyMDIyLCBhdCAxOToxNSwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4g
d3JvdGU6DQo+Pj4+Pj4+Pj4+Pj4gQUZBSVUsIGl0IGlzIG5vdCBwb3NzaWJsZSB0byBoYXZlICpf
eGVuc3RvcmUgPSB0cnVlIGFuZCAqX2VuaGFuY2VkID0gZmFsc2UuIEkgdGhpbmsgaXQgd291bGQg
YmUgY2xlYXJlciBpZiBgYGRvbTBsZXNzX2VuaGFuY2VkYGAgaXMgdHVybmVkIHRvIGFuIGVudW0g
d2l0aCAzIHZhbHVlczoNCj4+Pj4+Pj4+Pj4+PiAtIE5vbmUNCj4+Pj4+Pj4+Pj4+PiAtIE5PWEVO
U1RPUkUvQkFTSUMNCj4+Pj4+Pj4+Pj4+PiAtIEZVTExZX0VOSEFOQ0VEDQo+Pj4+Pj4+Pj4+Pj4g
DQo+Pj4+Pj4+Pj4+Pj4gSWYgd2Ugd2FudCB0byBiZSBmdXR1cmUgcHJvb2YsIEkgd291bGQgdXNl
IGEgZmllbGQgJ2ZsYWdzJyB3aGVyZSBub24temVybyBtZWFucyBlbmhhbmNlZC4gRWFjaCBiaXQg
d291bGQgaW5kaWNhdGUgd2hpY2ggZmVhdHVyZXMgb2YgWGVuIGlzIGV4cG9zZWQuDQo+Pj4+Pj4+
Pj4+PiBJIHRoaW5rIHRoYXQgY291bGQgYmUgYSBnb29kIHNvbHV0aW9uIGlmIHdlIGRvIGl0IHRo
aXMgd2F5Og0KPj4+Pj4+Pj4+Pj4gLSBkZWZpbmUgYSBkb20wbGVzcyBmZWF0dXJlIGZpZWxkIGFu
ZCBoYXZlIGRlZmluZXMgbGlrZSB0aGUgZm9sbG93aW5nOg0KPj4+Pj4+Pj4+Pj4gI2RlZmluZSBE
T00wTEVTU19HTlRUQUINCj4+Pj4+Pj4+Pj4+ICNkZWZpbmUgRE9NMExFU1NfRVZFTlRDSE4NCj4+
Pj4+Pj4+Pj4+ICNkZWZpbmUgRE9NMExFU1NfWEVOU1RPUkUgPg0KPj4+Pj4+Pj4+Pj4gLSBkZWZp
bmUgZG9tMGxlc3MgZW5oYW5jZWQgYXMgdGhlIHJpZ2h0IGNvbWJpbmF0aW9uOg0KPj4+Pj4+Pj4+
Pj4gI2RlZmluZSBET00wTEVTU19FTkhBTkNFRCA9IChET00wTEVTU19HTlRUQUJ8IERPTTBMRVNT
X0VWRU5UQ0hOfCBET00wTEVTU19YRU5TVE9SRSkNCj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+IEkg
d291bGQgcmF0aGVyIGludHJvZHVjZSBET00wTEVTU19FTkhBTkNFRF9CQVNJQyAob3Igc2ltaWxh
cikgaW5zdGVhZCBvZiBkZWZpbmluZyBhIGJpdCBmb3IgZ250dGFiIGFuZCBldnRjaG4uIFRoaXMg
d2lsbCBhdm9pZCB0aGUgcXVlc3Rpb24gb2Ygd2h5IHdlIGFyZSBpbnRyb2R1Y2luZyBiaXRzIGZv
ciBib3RoIGZlYXR1cmVzIGJ1dCBub3QgdGhlIGh5cGVyY2FsbC4uLg0KPj4+Pj4+Pj4+PiANCj4+
Pj4+Pj4+Pj4gQXMgdGhpcyBpcyBhbiBpbnRlcm5hbCBpbnRlcmZhY2UsIGl0IHdvdWxkIGJlIGVh
c2llciB0byBtb2RpZnkgYWZ0ZXJ3YXJkcy4NCj4+Pj4+Pj4+PiBIb3cgYWJvdXQgdGhpcz8NCj4+
Pj4+Pj4+PiAvKg0KPj4+Pj4+Pj4+ICogTGlzdCBvZiBwb3NzaWJsZSBmZWF0dXJlcyBmb3IgZG9t
MGxlc3MgZG9tVXMNCj4+Pj4+Pj4+PiAqDQo+Pj4+Pj4+Pj4gKiBET00wTEVTU19FTkhBTkNFRF9C
QVNJQzogWGVuIFBWIGludGVyZmFjZXMsIGluY2x1ZGluZyBncmFudC10YWJsZSBhbmQNCj4+Pj4+
Pj4+PiAqICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGV2dGNobiwgd2lsbCBiZSBlbmFibGVkIGZvciB0aGUgVk0uDQo+Pj4+Pj4+PiANCj4+
Pj4+Pj4+IFRlY2huaWNhbGx5LCB0aGUgZ3Vlc3QgY2FuIGFscmVhZHkgdXNlIHRoZSBncmFudC10
YWJsZSBhbmQgZXZ0Y2huIGludGVyZmFjZXMuIFRoaXMgYWxzbyByZWFkcyBxdWl0ZSBvZGQgdG8g
bWUgYmVjYXVzZSAiaW5jbHVkaW5nIiBkb2Vzbid0IHRlbGwgd2hhdCdzIG5vdCBlbmFibGVkLiBT
byBvbmUgY291bGQgYXNzdW1lIFhlbnN0b3JlZCBpcyBhbHNvIGVuYWJsZWQuIEluIGZhY3QgdGhl
IHdvcmRpbmcgZm9yIGBgRE9NMExFU1NfRU5IQU5DRURgYCBpcyB3aGF0IG1ha2VzIGl0IGEgbG90
IG1vcmUgY29uZnVzaW5nLg0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBTbyBJIHdvdWxkIHN1Z2dlc3Qg
dGhlIGZvbGxvd2luZyB3b3JkaW5nOg0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+PiAiTm90aWZ5IHRoZSBP
UyBpdCBpcyBydW5uaW5nIG9uIHRvcCBvZiBYZW4uIEFsbCB0aGUgZGVmYXVsdCBmZWF0dXJlcyBi
dXQgWGVuc3RvcmUgd2lsbCBiZSBhdmFpbGFibGUuIE5vdGUgdGhhdCBhbiBPUyAqbXVzdCogbm90
IHJlbHkgb24gdGhlIGF2YWlsYWJpbGl0eSBvZiBYZW4gZmVhdHVyZXMgaWYgdGhpcyBpcyBub3Qg
c2V0Lg0KPj4+Pj4+Pj4gIg0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBUaGUgd29yZGluZyBjYW4gYmUg
dXBkYXRlZCBvbmNlIHdlIHByb3Blcmx5IGRpc2FibGUgZXZlbnQgY2hhbm5lbC9ncmFudCB0YWJs
ZSB3aGVuIHRoZSBmbGFnIGlzIG5vdCBzZXQuDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiAqIERPTTBM
RVNTX1hFTlNUT1JFOiAgICAgICAgICAgICAgWGVuc3RvcmUgd2lsbCBiZSBlbmFibGVkIGZvciB0
aGUgVk0uDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IEkgd291bGQgbWFrZSBjbGVhciB0aGlzIGNhbid0
IGJlIHVzZWQgd2l0aG91dCB0aGUgZmlyc3Qgb25lLg0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4gKiBE
T00wTEVTU19FTkhBTkNFRDogICAgICAgICAgICAgIFhlbiBQViBpbnRlcmZhY2VzLCBpbmNsdWRp
bmcgZ3JhbnQtdGFibGUgeGVuc3RvcmUgPiAgICogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYW5kDQo+Pj4+Pj4+PiBldnRjaG4sIHdpbGwg
YmUgZW5hYmxlZCBmb3IgdGhlIFZNLg0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBTZWUgYWJvdmUgYWJv
dXQgIlBWIGludGVyZmFjZXMiLiBTbyBJIHdvdWxkIHN1Z2dlc3QgdG8gcmV3b3JkIHRvOg0KPj4+
Pj4+Pj4gDQo+Pj4+Pj4+PiAiTm90aWZ5IHRoZSBPUyBpdCBpcyBydW5uaW5nIG9uIHRvcCBvZiBY
ZW4uIEFsbCB0aGUgZGVmYXVsdCBmZWF0dXJlcyAoaW5jbHVkaW5nIFhlbnN0b3JlKSB3aWxsIGJl
IGF2YWlsYWJsZSIuDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiAqLw0KPj4+Pj4+Pj4+ICNkZWZpbmUg
RE9NMExFU1NfRU5IQU5DRURfQkFTSUMgQklUKDAsIFVMKQ0KPj4+Pj4+Pj4+ICNkZWZpbmUgRE9N
MExFU1NfWEVOU1RPUkUgICAgICAgQklUKDEsIFVMKQ0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBCYXNl
ZCBvbiB0aGUgY29tbWVudCBhYm92ZSwgSSB3b3VsZCBjb25zaWRlciB0byBkZWZpbmUgRE9NMExF
U1NfWEVOU1RPUkUgYXMgYml0IDAgYW5kIDEgc2V0Lg0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4gI2Rl
ZmluZSBET00wTEVTU19FTkhBTkNFRCAgICAgICAoRE9NMExFU1NfRU5IQU5DRURfQkFTSUMgfCBE
T00wTEVTU19YRU5TVE9SRSkNCj4+Pj4+Pj4gQmVydHJhbmQgYW5kIEkgZGlzY3Vzc2VkIHRoaXMg
YWdhaW4gd2UgY2FtZSB0byB0aGUgY29uY2x1c2lvbiB0aGF0IERPTTBMRVNTX0VOSEFOQ0VEX0JB
U0lDIGlzIG5vdA0KPj4+Pj4+PiB0aGUgc3VpdGFibGUgbmFtZSBhcyB0aGlzIG1ha2VzIHRoZSBj
b2RlIHVuY2xlYXIgYW5kIGRvZXMgbm90IGNvcnJlc3BvbmQgdG8gRFQgc2V0dGluZ3MuIFdlIHBy
b3Bvc2UgdGhpcw0KPj4+Pj4+PiBwbGVhc2UgbGV0IG1lIGtub3cgeW91ciB0aG91Z2h0cy4NCj4+
Pj4+PiANCj4+Pj4+PiBUbyBtZSB0aGUgZGVmYXVsdCBvZiAiZW5oYW5jZWQiIHNob3VsZCBiZSBh
bGwgWGVuIGZlYXR1cmVzLiBBbnl0aGluZyBlbHNlIHNob3VsZCBiZSBjb25zaWRlciBhcyByZWR1
Y2VkL2Jhc2ljL21pbmltdW0uIEhlbmNlIHdoeSBJIHN0aWxsIHRoaW5rIHdlIG5lZWQgdG8gYWRk
IGl0IGluIHRoZSBuYW1lIGV2ZW4gaWYgdGhpcyBpcyBub3Qgd2hhdCB3ZSBleHBvc2UgaW4gdGhl
IERULiBJbiBmYWN0Li4uDQo+Pj4+Pj4+IC8qDQo+Pj4+Pj4+ICogTGlzdCBvZiBwb3NzaWJsZSBm
ZWF0dXJlcyBmb3IgZG9tMGxlc3MgZG9tVXMNCj4+Pj4+Pj4gKg0KPj4+Pj4+PiAqIERPTTBMRVNT
X1hFTlNUT1JFOiAgICAgICAgICAgICAgWGVuc3RvcmUgd2lsbCBiZSBlbmFibGVkIGZvciB0aGUg
Vk0uIFRoaXMgZmVhdHVyZQ0KPj4+Pj4+PiAqICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNhbid0IGJlIGVuYWJsZWQgd2l0aG91dCB0aGUgRE9NMExFU1Nf
RU5IQU5DRUQuDQo+Pj4+Pj4+ICogRE9NMExFU1NfRU5IQU5DRUQ6ICAgICAgICAgICAgICBOb3Rp
ZnkgdGhlIE9TIGl0IGlzIHJ1bm5pbmcgb24gdG9wIG9mIFhlbi4gQWxsIHRoZQ0KPj4+Pj4+PiAq
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZGVmYXVsdCBmZWF0dXJlcyAoaW5jbHVkaW5nIFhlbnN0b3JlKSB3aWxsIGJlDQo+Pj4+Pj4+ICog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBh
dmFpbGFibGUuIE5vdGUgdGhhdCBhbiBPUyAqbXVzdCogbm90IHJlbHkgb24gdGhlDQo+Pj4+Pj4+
ICogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBhdmFpbGFiaWxpdHkgb2YgWGVuIGZlYXR1cmVzIGlmIHRoaXMgaXMgbm90IHNldC4NCj4+Pj4+
PiANCj4+Pj4+PiAuLi4gd2hhdCB5b3Ugd3JvdGUgaGVyZSBtYXRjaCB3aGF0IEkgd3JvdGUgYWJv
dmUuIFNvIGl0IGlzIG5vdCBjbGVhciB0byBtZSB3aGF0J3MgdGhlIHBvaW50IG9mIGhhdmluZyBh
IGZsYWcgRE9NMExFU1NfWEVOU1RPUkUuDQo+Pj4+PiBXaGVuIHdlIGxvb2tlZCBhdCB0aGUgY29k
ZSB3aXRoIHRoZSBzb2x1dGlvbiB1c2luZyBCQVNJQywgaXQgd2FzIHJlYWxseSBub3QgZWFzeSB0
byB1bmRlcnN0YW5kLg0KPj4+PiANCj4+Pj4gSSBkb24ndCBxdWl0ZSB1bmRlcnN0YW5kIGhvdyB0
aGlzIGlzIGRpZmZlcmVudCBmcm9tIEVOSEFOQ0VELCBFTkhBTkNFRF9GVUxMLiBJbiBmYWN0LCB3
aXRob3V0IGxvb2tpbmcgYXQgdGhlIGRvY3VtZW50YXRpb24sIHRoZXkgbWVhbiBleGFjdGx5IHRo
ZSBzYW1lLi4uDQo+Pj4+IA0KPj4+PiBUaGUgZGlmZmVyZW5jZSBiZXR3ZWVuICJCQVNJQyIgYW5k
ICJFTkhBTkNFRCIgaXMgY2xlYXIuIFlvdSBrbm93IHRoYXQgaW4gb25lIGNhc2UsIHlvdSB3b3Vs
ZCBnZXQgbGVzcyB0aGFuIHRoZSBvdGhlci4NCj4+Pj4gDQo+Pj4+PiBCeSB0aGUgd2F5IHRoZSBj
b21tZW50IGlzIHdyb25nIGFuZCBjb3JyZXNwb25kIHRvIHdoYXQgc2hvdWxkIGJlIEVOSEFOQ0VE
X0ZVTEwgaGVyZQ0KPj4+Pj4gRU5IQU5DRUQgd291bGQgYmUgdGhlIGJhc2Ugd2l0aG91dCBYZW5z
dG9yZS4NCj4+Pj4gDQo+Pj4+IFRoYW5rcyBmb3IgdGhlIGNvbmZpcm1hdGlvbi4gSSBhbSBhZnJh
aWQsIEkgYW0gc3Ryb25nbHkgYWdhaW5zdCB0aGUgdGVybWlub2xvZ3kgeW91IHByb3Bvc2VkIChz
ZWUgYWJvdmUgd2h5KS4NCj4+Pj4gDQo+Pj4+IEkgdGhpbmsgQkFTSUMgKG9yIHNpbWlsYXIgbmFt
ZSkgaXMgYmV0dGVyLiBCdXQgSSBhbSBvcGVuIHRvIHN1Z2dlc3Rpb24gc28gbG9uZyBpdCBpcyBu
b3QgIkRPTTBMRVNTX0VOSEFOQ0VEIiB2cyAiRE9NMExFU1NfRU5IQU5DRURfRlVMTCIuDQo+Pj4g
DQo+Pj4gSSBkbyBub3QgYWdyZWUgYnV0IEkgdGhpbmsgdGhpcyBpcyBvbmx5IGludGVybmFsIGFu
ZCBjb3VsZCBlYXNpbHkgYmUgbW9kaWZpZWQgb25lIGRheSBpZiB3ZSBoYXZlIG1vcmUgdXNlLWNh
c2VzLg0KPj4+IFNvIGxldOKAmXMgZ28gZm9yIEJBU0lDIGFuZCB1bmJsb2NrIHRoaXMgYmVmb3Jl
IHRoZSBmZWF0dXJlIGZyZWV6ZS4NCj4+PiANCj4+PiBCZXJ0cmFuZA0KPj4gDQo+PiBQbGVhc2Ug
aGF2ZSBhIGxvb2sgb25jZSBpZiB0aGlzIGxvb2tzIG9rYXkuDQo+PiANCj4+IC8qICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgDQo+PiAqIExpc3Qgb2YgcG9zc2libGUgZmVhdHVyZXMgZm9yIGRvbTBsZXNz
IGRvbVVzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQo+PiAqICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgDQo+PiAqIERPTTBMRVNTX0VOSEFOQ0VEX0JBU0lDOglOb3RpZnkgdGhlIE9TIGl0
IGlzIHJ1bm5pbmcgb24gdG9wIG9mIFhlbi4gQWxsIHRoZSAgDQo+PiAqICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAlkZWZhdWx0IGZlYXR1
cmVzIChleGNsdWRpbmcgWGVuc3RvcmUpIHdpbGwgYmUgICAgICAgDQo+PiAqICAgICAgICAgICAg
ICAgICAgICAgICAgICAJCQkJCWF2YWlsYWJsZS4gTm90ZSB0aGF0IGFuIE9TICptdXN0KiBub3Qg
cmVseSBvbiB0aGUgICANCj4+ICogICAgICAgICAgICAgICAgICAgICAgICAgIAkJCQkJYXZhaWxh
YmlsaXR5IG9mIFhlbiBmZWF0dXJlcyBpZiB0aGlzIGlzIG5vdCBzZXQuICAgIA0KPj4gKiBET00w
TEVTU19YRU5TVE9SRTogICAgICAgCQlYZW5zdG9yZSB3aWxsIGJlIGVuYWJsZWQgZm9yIHRoZSBW
TS4gVGhpcyBmZWF0dXJlICAgDQo+PiAqICAgICAgICAgICAgICAgICAgICAgICAgICAJCQkJCWNh
bid0IGJlIGVuYWJsZWQgd2l0aG91dCB0aGUgRE9NMExFU1NfRU5IQU5DRURfQkFTSUMuICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIA0KPj4gKiBET00wTEVTU19FTkhBTkNFRDoJCQlOb3RpZnkg
dGhlIE9TIGl0IGlzIHJ1bm5pbmcgb24gdG9wIG9mIFhlbi4gQWxsIHRoZSAgDQo+PiAqICAgICAg
ICAgICAgICAgICAgICAgICAgICAJCQkJCWRlZmF1bHQgZmVhdHVyZXMgKGluY2x1ZGluZyBYZW5z
dG9yZSkgd2lsbCBiZSAgICAgICANCj4+ICogICAgICAgICAgICAgICAgICAgICAgICAgIAkJCQkJ
YXZhaWxhYmxlLiBOb3RlIHRoYXQgYW4gT1MgKm11c3QqIG5vdCByZWx5IG9uIHRoZSAgIA0KPj4g
KiAgICAgICAgICAgICAgICAgICAgICAgICAgCQkJCQlhdmFpbGFiaWxpdHkgb2YgWGVuIGZlYXR1
cmVzIGlmIHRoaXMgaXMgbm90IHNldC4gICAgDQo+PiAqLyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQo+
PiAjZGVmaW5lIERPTTBMRVNTX0VOSEFOQ0VEX0JBU0lDICAgICBCSVQoMCwgVUwpICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIA0KPj4gI2RlZmluZSBET00wTEVTU19YRU5TVE9SRSAg
ICAgICAgICAgICAgICAgIEJJVCgxLCBVTCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgDQo+PiAjZGVmaW5lIERPTTBMRVNTX0VOSEFOQ0VEICAgICAgICAgICAgICAgICAoRE9NMExF
U1NfRU5IQU5DRURfQkFTSUMgIHwgIERPTTBMRVNTX1hFTlNUT1JFKQ0KPiANCj4gTGV0IG1lIGhh
dmUgYSBjaGFuY2UgdG8gcHJvcG9zZSBhIG5hbWluZyBzY2hlbWUgYXMgd2VsbCA6LSkNCj4gDQo+
IEkgYWdyZWUgd2l0aCBKdWxpZW46IEkgcHJlZmVyIHRoaXMgcHJvcG9zYWwgY29tcGFyZWQgdG8g
dGhlIGVhcmxpZXIgb25lDQo+IGJ5IEJlcnRyYW5kIGFuZCBSYWh1bCBiZWNhdXNlIEkgdGhpbmsg
aXQgaXMgYSBsb3QgY2xlYXJlciBhbmQgIkVOSEFOQ0VEIg0KPiBzaG91bGQgbWVhbiBldmVyeXRo
aW5nLiBBbHNvLCBpdCBtYWtlcyBpdCBlYXNpZXIgZnJvbSBhIGNvbXBhdGliaWxpdHkNCj4gcGVy
c3BlY3RpdmUgYmVjYXVzZSBpdCBtYXRjaGVzIHRoZSBjdXJyZW50IGRlZmluaXRpb24uDQo+IA0K
PiBCdXQgSSBhbHNvIGFncmVlIHdpdGggQmVydHJhbmQgdGhhdCAiQkFTSUMiIGRvZXNuJ3Qgc291
bmQgbmljZS4gSSB0aGluaw0KPiB3ZSBzaG91bGQga2VlcCAiRE9NMExFU1NfRU5IQU5DRUQiIGFu
ZCAiRE9NMExFU1NfWEVOU1RPUkUiIGFzIHN1Z2dlc3RlZA0KPiBoZXJlLCBidXQgcmVwbGFjZSAi
RE9NMExFU1NfRU5IQU5DRURfQkFTSUMiIHdpdGggc29tZXRoaW5nIGJldHRlci4gU29tZQ0KPiBp
ZGVhczoNCj4gDQo+IC0gRE9NMExFU1NfRU5IQU5DRURfTElNSVRFRA0KPiAtIERPTTBMRVNTX0VO
SEFOQ0VEX01JTkkNCg0KUGVyc29uYWxseSBJIGRvIG5vdCBmaW5kIHRob3NlIG1vcmUgY2xlYXIg
dGhlbiBCQVNJQw0KDQo+IC0gRE9NMExFU1NfRU5IQU5DRURfTk9fWFMNCg0KVGhpcyBoYXMgdGhl
IHByb2JsZW0gdG8gYmUgdHJ1ZSBub3cgYnV0IHdvdWxkIG5lZWQgcmVuYW1pbmcgaWYgd2UgaW50
cm9kdWNlIGEgZGVmaW5pdGlvbiBmb3IgYW4gb3RoZXIgYml0Lg0KDQo+IC0gRE9NMExFU1NfRU5I
QU5DRURfR05UX0VWVENITg0KDQpJIHdvdWxkIHZvdGUgZm9yIHRoaXMgb25lIGFzIGl0IGV4cGxp
Y2l0bHkgc3RhdGUgd2hhdCBpcyBpbiBzbyB0aGUgYml0c2V0IHN5c3RlbSBpcyBldmVuIG1vcmUg
bWVhbmluZ2Z1bC4NCg0KPiANCj4gQW55IG9mIHRoZXNlIGFyZSBiZXR0ZXIgdGhhbiBCQVNJQyBm
cm9tIG15IHBvaW50IG9mIHZpZXcuIE5vdyBJIGFtIG9mZg0KPiB0byBnZXQgdGhlIGdyZWVuIHBh
aW50IGZvciBteSBzaGVkLg0KDQpIYXZlIGZ1biA7LSkNCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQoN
Cg0K

