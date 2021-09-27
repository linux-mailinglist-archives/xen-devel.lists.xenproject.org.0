Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E461418F71
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 08:53:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196344.349145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUkW2-0000Eu-Oy; Mon, 27 Sep 2021 06:53:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196344.349145; Mon, 27 Sep 2021 06:53:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUkW2-0000D1-Kh; Mon, 27 Sep 2021 06:53:30 +0000
Received: by outflank-mailman (input) for mailman id 196344;
 Mon, 27 Sep 2021 06:53:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xxNw=OR=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mUkW0-0000Cv-MN
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 06:53:28 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.51]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d45bbb8-1f5f-11ec-bc42-12813bfff9fa;
 Mon, 27 Sep 2021 06:53:26 +0000 (UTC)
Received: from DU2PR04CA0086.eurprd04.prod.outlook.com (2603:10a6:10:232::31)
 by DB6PR0802MB2165.eurprd08.prod.outlook.com (2603:10a6:4:86::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Mon, 27 Sep
 2021 06:53:24 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::30) by DU2PR04CA0086.outlook.office365.com
 (2603:10a6:10:232::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Mon, 27 Sep 2021 06:53:24 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by DB5EUR03FT003.mail.protection.outlook.com (10.152.20.157) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 06:53:24 +0000
Received: ("Tessian outbound b324a1dbd9be:v103");
 Mon, 27 Sep 2021 06:53:24 +0000
Received: from 225e26587021.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5FAE5026-D7F1-4D65-A62F-613251D87655.1; 
 Mon, 27 Sep 2021 06:53:13 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 225e26587021.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 27 Sep 2021 06:53:13 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB5898.eurprd08.prod.outlook.com (2603:10a6:10:20c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Mon, 27 Sep
 2021 06:53:10 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 06:53:10 +0000
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
X-Inumbo-ID: 9d45bbb8-1f5f-11ec-bc42-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y69604WGFM8RocY7M+WTze36g7EYSACfEaBY0trGQs4=;
 b=yMU4mseWn5T0FfTzZXJGPYLrzWSbUt8l2F9mRmEOE59k+/aHR+WIbMr/IJ9uFqXlBDNWd5j308RDeG4/0Wv2y7BQ/iAzCtJd7v7Hxx9vE4UZigENZew7ngvxI6nNR7J6ZfqKL+aNFWxkOpWExgIlzfqmxPk14fuCgALgrZL9KkE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpDudCo7r1DdSFLpzNXr6XtHTgtP4yk2GQvYFGf8QXpmM0VExh3oTMMhmPIs5TU54tANp6EZTIITgVcI68n9tE3if/Hf3uOPziMOISc3Zj/idef6YxUESaLIDzawLpxriyPPSQQbZZOuIMJyixQRAcOZKI5q7I2EDZuEKVikKxnmH3iU744NGkGauOmhlqn6VKG4uVCWsgBy+quu2EGZPWJEDV/CFM9tfRXXrxEn6sXx8Gep1QxIWGmKicbPCu+4pC/Eytb41tHDW4+URVibNxsxAUY4p7odskWeNoBgbdxQHiY/ylMho8BJxldu/c1+M5ov/1xCUkCiljBrnFw26w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Y69604WGFM8RocY7M+WTze36g7EYSACfEaBY0trGQs4=;
 b=CvJtZRVdjKM1z0vPRkoxblaT0xP5mRG3SSBHQJbB9FOCdvgKRjBSnvBTOGvWwHf3lkIhBX9CAZslRNfCJ7sqLcNKAZMyrfh4wMk6Ydc5CZTaJMwNY0lPUpnPDSMVEHrU7N94wh4PMuepAAJ+rLE0AJLqPHlDzAhwAetLW7wy8eeyUJzfY33phjrM2sM+hgL1xyIhUZW1qliVX7hqIKatHs4RXgPM+Yql8vGJ6nmo4If3VjhCsrD4zh26qI1Ve+f9fIhe3tjV6lXYXFwuYzolaa9f9rVJGIf/lc7TFr8iI0VB3p0NH151PEi64P9sivOX2VBGysWMNPNqatQWK0ud4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y69604WGFM8RocY7M+WTze36g7EYSACfEaBY0trGQs4=;
 b=yMU4mseWn5T0FfTzZXJGPYLrzWSbUt8l2F9mRmEOE59k+/aHR+WIbMr/IJ9uFqXlBDNWd5j308RDeG4/0Wv2y7BQ/iAzCtJd7v7Hxx9vE4UZigENZew7ngvxI6nNR7J6ZfqKL+aNFWxkOpWExgIlzfqmxPk14fuCgALgrZL9KkE=
From: Wei Chen <Wei.Chen@arm.com>
To: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>
Subject: RE: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override default
 NR_NODE_MEMBLKS
Thread-Topic: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override default
 NR_NODE_MEMBLKS
Thread-Index:
 AQHXsHMrRDdmLUiNMk+huFUWk4EjYquyZ70AgAPY1CCAAP08AIAADO8QgAANUgCAABvh0IAAAsXQ
Date: Mon, 27 Sep 2021 06:53:10 +0000
Message-ID:
 <DB9PR08MB685744B09307DFCA38C0635C9EA79@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-23-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231828310.17979@sstabellini-ThinkPad-T480s>
 <DB9PR08MB685744A06D7C014DAE9BE73F9EA69@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2109262021200.5022@sstabellini-ThinkPad-T480s>
 <DB9PR08MB6857AD295D692F962AD76C219EA79@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2109262123140.5022@sstabellini-ThinkPad-T480s>
 <DB9PR08MB6857603316C2C808BAD8CD709EA79@DB9PR08MB6857.eurprd08.prod.outlook.com>
In-Reply-To:
 <DB9PR08MB6857603316C2C808BAD8CD709EA79@DB9PR08MB6857.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 972622BF6888314E89591205416934EB.0
x-checkrecipientchecked: true
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 2dd6fee6-2287-46e7-c71d-08d98183805d
x-ms-traffictypediagnostic: DBBPR08MB5898:|DB6PR0802MB2165:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB21651D137E5D16488E631A369EA79@DB6PR0802MB2165.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GhHGJnnjynD/yVRMIgql/cTmM1WMMvbx7GK/2bvA7JrEuq3vRxkWAIpqJvy32zkFiL60Gb7ZDbwETgMpyraykyNXBYLUgg0LT4Q1ttzIUqexh5C4EUvWfUqWL2cm9Q8yTban9gurOiINzTerIf2IS05gwIDbDbXuSSFhwZMeDjkkozK6WdvBm9FBx0CUI4Moxu7Cq+BSv0t0ymXKqPP5p185GoP2NvI9fLdKStIuOb8iO770uED2Kfbmn96jjSQPC2p+39eO57ybgBrxWbhLXWxT8c3zwrIIWL2MtdmLQG/OpC4knAmG408iGFEQHUOpMUUmetHdPfq9JoA1BpD55ailcXmW67yYseB58+7A5aMFmIW8skuSAgxSu+k8RQPsWRJPtWpoKz28Rj05M1fUrSvbugalejwXMvMKrVNFiRhRviuAsrVd0wRZ7L8GBFMkGBgM8iX87SVTOj2v2fZQeMw8xPn4ZqF8jdvAY0UQ+RdoTTmTY4YvIQjPeI+qkwFQjsKTI2uxoZkm7rocD40KGRV4WXYRD9hJQMJ01a/M1cuQva20jwmVq//pz0zj8AqJUKg5K/C00BOkAgiyeX8NZ2YA34zL7z1qVbx21whxG2lSkz8zsBQsJkDGCgRy11Rid3vrO5wPL+6trlTKDE9bbqvXsOVnKAoBD69tv3Ehh6RF0fyVALBFvfWmNM14WvotkEgrW2sruO3I7xBUI1V0DjgGPAPp6bAP004zYhheDBmaaVH97a7YhLg0KkO1CCya8yMapDD1jOv7qYKTriS42SX6YXiyK7VxE4OA2WFqSlI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2940100002)(33656002)(316002)(71200400001)(66946007)(186003)(66476007)(66556008)(508600001)(76116006)(7696005)(5660300002)(64756008)(52536014)(66446008)(110136005)(4326008)(966005)(54906003)(86362001)(83380400001)(38070700005)(2906002)(9686003)(6506007)(26005)(122000001)(53546011)(55016002)(8676002)(38100700002)(8936002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5898
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b1981227-ffd9-4108-3daa-08d98183780b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c/XXIJYNC9eY8t1/6j99HaO6OkiOwKEBNcHCOfsCUPawgO3ji/c14/IPIdROTAZEHBVWqBTmIkEeF/5BuAjYTs4SOqZtjrv2MOip9WX3yXi0g24JVZRkzwJYQXMk6kW62XqWPvGawhfpGBheexstjvw0+1c2t5vLvTdzbEAWYqSow9YJSuWrpR1tp15k8OpkKAFAVx0f77wo+mzCd2QfWD0AlI2R+KNgVU7KpsGxGJ+XpSH9O9GMA6btDZ+ALE9UkPxbTwrlTG6qAdBbbtnajGe9/gJZFMtoPzd+TtOFNLW71/5xS8PLOWgWeUC1brYLgVVrZF8KQpo3bUVoVoXxF4Tm5zaAVSi3AohEOWhN3qlvET0rn+brn1F139gP0NIShvSHOqmRDh0IKG1tQTCnGctjC53tFYmgST01/P2E7rXKk3AKl3YoGqAH+Wccu58j08kbCn4b71PDyRc0jhRtmjyy9jPUpBmrvYUNkGoo8PcHUUMOZNt8Fu46xlkVJ6qa8l2sjstezkzIqY9+qQYrUVC2tQs3u5HtOyHBnv5QqvckNNkQf8mKa35nXQpo4si+TyjioCa0zGLdOdEwFIv5VNPhWp8XTQN/EWUqWLQY1zUNnratRcDha/9B/y5COThUDsFTbzcmnaFOMwTi0ecFs4ItRmWE2qdPmYPuyobWZ4vepTUHu0EJvPEEyOaaF1pg0XdN12VJFANmeY4BMdxu1bPpEmyG98t0JRpi599kN6ql4Yfg4dB6CR0u5o6Bpoz0hqQXld4yDQQiqvj56XKj2LwSWuz/IjEmtGo2pIvMlwQ=
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70206006)(966005)(316002)(86362001)(508600001)(52536014)(33656002)(4326008)(70586007)(356005)(8936002)(110136005)(5660300002)(54906003)(107886003)(53546011)(47076005)(83380400001)(81166007)(9686003)(82310400003)(2940100002)(26005)(6506007)(336012)(186003)(7696005)(36860700001)(8676002)(55016002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 06:53:24.3894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd6fee6-2287-46e7-c71d-08d98183805d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2165

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFhlbi1k
ZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBP
ZiBXZWkNCj4gQ2hlbg0KPiBTZW50OiAyMDIx5bm0OeaciDI35pelIDE0OjQ2DQo+IFRvOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IENjOiB4ZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmc7IGp1bGllbkB4ZW4ub3JnOyBCZXJ0cmFuZCBNYXJxdWlzDQo+
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBqYmV1bGljaEBzdXNlLmNvbTsgcm9nZXIucGF1
QGNpdHJpeC5jb207DQo+IGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20NCj4gU3ViamVjdDogUkU6
IFtQQVRDSCAyMi8zN10geGVuL2FybTogdXNlIE5SX01FTV9CQU5LUyB0byBvdmVycmlkZSBkZWZh
dWx0DQo+IE5SX05PREVfTUVNQkxLUw0KPiANCj4gSGkgU3RlZmFubywgSnVsaWVuLA0KPiANCj4g
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gPiBTZW50OiAyMDIx5bm0OeaciDI35pelIDEz
OjAwDQo+ID4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPg0KPiA+IENjOiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4ZW4tDQo+ID4gZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmc7IGp1bGllbkB4ZW4ub3JnOyBCZXJ0cmFuZCBNYXJxdWlzDQo+ID4g
PEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IGpiZXVsaWNoQHN1c2UuY29tOyByb2dlci5wYXVA
Y2l0cml4LmNvbTsNCj4gPiBhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tDQo+ID4gU3ViamVjdDog
UkU6IFtQQVRDSCAyMi8zN10geGVuL2FybTogdXNlIE5SX01FTV9CQU5LUyB0byBvdmVycmlkZSBk
ZWZhdWx0DQo+ID4gTlJfTk9ERV9NRU1CTEtTDQo+ID4NCj4gPiAreDg2IG1haW50YWluZXJzDQo+
ID4NCj4gPiBPbiBNb24sIDI3IFNlcCAyMDIxLCBXZWkgQ2hlbiB3cm90ZToNCj4gPiA+ID4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4gRnJvbTogU3RlZmFubyBTdGFiZWxsaW5p
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiA+ID4gPiBTZW50OiAyMDIx5bm0OeaciDI35pel
IDExOjI2DQo+ID4gPiA+IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gPiA+ID4g
Q2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IHhlbi0NCj4g
PiA+ID4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IGp1bGllbkB4ZW4ub3JnOyBCZXJ0cmFu
ZCBNYXJxdWlzDQo+ID4gPiA+IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+DQo+ID4gPiA+IFN1
YmplY3Q6IFJFOiBbUEFUQ0ggMjIvMzddIHhlbi9hcm06IHVzZSBOUl9NRU1fQkFOS1MgdG8gb3Zl
cnJpZGUNCj4gPiBkZWZhdWx0DQo+ID4gPiA+IE5SX05PREVfTUVNQkxLUw0KPiA+ID4gPg0KPiA+
ID4gPiBPbiBTdW4sIDI2IFNlcCAyMDIxLCBXZWkgQ2hlbiB3cm90ZToNCj4gPiA+ID4gPiA+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+ID4gPiBGcm9tOiBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+ID4gPiA+ID4gPiBTZW50OiAyMDIx5bm0
OeaciDI05pelIDk6MzUNCj4gPiA+ID4gPiA+IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNv
bT4NCj4gPiA+ID4gPiA+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc7DQo+ID4gPiA+IGp1bGllbkB4ZW4ub3JnOw0KPiA+ID4gPiA+ID4g
QmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPiA+ID4gPiA+ID4g
U3ViamVjdDogUmU6IFtQQVRDSCAyMi8zN10geGVuL2FybTogdXNlIE5SX01FTV9CQU5LUyB0byBv
dmVycmlkZQ0KPiA+ID4gPiBkZWZhdWx0DQo+ID4gPiA+ID4gPiBOUl9OT0RFX01FTUJMS1MNCj4g
PiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBPbiBUaHUsIDIzIFNlcCAyMDIxLCBXZWkgQ2hlbiB3cm90
ZToNCj4gPiA+ID4gPiA+ID4gQXMgYSBtZW1vcnkgcmFuZ2UgZGVzY3JpYmVkIGluIGRldmljZSB0
cmVlIGNhbm5vdCBiZSBzcGxpdA0KPiA+IGFjcm9zcw0KPiA+ID4gPiA+ID4gPiBtdWx0aXBsZSBu
b2Rlcy4gU28gd2UgZGVmaW5lIE5SX05PREVfTUVNQkxLUyBhcyBOUl9NRU1fQkFOS1MNCj4gaW4N
Cj4gPiA+ID4gPiA+ID4gYXJjaCBoZWFkZXIuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gVGhp
cyBzdGF0ZW1lbnQgaXMgdHJ1ZSBidXQgd2hhdCBpcyB0aGUgZ29hbCBvZiB0aGlzIHBhdGNoPyBJ
cyBpdA0KPiA+IHRvDQo+ID4gPiA+ID4gPiByZWR1Y2UgY29kZSBzaXplIGFuZCBtZW1vcnkgY29u
c3VtcHRpb24/DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gTm8sIHdoZW4gSnVs
aWVuIGFuZCBJIGRpc2N1c3NlZCB0aGlzIGluIGxhc3QgdmVyc2lvblsxXSwgd2UgaGFkbid0DQo+
ID4gPiA+IHRob3VnaHQNCj4gPiA+ID4gPiBzbyBkZWVwbHkuIFdlIGp1c3QgdGhvdWdodCBhIG1l
bW9yeSByYW5nZSBkZXNjcmliZWQgaW4gRFQgY2Fubm90DQo+IGJlDQo+ID4gPiA+IHNwbGl0DQo+
ID4gPiA+ID4gYWNyb3NzIG11bHRpcGxlIG5vZGVzLiBTbyBOUl9NRU1fQkFOS1Mgc2hvdWxkIGJl
IGVxdWFsIHRvDQo+ID4gTlJfTUVNX0JBTktTLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDIxLQ0KPiA+
ID4gPiAwOC9tc2cwMDk3NC5odG1sDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEkgYW0gYXNraW5n
IGJlY2F1c2UgTlJfTUVNX0JBTktTIGlzIDEyOCBhbmQNCj4gPiA+ID4gPiA+IE5SX05PREVfTUVN
QkxLUz0yKk1BWF9OVU1OT0RFUyB3aGljaCBpcyA2NCBieSBkZWZhdWx0IHNvIGFnYWluDQo+ID4g
PiA+ID4gPiBOUl9OT0RFX01FTUJMS1MgaXMgMTI4IGJlZm9yZSB0aGlzIHBhdGNoLg0KPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+IEluIG90aGVyIHdvcmRzLCB0aGlzIHBhdGNoIGFsb25lIGRvZXNu
J3QgbWFrZSBhbnkgZGlmZmVyZW5jZTsgYXQNCj4gPiBsZWFzdA0KPiA+ID4gPiA+ID4gZG9lc24n
dCBtYWtlIGFueSBkaWZmZXJlbmNlIHVubGVzcyBDT05GSUdfTlJfTlVNQV9OT0RFUyBpcw0KPiA+
IGluY3JlYXNlZC4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBTbywgaXMgdGhlIGdvYWwgdG8g
cmVkdWNlIG1lbW9yeSB1c2FnZSB3aGVuIENPTkZJR19OUl9OVU1BX05PREVTDQo+ID4gaXMNCj4g
PiA+ID4gPiA+IGhpZ2hlciB0aGFuIDY0Pw0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4g
PiA+IEkgYWxzbyB0aG91Z2h0IGFib3V0IHRoaXMgcHJvYmxlbSB3aGVuIEkgd2FzIHdyaXRpbmcg
dGhpcyBwYXRjaC4NCj4gPiA+ID4gPiBDT05GSUdfTlJfTlVNQV9OT0RFUyBpcyBpbmNyZWFzaW5n
LCBidXQgTlJfTUVNX0JBTktTIGlzIGEgZml4ZWQNCj4gPiA+ID4gPiB2YWx1ZSwgdGhlbiBOUl9N
RU1fQkFOS1MgY2FuIGJlIHNtYWxsZXIgdGhhbiBDT05GSUdfTlJfTlVNQV9OT0RFUw0KPiA+ID4g
PiA+IGF0IG9uZSBwb2ludC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEJ1dCBJIGFncmVlIHdpdGgg
SnVsaWVuJ3Mgc3VnZ2VzdGlvbiwgTlJfTUVNX0JBTktTIGFuZA0KPiA+IE5SX05PREVfTUVNQkxL
Uw0KPiA+ID4gPiA+IG11c3QgYmUgYXdhcmUgb2YgZWFjaCBvdGhlci4gSSBoYWQgdGhvdWdodCB0
byBhZGQgc29tZSBBU1NFUlQNCj4gY2hlY2ssDQo+ID4gPiA+ID4gYnV0IEkgZG9uJ3Qga25vdyBo
b3cgdG8gZG8gaXQgYmV0dGVyLiBTbyBJIHBvc3QgdGhpcyBwYXRjaCBmb3INCj4gbW9yZQ0KPiA+
ID4gPiA+IHN1Z2dlc3Rpb24uDQo+ID4gPiA+DQo+ID4gPiA+IE9LLiBJbiB0aGF0IGNhc2UgSSdk
IHNheSB0byBnZXQgcmlkIG9mIHRoZSBwcmV2aW91cyBkZWZpbml0aW9uIG9mDQo+ID4gPiA+IE5S
X05PREVfTUVNQkxLUyBhcyBpdCBpcyBwcm9iYWJseSBub3QgbmVjZXNzYXJ5LCBzZWUgYmVsb3cu
DQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBB
bmQga2VlcCBkZWZhdWx0IE5SX05PREVfTUVNQkxLUyBpbiBjb21tb24gaGVhZGVyDQo+ID4gPiA+
ID4gPiA+IGZvciB0aG9zZSBhcmNoaXRlY3R1cmVzIE5VTUEgaXMgZGlzYWJsZWQuDQo+ID4gPiA+
ID4gPg0KPiA+ID4gPiA+ID4gVGhpcyBsYXN0IHNlbnRlbmNlIGlzIG5vdCBhY2N1cmF0ZTogb24g
eDg2IE5VTUEgaXMgZW5hYmxlZCBhbmQNCj4gPiA+ID4gPiA+IE5SX05PREVfTUVNQkxLUyBpcyBz
dGlsbCBkZWZpbmVkIGluIHhlbi9pbmNsdWRlL3hlbi9udW1hLmgNCj4gKHRoZXJlDQo+ID4gaXMN
Cj4gPiA+ID4gbm8NCj4gPiA+ID4gPiA+IHg4NiBkZWZpbml0aW9uIG9mIGl0KQ0KPiA+ID4gPiA+
ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFllcy4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+
ID4gPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ID4gPiAgeGVuL2luY2x1ZGUvYXNtLWFybS9udW1h
LmggfCA4ICsrKysrKystDQo+ID4gPiA+ID4gPiA+ICB4ZW4vaW5jbHVkZS94ZW4vbnVtYS5oICAg
ICB8IDIgKysNCj4gPiA+ID4gPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS9hc20tYXJtL251bWEuaCBiL3hlbi9pbmNsdWRlL2FzbS0NCj4gPiBhcm0v
bnVtYS5oDQo+ID4gPiA+ID4gPiA+IGluZGV4IDhmMWM2N2UzZWIuLjIxNTY5ZTYzNGIgMTAwNjQ0
DQo+ID4gPiA+ID4gPiA+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5oDQo+ID4gPiA+
ID4gPiA+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5oDQo+ID4gPiA+ID4gPiA+IEBA
IC0zLDkgKzMsMTUgQEANCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gICNpbmNsdWRlIDx4
ZW4vbW0uaD4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gKyNpbmNsdWRlIDxhc20vc2V0
dXAuaD4NCj4gPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gPiAgdHlwZWRlZiB1OCBub2RlaWRf
dDsNCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gLSNpZm5kZWYgQ09ORklHX05VTUENCj4g
PiA+ID4gPiA+ID4gKyNpZmRlZiBDT05GSUdfTlVNQQ0KPiA+ID4gPiA+ID4gPiArDQo+ID4gPiA+
ID4gPiA+ICsjZGVmaW5lIE5SX05PREVfTUVNQkxLUyBOUl9NRU1fQkFOS1MNCj4gPiA+ID4gPiA+
ID4gKw0KPiA+ID4gPiA+ID4gPiArI2Vsc2UNCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4g
IC8qIEZha2Ugb25lIG5vZGUgZm9yIG5vdy4gU2VlIGFsc28gbm9kZV9vbmxpbmVfbWFwLiAqLw0K
PiA+ID4gPiA+ID4gPiAgI2RlZmluZSBjcHVfdG9fbm9kZShjcHUpIDANCj4gPiA+ID4gPiA+ID4g
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9udW1hLmggYi94ZW4vaW5jbHVkZS94ZW4vbnVt
YS5oDQo+ID4gPiA+ID4gPiA+IGluZGV4IDE5NzhlMmJlMWIuLjE3MzFlMWNjNmIgMTAwNjQ0DQo+
ID4gPiA+ID4gPiA+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9udW1hLmgNCj4gPiA+ID4gPiA+ID4g
KysrIGIveGVuL2luY2x1ZGUveGVuL251bWEuaA0KPiA+ID4gPiA+ID4gPiBAQCAtMTIsNyArMTIs
OSBAQA0KPiA+ID4gPiA+ID4gPiAgI2RlZmluZSBNQVhfTlVNTk9ERVMgICAgMQ0KPiA+ID4gPiA+
ID4gPiAgI2VuZGlmDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ICsjaWZuZGVmIE5SX05P
REVfTUVNQkxLUw0KPiA+ID4gPiA+ID4gPiAgI2RlZmluZSBOUl9OT0RFX01FTUJMS1MgKE1BWF9O
VU1OT0RFUyoyKQ0KPiA+ID4gPiA+ID4gPiArI2VuZGlmDQo+ID4gPiA+DQo+ID4gPiA+IFRoaXMg
b25lIHdlIGNhbiByZW1vdmUgaXQgY29tcGxldGVseSByaWdodD8NCj4gPiA+DQo+ID4gPiBIb3cg
YWJvdXQgZGVmaW5lIE5SX01FTV9CQU5LUyB0bzoNCj4gPiA+ICNpZmRlZiBDT05GSUdfTlJfTlVN
QV9OT0RFUw0KPiA+ID4gI2RlZmluZSBOUl9NRU1fQkFOS1MgKENPTkZJR19OUl9OVU1BX05PREVT
ICogMikNCj4gPiA+ICNlbHNlDQo+ID4gPiAjZGVmaW5lIE5SX01FTV9CQU5LUyAxMjgNCj4gPiA+
ICNlbmRpZg0KPiA+ID4gZm9yIGJvdGggeDg2IGFuZCBBcm0uIEZvciB0aG9zZSBhcmNoaXRlY3R1
cmVzIGRvIG5vdCBzdXBwb3J0IG9yIGVuYWJsZQ0KPiA+ID4gTlVNQSwgdGhleSBjYW4gc3RpbGwg
dXNlICJOUl9NRU1fQkFOS1MgMTI4Ii4gQW5kIHJlcGxhY2UgYWxsDQo+ID4gTlJfTk9ERV9NRU1C
TEtTDQo+ID4gPiBpbiBOVU1BIGNvZGUgdG8gTlJfTUVNX0JBTktTIHRvIHJlbW92ZSBOUl9OT0RF
X01FTUJMS1MgY29tcGxldGVseS4NCj4gPiA+IEluIHRoaXMgY2FzZSwgTlJfTUVNX0JBTktTIGNh
biBiZSBhd2FyZSBvZiB0aGUgY2hhbmdlcyBvZg0KPiA+IENPTkZJR19OUl9OVU1BX05PREVTLg0K
PiA+DQo+ID4geDg2IGRvZXNuJ3QgaGF2ZSBOUl9NRU1fQkFOS1MgYXMgZmFyIGFzIEkgY2FuIHRl
bGwuIEkgZ3Vlc3MgeW91IGFsc28NCj4gPiBtZWFudCB0byByZW5hbWUgTlJfTk9ERV9NRU1CTEtT
IHRvIE5SX01FTV9CQU5LUz8NCj4gPg0KPiANCj4gWWVzLg0KPiANCj4gPiBCdXQgTlJfTUVNX0JB
TktTIGlzIG5vdCBkaXJlY3RseSByZWxhdGVkIHRvIENPTkZJR19OUl9OVU1BX05PREVTIGJlY2F1
c2UNCj4gPiB0aGVyZSBjYW4gYmUgbWFueSBtZW1vcnkgYmFua3MgZm9yIGVhY2ggbnVtYSBub2Rl
LCBjZXJ0YWlubHkgbW9yZSB0aGFuDQo+ID4gMi4gVGhlIGV4aXN0aW5nIGRlZmluaXRpb24gb24g
eDg2Og0KPiA+DQo+ID4gI2RlZmluZSBOUl9OT0RFX01FTUJMS1MgKE1BWF9OVU1OT0RFUyoyKQ0K
PiA+DQo+ID4gRG9lc24ndCBtYWtlIGEgbG90IG9mIHNlbnNlIHRvIG1lLiBXYXMgaXQganVzdCBh
biBhcmJpdHJhcnkgbGltaXQgZm9yDQo+ID4gdGhlIGxhY2sgb2YgYSBiZXR0ZXIgd2F5IHRvIHNl
dCBhIG1heGltdW0/DQo+ID4NCj4gDQo+IEF0IHRoYXQgdGltZSwgdGhpcyB3YXMgcHJvYmFibHkg
dGhlIG1vc3QgY29zdC1lZmZlY3RpdmUgYXBwcm9hY2guDQo+IEVub3VnaCBhbmQgZWFzeS4gQnV0
LCBpZiBtb3JlIG5vZGVzIG5lZWQgdG8gYmUgc3VwcG9ydGVkIGluIHRoZQ0KPiBmdXR1cmUsIGl0
IG1heSBicmluZyBtb3JlIG1lbW9yeSBibG9ja3MuIEFuZCB0aGlzIG1heGltdW0gdmFsdWUNCj4g
bWlnaHQgbm90IGFwcGx5LiBUaGUgbWF4aW11bSBtYXkgbmVlZCB0byBzdXBwb3J0IGR5bmFtaWMg
ZXh0ZW5zaW9uLg0KPiANCj4gPg0KPiA+IE9uIHRoZSBvdGhlciBoYW5kLCBOUl9NRU1fQkFOS1Mg
YW5kIE5SX05PREVfTUVNQkxLUyBzZWVtIHRvIGJlIHJlbGF0ZWQuDQo+ID4gSW4gZmFjdCwgd2hh
dCdzIHRoZSBkaWZmZXJlbmNlPw0KPiA+DQo+ID4gTlJfTUVNX0JBTktTIGlzIHRoZSBtYXggbnVt
YmVyIG9mIG1lbW9yeSBiYW5rcyAod2l0aCBvciB3aXRob3V0DQo+ID4gbnVtYS1ub2RlLWlkKS4N
Cj4gPg0KPiA+IE5SX05PREVfTUVNQkxLUyBpcyB0aGUgbWF4IG51bWJlciBvZiBtZW1vcnkgYmFu
a3Mgd2l0aCBOVU1BIHN1cHBvcnQNCj4gPiAod2l0aCBudW1hLW5vZGUtaWQpPw0KPiA+DQo+ID4g
VGhleSBhcmUgYmFzaWNhbGx5IHRoZSBzYW1lIHRoaW5nLiBPbiBBUk0gSSB3b3VsZCBqdXN0IGRv
Og0KPiA+DQo+IA0KPiBQcm9iYWJseSBub3QsIE5SX01FTV9CQU5LUyB3aWxsIGNvdW50IHRob3Nl
IG1lbW9yeSByYW5nZXMgd2l0aG91dA0KPiBudW1hLW5vZGUtaWQgaW4gYm9vdCBtZW1vcnkgcGFy
c2luZyBzdGFnZSAocHJvY2Vzc19tZW1vcnlfbm9kZSBvcg0KPiBFRkkgcGFyc2VyKS4gQnV0IE5S
X05PREVfTUVNQkxLUyB3aWxsIG9ubHkgY291bnQgdGhvc2UgbWVtb3J5IHJhbmdlcw0KPiB3aXRo
IG51bWEtbm9kZS1pZC4NCj4gDQo+ID4gI2RlZmluZSBOUl9OT0RFX01FTUJMS1MgTUFYKE5SX01F
TV9CQU5LUywgKENPTkZJR19OUl9OVU1BX05PREVTICogMikpDQo+ID4NCj4gPg0KDQpRdW90ZSBK
dWxpZW4ncyBjb21tZW50IGZyb20gSFRNTCBlbWFpbCB0byBoZXJlOg0KIiBBcyB5b3Ugd3JvdGUg
YWJvdmUsIHRoZSBzZWNvbmQgcGFydCBvZiB0aGUgTUFYIGlzIHRvdGFsbHkgYXJiaXRyYXJ5Lg0K
SW4gZmFjdCwgaXQgaXMgdmVyeSBsaWtlbHkgdGhhbiBpZiB5b3UgaGF2ZSBtb3JlIHRoYW4gNjQg
bm9kZXMsIHlvdSBtYXkNCm5lZWQgYSBsb3QgbW9yZSB0aGFuIDIgcmVnaW9ucyBwZXIgbm9kZS4N
Cg0KU28sIGZvciBBcm0sIEkgd291bGQganVzdCBkZWZpbmUgTlJfTk9ERV9NRU1CTEtTIGFzIGFu
IGFsaWFzIHRvIE5SX01FTV9CQU5LUw0Kc28gaXQgY2FuIGJlIHVzZWQgYnkgY29tbW9uIGNvZGUu
DQoiDQoNCkJ1dCBoZXJlIGNvbWVzIHRoZSBwcm9ibGVtOg0KSG93IGNhbiB3ZSBzZXQgdGhlIE5S
X01FTV9CQU5LUyBtYXhpbXVtIHZhbHVlLCAxMjggc2VlbXMgYW4gYXJiaXRyYXJ5IHRvbz8NCklm
ICNkZWZpbmUgTlJfTUVNX0JBTktTIChDT05GSUdfTlJfTlVNQV9OT0RFUyAqIE4pPyBBbmQgd2hh
dCBOIHNob3VsZCBiZT8NCg0KPiA+IEFuZCBtYXliZSB0aGUgZGVmaW5pdGlvbiBjb3VsZCBiZSBj
b21tb24gd2l0aCB4ODYgaWYgd2UgZGVmaW5lDQo+ID4gTlJfTUVNX0JBTktTIHRvIDEyOCBvbiB4
ODYgdG9vLg0KPiANCj4gSnVsaWVuIGhhZCBjb21tZW50IGhlcmUsIEkgd2lsbCBjb250aW51ZSBp
biB0aGF0IGVtYWlsLg0K

