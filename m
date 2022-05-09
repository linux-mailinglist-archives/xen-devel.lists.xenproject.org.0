Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D1551FD1B
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 14:42:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324512.546592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no2h5-00043b-3Q; Mon, 09 May 2022 12:40:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324512.546592; Mon, 09 May 2022 12:40:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no2h4-00041b-W9; Mon, 09 May 2022 12:40:54 +0000
Received: by outflank-mailman (input) for mailman id 324512;
 Mon, 09 May 2022 12:40:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=11oC=VR=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1no2h3-00041V-03
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 12:40:53 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe06::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4218766f-cf95-11ec-8fc4-03012f2f19d4;
 Mon, 09 May 2022 14:40:51 +0200 (CEST)
Received: from DB6PR07CA0011.eurprd07.prod.outlook.com (2603:10a6:6:2d::21) by
 VI1PR08MB2703.eurprd08.prod.outlook.com (2603:10a6:802:25::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.18; Mon, 9 May 2022 12:40:46 +0000
Received: from DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::83) by DB6PR07CA0011.outlook.office365.com
 (2603:10a6:6:2d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Mon, 9 May 2022 12:40:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT052.mail.protection.outlook.com (100.127.142.144) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Mon, 9 May 2022 12:40:45 +0000
Received: ("Tessian outbound 9511859e950a:v118");
 Mon, 09 May 2022 12:40:45 +0000
Received: from 08004081d201.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 344F47BC-7D6B-404A-92CD-5363E948F5E2.1; 
 Mon, 09 May 2022 12:40:38 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 08004081d201.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 09 May 2022 12:40:38 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR0802MB2287.eurprd08.prod.outlook.com (2603:10a6:800:9d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Mon, 9 May
 2022 12:40:36 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 12:40:36 +0000
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
X-Inumbo-ID: 4218766f-cf95-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=neqWhOWh4YVFDay/iyWb6YMr8ElK62YSGWeq93gmXshjsl63lEMoM3ZitxOBRz0krcF20ES48zCA+KE5faNCQfvlZhd6jgTF4Crcujq0HWj1vhMlIUhWF+ZxF5kRCFGUWBRLfDWf9aTzgiIa9Dxe2jJ2bk38Gsiie9sxkdk9ADhlxevK2WI5zcXqDg6RNklveewVOSPbYYXYPlSVQMBdn0HjNzrvIeSz1om2qgotB15SjpF1RxIizMO+gwhkeVkY5PFCCe6Z6GrdS+k+F3Ljwv0GMRS+iZwVI5lbTrPiU79mp1+Hbd9E9dNo7/xc1TiW4nIl9oX05U6h5zcgUqZ6cg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xp2I61m9Euis7KFkFoxjtRVQDm4E+k2+RKCuqZHlTXI=;
 b=C0JGkslR1RjHOPyz6AoFcZzzCaKUTzfWgK5o6R9/RYaMFsASOsXuwJdeQ4XXtUSdU/UXb11HdqjLpQivwO39mOcYsykN8ZmDzOiozrWB7brCn6jQwpD3WsWqe9XyFjckyrvB7PaXaAQnR6hKKEhoJtf0OgV7nZqqngTN/CJkQDHtxpPJ1CQrrVY3Z1hBnGZs+MMFwqta+CIuUDqQEe2LnKzuc5XCeekSPNnHSs5fw4x3K/PjO2cRacymXk+FSLR511+HsJ0DFj/uxHxGgACZbRupjgLFhiFGLNCQc3T/lShN5iU/jIFuKgRyj5ABCphgYRTm6jqK0LjSB+oQteY97Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xp2I61m9Euis7KFkFoxjtRVQDm4E+k2+RKCuqZHlTXI=;
 b=TsJsbFD5VB2RUxnuwQ7H30O3X+7a/uutxb4QS7B3jwh8whY2cR2YMsFm4KVjIRDqF0ElEar/Ep3O4yFTSFumYjyvW9V9ny7z1am33vd3LpZTrMdEbJFa20Q/7FxcegrQaEb28Yz8UyqrMZrIJ1d2Ncp1WwM9T7MDEod61FIsGyc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6a74bf73c8547bf1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kd/k1BWb62fFgP6GSTX7B3eH7QWlKo0Jn1ULUZD2AfaiRzDlNiSwLs3yxSNYx3ZERvTPM26+NSfPBCqsWoiAzm2kSowTP6CuqthGuUkRxcvIpLRUn1gd8EKQVMNAOL7oHt5KCi+PkiddR6i14u5aG1M3v9tharQn5r1W8zYlec6zxPb732ewGwneO0EnRKYtM1Z2mRzfyNECb4hKQobTQWydV02ZQR2blqvsjAhba27ymp4SS+1k1icLw3k37KOOfljxdGdzWtVimpMCrxjPDEkRe3X3LVwMMJ1XIeVnpzrk1JU3mFQttplr7UhfgP/sLo0JUbFGYtr+JoNG94tojg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xp2I61m9Euis7KFkFoxjtRVQDm4E+k2+RKCuqZHlTXI=;
 b=IfbuLuTAUyxXLPV9jwetLLmn4DHD1Gq5q4JgHbr8edXYG/fDY+HyegfzigaA98IYUrTNEexVL2HnMq4vrLutrYhZQncFC8aBcawMud2Yv22BJb0DJ3APaBXn7FBW0LsgTaJzkTi0bYKHEaJxaU/U1vslhdr8C5cFY57Dc3W5nWtu5xvLt/9Gk22sAL6ap4aV6QpsD/X6SJsvNF8qijAVWgbRG4eilm8GyeD5oiNlSuEqYKc5VVDRkWo2SONPDvYUhOcE9n1nF0cjlsjUgVQ9qYd4e56XLCDoxl0JLCed1OebTBKAwbB85RUbEcKi9+YBErDyRhUuCWPmsqNkH2ouHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xp2I61m9Euis7KFkFoxjtRVQDm4E+k2+RKCuqZHlTXI=;
 b=TsJsbFD5VB2RUxnuwQ7H30O3X+7a/uutxb4QS7B3jwh8whY2cR2YMsFm4KVjIRDqF0ElEar/Ep3O4yFTSFumYjyvW9V9ny7z1am33vd3LpZTrMdEbJFa20Q/7FxcegrQaEb28Yz8UyqrMZrIJ1d2Ncp1WwM9T7MDEod61FIsGyc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/3] x86/shadow: Don't use signed bitfield in
 sh_emulate_ctxt
Thread-Topic: [PATCH 2/3] x86/shadow: Don't use signed bitfield in
 sh_emulate_ctxt
Thread-Index: AQHYY5/DJ7m5gzay0kyOU7fQ4wwz4q0WfLWA
Date: Mon, 9 May 2022 12:40:36 +0000
Message-ID: <2DE6B0C0-BF4E-41C0-AA93-8B09CC58FC9A@arm.com>
References: <20220509122409.14184-1-andrew.cooper3@citrix.com>
 <20220509122409.14184-3-andrew.cooper3@citrix.com>
In-Reply-To: <20220509122409.14184-3-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c6554e41-e155-47eb-b534-08da31b92316
x-ms-traffictypediagnostic:
	VI1PR0802MB2287:EE_|DBAEUR03FT052:EE_|VI1PR08MB2703:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB2703F8696B3354FD1116B0D99DC69@VI1PR08MB2703.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0WPRFthzpGYmoMKwDKhIUMXp5mi7V54k2VK5axDUaemhO/lau+yU6r6EwIl5BxHQz3U6HvUonIQ1RwWvqDGzQDUdcZIOYDyTteqnXSqE/VCZftun2E/nhsFRrgbF+XSwC/gw9izrjn2TBJcrNgClHgLIYv7Qe9RF2wTVVTqFPZfIZ0Zk5OAwOc6T1r9grqqI4t3NeFXljwHJb78Q/Y7wCxtY0bNdpqAGOSO1PyZ6WWajSsmeyQYncxU9hcB0WxL2k9z3X430YCoRHXYCGveswErXrZ48D02aGDKacwnfaxyx4p8kVdt+bAiwvX8dZn3gGClJQZxvPML4XuD9vCaxH0UMX5y5oqc/G+X61kfD3kvpiNEL5KXaLKdVP7oSSzDq8PAjWAQDnegDbYOBQA5kZY0usv6karW0b6jkW5p0ww5J055uP+qR5tfoeBf8SQGjq5WK623vzTM5k9Rkpdlylr0g2/gu2de2vzQL8IEeuIu8Ld+MU6Y+7uXMfKb8hXAR6mD+fkyPwnvdIqLC+Kha6iD2eNV4KHvo25cHa8tMCuvWMn6sWuVdvpIsefPPGy/x3l18TYmqZjgIt198xhsApKvK1cyz+Hl8/GXJFya2PqjKFYhecvkcX4E1n33h+4cnw+q3C4VTRoL4c5INgB3HV98SC6jYMXgh7Jq00GCNWpIxwFiA6ePZzsP26ZIwwUwLPeHoESiFcdQ2WBv6GVYWQ5ny0jR2BzdoRdC8YPCcMJjGfDyVQHzHH9tho7kVQx8S
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(38070700005)(33656002)(38100700002)(8936002)(5660300002)(508600001)(91956017)(66476007)(64756008)(66446008)(66556008)(54906003)(186003)(36756003)(76116006)(66946007)(6916009)(26005)(2616005)(8676002)(86362001)(4326008)(71200400001)(6512007)(4744005)(122000001)(6486002)(2906002)(6506007)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <DEA4DF47088952498F45B5F33DB2A85C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2287
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	277b8099-0434-40ad-e53b-08da31b91ddb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5mtkppqL7gpPDWZlCUEHgOhowe3Y5FPL2n2c+R+7klf1afM5K+g14y/6oVyNQp7lOgHdwcw8TNOXTNsFn1nYWgWcItqU/tUAM825v+KlRZ7cPaFmojpn2d+a7jPDi4CVusQ/6Pxpkg89MNNGXqc9U3HZUcopdqTtMOxMI/1DMf5QYnDBw/VIPsX37Uc1JhTGZit1aY7vmVsYEKMdyaOOhDjDr3T27/v65hal4Fkv9aJ9zksMYk+ugAzdXmXM8TNCgNYKpEm2zpSYQBQSdt539SL1XyJysoTWBxv92q3XVdftiNppB/tqGaAnoRPXrSxgAmifr5NrnM6kiWLNfs7NVnOJR9nTohCIf2MWLJG23OpJofNM29a7z2PM2KhjDlieP1ZSBr6QGpDDFNC5lcpiGlM2vdSIYDDirFmssOOHQxelGeryqOK3zWKalpDt88Gv2fZMs8Rdov/2ffj7TUsOLWMWYWVOG0/CqNFSr6qTBKt8MiS5gTgnT3+7a5JqWpS0RiDp+yAnUg3+rkWnZkYZC/MTaUHUC4G3rY5YU6dMDnXxERNf4yT1SwAdmOIVEy3jL7JGErkvLQ4H/uILM4CPHAhsQ9a4gCaODCHzzBtZA4AVc/e+skOFW5ECt30pd0UYJEZsZ7cw9MqOpfLb36TtZ2x/qQ9p1N2SCf1ahdg3MWBZsGYTTtAsnEBN8dhmDfi7
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(107886003)(47076005)(508600001)(6486002)(8936002)(36860700001)(336012)(356005)(54906003)(316002)(186003)(6862004)(36756003)(4326008)(8676002)(6506007)(82310400005)(2906002)(6512007)(81166007)(26005)(53546011)(70586007)(70206006)(4744005)(2616005)(5660300002)(40460700003)(33656002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 12:40:45.3591
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6554e41-e155-47eb-b534-08da31b92316
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2703

Hi Andrew,

> On 9 May 2022, at 13:24, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>=20
> 'int' bitfields in particular have implementation defined behaviour under=
 gcc
> and can change signed-ness with -funsigned-bitfields.
>=20
> There is no need for low_bit_was_clear to be a bitfield in the first plac=
e; it
> is only used as a boolean.  Doing so even improves the code generation in
> sh_emulate_map_dest() to avoid emitting a merge with structure padding.
>=20
> Spotted by Eclair MISRA scanner.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Is in fact only used as boolean in hvm.c so does make sense.

Cheers
Bertrand


