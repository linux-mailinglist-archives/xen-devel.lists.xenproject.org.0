Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AFF59E488
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 15:35:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391981.630072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQU3Q-0002qG-WD; Tue, 23 Aug 2022 13:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391981.630072; Tue, 23 Aug 2022 13:34:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQU3Q-0002nH-TX; Tue, 23 Aug 2022 13:34:52 +0000
Received: by outflank-mailman (input) for mailman id 391981;
 Tue, 23 Aug 2022 13:34:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jact=Y3=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oQU3O-0002nB-TC
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 13:34:51 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50089.outbound.protection.outlook.com [40.107.5.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b790120-22e8-11ed-9250-1f966e50362f;
 Tue, 23 Aug 2022 15:34:48 +0200 (CEST)
Received: from AM6PR04CA0016.eurprd04.prod.outlook.com (2603:10a6:20b:92::29)
 by DB6PR0802MB2136.eurprd08.prod.outlook.com (2603:10a6:4:81::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Tue, 23 Aug
 2022 13:34:45 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::e9) by AM6PR04CA0016.outlook.office365.com
 (2603:10a6:20b:92::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22 via Frontend
 Transport; Tue, 23 Aug 2022 13:34:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Tue, 23 Aug 2022 13:34:44 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Tue, 23 Aug 2022 13:34:44 +0000
Received: from 3d0aa3844f44.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 23AD3719-3788-4790-831E-4D88AFB5E250.1; 
 Tue, 23 Aug 2022 13:34:38 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3d0aa3844f44.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 Aug 2022 13:34:38 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS2PR08MB8624.eurprd08.prod.outlook.com (2603:10a6:20b:55f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.17; Tue, 23 Aug
 2022 13:34:37 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 13:34:37 +0000
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
X-Inumbo-ID: 5b790120-22e8-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=VhpuraMqSqYngy8aXLgezYUbr8FTHgSWkTQotfJKCnVXegkme78CPDUi1HdJgonikDr3tXVt1qeofJRjQKCsY7p9WfwLU39IU9wWNMCU2V2R8XBMX+0RNGoDxWmSfX/79FTrK1tlBq1yFXzgrzC7Ec8kpA7sKDsPFSwrz58bPy+imFoYArqGEJc1chA4DVtV1f8IY1Izjq8uChqCxdMhK00Nj6Iqb7FqoyiuX2WI6eX2ga/tuD2D4CzqKSYPlWzb+c/FKNAXUWWMQZ7U8xzYg0D6kAWpk63YPSAFWZ0TPjT9GosUP7gpfvmcBwx7RLObkBkUu3RHS4TWJPOTSdB/lw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFBZ0IOw7pMG0BEjKGmnUJc4rmcRLVDNQdlp8n1L2jE=;
 b=NwBe7F1+x/3DgcdXInT2yDgusZf8/lkZWqmfw0nVdciVPn+NR5gpHw5eiXY5C/ApltN+df7TcgWdizIMbao6h6kJgqnxSVWeWGNij4esUIQEofoEn8ZIkoguDwl5hcHQlGk+ZTPgUshay/hBzk2qar8bCCpw3Um45/uuw6jaWW+5tQltPJ44cum5nF2W6uPmKyQHjqKFfbFis8cteo26knBovykBfYqPGombZ+Tc5Pd8zbmDMpsRI5kkjY7kT2LmhaN/kTjJfJ5iAMUMEbZTl8+LF5Tve66UVZ8IDM4py+WS5NY1ymW/6UnQiukMHS92XjxHLRqS6xPPWKLp4LZExQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFBZ0IOw7pMG0BEjKGmnUJc4rmcRLVDNQdlp8n1L2jE=;
 b=GpQuoIOCO+dO4NW2luunuBDrG2p0PMqI/G64WrEZUUuPrqTrevPuCGg4D/gjnUzZPzTf3NHBpv4ultBC215dPUiZKMk4rxEgDdj4Gqy5jkelTBLg1jcKUQw4uuzUiLgWwXtM2Vv7uZ70QgyBxrGBlfZzPIfQ8JiUSgSIgSm+WLs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 75c4409f1c0f1da8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YSkDCpxWV34C+1OqDMqANtvRQVuaki35YGJ1AXoptILUzKuqm15mUOY6J7ASWhGeJtX41d/baokoEZx9VauDM7IKIDz7hY0p4ZpMGgMYC899xp0hpw32WOvKs6IxpWcYzrMGHc1P6JcagYR+b7/z37xCvp7ek/sOHyQOJcbPHjzT+K/YoAHPV4R2mZ5BDPTBlXuDAZZ/r6Q3ugTv9sKbmfWetjkyTmb0/Oup2Z0UjM8bfT9a1s0NYfChlBJV2S9P8RRCpABN37gJPpnbOIsbBCah/ARnL8C10a+csq6AwRByzMLmeF8hsniMI2+jnba63tM/r7e3un6bCxQJKz1Gaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFBZ0IOw7pMG0BEjKGmnUJc4rmcRLVDNQdlp8n1L2jE=;
 b=loVghY10X9jadkSL3Jmva4I17czCowqMrrUOcOc1qoPL6F9lN3licnRzyFA5HpxuK4WvsOOT8v5Byp5m59yHQpG+v4mkUGhUZOFEc1KeDesONAGOp3CodlBfkxiVFXcn72dqzfrregnAWo4p9z9nSvOakplmOAl2VORUARcU7ro2GsLDL0ZaTU1RcwZ0yIYR4aw94IaWRunLNh905xuwenw4hnFOYDvHg2lXXF99SAhV3jwoZEfGkjWSLVPbrcd2cc+Te4e4K/Q7xEwRzMFshtgZ/6VeAUM0t+8gzvqf80Oy8MYzWM3D6ft2O6R/+ZJxoiWCob+wcO/UXr229j6Myg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFBZ0IOw7pMG0BEjKGmnUJc4rmcRLVDNQdlp8n1L2jE=;
 b=GpQuoIOCO+dO4NW2luunuBDrG2p0PMqI/G64WrEZUUuPrqTrevPuCGg4D/gjnUzZPzTf3NHBpv4ultBC215dPUiZKMk4rxEgDdj4Gqy5jkelTBLg1jcKUQw4uuzUiLgWwXtM2Vv7uZ70QgyBxrGBlfZzPIfQ8JiUSgSIgSm+WLs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] libacpi: Fix cross building x86 on arm
Thread-Topic: [RFC PATCH] libacpi: Fix cross building x86 on arm
Thread-Index: AQHYttqU3r7Sk/IKHkKroerrTRS8F628a1KAgAARJAA=
Date: Tue, 23 Aug 2022 13:34:36 +0000
Message-ID: <B2DC2AC4-E59C-4C96-8993-D4812D73E799@arm.com>
References:
 <c3d431217010f669de809a76c2f1c15a0313ae53.1661246753.git.bertrand.marquis@arm.com>
 <844e0164-96b1-8a56-a9c0-0f432b9e648a@suse.com>
In-Reply-To: <844e0164-96b1-8a56-a9c0-0f432b9e648a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 3331a86a-ac96-4014-dc08-08da850c3dcd
x-ms-traffictypediagnostic:
	AS2PR08MB8624:EE_|VE1EUR03FT044:EE_|DB6PR0802MB2136:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SwJxpYyAyaiVYNCusQnK3kEp+z/Ocd2ngAw5ySd3sSCWVfB2phQSyYJdEWvX+BxyuWpUQ7Wy/AwApJx67moKC0jjcNhjTTcJF6QTxK/FcsAh71rS38AffbOfm/mHMuopnYVsnilyYgRVheUL5y+SbkNRAZ4EckmnsE2c2Ze+9Da4xYgjRe+Q3zVSzcTxp6XAfyQI3kSATTwgT6sZTvMx5kMb/eHfxIGYlf29Q9EgNUx4zLXF6L4bt47xQGMPIbe4cpqDj5M3zWi3+eUrodkZOnq33mZkwKd9W78GRKty3UoRzpjlnmNLPSPjuzNvITHSEfe+9yJAg7AUepRhK283IWbob8IyoNCqLjaOaoZgAeI4tJus5TfzoUM7Ew3kOMJgklOxSlFgCnKYnNhaLBOU6Q8K4r9lk5YYfXuVSvWSCvzYqbPOz1qKPIylpLVQtorBMPUYkqnP6xUqH2sf+unvy90sLSdxGBr5mBc+6cR6E9wFYO8iiC4WhEpKB/TWuCFYrJ6NrgY0/t/bzU/UAzwQwWtZhCe7Er5yFZLPAU+GkcumItfQopyWkn7syX50g+bHEwAQ8sZts1ILKt6rqj06kR9+OuDlY0CllereWeR6Zd2Vb+GGYsA+6UFYg7uHDHliIGOjzXbXf41kBLzY3Ryl6jMbqNOl80yszCQ7ZYeYfoNukRDxUFCQqIt5zZdlsN5LY/8X6YIaGG3Jnp5xG40q51J0MsxjlJep6FbbuSjbjsh0wamk48pN0PqKg9GqwWZBOwimkwUAY0J8wy0sl0PG5mO/GXn0Lp0Xeap2hwQDMRY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(38070700005)(53546011)(6506007)(86362001)(33656002)(36756003)(6512007)(83380400001)(26005)(2616005)(6486002)(71200400001)(41300700001)(186003)(478600001)(66476007)(316002)(91956017)(4326008)(8676002)(6916009)(76116006)(66446008)(54906003)(66556008)(66946007)(38100700002)(64756008)(5660300002)(8936002)(122000001)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <0CF51419A665D546A2A1C7C4424AFDC6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8624
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	533f18b5-47eb-41c1-8880-08da850c3912
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MOnXJ26sOAaC7Ec5DfOAaq+pmNmJKo2gPVuTDtenMrL+pix9tcSrmrjp6swINnyREabhiojd8ebuuicHrF8v/OwMHtWpTZ4nwDXRu4wGLd5vcC4SeLXlKFIBpQMPX0VI82aX2b78dRw975k0IXerNamidpGGuQhr2sMKLIKy9DpEHdYAg7UWQD2iT7bfNBXcr8cFVo960RxClg3Ms/XfArtlTV/tlPJ9Clb9MvLWkiQRtuY1IO9LRwSfIy28eOlBE3jY1hDi97K7OAlJTxXYfcaEgWYUadkwFl+KOFbPHjKWjuG+BCaAR3wF7d4AG2o861oIVnBFR8Jv9scn3TC7DhdVPKJeU9tDdyg1Qz/1lP3NYWct5ivV0uVoWKRX8ULQkEJRGkxRhTPavWt77VJUQ4SsGrcfTi/+H9aoHljZ7AfQ2JH9G7DeHkl0zGeWkO8dac8OXQsXFfCIBfqSEZFfUZ8dahmvyDxBI1Z7tWVupxbTMKrpkJ32612Qi95/5l9NWH+3lCbzHT+fZP7lEUle7boijYFBdlGxLgj0DUzuMAmo1atD2kgKM0euSFUxG9pa5jOSivlRnsxeP1KA7j+wSzgLeSVdx2RZM1Bz6y/R/zT6hC//GWLPOurwuaJT2DlnAjj/PFkt1+BlnBbDvtwHTbboq+0DCg3WSYfV2AnJ+Kgmrj5NkHCBDU7TcWCCgtSgF1C0im6uD8pxEoXt0dFVapZyC2dDJT4dtuvt8tkfdtzpNJKKPesBKZHIguqozkjaQVCAhbCsavNCjLco0ca17Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(39860400002)(396003)(46966006)(36840700001)(40470700004)(36860700001)(5660300002)(81166007)(70586007)(70206006)(8676002)(4326008)(2906002)(33656002)(40460700003)(6862004)(2616005)(26005)(8936002)(86362001)(356005)(82740400003)(47076005)(36756003)(186003)(336012)(6512007)(6506007)(53546011)(54906003)(40480700001)(82310400005)(478600001)(41300700001)(83380400001)(6486002)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 13:34:44.8412
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3331a86a-ac96-4014-dc08-08da850c3dcd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2136

Hi Jan,

> On 23 Aug 2022, at 13:33, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 23.08.2022 12:24, Bertrand Marquis wrote:
>> --- a/tools/libacpi/mk_dsdt.c
>> +++ b/tools/libacpi/mk_dsdt.c
>> @@ -18,6 +18,16 @@
>> #include <stdlib.h>
>> #include <stdbool.h>
>> #if defined(CONFIG_X86)
>> +/*
>> + * When building on non x86 host, arch-x86/xen.h will include xen.h whi=
ch will
>> + * try to include the arch xen.h (for example if built on arm, x86/xen.=
h will
>> + * include xen.h which will include arch-arm.h).
>> + * To prevent this effect, define x86 to have the proper sub arch inclu=
ded when
>> + * the compiler does not define it.
>> + */
>> +#if !(defined(__i386__) || defined(__x86_64__))
>> +#define __x86_64__
>> +#endif
>=20
> Besides being confusing this depends on the order of checks in xen.h.
>=20
>> #include <xen/arch-x86/xen.h>
>> #include <xen/hvm/hvm_info_table.h>
>> #elif defined(CONFIG_ARM_64)
>=20
> At the very least you will want to #undef the auxiliary define as soon
> as practically possible.

Ack

>=20
> But I think a different solution will want finding. Did you check what
> the #include is needed for, really? I've glanced through the file
> without being able to spot anything ... After all this is a build tool,
> which generally can't correctly use many of the things declared in the
> header.

As stated in the comment after the commit message, this is not a good
solution but an hack.

Now I do not completely agree here, the tool is not really the problem
but the headers are. There is not such an issue on arm.

The tool needs at least:
HVM_MAX_VCPUS
XEN_ACPI_CPU_MAP
XEN_ACPI_CPU_MAP_LEN
XEN_ACPI_GPE0_CPUHP_BIT

Which are defined in arch-x86/xen.h and hvm_info_table.h.

I am not quite sure how to get those without the current include

>=20
>> diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch=
-x86/xen.h
>> index 58a1e87ee971..ea33a56eb6a0 100644
>> --- a/xen/include/public/arch-x86/xen.h
>> +++ b/xen/include/public/arch-x86/xen.h
>> @@ -24,6 +24,7 @@
>>  * Copyright (c) 2004-2006, K A Fraser
>>  */
>>=20
>> +/* TODO: when cross building, this will include the wrong arch header *=
/
>> #include "../xen.h"
>=20
> I'm firmly against adding such a comment in a public header, the more
> that it's misleading: Cross-building of Xen, for example, works quite
> fine. The issue is limited to HOSTCC !=3D CC (or yet more precisely the
> target architecture of each), afaict.

Point was the todo was more to show where the issue is coming from.
I am really ok to remove this.

Cheers
Bertrand

>=20
> Jan


