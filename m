Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A35A154488E
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 12:17:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344865.570484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFDh-0000pM-BJ; Thu, 09 Jun 2022 10:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344865.570484; Thu, 09 Jun 2022 10:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFDh-0000n2-6a; Thu, 09 Jun 2022 10:16:53 +0000
Received: by outflank-mailman (input) for mailman id 344865;
 Thu, 09 Jun 2022 10:16:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6kiA=WQ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nzFDf-0000Tp-SI
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 10:16:52 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe06::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46fc6939-e7dd-11ec-b605-df0040e90b76;
 Thu, 09 Jun 2022 12:16:51 +0200 (CEST)
Received: from AS9PR06CA0350.eurprd06.prod.outlook.com (2603:10a6:20b:466::10)
 by DB6PR0801MB1797.eurprd08.prod.outlook.com (2603:10a6:4:32::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.17; Thu, 9 Jun
 2022 10:16:47 +0000
Received: from VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:466:cafe::1) by AS9PR06CA0350.outlook.office365.com
 (2603:10a6:20b:466::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13 via Frontend
 Transport; Thu, 9 Jun 2022 10:16:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT026.mail.protection.outlook.com (10.152.18.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12 via Frontend Transport; Thu, 9 Jun 2022 10:16:47 +0000
Received: ("Tessian outbound d3318d0cda7b:v120");
 Thu, 09 Jun 2022 10:16:46 +0000
Received: from ac2cf8f44b83.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 492D3347-3F23-4085-B935-1DE8D8426FD4.1; 
 Thu, 09 Jun 2022 10:16:39 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ac2cf8f44b83.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 09 Jun 2022 10:16:39 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB2998.eurprd08.prod.outlook.com (2603:10a6:209:4e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 9 Jun
 2022 10:16:37 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5314.019; Thu, 9 Jun 2022
 10:16:37 +0000
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
X-Inumbo-ID: 46fc6939-e7dd-11ec-b605-df0040e90b76
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dF9faxHMKim1awnkWZnK5CBTB6qJjlA+5G4TMPFgrFT8ThjWo/xCIVztqmElCbEPXPzKIeN9UDzuXHJT13lezVhJbNNplbibICaDzS9PXiGF5dKJeGBzQ4Z4SR9oPSx9IRGxeeImhnaKNw1SSUX5LL4Mdk7HmJx8bd8VTIXI26f/7HkoYLoVHRYbvZULuugxSb+nh0h00LyC4QIjij/CdVngIE46rkrBejkQMd1VQm/2MLw0tynGvJkfi6JrI0nBwPtyPC5Tng47ZQ19mm5mEGggnTbdJ1euvRbwKBCyk71bs4JvHmojZn7gmFblUBsg4CmguvYUaqCVI28toie4JQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZUP64wpScVM9B/KumhWG4mkq4094dBhOkHD0muqmsY=;
 b=JOTvHFN4JdBDkuqMID9igVoiBr0v5MhaRh6Y+eJPKgwExVhqHxIQfFfYPgtmBeTd/aNvEorQqJT+66Au1ntGiixF7cBtO57qMjibZiuQCsUaVki450YfIQCI4LbDGYHnfcL+stec8Xob6dNILH/ZSgkwTa1Jye1iCTXfVpUblRI41tifpOt4zHPmzqhuL/NxlVwg7wevCxYrEVfXmdeGz3Cr0nsck/UCLdd5F1fjJQkSwYoWy2NSEYrhmoJLv5erJ+LZ00YlRjiNRaOE/LVyNE/sxwTXpemZAQ+a1Exy1xorzhjeFXcYmi9nnQ/JTFMcLYuqT2gGLXU7zwMG5+xcEg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZUP64wpScVM9B/KumhWG4mkq4094dBhOkHD0muqmsY=;
 b=su43UjA56g8U3Za4qxYeCyQ/0dDfSbDKAuVfjAnCfsHFoxdaQzMTez67GKxBfbwXDxpGJ+nrABvcUdHxVY4UqHx+wX3ZdZdWvlQ6hc8YiMBuSz3dX3m5nG2VYm6pcjLkF4Lq/69shzs3MdGmXhSzibUY1LcThxQoyFai1S37NVE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 482bdf5473fccc23
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FFfKK69uXlUxBhgvfKepGWxI3I6YcgWVV8GKDwxHQ+SLNgr58uILKA2+5u5WtWVk+PPTaJXYnWVcb7U4DtaDkNXXrBOzesdvjwRNwysAIwruE9yDfg3wkXDdhSvWqBjQZsLvo1p2MKYq/XJSrxlMkTtEPKhpS87rB4FIXAzJeuyKZKU6dC9rlmPUh/dq+SvJuRE0rzqO5EqMzxi5CCbAzwAZowZxilJBkHGJhX2fHBF5x0WeQMHqyps9HTRNJWoU4ubhQ6peVtIse25VNQ5pPxxIkOmCKD/F/jFpt/3KhQYY7qBBg1H3jKmGy4j3Hnl9s+gGMpccPL+WANoSxp08og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZUP64wpScVM9B/KumhWG4mkq4094dBhOkHD0muqmsY=;
 b=T+5IiJyBEbTp1MDodGGQ4N96ThVEakJmlaXvo9G/DZGdd6MCOIaSkFThiaKE2l49v1kIvbnpgVq8/rmYiIQuocLjeHE3UAXV4lEph7c9Kv6Elr8YZG+b5LIS/902wcoB1pSb/f/DgaQHPT5bW5LqYtxEmcCvZAOJFZ7W1PVZTCPJ3wbJR2oFfUOF8lFAPAFv3b2uRjw/vrbqaMthpcetjETDseNpjbuwCUMDC76AyLM+y/Q1pV/gyawDTkAomInfZDGMr8bp1L9wJZZ8u6IQy+xD9cPwrvh2TtE3T6GcI2lKp2k6tTnPDZjvPGS4zHB/z96IYGQbHST5lUJey2v00Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZUP64wpScVM9B/KumhWG4mkq4094dBhOkHD0muqmsY=;
 b=su43UjA56g8U3Za4qxYeCyQ/0dDfSbDKAuVfjAnCfsHFoxdaQzMTez67GKxBfbwXDxpGJ+nrABvcUdHxVY4UqHx+wX3ZdZdWvlQ6hc8YiMBuSz3dX3m5nG2VYm6pcjLkF4Lq/69shzs3MdGmXhSzibUY1LcThxQoyFai1S37NVE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 1/4] build: xen/include: use if_changed
Thread-Topic: [XEN PATCH 1/4] build: xen/include: use if_changed
Thread-Index: AQHYddkD4JsESJA0gkGnWWwykzQjSK1G6E+A
Date: Thu, 9 Jun 2022 10:16:37 +0000
Message-ID: <6EE2C13C-7218-4063-8C73-88695C6BF4CE@arm.com>
References: <20220601165909.46588-1-anthony.perard@citrix.com>
 <20220601165909.46588-2-anthony.perard@citrix.com>
In-Reply-To: <20220601165909.46588-2-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b66f1e4a-c6bb-4497-8678-08da4a012940
x-ms-traffictypediagnostic:
	AM6PR08MB2998:EE_|VE1EUR03FT026:EE_|DB6PR0801MB1797:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB1797C15CF9364D35547869659DA79@DB6PR0801MB1797.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lrwSwIf7V5qWHevc/mxQ5jIbfQ8NgIQR+LMDZx+pGCs+7c8kYBVFcnjatEyVvmJabQ7pPY6YaBo8CCO+lam/lMB0W2Zu+w26JS2gqK9E9J43lhDIc0NzOgrjiia6JYuWua8Em1N9/GFoBk769zpuYzmixjsAu7VBrf7vjexzc+mBGetJLo5PBFSmKdw5h8yDSKTSm5W6Ozmwa7R8NRbL6Fgf/AZdMjZ42FMmOvEXrEAaCZ00keUN+5E66Nmq8sl2njSKdL16hWzR9pPC+d3o7haYIS14jCnBPcRBjzo823SVtZPxMP+BdEYF+woWxGsfav7pt9SvHV+6aM7yA4FzgGvpN5gzrRFT56mGtOLCIsgTLq7ajOMq2B3H/EeMqyA9YQ32lIvYrVGtnX2JDChmuu2Y+c8hkml3VYG50rY1yX3JV/sLqo//f6sa8M0NbYZFFXnqBV065ZB1As1drW83ngZ67iAvW2rYij1uHHlKbDUlp/rUPY1GNagJOkywrZx8S6A3s0Z7iAcHR1g03uRF2EoQb3BW4K6T4ZSvyooqZAT2gF3EWFMjVkp2fZPFzfX5JHfHTf1wbo0G9EfpDn4pq8ZD+QuchOfwxBbJjflGeTNw9vqD+sYitN/+uGhSwnE2W38/ojPLsHocZ7W8q4Wx4v6qCCOHbj8S6jqdB9TDnS50M5naHcgf6tSabbX07BbIAjptygACoa5jGqejKkTduLlkJ07OxGkYe8NBgxC1hKRibAOnnyITa9DHetXizOpZ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(38070700005)(66556008)(316002)(6512007)(186003)(71200400001)(6486002)(8936002)(2906002)(83380400001)(508600001)(33656002)(38100700002)(66946007)(122000001)(2616005)(36756003)(6916009)(66476007)(66446008)(64756008)(8676002)(4326008)(76116006)(53546011)(26005)(91956017)(5660300002)(6506007)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <78A91C6CC22D9643A88C652E1B7863A2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2998
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d69e5ee9-e547-49e3-3dee-08da4a012373
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T3L6Oku/CUMTXeLFkH3lq8Xw6uoRLmojD6l5fhDNAcLEndcJahyvIoyj67p+QFcCeQ4LWBf6u0O47a1IGdebHW15MBJjWHnGyhts9SEMEeFCEfhv1csCTbhu9cdJ4rHan6OXRw+IeXv07cUt2OB1OIuwBMo4kstyqJ9HJkFbv1zPGQWS9woN63ASTFrLxv5ipCUjkDyerNEx69GRU0D11E51LSmSyntDhOqnClQ4rkhfVzuBAezY2/nrsk8TrtaVrJEcsLfjlzcwEI+OX71zDSfrNsweO+w1Dud/uKxuSAc5rNh7jGL4mgxBfKDvziB4SgL3QsBpRwrK+mUkJYm3YNsVXcgr/Ur8Prgk6adnt5ZQS/hgJU1ycQ2hVD+g9iretiDj8SgnrZ1zxZbp4NqBzxhzD8th+ZACN/h8MXa1LpYGSJOCnKdBb05Fy1XjLq+NmqVjY0rY6EMSpIZlt5qJxpU4LfppeyDUty4FDE1vjjW+VQM9HqNu09TgSyw/bHz3VGLcpYeU7G08XTM1S777WSloo83G9dnMqB46QhwIFDVgwwxaV1jk8R238KnjR7lE+s2OxjFKXBY+liQEJdhhUVc39TiDdjnc+OyE02+Xk95ULkcde6Re9NXNb5Ud6CaWQV12YngHORSiNO5drRoTyVi6ynDLO6R3Edjh9cVceepe5epBcU/izl7pDyJa/tIH
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(356005)(26005)(36860700001)(6486002)(8936002)(6862004)(508600001)(6506007)(53546011)(8676002)(81166007)(82310400005)(86362001)(2906002)(83380400001)(70586007)(6512007)(316002)(4326008)(186003)(5660300002)(70206006)(40460700003)(336012)(47076005)(2616005)(33656002)(36756003)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 10:16:47.2301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b66f1e4a-c6bb-4497-8678-08da4a012940
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1797

Hi Anthony,

> On 1 Jun 2022, at 17:59, Anthony PERARD <anthony.perard@citrix.com> wrote=
:
>=20
> Use "define" for the headers*_chk commands as otherwise the "#"
> is interpreted as a comment and make can't find the end of
> $(foreach,).
>=20
> Adding several .PRECIOUS as without them `make` deletes the
> intermediate targets. This is an issue because the macro $(if_changed,)
> check if the target exist in order to decide whether to recreate the
> target.
>=20
> Removing the call to `mkdir` from the commands. Those aren't needed
> anymore because a rune in Rules.mk creates the directory for each
> $(targets).
>=20
> Remove "export PYTHON" as it is already exported.

With this change, compiling for x86 is now ending up in:
CHK     include/headers99.chk
make[9]: execvp: /bin/sh: Argument list too long
make[9]: *** [include/Makefile:181: include/headers++.chk] Error 127

Not quite sure yet why but I wanted to signal it early as other might be im=
pacted.

Arm and arm64 builds are not impacted.

Cheers
Bertrand

>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> xen/include/Makefile | 108 ++++++++++++++++++++++++++++++-------------
> 1 file changed, 76 insertions(+), 32 deletions(-)
>=20
> diff --git a/xen/include/Makefile b/xen/include/Makefile
> index 03baf10efb..6d9bcc19b0 100644
> --- a/xen/include/Makefile
> +++ b/xen/include/Makefile
> @@ -45,38 +45,65 @@ public-$(CONFIG_ARM) :=3D $(wildcard $(srcdir)/public=
/arch-arm/*.h $(srcdir)/publi
> .PHONY: all
> all: $(addprefix $(obj)/,$(headers-y))
>=20
> -$(obj)/compat/%.h: $(obj)/compat/%.i $(srcdir)/Makefile $(srctree)/tools=
/compat-build-header.py
> -	$(PYTHON) $(srctree)/tools/compat-build-header.py <$< $(patsubst $(obj)=
/%,%,$@) >>$@.new; \
> -	mv -f $@.new $@
> -
> -$(obj)/compat/%.i: $(obj)/compat/%.c $(srcdir)/Makefile
> -	$(CPP) $(filter-out -Wa$(comma)% -include %/include/xen/config.h,$(XEN_=
CFLAGS)) $(cppflags-y) -o $@ $<
> -
> -$(obj)/compat/%.c: $(src)/public/%.h $(srcdir)/xlat.lst $(srcdir)/Makefi=
le $(srctree)/tools/compat-build-source.py
> -	mkdir -p $(@D)
> -	$(PYTHON) $(srctree)/tools/compat-build-source.py $(srcdir)/xlat.lst <$=
< >$@.new
> -	mv -f $@.new $@
> -
> -$(obj)/compat/.xlat/%.h: $(obj)/compat/%.h $(obj)/compat/.xlat/%.lst $(s=
rctree)/tools/get-fields.sh $(srcdir)/Makefile
> -	export PYTHON=3D$(PYTHON); \
> -	while read what name; do \
> -		$(SHELL) $(srctree)/tools/get-fields.sh "$$what" compat_$$name $< || e=
xit $$?; \
> -	done <$(patsubst $(obj)/compat/%,$(obj)/compat/.xlat/%,$(basename $<)).=
lst >$@.new
> -	mv -f $@.new $@
> +quiet_cmd_compat_h =3D GEN     $@
> +cmd_compat_h =3D \
> +    $(PYTHON) $(srctree)/tools/compat-build-header.py <$< $(patsubst $(o=
bj)/%,%,$@) >>$@.new; \
> +    mv -f $@.new $@
> +
> +quiet_cmd_compat_i =3D CPP     $@
> +cmd_compat_i =3D $(CPP) $(filter-out -Wa$(comma)% -include %/include/xen=
/config.h,$(XEN_CFLAGS)) $(cppflags-y) -o $@ $<
> +
> +quiet_cmd_compat_c =3D GEN     $@
> +cmd_compat_c =3D \
> +   $(PYTHON) $(srctree)/tools/compat-build-source.py $(srcdir)/xlat.lst =
<$< >$@.new; \
> +   mv -f $@.new $@
> +
> +quiet_cmd_xlat_headers =3D GEN     $@
> +cmd_xlat_headers =3D \
> +    while read what name; do \
> +        $(SHELL) $(srctree)/tools/get-fields.sh "$$what" compat_$$name $=
< || exit $$?; \
> +    done <$(patsubst $(obj)/compat/%,$(obj)/compat/.xlat/%,$(basename $<=
)).lst >$@.new; \
> +    mv -f $@.new $@
> +
> +targets +=3D $(headers-y)
> +$(obj)/compat/%.h: $(obj)/compat/%.i $(srctree)/tools/compat-build-heade=
r.py FORCE
> +	$(call if_changed,compat_h)
> +
> +.PRECIOUS: $(obj)/compat/%.i
> +targets +=3D $(patsubst %.h, %.i, $(headers-y))
> +$(obj)/compat/%.i: $(obj)/compat/%.c FORCE
> +	$(call if_changed,compat_i)
> +
> +.PRECIOUS: $(obj)/compat/%.c
> +targets +=3D $(patsubst %.h, %.c, $(headers-y))
> +$(obj)/compat/%.c: $(src)/public/%.h $(srcdir)/xlat.lst $(srctree)/tools=
/compat-build-source.py FORCE
> +	$(call if_changed,compat_c)
> +
> +targets +=3D $(patsubst compat/%, compat/.xlat/%, $(headers-y))
> +$(obj)/compat/.xlat/%.h: $(obj)/compat/%.h $(obj)/compat/.xlat/%.lst $(s=
rctree)/tools/get-fields.sh FORCE
> +	$(call if_changed,xlat_headers)
> +
> +quiet_cmd_xlat_lst =3D GEN     $@
> +cmd_xlat_lst =3D \
> +	grep -v '^[[:blank:]]*$(pound)' $< | sed -ne 's,@arch@,$(compat-arch-y)=
,g' -re 's,[[:blank:]]+$*\.h[[:blank:]]*$$,,p' >$@.new; \
> +	$(call move-if-changed,$@.new,$@)
>=20
> .PRECIOUS: $(obj)/compat/.xlat/%.lst
> -$(obj)/compat/.xlat/%.lst: $(srcdir)/xlat.lst $(srcdir)/Makefile
> -	mkdir -p $(@D)
> -	grep -v '^[[:blank:]]*#' $< | sed -ne 's,@arch@,$(compat-arch-y),g' -re=
 's,[[:blank:]]+$*\.h[[:blank:]]*$$,,p' >$@.new
> -	$(call move-if-changed,$@.new,$@)
> +targets +=3D $(patsubst compat/%.h, compat/.xlat/%.lst, $(headers-y))
> +$(obj)/compat/.xlat/%.lst: $(srcdir)/xlat.lst FORCE
> +	$(call if_changed,xlat_lst)
>=20
> xlat-y :=3D $(shell sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,^[?!][[:=
blank:]]+[^[:blank:]]+[[:blank:]]+,,p' $(srcdir)/xlat.lst | uniq)
> xlat-y :=3D $(filter $(patsubst compat/%,%,$(headers-y)),$(xlat-y))
>=20
> -$(obj)/compat/xlat.h: $(addprefix $(obj)/compat/.xlat/,$(xlat-y)) $(obj)=
/config/auto.conf $(srcdir)/Makefile
> -	cat $(filter %.h,$^) >$@.new
> +quiet_cmd_xlat_h =3D GEN     $@
> +cmd_xlat_h =3D \
> +	cat $(filter %.h,$^) >$@.new; \
> 	mv -f $@.new $@
>=20
> +$(obj)/compat/xlat.h: $(addprefix $(obj)/compat/.xlat/,$(xlat-y)) $(obj)=
/config/auto.conf FORCE
> +	$(call if_changed,xlat_h)
> +
> ifeq ($(XEN_TARGET_ARCH),$(XEN_COMPILE_ARCH))
>=20
> all: $(obj)/headers.chk $(obj)/headers99.chk $(obj)/headers++.chk
> @@ -102,27 +129,31 @@ PUBLIC_C99_HEADERS :=3D $(call public-filter-header=
s,public-c99-headers)
> $(src)/public/io/9pfs.h-prereq :=3D string
> $(src)/public/io/pvcalls.h-prereq :=3D string
>=20
> -$(obj)/headers.chk: $(PUBLIC_ANSI_HEADERS) $(srcdir)/Makefile
> +quiet_cmd_header_chk =3D CHK     $@
> +cmd_header_chk =3D \
> 	for i in $(filter %.h,$^); do \
> 	    $(CC) -x c -ansi -Wall -Werror -include stdint.h \
> 	          -S -o /dev/null $$i || exit 1; \
> 	    echo $$i; \
> -	done >$@.new
> +	done >$@.new; \
> 	mv $@.new $@
>=20
> -$(obj)/headers99.chk: $(PUBLIC_C99_HEADERS) $(srcdir)/Makefile
> -	rm -f $@.new
> +quiet_cmd_headers99_chk =3D CHK     $@
> +define cmd_headers99_chk
> +	rm -f $@.new; \
> 	$(foreach i, $(filter %.h,$^),                                        \
> 	    echo "#include "\"$(i)\"                                          \
> 	    | $(CC) -x c -std=3Dc99 -Wall -Werror                               =
\
> 	      -include stdint.h                                               \
> 	      $(foreach j, $($(patsubst $(srctree)/%,%,$i)-prereq), -include $(j=
).h) \
> 	      -S -o /dev/null -                                               \
> -	    || exit $$?; echo $(i) >> $@.new;)
> +	    || exit $$?; echo $(i) >> $@.new;) \
> 	mv $@.new $@
> +endef
>=20
> -$(obj)/headers++.chk: $(PUBLIC_HEADERS) $(srcdir)/Makefile
> -	rm -f $@.new
> +quiet_cmd_headerscxx_chk =3D CHK     $@
> +define cmd_headerscxx_chk
> +	rm -f $@.new; \
> 	if ! $(CXX) -v >/dev/null 2>&1; then                                  \
> 	    touch $@.new;                                                     \
> 	    exit 0;                                                           \
> @@ -133,8 +164,21 @@ $(obj)/headers++.chk: $(PUBLIC_HEADERS) $(srcdir)/Ma=
kefile
> 	      -include stdint.h -include $(srcdir)/public/xen.h               \
> 	      $(foreach j, $($(patsubst $(srctree)/%,%,$i)-prereq), -include c$(=
j)) \
> 	      -S -o /dev/null -                                               \
> -	    || exit $$?; echo $(i) >> $@.new;)
> +	    || exit $$?; echo $(i) >> $@.new;) \
> 	mv $@.new $@
> +endef
> +
> +targets +=3D headers.chk
> +$(obj)/headers.chk: $(PUBLIC_ANSI_HEADERS) FORCE
> +	$(call if_changed,header_chk)
> +
> +targets +=3D headers99.chk
> +$(obj)/headers99.chk: $(PUBLIC_C99_HEADERS) FORCE
> +	$(call if_changed,headers99_chk)
> +
> +targets +=3D headers++.chk
> +$(obj)/headers++.chk: $(PUBLIC_HEADERS) FORCE
> +	$(call if_changed,headerscxx_chk)
>=20
> endif
>=20
> --=20
> Anthony PERARD
>=20
>=20


