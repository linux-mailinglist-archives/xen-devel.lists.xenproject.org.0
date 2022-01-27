Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E12F149DCCE
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 09:45:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261318.452320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD0PE-0004Be-LO; Thu, 27 Jan 2022 08:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261318.452320; Thu, 27 Jan 2022 08:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD0PE-00049l-HQ; Thu, 27 Jan 2022 08:45:24 +0000
Received: by outflank-mailman (input) for mailman id 261318;
 Thu, 27 Jan 2022 08:45:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xPLH=SL=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nD0PD-00049T-9G
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 08:45:23 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 766b9eff-7f4d-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 09:45:22 +0100 (CET)
Received: from AS9P194CA0024.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::29)
 by DBAPR08MB5845.eurprd08.prod.outlook.com (2603:10a6:10:1a5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 08:45:20 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::16) by AS9P194CA0024.outlook.office365.com
 (2603:10a6:20b:46d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Thu, 27 Jan 2022 08:45:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 08:45:19 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Thu, 27 Jan 2022 08:45:19 +0000
Received: from 9f831656d4c8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A681E2FC-53BF-4979-B85D-C32001752FD1.1; 
 Thu, 27 Jan 2022 08:45:14 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9f831656d4c8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Jan 2022 08:45:14 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB6PR0802MB2229.eurprd08.prod.outlook.com (2603:10a6:4:86::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 08:45:12 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0%7]) with mapi id 15.20.4909.017; Thu, 27 Jan 2022
 08:45:11 +0000
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
X-Inumbo-ID: 766b9eff-7f4d-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EpOza1ye61p1xaBFI78QEksFsXzc628vl2Cwh3thwo=;
 b=YdAOW0+I7caN1JV1bDz/2+r25SykVxQd6ZZxM+3+4ufHnzkGNfeLwL17s+WpEYMABAYQQD29lUeGC47tmEsmGgmsjGYJvTZnCI75qhsKd6tktb4DuaFMf7NHvmAyEOvfTjBuW+42DWCmfjFKa2vpDk3+fxSSp1jZM8jnL74uW1g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0PzyEg9ew72QbpOz7fEkqWRMUL/fOk4z91kJhlugPvWQ95d2eBsq8hzuUaho3qbucbkCCFWFm8XCVG4jA9faFd9WzJ4ce3nbdBNzHSuk9LDu1+fgxSqS6g69UV02NQXXO5VoKQFfhVe+pUmbMbi8aNBoDPI7L9nepJ088RfGAPsdQcrc2sAVNiB4+LU/p7O/BM6Ma1x+J6hfa/KVB5oONjkvATl+yeKWsKZBkupxVmD/kTmLk8L1ELHu1FqYNSoSPWGlFaFefKEV94BAgtlpvncvkcOUhUvLkLLJQYoEBM2PKMziRmI7fpOqcztr/LJkX0V8X9XxMhFbifazc3h9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EpOza1ye61p1xaBFI78QEksFsXzc628vl2Cwh3thwo=;
 b=QwMO7S/AlBAR4BKJDF2zUnvsFdtTDn5ApQuoBC1A7bRysBVoT8k6t3BEfVyjAy+L9+5s+nJ7TCXHBqOuGVWi5jjD/rMXdkbK1J1GXyu1DvXbM5xBdluB9rjdd82v21KVS4NGsvd3evAkZ9VJbqBKzI/idhClKD7h6QKixm78kFxSMgMvWIi1Qk3hmZjlK3DKJUfCYYyIMEyUeKLeu/KZAGZLvU+svMzNEhUoyB3TBXJOj61XupOqLiLooKPybEcFnDu/8hvRTRrn2alrs/GuesfBCwytESO7JJprMVq1ADBHInyykpVp2ZhGA/iKbejuiQV9+Lmr0ArNuTYkMrj7Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EpOza1ye61p1xaBFI78QEksFsXzc628vl2Cwh3thwo=;
 b=YdAOW0+I7caN1JV1bDz/2+r25SykVxQd6ZZxM+3+4ufHnzkGNfeLwL17s+WpEYMABAYQQD29lUeGC47tmEsmGgmsjGYJvTZnCI75qhsKd6tktb4DuaFMf7NHvmAyEOvfTjBuW+42DWCmfjFKa2vpDk3+fxSSp1jZM8jnL74uW1g=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [PATCH 21/37] xen/arm: Keep memory nodes in dtb for NUMA when
 boot from EFI
Thread-Topic: [PATCH 21/37] xen/arm: Keep memory nodes in dtb for NUMA when
 boot from EFI
Thread-Index: AQHXsHMrd58EkQofR0OqZuXsqMtGrKx0TpYAgAMEzTA=
Date: Thu, 27 Jan 2022 08:45:11 +0000
Message-ID:
 <PAXPR08MB742032F03C7326404437E9869E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-22-wei.chen@arm.com>
 <9424e908-2f86-d487-e02f-dc0cec4820e9@suse.com>
In-Reply-To: <9424e908-2f86-d487-e02f-dc0cec4820e9@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 2172FBDFD183E44F8D82DBE72A28BC10.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: bc26c446-58ba-4729-2633-08d9e171599b
x-ms-traffictypediagnostic:
	DB6PR0802MB2229:EE_|VE1EUR03FT049:EE_|DBAPR08MB5845:EE_
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB584586DE70F77828929B3A989E219@DBAPR08MB5845.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 iswfibRiPlh5aO2nNts9fMa4xn78M6dcNiXhYP1J30Kw1xjRjKXYkC6RvhUleZyRHp11nK3VE68aA7GY4yRvgoG4RLuD/c3ijPeQYyz9ctZiNipcFftAHs0drBwSzJoPRjUNaGIlA5zdfxhfOjEpj9RPwUTfFfn9P9Q1naXWGqTK/zlE8GWSNJJLFPHYNH8ipigHFNHXMhiUVyx3g4DUc1mRhy7CNMxZ/KiDhr85VTNUzr7BXYgeTPnLAeNHwnGzrHDvij+rgVp8bFpTcMOdkP/+UH2zx6hjbc4FQ7CxdF9J4S6Ld8K95pg3em4EyUI00QL2y0YrOqYxbH6v6fC+NQMsGw3ryLbzodEOqhpbj6oH9lQe72ckOTThZ7Dy7Or/pH7zWmkcmGw1ZjM3YqXj7b8mQTnEmdit/+psJ3B6A3TFURCCKFM3osmM8/ZLcJ1He2dCr6tEIaquB5+Rcg4uItklDUvPZR/Dz+vgydxRGnHXzK4qJrFSMugsCZtEIt4RXrtsDu5gq6v134ccyIEXIyVcMcLBjhiPKWwhu3D1prFOsWnJyVYmo419PEZn0VN5k8Js24RuUQ4iwswxmov8+V8n00MFbSawrvf4RPjog7WoCvDayi46YUBkF4H0WZ+tzwd56vRUczA/WICNPVK3cCiEDAfTVb5aHXP6jgNQMVwRF11Tq/jdA53V4jIb4+f2rOZjNKnfkJCwtOmB8pUy3Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(6506007)(54906003)(5660300002)(7696005)(508600001)(316002)(2906002)(52536014)(38100700002)(4744005)(26005)(186003)(6916009)(9686003)(83380400001)(33656002)(66446008)(66556008)(76116006)(66476007)(64756008)(4326008)(8676002)(8936002)(66946007)(122000001)(53546011)(55016003)(71200400001)(38070700005)(20210929001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2229
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b92ee877-deab-4284-8349-08d9e17154c9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	il1kgIiO+JAMh4qZ7PAYrdnZ7+e4cbbG5oqtQZoCYpeB1oH8JC+ZGLKiP00prgrduGjHrsxVH9gVo/7K+ob2liYtjiNMtJoEXc0JkINvjNjsDUrHUjvoIVzzwoFrubMeQ23DB3bCMRBR7ewgJ6S62qs7a1sdGEncA9nShOcTdNl7esF0XRDrHfJkZTH+eKlDPgPXm2ymFixnF0mVydgpjad8hEy1AM3V4NhXUx7JAN8BhCT6iBJl6IiSq+b5lZpBOlA55KOPJn0jdQRe0AjuBHoMw59IniwKIM1zLoiReCPVJiWpYdheZITYqe78DFpRBIg7L3YdY2277ay2N5Cglnw7HKsvTQ5zbAYThndREjpch73ttr5EtzAxSI5+yyYfJBj7dXDPfXGMAB7YUHU1nSPTPwLqYcdWrW5NxtxNRmLuU6NEI3nqPj1idM5r0IIapiXerabhsZzlm+7jgZaIM4G1ylxubCbtYX5YZlb5movAF9/pig6toA5MOwYbrRGtZLK+0/6uekxQroWQrDRwAqkZ30O1ZYSkl5/+Br4Zg4juQ/eiW7pd20g1Fb15jt6po9Bsmlizl95PgLHMYmStRpnmQc1Tfvy2cF3trxjxIgjtk/YEuomTMWJrM+XdMPs+A08Q3sPZ9gfWweEzL9Kkq59aowlApxusTGIJIIpOEvA4NNPN8e4xwY1xrkf60gBK
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(70586007)(6862004)(70206006)(8676002)(4326008)(33656002)(81166007)(82310400004)(8936002)(356005)(5660300002)(336012)(52536014)(55016003)(83380400001)(53546011)(2906002)(6506007)(7696005)(54906003)(86362001)(40460700003)(4744005)(186003)(26005)(36860700001)(508600001)(9686003)(47076005)(316002)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 08:45:19.9506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc26c446-58ba-4729-2633-08d9e171599b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5845

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDHmnIgyNeaXpSAxODozOQ0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlz
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDIxLzM3XSB4ZW4vYXJtOiBLZWVwIG1lbW9yeSBub2RlcyBpbiBkdGIgZm9y
IE5VTUEgd2hlbg0KPiBib290IGZyb20gRUZJDQo+IA0KPiBPbiAyMy4wOS4yMDIxIDE0OjAyLCBX
ZWkgQ2hlbiB3cm90ZToNCj4gPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vZWZpLmgNCj4gPiArKysg
Yi94ZW4vaW5jbHVkZS94ZW4vZWZpLmgNCj4gPiBAQCAtNDcsNiArNDcsMTMgQEAgaW50IGVmaV9y
dW50aW1lX2NhbGwoc3RydWN0IHhlbnBmX2VmaV9ydW50aW1lX2NhbGwgKik7DQo+ID4gIGludCBl
ZmlfY29tcGF0X2dldF9pbmZvKHVpbnQzMl90IGlkeCwgdW5pb24gY29tcGF0X3BmX2VmaV9pbmZv
ICopOw0KPiA+ICBpbnQgZWZpX2NvbXBhdF9ydW50aW1lX2NhbGwoc3RydWN0IGNvbXBhdF9wZl9l
ZmlfcnVudGltZV9jYWxsICopOw0KPiA+DQo+ID4gKyNlbHNlDQo+ID4gKw0KPiA+ICtzdGF0aWMg
aW5saW5lIGJvb2wgZWZpX2VuYWJsZWQodW5zaWduZWQgaW50IGZlYXR1cmUpDQo+ID4gK3sNCj4g
PiArICAgIHJldHVybiBmYWxzZTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgI2VuZGlmIC8qIENPTkZJ
R19FRkkqLw0KPiANCj4gQXMgYWxyZWFkeSBoaW50ZWQgYXQgZm9yIHRoZSBlYXJsaWVyIHBhdGNo
LCBJIHRoaW5rIHRoaXMgaHVuayB3YW50cw0KPiBtb3ZpbmcgYWhlYWQgaW4gdGhlIHNlcmllcy4N
Cg0KWWVzLCBJIHdpbGwgZG8gaXQuDQpUaGFua3MhDQoNCj4gDQo+IEphbg0KDQo=

