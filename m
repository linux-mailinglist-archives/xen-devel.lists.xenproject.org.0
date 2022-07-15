Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08450575B22
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 08:01:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367917.599100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCENV-0004IF-GK; Fri, 15 Jul 2022 06:00:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367917.599100; Fri, 15 Jul 2022 06:00:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCENV-0004Fe-Cz; Fri, 15 Jul 2022 06:00:41 +0000
Received: by outflank-mailman (input) for mailman id 367917;
 Fri, 15 Jul 2022 06:00:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+lEG=XU=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oCENT-0003xG-9E
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 06:00:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2071.outbound.protection.outlook.com [40.107.21.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 735e7e3b-0403-11ed-924f-1f966e50362f;
 Fri, 15 Jul 2022 08:00:38 +0200 (CEST)
Received: from DU2PR04CA0067.eurprd04.prod.outlook.com (2603:10a6:10:232::12)
 by VI1PR08MB2704.eurprd08.prod.outlook.com (2603:10a6:802:1b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Fri, 15 Jul
 2022 06:00:09 +0000
Received: from DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::f7) by DU2PR04CA0067.outlook.office365.com
 (2603:10a6:10:232::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17 via Frontend
 Transport; Fri, 15 Jul 2022 06:00:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT060.mail.protection.outlook.com (100.127.142.238) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Fri, 15 Jul 2022 06:00:09 +0000
Received: ("Tessian outbound e5f49c5d38f9:v122");
 Fri, 15 Jul 2022 06:00:09 +0000
Received: from 5417a9e41465.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5717585E-11E4-4806-A2E0-614EB68FE600.1; 
 Fri, 15 Jul 2022 05:59:59 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5417a9e41465.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Jul 2022 05:59:59 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB6PR0801MB1974.eurprd08.prod.outlook.com (2603:10a6:4:72::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.21; Fri, 15 Jul
 2022 05:59:57 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%8]) with mapi id 15.20.5438.012; Fri, 15 Jul 2022
 05:59:56 +0000
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
X-Inumbo-ID: 735e7e3b-0403-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=WLKcgiuWGMxRRiBFZpLj7iUkIAonHCw3KasOAVFdLMl5NPgo+goyvL18fhtW0SABtR01cNVkaP5s5q1fvwB3lxOjXJc2QFAoU45HXrFfxHrellW8ngyn2Qbar0AORv9Wcx5sJ33RbUq5lq3dFE1KNpooz5a4l+9x0EPOWXYbb5gfdhB4ORyEwXFpnvT+R9zM+niKhLE2Orz6/f0eZe4eZdgbuP8gmgESZL2Pb8SIkaIY1UeV6C/ey6ySfOho5P0EN0kqbrVYVS7UgH109Mwy8oRD9k2ns49f8v1I/OZEtdH1JZPSombmOj8rhspIxphnQLqnhjIVpYrPxFNYPXE91Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPOYveqwoRW4k7OC0VPBqWQKtvV8eUY2IV2jDi9z8TM=;
 b=GZzJDNo+a/MDdQRmgZN6Ha7fCPHqWu2cnNSb28voMSyWBE07VLN2+7PpPSTYjTatQuxQ2ymj2L6OIGPIjPpvjPXBt/thX+VNiqTe/2FJ2uzQVC8NAJU5uE8TMDxNK8C2eIOSYGdL0b2YLrmBZfMolKjaju9HZCd2VQINuam6vKsITwhamls8ro0HBLzRZOIIjtGo9TEJEGfq1lsnjso1+dVk/fYmIpzk2GNUccUXc1apzF8DPpt22iBo0Ded4qs02LX5FnEtlUU2/Ef3CRdFXQBizVt6bHYfQ9apII7A9LDYBjnsz7kj0oQZyX0LESaTdDMoVkhG27n/OizntxV10g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPOYveqwoRW4k7OC0VPBqWQKtvV8eUY2IV2jDi9z8TM=;
 b=jwT56aKi8Qb7eOhV/p1YI3R2wiA5T0i4wayLLIKqpfVC2wj928Tyuyi0kDwcKRyB3YQDJ+653K5LPzAGHsAQXiXl2m824Tj4mIgtM4UMvDD/BZgtcWel4AcXd1ahFeQyofu6gCEAhX04uYgiX2rjs5z7anoEvHoDPLVyd42i7Lw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1qPEzUg0SIQOMQ/FjcdB0zaKi7SUGgNCrdsPBM4jTxjfhU/jQb0a6BI3+pfoVsUxSBD2k2M4H+ouivXwHkWiVs5CAC29FNQ5k8HQlz8aiCqgq+P86WKhFxRJjxPWbqAVchbajbNBBmKB0O4Aam2v0mIq5JyeqGg/cfj6DkUBpc7VY5yMe3tJOgRBd+CCFrcfe6/MYhseLsMqCEiBi7bQvrmAgNYf+2w/NSBLwsZ902nUQLLx8zXzL4SL6BG3bsHhPQ/aXwk27YdUjsXecVt+liExzGplnINv9/5M1P+PbzzgdxgQDP7O5CcwbSTnhnMRZj8INyzDmOHFeCANEDfqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPOYveqwoRW4k7OC0VPBqWQKtvV8eUY2IV2jDi9z8TM=;
 b=Q2Ss156bD30jb48avlDc+R6As0rjYXEf2aN73KVaDrZ3F4rPRtkzwkSqgw/NfJoxdxoGKadYA4La1oHKoa4gPN0aSjtAcGIvvU0XitNl7qipqO/IIf+BnQ8whsimQ4DEZ+sYgy9OcCZGyeQK318QXo0wuyjk9JvhJUjYP2RtF680fRzfAPFsc5pCW1+sCRTSMn2QcjWSjxbUhZ+cnjXJRcieM8lfLQPZw03pyWn9ddQ2yxuHplWNzdIZ1fjwaLlxF0oqddWOyXLudcfAKFW0NNw0XT9wXLuABvK93MJMyi0zzNJxBGMI9fue+bawo7knrAnHBU5NW1R9XGTwu0m3lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPOYveqwoRW4k7OC0VPBqWQKtvV8eUY2IV2jDi9z8TM=;
 b=jwT56aKi8Qb7eOhV/p1YI3R2wiA5T0i4wayLLIKqpfVC2wj928Tyuyi0kDwcKRyB3YQDJ+653K5LPzAGHsAQXiXl2m824Tj4mIgtM4UMvDD/BZgtcWel4AcXd1ahFeQyofu6gCEAhX04uYgiX2rjs5z7anoEvHoDPLVyd42i7Lw=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jgross@suse.com" <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, "Wei Liu (LSG)"
	<liuwe@microsoft.com>
Subject: RE: Xen 4.17: Proposed release schedule
Thread-Topic: Xen 4.17: Proposed release schedule
Thread-Index: AdiSei6vjIC3DQhRQxe+drETJuVp3wFlFvgQ
Date: Fri, 15 Jul 2022 05:59:56 +0000
Message-ID:
 <AS8PR08MB799136BC58931DC8E58C04DD928B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <AS8PR08MB7991145C8063D6939AFFED8F92829@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB7991145C8063D6939AFFED8F92829@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C652778E3AB11A4B99D2116111B11912.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a344b3a5-b686-4b48-182b-08da66274624
x-ms-traffictypediagnostic:
	DB6PR0801MB1974:EE_|DBAEUR03FT060:EE_|VI1PR08MB2704:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4gIalwd+8uHDKg6Q5jwezs3kVXvGwnInow4WjoDibQCNtwLVL6x3k6PE4wEmPHSWjI4IG20uj7G7bjuI4Y6OC7uw7Yn7YIskBSe9iCtj8+qNQBG5alaKiEGj1iqr2oG8Mo4sP91EKz7KrlXQrE5Rg20UjjdsncAlWAMlA2VOFChWupCmqirIwc9hzxn+fb++joZOPa/ZNdJXLn+jIKbBMwbbMUNC/I4aWyzj4w7pch3dyvdSONYvSZF3WRra8WjbfKNLzMEAsavxBN6+LNh6RgFiCPjCHIIWyWhp6U1QiJxQTkx17guR3tWQDEIx+7k70GcTNCv9LudmO/h0pzM/9nDtTbym/Qvc2mzUrqHxu3oUFkCTL+efdfUKyLpkueATIv8MrC33ds1/+Op/s7LjdNygdPGdowvHLaZcE4x5+XTc6Ug2Inq26neWbLaSzutDcH8WzILs8LSnQ2FmQbb/4l857KzNCX+38McISxW7ClykQGriTPqNj/8XNqIdUOFoz1jGmDqrZyTxHmKfuRIAp9q/a8qvpJTK1VCsVnPHJDh5dDYDsIlLdaitYicO28oy+NVpzcfZsEid8ypqhfvyZLsB4yRiD75ojnXkg3RTac4v8YSZMDodfzsMTIchF6DSE12RJZDJbR2TRcNHK5+uj/cR0IH6jXGdTOmvRanklWHkdW02yJXeoiLKr5bVzMmPgGcJOqdSo4w5AmjoptAAveZEai1W9ypg6RO5lnoebbPVMmJ8b0l+b10EVI1Ye3ODsJ6Bo2TTbKXTrCEcdKQPfbhxv+71ypEZB9Opn8ogWhbeOPaZUe4SAQBTRw/ovqZT
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(8936002)(9686003)(55016003)(2906002)(4744005)(33656002)(6506007)(83380400001)(41300700001)(64756008)(26005)(4326008)(478600001)(66446008)(186003)(8676002)(76116006)(66946007)(71200400001)(122000001)(7416002)(7696005)(66556008)(66476007)(38100700002)(38070700005)(52536014)(54906003)(86362001)(6916009)(5660300002)(316002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1974
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5427f22d-df6f-4fb2-5ea3-08da66273e79
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yWIgcWRGV7o3UljweiWnx+xWg8TvB9ty0ceqpyzG2dDPEv0asOQpIFhnvD4VfXmJhggDOegtIwxz0O+Vo/jzUXcrjn4za6XjdDhD8TLlqP6T4KjiYVJZyJQRtdL0jtrj7JwMZBf9sxiaEdNmeg+/rYQXSwvOcEJg9UbjNYbxJybycrjW8r96GIQkEzGwzrt1aYOq44DDsyaTInnYemPO8+rWGkS1k+7R8oD3+GakRsCVcNQyRy4IFPo/7LM3/rHsSGdqQV6bms21uL9Y3Z067C+H+S/hl/Vk3kA9mP4GHB+VOveJCldrd/PB01kuIpd4jZA1O8NhGgaurpEsyMXQ1wDifLxYQX0Ad4yUtW57XxpxATGwvka0FzM3v239utNZrmaj+SxE2gYCGAZyN8GhA1aBFmwEVGRfbxgEMrN1pK/q8hVHMGDssPzaSppsmAOula4EivFbQVY3GenlRJQUX+mhQ1fhZYqzWLOSSg3lsuXzcyoRSkvcUKVWXPyKBRFoFRPnp3HA6yvnaqqAc/g/12rnLRP7rAYxzMjVdJG9sYdXKUg7GwIHDX1szqIgP0qu/S8Fjezy8pbbbqfN1llftcs0fhXt40hjK23uSQAOFrhIsLDKB3FnNWX2URz546aMGakj47ZAEQnlH8s+cmzpVQc7neaFxJCpnKL9BbS6iGoCwSk/+MATqLF3nETYwH54ruqAIMaxua7/Lme3IHOgTWTWaslzTaPPnFrgb/C5C96O1/h5WYMRtWCuAFFsSsnr2Xkek8URuvIcaAuXdejK3Ce1NyJlc0W6Sxh2gl9t9pvJAns4qrt0TOWAYLwFTcPZ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(136003)(376002)(346002)(40470700004)(36840700001)(46966006)(47076005)(82310400005)(52536014)(70586007)(82740400003)(55016003)(2906002)(40460700003)(86362001)(36860700001)(70206006)(6916009)(8936002)(81166007)(336012)(4326008)(40480700001)(356005)(478600001)(33656002)(4744005)(83380400001)(41300700001)(26005)(186003)(9686003)(5660300002)(6506007)(316002)(107886003)(7696005)(8676002)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 06:00:09.2562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a344b3a5-b686-4b48-182b-08da66274624
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2704

Hi,

> -----Original Message-----
> From: Henry Wang
> Subject: Xen 4.17: Proposed release schedule
>=20
> Hi,
>=20
> As discussed in the community call on July 7, the release schedule for Xe=
n
> 4.17 is proposed below. Please send comments ASAP and in any case by the
> end of Friday the 15th of July. I hope we can finalise the schedule then.

Since everyone (who voted for the release) chose below, I guess we can
follow the timeline for the Xen 4.17 release.

Proposed option: Wed Nov 2, 2022
(+1 year from Xen 4.16 release)

- Last posting date          Fri Aug 12, 2022 (+5 weeks from now)

- Feature freeze             Fri Sep 2, 2022 (+3 weeks from Last posting da=
te)

- Code freeze                Fri Sep 23, 2022 (+3 weeks from Feature freeze=
)

- Hard code freeze           Fri Oct 14, 2022 (+3 weeks from Code freeze)

- Final commits              Fri Oct 28, 2022 (+2 weeks from Hard code free=
ze)

- Release                    Wed Nov 2, 2022

From now on, I will post reminders one week before important dates.

Kind regards,
Henry

