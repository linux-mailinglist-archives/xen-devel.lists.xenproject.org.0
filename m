Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB8C59302D
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 15:44:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387485.623720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNaNb-0006wR-Ng; Mon, 15 Aug 2022 13:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387485.623720; Mon, 15 Aug 2022 13:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNaNb-0006tw-K0; Mon, 15 Aug 2022 13:43:43 +0000
Received: by outflank-mailman (input) for mailman id 387485;
 Mon, 15 Aug 2022 13:43:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w1rB=YT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oNaNa-0006tq-EG
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 13:43:42 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70083.outbound.protection.outlook.com [40.107.7.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45812823-1ca0-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 15:43:40 +0200 (CEST)
Received: from AS9PR06CA0053.eurprd06.prod.outlook.com (2603:10a6:20b:463::15)
 by AS8PR08MB6805.eurprd08.prod.outlook.com (2603:10a6:20b:396::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 15 Aug
 2022 13:43:38 +0000
Received: from VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:463:cafe::e1) by AS9PR06CA0053.outlook.office365.com
 (2603:10a6:20b:463::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11 via Frontend
 Transport; Mon, 15 Aug 2022 13:43:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT060.mail.protection.outlook.com (10.152.19.187) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Mon, 15 Aug 2022 13:43:37 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Mon, 15 Aug 2022 13:43:37 +0000
Received: from 14c6e4394884.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 508CF612-15D5-4F06-82E5-18A6589A15AB.1; 
 Mon, 15 Aug 2022 13:43:30 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 14c6e4394884.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Aug 2022 13:43:30 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PA4PR08MB6189.eurprd08.prod.outlook.com (2603:10a6:102:ef::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 13:43:28 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5504.025; Mon, 15 Aug 2022
 13:43:27 +0000
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
X-Inumbo-ID: 45812823-1ca0-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hyeFhgV12orLZZjqz8+UB4S2uUjelSUhp3PPNcHCXAJydEmZv40Pc07qwzenjxVKUnssqZAa7SRvf2fgqoveeWuSGlEROOQOTl7LQCTFE/Na9ar9z8UR7X0tbeM0AqqmG4pCRuT5aN4IVK9Eq8J3WGbM+iklPVFnULOs5Ifpw4EXk3rYqD+kGN1eGd9MwTB9cgkrgZoCn/Rsw8clm0zJEFyAjKtQyQ3wxk+hILS9Y9SQg8UxJlmE39bn8suAsQTzR6R0KoWEyuxXTAWO41AtVVAGbmhLcjVEcaQooCwwLycb7G7Cu61BC3QjP4Y/C6nmPgj2cx0XgFtGKOJscbFaJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWOZ+9qWO5p0+0nsIsfFn1ILVrDHIXWefgtqs9BwTZM=;
 b=XpJ388UphazeGWcEOMtyFXSXc3BQpkDi2XalKfUSUELuLOjLZMnE9bdPsfpiHb23apPCPSNTODrz2aK+B9SLdhb7vby6u1Y/gqGSr4L0RUlO9PwVZb9NSEqGxLZQwpsNZF9tf0wcopLreg2nTyXwFqGzMfwGpNDUaAJdtMXTvbMVxndp6euf90cgif1JRTTjJnnRqVQRoimlgQLpCjfyqF/tWjB1HCYJT528RcjVXMiGyqonkAinsoflmym9/gdqjxFG2Y37B3iZCE8TklF7uzyAVULeRkU2t+l3qEWx9SZ021LSG8HfkVeDaOsZptGsoquBvBAwWO5RiYyk6HRD7g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWOZ+9qWO5p0+0nsIsfFn1ILVrDHIXWefgtqs9BwTZM=;
 b=tuy0344mOV1ZD050ipncHdwVlO1uilAmilusKGqrTPCqTnMj28mEetikQ2IeIBgOdxnpj0HidMOPRgOgA0g4dMjfxzbQx1Toxb+ua9pL9W6+IfXYmBynAO6u7ZE1w+WKhTZRvzIySRk0MwPJ7oqx2ZXXQyU4AMyzZXLe4a3Esi0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d276023686bf9791
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTPm8MFk8Z1df1IAa5LlVg7iUeDwbNjbDbejKkiIgKG16f2JmSzwRx+WIk52uCKATuLwiyy+smfmqy9a3RYgex8RyH0MLSfTm9WTu9jKbxiWTgcXWuB8osXoAfvTgyzP4dFoy1BJrjGMiV4IUiJdyn5OSuIJgqNbpUNdlIODt2I2cdigh54rrEPNul4Lqz5SRNEAPKiKdWQbSGXu/IYMFtMbKUlhmcLbm2r9HFirjUrWgFqB35EvM/MTgv84F2nzwJjaeZ/GlD/iafIdY/a22A4uBm8sygYjuzAme+vf/wzbkPMOfYhQVSNazty2U32nPBHk137QN2lxNkF8I/gt0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWOZ+9qWO5p0+0nsIsfFn1ILVrDHIXWefgtqs9BwTZM=;
 b=KMQ2sx6YubTJjm/0TD9vpOWVV5E+05d4U6J79yz5aHZHr6dimdQ2jv5ljrcY1y0OTF9jSOgGS4zyRbU5BeUwnL7UFIOwvNFrKjDHLwMpC+BAc9eiS9bVo+Ef+x2Gkt9lE49UkgnNp0eZaPpiM4r0ud/oS9B7VJXZHNJncVA+ARXJDtbXra37enalKA2rZOGxmb+vCt/AWtFOW28RVBMd84+Ixd0247LJ0srURMfKvMXIXnBPc725MD1J+16Jn/VfSthN7kEgxdYNS37Z66wAxEvGUdCWWc5vC9LKCxUUdmgI2VtD8t7u3J6iIJj6hBlHcfiXC4IBfX03MzB9wQe1iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWOZ+9qWO5p0+0nsIsfFn1ILVrDHIXWefgtqs9BwTZM=;
 b=tuy0344mOV1ZD050ipncHdwVlO1uilAmilusKGqrTPCqTnMj28mEetikQ2IeIBgOdxnpj0HidMOPRgOgA0g4dMjfxzbQx1Toxb+ua9pL9W6+IfXYmBynAO6u7ZE1w+WKhTZRvzIySRk0MwPJ7oqx2ZXXQyU4AMyzZXLe4a3Esi0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/7] xen/arm64: head: Don't set x22 and update the
 documentation
Thread-Topic: [PATCH 1/7] xen/arm64: head: Don't set x22 and update the
 documentation
Thread-Index: AQHYroFCSOZ+woA6dkCDdWoe8bS4562v/PuA
Date: Mon, 15 Aug 2022 13:43:27 +0000
Message-ID: <9F492A0D-B94A-4637-B798-27E780EC0442@arm.com>
References: <20220812192448.43016-1-julien@xen.org>
 <20220812192448.43016-2-julien@xen.org>
In-Reply-To: <20220812192448.43016-2-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 98ebb59c-681d-4356-4a39-08da7ec427f0
x-ms-traffictypediagnostic:
	PA4PR08MB6189:EE_|VE1EUR03FT060:EE_|AS8PR08MB6805:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 crUXIElJ+VLop0/U7ksyxbI9JQcTYWF6VYC5pHOmTtnya5ylTJslvBauFMCIEtOhfX6zxiPxx0bI2JD0ChvVn38xccSIumiJYyPnPn1hNlTCzrzrL4ohnS9t8MwofRwL8joSBZsfDjfI70qd04n7DPd/7WyXeSKUcpH7WjXKhk/JQsO6kfzPfVpuuVvXN8VscLxiX7I86rqzHokv7FKhjsYBcHNCi9AgpdtmryzR8YQV807Tu8ybdYxs9zAaX0EqotySyK4NCnIPcr7m4kt5RGrZlTDq3cqoMGHvtn7Cka8n5uo2xSQXWVxNN64ZL3jO5z+FV+7Vrigkm7H0kctIBnEcffKaFWu6epALw76R70Wb1gxoPstcIxviqxwTLh51OaL9fXUUZCzNCgpwDjyh2Fxad8RJACzeRM2JQkrSCxTeu9/juvKW3x6a06JXgusoya3tpG9vveAONgeBPAfBSbbHxLdtbuNO/spAH+Bo/Ov7t6rw2PkNVRwZB3gfYXv0Salpt452KGXnO7pYNrAlBprfuh1GUmPRbmSNDVZwHlXXAzfIekNRjNh6GlBWDCIZqiz7za08jEsWofzr/pO/nc4UoTeZKr/EfBhYgmXzHXBQC7SKzAExR+buJLFxvjiSc8frXX69UP/z6aO8PdF1uv6lydT8dss89ZddNoQ1p/gJxQ0zDjsY/YtMv5xdETYWWEE2BIDo22aVwZBy7tx0afXLPxUMi77HNPQvJcwH6JYFJo4YMerQY8RGM899bivDz83eTt+KTrJ5+uLNv4dJ7a9nbbV3ysRMpaQa3zpu0y/JRKiGRCImheV7v62WyfCOuLn0Q4iFv36AWrU9oHFDHw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(15650500001)(26005)(2906002)(2616005)(41300700001)(6916009)(6512007)(8936002)(6506007)(53546011)(86362001)(71200400001)(54906003)(6486002)(36756003)(478600001)(38070700005)(33656002)(83380400001)(186003)(76116006)(8676002)(66946007)(66556008)(91956017)(66476007)(316002)(5660300002)(64756008)(122000001)(38100700002)(66446008)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DBD0FF37AC0589408603E7866C251F65@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6189
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c33f79c8-8983-4f32-30a9-08da7ec421e3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oueDsf0x/IT2hixbvew6Coy1KPnWuNdXZBore8ZAFNcO9ooIi2978m5Q0WFLkPupYCoFrBwE1egV0zfPdjkZ7fFnQZhZ/9ggyqXcfnKvfW6V4dJSPl6esWr6qt7gE5ahgQUR8kj0Dzih/GSOPFj7G6jCxloayzEF1jS7cmPSU5OP4uhseDAjmsNhzZWWtOLgK08I68pseKYcu3d99o/2TbkYELXsaHTBiWxz4ijqQ3O0DIf6PEH+NBlGVs7GhEOlOeZaT3rHXSpkmOa6ghrnN2Jr8yTa2Q+ytItQ8uxn6gNQckkxcr5LH0L6K5Nn9ULztfu8jsYV/Pi0eCgoj6dSVkyu8LfZaVfrv/oorVh/uMuf2pq8alE5D0YE9e54sMOlUBCknzZxMnVzEVlDxpCPbHg0LF0wHeWt0nJO9BqxLv2raNPn9BPHpDaXNr8YE7wKFR1sG+ZwgrF44UndXAKbTdcDHjQfcxJ1o/HJWpeDsPlYTAXLJN+fgxF6+jjbwpmpKaHyTgTfbWP6kxK91PEbUrE3Biit8BGgCgRYioZiSrSGUC1eDr2JXAZri04uRSfYzqk5CS2ev+ML5ErzYoZiYvgpbpI/NERrNn7iEJymI4OreicBkC0Fe2DTR7wtfou4+gFMhd9pIwmKjYW7/ZSMKHXpPk6r/9aYGE5n1BWzp4pUGaksWjDBj0s3LiHhqMz/tYlodUeKDbOK9ZVaU3rOUceLUvn0DJutEcOvzw74VH2hDc2PYGetVFA//Y21iyaH4C4YTREPUbpVTD7P6v10cjDhuRtMNbMjGScWnc2jvBzMP/QAqfmiNu7VvZZTNMCk
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(396003)(39860400002)(346002)(40470700004)(46966006)(36840700001)(6512007)(26005)(70586007)(8676002)(8936002)(70206006)(4326008)(15650500001)(6862004)(5660300002)(2906002)(53546011)(33656002)(6506007)(41300700001)(47076005)(336012)(478600001)(186003)(107886003)(40460700003)(83380400001)(86362001)(2616005)(82740400003)(6486002)(82310400005)(81166007)(356005)(316002)(36860700001)(36756003)(40480700001)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 13:43:37.4001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ebb59c-681d-4356-4a39-08da7ec427f0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6805

Hi Julien,

> On 12 Aug 2022, at 20:24, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Since commit 7e14a47e7c73 ("xen/arm64: head Rework and document
> launch()"), the boot code is setting x22 but not read it.
>=20
> So remove the two instructions setting x22 and update the documentation
> to show x22 has no specific purpose.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand
> ---
> xen/arch/arm/arm64/head.S | 6 +-----
> 1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 1babcc65d7c9..26cc7705f556 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -71,7 +71,7 @@
>  *  x19 - paddr(start)
>  *  x20 - phys offset
>  *  x21 - DTB address (boot cpu only)
> - *  x22 - is_secondary_cpu
> + *  x22 -
>  *  x23 - UART address
>  *  x24 -
>  *  x25 -
> @@ -305,8 +305,6 @@ real_start_efi:
> #endif
>         PRINT("- Boot CPU booting -\r\n")
>=20
> -        mov   x22, #0                /* x22 :=3D is_secondary_cpu */
> -
>         bl    check_cpu_mode
>         bl    cpu_init
>         bl    create_page_tables
> @@ -345,8 +343,6 @@ GLOBAL(init_secondary)
>         adr   x19, start             /* x19 :=3D paddr (start) */
>         sub   x20, x19, x0           /* x20 :=3D phys-offset */
>=20
> -        mov   x22, #1                /* x22 :=3D is_secondary_cpu */
> -
>         mrs   x0, mpidr_el1
>         ldr   x13, =3D(~MPIDR_HWID_MASK)
>         bic   x24, x0, x13           /* Mask out flags to get CPU ID */
> --=20
> 2.37.1
>=20


