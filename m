Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9984B6B8D
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 12:54:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273085.468148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJwPf-0007gk-Dx; Tue, 15 Feb 2022 11:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273085.468148; Tue, 15 Feb 2022 11:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJwPf-0007dq-Aq; Tue, 15 Feb 2022 11:54:31 +0000
Received: by outflank-mailman (input) for mailman id 273085;
 Tue, 15 Feb 2022 11:54:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h622=S6=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nJwPd-0007dj-GW
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 11:54:29 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07639aa1-8e56-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 12:54:28 +0100 (CET)
Received: from AM6P192CA0040.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::17)
 by VI1PR08MB4301.eurprd08.prod.outlook.com (2603:10a6:803:f7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Tue, 15 Feb
 2022 11:54:25 +0000
Received: from VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::9a) by AM6P192CA0040.outlook.office365.com
 (2603:10a6:209:82::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12 via Frontend
 Transport; Tue, 15 Feb 2022 11:54:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT017.mail.protection.outlook.com (10.152.18.90) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Tue, 15 Feb 2022 11:54:24 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Tue, 15 Feb 2022 11:54:23 +0000
Received: from d445312d71a2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 327D080A-390F-4CE5-B015-1DA417FC1BE3.1; 
 Tue, 15 Feb 2022 11:54:17 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d445312d71a2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Feb 2022 11:54:17 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23) by HE1PR0802MB2458.eurprd08.prod.outlook.com
 (2603:10a6:3:de::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Tue, 15 Feb
 2022 11:54:11 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::5531:4c33:a50c:ea0e]) by VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::5531:4c33:a50c:ea0e%9]) with mapi id 15.20.4975.018; Tue, 15 Feb 2022
 11:54:11 +0000
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
X-Inumbo-ID: 07639aa1-8e56-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKcKXhoTx+igdbWMHJsiKM/50GDGJ8kddRW1k4iP5L0=;
 b=mbFLt10xZe+p/Vu7BBffq1R2ZSCZitiWEnQLJ5h9izZlpGkRdp+MXjlu5iQeDzwauRHt5ijIeQ4cL6zYshIOH0a7Qgdg7mX9oy4tRuRDavDJTTjdVXw6TPn3DVNrfzZCjsiqJ0iuDCoOpcCIitNn8clyiKty3Dl9r2iB+yM/GqM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e6500358317fef29
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CGJRKN420fmEnqwGkQaevLuNNLPm+LDsQYt0c4IIOOCaByJtv/19w2cKd0DjwuB3rU39hb7Zc4HhHXiSpLE0hhBVdFZcQsyyLsYDacnq3b/pCEMHEo7pAFwbt1QNpBeK7Uk5Ec6ld7o29O4tqep9Qtt5fkVxg5MtV7NTqY5XDzSVfRnPJC2/GNawUfbn0MtX7O2RpshzY2x7Jl9ysBz6s6tYuM0ou5ORnVMBgPTC3B0eRj1RsooXWeQc9NYTAyNuZkv2jy1IV174N74iptXROj9P5G13mRCeAE++9e8237OQOHEm1ORsAcGznIOvCFFxcmJ8ziYowy/6ZhhSxghSoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKcKXhoTx+igdbWMHJsiKM/50GDGJ8kddRW1k4iP5L0=;
 b=UXc82k/d4dC+Wf18dvtqEQ2GvTNprxAZR5GOvcgAQoKrDnwroLILmeOUswZ3Qur2QOUhVj19YEq1EnY9/Bk1fUauun9fOG+U0u2S4K6hMglP1v6byaA7TOiy4slKHywZvrvw0C5tPc6zhqZIcz5wUxgaqz3v8dA83tQi1ER4oLig2q6yYh78jb8kuhbRQr7TzqWnsafueO56IHfp81hcwJIT01khcCCJfnHmpcvuPrCDTdm4rXqaM5wtpKgrlHIcvEbfSm1PyvSCMig5NHJC4A6Ap1hyM4jMY4F0cBpbLTzUSw08sFoUKCu3vct2YE8VxNmDx/BAUdWZICQ4C7lagw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKcKXhoTx+igdbWMHJsiKM/50GDGJ8kddRW1k4iP5L0=;
 b=mbFLt10xZe+p/Vu7BBffq1R2ZSCZitiWEnQLJ5h9izZlpGkRdp+MXjlu5iQeDzwauRHt5ijIeQ4cL6zYshIOH0a7Qgdg7mX9oy4tRuRDavDJTTjdVXw6TPn3DVNrfzZCjsiqJ0iuDCoOpcCIitNn8clyiKty3Dl9r2iB+yM/GqM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH] rwlock: remove unneeded subtraction
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <20220215093951.97830-1-roger.pau@citrix.com>
Date: Tue, 15 Feb 2022 11:54:07 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <41CEACA2-9FB7-49C2-B773-01A21ACE8EE0@arm.com>
References: <20220215093951.97830-1-roger.pau@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-ClientProxiedBy: LO4P265CA0054.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::10) To VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 2f0de57e-5bb7-47f5-f605-08d9f079e934
X-MS-TrafficTypeDiagnostic:
	HE1PR0802MB2458:EE_|VE1EUR03FT017:EE_|VI1PR08MB4301:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB43010AF53C1356431C26154CE4349@VI1PR08MB4301.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PVpjno16z6SrFSH/YUEAeI3Il9dO8owSGpCt1hD0LK5AZxo1BPmm9QgjsyyoyxUJHRUxEcVxYTrgHs20qWwuyu8feGJvdoTn3R9QOWK2nd+lf2DzDpndAVb5JosllmX4pF/N2Sg+5XCB8Yzpk1Jd9wbuI1zw/mienJpv7XVhz8NWz5NesjwT1HmtRHwrVUXzw7LPnPt93uBxS+9ssFODFt0E0OeP7TL/nk45THczVhPCicpxbDWMi1avenpmHYa+vD4QPxJ7WvX83/nZb09jFgx5EI6URrDUJTnvJ2lcKLoWezi6bMMNok11tY201ZvOFSMZdG77ma6OLEoCNwWYm21IyPtSJmkrtYcC3ctIzZedbsaitse2Hwvwscp+7KuYulJof0o7+h8nOZhhRdZZsWocOjJOfoAan4W88DOj+7qgo+cdUn77gz7QCNpfL7fXNDaECRmepIwJCEYG6lWbTs0GNxBbhSOik6dfGGLKTYeQPEJMqv3ILiJgiL5zdMs5TBFKfesF0ApeFx3d7BgXEuyGKik8w2DV+AWMzAVrahjGA9YE/wrOQz6LT0sYGd8edW47LD/IgOPK/50S/i70y0Vf9nuFKOKKeluORwXBAYR5U+nLnWGahbyg7qbbgHo+hK8XGpxMI84sLQG/ntNvznrYtmR7B09wezeQOofg0dQQ1x9AT8tFL6PMVwpxNtMplV69vpTvcA73e3KF6SHiFRmKGAOP/SgfBqd/lzoerAM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0801MB2125.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(66476007)(38350700002)(83380400001)(66946007)(6486002)(508600001)(66556008)(316002)(54906003)(6916009)(8676002)(4326008)(36756003)(6666004)(2906002)(33656002)(38100700002)(26005)(186003)(5660300002)(6512007)(8936002)(52116002)(6506007)(2616005)(44832011)(53546011)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2458
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b40840a6-a849-4762-96b4-08d9f079e110
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BdNW+OwcNw56GweX62E2LYvutFLViEAx6u7Z+cO3fIs0/bVFsHzsZmIlTZVAAVFKxvfktJFX45ZWsHuHJ6swlme8tS1+MwVMhRTQyikf0jRwWRXaaq/e4Kz2ZqAxsCqBNMLH8ZUqZ16mz51mHx8WmWhV8Ft4uxloOuP8g43a65bxaRpnN+Y+qwWKgyObY8/gvrJxgMUCU2HK/FO3Opjk4zrZ2QyQXF6EcnMUxh0XLWTNYtsxRJo7CP1aItZVhxgEaM7ys2xykSqIelJodQF5/yLMteyolLJzJVxExQSRZ/UcA6TVg5ygRcLpe2ty31HDn4ABIP9IF71C29l3Jt0P4/L8vZN0vuZOtwSnLfnAYluPR8zVGBPB8hTomEhd845oTlpFsAkLsI4JH/LnEU9Vsv0OGKzrCgx1R7qsTlV1Y3g423U9NPMRvA3o4bsMujqP0MGaS8qMIakJrDwlUyQQsmHE/6WnO6QOIi+0+wl+Zuqnyfw8w3+IAYxpp2xIKq3B0aHNAlxqeauROZXXTLwNWORmm/WlQ1OXYTPWnu1C6N15Iq+05kQfYEtz73m7vGE0qDXlZJBJ+/oW/IYuGB8A2rj7pFYnh16b/dBOpCs3YEBr2xkFQugDEgrxOr1LPQcAppKE5+ZWIobL1ZLYC12xx6LLd12FsEKcJ4JoXZYRU0R4aO4ymI64tgC+aC/nPy8U
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(53546011)(6506007)(36756003)(2616005)(4326008)(6666004)(2906002)(86362001)(316002)(44832011)(6486002)(508600001)(54906003)(8936002)(5660300002)(33656002)(336012)(186003)(8676002)(70206006)(6862004)(26005)(70586007)(82310400004)(40460700003)(356005)(36860700001)(47076005)(83380400001)(6512007)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 11:54:24.2858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f0de57e-5bb7-47f5-f605-08d9f079e934
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4301



> On 15 Feb 2022, at 09:39, Roger Pau Monne <roger.pau@citrix.com> wrote:
>=20
> There's no need to subtract _QR_BIAS from the lock value for storing
> in the local cnts variable in the read lock slow path: the users of
> the value in cnts only care about the writer-related bits and use a
> mask to get the value.
>=20
> Note that further setting of cnts in rspin_until_writer_unlock already
> do not subtract _QR_BIAS.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

> ---
> xen/common/rwlock.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/common/rwlock.c b/xen/common/rwlock.c
> index dadab372b5..aa15529bbe 100644
> --- a/xen/common/rwlock.c
> +++ b/xen/common/rwlock.c
> @@ -47,7 +47,7 @@ void queue_read_lock_slowpath(rwlock_t *lock)
>     while ( atomic_read(&lock->cnts) & _QW_WMASK )
>         cpu_relax();
>=20
> -    cnts =3D atomic_add_return(_QR_BIAS, &lock->cnts) - _QR_BIAS;
> +    cnts =3D atomic_add_return(_QR_BIAS, &lock->cnts);
>     rspin_until_writer_unlock(lock, cnts);
>=20
>     /*
> --=20
> 2.34.1
>=20
>=20


