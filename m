Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8B450A75A
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 19:46:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310387.527209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhasH-0006fr-Cg; Thu, 21 Apr 2022 17:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310387.527209; Thu, 21 Apr 2022 17:45:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhasH-0006cs-9K; Thu, 21 Apr 2022 17:45:49 +0000
Received: by outflank-mailman (input) for mailman id 310387;
 Thu, 21 Apr 2022 17:45:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mw+u=U7=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1nhasG-0006cm-E3
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 17:45:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df9a32ec-c19a-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 19:45:47 +0200 (CEST)
Received: from AS8P250CA0021.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::26)
 by AS8PR08MB7813.eurprd08.prod.outlook.com (2603:10a6:20b:52c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 17:45:43 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:330:cafe::e8) by AS8P250CA0021.outlook.office365.com
 (2603:10a6:20b:330::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15 via Frontend
 Transport; Thu, 21 Apr 2022 17:45:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Thu, 21 Apr 2022 17:45:42 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Thu, 21 Apr 2022 17:45:42 +0000
Received: from 9e203bf1a824.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2F5636AF-EBA8-43B7-9628-F73BA0884A94.1; 
 Thu, 21 Apr 2022 17:45:35 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9e203bf1a824.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Apr 2022 17:45:35 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 (2603:10a6:203:4c::14) by GV1PR08MB7705.eurprd08.prod.outlook.com
 (2603:10a6:150:50::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 17:45:33 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::9464:cc9:b4b4:bf8]) by AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::9464:cc9:b4b4:bf8%4]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 17:45:32 +0000
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
X-Inumbo-ID: df9a32ec-c19a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03t4vCHpSQTztr1WldDOWGW9sRhZpaD3oNd4i4lVIZg=;
 b=qzZf01zhwBRJrx8wx0Pr1yKMveXhaEJXGc95+4OTRaaCMFkO0TFlqTJTF5022ShnSC5CoqX/Pf0ucPr3Y9r6akl0t3B+ikaOxIv5OLXKSBh7RvNeA3o1lR6AM989zmW/H9KcLXYdYrJd2Ch7aqJyj40thpMUPQc+fDPWpupa3Yc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f1f2ba887ec4e7fd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RspjWtg8/rwRQlQ2MJbiZu1Dt16uiI7rVCzsCoRxcyTitf+54jHvJNvv7RYVo/XQuBPMz9x6Rej/9z9/9smaQ5SmSxzGerSPQtb4N88gGQCmuQR6ZkW5w0LjWrQsIzhshmWAJBG9EeZN8SFeIe8I5RDrx1z+OpAYch+BlJ7HwWOTqRJOQCIdU6528UwtPUmUCRzCiNnfzmiftJWYu7cIf9+kaajxSeM8l/glHj15keSovHrn0xD3a+ZgpjYCJiLvY79f9Jt3a186L5VwfYGAow134J4Rg44bOgsNQlIvqMfpgFEbn2LS3E3ILHa9UU6FhCW6ur9farp/DqrcBP6z5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03t4vCHpSQTztr1WldDOWGW9sRhZpaD3oNd4i4lVIZg=;
 b=ZjQrQo79+/C7kPeGKI1rz+P6Jfzabp9yXVmRxp1Gdb98j1Aa9imSf5SrBjya7oezVg0gXRkp0KRYcsFQT9j1eBTfZJYqEUUMYBpF0XBVDW/prIw1pPx7/0R+9l99Q2Op7ObYJAvv8LTwQdenjuQG/GJy2lQr9M4B3kyRLBqg0i0Y9fV68YMmI3Xz0fO5AK7SmZcGipLUjxVm1h7cJhlmSUJaypTPAy7HS6mS0ZC6CKipkeXdrdAoZCmkv26GiMNOclpeVLZZnLqqFOrdzRmhP/54xxb+/q0VGzefwjb5mRZeyQUsYBPI37mk/4jWbgB/4fDkELeMTzgtWirxCs+08A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03t4vCHpSQTztr1WldDOWGW9sRhZpaD3oNd4i4lVIZg=;
 b=qzZf01zhwBRJrx8wx0Pr1yKMveXhaEJXGc95+4OTRaaCMFkO0TFlqTJTF5022ShnSC5CoqX/Pf0ucPr3Y9r6akl0t3B+ikaOxIv5OLXKSBh7RvNeA3o1lR6AM989zmW/H9KcLXYdYrJd2Ch7aqJyj40thpMUPQc+fDPWpupa3Yc=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Christoph Hellwig <hch@lst.de>, xen-devel
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, Jan Beulich
	<jbeulich@suse.com>, "jgross@suse.com" <jgross@suse.com>,
	"boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Subject: Re: xen-swiotlb issue when NVMe driver is enabled in Dom0 on ARM
Thread-Topic: xen-swiotlb issue when NVMe driver is enabled in Dom0 on ARM
Thread-Index:
 AQHYTzcUggEUWxM2006iot1qnYxlIKzuW0oAgAFU1ACAADDmgIAApv+AgAC5dQCAAp7ugIACQDIAgAEmAYCAANnhAIAAjguAgADEGACAAT4mAA==
Date: Thu, 21 Apr 2022 17:45:32 +0000
Message-ID: <12279FAE-2141-469E-A424-9984348E84BB@arm.com>
References: <C82612B1-FED5-4139-9B87-FB33DD81F01A@arm.com>
 <alpine.DEB.2.22.394.2204131354190.3066615@ubuntu-linux-20-04-desktop>
 <8C511888-6183-421E-A4C7-B271DAF46696@arm.com>
 <alpine.DEB.2.22.394.2204141329290.894007@ubuntu-linux-20-04-desktop>
 <20220415063705.GA24262@lst.de>
 <alpine.DEB.2.22.394.2204150917390.915916@ubuntu-linux-20-04-desktop>
 <4BC65913-EB0A-441C-A09C-4175697BDE9D@arm.com>
 <alpine.DEB.2.22.394.2204181225340.915916@ubuntu-linux-20-04-desktop>
 <49E3535A-5672-4047-AF86-05D5597C7019@arm.com>
 <alpine.DEB.2.22.394.2204191933450.915916@ubuntu-linux-20-04-desktop>
 <5C7EC3F4-9126-46E8-9321-60878357F939@arm.com>
 <alpine.DEB.2.22.394.2204201523390.915916@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2204201523390.915916@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 56e15cb1-d130-46be-03cb-08da23bec1da
x-ms-traffictypediagnostic:
	GV1PR08MB7705:EE_|VE1EUR03FT010:EE_|AS8PR08MB7813:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB7813EF8A525EAFD53EB42F9AFCF49@AS8PR08MB7813.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DcejZwG+QZndpBsikkym6ESBo3Wf0SV8OoT7N91XsIoWpp5yOXv2w62YzP8/lQZZ3jylGUTtasiYmrVrOMxXJAJjUN2cagXUtR7wif2Yc5zeVo5DvKWLt1ve/aDFsVRZoBdEPICeMZN1vwgqYfHmO8Gp3DyIY6DAhKPSMQ+5HrWuY9o1eUs4MpifwQimIfwWLBcM2f05zKAKTlQDhu4l629kvhbbymoerwGIMbVtCXzYWsCeDhdSBV7Ij19EThE9UnMWosbHwry0AI8nViAB4wjwO4kunVgFQDtcc6DzVl2JqfyCbCklHOPkwLKWHtQngQexMifVwBuBOzIaedswP6T1aQfKhag9si4BJKfrX8lVLcgDny/W4NjRA77KOffEeicJ97dx2f2s713Z5Fq0WFJ7taZfLcc41aFHNwSofAa/cuiXgIbsnj63eSE3b+1NOnVR+aMLwhyEnT4VjI+Dl7Slka2fsoS2SbCQvW3p7EDE6l/ZTRouxlkOG1/fKI+VbAeYspWnq3QnA5dgTwC2isDURceC2RcDgoyIwjgSQPrJVBuRjSjgYfNxVK6dQJphZ13BAr/8hcegQxBlzneZE3ImV38dxOcEXwW5ZZUeEUMjyoN3zq0D4zNTDDPSwXU8vrUQ4hoURggU1cSgkaPhsxbH2znx4bJmb+8DW6SoAaM5rLm4h32GJFU4E8oMZKMZqN9X58Kr2cCnotvto5h5RryUx4OF2HM4OvutvX6+67KiDJ5VGu1rARQhRXX1IwRosg8HnHg848Iy//GFPbedonV5NX10hiH6W411/Fo2AlcxE6sPuMIgB/tUd195LYje2YkvfQiDfdw/E3RoB6zApg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2020.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(8676002)(316002)(36756003)(5660300002)(8936002)(83380400001)(71200400001)(33656002)(6506007)(26005)(64756008)(6512007)(53546011)(86362001)(2906002)(91956017)(186003)(2616005)(66476007)(6916009)(66446008)(66556008)(54906003)(66946007)(76116006)(38100700002)(6486002)(966005)(122000001)(508600001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA3CBB9F383945479FD2881148A15101@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7705
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9c8ace39-a7e8-4860-0e46-08da23bebbd3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z2OBpS0Fwrh26ib7GDEpC/ZApx+1XHUEjcIBbTKhJmQaerEbyA7pZ8x8Dg+Ikn02fYylVVj8KreMShfssgNTcWQJFwc0mIrOFo+QWtuTwPUL2jLTZ7/fRMGUUp0sg3BBNW9R+COhzzZJT5eo1Sh1IAiGyPanaJdynJHz3qgDwcHsGg/6V2t+2PUfh0BKV8atu+saYhVD7GoBumqe2mC3Xs6CwbZYeGkKqZ2ZVEDwIX4jH5IVBFzHZw5kNPe6pkrPYzcxFIL0m/dMt6lK4+4+uMnvKn01hsCGailGRIhipRnAfgmK1WVHawkWQiGwFs2NogXBRr7N8Q7pX95GFJTlt4ALojumx4OAU1RIQwbPBL9tRBUvZQADtXmAQMGkVVsyQTVcMm6VrWYcFaYrhg2tADBzwwzxNnjF+1BtviyfNdyCfxFpuu7KzC2VfFqEvkmrWfBuYp5/k5WgfRvTRwl/WnKtQBe7ZVKEUuCD8qsCd16XKZ8QXLJOf7lKk9WdM5zLXHLn9JhbdGjlmhShQ60kP9IW4E4aPtkTw7srTv/WPvIKRmW6SMg803PdEDBDZnb85SJADM6g8wZtXzrGboPvy0apOOdovFM+TiVjsPQgqPfEPZwWs+OUaDS0Hc7beWqbaXKaBzroOLUh+lAYIDnuzDDTd26KbuPJreoAD59Vd3oMrEt39s/d5cfgbtHrXDwQgYlX493GDhsPvJ3VE4NSHBFDDXCYSR/kPRPNY6CWk+oWDCmT4n2O6WiL96dVb7N2G08MSm0jKt3xfwPtK74EaQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(54906003)(8936002)(86362001)(4326008)(8676002)(316002)(6862004)(186003)(26005)(107886003)(40460700003)(70206006)(2616005)(47076005)(70586007)(33656002)(81166007)(5660300002)(356005)(36860700001)(6512007)(966005)(2906002)(6506007)(82310400005)(508600001)(36756003)(53546011)(336012)(6486002)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 17:45:42.7989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e15cb1-d130-46be-03cb-08da23bec1da
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7813

SGkgU3RlZmFubywNCg0KPiBPbiAyMCBBcHIgMjAyMiwgYXQgMTE6NDYgcG0sIFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBXZWQsIDIw
IEFwciAyMDIyLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+PiBPbiAyMCBBcHIgMjAyMiwgYXQgMzoz
NiBhbSwgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToN
Cj4+Pj4+IFRoZW4gdGhlcmUgaXMgeGVuX3N3aW90bGJfaW5pdCgpIHdoaWNoIGFsbG9jYXRlcyBz
b21lIG1lbW9yeSBmb3INCj4+Pj4+IHN3aW90bGIteGVuIGF0IGJvb3QuIEl0IGNvdWxkIGxvd2Vy
IHRoZSB0b3RhbCBhbW91bnQgb2YgbWVtb3J5DQo+Pj4+PiBhdmFpbGFibGUsIGJ1dCBpZiB5b3Ug
ZGlzYWJsZWQgc3dpb3RsYi14ZW4gbGlrZSBJIHN1Z2dlc3RlZCwNCj4+Pj4+IHhlbl9zd2lvdGxi
X2luaXQoKSBzdGlsbCBzaG91bGQgZ2V0IGNhbGxlZCBhbmQgZXhlY3V0ZWQgYW55d2F5IGF0IGJv
b3QNCj4+Pj4+IChpdCBpcyBjYWxsZWQgZnJvbSBhcmNoL2FybS94ZW4vbW0uYzp4ZW5fbW1faW5p
dCkuIFNvIHhlbl9zd2lvdGxiX2luaXQoKQ0KPj4+Pj4gc2hvdWxkbid0IGJlIHRoZSBvbmUgY2F1
c2luZyBwcm9ibGVtcy4NCj4+Pj4+IA0KPj4+Pj4gVGhhdCdzIGl0IC0tIHRoZXJlIGlzIG5vdGhp
bmcgZWxzZSBpbiBzd2lvdGxiLXhlbiB0aGF0IEkgY2FuIHRoaW5rIG9mLg0KPj4+Pj4gDQo+Pj4+
PiBJIGRvbid0IGhhdmUgYW55IGdvb2QgaWRlYXMsIHNvIEkgd291bGQgb25seSBzdWdnZXN0IHRv
IGFkZCBtb3JlIHByaW50a3MNCj4+Pj4+IGFuZCByZXBvcnQgdGhlIHJlc3VsdHMsIGZvciBpbnN0
YW5jZToNCj4+Pj4gDQo+Pj4+IEFzIHN1Z2dlc3RlZCBJIGFkZGVkIHRoZSBtb3JlIHByaW50a3Mg
YnV0IG9ubHkgZGlmZmVyZW5jZSBJIHNlZSBpcyB0aGUgc2l6ZSBhcGFydA0KPj4+PiBmcm9tIHRo
YXQgZXZlcnl0aGluZyBsb29rcyBzYW1lIC4NCj4+Pj4gDQo+Pj4+IFBsZWFzZSBmaW5kIHRoZSBh
dHRhY2hlZCBsb2dzIGZvciB4ZW4gYW5kIG5hdGl2ZSBsaW51eCBib290Lg0KPj4+IA0KPj4+IE9u
ZSBkaWZmZXJlbmNlIGlzIHRoYXQgdGhlIG9yZGVyIG9mIHRoZSBhbGxvY2F0aW9ucyBpcyBzaWdu
aWZpY2FudGx5DQo+Pj4gZGlmZmVyZW50IGFmdGVyIHRoZSBmaXJzdCAzIGFsbG9jYXRpb25zLiBJ
dCBpcyB2ZXJ5IHVubGlrZWx5IGJ1dA0KPj4+IHBvc3NpYmxlIHRoYXQgdGhpcyBpcyBhbiB1bnJl
bGF0ZWQgY29uY3VycmVuY3kgYnVnIHRoYXQgb25seSBvY2N1cnMgb24NCj4+PiBYZW4uIEkgZG91
YnQgaXQuDQo+PiANCj4+IEkgYW0gbm90IHN1cmUgYnV0IGp1c3QgdG8gY29uZmlybSB3aXRoIHlv
dSwgSSBzZWUgYmVsb3cgbG9ncyBpbiBldmVyeSBzY2VuYXJpby4NCj4+IFNXSU9UTEIgbWVtb3J5
IGFsbG9jYXRlZCBieSBsaW51eCBzd2lvdGxiIGFuZCB1c2VkIGJ5IHhlbi1zd2lvdGxiLiBJcyB0
aGF0IG9rYXkgb3IgaXQgY2FuIGNhdXNlIHNvbWUgaXNzdWUuDQo+PiANCj4+IFsgICAgMC4wMDAw
MDBdIG1lbSBhdXRvLWluaXQ6IHN0YWNrOm9mZiwgaGVhcCBhbGxvYzpvZmYsIGhlYXAgZnJlZTpv
ZmYNCj4+IFsgICAgMC4wMDAwMDBdIHNvZnR3YXJlIElPIFRMQjogbWFwcGVkIFttZW0gMHgwMDAw
MDAwMGY0MDAwMDAwLTB4MDAwMDAwMDBmODAwMDAwMF0gKDY0TUIpDQo+PiANCj4+IHNuaXAgZnJv
bSBpbnQgX19yZWYgeGVuX3N3aW90bGJfaW5pdChpbnQgdmVyYm9zZSwgYm9vbCBlYXJseSkNCj4+
IC8qICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIA0KPj4gICAgICAqIElPIFRMQiBtZW1vcnkgYWxyZWFkeSBhbGxv
Y2F0ZWQuIEp1c3QgdXNlIGl0LiAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KPj4gICAgICAq
LyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIA0KPj4gICAgIGlmIChpb190bGJfc3RhcnQgIT0gMCkgeyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KPj4gICAgICAgICB4
ZW5faW9fdGxiX3N0YXJ0ID0gcGh5c190b192aXJ0KGlvX3RsYl9zdGFydCk7ICAgICAgICAgICAg
ICAgICAgICAgICAgIA0KPj4gICAgICAgICBnb3RvIGVuZDsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KPj4gICAgIH0NCj4gDQo+
IFVuZm9ydHVuYXRlbHkgdGhlcmUgaXMgbm90aGluZyBvYnZpb3VzIGluIHRoZSBsb2dzLiBJIHRo
aW5rIHdlIG5lZWQgdG8NCj4gbG9vayBhdCB0aGUgaW4tZGV0YWlscyBleGVjdXRpb25zIG9mIExp
bnV4IG9uIFhlbiB3aXRoIHN3aW90bGIteGVuIGFuZA0KPiBMaW51eCBvbiBYZW4gd2l0aG91dCBz
d2lvdGxiLXhlbi4gVGhlIGNvbXBhcmlzb24gd2l0aCBMaW51eCBvbiBuYXRpdmUgaXMNCj4gbm90
IHZlcnkgaW50ZXJlc3RpbmcgYmVjYXVzZSB0aGUgbWVtb3J5IGxheW91dCBpcyBhIGJpdCBkaWZm
ZXJlbnQuDQo+IA0KPiBUaGUgY29tcGFyaXNvbiBiZXR3ZWVuIHRoZSB0d28gZXhlY3V0aW9ucyBz
aG91bGQgYmUgc2ltcGxlIGJlY2F1c2UNCj4gc3dpb3RsYi14ZW4gc2hvdWxkIGJlIHRyYW5zcGFy
ZW50OiBpbiB0aGlzIHNpbXBsZSBjYXNlIHN3aW90bGIteGVuDQo+IHNob3VsZCBlbmQgdXAgY2Fs
bGluZyBhbHdheXMgdGhlIHNhbWUgZnVuY3Rpb25zIHRoYXQgd291bGQgZW5kIHVwIGJlaW5nDQo+
IGNhbGxlZCBhbnl3YXkgd2l0aG91dCBzd2lvdGxiLXhlbi4gQmFzaWNhbGx5LCBpdCBzaG91bGQg
b25seSBhZGQgYQ0KPiBjb3VwbGUgb2YgZXh0cmEgc3RlcHMgaW4gYmV0d2Vlbiwgbm90aGluZyBl
bHNlLg0KPiANCj4gQXMgd2UgaGF2ZSBhbHJlYWR5IGRpc2N1c3NlZDoNCj4gDQo+IC0gW25vIHN3
aW90bGIteGVuXSBkbWFfYWxsb2NfYXR0cnMgLS0+IGRtYV9kaXJlY3RfYWxsb2MNCj4gLSBbc3dp
b3RsYi14ZW5dIGRtYV9hbGxvY19hdHRycyAtLT4geGVuX3N3aW90bGJfYWxsb2NfY29oZXJlbnQg
LS0+IGRtYV9kaXJlY3RfYWxsb2MNCj4gDQo+IFRoZSByZXN1bHQgc2hvdWxkIGJlIGlkZW50aWNh
bC4gSW4geGVuX3N3aW90bGJfYWxsb2NfY29oZXJlbnQgdGhlIGNvZGUNCj4gcGF0aCB0YWtlbiBz
aG91bGQgYmU6DQo+IA0KPiAtIHhlbl9hbGxvY19jb2hlcmVudF9wYWdlcw0KPiAtIGlmICgoKGRl
dl9hZGRyICsgc2l6ZSAtIDEgPD0gZG1hX21hc2spKSAmJg0KPiAgICAgICFyYW5nZV9zdHJhZGRs
ZXNfcGFnZV9ib3VuZGFyeShwaHlzLCBzaXplKSkgew0KPiAgICAgICpkbWFfaGFuZGxlID0gZGV2
X2FkZHI7DQo+IC0gcmV0dXJuIHJldA0KPiANCj4gU28gYmFzaWNhbGx5LCBpdCBzaG91bGQgbWFr
ZSB6ZXJvIGRpZmZlcmVuY2UuIFRoYXQgaXMgZXhwZWN0ZWQgYmVjYXVzZQ0KPiBzd2lvdGxiLXhl
biByZWFsbHkgb25seSBjb21lcyBpbnRvIHBsYXkgZm9yIGRvbVUgcGFnZXMuIEZvciBib290aW5n
DQo+IGRvbTAsIGl0IHNob3VsZCBvbmx5IGJlIGEgInVzZWxlc3MiIGluZGlyZWN0aW9uLg0KPiAN
Cj4gSW4gdGhlIGNhc2Ugb2YgeGVuX3N3aW90bGJfbWFwX3BhZ2UsIGl0IHNob3VsZCBiZSBzaW1p
bGFyLiBUaGUgcGF0aA0KPiB0YWtlbiBzaG91bGQgYmU6DQo+IA0KPiAJaWYgKGRtYV9jYXBhYmxl
KGRldiwgZGV2X2FkZHIsIHNpemUsIHRydWUpICYmDQo+IAkgICAgIXJhbmdlX3N0cmFkZGxlc19w
YWdlX2JvdW5kYXJ5KHBoeXMsIHNpemUpICYmDQo+IAkJIXhlbl9hcmNoX25lZWRfc3dpb3RsYihk
ZXYsIHBoeXMsIGRldl9hZGRyKSAmJg0KPiAJCXN3aW90bGJfZm9yY2UgIT0gU1dJT1RMQl9GT1JD
RSkNCj4gCQlnb3RvIGRvbmU7DQo+IA0KPiB3aGljaCBJIHRoaW5rIHNob3VsZCBjb3JyZXNwb25k
IHRvIHRoaXMgcHJpbnRzIGluIHlvdXIgbG9ncyBhdCBsaW5lIDQwMDoNCj4gDQo+ICAgIERFQlVH
IHhlbl9zd2lvdGxiX21hcF9wYWdlIDQwMCBwaHlzPTgwMDAzYzRmMDAwIGRldl9hZGRyPTgwMDAz
YzRmMDAwDQo+IA0KPiBTbyB0aGF0IHNob3VsZCBiZSBPSyB0b28uIElmIGRpZmZlcmVudCBwYXRo
cyBhcmUgdGFrZW4sIHRoZW4gd2UgaGF2ZSBhDQo+IHByb2JsZW0uIElmIHRoZSBwYXRocyBhYm92
ZSBhcmUgdGFrZW4gdGhlcmUgc2hvdWxkIGJlIHplcm8gZGlmZmVyZW5jZQ0KPiBiZXR3ZWVuIHRo
ZSBzd2lvdGxiLXhlbiBhbmQgdGhlIG5vbi1zd2lvdGxiLXhlbiBjYXNlcy4NCj4gDQo+IFdoaWNo
IGJyaW5ncyBtZSB0byB5b3VyIHF1ZXN0aW9uIGFib3V0IHhlbl9zd2lvdGxiX2luaXQgYW5kIHRo
aXMNCj4gbWVzc2FnZToNCj4gDQo+ICAgIHNvZnR3YXJlIElPIFRMQjogbWFwcGVkIFttZW0gMHgw
MDAwMDAwMGY0MDAwMDAwLTB4MDAwMDAwMDBmODAwMDAwMF0gKDY0TUIpDQo+IA0KPiBUaGUgc3dp
b3RsYi14ZW4gYnVmZmVyIHNob3VsZCAqbm90KiBiZSB1c2VkIGlmIHRoZSBjb2RlIHBhdGhzIHRh
a2VuIGFyZQ0KPiB0aGUgb25lcyBhYm92ZS4gU28gaXQgZG9lc24ndCBtYXR0ZXIgaWYgaXQgaXMg
YWxsb2NhdGVkIG9yIG5vdC4gWW91DQo+IGNvdWxkIGNvbW1lbnQgb3V0IHRoZSBjb2RlIGluIHhl
bl9zd2lvdGxiX2luaXQgYW5kIGV2ZXJ5dGhpbmcgc2hvdWxkDQo+IHN0aWxsIGJlaGF2ZSB0aGUg
c2FtZS4NCj4gDQo+IEZpbmFsbHksIG15IHN1Z2dlc3Rpb24uIENvbnNpZGVyaW5nIGFsbCB0aGUg
YWJvdmUsIEkgd291bGQgbG9vayAqdmVyeSoNCj4gY2xvc2VseSBhdCB0aGUgZXhlY3V0aW9uIG9m
IExpbnV4IG9uIFhlbiB3aXRoIGFuZCB3aXRob3V0IHN3aW90bGIteGVuLg0KPiBUaGUgZGlmZmVy
ZW5jZXMgc2hvdWxkIGJlIHJlYWxseSBtaW5pbWFsLiBBZGRzIHByaW50cyB0byBhbGwgdGhlDQo+
IHN3aW90bGIteGVuIGZ1bmN0aW9ucywgYnV0IHJlYWxseSBvbmx5IHRoZSBmb2xsb3dpbmcgc2hv
dWxkIG1hdHRlcjoNCj4gLSB4ZW5fc3dpb3RsYl9hbGxvY19jb2hlcmVudA0KPiAtIHhlbl9zd2lv
dGxiX21hcF9wYWdlDQo+IC0geGVuX3N3aW90bGJfdW5tYXBfcGFnZQ0KPiANCj4gV2hhdCBhcmUg
dGhlIGRpZmZlcmVuY2VzIGJldHdlZW4gdGhlIHR3byBleGVjdXRpb25zPyBGcm9tIHRoZSBsb2dz
Og0KPiANCj4gLSB0aGUgYWxsb2NhdGlvbiBvZiB0aGUgc3dpb3RsYi14ZW4gYnVmZmVyIHdoaWNo
IGxlYWRzIHRvIDY0TUIgb2YgbGVzcw0KPiAgbWVtb3J5IGF2YWlsYWJsZSwgYnV0IGFjdHVhbGx5
IGlmIHlvdSBjb21wYXJlZCB0byBMaW51eCBvbiBYZW4NCj4gIHdpdGgvd2l0aG91dCBzd2lvdGxi
LXhlbiB0aGlzIGRpZmZlcmVudCB3b3VsZCBnbyBhd2F5IGJlY2F1c2UNCj4gIHhlbl9zd2lvdGxi
X2luaXQgd291bGQgYmUgY2FsbGVkIGluIGJvdGggY2FzZXMgYW55d2F5DQo+IA0KPiAtIHRoZSBz
aXplIHVwZ3JhZGUgaW4geGVuX3N3aW90bGJfYWxsb2NfY29oZXJlbnQ6IEkgY2FuIHNlZSBzZXZl
cmFsDQo+ICBpbnN0YW5jZXMgb2YgdGhlIGFsbG9jYXRpb24gc2l6ZSBiZWluZyBpbmNyZWFzZWQu
IElzIHRoYXQgY2F1c2luZyB0aGUNCj4gIHByb2JsZW0/IEl0IHNlZW1zIHVubGlrZWx5IGFuZCB5
b3UgaGF2ZSBhbHJlYWR5IHZlcmlmaWVkIGl0IGlzIG5vdCB0aGUNCj4gIGNhc2UgYnkgcmVtb3Zp
bmcgdGhlIHNpemUgaW5jcmVhc2UgaW4geGVuX3N3aW90bGJfYWxsb2NfY29oZXJlbnQNCj4gDQo+
IC0gV2hhdCBlbHNlIGlzIGRpZmZlcmVudD8gVGhlcmUgKm11c3QqIGJlIHNvbWV0aGluZywgYnV0
IGl0IGlzIG5vdA0KPiAgc2hvd2luZyBpbiB0aGUgbG9ncyBzbyBmYXIuDQo+IA0KPiANCj4gVGhl
IG9ubHkgb3RoZXIgb2JzZXJ2YXRpb24gdGhhdCBJIGhhdmUsIGJ1dCBpdCBkb2Vzbid0IGhlbHAs
IGlzIHRoYXQgdGhlDQo+IGZhaWx1cmUgaGFwcGVucyBvbiB0aGUgc2Vjb25kIDRNQiBhbGxvY2F0
aW9uIHdoZW4gdGhlcmUgaXMgYW5vdGhlcg0KPiBjb25jdXJyZW50IG1lbW9yeSBhbGxvY2F0aW9u
IG9mIDRLLiBOZWl0aGVyIHRoZSA0TUIgbm9yIHRoZSA0SyBhcmUNCj4gc2l6ZS11cGdyYWRlcyBi
eSB4ZW5fc3dpb3RsYl9hbGxvY19jb2hlcmVudC4NCj4gDQo+IDRNQiBpcyBhbiBsYXJnZXItdGhh
bi11c3VhbCBzaXplLCBidXQgaXQgc2hvdWxkbid0IG1ha2UgdGhhdCBtdWNoIG9mIGENCj4gZGlm
ZmVyZW5jZS4gSXMgdGhhdCBwcm9ibGVtIHRoYXQgdGhlIDRNQiBoYXZlIHRvIGJlIGNvbnRpZ3Vv
dXM/IEkgZG9uJ3QNCj4gc2VlIGhvdyBzd2lvdGxiLXhlbiBjb3VsZCBoYXZlIGFuIGltcGFjdCBp
biB0aGF0IHJlZ2FyZCwgaWYgbm90IGZvciB0aGUNCj4gc2l6ZSBpbmNyZWFzZSBpbiB4ZW5fc3dp
b3RsYl9hbGxvY19jb2hlcmVudC4NCj4gDQo+IFBsZWFzZSBsZXQgbWUga25vdyB3aGF0IHlvdSBm
aW5kLg0KDQpJIGRlYnVnIHRoZSBpc3N1ZSBtb3JlIHRvZGF5IGFuZCBmb3VuZCBvdXQgdGhhdCB0
aGUgb25seSBkaWZmZXJlbmNlIHdoZW4NCmNhbGxpbmcgZG1hX2FsbG9jX2F0dHJzKCkgZnJvbSB0
aGUgTlZNZSBkcml2ZXIgWzFdIGFuZCB0aGUgb3RoZXIgZHJpdmVyIGlzIHRoZQ0KYXR0cmlidXRl
IOKAnERNQV9BVFRSX05PX0tFUk5FTF9NQVBQSU5HIi4gDQoNCkkgcmVtb3ZlIHRoZSBhdHRyaWJ1
dGUgIkRNQV9BVFRSX05PX0tFUk5FTF9NQVBQSU5H4oCdIGJlZm9yZQ0KY2FsbGluZyB0aGUgeGVu
X2FsbG9jX2NvaGVyZW50X3BhZ2VzKCkgLCBOVk1lIERNQSBhbGxvY2F0aW9uIGlzIHN1Y2Nlc3Nm
dWwNCmFuZCB0aGUgaXNzdWUgaXMgbm90IG9ic2VydmVkLg0KDQpEbyB5b3UgaGF2ZSBhbnkgaWRl
YSB3aHkgYXR0cmlidXRlIERNQV9BVFRSX05PX0tFUk5FTF9NQVBQSU5HIGlzDQpjYXVzaW5nIHRo
ZSB0aGUgaXNzdWUgd2l0aCB4ZW4tc3dpb3RsYi4NCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVu
L3N3aW90bGIteGVuLmMgYi9kcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jDQppbmRleCAyYjM4NWMx
YjRhOTkuLjNjMTgzOTVkZDU2NyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMveGVuL3N3aW90bGIteGVu
LmMNCisrKyBiL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMNCkBAIC0yOTIsNiArMjkyLDggQEAg
eGVuX3N3aW90bGJfYWxsb2NfY29oZXJlbnQoc3RydWN0IGRldmljZSAqaHdkZXYsIHNpemVfdCBz
aXplLA0KICAgICAgICAqLw0KICAgICAgICBmbGFncyAmPSB+KF9fR0ZQX0RNQSB8IF9fR0ZQX0hJ
R0hNRU0pOw0KIA0KKyAgICAgICBhdHRycyAmPSB+KERNQV9BVFRSX05PX0tFUk5FTF9NQVBQSU5H
KTsNCisNCiAgICAgICAgLyogQ29udmVydCB0aGUgc2l6ZSB0byBhY3R1YWxseSBhbGxvY2F0ZWQu
ICovDQogICAgICAgIHNpemUgPSAxVUwgPDwgKG9yZGVyICsgWEVOX1BBR0VfU0hJRlQpOw0KIA0K
QEAgLTM1OSw2ICszNjEsOCBAQCB4ZW5fc3dpb3RsYl9mcmVlX2NvaGVyZW50KHN0cnVjdCBkZXZp
Y2UgKmh3ZGV2LCBzaXplX3Qgc2l6ZSwgdm9pZCAqdmFkZHIsDQogICAgICAgICAgICBUZXN0Q2xl
YXJQYWdlWGVuUmVtYXBwZWQocGFnZSkpDQogICAgICAgICAgICAgICAgeGVuX2Rlc3Ryb3lfY29u
dGlndW91c19yZWdpb24ocGh5cywgb3JkZXIpOw0KIA0KKyAgICAgICBhdHRycyAmPSB+KERNQV9B
VFRSX05PX0tFUk5FTF9NQVBQSU5HKTsNCisNCiAgICAgICAgeGVuX2ZyZWVfY29oZXJlbnRfcGFn
ZXMoaHdkZXYsIHNpemUsIHZhZGRyLCBwaHlzX3RvX2RtYShod2RldiwgcGh5cyksDQogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGF0dHJzKTsNCiB9DQoNClsxXSBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJl
ZS9kcml2ZXJzL252bWUvaG9zdC9wY2kuYyNuMjA1Mw0KDQpSZWdhcmRzLA0KUmFodWwNCg0K

