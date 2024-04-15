Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0778A4DBA
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 13:29:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706075.1103114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwKVv-0001NV-QT; Mon, 15 Apr 2024 11:28:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706075.1103114; Mon, 15 Apr 2024 11:28:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwKVv-0001L8-Mj; Mon, 15 Apr 2024 11:28:43 +0000
Received: by outflank-mailman (input) for mailman id 706075;
 Mon, 15 Apr 2024 11:28:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=js9Q=LU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rwKVt-0001KK-W5
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 11:28:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20620.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4dba8c74-fb1b-11ee-94a3-07e782e9044d;
 Mon, 15 Apr 2024 13:28:39 +0200 (CEST)
Received: from DUZPR01CA0300.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::24) by PA4PR08MB6176.eurprd08.prod.outlook.com
 (2603:10a6:102:ea::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Mon, 15 Apr
 2024 11:28:29 +0000
Received: from DB1PEPF000509E6.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::12) by DUZPR01CA0300.outlook.office365.com
 (2603:10a6:10:4b7::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.32 via Frontend
 Transport; Mon, 15 Apr 2024 11:28:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509E6.mail.protection.outlook.com (10.167.242.56) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Mon, 15 Apr 2024 11:28:29 +0000
Received: ("Tessian outbound 8c03561b2da6:v313");
 Mon, 15 Apr 2024 11:28:29 +0000
Received: from bd1353ad7476.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 12BE837E-9A18-474D-9E02-C41F9644CFCB.1; 
 Mon, 15 Apr 2024 11:28:23 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bd1353ad7476.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Apr 2024 11:28:23 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by GV1PR08MB10504.eurprd08.prod.outlook.com (2603:10a6:150:15f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Mon, 15 Apr
 2024 11:28:21 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7452.049; Mon, 15 Apr 2024
 11:28:21 +0000
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
X-Inumbo-ID: 4dba8c74-fb1b-11ee-94a3-07e782e9044d
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PlmflEaA2yfVA6huv4O/M15Vrds2J2YOOeplJEsfUmYWSKTiayOvqAublMfHocPfj55BuVTdd/cCwzsfqt0lC9R7m4THYelBybXV3VBbS8HoxRigZicoGL120lp+gYeygfO66muLKlESVZ+h2XWpS4yfrB/re76jdoc3DFEoUIuFuDrR4+EJ6qW3N/SCBfKc7+zXtGDI6RH2T7fwhWqwtXwQFPFx04liTC1NHiUdPuQI7EhlFc8ty3VqPtyds3WMsDgJVFWq/2dYVoan6xs1FL1IcKODrareymRyv0Qv+vjYE34jZHlvQvt75JT/G1QGw9KUY9fqbtIfYWiidNoZ7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2e3ExXGLyyUSwE4aebGFz7EaOhMFzR0UwuD+5mKaW0=;
 b=fY6TzLvSL7gy6hWpLy5Qo4cWlHFPubajKcJtjPKKBZKfqREngHyOJ4Us06P8rlFZYygjylSYrWuVoP8w63xG3h47Fj7B8A6MaUo/L4gjo9zEMerOYvVsN1JwCnwCjfjqur52oDmxitnaTLsYrOhcdxcw2MFulRQbobNM7ji5B8DU0SgI79uBHa0DBaCY8mk+7j/PbXVjQTqeO66xAhcHSMXhbscgXJk2IoRSqtuGcmrRHyKVvYI2XSL/5Ywkw6S+NJWs5qVWDyuXi/JHuAK9Wtq3i4NDED+CAFyrDIjNV8GOBvJSlV1WnIEZmwLDsH/Zi35k240GeA+wn1l2RrYNqg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2e3ExXGLyyUSwE4aebGFz7EaOhMFzR0UwuD+5mKaW0=;
 b=OEz3aiHUh/Pu388U8TAXAhdwOja2eMcccMOt0j9tDsyD00ewBbrZRyyq71cvN1W60wRAe04grk6Fhju+IaumGZTfADv4b0OQdeV7R+5RgoYcSGICNeiIopqQCQEsYns5twxvtD5Z7k7oudZZ1LdD3xWusLt6GS6f9SXPkkBA1Xo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 343bff3da74d105c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUcImqp1duZCuNJhcIGXp5neRSnvkOZmtGgMdndfBgEB23/f8NBcW45AtYBFFyU/x9q5vIuzEYm4x4eESgp2IAUTVos9hBm7Qd6k1VKAawTUwnToa4V3xyEWaPenUm7bBq12vqhu+x6MHJdTmxBfJ7dblEn6BG1bWiDHiO4eMM/Ei75gYn3L+wDa0p9NHVlBbX3N13vxFIBzLniTPRm/lWywraPd3BlY4MD3AMiMiUFxMUtIGqg8bXN6mnTN46tVcD1fiM2kzH06LmZ1yzCAMykRFruwafoXlqBSBvFB4p5edA9TYg9A2l2pV0lxYSwoYTNcX0kE3VglLeL1RfzRvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2e3ExXGLyyUSwE4aebGFz7EaOhMFzR0UwuD+5mKaW0=;
 b=UoDqNi1LfINILIR7hXjB/f6BFvxMBJgbMgbCotCHlgtPUZtAxz1XYm3pSg2W1BEgtFSRBIS1w3gchIfF36S6ltutm2/mG/bBnd1VTqbFIV+8Gd2F3JYa/9J/hhznKMJzjdPhC+MGBZ8ADQsF+401py615N0O4kaWuQ5oVq7ftouw4Db5PKYNTGXYIMS1iZ3XJ/NtOAsUfWN1kZ3IFmXwsp64a12XQFZ/DaLVfxXO5BmV5mvlLPWyEGxexSCPZ+oC1TWVxI2jdcDe5+6/paEDiWBRGNkQ4FlBN8N1w21qsTySTdCb/2Tez4z1lIV5Gu/8LNrG7ygN574BQyiiPsZzTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2e3ExXGLyyUSwE4aebGFz7EaOhMFzR0UwuD+5mKaW0=;
 b=OEz3aiHUh/Pu388U8TAXAhdwOja2eMcccMOt0j9tDsyD00ewBbrZRyyq71cvN1W60wRAe04grk6Fhju+IaumGZTfADv4b0OQdeV7R+5RgoYcSGICNeiIopqQCQEsYns5twxvtD5Z7k7oudZZ1LdD3xWusLt6GS6f9SXPkkBA1Xo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Julien Grall <julien.grall.oss@gmail.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Michal Orzel <michal.orzel@amd.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Stefano Stabellini
	<stefano.stabellini@amd.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/4] docs: add xen_ulong_t to the documented integers
 sizes/alignments
Thread-Topic: [PATCH v2 1/4] docs: add xen_ulong_t to the documented integers
 sizes/alignments
Thread-Index:
 AQHai6GBZ8b+Nd1+T0SyR++yfNJA87FiLIoAgAF1zYCAAQgbgIAAGvcAgAAZZ4CABBxngIAAJ16AgAAWJQA=
Date: Mon, 15 Apr 2024 11:28:21 +0000
Message-ID: <41EA226E-B0CB-43BB-B0E9-4E01593E5FF3@arm.com>
References:
 <alpine.DEB.2.22.394.2404101644130.976094@ubuntu-linux-20-04-desktop>
 <20240410234740.994001-1-stefano.stabellini@amd.com>
 <CAJ=z9a3zMaSLSS0mfKT8dngVwrESycSspy8LnW4FZV6hdu_AAw@mail.gmail.com>
 <alpine.DEB.2.22.394.2404111454570.997881@ubuntu-linux-20-04-desktop>
 <CAJ=z9a2gOTLy2B7y9bELQHPhFmCpU2nhyV5zy9_uQvsvx5prqw@mail.gmail.com>
 <C8D49EE7-B214-41D5-9556-4D3B98629CEA@arm.com>
 <CAJ=z9a2ENW-3vh4N59csoeMHeMPGv9XFUuC6GrMTYMKM=FpwgQ@mail.gmail.com>
 <3C913FB6-0273-476E-908F-9FE95CB3E114@arm.com>
 <02401844-98d1-442c-8bd5-1e5c192ddb21@xen.org>
In-Reply-To: <02401844-98d1-442c-8bd5-1e5c192ddb21@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|GV1PR08MB10504:EE_|DB1PEPF000509E6:EE_|PA4PR08MB6176:EE_
X-MS-Office365-Filtering-Correlation-Id: 7195635c-2b79-4b0c-812b-08dc5d3f2cad
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1uY47Il9gnJdHCUkHub6llppGu/9/6aqQaOUNxeZ9i4pk1T50TJTTmlbcta2LYbDbmTB5W+IMdTJSsO12Q82tM/96+v9bK/plG9EelWedbUtyCShEC+/fjrRIJ41zaX8aR8RJGuGjdZ6W3jmkpdu6qkfL/uF/zANiQ+QrMy9abw+hALOVyXsN9DBSNbTgtfWeGdYcqoo9wTNwYmwcJEwvBBkaVfZ24WAKvKhnwORxH3bPn8RVCFEI0gTS0+cuscVAUYxvKFbk040K0L1Dn+KmXAwaQWb4OMHSVAfq6nt2hEYaUDvJwu4OR6T/CvXgm68xGfrIxXlVOXCoCWhuiYz+lKOvT/S9Usv8/CMh52lyolhZArSMV1/BSWdcCBfOCgaDkiVA/TanGyJL0nRuTW8yK5gvNgPruL6sciF4O//YlXU43MfwKWbN8bfaqiAxEhiYi/alT0tCETcKNs92lZsfUmUZ3wxSlGFYt6ieeXi2emb8rVfw7CN1ADtZPzngylnxaqO+V96nKSQMDmKSd90tGfTuUAorImrJokHQp623LJ3zkq2dQzXYhx9/I2CK0N7uQzH1SWRdUuaWdjImtT/O8g/f9rHuIzYSO+56uW+3htBtEscLFT9mTn+3Lwxh2HLEy+KABQ1AwwKHik/xS2GfPLx/CM+rsJxAOwwD0ft0vmIUFdzFEu5ETCLM8TKamZChwECxgb8KIi8qMozvz8AbUGh7PNuXNUUmo73cqFyWCk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3AE8E3FE112ADB48ACB7E40319E1D3E6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10504
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c0db5108-9c7e-42b8-4e6a-08dc5d3f27d1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eObAY+9ohmLVFNZeKfCuHp8KmmVe3XUiaqzZF5oepmwiY/TYlY0yVkdSmtmK6uEJWnwKrb9M/w2JXoo8O9UIijm2SLu35frTIXhYljn/46jMI49kY5FtMySQrveQzXhhSjv5GYE7fv7LyHtb7dOB2v7Ram6UCG4TzBUq1vvxXzQYn8hanI8nnDtpAATvlaxgxI3HDb8qFlY8Knul+9u11oFUKX8ipOFGQhKtxFsWFf4qW3iSMT+LS6n3BwFcxt6AN9RQk2t/H6m9bp9dbu/PEEnHsb02wOCU63oKoxYDAKFlTUJoBimv3nRJ/ihpAoYPpnl7g3LgzwKwdCvlfOzdTErOO4WJCd038Cm679Uwu/uQu4zvaVZTJDH6+Zn2eUJUNDZe9jN4BEsx1tP2B2C0MMPRkWSX7Wg7nFtrHdtynoXAXPRNDwtnFgwpcmSKb+JdOIsywEw9TDDEsgvGRAA9315svA9bEBOV5uZbj4iVxmJXtJSJugSNvsMffr1DhwVZ7xEzrHNNr/duID0h7qWliQpmwJsGa1jV79beewxHGDA59+QGyvtJYkRXfx/UgcKpPgplSNyS/6q2v/CcCeRDljwmdWDNhXKTdlF2kWSSSDCjoKXU/3AysR329S4LehhWMfTTW94valmmzvpGucm8cztJrkh8WYzfZmGPs+3+nILeIww+QhSzcbxxW5KEFG0+GbD+SkEw2lW4pR1jCOUxJE5bi9K5GZW57Eat7annYWge7YLJZHZzcHz9gnHFAZZl
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(82310400014)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 11:28:29.3658
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7195635c-2b79-4b0c-812b-08dc5d3f2cad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6176

SGkgSnVsaWVuLA0KDQo+IE9uIDE1IEFwciAyMDI0LCBhdCAxMjowOCwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBCZXJ0cmFuZCwNCj4gDQo+IE9uIDE1LzA0
LzIwMjQgMDg6NDgsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+PiBIaSBKdWxpZW4sDQo+Pj4g
T24gMTIgQXByIDIwMjQsIGF0IDE5OjAxLCBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbC5vc3NA
Z21haWwuY29tPiB3cm90ZToNCj4+PiANCj4+PiANCj4+PiANCj4+PiBPbiBGcmksIDEyIEFwciAy
MDI0IGF0IDExOjMwLCBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+
IHdyb3RlOg0KPj4+IEhpIEp1bGllbiwNCj4+PiANCj4+Pj4gT24gMTIgQXByIDIwMjQsIGF0IDE1
OjUzLCBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbC5vc3NAZ21haWwuY29tPiB3cm90ZToNCj4+
Pj4gDQo+Pj4+IA0KPj4+PiANCj4+Pj4gT24gVGh1LCAxMSBBcHIgMjAyNCBhdCAxODowOCwgU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4+Pj4gT24g
V2VkLCAxMCBBcHIgMjAyNCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+Pj4gT24gV2VkLCAxMCBB
cHIgMjAyNCBhdCAxOTo0NywgU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlA
YW1kLmNvbT4gd3JvdGU6DQo+Pj4+PiAgICAgICB4ZW5fdWxvbmdfdCBpcyB3aWRlbHkgdXNlZCBp
biBwdWJsaWMgaGVhZGVycy4NCj4+Pj4+IA0KPj4+Pj4gICAgICAgU2lnbmVkLW9mZi1ieTogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAYW1kLmNvbT4NCj4+Pj4+ICAgICAg
IC0tLQ0KPj4+Pj4gDQo+Pj4+PiAgICAgICBHaXZlbiB0aGF0IHhlbl91bG9uZ190IGlzIHVzZWQg
aW4gcHVibGljIGhlYWRlcnMgdGhlcmUgY291bGQgYmUgYSBiZXR0ZXINCj4+Pj4+ICAgICAgIHBs
YWNlIGZvciBkb2N1bWVudGluZyBpdCBidXQgdGhpcyB3YXMgdGhlIG1vc3Qgc3RyYWlnaHRmb3J3
YXJkIHRvIGFkZC4NCj4+Pj4+ICAgICAgIC0tLQ0KPj4+Pj4gICAgICAgIGRvY3MvbWlzcmEvQy1s
YW5ndWFnZS10b29sY2hhaW4ucnN0IHwgMTEgKysrKysrKysrKysNCj4+Pj4+ICAgICAgICAxIGZp
bGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQ0KPj4+Pj4gDQo+Pj4+PiAgICAgICBkaWZmIC0t
Z2l0IGEvZG9jcy9taXNyYS9DLWxhbmd1YWdlLXRvb2xjaGFpbi5yc3QgYi9kb2NzL21pc3JhL0Mt
bGFuZ3VhZ2UtdG9vbGNoYWluLnJzdA0KPj4+Pj4gICAgICAgaW5kZXggNWRkZmU3YmRiZS4uN2Ez
MzQyNjBlNiAxMDA2NDQNCj4+Pj4+ICAgICAgIC0tLSBhL2RvY3MvbWlzcmEvQy1sYW5ndWFnZS10
b29sY2hhaW4ucnN0DQo+Pj4+PiAgICAgICArKysgYi9kb2NzL21pc3JhL0MtbGFuZ3VhZ2UtdG9v
bGNoYWluLnJzdA0KPj4+Pj4gICAgICAgQEAgLTUzMSw2ICs1MzEsMTcgQEAgQSBzdW1tYXJ5IHRh
YmxlIG9mIGRhdGEgdHlwZXMsIHNpemVzIGFuZCBhbGlnbm1lbnQgaXMgYmVsb3c6DQo+Pj4+PiAg
ICAgICAgICAgICAtIDY0IGJpdHMNCj4+Pj4+ICAgICAgICAgICAgIC0geDg2XzY0LCBBUk12OC1B
IEFBcmNoNjQsIFJWNjQsIFBQQzY0DQo+Pj4+PiANCj4+Pj4+ICAgICAgICsgICAqIC0geGVuX3Vs
b25nX3QNCj4+Pj4+ICAgICAgICsgICAgIC0gMzIgYml0cw0KPj4+Pj4gICAgICAgKyAgICAgLSAz
MiBiaXRzDQo+Pj4+PiAgICAgICArICAgICAtIHg4Nl8zMg0KPj4+Pj4gICAgICAgKw0KPj4+Pj4g
ICAgICAgKyAgICogLSB4ZW5fdWxvbmdfdA0KPj4+Pj4gICAgICAgKyAgICAgLSA2NCBiaXRzDQo+
Pj4+PiAgICAgICArICAgICAtIDY0IGJpdHMNCj4+Pj4+ICAgICAgICsgICAgIC0geDg2XzY0LCBB
Uk12OC1BIEFBcmNoNjQsIFJWNjQsIFBQQzY0LCBBUk12OC1BIEFBcmNoMzIsIEFSTXY4LVINCj4+
Pj4+ICAgICAgICsgICAgICAgQUFyY2gzMiwgQVJNdjctQQ0KPj4+Pj4gDQo+Pj4+PiANCj4+Pj4+
IFdlIHN1cHBvcnQgbmVpdGhlciBBUk12OC1SIG5vciBBUk12OC1BIEFhcmNoMzIuDQo+Pj4+PiAN
Cj4+Pj4+IEkgY291bGQgcG9zc2libHkgYWNjZXB0IHRoZSBsYXR0ZXIgYmVjYXVzZSBpdCB3b3Jr
cyB0by4gQnV0IHRoZSBmb3JtZXIgaXMgc28gZmFyIG1pc2xlYWRpbmcuDQo+Pj4+IA0KPj4+PiBZ
ZXMgSSB0aGluayB5b3UgYXJlIHJpZ2h0LiBNb3Jlb3ZlciB0aGlzIGRvY3VtZW50DQo+Pj4+IChD
LWxhbmd1YWdlLXRvb2xjaGFpbi5yc3QpIGlzIG1lYW50IGZvciB0aGUgWGVuIGJ1aWxkLiBXaGls
ZSB0aGlzIHBhdGNoDQo+Pj4+IGlzIHRyeWluZyB0byBkb2N1bWVudCB0aGUgdHlwZXMgdXNlZCBp
biB0aGUgcHVibGljIGhlYWRlcnMgZm9yIHRoZQ0KPj4+PiBleHRlcm5hbC1mYWNpbmcgQUJJLg0K
Pj4+PiANCj4+Pj4gSSdsbCBtb3ZlIHRoZSBpbmZvcm1hdGlvbiB0aGlzIHBhdGNoIGlzIGFkZGlu
ZyB0byBhIHNlcGFyYXRlIGRvY3VtZW50LA0KPj4+PiBzcGVjaWZpYyB0byB0aGUgcHVibGljIGhl
YWRlcnMuIEkgd2lsbCBvbmx5IGFkZCB0aGUgYXJjaGl0ZWN0dXJlcw0KPj4+PiBjdXJyZW50bHkg
d29ya2luZzogSSdsbCBhZGQgQVJNdjgtQSBBYXJjaDMyIGJlY2F1c2UgYWx0aG91Z2ggaXQgaXMN
Cj4+Pj4gdW5zdXBwb3J0ZWQgaXQgaXMgaW50ZXJlc3RpbmcgdG8ga25vdyB0aGUgc2l6ZSBvZiB4
ZW5fdWxvbmdfdCBmb3INCj4+Pj4gYWFyY2gzMiBpbiB0aGUgcHVibGljIGhlYWRlcnMuIEkgd2ls
bCByZW1vdmUgQVJNdjgtUiBhcyBpdCBpcyBub3QNCj4+Pj4gYXZhaWxhYmxlIHVwc3RyZWFtLg0K
Pj4+PiANCj4+Pj4gVGhpbmtpbmcgYSBiaXQgbW9yZS4gV2hhdCBhYm91dCBBcm12OT8gUmF0aGVy
IHRoYW4gbGlzdGluZyBlYWNoIHZlcnNpb24sIHNob3VsZCB3ZSBpbnN0ZWFkIHVzZSBBUk12Ny1B
IGFhcmNoMzIgYW5kIGxhdGVyLCBBUk12OC1BIGFhcmNoNjQgYW5kIGxhdGVyPw0KPj4+IA0KPj4+
IERlZmluaXRlbHkgeW91IGFyZSByaWdodCBoZXJlIGJ1dCBhcyBmb3IgQXJtdjgtUiwgQXJtdjkg
aXMgbm90IHNvbWV0aGluZyB0aGF0IHdlIGV4cGxpY2l0ZWx5IHN1cHBvcnQgcmlnaHQgbm93IChl
dmVuIHRob3VnaCBpdCBzaG91bGQgd29yaykuDQo+Pj4gDQo+Pj4gSSBhbSBjb25mdXNlZCB3aXRo
IHRoZSBjb21wYXJpc29uLiBJIHRob3VnaHQgeW91IGNhbuKAmXQgYm9vdCBYZW4gYXQgYWxsIG9u
IEFybXY4LVIuIEJ1dCB5b3UgY2FuIG9uIEFybXY5LUEgYXMgdGhpcyBqdXN0IEFybXY4LUEgKyBm
ZWF0dXJlcyB0aGUgc29mdHdhcmUgZG9u4oCZdCBuZWVkIHRvIHVzZS4NCj4+PiANCj4+PiBEaWQg
eW91IGludGVuZCB0byBkcmF3IHRoZSBjb21wYXJpc29uIHdpdGggQXJtdjgtQSBBYXJjaDMyPw0K
Pj4gWWVzIGluIG15IG1pbmQgYXJtdjkgZXZlbiBpZiBjdXJyZW50bHkgd29ya2luZyBpdCBpcyBu
b3Qgc29tZXRoaW5nIG9mZmljaWFsbHkgc3VwcG9ydGVkIHNvIGl0IGlzIGluIHRoZSBzYW1lIHN0
YXRlIGFzIGFybXY4IGFhcmNoMzIuDQo+IA0KPiBBRkFJQ1QsIFN0ZWZhbm8gc2FpZCBoZSB3aWxs
IGFkZCBBUk12OC1BIEFBcmNoMzIsIHNvIHdlIHNob3VsZCBiZSBjb25zaXN0ZW50IGFuZCBhZGQg
QXJtdjktQSBpbiB0aGUgbGlzdC4NCg0KWWVzIHRoYXQgbWFrZXMgc2Vuc2UsIEkgYWdyZWUuDQoN
CkNoZWVycw0KQmVydHJhbmQNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0gDQo+IEp1bGllbiBH
cmFsbA0KDQoNCg==

