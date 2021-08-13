Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CA73EB00C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 08:30:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166635.304155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEQgZ-0002Ua-St; Fri, 13 Aug 2021 06:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166635.304155; Fri, 13 Aug 2021 06:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEQgZ-0002SA-Pn; Fri, 13 Aug 2021 06:28:55 +0000
Received: by outflank-mailman (input) for mailman id 166635;
 Fri, 13 Aug 2021 06:28:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F9ox=NE=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mEQgY-0002S4-Fc
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 06:28:54 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.88]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b99fb396-fbff-11eb-a25b-12813bfff9fa;
 Fri, 13 Aug 2021 06:28:52 +0000 (UTC)
Received: from AM9P250CA0026.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::31)
 by AM0PR08MB3057.eurprd08.prod.outlook.com (2603:10a6:208:57::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 13 Aug
 2021 06:28:41 +0000
Received: from VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:21c:cafe::8c) by AM9P250CA0026.outlook.office365.com
 (2603:10a6:20b:21c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Fri, 13 Aug 2021 06:28:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT011.mail.protection.outlook.com (10.152.18.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Fri, 13 Aug 2021 06:28:41 +0000
Received: ("Tessian outbound 6ba9ec11d42b:v103");
 Fri, 13 Aug 2021 06:28:40 +0000
Received: from 9a68ddd570c9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 07A90AD0-C4A9-499A-989E-09AFBA974CCA.1; 
 Fri, 13 Aug 2021 06:28:35 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9a68ddd570c9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 13 Aug 2021 06:28:35 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB8PR08MB4170.eurprd08.prod.outlook.com (2603:10a6:10:a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Fri, 13 Aug
 2021 06:28:32 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%6]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 06:28:32 +0000
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
X-Inumbo-ID: b99fb396-fbff-11eb-a25b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QsoC1JKFxOYQzfsJ+7RRD+xWmeHR80dUYyVqKZ4y788=;
 b=bmXO384aTr+Ifv/kKqLWpQ/mGtlMo4HRGkdl658ViP4oPhRMqjxG36Jlw8qxPrENLOLJt0+8tjXgPvNWsmB4Iwt60bkpph7qdQKuiEagupLBceaoreyQKQtck9MSaRgfXC/yvqX+nLgUqvpFmQMPp/uefXRu3O5R+nts4zSB33A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYXB4pHR23tlZdFW7atmAZlE3KuIvjO8nLm8X1jUIuKVY7CgjvjII2e8L0GOfEEWgVOYUKv1XjYjpT2IMMNilQxlxweJaGJbP1OJXYGbu1f55zisnfT3EIQBy6gSiMTtUSj0R+jf8Z40qULC206k2+74FrgpOStXbqoRZCpxdA9kkC7Y3aA3yN4VWPUfJXrd610Yb9a6TC6FMS1IC9cH5vKa1BXxdOGeEsIg05GGd8ZXSPZbHLiVeM6+6GVl0q/zQiGxMAJXElKzZvbhHCDNxmbvMcF3aghUrnCrU7z13+YVXtdvYYj+y2FujjLvFBcNeap4D0QerVNWa6eFUAzOcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QsoC1JKFxOYQzfsJ+7RRD+xWmeHR80dUYyVqKZ4y788=;
 b=E10g75nq4469J9T6bptJfy0Flk8hqXcd8QGqQa8eUag+y14Ptkx0g/Xwru7ftukYzbd0Wnr6KBi6RMOKeAbqYvBEWmoD2/fh8aRnNNGFjh19dmLDp2G7x8ULfxyFH3P5vWyT7cc836/zRNW+WCnp8BxoKMO6dFwGQo7uG8wAw8odtYrTeoqPteahmtIMFczuMjMbDwp/5cL+bhEGuRXlCzXJP/WWVZFhLy1Y1htuEGwH61IjCpDyNnHMyyb/H/cQJYI0Nqwgvt7h6YyHmsb/6gCca6Isa9Vdm2JY0jbLUAgy2Rl1IgPQL+HwcDNCpV9qU1Xzy+DLDFZ8Z2KBc3V7fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QsoC1JKFxOYQzfsJ+7RRD+xWmeHR80dUYyVqKZ4y788=;
 b=bmXO384aTr+Ifv/kKqLWpQ/mGtlMo4HRGkdl658ViP4oPhRMqjxG36Jlw8qxPrENLOLJt0+8tjXgPvNWsmB4Iwt60bkpph7qdQKuiEagupLBceaoreyQKQtck9MSaRgfXC/yvqX+nLgUqvpFmQMPp/uefXRu3O5R+nts4zSB33A=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [XEN RFC PATCH 01/40] tools: Fix -Werror=maybe-uninitialized for
 xlu_pci_parse_bdf
Thread-Topic: [XEN RFC PATCH 01/40] tools: Fix -Werror=maybe-uninitialized for
 xlu_pci_parse_bdf
Thread-Index: AQHXjpsap9qHPnLZB0C8E1beBnV9NKtuIASAgALaSHA=
Date: Fri, 13 Aug 2021 06:28:32 +0000
Message-ID:
 <DB9PR08MB68574A7E5DCFD8EF51205A699EFA9@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-2-wei.chen@arm.com>
 <c6048717-a7ba-fe7d-76f0-58d4877492c4@suse.com>
In-Reply-To: <c6048717-a7ba-fe7d-76f0-58d4877492c4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: EB36CCE83301EF4897CA3EDA8B85144C.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 60168ac1-8de4-4817-0e53-08d95e2397d1
x-ms-traffictypediagnostic: DB8PR08MB4170:|AM0PR08MB3057:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB305743D4DE93BBBA99960A549EFA9@AM0PR08MB3057.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /ZvWKZp36hVt9oSF1H/39mr5X8ATb2WHqv6FkhglBSpGPiOv+AAMJlL+Ib9jNWnKA0ex32RMHRuq3KOPOURqZmqcNs23iwWpBAd6Hyuy6xrTIquA6WfXPqmTekOtdfWEFPXlGz7B0IEVds6ZV8OtoBjg0fRtOd7Zs3h5KQnkh3CxySa5RmwU0d5XJ1HljL2wz2W3I2NqmkvCHDlLOeto8NDjNW1ebldxjmahlTiz78Kjg6LoWSjdPVTVwdyfXCYxrTWsPY0rPfpg7YEPgYCSAPpJv9u4CU8PJwkonLnrNbvRJcp1CAdLp788rKwPEzN+4AQPRSDtEYYfWG4xCUVKKb/GhoRqbysYz2yumChIS6I9+q3vh00tB0lM6GW9OP8uTr9sB0WhvgwytiWZuJ1KBFaGJWxbWi+nJcWn3A0iXbOTgATUrGn8w4kPrg2k2DhX1P8yJni5ReYRnvZnoSeVvgGrFShodiOHIIHgfZW3tiaCWDeMFqcdo8TUxsR3FY4FbxV7Je89ZbHcje1kzCWTOBOB0GXstIoxSLjmeFPf/w+BMmixbgYj7zVKZQ9n0oo/Brq/cSqorHXZFNnOKYg1IY/pyuCQUUcYjdq/ZAsfpB+A5yiGAygRuITCbxCU1x2MzFPQX3ut7cm9Zs8xrYJLcVDAIRxUX7Jq3Vm2Rn2aIXFswCbhwpc5jNQV/0Pr3SgezJMFKBYBo5CitadwSpTEsA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(26005)(64756008)(66556008)(66476007)(55016002)(52536014)(9686003)(71200400001)(122000001)(6506007)(86362001)(7696005)(76116006)(186003)(66446008)(38100700002)(5660300002)(53546011)(38070700005)(83380400001)(8936002)(6916009)(8676002)(33656002)(4326008)(2906002)(508600001)(54906003)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NFRGQUFBdmtCZ2xnQnJ1K3h0cDdVVGZHNmxSaVFjQ0JiUXd0NkdhYWQzNGcr?=
 =?utf-8?B?cC9iSXM3Y3hQdUovTFpTdEx0WmxxUW9lWVNOTW1nNzhUeXdaRHEvQmtYMkpB?=
 =?utf-8?B?WE1DMk9uaXAzZkhJa2p1ZWh6OExuRmlseTIzRzVvZ01FVHEzdzdyK0t0em1o?=
 =?utf-8?B?MjZKN1FlS0Fsbnl6VGRSZE8xdXBRRmJtWU5BckVyam85WkQ4dW5XZml1ZjFt?=
 =?utf-8?B?UDVuWFhOLysvMjBrYTNPNWRHTGhpQktZbk5KUG84K2cwT1FtMDZYU0JucWl4?=
 =?utf-8?B?d2tkb2R5dmhpUmtRa0QxVXlTaXRmc2x4U2FJK2J0enFJamhRUDI3aTAwL3Yv?=
 =?utf-8?B?VzlPY3h4ell0NEtXZU0vam9VM1lmMSt2eUtNVVdOSUhVUnhjQ25SVXhSZVQ1?=
 =?utf-8?B?MkFCTFgrY1hjcWlpY2ZWU2xrUmxDbHFvY2U2dW1IN0xVaGg2TWZqTmtpVUor?=
 =?utf-8?B?R1hWWUVHSnc3N1VaWHJSQUJIcXNtLzRROEFSZmNuYVRuQkgreDR6NEV5SzRW?=
 =?utf-8?B?U2pSWnNUdTJkZlNhVEd5cHFjZHphKzRqU0hqVEJnN2luMi9hZjhub2xtK2NC?=
 =?utf-8?B?SWtLdlJoZERNc3RiRVloajhHaW9xUVJhdHpYRDkvNExHRVNhSTRjT2daVXNu?=
 =?utf-8?B?YlJ0UisrcERDNFpabkFhcEVrVVdTSWNCUzNNYjlwRUpFTnQ0K0ZCYVFTY0FE?=
 =?utf-8?B?QWxQMlVTb1NmamN0MWQ1cmNkeGZEOG5zWXBTN2NHTHdWS2FSVDIrY3B4TmVQ?=
 =?utf-8?B?VDNFS01nYmVoWW1qNVMrWU1EcUhTQWNYZGt2MDJGU0hWbWwyNGQwWG14Ui9a?=
 =?utf-8?B?cmxqZDZWSkZoWnNwSGxtNHRYeUhMblpFZVI3bzRKT05XR05HY2lUWS91VE9i?=
 =?utf-8?B?Q2xyaDByOGh3N29idS9wZU5zbTJrUysyRTVrcTcvK2JIaXBvd2U0dUlsMWll?=
 =?utf-8?B?NEtwaUhEUzNVTUtiMEZlejNPaUp2bTl2TUhYdmVkcG9qY2s0YzRrOUZYNER1?=
 =?utf-8?B?cnhra1Zrc0dBeDQvUFZYc3Bwb2JrV2RXcTIvcUlpQS9tYTB0SVp4UFpjN0Fo?=
 =?utf-8?B?SzErMlRJVGJFb3VZRERvSjVkSElXc2phR0FGMTh5VVZPbGZjMFRTSVcxTWpm?=
 =?utf-8?B?Wmx0Z00rcTdGY0lOTDZSK3JPM1NyVUhrRWtKOTRNZWNyNnJGYjhYY1dWT1JS?=
 =?utf-8?B?TmZJMlcvSytmMDFyWktPb0poRU1Delo0OExaNmRzVUFYb2hJU3UzVDhlZ3lJ?=
 =?utf-8?B?Z1FaaTBRbTZsQ01Lb0FuUmo2eEs0VVhlanZ2QWpPWmt1YlNlSjZBYytLcGlq?=
 =?utf-8?B?Sml4RnVEOXZXNEZETFdncENZMVR0cTc4MWUvUS9EcWZBL25CMDhPbUtrSThU?=
 =?utf-8?B?OS9nQVZhYS9LWjAzbWxqb0k0TFFNTmk0T3NFNVBiUEx4Mm4yR0o3RHM0Y0p4?=
 =?utf-8?B?dmsxTTcxUFpvMWM2OXZObVdlYktUNDlOUS8yTVA4NldsTTNleUNSZ2xMSEJN?=
 =?utf-8?B?NE1MOWFMRGNCL2E0MXdtdGUwcUxFUGkyQVcvdHI1bjBINkl2UkRHZkFGRlpM?=
 =?utf-8?B?dFV2NmYwVFRac0ErNGZ0TE9ZMkoyb0R3YXg4T1gxUEsrOGlFYUxZNllNUC9k?=
 =?utf-8?B?QXphTWp2VElyOVpSS0FPZHFwNzlaUVZPVzY2ajdhTGtMY1AvaFVkdmJkOWo2?=
 =?utf-8?B?RUdUd2FKejN5U2hCeXBMTGpyRGJ6c0ZCc09qemVOdGhIamdrZGhoNXUyTEdn?=
 =?utf-8?Q?EYQRYhGwwFopPXTjf0gZkzPvFk4IHFLw4S1Vld6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4170
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fdbf59f0-55e6-4186-a88a-08d95e23929e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZmHHJbCa9/QdlN9v5N6SjlMjDBLC/p777WeznkCloVMDHKOW2MjT+ui/MVXIVWnGzL6PLd2nyH2uFMeaOsZPds9X7j0/A4X4cVdFfrbFcp3edVFF3vBwkhfeAbP/o3RZ1aZgNLG042r7nd5fT2IcjR/g3+4JC2N2Au5O9jEVmhpTgOjWfmzEzimQyUN0H40e7SCls7YjJY6rQPIV0CjBl6EyMohijMLRIE8kNQLG75tX86dphE+DPtPnAtnqDQEUdLdv04zDVEZuxIaoV7nG9+PQZWhqzeGxSwK8KfJLcsrKsvrnhu1kbsLNo+xvG0hqQRAKtB9ihQqbP4+9owRsJ+n3axXt7UIb1HhNi4ZTjm4wuQbZJ0Xr0bFeFma+3g1RGP77dJBiV7AYLDbVnxgLwnZN++dMv5pOhEM1eKLn2JD5SPa9zdX+WlTAmw4K7s7qjWfkchlyxnPjaUwOtATGHnStnX80YZYVYyYnMZVlSi7vrucMqy7cBlpCv7XE78VHThg6ZE5SyXcipXdYfwHlTJbSnGtZqweFBdW1glQxVqWO9ZSb8jOAYhxbGZMD3ZVfRt6pN1viFLJD1CYMR+2FxfsO5d6dIZ5xrZIN8/vOpah8SSvmRMxyFbSefWTFd5jleruiB98Y6F1cwDhMUhwIIYAyv2S8iBEPXsg25hSG3BW6t7kPDkks+E3LdgHCT7uur4mF/Yd9xaSlKGLoqoukew==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(136003)(346002)(396003)(376002)(46966006)(36840700001)(26005)(82740400003)(8936002)(6862004)(54906003)(82310400003)(36860700001)(70586007)(70206006)(83380400001)(186003)(4326008)(55016002)(336012)(33656002)(478600001)(2906002)(9686003)(6506007)(53546011)(7696005)(5660300002)(356005)(8676002)(52536014)(86362001)(81166007)(47076005)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 06:28:41.2013
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60168ac1-8de4-4817-0e53-08d95e2397d1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3057

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMeW5tDjmnIgxMeaXpSAxODo1MA0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlz
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1hFTiBSRkMgUEFUQ0ggMDEvNDBdIHRvb2xzOiBGaXggLVdlcnJvcj1tYXliZS11bmlu
aXRpYWxpemVkDQo+IGZvciB4bHVfcGNpX3BhcnNlX2JkZg0KPiANCj4gT24gMTEuMDguMjAyMSAx
MjoyMywgV2VpIENoZW4gd3JvdGU6DQo+ID4gfCBsaWJ4bHVfcGNpLmM6IEluIGZ1bmN0aW9uICd4
bHVfcGNpX3BhcnNlX2JkZic6DQo+ID4gfCBsaWJ4bHVfcGNpLmM6MzI6MTg6IGVycm9yOiAnZnVu
YycgbWF5IGJlIHVzZWQgdW5pbml0aWFsaXplZCBpbiB0aGlzDQo+IGZ1bmN0aW9uIFstV2Vycm9y
PW1heWJlLXVuaW5pdGlhbGl6ZWRdDQo+ID4gfCAgICAzMiB8ICAgICBwY2lkZXYtPmZ1bmMgPSBm
dW5jOw0KPiA+IHwgICAgICAgfCAgICAgfn5+fn5+fn5+fn5+fl5+fn5+fg0KPiANCj4gSSdtIGFm
cmFpZCBJIGNhbid0IHNwb3Qgc3VjaCBhbiBhc3NpZ25tZW50IGluIHRoZSBmaWxlIChub3IgdGhl
IHR3bw0KPiBzaW1pbGFyIG9uZXMgZnVydGhlciBkb3duKS4gQWxsIEkgY2FuIHNlZSBpcw0KPiAN
Cj4gICAgIHBjaS0+ZG9tYWluID0gZG9tYWluOw0KPiAgICAgcGNpLT5idXMgPSBidXM7DQo+ICAg
ICBwY2ktPmRldiA9IGRldjsNCj4gICAgIHBjaS0+ZnVuYyA9IGZ1bmM7DQo+IA0KDQpTb3JyeSwg
SSBmb3Jnb3QgdG8gdXBkYXRlIG15IGNvbW1pdCBsb2cgd2l0aCB0aGUgbGF0ZXN0IGNvZGUgYmFz
ZS4NCkkgcmV2ZXJ0IHRoaXMgY2hhbmdlIGluIG15IGN1cnJlbnQgY29kZSwgSSBjYW4ndCByZXBy
b2R1Y2UgaXQuDQpJJ20gbm90IHN1cmUgaWYgaXQncyBiZWNhdXNlIEkgdXBncmFkZWQgbXkgYnVp
bGQgZW52aXJvbm1lbnQuDQpHaXZlIG1lIHNvbWV0aW1lLCBpZiBJIGNhbiByZXByb2R1Y2UgaXQg
SSB3aWxsIHVwZGF0ZSB0aGUgY29tbWl0DQpsb2cgaW4gbmV4dCB2ZXJzaW9uLiBJZiBpdCdzIG5v
IGxvbmdlciBuZWVkZWQsIEkgd2lsbCByZW1vdmUgdGhpcw0KcGF0Y2ggZnJvbSB0aGlzIHNlcmll
cy4NCg0KPiA+IHwgbGlieGx1X3BjaS5jOjUxOjI5OiBub3RlOiAnZnVuYycgd2FzIGRlY2xhcmVk
IGhlcmUNCj4gPiB8ICAgIDUxIHwgICAgIHVuc2lnbmVkIGRvbSwgYnVzLCBkZXYsIGZ1bmMsIHZz
bG90ID0gMDsNCj4gPiB8ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn4N
Cj4gPiB8IGxpYnhsdV9wY2kuYzozMToxNzogZXJyb3I6ICdkZXYnIG1heSBiZSB1c2VkIHVuaW5p
dGlhbGl6ZWQgaW4gdGhpcw0KPiBmdW5jdGlvbiBbLVdlcnJvcj1tYXliZS11bmluaXRpYWxpemVk
XQ0KPiA+IHwgICAgMzEgfCAgICAgcGNpZGV2LT5kZXYgPSBkZXY7DQo+ID4gfCAgICAgICB8ICAg
ICB+fn5+fn5+fn5+fn5efn5+fg0KPiA+IHwgbGlieGx1X3BjaS5jOjUxOjI0OiBub3RlOiAnZGV2
JyB3YXMgZGVjbGFyZWQgaGVyZQ0KPiA+IHwgICAgNTEgfCAgICAgdW5zaWduZWQgZG9tLCBidXMs
IGRldiwgZnVuYywgdnNsb3QgPSAwOw0KPiA+IHwgICAgICAgfCAgICAgICAgICAgICAgICAgICAg
ICAgIF5+fg0KPiA+IHwgbGlieGx1X3BjaS5jOjMwOjE3OiBlcnJvcjogJ2J1cycgbWF5IGJlIHVz
ZWQgdW5pbml0aWFsaXplZCBpbiB0aGlzDQo+IGZ1bmN0aW9uIFstV2Vycm9yPW1heWJlLXVuaW5p
dGlhbGl6ZWRdDQo+ID4gfCAgICAzMCB8ICAgICBwY2lkZXYtPmJ1cyA9IGJ1czsNCj4gPiB8ICAg
ICAgIHwgICAgIH5+fn5+fn5+fn5+fl5+fn5+DQo+ID4gfCBsaWJ4bHVfcGNpLmM6NTE6MTk6IG5v
dGU6ICdidXMnIHdhcyBkZWNsYXJlZCBoZXJlDQo+ID4gfCAgICA1MSB8ICAgICB1bnNpZ25lZCBk
b20sIGJ1cywgZGV2LCBmdW5jLCB2c2xvdCA9IDA7DQo+ID4gfCAgICAgICB8ICAgICAgICAgICAg
ICAgICAgIF5+fg0KPiA+IHwgbGlieGx1X3BjaS5jOjc4OjI2OiBlcnJvcjogJ2RvbScgbWF5IGJl
IHVzZWQgdW5pbml0aWFsaXplZCBpbiB0aGlzDQo+IGZ1bmN0aW9uIFstV2Vycm9yPW1heWJlLXVu
aW5pdGlhbGl6ZWRdDQo+ID4gfCAgICA3OCB8ICAgICAgICAgICAgICAgICBpZiAoIGRvbSAmIH4w
eGZmICkNCj4gPiB8ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgfn5+fl5+fn5+fn4NCj4g
DQo+IEknbSBhZnJhaWQgSSBhbHNvIGNhbid0IHNwb3QgYSB2YXJpYWJsZSBuYW1lZCAiZG9tIiwg
bm9yIGEgc3VmZmljaWVudGx5DQo+IHNpbWlsYXIgaWYoKS4gTWF5IEkgYXNrIHdoYXQgY29kZSBi
YXNlIHRoZXNlIHdlcmUgb2JzZXJ2ZWQgd2l0aD8gSXMgdGhlDQo+IGNoYW5nZSBuZWVkZWQgYXQg
YWxsIGFueW1vcmU/DQo+IA0KDQpzYW1lIGFzIGFib3ZlLg0KDQo+ID4gLS0tIGEvdG9vbHMvbGli
cy91dGlsL2xpYnhsdV9wY2kuYw0KPiA+ICsrKyBiL3Rvb2xzL2xpYnMvdXRpbC9saWJ4bHVfcGNp
LmMNCj4gPiBAQCAtMTUsNyArMTUsNyBAQCBzdGF0aWMgaW50IHBhcnNlX2JkZihsaWJ4bF9kZXZp
Y2VfcGNpICpwY2ksIGNvbnN0IGNoYXINCj4gKnN0ciwgY29uc3QgY2hhciAqKmVuZHApDQo+ID4g
IHsNCj4gPiAgICAgIGNvbnN0IGNoYXIgKnB0ciA9IHN0cjsNCj4gPiAgICAgIHVuc2lnbmVkIGlu
dCBjb2xvbnMgPSAwOw0KPiA+IC0gICAgdW5zaWduZWQgaW50IGRvbWFpbiwgYnVzLCBkZXYsIGZ1
bmM7DQo+ID4gKyAgICB1bnNpZ25lZCBpbnQgZG9tYWluID0gMCwgYnVzID0gMCwgZGV2ID0gMCwg
ZnVuYyA9IDA7DQo+ID4gICAgICBpbnQgbjsNCj4gPg0KPiA+ICAgICAgLyogQ291bnQgb2NjdXJy
ZW5jZXMgb2YgJzonIHRvIGRldHJtaW5lIHByZXNlbmNlL2Fic2VuY2Ugb2YgdGhlDQo+ICdkb21h
aW4nICovDQo+ID4gQEAgLTI4LDcgKzI4LDYgQEAgc3RhdGljIGludCBwYXJzZV9iZGYobGlieGxf
ZGV2aWNlX3BjaSAqcGNpLCBjb25zdCBjaGFyDQo+ICpzdHIsIGNvbnN0IGNoYXIgKiplbmRwKQ0K
PiA+ICAgICAgcHRyID0gc3RyOw0KPiA+ICAgICAgc3dpdGNoIChjb2xvbnMpIHsNCj4gPiAgICAg
IGNhc2UgMToNCj4gPiAtICAgICAgICBkb21haW4gPSAwOw0KPiA+ICAgICAgICAgIGlmIChzc2Nh
bmYocHRyLCAiJXg6JXguJW4iLCAmYnVzLCAmZGV2LCAmbikgIT0gMikNCj4gPiAgICAgICAgICAg
ICAgcmV0dXJuIEVSUk9SX0lOVkFMOw0KPiA+ICAgICAgICAgIGJyZWFrOw0KPiA+DQo+IA0KPiBB
bHNvIC0gd2hpY2ggY29tcGlsZXIgZGlkIHlvdSBlbmNvdW50ZXIgdGhpcyB3aXRoPw0KPiANCj4g
RmluYWxseSBwbGVhc2UgZG9uJ3QgZm9yZ2V0IHRvIENjIG1haW50YWluZXJzLg0KPiANCg0KSWYg
dGhpcyBwYXRjaCBzdGlsbCBuZWVkZWQsIEkgd2lsbCBkbyBpbiBuZXh0IHZlcnNpb24uDQoNCj4g
SmFuDQoNCg==

