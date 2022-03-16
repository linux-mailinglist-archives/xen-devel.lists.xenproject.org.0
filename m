Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F004DB7CC
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 19:12:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291234.494183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUY7E-0005f6-82; Wed, 16 Mar 2022 18:11:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291234.494183; Wed, 16 Mar 2022 18:11:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUY7E-0005c2-4o; Wed, 16 Mar 2022 18:11:20 +0000
Received: by outflank-mailman (input) for mailman id 291234;
 Wed, 16 Mar 2022 18:11:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GRoA=T3=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nUY7C-0005bg-QF
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 18:11:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20620.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 777a4c54-a554-11ec-853c-5f4723681683;
 Wed, 16 Mar 2022 19:11:16 +0100 (CET)
Received: from DU2P251CA0007.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::9) by
 AM7PR08MB5384.eurprd08.prod.outlook.com (2603:10a6:20b:10c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Wed, 16 Mar
 2022 18:11:06 +0000
Received: from DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::7e) by DU2P251CA0007.outlook.office365.com
 (2603:10a6:10:230::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14 via Frontend
 Transport; Wed, 16 Mar 2022 18:11:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT058.mail.protection.outlook.com (10.152.20.255) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Wed, 16 Mar 2022 18:11:05 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Wed, 16 Mar 2022 18:11:05 +0000
Received: from 4357fa95633b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 94F4DF71-EF83-43D3-A579-AB33F3F6A674.1; 
 Wed, 16 Mar 2022 18:10:59 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4357fa95633b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Mar 2022 18:10:59 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by AM6PR08MB3398.eurprd08.prod.outlook.com (2603:10a6:20b:4e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Wed, 16 Mar
 2022 18:10:56 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008%7]) with mapi id 15.20.5061.029; Wed, 16 Mar 2022
 18:10:56 +0000
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
X-Inumbo-ID: 777a4c54-a554-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4OfeHp9GRcdBoo1Jl4lhr5/XWFubcYDm2UoXTWZMxA=;
 b=tX9bOiPRmSIwN3mbhcqT8sMJ4rbMxmdZDnEeXJ69d14E8QbXlQ3bNzh6M2C/93ovChUERQEm8U/rJypb0jNo+WwNd16aIgG9CWb32NR8IpPujTG3n/L4SxeM0fQTCadDKElFduuwBcrTS2cA385yTddwTUDYIJ3X+TFUQP4OuCg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3f5985618e0bc537
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iiwegMvmvwFio5NJe80e9A/expUgnKfgO/j7C1qUA5x3swcAl+ur2MzY6qpmQ0J3ZHUyeCLoU688uVaOAx3fHnAJ3gakGrHm7w94EJFqvNr92zvLPRPxkx6+/CNMFNgY/hJGbanCiGZBpZOWOVa2T92z+hdzFIoGdyPbGe1ekBDwbYtUC/TaAhuUwvtu0qkV18zpdhA01PZvCd3/ebVKsU9MAG+z8qLCLs8PDhmFTP1adKRD4JBER0eJhGrlZW/7Kx+sUckrTAQwJfjDm2SMSN8tPkSRoPiMMUYc8VQYiadDWg+xYUZ2NDoeZa+qdM5/SCMkdZ5WO8Wo7jrh0MIbcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4OfeHp9GRcdBoo1Jl4lhr5/XWFubcYDm2UoXTWZMxA=;
 b=L2wT1EBIHv8jtNc5Sw2XHHwJZQqEe5HDHreszV+R1JamPGDqbFHG0vCuslqMiSt9czEGevORWoJOvMWNzjDLqORm8T/3CKNA0tzeSIr5SG/fUki+kfAF16sBEcZvPU9onXB9fU2gEcwJVcMqSMTS0Wlw58oX5b02GhtoVSJvv8zDZX4vYuLCwlZfXy6aMZA6E8JIE4G7/aUUKTJle6O8UYPH8gFWc7wXCqfVYPyrWo892jdmauBQeohLHC8WXcDC2ciBUi88IAH/6gU6CWQhPwSpdens9PqGIVrK83AySelaCG87U/M9eOXkFc9bKdOpaIYGgy5Ncjy6X+x7LWHUdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4OfeHp9GRcdBoo1Jl4lhr5/XWFubcYDm2UoXTWZMxA=;
 b=tX9bOiPRmSIwN3mbhcqT8sMJ4rbMxmdZDnEeXJ69d14E8QbXlQ3bNzh6M2C/93ovChUERQEm8U/rJypb0jNo+WwNd16aIgG9CWb32NR8IpPujTG3n/L4SxeM0fQTCadDKElFduuwBcrTS2cA385yTddwTUDYIJ3X+TFUQP4OuCg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Juergen Gross <jgross@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/3] tools/xenstore: add documentation for new
 set/get-feature commands
Thread-Topic: [PATCH 1/3] tools/xenstore: add documentation for new
 set/get-feature commands
Thread-Index: AQHYOVBscI1UHS2ILkaJ88oOeht+3KzCT7sA
Date: Wed, 16 Mar 2022 18:10:56 +0000
Message-ID: <A1F622D1-9323-45FD-9E46-EE42FC58F518@arm.com>
References: <20220316161017.3579-1-jgross@suse.com>
 <20220316161017.3579-2-jgross@suse.com>
In-Reply-To: <20220316161017.3579-2-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 12619a3e-1022-4593-3542-08da0778567f
x-ms-traffictypediagnostic:
	AM6PR08MB3398:EE_|DB5EUR03FT058:EE_|AM7PR08MB5384:EE_
X-Microsoft-Antispam-PRVS:
	<AM7PR08MB538405E1447DED05960C9AFBE4119@AM7PR08MB5384.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rPPSs0ZlcML+CQ3KGDsjCfsKLT0//Jo46wStJ54TQp8fly0cne2Wt1uVjjjjxglKShtObrE34Y2jBHIru16/xlXvnDoL18wVaaiZthNBdS6eHy4LEkZ/cnAJWjQ501ZbmlE83j+skgDC66Uu3rQ1IsZ7m8l7ZWcq8uv3iDfXzVEgGS3mLSWF1nq9Mhx+t71OT85AJ2UncFmAYl/UbV7CYnipypKUJhP+TT4L5G7X4vp+1ASY0flWDFBspAEjNA8DNRTd0vcPldjhljUZsuPHXwMkTf/d+FYQzpDHv/qLvpzUntJchO+rFrOF7mWL14IcnVMZr43xe+Ippu7N6x1L8J6/cf8tgncWsQFTkoLiKinHR9KlqMwDa0Y/drrvGu6G93WMvuRNuaFtXAECdwrX+A+KGGXjkBhjvP0ChnKM891Yfya0PXSrMCMcsq3fjZ5qfMTwVtW4tXK2yUpWkmLSKHqMgDaHfLYP59RXYq8v8Wmy2NNuWRNgxu1C+BY7MkKIwnY4T7EumRwOBfYdpUYggFu90zMzi1ty6CjY+2K7Ula79Jg2hGzZPsHeX0hDNiSkxfn+s4C9crnR1lIdKpSXKpCW9injH5/xy+cuZ//ZCoJJYCuMEaKlJ2HYmd4wLHBCZsUquCpaRgdZZBElKITQg9w9UqBdQVNGZUuG/R5PxKodNK73AMwg9BjFJUs+YZn+RmaH2phky5OLv3lk+Ta4UnSbHnWm55zpzHygAkhaXHNccAlvG//5nBMux5gEb4lq
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(8936002)(71200400001)(5660300002)(6916009)(54906003)(66446008)(8676002)(64756008)(6486002)(508600001)(316002)(66946007)(66476007)(66556008)(76116006)(26005)(38100700002)(91956017)(38070700005)(83380400001)(33656002)(86362001)(2906002)(6512007)(6506007)(36756003)(53546011)(186003)(122000001)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B3CDBD6F9F78C646BF7A1D6BBA775FDE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3398
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	89b3f09e-3986-4fb8-33ea-08da07785151
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kdBJApgEYLiFeRDtSYdzsFstXGn/SvPAy7eHQ0bi4LHAKNKjevC5ksdwsJkSfSGzlHO4ZMp5fh/Ur6BSsZ1YNtGY+6X+apM3rt0JWJ2Po7TLWrBA5yYWNj7bkkQEVgP47b5miIRfCEWOmO++8mA8FZ4Mn3A4FpxeC4QRkETHLanyAc7R4RZiPuPVKG2e906did5jrKVUYiZWH/SfBPSLtrfwOJh9iEHGB9ldAINOqA+23n1o7AoBfBbWrMPvPCP5wX3GKY270EgbkrIRl8XktirPG826kJ087Kp7GPW2GNpwiQ+mMeCTjr/tUgO9dccyWbm8DGML+v6+YrlCVIZlJpJpHw8x+/DL67lH9llimArkkApsah9+EyPoKUSBRA1/uzv0wbgfgPQJ+DbhA91YXtxQW7kkbRDeypRFTC5NznrTdxoEmQpxuwXWtfAIprxZfL4FkiTI1eG9ICJef8IH0KW19LTtLZLRoLYapjunuAvLtJdXTtsQI0uIaDnRG02RSMaHITGj0Bc3/B/LtBmytvOgg1ODxxxIbRW3TKUXuEpOiPIMgUqQNtVg0KwMPH//S2EQ+8nyvX+u4iRH6W0B2NgffJbOZXkrQriGkvj6bIwyfb2s6plWCmvXrVW8VA5GbCKMNTBEeIkzHnT98D2F1vVz7EQTtTp5ucrDtgPe0PRqZLPaEbmZPaUo1SFNpM3F
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(2906002)(26005)(36756003)(2616005)(83380400001)(336012)(186003)(82310400004)(8936002)(33656002)(81166007)(356005)(47076005)(36860700001)(86362001)(6862004)(4326008)(5660300002)(70586007)(70206006)(8676002)(508600001)(40460700003)(6486002)(54906003)(6512007)(316002)(6506007)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 18:11:05.4837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12619a3e-1022-4593-3542-08da0778567f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5384



> On 16 Mar 2022, at 16:10, Juergen Gross <jgross@suse.com> wrote:
>=20
> Add documentation for two new Xenstore wire commands SET_FEATURE and
> GET_FEATURE used to set or query the Xenstore features visible in the
> ring page of a given domain.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca

> ---
> docs/misc/xenstore-ring.txt |  1 +
> docs/misc/xenstore.txt      | 12 ++++++++++++
> 2 files changed, 13 insertions(+)
>=20
> diff --git a/docs/misc/xenstore-ring.txt b/docs/misc/xenstore-ring.txt
> index f91accb5b0..bd000f694e 100644
> --- a/docs/misc/xenstore-ring.txt
> +++ b/docs/misc/xenstore-ring.txt
> @@ -68,6 +68,7 @@ Mask    Description
> -----------------------------------------------------------------
> 1       Ring reconnection (see the ring reconnection feature below)
> 2       Connection error indicator (see connection error feature below)
> +4       GET_FEATURE and SET_FEATURE Xenstore wire commands are available
>=20
> The "Connection state" field is used to request a ring close and reconnec=
t.
> The "Connection state" field only contains valid data if the server has
> diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
> index ea3d8be177..31e3d53c52 100644
> --- a/docs/misc/xenstore.txt
> +++ b/docs/misc/xenstore.txt
> @@ -332,6 +332,18 @@ SET_TARGET		<domid>|<tdomid>|
>=20
> 	xenstored prevents the use of SET_TARGET other than by dom0.
>=20
> +GET_FEATURE		<domid>|		<value>|
> +SET_FEATURE		<domid>|<value>|
> +	Returns or sets the contents of the "feature" field located at
> +	offset 2064 of the Xenstore ring page of the domain specified by
> +	<domid>. <value> is a decimal number being a logical or of the
> +	feature bits as defined in docs/misc/xenstore-ring.txt. Trying
> +	to set a bit for a feature not being supported by the running
> +	Xenstore will be denied.
> +
> +	xenstored prevents the use of GET_FEATURE and SET_FEATURE other
> +	than by dom0.
> +
> ---------- Miscellaneous ----------
>=20
> CONTROL			<command>|[<parameters>|]
> --=20
> 2.34.1
>=20
>=20


