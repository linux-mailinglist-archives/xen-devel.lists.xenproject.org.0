Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B606570F85
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 03:32:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365423.595583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oB4kz-0000cd-QE; Tue, 12 Jul 2022 01:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365423.595583; Tue, 12 Jul 2022 01:32:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oB4kz-0000aq-Mc; Tue, 12 Jul 2022 01:32:09 +0000
Received: by outflank-mailman (input) for mailman id 365423;
 Tue, 12 Jul 2022 01:32:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RdAP=XR=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oB4ky-0000Vk-9E
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 01:32:08 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2070.outbound.protection.outlook.com [40.107.104.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71050352-0182-11ed-bd2d-47488cf2e6aa;
 Tue, 12 Jul 2022 03:32:07 +0200 (CEST)
Received: from AM6P192CA0077.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::18)
 by DB7PR08MB3659.eurprd08.prod.outlook.com (2603:10a6:10:4a::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17; Tue, 12 Jul
 2022 01:32:04 +0000
Received: from VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::35) by AM6P192CA0077.outlook.office365.com
 (2603:10a6:209:8d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Tue, 12 Jul 2022 01:32:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT027.mail.protection.outlook.com (10.152.18.154) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 01:32:03 +0000
Received: ("Tessian outbound 6f9e7ef31fa8:v122");
 Tue, 12 Jul 2022 01:32:03 +0000
Received: from 19b741affa19.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 43CCB285-CD40-45AB-B39E-D90B95F0C5BA.1; 
 Tue, 12 Jul 2022 01:31:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 19b741affa19.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Jul 2022 01:31:57 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VE1PR08MB5040.eurprd08.prod.outlook.com (2603:10a6:803:114::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Tue, 12 Jul
 2022 01:31:55 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%6]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 01:31:55 +0000
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
X-Inumbo-ID: 71050352-0182-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=nd0dtO0X+jpma8hKdUz1irZYJ1tNF9paWx4HPMKCOPIW5TQh19qzgD1Aw9F6nEkNk2uNNtUdGnuRavVf9p5VJyxCAncbaJj81xTNabPv3MLitZ7cA1Ooch/LilcNeExqO/aO+UsGB9n+MHCAQSm8OArLF9WdMSc87ZZFsyleS68bMy+4xFJb7O/spfE+G9r9eBUKzVf2t7MJ7NFxL71VkAb8JBpCrbsTVvwQe0bnl4te28PZTmH6deGxs4zRpZUOqfttyXjKbHykU3+GbvboORCjk4kPYIj9XbNfcEe1Hp1/m1MEE/Dx7uqJdBN4TpYpnJim/V6+M2448An9qwjX1g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pLbnfL+Gz9SPmEBz9QaoaqJdo6noPN1TKLPKQ7V4kI=;
 b=jmc3Q1kGlKuWYhVFkYTxcZxv14y1o8SA1G74TyvU92+oLAOHgE0q42J8Qe5vyVyveNis8zOVMJ5X7fw6IRoc7getGSBBTGb1ToRbW+GjcSFtFWywm2ZrStCENo8iPZ9Ty79D9yS/OfWJYtlPYxVFEHseE9UAwujzuNWh4C3iPvULmQovG1Sqmg2qo0MGAHNQNcW7TbNX/hO+3SyYF1NXiwVNKfE49k/GUKIHz8la5UCVjnMPwFDirmQM9k7QT63Rt9DtAz8RvxQGQo0Mz/3xchnPsE+vDi/Ud8o+A121MvDFrAVFMwxN7hdnPmiraQgjSQ0TJkJAdWxv5UyreDt6jQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3pLbnfL+Gz9SPmEBz9QaoaqJdo6noPN1TKLPKQ7V4kI=;
 b=98CHtEmTd6Nq40CDyiL+GDgU3+dV2rqkY5Cw+YN5GnS+jQx/XRNlJHXx/VS9zOzH2Mv2R/7B0uQ8PZuhnsGSoug6E0G4J53c1QaSswpc95e93vdufGmjK6wCNghiS+4Ew051EjcGgfyzBAtudf+0+FlOzTIOQAjG+ouEvGx5A/c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxtSGsfSU9uiguPvfvbcs7N1QfZTNTIlJETAE2WnfFawyg2pvRx/o5eU4G3Hzw94GG7ZN3tQq864izmxBqP8EN5nr0PIPHpP253pZNykQxpGiF1bPPVCgr9JSq6xA+RdzcTVYz+TB+4HtB/sj5uAVedMEwEh8uNHeCcTw6D80UCFXWa5ndfNekANB4s/w/xysduolFv+/7B8zFcA31MZudXobu6SpAt8dww1737ij4f7at25NfBluUpbPWRpsjVqOD44GvE9lUzzWKD99MPI+J2cTIlIh8c0EzK5juVYCwv2ig78byRQdEiRZuJSSLUz6XKQeQ/h3FIPMRqysWPMfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pLbnfL+Gz9SPmEBz9QaoaqJdo6noPN1TKLPKQ7V4kI=;
 b=GOicARoFCtieSmYqeZh8qYWWMLE4Ce+DamYjxVnNfrRgH+xkV7L52o7dxnuIPwrqBPv39OwTPVjBUQ2iAAztOPX+hRramcZL2yDbUzR09Q1KGgtzLD1jfAF73ZFDLogGLbY5fWyCr3f1Epu90+xt4TPGR3ySfwzThFNWc4AL8/ICbWX1ZaKqxqae74r/XYrtooI2YfHO5OTRGjX/D+5qZsuef1BldZMSPVKiUb04C7TQDpGvyBssazFU6qcgeG91ptaP5jNB8Z+zG4q4nr/Kn17yaOpduGpNfNWOCJ/QgbzfB7eZjDkI1Hq5VRos4sSoMY6KFpxxWaSJWvOddb7s5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3pLbnfL+Gz9SPmEBz9QaoaqJdo6noPN1TKLPKQ7V4kI=;
 b=98CHtEmTd6Nq40CDyiL+GDgU3+dV2rqkY5Cw+YN5GnS+jQx/XRNlJHXx/VS9zOzH2Mv2R/7B0uQ8PZuhnsGSoug6E0G4J53c1QaSswpc95e93vdufGmjK6wCNghiS+4Ew051EjcGgfyzBAtudf+0+FlOzTIOQAjG+ouEvGx5A/c=
From: Henry Wang <Henry.Wang@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>
Subject: RE: [XEN PATCH v3 23/25] tools/helpers: Fix build of xen-init-dom0
 with -Werror
Thread-Topic: [XEN PATCH v3 23/25] tools/helpers: Fix build of xen-init-dom0
 with -Werror
Thread-Index: AQHYh+TiIM174Jj4iU+QhvgrADwspK16Dl7Q
Date: Tue, 12 Jul 2022 01:31:55 +0000
Message-ID:
 <AS8PR08MB7991ECD0505597A4F50CBD5E92869@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-24-anthony.perard@citrix.com>
In-Reply-To: <20220624160422.53457-24-anthony.perard@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 7B376912EE31D94D8E84D8533FEAE039.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 920b0f5b-4800-43b4-964a-08da63a652e7
x-ms-traffictypediagnostic:
	VE1PR08MB5040:EE_|VE1EUR03FT027:EE_|DB7PR08MB3659:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FdxuZDDOr9uGIGmtVsxRgJvCoj5d0lgihmm0qgk7DBTAcYr0Ru/tqnKSJ4M3o/l5PU6JFvlWGrb5B/+AX8bRsZ40MRdZFahSttvxIHpi9hCtY7YbqtcCnKPOqBmHQOtHpgzwpfOFb5dVaN5kkMjJOHN7UvUno0ehZ90PKKSwRAr2IDMpGoPi6QzFDL9EnHiDQHb7oYPnmfvA9ZxCfJPOoz5fSaJCCycsR71ubblIUnIJKx+1/aDl/aQmUo3sn7BNbZYDbIXw5vM1yUCgfvq2iqCZjCy+HC/5GfUKiYqkHixrD1QkSQLlGSEbDUzJVOUwicPi3pcjB2KTnFzfzBzONM/vgASF5naGm4+4ThBLxk5zsI3UIX18xPgjBvjRfk7clTAvbUMYPIJI3+F5GhvbTpd3vx5CEt3t7I0H7P1Jb6v5VW3FlT19FKN1lpMG4xdU5ReeUPfublsPu5drSm0XTcYf9jYUKfiMtl7Wd8NJPHw1ssszwMS1zCMUuMB6YjJZ6xuq1TiMv2KyRZOP5wAsGcBiiWZT+JN5FYZ8WGqxsHlOfL8RTRlawgueyYLTFS0IfTG1UnOGC7QW46dkduDotU03+mK0xg4NHFn0L5o1u3QXqutmEzElfojiRGeob9YbptJ7V94ZzLnbkVXDr5XKVKLzf+fdOCoQZYDAr/H7V2F7DduSPnQmkCtpyhn08MEK6CaCelTv3/WxiK52/540AZWpJvmVrHog2Y0xqsE7tb/pWxRGYnWTz0YkFk1gKgK+C+lMQkDkvGKDzLhLGrMngbmtihcLwrhf7nB0oa4lxLlG0HPlY3OGRukLMrXGNFGA
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(346002)(136003)(376002)(396003)(38100700002)(41300700001)(2906002)(122000001)(5660300002)(4744005)(33656002)(6506007)(38070700005)(86362001)(7696005)(478600001)(8936002)(66946007)(52536014)(186003)(66446008)(55016003)(66476007)(71200400001)(110136005)(8676002)(4326008)(26005)(9686003)(83380400001)(64756008)(76116006)(316002)(66556008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5040
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	34db3638-0857-49b5-3d85-08da63a64e02
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mefvf8APbG/N6HTeMXfM2uRbDtaiSPP4uxxTannrKNlzbb5MndKvFohJcjeRV+uHx8GE9+IZIE1/IUoh7P+8G/n9Ifky689znmOEEyhE761D7SBi7TDvJww7Y3jpN7QlIlyq6Y74unaqA5Vi4ve4pof8nAyDoa+cVTXKHnVGEgw3gnhkrKziNEblaqJHeGilvzCC0WBSEzzM9G/99D+jBbIc35Ka8b0MPx4paW4AD9AGmsDaARu3GPpMilcf6ELYz3/gAlY33hT6gEji3xb9kEr5EtUiyWVv+vS6tx6SJTzcxmKif6jNfgSM7IvnqAumLTBJkGmkIdLyU28ZxUBCbKOW5pSwxUSzGbHBYyn/h3zgibsmuVL7lkCFo+gcbzFz9nefU56f9xBNoLJrczTkSl7JH7aQ+tzU1jJifi6cOQw2toZgJ3gMmu3bVVp/dpjzCrgRPdA5XPKiBM6MY4mTpBNDPuf3mDAeSWZuMlgY0uQs5kCME98nfh4FVdhpNnK//iObTu0sYysPgwMpledUqiekHEV23jNrEm2JPplfXrrxIFge4Uyur9eoy+s+fCN8pn8wqq/NMrhujCZV50cELA8Hb3LxSLY7zY7rTsqiWilI8EdBNdEKs6M3+WBr5Wgs8YFFvj8xvFN7M91WRZCYwdyJwAnnBclbLoNGeTcWTkWhbDK7+GSPKGrZLi5y4o3iD3BMYOVjCmJU+cGcgL9uCO5Ch1CrHeZ9W27adUNggs6+q4ZN5Bh8FenpLcFA+MF1imrmV3hxdHkbkAiMoTPFyC0xth86GEqbOFiZllxMHoZMfbfOmzN0RN1NqnL96l0J
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(346002)(136003)(36840700001)(46966006)(40470700004)(82740400003)(81166007)(83380400001)(4744005)(356005)(36860700001)(40460700003)(5660300002)(52536014)(8936002)(47076005)(41300700001)(336012)(186003)(82310400005)(55016003)(40480700001)(2906002)(478600001)(70586007)(7696005)(6506007)(26005)(9686003)(70206006)(316002)(86362001)(8676002)(110136005)(4326008)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 01:32:03.1882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 920b0f5b-4800-43b4-964a-08da63a652e7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3659

Hi Anthony,

> -----Original Message-----
> Subject: [XEN PATCH v3 23/25] tools/helpers: Fix build of xen-init-dom0 w=
ith
> -Werror
>=20
> Missing prototype of asprintf() without _GNU_SOURCE.
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

> ---
>  tools/helpers/xen-init-dom0.c | 2 ++
>  1 file changed, 2 insertions(+)


