Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1948423B8D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 12:33:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202705.357704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY4EO-0006kh-Hz; Wed, 06 Oct 2021 10:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202705.357704; Wed, 06 Oct 2021 10:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY4EO-0006hm-Dp; Wed, 06 Oct 2021 10:33:00 +0000
Received: by outflank-mailman (input) for mailman id 202705;
 Wed, 06 Oct 2021 10:32:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=13oh=O2=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mY4EM-0006hg-Ok
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 10:32:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.83]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 405b094b-2478-4505-a622-1ec996e25e33;
 Wed, 06 Oct 2021 10:32:57 +0000 (UTC)
Received: from AS8PR04CA0139.eurprd04.prod.outlook.com (2603:10a6:20b:127::24)
 by PR2PR08MB4812.eurprd08.prod.outlook.com (2603:10a6:101:25::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Wed, 6 Oct
 2021 10:32:52 +0000
Received: from VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::9a) by AS8PR04CA0139.outlook.office365.com
 (2603:10a6:20b:127::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Wed, 6 Oct 2021 10:32:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT031.mail.protection.outlook.com (10.152.18.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 6 Oct 2021 10:32:51 +0000
Received: ("Tessian outbound 8e26f7114b75:v103");
 Wed, 06 Oct 2021 10:32:51 +0000
Received: from fc40289d689c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 92878B94-E8B5-49C9-AC7C-8EF6B64908E4.1; 
 Wed, 06 Oct 2021 10:32:41 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fc40289d689c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Oct 2021 10:32:41 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6295.eurprd08.prod.outlook.com (2603:10a6:20b:295::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Wed, 6 Oct
 2021 10:32:38 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9%7]) with mapi id 15.20.4566.023; Wed, 6 Oct 2021
 10:32:38 +0000
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
X-Inumbo-ID: 405b094b-2478-4505-a622-1ec996e25e33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MYlKb19k6G+jjBlNhWheETaiq+KnOR8gjF/VO8Id4ak=;
 b=jJ5S8FCeRkiW9zFnsWLxfJF7G7ByodFKuLiLkazygV2yX0O5sBOHfD/mJ2HF1j9LCDcWnZeA4hNYQwbU9XXgF1MEhTli1I3i+ZG4rEEjp75rHBPZtPK2j0lNN1ZvGEHfy3QRKw9xTGLbIoQ0aCRKu/0jeHpfvvcBHQMUWnlmr4I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b4880f216777cfff
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T1qf7BmmYGc1f77mv1c3O+GMomt8sMfrBDNu/BYROF6EnRFyhUYtieFdOP6FT0JmN+At89iqZ651hoRh3WBXJtWYD1ogOFEuMl3VUN8HbcUOghuF4UfKDplk9TotrH1jvRHhhce607JLJNeo2C06JbgW+zLLMITWlP5hwuOSCOY2gOT/xMNbUAC7lO88NFP7QKhfPAKd2NE8o6STKTScty3hyNbkEdksqzAFqfU+2SnGp2iP3qp319cUE0XGdPvH2LHtJhPlRr6ino1xeiTiV422FHcr1JFheJ6GnYhI4k6Zm0jnhH8b2rGF+ojvLpZJJlvsDgnjSPh9r+2ateXVGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MYlKb19k6G+jjBlNhWheETaiq+KnOR8gjF/VO8Id4ak=;
 b=Zcap6jDOvIP6XSLX6xQi3mAsee+kYLoi7uX8+Bf3BdNBa9LwB35hpZbjlIbtjg9F9s84XizgLkvCthHDr+DdLP29tEU+KsQuDq4gKguMQb19McwsRQydRKAazes2JbkWBj4/4XDDGjavFhgg3TzCOfaV+2cIozeb8Vpl2jMWTWTATFFKPtKpX2JvWyE6zNI1p0STgDKLG6TA7Yx++FXQRwfXJrhP6ddJN8jEkhAXS3uKCRwRYJHD8lLG5n6+MbCX0bsbwh1zNkiW0jRdFjyM7RG/K+yq3uEEtqJQ6f2X3xTx7lCmSdqWLcWDLQ1Xx4uLx4xonOywTZwJmJL7tGHLSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MYlKb19k6G+jjBlNhWheETaiq+KnOR8gjF/VO8Id4ak=;
 b=jJ5S8FCeRkiW9zFnsWLxfJF7G7ByodFKuLiLkazygV2yX0O5sBOHfD/mJ2HF1j9LCDcWnZeA4hNYQwbU9XXgF1MEhTli1I3i+ZG4rEEjp75rHBPZtPK2j0lNN1ZvGEHfy3QRKw9xTGLbIoQ0aCRKu/0jeHpfvvcBHQMUWnlmr4I=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "oleksandr_tyshchenko@epam.com"
	<oleksandr_tyshchenko@epam.com>, "volodymyr_babchuk@epam.com"
	<volodymyr_babchuk@epam.com>, "Artem_Mygaiev@epam.com"
	<Artem_Mygaiev@epam.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "paul@xen.org" <paul@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v4 04/11] xen/device-tree: Make dt_find_node_by_phandle
 global
Thread-Topic: [PATCH v4 04/11] xen/device-tree: Make dt_find_node_by_phandle
 global
Thread-Index: AQHXuSnUS32qWIPSZk+UemyYVvX79KvFyKMA
Date: Wed, 6 Oct 2021 10:32:38 +0000
Message-ID: <BE63A8A7-21DF-433B-A879-E3253767C72F@arm.com>
References: <20211004141151.132231-1-andr2000@gmail.com>
 <20211004141151.132231-5-andr2000@gmail.com>
In-Reply-To: <20211004141151.132231-5-andr2000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4e834797-301d-4622-4a90-08d988b4a67d
x-ms-traffictypediagnostic: AS8PR08MB6295:|PR2PR08MB4812:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PR2PR08MB481255C551F6CDD628141FF7FCB09@PR2PR08MB4812.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4125;OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LrSbZ5aLtkVJL3EcG+YAeMn7HpbGa3K0M3jLHa6zdBdhQmw4591cSO7zCLPCcebn+MlMOSDTutBoBq9iSo4+dknYWaYnIgrKOIzKfaFSfNmZhvaktQGmyjHLeZOBjAdGB4IOBayaKk8BlwTfaFww1OWMHmTFNopw43gZ8Gmpc2sbTZDZAbw97JTb0LKZOap7/6KB2J7pJQo2XBEhqULqQKEJc8sZxHijbzNfAO+zseeAeFWB5lzp9G1KXUQChMPeIZpRlCLCsqGjcU7cD4kywk9drrFy7Dn7l+2OPALXgIp3UXg3ZDb++CiyOFkehTWF6lBZ2E33sFd7lBZZqDPFiqYuMdZrB9S+6MGI7rR35NUQOZRTJa+geVLqUDanvqzjWDRjgFqQiIWCdllKoXkqPPJiuGUOMR2dpvr99swZLSiHSIN0djO0+5ObHBABZRblt3HxMMuhtM1DEHQBuBlp8dtKpj9+wF3VO58BGMrBaqCgz1h+Pp/b+DX5Ik66U+rjFLgli51S3nbGRii8gFbf9NJeCktS6WVF5iLxPcL6UdjQLytf3oNeO+RSVZJLX5Cw/g/DR50cFI3OKdxoXL9odEQQb+YXlREdFsm3WktJXiTwGTDiWx8ZBxVIRgy1LEb/M/P8qxjygUtIiqcuEO/DnYvwZDukDVvv380IQh+Ylz4Y2uW5Dxz4t9xPuRRu0oDZvcVUzbpa6QBXif7MkUn9N9PWDIJouSgPBytP32Qhzcpp/FGdKYt01mKoUCKwdDKA
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(6486002)(2906002)(38070700005)(86362001)(33656002)(5660300002)(4326008)(186003)(508600001)(122000001)(76116006)(36756003)(66446008)(66946007)(8676002)(6916009)(316002)(26005)(38100700002)(6506007)(53546011)(6512007)(91956017)(7416002)(71200400001)(2616005)(64756008)(66476007)(54906003)(8936002)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <768B4540D8C09D44AAC82B3D603C934E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6295
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1d6efad9-7d26-4c96-3b25-08d988b49eb4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VLv8Bm/MhO3Lc0XaGa9Ui7AZrWqjiNiy09uavN1zLZUzNwx4mMjuevOd9LgFlJSTNViW1WXnmTOu4sQzl3PyvaW5pkaHeS+qeZu8WtUqlUib/aTlJ83UrYwS2Yn2K7+ykiNDJSZy/OAlSJehXcSArENAcl/6WXMsH1XAKUrEHnmdXtTwDbJQJAc+YRxVBe0AeMv9vZ2edWOWvxIGEX9lDdFT8GSrTyz1xRgkbn/ovbc8lfYen+dT0RVb5SsmrNWazKUctLLn0kVEf9CnD2UOLJWlrcARfp4okcEIq2oNbrjmky50qmOWVpbuljkCvjLqbOHi51x71W5Xh4ZxuBwd06phX21r+WCEjk8uiEMeBLIb8B9/JDqCloaVCeuZ2rfBob9AdXtGjnghnTaWCtyNldyEnI6eWezczD21JMnRoUjatADJfx7xF3ykqAsk7aHBJ4DMpPEGqSUcETGDybtTDh+OLYG9YUdLJSfOwt4qwR5YHGURaypqvdga1izjo3nNhUmWQI5mIqUOMn/mhvbwSfMqMPc2vNoulCjAh1iRiKOBoefZWXA2nwR+dSJ4siTfa4ypXQF1Ovrt5jIB8h1PUkoyvy4cQ7b2a8fvmy7G505Hag4djiX20+xTfNARLpFMLfUNnAov8p6DMqySShegasrDS25e5fZL0UEJOmNcVR6wlI1zTRaysd8/nuL0cxWAmWK/AYJjegPGklKJPYKO0g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(6862004)(2616005)(2906002)(8936002)(70206006)(83380400001)(70586007)(6486002)(356005)(8676002)(508600001)(107886003)(336012)(36756003)(81166007)(316002)(186003)(5660300002)(86362001)(54906003)(33656002)(82310400003)(4326008)(47076005)(36860700001)(26005)(53546011)(6506007)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 10:32:51.7256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e834797-301d-4622-4a90-08d988b4a67d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4812

Hi Oleksandr,

> On 4 Oct 2021, at 3:11 pm, Oleksandr Andrushchenko <andr2000@gmail.com> w=
rote:
>=20
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>=20
> Make dt_find_node_by_phandle globally visible, so it can be re-used by
> other frameworks.
>=20
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
> ---
> xen/common/device_tree.c      | 2 +-
> xen/include/xen/device_tree.h | 2 ++
> 2 files changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index ea93da1725f6..4aae281e89bf 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -1047,7 +1047,7 @@ int dt_for_each_range(const struct dt_device_node *=
dev,
>  *
>  * Returns a node pointer.
>  */
> -static struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle)
> +struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle)
> {
>     struct dt_device_node *np;
>=20
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.=
h
> index 2297c59ce66d..fd6cd00b433a 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -849,6 +849,8 @@ int dt_count_phandle_with_args(const struct dt_device=
_node *np,
>  */
> int dt_get_pci_domain_nr(struct dt_device_node *node);
>=20
> +struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle);
> +
> #ifdef CONFIG_DEVICE_TREE_DEBUG
> #define dt_dprintk(fmt, args...)  \
>     printk(XENLOG_DEBUG fmt, ## args)
> --=20
> 2.25.1
>=20


