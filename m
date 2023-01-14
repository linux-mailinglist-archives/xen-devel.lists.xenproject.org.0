Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8993B66A895
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jan 2023 03:18:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477606.740381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGW6H-0002on-0S; Sat, 14 Jan 2023 02:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477606.740381; Sat, 14 Jan 2023 02:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGW6G-0002n6-Qk; Sat, 14 Jan 2023 02:16:52 +0000
Received: by outflank-mailman (input) for mailman id 477606;
 Sat, 14 Jan 2023 02:16:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8OqO=5L=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pGW6E-0002n0-OA
 for xen-devel@lists.xenproject.org; Sat, 14 Jan 2023 02:16:50 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2076.outbound.protection.outlook.com [40.107.22.76])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f14e528-93b1-11ed-b8d0-410ff93cb8f0;
 Sat, 14 Jan 2023 03:16:47 +0100 (CET)
Received: from AS8P189CA0025.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::26)
 by DB4PR08MB7935.eurprd08.prod.outlook.com (2603:10a6:10:379::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Sat, 14 Jan
 2023 02:16:42 +0000
Received: from AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31f:cafe::f4) by AS8P189CA0025.outlook.office365.com
 (2603:10a6:20b:31f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.16 via Frontend
 Transport; Sat, 14 Jan 2023 02:16:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT056.mail.protection.outlook.com (100.127.140.107) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Sat, 14 Jan 2023 02:16:41 +0000
Received: ("Tessian outbound 8038f0863a52:v132");
 Sat, 14 Jan 2023 02:16:40 +0000
Received: from f8e558cb977a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 08BC1FCF-5E4B-44FA-B701-649627159BB4.1; 
 Sat, 14 Jan 2023 02:16:34 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f8e558cb977a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 14 Jan 2023 02:16:34 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB8746.eurprd08.prod.outlook.com (2603:10a6:20b:55e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Sat, 14 Jan
 2023 02:16:33 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%5]) with mapi id 15.20.5986.018; Sat, 14 Jan 2023
 02:16:32 +0000
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
X-Inumbo-ID: 7f14e528-93b1-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usH70UPyi66+A0kDY5WODCtqwfRUynUMRZuCEGEjch0=;
 b=II/Bfmg9FB1N951GhzUAmoo2mbW9baLGGxy5IZocyIK5ltNHbLaMAmrrJ9nU7Q39sCZhtg38coVWTQ/cmvyTKc5XDi/yE8ewKnKbg2cw2iE+KgelOePDy8zdAU4VcJlAZ2tE40c7Ia64PLnBIX1Nqi4AALbZYjMNbBJydE3W0oQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LfN3v8flniCq7AAE8XBa0VIiVmB9IkCiVcnbQVylGV7uHhcK50+o811z1Gm4lvdZeJt8asIw20S7GdAuJbW6WqamO/qS+r/lhBwfKsx33ns8OBdvoSRPzZkhqLuPd04gdbzd/Tt+OguHqJQ7k74J7G5YtkMmNLbw+9nSeAEdvkZEEZM2BCmHSfoHBHBw2yJGWccpaJfwjLIue+TboEGqgAoNTIhktvuyhZOGlNUR3Vlh0aXGS3ZzRHTaLXGO7zwYe3oQ+8ZxssoEl7FSrAPOOJBLYD8+0EJWnFVeu1kQylJ9JY1cjvLS+T84Ykaw7vDpupOxMQhtYFvD7VZltOPDRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usH70UPyi66+A0kDY5WODCtqwfRUynUMRZuCEGEjch0=;
 b=D/Qgq31TYgunEuwHXopbZ0voDrS0Tlh5BPGsAhIhhAv3mDjKhacGY+Gp/+eb5jrCmxOuMNrdAsBB7qi2Miwf4r1sLpPPXuukho5520NwkJKSFS3axliCKJZkIt4Ru+XlS/h/AM+/XEIn7GJRlcBAwZXh+lzFxK7KKj/T2RWqYpNLLFicDHk6z2AFSOWUwJv4nn4q6a3f2lvMo586Lp6CK9nW0CsnoxNvsIMEu+VNOTyc8e4xcrLDIB6UFJ7hWH8Li7k5GvZAGERiKjJDHhi53KNanVFey9qFkMsIwFrJarRR6DKMZqn2j5k1nBeV1XuuIBD+6M3a4C9wNg5i5ZyA2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usH70UPyi66+A0kDY5WODCtqwfRUynUMRZuCEGEjch0=;
 b=II/Bfmg9FB1N951GhzUAmoo2mbW9baLGGxy5IZocyIK5ltNHbLaMAmrrJ9nU7Q39sCZhtg38coVWTQ/cmvyTKc5XDi/yE8ewKnKbg2cw2iE+KgelOePDy8zdAU4VcJlAZ2tE40c7Ia64PLnBIX1Nqi4AALbZYjMNbBJydE3W0oQ=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v4 08/14] xen/arm32: head: Introduce an helper to flush
 the TLBs
Thread-Topic: [PATCH v4 08/14] xen/arm32: head: Introduce an helper to flush
 the TLBs
Thread-Index: AQHZJzeD+kLxmSVjqEKBUhQr2u05s66dC6eg
Date: Sat, 14 Jan 2023 02:16:32 +0000
Message-ID:
 <AS8PR08MB7991DC731D328F291043BB6F92C39@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-9-julien@xen.org>
In-Reply-To: <20230113101136.479-9-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D832F04FED09504FA83717A80094C7D7.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS2PR08MB8746:EE_|AM7EUR03FT056:EE_|DB4PR08MB7935:EE_
X-MS-Office365-Filtering-Correlation-Id: d26e0d94-1afd-41d7-74db-08daf5d55ff4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 f2gjBxfbt8dE0RDWXBpN6dtCBh2L6wytkGZTl1xsihvTPKGYqJirhm+230NMhap+UiwSQxg9ocsWEccszui3EXRQG70BHv+Fb7iScoeugQz376Tdlf0B81xQRM0Por6fJ2WCM47XUEox8LX99NioYSfBGGI4pIbkI+gfi/shY1aplJwqMIsadAGVj2IZ2eNbfD+ZO08riwgpfhWR61QkPccER6YRI0v+FQ2PgqxULrfa/r48UrYoIWCFAVL/nKSqVNAq4JhNh0a49+DEuDRIAFWjvYHutBkIkTfp2Q/PZ8ol9FDpTmHYB7OqfnoViWuqg+YXi2NlCHnZTNdYkMV7CNZkHwJza0gdTGvOFyPmBLPJIHmiMdsFObVEQXHL4FUHXvHbLglKBzBytjlc/i0xU+9ct7N8fpfTpLU9CAYLqwTp51sSpXUiWlPG/RRMyWRAmgNeZiBvsW1d/XgvQfQXJarx/xwyr0i/6pv1DJutUHlcn9BZPrjtLOLTfNesSUKyI6viygVUy/jFnHT3N/vNdv96YI6Y4O4d+1zTpIiDsXhGEpQoqS6faJUNVfpZL2TRymsoxY4bKFmqxWy72nmBn7CdtzVsKwzytsS/CfC/NU6nD/aGcU+0AKJma6VDdcwgXg8dljHQkyUNgLtFmG4OPnIFgkQ8MDbkenQ28rCkBihqIQsJI61oy4ecARmpvMH+HxQ/1WBpPLUYUUhwpOPDZg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(451199015)(38100700002)(66446008)(71200400001)(52536014)(4326008)(8936002)(122000001)(66946007)(66476007)(64756008)(66556008)(8676002)(5660300002)(4744005)(76116006)(33656002)(86362001)(316002)(110136005)(38070700005)(26005)(2906002)(54906003)(83380400001)(7696005)(41300700001)(478600001)(186003)(55016003)(9686003)(6506007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8746
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d5f0cfac-69cc-4f98-9794-08daf5d55a7b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	akIp2qXj8wc2tR8XD62FxL2CEyOb9+gwRrWIPSrbFeGPcG2YdG7mF/gqKHehY9vMHWql/sWh2XTbwKL6JeaPahZ9oJhprPgdCwhUNTP7gJRYNt3XpvrsutXWU1JhKcCiNbudT5KcUxqcZe31z6YMhQvIUjgLtFg777iUSUH9WZ/Lm3/h0dhjQGqOkeC18tPJuVSZL+II3NTuEV65m+IK43LUzFeFCqWbKKYCVcfc6FLRq9wi2aPhWoK3c2TkJm8NItnC3UYOn1gPkv6vZZkUnq1Ukc3B1moNHo+PNieSR7T5l2b5ob6jj+CURprOwM3X0FkQZTk4ouIBIqTutmv1tA6GwoG6q8tcPBqhRM9ncv4CtLm+0aCC2GeBsPX1JixoYXQB8/eYHkWqCOs7vEmCZdgrMiUEoxZDxU2z/rz1z7X2AR8KA0ao/c9Hs3Mn8PHx+JuMcKadnJcGS35ftO6hNAT8AScx0s4K0BsmFi5TbdomidW4MMzlG8m0yEGdxwVpnTV9C8sAguoSNnWtej8SVNK4Hk6j9BAkjLKtJL/2uE9XRPBnZe6B3W+kPPFmEto/iTSPxCE56GU3aWRdU2gneKOOMSAhO0MJzQdmNjFIcaEzJiX8ceFdMHCJwM/jSJU1myA3se4AxcmeHZm0K0yxdC8vxJ9m9Xi+UDtZfWZobaIacCTbEhmWGGlQFD8Q3pj1fS+8akjJ/40B8mmeYotO5A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199015)(46966006)(36840700001)(40470700004)(54906003)(47076005)(55016003)(110136005)(83380400001)(336012)(356005)(70586007)(33656002)(70206006)(81166007)(36860700001)(8936002)(82310400005)(82740400003)(4326008)(40460700003)(8676002)(2906002)(52536014)(5660300002)(107886003)(316002)(6506007)(86362001)(41300700001)(478600001)(186003)(9686003)(26005)(7696005)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2023 02:16:41.2416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d26e0d94-1afd-41d7-74db-08daf5d55ff4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB7935

Hi Julien,

> -----Original Message-----
> Subject: [PATCH v4 08/14] xen/arm32: head: Introduce an helper to flush t=
he
> TLBs
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> The sequence for flushing the TLBs is 4 instruction long and often
> requires an explanation how it works.
>=20
> So create a helper and use it in the boot code (switch_ttbr() is left
> alone until we decide the semantic of the call).
>=20
> Note that in secondary_switched, we were also flushing the instruction
> cache and branch predictor. Neither of them was necessary because:
>     * We are only supporting IVIPT cache on arm32, so the instruction
>       cache flush is only necessary when executable code is modified.
>       None of the boot code is doing that.
>     * The instruction cache is not invalidated and misprediction is not
>       a problem at boot.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

I've also tested this patch on FVP in arm32 execution mode, and
this patch is good, so:

Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

