Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12907435B5A
	for <lists+xen-devel@lfdr.de>; Thu, 21 Oct 2021 09:08:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214185.372661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdSB0-0005xw-H2; Thu, 21 Oct 2021 07:07:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214185.372661; Thu, 21 Oct 2021 07:07:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdSB0-0005vo-DR; Thu, 21 Oct 2021 07:07:46 +0000
Received: by outflank-mailman (input) for mailman id 214185;
 Thu, 21 Oct 2021 07:07:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P/Q/=PJ=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mdSAy-0005vi-Lz
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 07:07:44 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.44]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 94d3ae36-323d-11ec-8369-12813bfff9fa;
 Thu, 21 Oct 2021 07:07:42 +0000 (UTC)
Received: from AM6PR08CA0025.eurprd08.prod.outlook.com (2603:10a6:20b:c0::13)
 by AM0PR08MB5252.eurprd08.prod.outlook.com (2603:10a6:208:15a::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Thu, 21 Oct
 2021 07:07:38 +0000
Received: from VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::ec) by AM6PR08CA0025.outlook.office365.com
 (2603:10a6:20b:c0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Thu, 21 Oct 2021 07:07:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT014.mail.protection.outlook.com (10.152.19.38) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Thu, 21 Oct 2021 07:07:37 +0000
Received: ("Tessian outbound 16951d3c485e:v103");
 Thu, 21 Oct 2021 07:07:37 +0000
Received: from 24dd52e0a709.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CAD76A13-EEE6-43E6-A517-1912708C63ED.1; 
 Thu, 21 Oct 2021 07:07:30 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 24dd52e0a709.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Oct 2021 07:07:30 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6463.eurprd08.prod.outlook.com (2603:10a6:102:157::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Thu, 21 Oct
 2021 07:07:27 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%9]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 07:07:27 +0000
Received: from smtpclient.apple (217.140.106.52) by
 LO4P123CA0356.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:18d::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.15 via Frontend Transport; Thu, 21 Oct 2021 07:07:26 +0000
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
X-Inumbo-ID: 94d3ae36-323d-11ec-8369-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIkQPWZwwrCJSTFe4KSt2/HnGoJQ9yChM5yBS1Qd+1s=;
 b=56lweWkeqBiqvite7O6JLH61X3k3yjhjQWy8bz+mGJrMu6o7BKTuVp9E678P6ODmtdcimrpG/tvnmRidXO9uyzPCpy61pbH+Ggeo3/ycVt06HOhlEdmreuOuezOclsql7YPtG5MbhC8aBAYYqrIRrA/GyGxBHM68p9DN0+NufH0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 05cca4b21fa7ea3d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZAwww46x4F4Asy5GYP62ANIWwk5Km1ugnhYQfCL9UeWobvuoh+8jn8VTcFgSZsIC8tECLCuRtKvuN5iWdjrUYY+++FXl7snNpga21b9viQVI0nJUa4yPQp5eMDaKFT3rZe5Mw5alE5ZqnZt2GWqvvjYJIDcAJvCtECM9DHAevDSOLjdAWQkIt8AhFzKKRI5bh/C5njTyw7+/RL7yse7QMIzeMGSYxXqMhn5u4gz9VDcdFnx2JP06yvnsKnMnO3q25u2XJEjH4doNkijyjYFsTx6j2/rQSdpz4AniDOKIMqBQeq0FGsyRp5GXKrY+w0X5xYNxXBcSLVXkKZvW6zP87Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIkQPWZwwrCJSTFe4KSt2/HnGoJQ9yChM5yBS1Qd+1s=;
 b=cRQWvMYyXzGdRfAURP9PoYqOvu3OdLPGCmox/k8a9+Ws+5c7RMAxSE1ruSBk8wPVqWoJlieYj850Mp8SmxFmoZsM5dAurE0LE10cOIsqM9OGGnSbOse/qOqEgpu5urOQuRqSTbAvl6zVG9+HwVxSw6ZFtKQnL/H6IgAHGDgFXWYdymSm4PhE9Cd6Ar9lb5dyJHmmw0OTnHQiicyJwBrYb+cykB+K7nYyY2ddfAHddODyLGMR+/wXpN0AKC9+rcfhlXYSjEoZevmnzgbeB1EeO/Kig6W70ivFa/17NnF5DGSRGF7KZhDMql4PLmpCbxseDANoi7Ysqj6oD/tFVj+5PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIkQPWZwwrCJSTFe4KSt2/HnGoJQ9yChM5yBS1Qd+1s=;
 b=56lweWkeqBiqvite7O6JLH61X3k3yjhjQWy8bz+mGJrMu6o7BKTuVp9E678P6ODmtdcimrpG/tvnmRidXO9uyzPCpy61pbH+Ggeo3/ycVt06HOhlEdmreuOuezOclsql7YPtG5MbhC8aBAYYqrIRrA/GyGxBHM68p9DN0+NufH0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH for-4.16] tools/xenstored: Ignore domain we were unable to
 restore
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <20211020144519.10362-1-julien@xen.org>
Date: Thu, 21 Oct 2021 08:07:23 +0100
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>,
 Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <01870077-5FE4-45D8-9716-B81C0A705DC0@arm.com>
References: <20211020144519.10362-1-julien@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO4P123CA0356.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::19) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1db8bab8-5b16-4b51-839f-08d994617704
X-MS-TrafficTypeDiagnostic: PAXPR08MB6463:|AM0PR08MB5252:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB525219D0BAC73F923F81A1D1E4BF9@AM0PR08MB5252.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 r41gfgMshH3K1D39tHT2Z4J1nBbulzoBDusrPjD+7bM3ozmTb9UP5NG9zdLzVgDctSlcTV9AE/oyUYpToby99OOXGP8nc8eZsGW/UxdLoK0347RsDlO2rRJHTAdNvgTrtzt4q8DLVy/aP3WB2d/q6g69uq6dGEEBPBbK+fiAAfcdgqm2dm9jJx7eWdTvSDLCaXxFF38874RYmI1JZm3e2nRLRf7kHqcomVpX4XZrCrQYoD0SERw8ILP1n2+K05fVJuXmNNUHhIZmMkDce6QRO3/KjOiv/RR+psSlfRzvg40ox5hg9PYmmM8PySZwWvTCirzooOQ4dlgFTV54G47cB5q65WJPMaLEgLjqeZBCoSxYEF6kkjM7zbfvxpIMQkNRPg2zCqL5zIxxQqMuoynWCEig2Yt76fP6eBk0ZFPwY2VAsbgvxnPPPjOfP0mUsFEbfM6j/GR+LiP5QejDNceBoOofSWG3O7R3BUVkYqBTpemUR4rwmIZnX2TKs/ZOP1lVI/lliNqoKD6h7FvoGE8KeuAOHZK974OTK4kpQ+GhT9DFnhOFAHbeEcr2IXNLgvLWpGthXzuO/Yuyp5Im/NAWqNZlATcjv/g1SIYfJSzOw0LlNQ99klyrsLnXWwhqxAzE/KadKZzfZ1WFxMqokQi5aKfZs/a797l861oaP0bX+pWVHvm/f6eh/OGxWmMVQJgpTsEARApZW5KsVeQiHZm02RG92dqbrUoewhZZIiL7C9s=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(5660300002)(316002)(54906003)(38100700002)(38350700002)(8936002)(2906002)(86362001)(6512007)(6486002)(26005)(83380400001)(6916009)(33656002)(956004)(2616005)(6506007)(186003)(52116002)(36756003)(8676002)(66946007)(53546011)(66476007)(4326008)(66556008)(44832011)(508600001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6463
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6a8a9768-cb17-4103-44bb-08d99461706f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7W3it6xYOJ1uqil3SZbPsgsMVgiApnPQxUbEIvrM2Ld7UTLToy1TXDx4JYJDrh0zQv1plX3KwpU2q2ze5TEAu/ZnMrbXOyN5jFIOZc/2Xu7dhKUxuQYz79Z1dmd3GexcoaR4+rZ1KDcKgoMKWjhpDsQv7iEb/9GLUnClkfDtBk+ab3QW88ob9PDuzo4n0S/WLz3tCV2oOd1veAE7fPvQ2wARzgXEVzy9w9xjtamHMY4B5tgJt2np+zERfGKD2E76ZjtsH+0rlcfqP299VRsZ5h2GYrVQpjFzDVtaH/tuEAmKnDQ3KqqWjrTldk/d4R9L0xt64r1e/o7DVffNrU398/YGc0DHYi9stphApqB/DjA1Gn92y7LUNw9ZA76wyDmX6f8RS+FISBhcDqDGu+GVxdZlVkNouF4JqH1H46KxvjjKJIJFwFF0xZCwf4QHHvRqNxn++mjyROSZT/VxzJrBEYNHkb2MnosGYyKIUx6mgxhYm6/PucgSwuiDhWnprhTZ023bvaqOvzwHXphMVwPf/ZbWCZZIvBNwW8ksLKOGx/R+KvmM7detIcDr+S65WSYV5mCSb+MrhOA2ps5ngNL1TVoJl1axuv84qer0npg3SCxBJ2eIVRDR5fhYDPa3MxZIsJs0Qi8URYhn+4apLhG3YW6iHnBj6zzuy1PxNiKVMn7Iy88B4QgEiabkyYyLE1AQlqOSb4PbYHNdCw0q6ycpmQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6666004)(6506007)(508600001)(53546011)(5660300002)(83380400001)(82310400003)(36860700001)(54906003)(2616005)(316002)(44832011)(33656002)(4326008)(956004)(8676002)(186003)(6862004)(81166007)(70586007)(26005)(6512007)(336012)(107886003)(70206006)(6486002)(8936002)(356005)(47076005)(36756003)(86362001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 07:07:37.8149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db8bab8-5b16-4b51-839f-08d994617704
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5252



> On 20 Oct 2021, at 15:45, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Commit 939775cfd3 "handle dying domains in live update" was meant to
> handle gracefully dying domain. However, the @releaseDomain watch
> will end up to be sent as soon as we finished to restore Xenstored
> state.
>=20
> This may be before Xen reports the domain to be dying (such as if
> the guest decided to revoke access to the xenstore page). Consequently
> daemon like xenconsoled will not clean-up the domain and it will be
> left as a zombie.
>=20
> To avoid the problem, mark the connection as ignored. This also
> requires to tweak conn_can_write() and conn_can_read() to prevent
> dereferencing a NULL pointer (the interface will not mapped).
>=20
> The check conn->is_ignored was originally added after the callbacks
> because the helpers for a socket connection may close the fd. However,
> ignore_connection() will close a socket connection directly. So it is
> fine to do the re-order.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

>=20
> ---
>=20
> This issue was originally found when developping commit 939775cfd3.
> Unfortunately, due to some miscommunication the wrong patch was sent
> upstream. The approach is re-using the one we discussed back then.
>=20
> This was tested by modifying Linux to revoke the Xenstore grant during
> boot. Without this patch, the domain will be left after Live-Update. Note
> that on a basic setup (only xenconsoled and xl watch @releaseDomain),
> the domain may be cleaned on the next domain shutdown/start.
>=20
> Xenstore Live-Update is so far a tech preview feature. But I would still
> like to request this patch to be included in 4.16 as this was meant to
> be part of the original work.
> ---
> tools/xenstore/xenstored_core.c   |  8 ++++----
> tools/xenstore/xenstored_core.h   |  1 +
> tools/xenstore/xenstored_domain.c | 21 ++++++++++++---------
> 3 files changed, 17 insertions(+), 13 deletions(-)
>=20
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_c=
ore.c
> index 0d4c73d6e20c..91d093a12ea6 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -338,10 +338,10 @@ static int destroy_conn(void *_conn)
>=20
> static bool conn_can_read(struct connection *conn)
> {
> -	if (!conn->funcs->can_read(conn))
> +	if (conn->is_ignored)
> 		return false;
>=20
> -	if (conn->is_ignored)
> +	if (!conn->funcs->can_read(conn))
> 		return false;
>=20
> 	/*
> @@ -356,7 +356,7 @@ static bool conn_can_read(struct connection *conn)
>=20
> static bool conn_can_write(struct connection *conn)
> {
> -	return conn->funcs->can_write(conn) && !conn->is_ignored;
> +	return !conn->is_ignored && conn->funcs->can_write(conn);
> }
>=20
> /* This function returns index inside the array if succeed, -1 if fail */
> @@ -1466,7 +1466,7 @@ static struct {
>  *
>  * All watches, transactions, buffers will be freed.
>  */
> -static void ignore_connection(struct connection *conn)
> +void ignore_connection(struct connection *conn)
> {
> 	struct buffered_data *out, *tmp;
>=20
> diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_c=
ore.h
> index 258f6ff38279..07d861d92499 100644
> --- a/tools/xenstore/xenstored_core.h
> +++ b/tools/xenstore/xenstored_core.h
> @@ -206,6 +206,7 @@ struct node *read_node(struct connection *conn, const=
 void *ctx,
>=20
> struct connection *new_connection(const struct interface_funcs *funcs);
> struct connection *get_connection_by_id(unsigned int conn_id);
> +void ignore_connection(struct connection *conn);
> void check_store(void);
> void corrupt(struct connection *conn, const char *fmt, ...);
>=20
> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored=
_domain.c
> index 47e9107c144e..d03c7d93a9e7 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -268,14 +268,7 @@ void check_domains(void)
> 				domain->shutdown =3D true;
> 				notify =3D 1;
> 			}
> -			/*
> -			 * On Restore, we may have been unable to remap the
> -			 * interface and the port. As we don't know whether
> -			 * this was because of a dying domain, we need to
> -			 * check if the interface and port are still valid.
> -			 */
> -			if (!dominfo.dying && domain->port &&
> -			    domain->interface)
> +			if (!dominfo.dying)
> 				continue;
> 		}
> 		if (domain->conn) {
> @@ -1303,6 +1296,17 @@ void read_state_connection(const void *ctx, const =
void *state)
> 		if (!domain)
> 			barf("domain allocation error");
>=20
> +		conn =3D domain->conn;
> +
> +		/*
> +		 * We may not have been able to restore the domain (for
> +		 * instance because it revoked the Xenstore grant). We need
> +		 * to keep it around to send @releaseDomain when it is
> +		 * dead. So mark it as ignored.
> +		 */
> +		if (!domain->port || !domain->interface)
> +			ignore_connection(conn);
> +
> 		if (sc->spec.ring.tdomid !=3D DOMID_INVALID) {
> 			tdomain =3D find_or_alloc_domain(ctx,
> 						       sc->spec.ring.tdomid);
> @@ -1311,7 +1315,6 @@ void read_state_connection(const void *ctx, const v=
oid *state)
> 			talloc_reference(domain->conn, tdomain->conn);
> 			domain->conn->target =3D tdomain->conn;
> 		}
> -		conn =3D domain->conn;
> 	}
>=20
> 	conn->conn_id =3D sc->conn_id;
> --=20
> 2.32.0
>=20
>=20


