Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 833646F6418
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 06:39:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529550.824036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puQjx-0004b9-Mr; Thu, 04 May 2023 04:38:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529550.824036; Thu, 04 May 2023 04:38:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puQjx-0004Yd-KC; Thu, 04 May 2023 04:38:49 +0000
Received: by outflank-mailman (input) for mailman id 529550;
 Thu, 04 May 2023 04:38:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ABSM=AZ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1puQjw-0004YT-0W
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 04:38:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e057a87-ea35-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 06:38:46 +0200 (CEST)
Received: from AS8PR04CA0009.eurprd04.prod.outlook.com (2603:10a6:20b:310::14)
 by AM8PR08MB6545.eurprd08.prod.outlook.com (2603:10a6:20b:368::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Thu, 4 May
 2023 04:38:37 +0000
Received: from AM7EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::3c) by AS8PR04CA0009.outlook.office365.com
 (2603:10a6:20b:310::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26 via Frontend
 Transport; Thu, 4 May 2023 04:38:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT044.mail.protection.outlook.com (100.127.140.169) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.26 via Frontend Transport; Thu, 4 May 2023 04:38:37 +0000
Received: ("Tessian outbound 8b05220b4215:v136");
 Thu, 04 May 2023 04:38:37 +0000
Received: from c7311422318c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1A9751A1-930A-4FDB-8517-62D73A2CD018.1; 
 Thu, 04 May 2023 04:38:31 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c7311422318c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 04 May 2023 04:38:31 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM7PR08MB5365.eurprd08.prod.outlook.com (2603:10a6:20b:109::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Thu, 4 May
 2023 04:38:27 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%6]) with mapi id 15.20.6340.031; Thu, 4 May 2023
 04:38:27 +0000
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
X-Inumbo-ID: 8e057a87-ea35-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9IMZTaetQU/LDyWZ0wOaYTWh5ffcjtrO06NcTJvkw4Y=;
 b=jdAjDFwNxYqW2SP5C4+voYD6zBYm3iU7TKOPNCJZw2uTvfI8Yoi8xvny2j+QkbBRNHL3KNsf4tCzY9ByR2soq21JBSxuxRj9azlmiictv+o8LUuUe7kWLG3BP/1xX5QlZg4XqYVZ52O0Yywz3zOAEHGup2idbsjnrr37QiTpgrc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h891+WVSYNkDSsl0p3idiC+O4Vh0a2bV8iqvG3t3xxQlrHTz8U3fXuB3klsRmMip6Cp1KrNvgdIUbQ7X2hwSpdF4VCbIf7Ql3VQoqsoaWwY33qs5YDIQd7P8jW3+IkAdlgVO6Lt8Xb58FOaMGwrQTA5YfHCNQ3XS4lhcucQi1JdWH7Cy2K5Fq+6I81Xvs8B+4+jYGV4d0emF3WnLUGngeI7aj22lUYOPirPohSu5P86Lknff7rhXcf93uyEWeT/JtmLPhDsO8jXUiLaR2GP76CQhnrjY81pLiodYK5DwjV43JF3IRwbqjypsGmOWHruv419DIbxE6mtGoYpkpecM9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9IMZTaetQU/LDyWZ0wOaYTWh5ffcjtrO06NcTJvkw4Y=;
 b=HvUYcRfbl+iLpyD14flz4wfc8EkAPOQ/UZhar/y5f8WXxRzUGk7BrEJfcsnSoFpbXou5aFsk9mE9KEdksEZc7YmLI7U9asGdtFSOwd4cDwojKfV8nnaQw4b7G0tfayL9T/YowrLVr0JnPsKEJ6ldafH8f5cQlePKyhJqtPl8jpj+t0Daejw9ArOH8p2xBr9WMMpghIPUuVhGR6xB8BDtjgvKhisxd7ZYYQIqY3XanIppFWdkPDXUgTIPILdqLKRZRO6QtHffzyrTznYPZvGa8pCS9YenRNNuAKkwhKb+fim3k/SuBE+HzZGxBVkA27t7vadimFx/vfvTOGFDrhLRCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9IMZTaetQU/LDyWZ0wOaYTWh5ffcjtrO06NcTJvkw4Y=;
 b=jdAjDFwNxYqW2SP5C4+voYD6zBYm3iU7TKOPNCJZw2uTvfI8Yoi8xvny2j+QkbBRNHL3KNsf4tCzY9ByR2soq21JBSxuxRj9azlmiictv+o8LUuUe7kWLG3BP/1xX5QlZg4XqYVZ52O0Yywz3zOAEHGup2idbsjnrr37QiTpgrc=
From: Henry Wang <Henry.Wang@arm.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <julien@xen.org>
Subject: RE: [XEN][PATCH v6 14/19] common/device_tree: Add rwlock for dt_host
Thread-Topic: [XEN][PATCH v6 14/19] common/device_tree: Add rwlock for dt_host
Thread-Index: AQHZfU8ldKybmQ5LfEKEsMjqvUt8n69Jh4jw
Date: Thu, 4 May 2023 04:38:26 +0000
Message-ID:
 <AS8PR08MB799196697F990D65F00163C2926D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
 <20230502233650.20121-15-vikram.garhwal@amd.com>
In-Reply-To: <20230502233650.20121-15-vikram.garhwal@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F5DEE6E9CFF93740BBB29AE2D5873925.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM7PR08MB5365:EE_|AM7EUR03FT044:EE_|AM8PR08MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: 275a40de-3bfc-4ef7-61f0-08db4c596d61
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zGE/iAS5D+Z5KOllX6q4lvf3yjjg5M/Rc9YEpZv1MmKLlB8PlfareyL61VznCrlgzVrEFTEsc/J4xwnkHAHVAQFI8X+rtqh0bftispKmBRV0INwkiRIZg/4S65EAx65gq4wl8x6ecXa1hIBQm2SKXbRyZxHrnK+w2JGnNF5gvg7l7OI6lq69jdFWPvpdbLLbs4IgegVCEd4uHGkiPPuZRzMBaSI1WyQGeTEud0LT0jbN6yZgaBGMG80PeFIa/smQE7pB9G7WwSi0qV1VlU/PvVwzZ3WTHLhDYYhm8WP3xgT18W7uftUOKDQ4b0ogTX1m40zkxobVELalinoMoRhqkHBrURem2vEeQ5jnLvj6I7h8KmpEmYLmNnNNydvl3r3RCzQOu0vacWdiaZWyR4jJ99gwWL2PN/R7M+2FVa0Gxd0mDJkDpxZF36u0sALlhbgZaBMm4dz0FLkamQiBWSQXVifJ5LjPdozfiVXW72eDr1mfsmMY+QijfDBR/EMNZ0czKzHecuqMKKyO3Bk00gvmWC0HVuIiJs0IQeY6Vs6cnqDsrXPR+wrXbeScwItZQVxDCqsD8HQdexGsazdg5tsNrubQspJtdCC81BNfZ7quh3P+kuE0CVzBaDzsNvU/I5tk
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(366004)(39850400004)(396003)(136003)(451199021)(122000001)(38100700002)(8936002)(2906002)(8676002)(52536014)(5660300002)(33656002)(86362001)(38070700005)(55016003)(71200400001)(7696005)(110136005)(54906003)(478600001)(26005)(6506007)(9686003)(186003)(83380400001)(41300700001)(76116006)(66476007)(66946007)(64756008)(66446008)(4326008)(66556008)(316002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5365
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	08ad4aed-3095-48e4-bd06-08db4c5966d1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Unp5QTXPpUZ9QgExU0kGsAZ7WbDUyFGyMzjR3DpYh0+i15HzzWPnVjjE6WMI7etqf47htdWjoYjlnjhY4W/pUpMEk/Ha5lLT4As1niMEfo6jYU3iAOMDWBmZ+A2ryMeJTw5GffM/DLmXhbkZllAW7AC3NsCvEeDjozdzv+KJoOBuHd1ql0hf/IiVelGvHpH1aJx+FEZ4ON5N+13Ffrk9dfQdvtJ6nZIheZYUUvCHL5c5pxQ6vdrAoL7mOSZFmDXpCh5YhwYzBxC6hMrPO482na2DjxiKJKGjQUqPhC+iCpQ3EQIqvpxzEbO8Cma4ygvveYPSG2ZfpYxs48ECUX7OSz9pi9cF9yPkNxermX1CaxSsXNYRBC8Plyntho1NK9sVyNwtkDof7N0Wm+iiJ6/BafNQaJE6Yn69ZrSh57HtwqcYjzsYoBBesa5520IF+waYfno8nB5N/Yt8dARmGNRCYZ+UC1IpWgCYajSz/DMp/zkrccJ8sB+2jx/ZXBA9MHMQNcgIOz3XTyzTp+mLvZKVdJ2956Csax15Q4c0i4bKdTu1cTEu4UfU5oevfTvzNL9bWE1uPac8mh82OKGK0kk/TTK4jpFYPbh6paUJPLQdKoG5jRet8dstv8cFMNKsLtpVWjIBlw8QODt6sBeIKzJ0qbxhn/tPJoxFv1E0XEPt/4Mn9/EtoBQ1HIuSTNCuRoDe/S5nxt9/7XbfFX79oJAbLqRHjlrNeZTEXrbUma7U2J0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(36860700001)(40460700003)(34020700004)(40480700001)(55016003)(2906002)(478600001)(6506007)(7696005)(83380400001)(4326008)(82740400003)(316002)(47076005)(110136005)(81166007)(8676002)(5660300002)(52536014)(41300700001)(86362001)(8936002)(356005)(70206006)(336012)(70586007)(54906003)(9686003)(33656002)(186003)(82310400005)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 04:38:37.3331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 275a40de-3bfc-4ef7-61f0-08db4c596d61
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6545

Hi Vikram,

> -----Original Message-----
> Subject: [XEN][PATCH v6 14/19] common/device_tree: Add rwlock for dt_host
>=20
>  Dynamic programming ops will modify the dt_host and there might be other
>  function which are browsing the dt_host at the same time. To avoid the r=
ace
>  conditions, adding rwlock for browsing the dt_host during runtime.

While now I understand why you use rwlock instead of spinlock in this patch
since you explained it in replying my comment in v5 (Thanks!). I would stil=
l
suggest that you can add that kind of explanation in the commit message to
make the commit message clear to everyone that reading this patch.

>=20
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  xen/common/device_tree.c              |  4 ++++
>  xen/drivers/passthrough/device_tree.c | 18 ++++++++++++++++++
>  xen/include/xen/device_tree.h         |  6 ++++++
>  3 files changed, 28 insertions(+)
>=20

[...]

>          ret =3D iommu_add_dt_device(dev);
>          if ( ret < 0 )
> @@ -310,6 +321,8 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl,
> struct domain *d,
>              printk(XENLOG_G_ERR "XEN_DOMCTL_assign_dt_device: assign
> \"%s\""
>                     " to dom%u failed (%d)\n",
>                     dt_node_full_name(dev), d->domain_id, ret);
> +
> +        read_unlock(&dt_host->lock);

Since you added "read_unlock(&dt_host->lock);" before the final return,
i.e. "return ret", I don't think you need to add "read_unlock(&dt_host->loc=
k);"
here before the break. Or am I missing something?

>          break;
>=20
>      case XEN_DOMCTL_deassign_device:
> @@ -328,11 +341,15 @@ int iommu_do_dt_domctl(struct xen_domctl
> *domctl, struct domain *d,
>              break;
>=20
>          ret =3D xsm_deassign_dtdevice(XSM_HOOK, d, dt_node_full_name(dev=
));
> +

Nit: Unnecessary blank line addition here.

Kind regards,
Henry

