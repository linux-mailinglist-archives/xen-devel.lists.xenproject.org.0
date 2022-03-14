Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8846A4D8529
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 13:42:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290230.492169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTk1p-0000mV-Em; Mon, 14 Mar 2022 12:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290230.492169; Mon, 14 Mar 2022 12:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTk1p-0000jr-B4; Mon, 14 Mar 2022 12:42:25 +0000
Received: by outflank-mailman (input) for mailman id 290230;
 Mon, 14 Mar 2022 12:42:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J1jB=TZ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nTk1n-0000jl-9j
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 12:42:23 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20607.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30ea24d1-a394-11ec-8eba-a37418f5ba1a;
 Mon, 14 Mar 2022 13:42:21 +0100 (CET)
Received: from AM6PR08CA0017.eurprd08.prod.outlook.com (2603:10a6:20b:b2::29)
 by HE1PR0801MB2042.eurprd08.prod.outlook.com (2603:10a6:3:51::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Mon, 14 Mar
 2022 12:42:18 +0000
Received: from VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::66) by AM6PR08CA0017.outlook.office365.com
 (2603:10a6:20b:b2::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.20 via Frontend
 Transport; Mon, 14 Mar 2022 12:42:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT058.mail.protection.outlook.com (10.152.19.86) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Mon, 14 Mar 2022 12:42:17 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Mon, 14 Mar 2022 12:42:17 +0000
Received: from ad008974ef6b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0018B616-153F-4635-AE9F-A077899014BA.1; 
 Mon, 14 Mar 2022 12:42:06 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ad008974ef6b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Mar 2022 12:42:06 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by DB6PR0801MB1846.eurprd08.prod.outlook.com (2603:10a6:4:35::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Mon, 14 Mar
 2022 12:42:03 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008%7]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 12:42:03 +0000
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
X-Inumbo-ID: 30ea24d1-a394-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHcdCaGd8oyPvXE0Sr7we+zDitMGndsC7EB/+CgeQgI=;
 b=vOfaMG5LqmHWXcwy71Em1k4dcZW/DURrNuFCIQrHTW6btOG8uYNBFyvQkjfqXW71NrmCnwokcPKpT9+Ffgre+S1iabukyJuwIwbRNceg7RRzCYXveaiL9Ef8wCM0BaOm2t4MYRcPC8mtnW4fzXAZfkqo7YUeC2WbnayfIpgs+2o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: bb53414a3438cfdd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMFJFx3ys93fJquTK3J2sNzgzRVDRj2LQLcWdLF6v9NeUG+O0cUDrr3wPPDTH2Oj6VqugMRxhlDSEPX8y8Wz4cFbO37j8sJymppn7JGtLI95PlCiY/5+qOdyT3zhRLpF2jadr8aON3kYFy0i3eMicDJlvAeiZFocP0uzCO4O5TyBjiDJe6mlB3rcgIh/quc+mkZmbaAknQpY7d8F8VeCROIzKLsYfwXT5Evd2p1Bggug8fUCSHuL/7gFp/rPxtFTX31LWdYv1YP36zapS1JVgAP/ycNaZnPtveNR0C/bCQNhfjLkHmbwl7SiOfwy3mvmCP+HqQ0WQGAnLZ645sKgnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHcdCaGd8oyPvXE0Sr7we+zDitMGndsC7EB/+CgeQgI=;
 b=CpTIvRPZIruheVyGsj73VFuZBVUE3XDMjVCwBXCyRUrMGTcO5DcID/1MtmzAvU4X3z5VaW7LGRIaXsIzoh3V8sEL/TxGU+WxxzQMqqbi1h/O+TCyNO1/Ys/crlhvG77T9K6QBwi8KFG2R3kG8sEqE54sJCz/GSCDyyEzOt1v/oEWxMz5x8Ahc2qvlXKgrFfsk9plqlG3VDyc14yhkGUnqdrBjoeIFaQaU5I2kuiV+iqnzZoDWzeRk2lyThGtAsMqm/kUI3+WQIy6m0HzOI82InHVJBeA8GG4f2lmfV63UgChBj5M1fUyq84KNUV+genmwaqYocmGPS/0rSqFhBKMfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHcdCaGd8oyPvXE0Sr7we+zDitMGndsC7EB/+CgeQgI=;
 b=vOfaMG5LqmHWXcwy71Em1k4dcZW/DURrNuFCIQrHTW6btOG8uYNBFyvQkjfqXW71NrmCnwokcPKpT9+Ffgre+S1iabukyJuwIwbRNceg7RRzCYXveaiL9Ef8wCM0BaOm2t4MYRcPC8mtnW4fzXAZfkqo7YUeC2WbnayfIpgs+2o=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Vikram Garhwal <fnu.vikram@xilinx.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "volodymyr_babchuk@epam.com"
	<volodymyr_babchuk@epam.com>
Subject: Re: [XEN][RFC PATCH v3 02/14] xen/arm: Add CONFIG_OVERLAY_DTB
Thread-Topic: [XEN][RFC PATCH v3 02/14] xen/arm: Add CONFIG_OVERLAY_DTB
Thread-Index: AQHYMyVkQjjiWQv/5kKMcBJgNYO1iqy+24MA
Date: Mon, 14 Mar 2022 12:42:03 +0000
Message-ID: <80BF9536-1FFE-413E-90A9-FA4CF0A86FF2@arm.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
 <20220308194704.14061-3-fnu.vikram@xilinx.com>
In-Reply-To: <20220308194704.14061-3-fnu.vikram@xilinx.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: f697b9f0-d3d8-4de4-28d4-08da05b812e5
x-ms-traffictypediagnostic:
	DB6PR0801MB1846:EE_|VE1EUR03FT058:EE_|HE1PR0801MB2042:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0801MB204295601AF3E8B7865BA3C6E40F9@HE1PR0801MB2042.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yd2w1pDs6bkp/bvYTcX/d6lE2qfp8HmD/fBxtwtLMkg3JWZkgYKw0nrr58ySth7YkVOZaTso4lWccDmoz82ZgjSOUtt4qc9JWmB4ZPi8YXyWSZMMMwvRzzZGt0sXIRFVHfCjPHNOJOnwVf7RCOO0ljLQIjeaFSTfNUYFs+TxLUrbzUhhg8/vwEuykHjuWgC0k5AftXJo8kPtjYp16+giOKlKQ+S1UhJS3uaX4hjTc36jU2MfHTV/XccFRofIxzPSewyiK2VUr0MiA0YVUwNgdOelfeccEfcQIOuCdbJTqcQZ6s6NyEvcSLotOhFAtRDK7q9x1pfof86+uBR4NMRHRRN94qUhTMz/Uo+xTXGksSioruwNIr6LsAPgBogyWBKHa41lINYQpcxBU6dn35zyZ9IN6hAfNTo2yg9jNcNH3a5nR4/8v3PVNav4VnXEqHSGyx/5EkHBj4/0w42SLQdZ6TSKOn1pCTDp+H9V2/xNz6QSXAfIQRhnyTG9j37VeXXPgMqtf5LUtuSRjYW3b3P79T92BMtyGSgKCFfzKOGD/kpZNHZMGZnTpwt40u5HgMGlU2rag1uZ1Jc7bo+vOT8wWgqHTiiA5agdgmDP8aM73GRK0dA7GgF8VA14/yXoibvH0RjJUkYqO8CPCTzLnACRDJQKWEDmZDNPOXGOeJ0FA88tT0fHgA7NAhVf+7xkBsstuopt3drANhhklwRVII7GM/Yo6OHLXPhGP+2Yd83RRqs700/qpmvmMPu3/nY+XOGn
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(54906003)(6916009)(6512007)(316002)(122000001)(6506007)(53546011)(38100700002)(76116006)(64756008)(8676002)(6486002)(66446008)(91956017)(33656002)(66946007)(66556008)(66476007)(508600001)(71200400001)(86362001)(5660300002)(8936002)(36756003)(26005)(2616005)(2906002)(186003)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <61B24A84003FEC499B346E55E0E2CCC6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1846
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e7dfe598-1c22-49f9-c2f4-08da05b80a91
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aed2Q4hKSuPQJD4nX3ni+636/HbB0fSltoEGqmkhrNx4Scsc+Yf7gBNN6UIMuE2dOcq5HawOfTdv/6W8gVYbe+Ht79l+iJEzDWVgzbaJgHvHb6lxKIQOg7rC4fl8W4cCIfE7RAyGKy8oqOBJ2KS5Xn0Lm3I5fS0kx9nlwQamy9yB5ZhOvCEjhnoTEuy6UqPJHm+PWUlDaxcjXUHcgt33kkjZBlxhPo7xrP99EZH4Mv8JGUAwKv4/KuccjckaFpLqFbw1BlcDlrprNtTvrRuGsZ3NatMB2X7phBtublYTwvHFAFP/gEPHlYfYsCKmG0Y14wBgYDnc7PsxrthE8dfyiM8YxOPn9ZoCE99KxXYzI8HebeAq+5SYfEHLHR3BinDDNdEyublQbvWqGBmezWMBZJIpLd/kJ8A0oUzMC5AnSxVZK2jpZ+XzQAcjVZ0QJVvqL6mazVzxn70ywwG+A6TpYmnvZmS45DzQHL+ernZFw3VhZ/+AslfuG1r2xnVYKptepOK5ssq5t3mIFBvZQIORq6Q6+LXpzT3Lw+eTPlQqyAE/ccv3177fsQL/mvdvR75RK+CztUCKogTpA1hlG3426FF5SAQBfvi9lJQr7cNrXGaC0ostW69aQNwq8oPvqSDOQ4mWTQTNFUWazAZkb9wDo7tVm5RRll6yG6uf9KiM3UDPpUsz13XMUNjRDeNz0rBL
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(316002)(2906002)(86362001)(36860700001)(40460700003)(47076005)(4326008)(6862004)(8676002)(82310400004)(107886003)(70206006)(70586007)(6506007)(53546011)(508600001)(8936002)(2616005)(356005)(6512007)(54906003)(336012)(6486002)(36756003)(33656002)(26005)(5660300002)(186003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 12:42:17.4538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f697b9f0-d3d8-4de4-28d4-08da05b812e5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2042

DQoNCj4gT24gOCBNYXIgMjAyMiwgYXQgMTk6NDYsIFZpa3JhbSBHYXJod2FsIDxmbnUudmlrcmFt
QHhpbGlueC5jb20+IHdyb3RlOg0KPiANCj4gSW50cm9kdWNlIGEgY29uZmlnIG9wdGlvbiB3aGVy
ZSB0aGUgdXNlciBjYW4gZW5hYmxlIHN1cHBvcnQgZm9yIGFkZGluZy9yZW1vdmluZw0KPiBkZXZp
Y2UgdHJlZSBub2RlcyB1c2luZyBhIGRldmljZSB0cmVlIGJpbmFyeSBvdmVybGF5Lg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogVmlrcmFtIEdhcmh3YWwgPGZudS52aWtyYW1AeGlsaW54LmNvbT4NCj4g
LS0tDQo+IHhlbi9hcmNoL2FybS9LY29uZmlnIHwgNiArKysrKysNCj4gMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9LY29uZmln
IGIveGVuL2FyY2gvYXJtL0tjb25maWcNCj4gaW5kZXggZWNmYTY4MjJlNC4uMDE1OWZiZTI3YSAx
MDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJtL0tjb25maWcNCj4gKysrIGIveGVuL2FyY2gvYXJt
L0tjb25maWcNCj4gQEAgLTQ2LDYgKzQ2LDEyIEBAIGNvbmZpZyBIQVNfSVRTDQo+ICAgICAgICAg
Ym9vbCAiR0lDdjMgSVRTIE1TSSBjb250cm9sbGVyIHN1cHBvcnQgKFVOU1VQUE9SVEVEKSIgaWYg
VU5TVVBQT1JURUQNCj4gICAgICAgICBkZXBlbmRzIG9uIEdJQ1YzICYmICFORVdfVkdJQw0KPiAN
Cj4gK2NvbmZpZyBPVkVSTEFZX0RUQg0KPiArICAgIGJvb2wgIkRUQiBvdmVybGF5IHN1cHBvcnQg
KFVOU1VQUE9SVEVEKSIgaWYgVU5TVVBQT1JURUQNCj4gKyAgICAtLS1oZWxwLS0tDQo+ICsNCj4g
KyAgICBEeW5hbWljIGFkZGl0aW9uL3JlbW92YWwgb2YgWGVuIGRldmljZSB0cmVlIG5vZGVzIHVz
aW5nIGEgZHRiby4NCj4gKw0KDQpNYW55IHJlY2VudHMgZW50cmllcyBpbiB0aGlzIGZpbGUgdXNl
cyBhIGRpZmZlcmVudCBzdHlsZSBmcm9tIHRoaXMgb25lLCB1c2luZyDigJxoZWxw4oCdIGluc3Rl
YWQgb2YNCuKAnOKAlGhlbHDigJTigJwgYW5kIG9taXR0aW5nIHRoZSBibGFuayBsaW5lLCBJIHdv
dWxkIGNvbnRpbnVlIHRvIHVzZSB0aGUgbW9yZSByZWNlbnQgc3R5bGUgaWYgbm8NCm9uZSBvYmpl
Y3Qgd2l0aCBpdA0KDQpDaGVlcnMsDQpMdWNhDQoNCj4gY29uZmlnIEhWTQ0KPiAgICAgICAgIGRl
Zl9ib29sIHkNCj4gDQo+IC0tIA0KPiAyLjE3LjENCj4gDQo+IA0KDQo=

