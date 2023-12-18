Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B218173A5
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 15:34:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656054.1023976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFEgm-0000JS-4B; Mon, 18 Dec 2023 14:33:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656054.1023976; Mon, 18 Dec 2023 14:33:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFEgm-0000GV-1P; Mon, 18 Dec 2023 14:33:48 +0000
Received: by outflank-mailman (input) for mailman id 656054;
 Mon, 18 Dec 2023 14:33:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+P8=H5=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rFEgk-0000GP-OD
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 14:33:46 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe16::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 733aac07-9db2-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 15:33:46 +0100 (CET)
Received: from AS9PR06CA0060.eurprd06.prod.outlook.com (2603:10a6:20b:463::26)
 by AM8PR08MB6321.eurprd08.prod.outlook.com (2603:10a6:20b:366::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 14:33:38 +0000
Received: from AMS0EPF000001A3.eurprd05.prod.outlook.com
 (2603:10a6:20b:463:cafe::e) by AS9PR06CA0060.outlook.office365.com
 (2603:10a6:20b:463::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37 via Frontend
 Transport; Mon, 18 Dec 2023 14:33:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A3.mail.protection.outlook.com (10.167.16.228) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.14 via Frontend Transport; Mon, 18 Dec 2023 14:33:38 +0000
Received: ("Tessian outbound 8289ea11ec17:v228");
 Mon, 18 Dec 2023 14:33:38 +0000
Received: from 183284e508fc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ADE8522C-6BA4-4B51-879D-86934EDBAD9A.1; 
 Mon, 18 Dec 2023 14:33:31 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 183284e508fc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Dec 2023 14:33:31 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB8419.eurprd08.prod.outlook.com (2603:10a6:20b:567::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 14:33:29 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a045:911e:2349:3d8b]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a045:911e:2349:3d8b%6]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 14:33:29 +0000
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
X-Inumbo-ID: 733aac07-9db2-11ee-98eb-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ocGb9pjBkyq27ruxjv3QfafkOHvlgsojD+8feGZKKxBU9pDgsAZQySTdZBz6EgPUPgZFYXIBXEx2tODNhXBbXfiOFiNIy0qSUKFlq+P3B6zlwQV2zhfM+UHUV7CrJbzDpqTlbuhlnVy9VffwXs3hNbiCWMBS/m4WgomCF14gxdB96AgeoKw3Yr+WwMv//zRUJya7a+oGZDsG+6dlSRlXc1TTyOMHpmpiStIWddNeLGmkOGYe8Lq+XkJdxW7F4vplRnIOium95bi0vAlb3kQj5gdM/TOcYN2uVOSrjmcmHpTKs8zU+5OLevyDlvjQUBzDgsC1t5Cj2j9v+oxNUF3zGg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9pe6Hl54WbPgNk6+QV3VbAQCeGyfQ8IlUWB1oI+Ddg=;
 b=IYbDOLd4qyEiF8j2MFrQxds8TsOWcBYOiTNut0KtaqHkvmlcDksW3UjyqVGKPyhJajaGLIUVjxQ0GEYQBKo/BADeNEHupa+Uf0WxNIVvf/l614+YSHWK45KFl/q3XZp84IbPnQSeATMQB1wAARUXsmpR7FA1f49JW/820C9N5v78wpEzoZytqHG8/MUnqES+l5e03SWl9u/SFIClrR8jEYRVPvwGe/XY2HEl0Cg1Gwb0ABgB2kmIz3h1o72c3O22HPBAiwB3rDI5BMCYWDbKD4qacHOESm/l2A/D30FBKpGXNtsJCiSb/b5ud5vIB9LwWZgeuMJfCMYaiHQAfdO85w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9pe6Hl54WbPgNk6+QV3VbAQCeGyfQ8IlUWB1oI+Ddg=;
 b=xf2MaemXa42Iyci9oHzyGxXbqooVunuMB+Gxim68W4ZkDhfz9BOMllkkh9x3a3wWid98HKkMkXnE/q8GUlncSBWx6IEa9VQKd3AisGmxhGjwuz1HDKde7bpU1ifBhKTIegsmnZElvcuQqg35O1MXMDW4ZkahgkuDjh3BgBwyAGU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fc6aba228f1fadad
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fcb4gzLZQjMM3vXwVsp4PmX1vfm7wPjXEkEFMrY2Mxmw1/JIQbCg/LShmf97WBN/wcNXkgXuSlbopLafubeiQk6kjf2zQk7fwNHy2XR8f858dgOuYSHnfph+JmUKIdhDJ2IXHx8rF9FAruyPaDcv3JMy0m7G0GwBe2JqFPn8MUKevX91Raye/jfNKHxojlXsMgLXOV8nS+YKH0s5bdDWXwOAVMqc4jUdAlapNkBub5Me+QwYmEx8aomds7tb5L311GBcfnzzUdSbwUPbVq4nLytcofD/h+LIqbk614MjMsgNN8ndMWPiaqgiUJ4q39GAUY0TPRzWhUuI1LiISTKyow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9pe6Hl54WbPgNk6+QV3VbAQCeGyfQ8IlUWB1oI+Ddg=;
 b=J23TM9YDQ6ooHPGFfGXH4jo0vF7immXVYtMwtq1wHmj1Am0zX1OoqyQkdwIJ0uOD1PiSaDspBk4PF2bAmM3BQiUns0aJlO1quFONhdhb0pnZltBuinB+AUdDrygmgLa/SEXWeo8zWsmOJTwogJ82szqaoXvCaX+uLWiwN/QBVnT3Hz7zn5IkFPkYG+1fBGPL7BPKLaiy8Fzo8EoBo0KGFAYnX303VNjpWIoVDkDn5ViDtjuz+c+cYALi6LNqMXVkUBv08oCYh1plsmoQf6jTLhQzSpo+12dhJOClDnkwYgvXAwwnI1EWaliCXvmM/H4eR/Y5O2iGmrSLp1V51RM8vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9pe6Hl54WbPgNk6+QV3VbAQCeGyfQ8IlUWB1oI+Ddg=;
 b=xf2MaemXa42Iyci9oHzyGxXbqooVunuMB+Gxim68W4ZkDhfz9BOMllkkh9x3a3wWid98HKkMkXnE/q8GUlncSBWx6IEa9VQKd3AisGmxhGjwuz1HDKde7bpU1ifBhKTIegsmnZElvcuQqg35O1MXMDW4ZkahgkuDjh3BgBwyAGU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "patches@linaro.org"
	<patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH] xen/arm: ffa: return fpi size from
 FFA_PARTITION_INFO_GET
Thread-Topic: [XEN PATCH] xen/arm: ffa: return fpi size from
 FFA_PARTITION_INFO_GET
Thread-Index: AQHaLa+UlQwUyLuLjkSJPyDwSlt2/7CvIukA
Date: Mon, 18 Dec 2023 14:33:29 +0000
Message-ID: <62A3B41A-0362-411A-89D3-64787DDC1AE1@arm.com>
References: <20231213103135.2346238-1-jens.wiklander@linaro.org>
In-Reply-To: <20231213103135.2346238-1-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB8419:EE_|AMS0EPF000001A3:EE_|AM8PR08MB6321:EE_
X-MS-Office365-Filtering-Correlation-Id: ca9730e8-612d-4545-be80-08dbffd65332
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jUxcibUwJ3mWOkPP3eAYE2bBX/1v1McMxh0qSPGyAewPwczBbEZoWTwD8pVtB9HPfW55rIU/pkehcdT2DAI+xEK2wRjXj3RhtgaNP1gE5ChPZ40ykfsqDrvxN4YMyE1IiYvFHc1uAPAPl7VmbXfsRswRqYkIkik/RrxWtPzLZM96dz/YkNhfvcAN74b5vFke4MNR/g3DAxEcLDmwk8bxlPYTXFk4V3QHSoMxZ9KNpLq2xHjKfDMj+gPMdxKt/mLvds56MdJfkhxz50N1ccq5qBCqcmiqjf2dnX93flthnAjfziVgfy0gEpz5BanpZLz1n7ucglNYspzj2ob4DuZnbcj+fwxMMjwy0M7rVNWAMQKhM6R9zrkIBSldxLyli4L8pSeoBesHWhtkVTtjgH5j/S3NuVBdvJhgBZm4UN7CrEwxVdY5SXwcdLrz2R3pqqunRAqFYY+fvqJ9ELOKkIJClTBIjb1HxNuz6Pv+NbwG/EozOBwjOPHYO6Jm+TuOK+b43kFcd8ejiX3gvSStRXJiUg2He4UYgn31oDWADU4b0oYcjwx00i/atriiiVL/Hbi5ts9GB5V/DcbXhEtcrbm0peI1YUWBBAfqXzLC30Bp7JcY5xM35nynd1p3uPgy5d4PqoSxxK6QVMs4xpHZfMcQHQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(39860400002)(136003)(366004)(376002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(66946007)(64756008)(41300700001)(54906003)(316002)(71200400001)(76116006)(66476007)(66556008)(6512007)(6506007)(66446008)(2906002)(8936002)(38100700002)(6486002)(86362001)(2616005)(478600001)(91956017)(6916009)(53546011)(8676002)(122000001)(4326008)(33656002)(36756003)(83380400001)(38070700009)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <05DDB21F971C8D429F828EB2102744D2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8419
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3ff1c6e8-8b67-40f1-8963-08dbffd64d83
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	esb3XnSDwejO5dhImhmvaXVr2VZu/A8i+ZQx6c7Glgw65Y/haGQ9/7rJPIE9b9yfWiL34jZPuPW9ED0Mjf8up+ttHbpO2SJfdzJxvIhE9lt+Q4ojOQNgDN+bv1bB0PoaonnbSKbTj78LEx06FAGSMkJdqMgfs3MaQzwaLy1l+MXxCboHhBjT1ggsdieHxPJNhkl2NkMJdEfWiTzd7ZX1MoYretaYGI4/7LYxiBdvwiC+fJijmoBqWowPCMtAPosIzOgekzfg/bDmIVx0OYEnP3fiDs8IM4gDbYyvqwiA+t/mtb8vAyFTtkm/f+IEtW1K2TmV2hu+CGt6fEV9xissl3XFWA1iepMaIrRUEtrNXPqSrrzWZwgfosM77RdxZ8mHsOEokw4vGmOYXPobZnzMFYo4Rule7C0fuHKql3vQfg/rEKT9R5hU0K5lyjGA8wC/aFo5P2OqMG3a4r5Xa6cMYSdHobL5664po6ZTJ/L4mC+Dw/8rVTRbbWTzK6PGVLD9LPiqb/LeyBfkqzlVr3XYdzc7MXcl7QO9YwExRstbXYdFHe9VZl+yDk5bGYtygo1Vy+E0HU3X3GAYFkZIJP/9cw+qi3pirBcJDbn8YwX7QO7hyz+Yh+s0DSdi50vdjhm7xcHrJvva8d04O7fAmvLV8Og2c2Ya9RhplleN3z6atejmU4MeJnPRBH1Q3RJicW3GPtQjAkUtLZD2FNcBWlasJrqP4uIw7XdNlJjnjCBah9ZBDxTUOA0QRDNCUBSRwE8B
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(376002)(136003)(346002)(230922051799003)(1800799012)(451199024)(186009)(82310400011)(64100799003)(40470700004)(46966006)(36840700001)(5660300002)(82740400003)(6862004)(8676002)(8936002)(41300700001)(4326008)(53546011)(36756003)(356005)(47076005)(86362001)(6506007)(36860700001)(40480700001)(81166007)(70586007)(54906003)(316002)(70206006)(2906002)(33656002)(83380400001)(40460700003)(336012)(26005)(2616005)(6512007)(478600001)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 14:33:38.6194
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca9730e8-612d-4545-be80-08dbffd65332
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6321

Hi Jens,

> On 13 Dec 2023, at 11:31, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Until now has FFA_PARTITION_INFO_GET always returned zero in w3, but
> FF-A v1.1 requires FFA_PARTITION_INFO_GET to return the size of each
> partition information descriptor returned if
> FFA_PARTITION_INFO_GET_COUNT_FLAG isn't set.
>=20

Good finding.

> The SPMC queried with FFA_PARTITION_INFO_GET must also return the each
> partition information descriptor returned so fix this by passing along
> the same value.
>=20
> Fixes: caf6491e95a9 ("xen/arm: ffa: support guest FFA_PARTITION_INFO_GET"=
)
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/tee/ffa.c | 21 +++++++++++++--------
> 1 file changed, 13 insertions(+), 8 deletions(-)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 183528d13388..1d4e0a083006 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -514,7 +514,7 @@ static int32_t ffa_rxtx_map(paddr_t tx_addr, paddr_t =
rx_addr,
>=20
> static int32_t ffa_partition_info_get(uint32_t w1, uint32_t w2, uint32_t =
w3,
>                                       uint32_t w4, uint32_t w5,
> -                                      uint32_t *count)
> +                                      uint32_t *count, uint32_t *fpi_siz=
e)
> {
>     const struct arm_smccc_1_2_regs arg =3D {
>         .a0 =3D FFA_PARTITION_INFO_GET,
> @@ -531,7 +531,10 @@ static int32_t ffa_partition_info_get(uint32_t w1, u=
int32_t w2, uint32_t w3,
>=20
>     ret =3D get_ffa_ret_code(&resp);
>     if ( !ret )
> +    {
>         *count =3D resp.a2;
> +        *fpi_size =3D resp.a3;
> +    }
>=20
>     return ret;
> }
> @@ -784,7 +787,7 @@ static uint32_t handle_rxtx_unmap(void)
>=20
> static int32_t handle_partition_info_get(uint32_t w1, uint32_t w2, uint32=
_t w3,
>                                          uint32_t w4, uint32_t w5,
> -                                         uint32_t *count)
> +                                         uint32_t *count, uint32_t *fpi_=
size)
> {
>     int32_t ret =3D FFA_RET_DENIED;
>     struct domain *d =3D current->domain;
> @@ -799,7 +802,7 @@ static int32_t handle_partition_info_get(uint32_t w1,=
 uint32_t w2, uint32_t w3,
>      */
>     if ( w5 =3D=3D FFA_PARTITION_INFO_GET_COUNT_FLAG &&
>          ctx->guest_vers =3D=3D FFA_VERSION_1_1 )
> -        return ffa_partition_info_get(w1, w2, w3, w4, w5, count);
> +        return ffa_partition_info_get(w1, w2, w3, w4, w5, count, fpi_siz=
e);
>     if ( w5 )
>         return FFA_RET_INVALID_PARAMETERS;
>=20
> @@ -812,7 +815,7 @@ static int32_t handle_partition_info_get(uint32_t w1,=
 uint32_t w2, uint32_t w3,
>     if ( !ctx->page_count || !ctx->rx_is_free )
>         goto out;
>     spin_lock(&ffa_rx_buffer_lock);
> -    ret =3D ffa_partition_info_get(w1, w2, w3, w4, w5, count);
> +    ret =3D ffa_partition_info_get(w1, w2, w3, w4, w5, count, fpi_size);
>     if ( ret )
>         goto out_rx_buf_unlock;
>     /*
> @@ -842,7 +845,7 @@ static int32_t handle_partition_info_get(uint32_t w1,=
 uint32_t w2, uint32_t w3,
>     }
>     else
>     {
> -        size_t sz =3D *count * sizeof(struct ffa_partition_info_1_1);
> +        size_t sz =3D *count * *fpi_size;
>=20
>         if ( ctx->page_count * FFA_PAGE_SIZE < sz )
>         {
> @@ -1409,6 +1412,7 @@ static bool ffa_handle_call(struct cpu_user_regs *r=
egs)
>     uint32_t fid =3D get_user_reg(regs, 0);
>     struct domain *d =3D current->domain;
>     struct ffa_ctx *ctx =3D d->arch.tee;
> +    uint32_t fpi_size;
>     uint32_t count;
>     int e;
>=20
> @@ -1444,11 +1448,11 @@ static bool ffa_handle_call(struct cpu_user_regs =
*regs)
>                                       get_user_reg(regs, 2),
>                                       get_user_reg(regs, 3),
>                                       get_user_reg(regs, 4),
> -                                      get_user_reg(regs, 5), &count);
> +                                      get_user_reg(regs, 5), &count, &fp=
i_size);
>         if ( e )
>             set_regs_error(regs, e);
>         else
> -            set_regs_success(regs, count, 0);
> +            set_regs_success(regs, count, fpi_size);
>         return true;
>     case FFA_RX_RELEASE:
>         e =3D handle_rx_release();
> @@ -1629,10 +1633,11 @@ static bool init_subscribers(struct ffa_partition=
_info_1_1 *fpi, uint16_t count)
> static bool init_sps(void)
> {
>     bool ret =3D false;
> +    uint32_t fpi_size;
>     uint32_t count;
>     int e;
>=20
> -    e =3D ffa_partition_info_get(0, 0, 0, 0, 0, &count);
> +    e =3D ffa_partition_info_get(0, 0, 0, 0, 0, &count, &fpi_size);
>     if ( e )
>     {
>         printk(XENLOG_ERR "ffa: Failed to get list of SPs: %d\n", e);
> --=20
> 2.34.1
>=20


