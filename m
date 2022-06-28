Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1C455E563
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 16:41:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357149.585592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6COM-0005M5-0m; Tue, 28 Jun 2022 14:40:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357149.585592; Tue, 28 Jun 2022 14:40:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6COL-0005Jp-Tb; Tue, 28 Jun 2022 14:40:37 +0000
Received: by outflank-mailman (input) for mailman id 357149;
 Tue, 28 Jun 2022 14:40:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pAZO=XD=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o6COK-0005Jj-Bo
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 14:40:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80040.outbound.protection.outlook.com [40.107.8.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44fc3ee7-f6f0-11ec-b725-ed86ccbb4733;
 Tue, 28 Jun 2022 16:40:35 +0200 (CEST)
Received: from AS9PR06CA0147.eurprd06.prod.outlook.com (2603:10a6:20b:467::19)
 by AM5PR0801MB1985.eurprd08.prod.outlook.com (2603:10a6:203:4b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Tue, 28 Jun
 2022 14:40:33 +0000
Received: from VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:467:cafe::20) by AS9PR06CA0147.outlook.office365.com
 (2603:10a6:20b:467::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Tue, 28 Jun 2022 14:40:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT029.mail.protection.outlook.com (10.152.18.107) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Tue, 28 Jun 2022 14:40:32 +0000
Received: ("Tessian outbound 8dc5ba215ad1:v121");
 Tue, 28 Jun 2022 14:40:32 +0000
Received: from b88fb6d517e4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 029EBB07-BD59-40F8-A81B-F812010AC5EF.1; 
 Tue, 28 Jun 2022 14:40:25 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b88fb6d517e4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 28 Jun 2022 14:40:25 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB7028.eurprd08.prod.outlook.com (2603:10a6:20b:34f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Tue, 28 Jun
 2022 14:40:24 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5373.017; Tue, 28 Jun 2022
 14:40:23 +0000
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
X-Inumbo-ID: 44fc3ee7-f6f0-11ec-b725-ed86ccbb4733
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hRImLPVAmrzgA90gNPe0G6uZbF77B6qi5oi+d/4MgoqFrfD3k/tS+Alt3djW7xi/rGh589UgpFRf1YUuSVeEcbpUkPqzQZO5cQx3EhMFyw6I3WFl/F6rKw6m65lNbPHfHbGeyJyGtCT1iQyUp953IMjBkZU7xMorkMohObgIS5NCdCYMEshxKY1WElZ/Fs/c5diqJ9A8UTCsFmLvLTf8DDwIJhGhtu305c3mIxpJWbr7s4+K4ObI1TmG6T4RD5KUU5XWfSpwQ+AVzgx3zjJJzyWocnMI8p9kz/f1YXiNxLnDMsKMYX25Zp0TpMAWLeGIx1pqNzzvwy8fl9lCBLc56w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBlHUe/V+FMT0djyj1W9U7/vBkn/oW7XVxqCJ9ZEEbM=;
 b=EyrA4J3iDFbLjVuc5lA9DW2r3ygnAfUNEyuN0qV13gbvT/0s6c1RtMjot4ZFrAyfGulrFVihOecWWehWoh0veXnaqA/1bxdbuRxawxUjr607k89BuhQadmIr0D0X76dkS3+8WvKOgHrqgTEjXemDhmtmdApSAHVQsWRNAUoAaC/9FOabIGYL0ZpPe6Lt3S4A70O+p/vxzBJQk9ObsTQPt/DFu6UgUz9QN/UrhcsY8gZcCpbHOPM3DZRfBjoTDLYs9orK+GCKOEDI9btxTdc29se2sRKBjchDagAt5TbOw/Vo4mRWJv/pkvX+0CaB/uGofEUD+WcUI8ZtW4cyvFh3eQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TBlHUe/V+FMT0djyj1W9U7/vBkn/oW7XVxqCJ9ZEEbM=;
 b=4u5fFA9A0knbFWfmBhSZfDDr+5gyOO3WwTP/l27pnAPXkioi7pqsGPbGq9CFGZU9WSblKDO/AHqXE9uIahn9YXNbnP7eprjk9XkzyWuziarE3hXxkv8OHZQIToY4JxaxE75luAzv0grolDlhFo7etH/7S7EMJxpApdckoNv46io=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1a8d2ef52655265b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwctJcqu/IHoCm7dJ0qTSJe/fk/oR3U+8ipLw8LhBMuNWnUggeHJUzk+spWKYrd0ztYHw/PI+vcV+DB7EtZUfHalphX+gmHbHyoMD+sM1sfZDECqnUpR+OlQ9XreqxxkebsD3lLLt00hiGDkly6sZSl2bw7YqTqZ5e/V1WKrWftRJ26+W1prWOToI66HpcnVpmnSA0816UqY3jB7YUVGZCTz2MUIH6FHt+o3abXDOF8n/w+sG5+96hndDjpuY7l8R/zofqX61tlLU7OQe6nnfDXz+RzS+2OIeviHYcSzZUFjH5sLqO99724UrQiR7FzkVV9IdJU7ROQ4hhuRY1hbGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBlHUe/V+FMT0djyj1W9U7/vBkn/oW7XVxqCJ9ZEEbM=;
 b=bkCaDzLxQDp16YTYRGyLKuKOEjq/3L7e+TCHKbwuETYlP95OWoMdQKgQKWPDSzyCRydoAQyujZPirhXYKq5/gNyj9X67PaMF9rRhZvYNpmkMs+BzlLv7satLUl9MAJTnk7bdk+yNDUkz2mEPfEBFZXnujZ4oAswGHOBdzJiHn0zafoU8DrKdb16no3bQipLz+Bju9m9a6HpoLbM4xzLP4xZC16EcP9XcZ/52m+YDwK9Ku1mbI0/uv2lXcUy3agBLjAR+11/QVImeSmEzzAY5b7Eww69txgCKAaNpCNLZq4mS8ymL+GtqqWJ9BukfuTLaodwR70EMGTlWfDIfcNvd1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TBlHUe/V+FMT0djyj1W9U7/vBkn/oW7XVxqCJ9ZEEbM=;
 b=4u5fFA9A0knbFWfmBhSZfDDr+5gyOO3WwTP/l27pnAPXkioi7pqsGPbGq9CFGZU9WSblKDO/AHqXE9uIahn9YXNbnP7eprjk9XkzyWuziarE3hXxkv8OHZQIToY4JxaxE75luAzv0grolDlhFo7etH/7S7EMJxpApdckoNv46io=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Hongyan Xia
	<hongyxia@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<jgrall@amazon.com>
Subject: Re: [PATCH 2/2] xen/heap: pass order to free_heap_pages() in heap
 init
Thread-Topic: [PATCH 2/2] xen/heap: pass order to free_heap_pages() in heap
 init
Thread-Index: AQHYe9tJexjmG0CeP0OUFEWOQtMOSq1lAkiA
Date: Tue, 28 Jun 2022 14:40:23 +0000
Message-ID: <B8DAD34C-B156-4DC9-AA80-F1401028DF6F@arm.com>
References: <20220609083039.76667-1-julien@xen.org>
 <20220609083039.76667-3-julien@xen.org>
In-Reply-To: <20220609083039.76667-3-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 12087391-61a0-4644-73b6-08da591427b0
x-ms-traffictypediagnostic:
	AS8PR08MB7028:EE_|VE1EUR03FT029:EE_|AM5PR0801MB1985:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xo2WSCvFWAFSwTstfgBhfLHmiEo6SWLBgMnR7PZ4JA6L0+4hAuTg1Rt5yfCJYvjXyInaGgnwRPxlyH2Vho6QP+M/49nSpE+VudUSptKZxg5J4b2i86JG3g6E9391VGNJvdbyRAMdJcjZlk3AvMbubLaXeCXh5pt28fqRdsFGIOBj+sJ94dcxeJROPStjHJcxUiPPsd12gLpo1AGnman1Jtexuy7js73ux955l+CAbkmn8atUwa2ZaSXLszzn75+5kg+YR5SExEec2fpto9+8euKHZFIe0WuR0rWLndFywELCTt+6EqS6jlpxpovFIXrKPozMFU9y3bQuOynstIqUFeaiAfVrlmjaW6jEfOauQExWgMrT0bK59hThZ3W2aVBuq1wBUpDOhzbPlXMrkQXmNBRi/IDMHFYQFF5wFbfMyhEe612GaG8oMGSu4FnvE1RG+d3fBpsrm9roKY8yd5Mzm2Jb7Hmc6mx8zoFJO6AeOwDPKZPF3YDHdSKAjxf/D0Xk3Y12U6v8eeYovFTQgOQcgmr8bCt547fcpJcj4BU6UeGPkIIZEIBtPy+1tJc7JjjV2zd54FmS5EfRY/DRVZNGY6cq0tbFsVAPFpulvfMVcAu0udA0N9+MPoL0pfcLDOyRO3oqPNyRRVegCMc4Vr/RqQ7VyjdSVvQLkGqjMhqWmF6aJgzKp61/icpaAlwrUrTS7NAnSNyCEP1TTpFHiWIWBgrjDjPMWFXjWXrChr4LJtVZKtoXUBGza/g0OR+KTEL14fLqtIFcmzY0J/+ANIdTvFW7biEgONeJsqBHFlGh+BqrD6AlCZO9s7AqDEQbg4HjVXZmRAoFXdyroYbKwIN0Rg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(26005)(53546011)(66556008)(38070700005)(91956017)(122000001)(6512007)(2906002)(76116006)(66476007)(66446008)(8676002)(66946007)(64756008)(316002)(36756003)(6506007)(4326008)(38100700002)(41300700001)(478600001)(71200400001)(8936002)(2616005)(6916009)(6486002)(33656002)(186003)(5660300002)(83380400001)(86362001)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CB5EA6C300BF244F8EBD452087AC53B2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7028
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	47ad916c-0a78-4937-d191-08da5914227d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WykRmHy033v0b6ysOM39Y80uefAjnrs2X76KhIvkK+669NKQe2CDYhGkfQRpGUPz/TzafZcRqaG0AKn7aMrG9mpScwgVEaEpf1S/ngB6CRSIqDI2CidzOlOmvoq7ZTwWlriUG+8F8V21D2vxnrOXvgzi7dQ7tcVQXgSH8Ku1Tm8fUAIlEKLs64qNS6k0KHMTXxTXLdZMnYQUCd/k2zUN5ET7k9iYj7omovJZvOZm+XPpkknBf+096rX2IqT5VQP5bg6Dve0XnnNnj40gZEtgiR3J2Lp/G4XGyNbITNQ0qHcwpLGVRSQq5Mvtrhea5gWIURdvKd1ZfCKmhsaNH1viY/D1Eas3181jcFVf5BKJVmv3CKNPKkwlncSOLeGIYjaakhWH+N3EDMQBxPJRuDi1f3M867hS87BD6u2HzAaTAIamu+HrRzQPdG8XNphLpacT+rBpqnTvubt1oal9TWoZK3QbZyvQ0/GpznKm3U81lP68HeJHiIebQStwN0JUIl6CgfZ4oPSqRL7BNpgKcZLydgt3R1DiW0b8z1brr9kFwhwSB+E+Mo78M5FXBJHYzC6WuEje7+yPEpshLRQ+FYRYYKHte/Gh/19sU5TGv/SWu73UPDlT6BYfxJVFKqBLCO4rIESYUM15hsTNJWy8F3ZD5u/GkP4IsqIRGnClpaExH0/5W4f/N/RfGeObNRR3ZHXV8ghs1KiMxMK13rwiTDe32GDdYxTZ3PUPkjX90yOVf5Iro7mw0xZNFDAmjEu2iq/2YQNyeGmekAdgjuEEbbxYOeD1EQlh9qMng2trRiLV3Q6FrGx8hAEb2lB2a9nyA+Xm
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(396003)(39860400002)(46966006)(36840700001)(40470700004)(107886003)(36756003)(316002)(8936002)(6862004)(40480700001)(40460700003)(356005)(33656002)(8676002)(83380400001)(47076005)(70586007)(2616005)(4326008)(36860700001)(54906003)(81166007)(2906002)(186003)(478600001)(26005)(70206006)(82740400003)(53546011)(336012)(86362001)(5660300002)(6486002)(41300700001)(6512007)(82310400005)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 14:40:32.5346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12087391-61a0-4644-73b6-08da591427b0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1985

Hi Julien,

> On 9 Jun 2022, at 09:30, Julien Grall <julien@xen.org> wrote:
>=20
> From: Hongyan Xia <hongyxia@amazon.com>
>=20
> The idea is to split the range into multiple aligned power-of-2 regions
> which only needs to call free_heap_pages() once each. We check the least
> significant set bit of the start address and use its bit index as the
> order of this increment. This makes sure that each increment is both
> power-of-2 and properly aligned, which can be safely passed to
> free_heap_pages(). Of course, the order also needs to be sanity checked
> against the upper bound and MAX_ORDER.
>=20
> Testing on a nested environment on c5.metal with various amount
> of RAM. Time for end_boot_allocator() to complete:
>            Before         After
>    - 90GB: 1426 ms        166 ms
>    -  8GB:  124 ms         12 ms
>    -  4GB:   60 ms          6 ms


On a arm64 Neoverse N1 system with 32GB of Ram I have:
- 1180 ms before
- 63 ms after

and my internal tests are passing on arm64.

Great optimisation :-)

(I will do a full review of code the in a second step).

>=20
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Cheers
Bertrand


