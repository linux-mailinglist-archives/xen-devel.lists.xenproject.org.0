Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0252B6E0D1F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 13:53:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520659.808489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmvW3-0003c0-EC; Thu, 13 Apr 2023 11:53:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520659.808489; Thu, 13 Apr 2023 11:53:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmvW3-0003Za-BQ; Thu, 13 Apr 2023 11:53:27 +0000
Received: by outflank-mailman (input) for mailman id 520659;
 Thu, 13 Apr 2023 11:53:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vvgu=AE=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pmvW2-0003ZU-2F
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 11:53:26 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061f.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb767ea8-d9f1-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 13:53:25 +0200 (CEST)
Received: from AM6P193CA0041.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::18)
 by AM8PR08MB5796.eurprd08.prod.outlook.com (2603:10a6:20b:1d1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 11:53:13 +0000
Received: from AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::ec) by AM6P193CA0041.outlook.office365.com
 (2603:10a6:209:8e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 11:53:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT017.mail.protection.outlook.com (100.127.140.184) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.28 via Frontend Transport; Thu, 13 Apr 2023 11:53:12 +0000
Received: ("Tessian outbound 5154e9d36775:v136");
 Thu, 13 Apr 2023 11:53:12 +0000
Received: from 96011df6c354.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 04D84B93-A4DA-4053-807A-F56D9AD4BEA8.1; 
 Thu, 13 Apr 2023 11:53:06 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 96011df6c354.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Apr 2023 11:53:06 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VI1PR08MB5453.eurprd08.prod.outlook.com (2603:10a6:803:132::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.40; Thu, 13 Apr
 2023 11:53:03 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 11:53:03 +0000
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
X-Inumbo-ID: cb767ea8-d9f1-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwTaoUcDceKDe8aMgaY2EUZfNFklPvhP/ajqp4DZwok=;
 b=HF/kp3u5ggsfjTwQ1syyCTuBduzU3dm+qwfWiV0BRnLIXZaUVeOWqahz4Bg5ZrMxaLGCB/K3qN8c5C4FbLDMEuUR6wOxpatUshVGf3dOh1khle9x0xyCRyWuXILayaouvnou4gIlNs79Q7AoBlaccV1C78ofphNNnwEnJStSio0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aU1WK6+EslAU1x5zyfCxZed8okzchAQ+dOt23ChPE6bgChAmv2buxJKzrZaCw3iv/ccBWNJavuc57sfDVKRt5olSuG7NP4XfSfEjlUPP4C0PYhV4dqXpCzFFCJe3Xpg7QnrrIWfF9tjMq6gvRYbAVQZTWrYU/HwP9qodMPpeCYmXh8vhm8TpsLvWiXMwR9V9+zumk30Wlc+xd+aIQH2LYvLRqu+zxuZhT++5itl2mw98jlR8KqBJLzFRx8gtNbhfbRf03sohbcl4NAZIwNvNi9ntwD8VgP89cyqwvhyudz/NMy6NDRsRYU9Gr+TwZDRHcFzfNN96oMg2Ou4g5RP8wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwTaoUcDceKDe8aMgaY2EUZfNFklPvhP/ajqp4DZwok=;
 b=XkBS6gQCCeqTpb5H7hauWC9QXsP7taFtmqPpGO+uVqpDkea7E5AWhDhP4uYFflSRKfJYQ3wLcI83BLfLht0upMtRcK+cdkJpoxloFdildS9eozRF8TqwLBj243BFjwTo2OHrQjdpmUqQd0XHFrGUNku9oqxBiOg1iZSM/ZWMbQSIf7F3trCW2azAP79pV66Ih9A9rbUa2ux4mjLIThJlsQWmXXpoE2j6HGkVA42Rz0tOTNeO6rBWhKJ5m5gsDAmxPeJYpKzf1h9XvcoSstNNVTDm+qSeAmI4Kl/rugxdUdY9sYfeuUiOKH4For9SACV6lNGhUixved4a08vPS4VsOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwTaoUcDceKDe8aMgaY2EUZfNFklPvhP/ajqp4DZwok=;
 b=HF/kp3u5ggsfjTwQ1syyCTuBduzU3dm+qwfWiV0BRnLIXZaUVeOWqahz4Bg5ZrMxaLGCB/K3qN8c5C4FbLDMEuUR6wOxpatUshVGf3dOh1khle9x0xyCRyWuXILayaouvnou4gIlNs79Q7AoBlaccV1C78ofphNNnwEnJStSio0=
From: Henry Wang <Henry.Wang@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN PATCH v8 03/22] tools: add Arm FF-A mediator
Thread-Topic: [XEN PATCH v8 03/22] tools: add Arm FF-A mediator
Thread-Index: AQHZbdfU80uw6OSkAUuNnMAzzeK71K8pIJ8Q
Date: Thu, 13 Apr 2023 11:53:03 +0000
Message-ID:
 <AS8PR08MB7991029EED281DD96108D4C292989@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-4-jens.wiklander@linaro.org>
In-Reply-To: <20230413071424.3273490-4-jens.wiklander@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 25D1E2305DEFB24E8474D15D83D5F973.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|VI1PR08MB5453:EE_|AM7EUR03FT017:EE_|AM8PR08MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: 00cf5b37-18a9-436e-72bb-08db3c15a8ac
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OX1FC7UdbzWPDdCmgdVPKQJ53K0IpF9hC6etv2w18sS4SR9ILoclnSjTxRcHc6NoxiodFTFM/OCj8V6yk4QqdUIJDlE9cRLgu72vp6dwraRj7jUf8/3bUHCMykUtvt0YrqpS0wN5myI6E76Vwf/DB3SMz+OhcKIU2r/Dp2yrBmZTt3d0bPtSXhkCAlptYhVFpLm7WvzdFpk1l01nBwj9p8jynO3Reey1qHPzTt5WP8hboL9ePdFM2yZ486jRljhJoFkw5qGXvxoOMlKZIs8nk5OuEVXNydekIZsose0nlTbcjoySoH7uycmEk3iJpT1HugpWH+4ot4OW7d9S4Sw4hwhPR89SyiSZ6ZsEiJOr0dXGnVzK2wQmaniYi6X1Kh/Fm8lXL2L6TFZZacGCs6e7gsHEQRuT7DY9PJJhJ63fn/1018kSVIYSpiBykT8b/SfxjV80ihCDEY9VqZHg1qOADKCxlUPU5nvhkkYHPupKLurfloU3JoWZBiG6e7JK3yEF9Cbq0TuK6zgnQYI+/PQZf+mrDvUzDEhEunD5r4+tKlY38IVclSn62qs/xfnz8dGSV+Eu2GtAM2NhLz+DR6lK8WBhIcTwJ5KFNYThJYTToMNT1J/vNGliFmDWM/IkYycj
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199021)(8936002)(186003)(52536014)(9686003)(26005)(6506007)(55016003)(5660300002)(4744005)(122000001)(86362001)(33656002)(478600001)(38070700005)(38100700002)(316002)(83380400001)(54906003)(41300700001)(110136005)(2906002)(71200400001)(76116006)(66476007)(7696005)(66556008)(66946007)(8676002)(4326008)(66446008)(64756008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5453
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	05301706-18e1-4fe6-a7c4-08db3c15a36a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hZGma7JOomUUAAfHVFIc1A610LLeAMk7dbVAHEwrZqI6lJh6Mp7SxE+OfQzSWT7WO8QUH3/M2Qe617tXXYyOuBUur9Nmzvj+oGjcYcZzp6P17EwvoDX6k7TjcAhZ3TLh0p+AUwG9MYokmcWxNKM17Z1LGtpkQimYH2sL6lKD2pGpJkA/UttsPJYJr5hM1MEc0hVX2f4nSJyXzrx9uCkl7ic54skKCoxZDuyEFYMqUtsKmScXYCJnMJiJ/ELznCsIsvvrSVNH+eG5iJZbZiHR8bVWOO1pt/AzXrPaMjqz4pvptfn6eTr4kUH8Hew6I/cgZiqMyt2kq7WJgA5pL3wPQUJyYFbTaP+zOtHRLM4et4M2W/28jU1blMKqVgzZtvxij6gICgA1cdWMD39C5/pb0eqZ6NzdepM9jkwpwbUiSWyfNifja+jE5RAc6x/WLQtuhJ8wa6TMBGIIAJpBWwT+BjGSzOyt+WR7OK42X1qzFNZwLuHU3r6mH7K3Kwk5m1JIURkal1mu4FUIifWjR/0Iu6lumcoRoSI3CX1c0JpLnF8S8R68aZG/E8P+XmBmudzb1XB/YP5+Dii+/nW+bcXHc/TAjUFk7pqNPzfj/a9Io52ZeHIrJrUN9PJqa4qKgcs7gMaFa74Tk4rKx9QCuLaM38O2llijJefpBwYzS4iAmdqmNlb4UVCS7Z4WxhMGjx9ygWZ4D3/OY1FDqKnZzbzZtQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199021)(46966006)(36840700001)(40470700004)(8676002)(8936002)(41300700001)(5660300002)(52536014)(4326008)(81166007)(316002)(356005)(2906002)(70206006)(4744005)(70586007)(478600001)(54906003)(110136005)(86362001)(82740400003)(7696005)(186003)(9686003)(6506007)(40460700003)(82310400005)(55016003)(83380400001)(336012)(26005)(40480700001)(33656002)(36860700001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 11:53:12.4285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00cf5b37-18a9-436e-72bb-08db3c15a8ac
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5796

Hi Jens,

> -----Original Message-----
> Subject: [XEN PATCH v8 03/22] tools: add Arm FF-A mediator
>=20
> Adds a new "ffa" value to the Enumeration "tee_type" to indicate if a
> guest is trusted to use FF-A.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

