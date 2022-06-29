Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2317B55FB37
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 10:59:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357683.586413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6TXs-0001y3-Cj; Wed, 29 Jun 2022 08:59:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357683.586413; Wed, 29 Jun 2022 08:59:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6TXs-0001vY-8u; Wed, 29 Jun 2022 08:59:36 +0000
Received: by outflank-mailman (input) for mailman id 357683;
 Wed, 29 Jun 2022 08:59:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cYaO=XE=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1o6TXr-0001vQ-4u
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 08:59:35 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140054.outbound.protection.outlook.com [40.107.14.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb3761d1-f789-11ec-b725-ed86ccbb4733;
 Wed, 29 Jun 2022 10:59:33 +0200 (CEST)
Received: from AM6PR01CA0068.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::45) by DB8PR08MB4058.eurprd08.prod.outlook.com
 (2603:10a6:10:aa::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 08:59:29 +0000
Received: from AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::a9) by AM6PR01CA0068.outlook.office365.com
 (2603:10a6:20b:e0::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16 via Frontend
 Transport; Wed, 29 Jun 2022 08:59:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT049.mail.protection.outlook.com (10.152.17.130) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 08:59:27 +0000
Received: ("Tessian outbound 8dc5ba215ad1:v121");
 Wed, 29 Jun 2022 08:59:27 +0000
Received: from b532e1bb6bbf.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9775BA5D-E988-418B-BDB4-B5ED63C4E14D.1; 
 Wed, 29 Jun 2022 08:59:20 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b532e1bb6bbf.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Jun 2022 08:59:20 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by DB9PR08MB7495.eurprd08.prod.outlook.com (2603:10a6:10:36c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Wed, 29 Jun
 2022 08:59:19 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 08:59:18 +0000
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
X-Inumbo-ID: cb3761d1-f789-11ec-b725-ed86ccbb4733
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Z51Q2O9OHCdFU9C0Fir+/4L8fet8+jrn68OsoORc9j30b8Wx8heLpq3OSLYmxcbzpOuISKml0stpg+fJrSdDnIaAB4eA6G2zR0I7QC5UcaJk9xQxoySEzLRBtLD5ADHZallooAfYcUxK/KizwCaQqcl8kRkDtCcRR9HnH9UCwk1vjY1qwyrKb8Md/C+kdyE4/F3qo6z6nz6TDZkGZmxY2vbC5Jc3iuGVAa8N9rhEUIEiRIpz0B8sj/N5vCMhsXNghH3IbYJeN8Uz/JiM7WmaVOGQc4Gu03fmw3HemC0qXkMgq196BjcIz50VwnwAZf2SxwBQEwBsT5RDDd1m2/MP6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqIz8QR8SYglMHSbN2zIcTWWRFdd7HVOcLn39vUwd1E=;
 b=B2uHalbiS8oMAP/sRUf2S3vkdQB3y6bEkANOp6tq//lDr5uKAkdCQSu/OaMAYYyRIhVsBE3hWPi3ypB5iM5K7Sk1yb9+m1NNkJENu6zKkDZUdHtA/8AJ4jyH1IV6Mcw1Xt8xvoLrAdFGxCm6wvjkEBT56h4GPNZmrAOHRdYPBRX10F0xmWHLrnTXAtgLy+0oiQZN8m5LIys6B59kArmcrkVKrOUeBbfo9XaZenef77rzZiVMtWg8fUuTTgyGAm1kf6UxHg+P66Nrdl62aJ5DAmvBpM5Wa9dwK1CrFbqXYzM+A47fIoSw2LuW0R9B4d3yhZguEjbo4pjQtsxa+JKw0Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqIz8QR8SYglMHSbN2zIcTWWRFdd7HVOcLn39vUwd1E=;
 b=oJPoaaSAWuq6bkuGzsLUURFvMUh7ukLbYvAlF51pmYAwaWZBd362zu5F62MHTQYxg90kiVk4wsQxEBdq+pIIV1B/xDVS0b5KvpIIXWRri+XVLcuI2K0xShj8XD0aCNgncp1J52pxy0pHpiz2UMwhPYD+AWXd6mWiX8/rWfmIs3s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9f1e6e5403b0204d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=egD7V7ZtuizhsSNyP9wrG8jKerUypMWFxTxml3ZiUhsSeBDhgPMEah06qOeRdO8d/qNnyfCDoV60F5EdZXC6//x6CNt/UuFZ9lIV4/u5I27FNRayWsngOyhy8Te8llEbhoGKf1GVRdPMELrI6TX3O3eKlUKLuKYNp2/nFH3GVCcQq/KdS2QWQAjYm6Oilwn4UayqLA67gtgBuue8Ky9dlua80lKsGzB1yyeU308Kr+iCcW4tbgyM+qZ7DsPtrtw+8Fijcqr60R0wKTZxjY0GQ6mgB/L02g7hOoT+Q6bHb8QPcrqB0NKHmEs0dmbB0GlvinBdBKlLkZ37tQpvfXBOMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqIz8QR8SYglMHSbN2zIcTWWRFdd7HVOcLn39vUwd1E=;
 b=lK5B8ELMhuZlw8n/8fQPerNoZgVnavR42I6c+0GdCirghCvJhc7KdY3BxyuYDQ35ACX+S7S48s3n6xRxrcb1x9SMMNw8IcWtMzmbWBFyl2dFPVZ8O4P8Dz8tvZoYR6/rmGjJ7ox0sqxn+LvwHOvAzAmlP9VvW5ZfH59gzwIHpCn/k30uV70uukxWLhVzgO/4vvO7M+P5FJFUV0WvZwiOmXA9FMI+FW5w/LhAELe7n5dDu7iSztqvhbVQ+ebJ2JQURhFjBOx1ASQMm8VxoiS4aSRaiI2JMxq3YAztGGQER1qRd/wTzrJLEXA2yUqEBl9YsBGPUtJHlYPpVWbp1ly3hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqIz8QR8SYglMHSbN2zIcTWWRFdd7HVOcLn39vUwd1E=;
 b=oJPoaaSAWuq6bkuGzsLUURFvMUh7ukLbYvAlF51pmYAwaWZBd362zu5F62MHTQYxg90kiVk4wsQxEBdq+pIIV1B/xDVS0b5KvpIIXWRri+XVLcuI2K0xShj8XD0aCNgncp1J52pxy0pHpiz2UMwhPYD+AWXd6mWiX8/rWfmIs3s=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Elena
 Ufimtseva <elena.ufimtseva@oracle.com>, Tim Deegan <tim@xen.org>, Daniel De
 Graaf <dgdegra@tycho.nsa.gov>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v3 25/25] tools: Remove -Werror everywhere else
Thread-Topic: [XEN PATCH v3 25/25] tools: Remove -Werror everywhere else
Thread-Index: AQHYh+S87hLhz2jfzU+bF+lpBjZnJ61mHT4A
Date: Wed, 29 Jun 2022 08:59:18 +0000
Message-ID: <BF28045C-0848-4B5A-8DAB-57192C7B4A18@arm.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-26-anthony.perard@citrix.com>
In-Reply-To: <20220624160422.53457-26-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 44d65c40-93d0-4fc4-a1e7-08da59adac2a
x-ms-traffictypediagnostic:
	DB9PR08MB7495:EE_|AM5EUR03FT049:EE_|DB8PR08MB4058:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gRFwqJy8taO7DzZhM9t+PVHv+H5WPOrVoSkpzvZXJPe7FI1/x4lAgFFQBBkwqAhHeygN91qMJ+11V9Ah8h//ntj5zSStLoa6yfnXHSqS70poh7+3YeU//pCEHWZLPLTWSrdlQ5JNRGduRBgC8HYtwu3pV/tZ/BzTykWoEPvcyYwpvSryofdNNWuesC+hxy10P53p4iu0vzhVYLJU9TpziZ1tim/bsRrso7AJp+hoYpl68eUjLuafHBjS8S7JVSK2L31AM3/yReNKn/wPgc7EYT/V3V/K6jfx4zMpTiQEcr7riYZTsSLe0ZEtXpAhgHcnW1EmDgNxVthIR1X9aA/GhvnxyFPK/tA9SPTrecTKs1coQFjRRtbysagrWu+nkUx+VfYewaxtm1l0k+M5fCREx5qUdo90pPQlgvSVJN4KlhMmu15b6f5uD4C8pO8wiryYOIziOpzt8pFVDVESaSDZx+p4balkBscTrg41TZLqC4KviUc2RHdyv09xhwGVXQXXG5AdUjHWi88mMs1w3WtD3ussqNSFbpLzlbXnC548tjkM8ac0GAXSfa/tnKt+h7RgiMUjRyf+N2p2aCsOyYmfC9EuwttIrdfX78upo9CnIM/4tYg+Kv8V11MHEK29I+vp9lAcnekhygXEs9cUFbtFV1oagyZplW08zVraZFixTtODleumDJ99WQMNsS809/bStyx3/TyxKM4Nc0wuRESCmzESWjhdmqRzJ2S+U5mlijY5ODGuQoKlf6TGFfOEFKiB8QKO6Qa848CCKv9Oyxv3/wXeRA0BoOi4w06p7CwhmWPoR/FvLwV9R/R9XzVWUdzcSouBNnnsayY5UVWfuPcb+Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(6916009)(86362001)(54906003)(8676002)(66556008)(316002)(2616005)(83380400001)(66946007)(76116006)(66446008)(4326008)(66476007)(64756008)(36756003)(6486002)(91956017)(33656002)(2906002)(122000001)(8936002)(38100700002)(38070700005)(7416002)(41300700001)(53546011)(6506007)(5660300002)(478600001)(186003)(71200400001)(26005)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1730392772B33246925DA04F7E6912DF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7495
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5d159193-05de-4453-1127-08da59ada6ce
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/MM3txjuKv6FCXqsPQnhIJ665emb0UuRatq/xJ1ijCdiDF8yl5GXf/C3cfG/bazdnAeF0wmLfZpFnJiIVE7mrIJV/R9HJobOQtpiUSS0DcQ/9PzXKexPfoNxiPgAlq8H50sFACvx7uj8qzMKGL3jjtie+UtCkvwgp5GTxuDPVz3u8ViHBYRElYXtOjFfEc/vB4+siWHWjrNwLmU0zmfyArqLuBhe7k9YQMtIgLJsaaMiBNUBdYzECHkJisLBd4UH3TJOxC/AoA4SL3Z1F4OorIlY0F59RDTQfySlVXhXBO/JJ/SLZu99f/OsAD7t9qZ3hOhF1yms/rb3RRUcePWisoFIvXcxaaMfE8AXDC4VRZs+gtoVDgKiqGjGuaeRybOKfXo5O9zJZ2Tl3GLUoEIepOv2Su4TTWj7GhIQzh0qMix27jHeR7plIWx+RpgMspNDy7KElpTHydKaEiD5AYykfTm+rg+FOjF1WPRvQiLHRNp9S37naPBt7+d0iR5Q1QNy4F9iAc7HUCpyVbS4gKntYKdnNV9B09VmmhQVcmOca8IoPMnV8Ed2NBu2EEzEDUTSkvBHvJK4bwHezdIoZ3AzYEECNRag9/v03gd/N/Qw9ld231Ydfc0Wh7PDuQhyPRZ2gLXQFEh7tw3HHGkspeuc6MSGXORSDReve1j6uN0ffZJ22BS4jBnbVVJHXObidwFi7SxojRCC8g16dO3uPf+PCkt+KWZdD0TygBbY/OY2vvRd16JZHpmcbek2Jbl15N6PB/puB4uftqx6Rsf6D7FbJbXRutMu+chT/HmtTrHonFMccVerpzTUBsf6ARMIQ/OB
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(136003)(39860400002)(36840700001)(46966006)(40470700004)(8676002)(82740400003)(4326008)(6512007)(336012)(5660300002)(70586007)(2616005)(83380400001)(40480700001)(70206006)(6862004)(26005)(40460700003)(36860700001)(81166007)(6486002)(36756003)(478600001)(6506007)(2906002)(186003)(54906003)(82310400005)(316002)(41300700001)(107886003)(8936002)(33656002)(53546011)(47076005)(356005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 08:59:27.8098
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44d65c40-93d0-4fc4-a1e7-08da59adac2a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4058

DQorIENDOiBTdGVmYW5vIFN0YWJlbGxpbmkNCg0KPiBPbiAyNCBKdW4gMjAyMiwgYXQgMTc6MDQs
IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+
IFBhdGNoICJ0b29sczogQWRkIC1XZXJyb3IgYnkgZGVmYXVsdCB0byBhbGwgdG9vbHMvIiBoYXZl
IGFkZGVkDQo+ICItV2Vycm9yIiB0byBDRkxBR1MgaW4gdG9vbHMvUnVsZXMubWssIHJlbW92ZSBp
dCBmcm9tIGV2ZXJ5IG90aGVyDQo+IG1ha2VmaWxlcyBhcyBpdCBpcyBub3cgZHVwbGljYXRlZC4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRy
aXguY29tPg0KDQpIaSBBbnRob255LA0KDQpJIHdpbGwgdHJ5IHRvIHJldmlldyB0aGUgc2VyaWUg
d2hlbiBJIG1hbmFnZSB0byBoYXZlIHNvbWUgdGltZSwgaW4gdGhlIG1lYW4gdGltZSBJIGNhbiBz
YXkgdGhlIHdob2xlDQpzZXJpZSBidWlsZHMgZmluZSBpbiBteSBZb2N0byBzZXR1cCBvbiBhcm02
NCBhbmQgeDg2XzY0LCBJ4oCZdmUgdHJpZWQgYWxzbyB0aGUgdG9vbCBzdGFjayB0bw0KY3JlYXRl
L2Rlc3Ryb3kvY29uc29sZSBndWVzdHMgYW5kIG5vIHByb2JsZW0gc28gZmFyLg0KDQpUaGUgb25s
eSBwcm9ibGVtIEkgaGF2ZSBpcyBidWlsZGluZyBmb3IgYXJtMzIgYmVjYXVzZSwgSSB0aGluaywg
dGhpcyBwYXRjaCBkb2VzIGEgZ3JlYXQgam9iIGFuZCBpdA0KZGlzY292ZXJzIGEgcHJvYmxlbSBo
ZXJlOg0KDQphcm0tcG9reS1saW51eC1nbnVlYWJpLWdjYyAgLW10aHVtYiAtbWZwdT1uZW9uIC1t
ZmxvYXQtYWJpPWhhcmQgLW1jcHU9Y29ydGV4LWExNSAgLS1zeXNyb290PS9kYXRhX3NkYzEvbHVj
ZmFuMDEvdGVzdF9raXJrc3RvbmVfeGVuL2J1aWxkL3h0cC1xZW11LWFybTMyL3RtcC93b3JrL2Nv
cnRleGExNXQyaGYtbmVvbi1wb2t5LWxpbnV4LWdudWVhYmkveGVuLXRvb2xzLzQuMTcrZ2l0MS1y
MC9yZWNpcGUtc3lzcm9vdCAgIC1tYXJtIC1EQlVJTERfSUQgLWZuby1zdHJpY3QtYWxpYXNpbmcg
LXN0ZD1nbnU5OSAtV2FsbCAtV3N0cmljdC1wcm90b3R5cGVzIC1XZGVjbGFyYXRpb24tYWZ0ZXIt
c3RhdGVtZW50IC1Xbm8tdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUgLVduby11bnVzZWQtbG9jYWwt
dHlwZWRlZnMgICAtV2Vycm9yIC1PMiAtZm9taXQtZnJhbWUtcG9pbnRlciAtRF9fWEVOX0lOVEVS
RkFDRV9WRVJTSU9OX189X19YRU5fTEFURVNUX0lOVEVSRkFDRV9WRVJTSU9OX18gLU1NRCAtTVAg
LU1GIC5pbml0LWRvbTBsZXNzLm8uZCAtRF9GSUxFX09GRlNFVF9CSVRTPTY0IC1EX0xBUkdFRklM
RV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRfU09VUkNFICAtbXRodW1iIC1tZnB1PW5lb24gLW1mbG9h
dC1hYmk9aGFyZCAtbWNwdT1jb3J0ZXgtYTE1IC1mc3RhY2stcHJvdGVjdG9yLXN0cm9uZyAgLU8y
IC1EX0ZPUlRJRllfU09VUkNFPTIgLVdmb3JtYXQgLVdmb3JtYXQtc2VjdXJpdHkgLVdlcnJvcj1m
b3JtYXQtc2VjdXJpdHkgIC1PMiAtcGlwZSAtZyAtZmVsaW1pbmF0ZS11bnVzZWQtZGVidWctdHlw
ZXMgLWZtYWNyby1wcmVmaXgtbWFwPS9kYXRhX3NkYzEvbHVjZmFuMDEvdGVzdF9raXJrc3RvbmVf
eGVuL2J1aWxkL3h0cC1xZW11LWFybTMyL3RtcC93b3JrL2NvcnRleGExNXQyaGYtbmVvbi1wb2t5
LWxpbnV4LWdudWVhYmkveGVuLXRvb2xzLzQuMTcrZ2l0MS1yMD0vdXNyL3NyYy9kZWJ1Zy94ZW4t
dG9vbHMvNC4xNytnaXQxLXIwICAgICAgICAgICAgICAgICAgICAgIC1mZGVidWctcHJlZml4LW1h
cD0vZGF0YV9zZGMxL2x1Y2ZhbjAxL3Rlc3Rfa2lya3N0b25lX3hlbi9idWlsZC94dHAtcWVtdS1h
cm0zMi90bXAvd29yay9jb3J0ZXhhMTV0MmhmLW5lb24tcG9reS1saW51eC1nbnVlYWJpL3hlbi10
b29scy80LjE3K2dpdDEtcjA9L3Vzci9zcmMvZGVidWcveGVuLXRvb2xzLzQuMTcrZ2l0MS1yMCAg
ICAgICAgICAgICAgICAgICAgICAtZmRlYnVnLXByZWZpeC1tYXA9L2RhdGFfc2RjMS9sdWNmYW4w
MS90ZXN0X2tpcmtzdG9uZV94ZW4vYnVpbGQveHRwLXFlbXUtYXJtMzIvdG1wL3dvcmsvY29ydGV4
YTE1dDJoZi1uZW9uLXBva3ktbGludXgtZ251ZWFiaS94ZW4tdG9vbHMvNC4xNytnaXQxLXIwL3Jl
Y2lwZS1zeXNyb290PSAgICAgICAgICAgICAgICAgICAgICAtZmRlYnVnLXByZWZpeC1tYXA9L2Rh
dGFfc2RjMS9sdWNmYW4wMS90ZXN0X2tpcmtzdG9uZV94ZW4vYnVpbGQveHRwLXFlbXUtYXJtMzIv
dG1wL3dvcmsvY29ydGV4YTE1dDJoZi1uZW9uLXBva3ktbGludXgtZ251ZWFiaS94ZW4tdG9vbHMv
NC4xNytnaXQxLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZT0gIC1JL2RhdGFfc2RjMS9sdWNmYW4w
MS90ZXN0X2tpcmtzdG9uZV94ZW4vYnVpbGQveHRwLXFlbXUtYXJtMzIvdG1wL3dvcmsvY29ydGV4
YTE1dDJoZi1uZW9uLXBva3ktbGludXgtZ251ZWFiaS94ZW4tdG9vbHMvNC4xNytnaXQxLXIwL2xv
Y2FsLXhlbi94ZW4vdG9vbHMvaGVscGVycy8uLi8uLi90b29scy9pbmNsdWRlIC1JL2RhdGFfc2Rj
MS9sdWNmYW4wMS90ZXN0X2tpcmtzdG9uZV94ZW4vYnVpbGQveHRwLXFlbXUtYXJtMzIvdG1wL3dv
cmsvY29ydGV4YTE1dDJoZi1uZW9uLXBva3ktbGludXgtZ251ZWFiaS94ZW4tdG9vbHMvNC4xNytn
aXQxLXIwL2xvY2FsLXhlbi94ZW4vdG9vbHMvaGVscGVycy8uLi8uLi90b29scy9pbmNsdWRlIC1J
L2RhdGFfc2RjMS9sdWNmYW4wMS90ZXN0X2tpcmtzdG9uZV94ZW4vYnVpbGQveHRwLXFlbXUtYXJt
MzIvdG1wL3dvcmsvY29ydGV4YTE1dDJoZi1uZW9uLXBva3ktbGludXgtZ251ZWFiaS94ZW4tdG9v
bHMvNC4xNytnaXQxLXIwL2xvY2FsLXhlbi94ZW4vdG9vbHMvaGVscGVycy8uLi8uLi90b29scy9p
bmNsdWRlIC1JL2RhdGFfc2RjMS9sdWNmYW4wMS90ZXN0X2tpcmtzdG9uZV94ZW4vYnVpbGQveHRw
LXFlbXUtYXJtMzIvdG1wL3dvcmsvY29ydGV4YTE1dDJoZi1uZW9uLXBva3ktbGludXgtZ251ZWFi
aS94ZW4tdG9vbHMvNC4xNytnaXQxLXIwL2xvY2FsLXhlbi94ZW4vdG9vbHMvaGVscGVycy8uLi8u
Li90b29scy9pbmNsdWRlIC1EX19YRU5fVE9PTFNfXyAtSS9kYXRhX3NkYzEvbHVjZmFuMDEvdGVz
dF9raXJrc3RvbmVfeGVuL2J1aWxkL3h0cC1xZW11LWFybTMyL3RtcC93b3JrL2NvcnRleGExNXQy
aGYtbmVvbi1wb2t5LWxpbnV4LWdudWVhYmkveGVuLXRvb2xzLzQuMTcrZ2l0MS1yMC9sb2NhbC14
ZW4veGVuL3Rvb2xzL2hlbHBlcnMvLi4vLi4vdG9vbHMvaW5jbHVkZSAtRF9fWEVOX1RPT0xTX18g
LUkvZGF0YV9zZGMxL2x1Y2ZhbjAxL3Rlc3Rfa2lya3N0b25lX3hlbi9idWlsZC94dHAtcWVtdS1h
cm0zMi90bXAvd29yay9jb3J0ZXhhMTV0MmhmLW5lb24tcG9reS1saW51eC1nbnVlYWJpL3hlbi10
b29scy80LjE3K2dpdDEtcjAvbG9jYWwteGVuL3hlbi90b29scy9oZWxwZXJzLy4uLy4uL3Rvb2xz
L2luY2x1ZGUgIC1jIC1vIGluaXQtZG9tMGxlc3MubyBpbml0LWRvbTBsZXNzLmMgDQppbml0LWRv
bTBsZXNzLmM6IEluIGZ1bmN0aW9uICdjcmVhdGVfeGVuc3RvcmUnOg0KaW5pdC1kb20wbGVzcy5j
OjE0MTo1MzogZXJyb3I6IGZvcm1hdCAnJWx1JyBleHBlY3RzIGFyZ3VtZW50IG9mIHR5cGUgJ2xv
bmcgdW5zaWduZWQgaW50JywgYnV0IGFyZ3VtZW50IDQgaGFzIHR5cGUgJ3VpbnQ2NF90JyB7YWth
ICdsb25nIGxvbmcgdW5zaWduZWQgaW50J30gWy1XZXJyb3I9Zm9ybWF0PV0NCiAgMTQxIHwgICAg
IHJjID0gc25wcmludGYobWF4X21lbWtiX3N0ciwgU1RSX01BWF9MRU5HVEgsICIlbHUiLCBpbmZv
LT5tYXhfbWVta2IpOw0KICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIH5+XiAgIH5+fn5+fn5+fn5+fn5+fg0KICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICB8DQogICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgICAgIHVpbnQ2NF90IHtha2EgbG9uZyBsb25nIHVuc2lnbmVkIGludH0NCiAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxvbmcgdW5z
aWduZWQgaW50DQogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgJWxsdQ0KaW5pdC1kb20wbGVzcy5jOjE0NDo1NjogZXJyb3I6IGZvcm1hdCAn
JWx1JyBleHBlY3RzIGFyZ3VtZW50IG9mIHR5cGUgJ2xvbmcgdW5zaWduZWQgaW50JywgYnV0IGFy
Z3VtZW50IDQgaGFzIHR5cGUgJ3VpbnQ2NF90JyB7YWthICdsb25nIGxvbmcgdW5zaWduZWQgaW50
J30gWy1XZXJyb3I9Zm9ybWF0PV0NCiAgMTQ0IHwgICAgIHJjID0gc25wcmludGYodGFyZ2V0X21l
bWtiX3N0ciwgU1RSX01BWF9MRU5HVEgsICIlbHUiLCBpbmZvLT5jdXJyZW50X21lbWtiKTsNCiAg
ICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB+fl4gICB+fn5+fn5+fn5+fn5+fn5+fn5+DQogICAgICB8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgIHwNCiAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAg
ICAgdWludDY0X3Qge2FrYSBsb25nIGxvbmcgdW5zaWduZWQgaW50fQ0KICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbG9uZyB1bnNp
Z25lZCBpbnQNCiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAlbGx1DQogICAgICANCg0KV29u4oCZdCBiZSB0b28gZGlmZmljdWx0IHRv
IGZpeCwgaWYgSSBoYXZlIHRpbWUgSSB3aWxsIGRvIGl0LCBvdGhlcndpc2UgaWYgc29tZW9uZSB3
YW50cyB0byBkbyBpdOKAmXMgZmluZSBmb3IgbWUuDQoNCkNoZWVycywNCkx1Y2ENCg0KDQo=

