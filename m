Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 476AB4D8785
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 15:56:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290266.492235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTm7N-0000km-Ob; Mon, 14 Mar 2022 14:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290266.492235; Mon, 14 Mar 2022 14:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTm7N-0000iZ-LW; Mon, 14 Mar 2022 14:56:17 +0000
Received: by outflank-mailman (input) for mailman id 290266;
 Mon, 14 Mar 2022 14:56:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J1jB=TZ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nTm7L-0000iT-I4
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 14:56:15 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe02::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4b80388-a3a6-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 15:56:14 +0100 (CET)
Received: from AS8PR04CA0018.eurprd04.prod.outlook.com (2603:10a6:20b:310::23)
 by AS8PR08MB7127.eurprd08.prod.outlook.com (2603:10a6:20b:402::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Mon, 14 Mar
 2022 14:56:03 +0000
Received: from VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::fa) by AS8PR04CA0018.outlook.office365.com
 (2603:10a6:20b:310::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28 via Frontend
 Transport; Mon, 14 Mar 2022 14:56:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT064.mail.protection.outlook.com (10.152.19.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.23 via Frontend Transport; Mon, 14 Mar 2022 14:56:02 +0000
Received: ("Tessian outbound 31aeb3346a45:v113");
 Mon, 14 Mar 2022 14:56:02 +0000
Received: from 0ad6f785708d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0AF10DFE-A8E1-4A33-BBA3-CBF64F90C72A.1; 
 Mon, 14 Mar 2022 14:55:55 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0ad6f785708d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Mar 2022 14:55:55 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by PAXPR08MB7366.eurprd08.prod.outlook.com (2603:10a6:102:227::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Mon, 14 Mar
 2022 14:55:54 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008%7]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 14:55:54 +0000
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
X-Inumbo-ID: e4b80388-a3a6-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BacHihNTF2bMzOQgA4Nux/Vnrm6x5FsZOAffWd65By0=;
 b=6zZJOKx3zhQoKz8f7+yC8nxlNlAOvJsjhUfShtp5DmAneRwf8mtmr2+c6Kw/mGqqxyilz9A4MB6OPM7v9CvNb1iPi4TOpq38x5eLplH6P+y0JtLl3FgBV+T9kRyZClTBvdTJ5RJsc/UJEu0Dpz4UppHcN99ZSoD/bUg/xb03YiU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d7af06639b8022bc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yrqkqt1AkoJ7eU6vsToQHpWLKUGUHacTbrEeR32U2NGOVTl+vp4/uwomxGppGuOTNgyAbsRiDxNnJx61XjRNLn6F4HhFnlWpKxTZtxSkqfBABNd61NIJ7Ps7l4b0kD+zek8biMiJkmZh7q/sq5zII/kf8hDZ6Qf//1VVWM+nTaEmqLNlKi2X6QZwHBXkOdhubMstqxhGFoI2WsMUe7TGIY3wVQhCZwhXCUHUT0EPkv3xHrc/J31x2MEsAAfmTgWQcddnpUzxw8I8jDTqhnmiVgUThMqNMFOv3I6jeUxPGclRIkpEejELl5AxSwxKfcN9DkpUEZSFJwC/+wQgki6qvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BacHihNTF2bMzOQgA4Nux/Vnrm6x5FsZOAffWd65By0=;
 b=AgdxF2t3HYxuOCtdoqExXx9t1ceF+kb0u8MOoUMffgkVP33KaNQ5oulHorPb+yM12wuEK0NyRT6fxP7AKW+VXDO6M/7j8p3sKkernDlDajot1zjS4FzixZDpfSyDxuh/BukmH0hYX2spohSE9TrnmpoYdvpOsHf0Xk0uxHJQkWABXT+bAiYE6ztU6ys00ceRvvI7MHvfxKfFjVWfQ1ElpBb3eFGdkqIK9r226SSHHFpDabK4Ub2y20oDTbgWsElFpt0gILgWAiu2xC5Q/E6NkKOOLtiudFOTmCqkHuMLdvWkIun3Mkc93MLo0vn2P6H/4HvcOJsgQ5gcA3xPO13Ngg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BacHihNTF2bMzOQgA4Nux/Vnrm6x5FsZOAffWd65By0=;
 b=6zZJOKx3zhQoKz8f7+yC8nxlNlAOvJsjhUfShtp5DmAneRwf8mtmr2+c6Kw/mGqqxyilz9A4MB6OPM7v9CvNb1iPi4TOpq38x5eLplH6P+y0JtLl3FgBV+T9kRyZClTBvdTJ5RJsc/UJEu0Dpz4UppHcN99ZSoD/bUg/xb03YiU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Vikram Garhwal <fnu.vikram@xilinx.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "volodymyr_babchuk@epam.com"
	<volodymyr_babchuk@epam.com>
Subject: Re: [XEN][RFC PATCH v3 04/14] libfdt: overlay: change
 overlay_get_target()
Thread-Topic: [XEN][RFC PATCH v3 04/14] libfdt: overlay: change
 overlay_get_target()
Thread-Index: AQHYMyVnZI3aVfFucEmpq1nEsQJaNqy/AOmA
Date: Mon, 14 Mar 2022 14:55:54 +0000
Message-ID: <2F06E8B7-B1C7-40A8-8695-841B0BC1DAEE@arm.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
 <20220308194704.14061-5-fnu.vikram@xilinx.com>
In-Reply-To: <20220308194704.14061-5-fnu.vikram@xilinx.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 65199cf2-c2d0-4db3-75b2-08da05cac24f
x-ms-traffictypediagnostic:
	PAXPR08MB7366:EE_|VE1EUR03FT064:EE_|AS8PR08MB7127:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB7127EF454A87E3C9B7270990E40F9@AS8PR08MB7127.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7ExfF86OCiAnhEJ1YGRSBcxBR0M0Iagi5zgADVJkCX9B3e9d8pMreOngMh3mCLNWgRwlhqAiTjDueYiF5ENUoPVjnSEgnGsaogJMpm+SEEGtMAqyCHClZhdWWUYfDEFpcrcwiStUX0lw/V6acixljSR5ovvuEj40czSYoNL8Pur1jKI5fXh3/rxu+QsfyAmsub08M9w7edM+e9/pGmNMJqEzzab3gy+rwTICIOSordf1/4sqsKbokBeRSjMxgPDAN+badXszkVvxXxFq+PJrTL/1lhrCGlduTTb4q70OZDlyZd1WVDbRT0SPaX3r4rqRrHLdfQ18BBM/84ChoM6Gb7RUwcnq5pxf7XGz/2f4rK2ep6RtEqEcqwkF5olhbjU+Fb6A5QyWk21/T5E60nZs2o2kFDbARDtD92XddziPnj+eMgZatertro85IhzgRJOMJkYPH5CCqDDTV24ydqt31RjhVsv2hnZeiX+80xDBSLSdaQAlPwxdZ3uE2K3En/4LowgXDVYImuUnlLJ6AjLwlBzR/MQwCR0rEIKIh7GGgklEc5kqzf+2QhMD6XlRrCj/5gkO/KC42HO8jbYPHSmD+40G+UYwCnZuluA58LwWT/8mxMVTD4pS6ArOTj0aqJW92OzZ3wbvvzCC3Mi46Sk8o1RQhYJ2VSPaQsY1cnl+rfnVXP4Y66blzPBata3mg+xe+AY5YaW3s9z7WJwA+DcjUMy2fh7gUVzoGlUAocq0DdDqEDML7PhwthZ5ND672w/Y
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(54906003)(6916009)(316002)(6512007)(33656002)(122000001)(53546011)(6506007)(38100700002)(64756008)(76116006)(8676002)(6486002)(91956017)(66946007)(66556008)(66476007)(66446008)(508600001)(86362001)(71200400001)(5660300002)(4744005)(8936002)(36756003)(26005)(2616005)(2906002)(186003)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF3D02EBAB16684F8E05B1F69AEF120E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7366
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a8fe1407-23d9-4eee-ee00-08da05cabd67
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	62mHf8Wvunqt/HAvfOnpAvQ5P4VVbJRPht+TDpEafPgxE3bz9tdmAwfYA9LDZYJmWlZnN0u36dR8M0ohxrDFIGmcGV2XidIGcOvp0zAfr3TYJ+57f+WrvBquVrgazhjwTyrPef40CL1LizsQS1oWNy/0AK+9ZpudPWw8usxSTmbpVU1v7XPZbuxw6DUztyuSrQoCm0B+xyPWe/O5z5qxyzdonYGHdglTd04ixX/QJs37Qr0e1NoqPBWK9uVKTc4vG7OY9SDkLV/3fqcn5USxOByi8WfEwJm+vnpTikqz7igWs7h6bGaEFXPlUKf5HR8RhdfniAbAtYpCnpjuuxTAdqzrSTm0higVjqo8WmRepwDvei7fWUMsHQZw/5rR+yVL1EWKH3O1LSt+ttPhOln5AfAFZkOTBngeCqP06yVWWk1Y5TTRXIPb2fm+M6DsdgOPfV+T61kdLVixyJ8vAiBijy6umG65C7W7yzx6t2kDdFh5HFqsmOEbgYRtsyBYUjZNahaasZ9K9fCpIefC03QWinxO3SooMmwHlllc06Jtf1RMEcQy8dDyeMsXIrsbbIzxS+xVgRMYks8WmlqV+e44C1eTyIht/qdsTtu4C7OB2YOXz/aKgQpRuHS3ohgfDa3cYoxBAnQmOvqotpFrTwVmD+BnkzmRHHmMOAHDgEsPtTjNY/eMItH+lUxtjsGAm9/J
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(6512007)(6486002)(36756003)(70206006)(70586007)(40460700003)(6506007)(4326008)(336012)(6862004)(508600001)(8676002)(33656002)(53546011)(47076005)(36860700001)(8936002)(81166007)(5660300002)(107886003)(316002)(82310400004)(54906003)(2616005)(2906002)(4744005)(186003)(86362001)(26005)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 14:56:02.6763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65199cf2-c2d0-4db3-75b2-08da05cac24f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7127

DQoNCj4gT24gOCBNYXIgMjAyMiwgYXQgMTk6NDYsIFZpa3JhbSBHYXJod2FsIDxmbnUudmlrcmFt
QHhpbGlueC5jb20+IHdyb3RlOg0KPiANCj4gUmVuYW1lIG92ZXJsYXlfZ2V0X3RhcmdldCgpIHRv
IGZkdF9vdmVybGF5X3RhcmdldF9vZmZzZXQoKSBhbmQgcmVtb3ZlIHN0YXRpYw0KPiBmdW5jdGlv
biB0eXBlLg0KPiANCj4gVGhpcyBpcyBkb25lIHRvIGdldCB0aGUgdGFyZ2V0IHBhdGggZm9yIHRo
ZSBvdmVybGF5IG5vZGVzIHdoaWNoIGlzIHZlcnkgdXNlZnVsDQo+IGluIG1hbnkgY2FzZXMuIEZv
ciBleGFtcGxlLCBYZW4gaHlwZXJ2aXNvciBuZWVkcyBpdCB3aGVuIGFwcGx5aW5nIG92ZXJsYXlz
DQo+IGJlY2F1c2UgWGVuIG5lZWRzIHRvIGRvIGZ1cnRoZXIgcHJvY2Vzc2luZyBvZiB0aGUgb3Zl
cmxheSBub2RlcywgZS5nLiBtYXBwaW5nIG9mDQo+IHJlc291cmNlcyhJUlFzIGFuZCBJT01NVXMp
IHRvIG90aGVyIFZNcywgY3JlYXRpb24gb2YgU01NVSBwYWdldGFibGVzLCBldGMuDQo+IA0KPiBU
aGlzIGNvbW1pdCBpcyBhbHNvIGFwcGxpZWQgdG8gZ2l0Oi8vZ2l0aHViLmNvbS9kZ2lic29uL2R0
YzoNCj4gICAgY29tbWl0OiBhZDljZjZiZGU1YjkwZDRjMWU1YTc5YTI4MDNlOThkNjM0NGMyN2Q3
Lg0KDQpIaSBWaWtyYW0sDQoNCnBsZWFzZSBjb3JyZWN0IG1lIGlmIEnigJltIHdyb25nLCBJ4oCZ
dmUgY2xvbmVkIHRoZSByZXBvc2l0b3J5IGFuZCBJIGZvdW5kIHlvdXIgY29tbWl0IHdpdGgNCnRo
aXMgU0hBOiA0NWYzZDFhMDk1ZGQzNDQwNTc4ZDVjNjMxM2ViYTU1NWE3OTFmM2ZiDQoNCkNoZWVy
cywNCkx1Y2E=

