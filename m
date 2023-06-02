Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AACF71F834
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 03:53:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542895.847311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4tyY-0004lw-0V; Fri, 02 Jun 2023 01:53:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542895.847311; Fri, 02 Jun 2023 01:53:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4tyX-0004jM-Sy; Fri, 02 Jun 2023 01:53:09 +0000
Received: by outflank-mailman (input) for mailman id 542895;
 Fri, 02 Jun 2023 01:53:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sIO5=BW=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1q4tyW-0004jG-Tm
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 01:53:08 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060d.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 381e0b54-00e8-11ee-b231-6b7b168915f2;
 Fri, 02 Jun 2023 03:53:07 +0200 (CEST)
Received: from DB6PR07CA0198.eurprd07.prod.outlook.com (2603:10a6:6:42::28) by
 DBAPR08MB5831.eurprd08.prod.outlook.com (2603:10a6:10:1a8::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.23; Fri, 2 Jun 2023 01:52:58 +0000
Received: from DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::d8) by DB6PR07CA0198.outlook.office365.com
 (2603:10a6:6:42::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.10 via Frontend
 Transport; Fri, 2 Jun 2023 01:52:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT040.mail.protection.outlook.com (100.127.142.157) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.24 via Frontend Transport; Fri, 2 Jun 2023 01:52:58 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136");
 Fri, 02 Jun 2023 01:52:58 +0000
Received: from 6828480bf95f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 317D623A-891D-4CD0-9CC0-1E933FA89A42.1; 
 Fri, 02 Jun 2023 01:52:51 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6828480bf95f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Jun 2023 01:52:51 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAVPR08MB9507.eurprd08.prod.outlook.com (2603:10a6:102:313::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Fri, 2 Jun
 2023 01:52:47 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%4]) with mapi id 15.20.6455.020; Fri, 2 Jun 2023
 01:52:47 +0000
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
X-Inumbo-ID: 381e0b54-00e8-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0NQxd+XEjJNS+8C5C/l9cvvYxaMlDQrPrSDsYlk538=;
 b=QWdkUgA4NH8qEpn53QuqHeTA8mIvz+e59OXR34DL2Iid6Iq6lLZCLVPNx7XCIB53RGNRuA11lymKFoXi/y/1jZVVPdRfNDKsHnU22owysjeqMttBn5GjJw7OTfwA6DVWL5dJjjoBMovQNfABAlzaB9tOc6gcZKONUA6pgrkXv/A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KQWCNbo5svX3B5l4BppP9kOysnk/MLh1AVqJv36ifj/H724fruW4S/ivW1rRR+Cn9Y1DNVW9Zp4sbnCfa2x18EWT2x+kxs2qlMC/v/SqwmAfTCyrAaiXEczJPZhGRB2CMF+VBMHxquv+pVypoR37NqSm72CPC4v0BgukmTltZeFkt7v8wGWmrZUssj2LvW9HYU4+oLBcwsU3Ze022HNMDWdjcac0e/vf1c+hxPyvSbibw5Tih3ZWDXEkiga43RS287O7kfn/g/O5f/vhUX58/DON8DAbT1ZoIXAM/jFideXrLJGlJxtwFwlFPVzLWD8CadXFfXwrhNo9ToAHqDOzaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0NQxd+XEjJNS+8C5C/l9cvvYxaMlDQrPrSDsYlk538=;
 b=YUT7KQRJACGoAwLn6F6CJIjobiJVBYyrP30Uq1OAn6q6KUQhJE6K363D/Y0Ohyxsvrmzt5bsj/EaQJNyAjGGr6GkV5VXwiLzCU64/+NeIvY3klyaYvcZV5z9Gs3LHA7DtiAyNI9XUIKNZFvpGmeSLsmW8G86R6j/VFMSlyV7Lskp9F6lF5Gc+YncUQUJMSHGiYoJcZ+flfI5TLLFLiE26gYt56D0I0s1MvY15BGrl2JM74CLKab1Fd1D5cqRSr9/QtJ7rVJbliqOYizSNQxJMq7RT5OE/KcxyBEZ/V9m0wI2fWYMnRCx693AUxoFAwWaVeLtXo/1ygevHInxg+R1+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0NQxd+XEjJNS+8C5C/l9cvvYxaMlDQrPrSDsYlk538=;
 b=QWdkUgA4NH8qEpn53QuqHeTA8mIvz+e59OXR34DL2Iid6Iq6lLZCLVPNx7XCIB53RGNRuA11lymKFoXi/y/1jZVVPdRfNDKsHnU22owysjeqMttBn5GjJw7OTfwA6DVWL5dJjjoBMovQNfABAlzaB9tOc6gcZKONUA6pgrkXv/A=
From: Henry Wang <Henry.Wang@arm.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "michal.orzel@amd.com" <michal.orzel@amd.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jbeulich@suse.com" <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>
Subject: RE: [XEN][PATCH v7 08/19] xen/device-tree: Add
 device_tree_find_node_by_path() to find nodes in device tree
Thread-Topic: [XEN][PATCH v7 08/19] xen/device-tree: Add
 device_tree_find_node_by_path() to find nodes in device tree
Thread-Index: AQHZlOwR4Ipv6iy3bEahGOYsyZBxb692vxnQ
Date: Fri, 2 Jun 2023 01:52:47 +0000
Message-ID:
 <AS8PR08MB7991C49F7ABDC5DF8C41250F924EA@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-9-vikram.garhwal@amd.com>
In-Reply-To: <20230602004824.20731-9-vikram.garhwal@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 71651548EC30EE41BFB5C27F72EE5D50.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAVPR08MB9507:EE_|DBAEUR03FT040:EE_|DBAPR08MB5831:EE_
X-MS-Office365-Filtering-Correlation-Id: aa69aaed-06ae-4b28-6e68-08db630c1729
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5olP8utBu08OMclmZ3I9WmHsxKd/W+/vTftfS1NfykbJMGXUoc8gQTE2KjhXQwPlTIJqwpHzzG17B2L85P/UtSalG5D2pcSVd/yESkQ5s/k1fnCZkPsQ9ahiELSZvH/rzepxQciu7RnO74E+q0Dj7Oax8EpzaL6AsZVamdTGODIX0twJhtwHzusOaF3bnJf9n5I6i1Z1N3pDYFauwUK9rViOo+aV/fz9tz+YGxxtS58jD3/9tj17Q0NDd5fN0AxfJtOs2QtqP2U1y3ZpZ/BIbe0aUdFMQwxDTHor2B/0uhVAAA0rCM4GQXaA1j1nbgFBZmVoZQb0KD4PzLUj5abIjWImq+wxKckcsbOhWkkdtMzXpta9+j2wGFl9ofdffK9XOA3UdSdv1qIM1/uDA7ZusnadyTsRKZlhpY3kJFpPTCFNN3azefBFKqlgmcMSGfTgxeQ/g1IeKnckClZLSIiHso4ZxgOfwCsMQk/TsDJRNF2hpZM2tJZNhOFwhYIzU7m4kM79MqR5zC9cH5fO4/gjELDt2FpVOtHS3JEz0V9HKbEYIoVaToB/hYLqTvMKwrsJAqaRgXYaf8gUcBPFMDKwEorfi/PzPo87GXqLxLIhHriZga+mDCuzYJKAUQbuqt8RBXpbaSJLLlXBe58zGr4rRA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(376002)(39860400002)(346002)(451199021)(52536014)(54906003)(66556008)(71200400001)(110136005)(316002)(478600001)(4326008)(76116006)(66476007)(66446008)(66946007)(64756008)(9686003)(26005)(6506007)(8936002)(5660300002)(2906002)(41300700001)(8676002)(186003)(83380400001)(122000001)(38070700005)(38100700002)(7696005)(33656002)(55016003)(86362001)(37363002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9507
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	81a822dc-b7ef-4f66-8da0-08db630c10f5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UzkKbv57H+iHN83bzaVilpDYgPvzZrT1za667Dx3TPrdo7I3OwO2uXWIGh5bNKHyU7Selxvt7Xu3aHdnjxLJ94g2L/7AVwruXF99GX3TtfNtJ2nOm/dQriKraqUCx6NB7+CZiohZqBZdG8IGYjnh69/pQ8jsGgHOT+Zq1S+E6MAckry7Z0VL2MjfEmJcz853br+MbbnF2QFyEq7ZnRmR4iOulcgxl08yHUEIWNVRA8CsqGGiAc+sBAOwrDsZo5nS1L+W00Zl+k7eiA3roAP//aPHrf658MirgdwlxebYV/pZKBoL5TqaJrveEE6YdHD8EQQRO1eDee65akVnuLHz4qMKGl9saKPsqLw49wIeIdw2fO6K8jKoyFQzv/LlK7Od5Ad+dnRya5+RnKV3ZaOkr7o2IVAljh76cj9CLUyq/KxWhOUDnefvz/i6ffZ0wzeJvbzNUTRRvouWjBwUQInq5mHrJyDsWXCvavEETXx/+O15qAGOojRH4InApDopx6wwZhIXR6zmCy9z9GoumcZ5l6GwQ74XJZeWLwzloDZb4l/OMtSVsCPX2fG0psrqB7ymvSgYw+uzbLREkHYtlqIDxJUhH3NMDiqgVzbLhxIAftg826Q88xriC/Xykg3IbsGGlcpTAHJposhN60nyedCmYLJn9QSNJn18JEptAP7hwSaKDqvbnJ5l9y3emjzBhg6hDHGkQ+BRYqlPbkYNJdDqdvACDNumR7yG3CLJVR5DRtlE5tXEnnt4xHnDMR4lI/+bubkxKLHB1RCow2XBiBWCIg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199021)(46966006)(40470700004)(36840700001)(40480700001)(356005)(70586007)(70206006)(336012)(82740400003)(40460700003)(55016003)(26005)(6506007)(186003)(478600001)(9686003)(8936002)(33656002)(41300700001)(82310400005)(7696005)(8676002)(86362001)(2906002)(52536014)(5660300002)(81166007)(4326008)(316002)(83380400001)(36860700001)(110136005)(54906003)(47076005)(37363002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 01:52:58.2249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa69aaed-06ae-4b28-6e68-08db630c1729
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5831

Hi Vikram,

> -----Original Message-----
> Subject: [XEN][PATCH v7 08/19] xen/device-tree: Add
> device_tree_find_node_by_path() to find nodes in device tree
>=20
> Add device_tree_find_node_by_path() to find a matching node with path for
> a
> dt_device_node.
>=20
> Reason behind this function:
>     Each time overlay nodes are added using .dtbo, a new fdt(memcpy of
>     device_tree_flattened) is created and updated with overlay nodes. Thi=
s
>     updated fdt is further unflattened to a dt_host_new. Next, we need to=
 find
>     the overlay nodes in dt_host_new, find the overlay node's parent in d=
t_host
>     and add the nodes as child under their parent in the dt_host. Thus we=
 need
>     this function to search for node in different unflattened device tree=
s.
>=20
> Also, make dt_find_node_by_path() static inline.
>=20
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>=20
> ---
> Changes from v6:
>     Rename "dt_node" to "from"
> ---
>  xen/common/device_tree.c      |  6 ++++--
>  xen/include/xen/device_tree.h | 18 ++++++++++++++++--
>  2 files changed, 20 insertions(+), 4 deletions(-)
>=20
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 16b4b4e946..c5250a1644 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -358,11 +358,13 @@ struct dt_device_node
> *dt_find_node_by_type(struct dt_device_node *from,
>      return np;
>  }
>=20
> -struct dt_device_node *dt_find_node_by_path(const char *path)
> +struct dt_device_node *
> +                    device_tree_find_node_by_path(struct dt_device_node =
*from,
> +                                                  const char *path)

NIT: I found that the indentation here is a bit strange to me. I personally=
 would
write like:
struct dt_device_node *
device_tree_find_node_by_path(struct dt_device_node *from, char *path)

[...]

> -struct dt_device_node *dt_find_node_by_path(const char *path);
> +struct dt_device_node *
> +                    device_tree_find_node_by_path(struct dt_device_node =
*from,
> +                                                  const char *path);

Same here.

But anyway, the content of this patch looks good to me and I confirm you've
addressed the comment of mine and Michal's in v6, so:

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

