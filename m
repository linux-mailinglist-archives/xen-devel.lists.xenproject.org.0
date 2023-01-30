Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91024680B20
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 11:43:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486836.754270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMRcb-0006b0-9m; Mon, 30 Jan 2023 10:42:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486836.754270; Mon, 30 Jan 2023 10:42:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMRcb-0006Xt-6d; Mon, 30 Jan 2023 10:42:45 +0000
Received: by outflank-mailman (input) for mailman id 486836;
 Mon, 30 Jan 2023 10:42:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AqBv=53=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pMRcZ-0006Xn-Oa
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 10:42:43 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2084.outbound.protection.outlook.com [40.107.7.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d34d7055-a08a-11ed-9ec0-891035b88211;
 Mon, 30 Jan 2023 11:42:43 +0100 (CET)
Received: from DUZPR01CA0031.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::16) by AS4PR08MB7902.eurprd08.prod.outlook.com
 (2603:10a6:20b:51d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Mon, 30 Jan
 2023 10:42:28 +0000
Received: from DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:468:cafe::d) by DUZPR01CA0031.outlook.office365.com
 (2603:10a6:10:468::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36 via Frontend
 Transport; Mon, 30 Jan 2023 10:42:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT063.mail.protection.outlook.com (100.127.142.255) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.17 via Frontend Transport; Mon, 30 Jan 2023 10:42:27 +0000
Received: ("Tessian outbound 333ca28169fa:v132");
 Mon, 30 Jan 2023 10:42:27 +0000
Received: from 60b79171cdcc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6A77341F-F10E-4E94-89C3-DA7F8DEBBAF8.1; 
 Mon, 30 Jan 2023 10:42:16 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 60b79171cdcc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 30 Jan 2023 10:42:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB8133.eurprd08.prod.outlook.com (2603:10a6:20b:54e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Mon, 30 Jan
 2023 10:42:14 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::28a0:e0e8:1277:2a06]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::28a0:e0e8:1277:2a06%7]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 10:42:13 +0000
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
X-Inumbo-ID: d34d7055-a08a-11ed-9ec0-891035b88211
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LaLvTfGY3yPCKPIkdgdR6515xyazaVC9XVEgVwtipb8=;
 b=7rOK3ya4kX5Pn+LzzNWz9hJ5iQxxmxZPAHsSG8o2nvJTCxrZhvyW13BW85ouM7j5RQH0Wwnib6xpjIcJHqBVqH5UiD6zdLxvuSu8EPBLcA8EeXYdVOeznGbRiWluUJJNbOGNuVkObqjf2IRU1hxnNBipxCjznMtMrvdXDId8Wa0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6a5222100630ab47
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SjQHVUoqR1SkNWqCxW5X0FvZ6DhU9j9s6JIU3WUaBIN388ax/IaKifRjN9ovc26KaIKt4DHmcAdyxEUV8b61mJYwF0AetXblnybDU1m6Z5A5YmF4OomdzCm15Q3P3F0GrT9qKTKNgqwTu+XNlGtC4OdYuLpabE2lO50oN+5ql4Gt6z2NC14Tys4XGcoLn1Hst2/yhcNb+b9+wmYfzEnZVBQb846YFeiQeCd0iMS2DWpcaPbxhHID5YAzvieSKEWTn8KBBuafw5PTZr5yz0Mcs5al2bjtWDeVbpH+C+iTVqxLglvLpOfhpCel2Dh3BqttFa7I50+ZDEYHTV2lukxmkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LaLvTfGY3yPCKPIkdgdR6515xyazaVC9XVEgVwtipb8=;
 b=YGudpXjxGLBDJ1TApeWKgRIEuo7Gv+j3hhzLTLvea+B4Rp9+RS07LibeyGZbDt7Js3cHsdD7vziRSFK1+Hd6QSTaXVc2glSL7P4QPzN+Psgc6IvuhiZilW9KQOuCVhJHyj9jiCgBnn2sUaCSF1MIiw7zQwKn9f5F2vrQzvcqRA2yaw5ul1KKrRzoSGzJ9gj82MoqYjLV+UiNZO3cZWx6jVo4luCmhpFwGCW42XPzJa0INRiyfFfs8S3rdsZxNWFZWbDN/QWPjVCGYr3v4RWb7XhdvwLtT9/6EmZc8Uofb9B6PihACxHewloOD/2w+tzzsSY+xUw3ALeaerR6MUPIrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LaLvTfGY3yPCKPIkdgdR6515xyazaVC9XVEgVwtipb8=;
 b=7rOK3ya4kX5Pn+LzzNWz9hJ5iQxxmxZPAHsSG8o2nvJTCxrZhvyW13BW85ouM7j5RQH0Wwnib6xpjIcJHqBVqH5UiD6zdLxvuSu8EPBLcA8EeXYdVOeznGbRiWluUJJNbOGNuVkObqjf2IRU1hxnNBipxCjznMtMrvdXDId8Wa0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 4/5] xen/arm64: mm: Rework switch_ttbr()
Thread-Topic: [PATCH v5 4/5] xen/arm64: mm: Rework switch_ttbr()
Thread-Index: AQHZMolOd87sSpDhTkiljIZJzDGtf662yeWA
Date: Mon, 30 Jan 2023 10:42:12 +0000
Message-ID: <1A67BC62-95DE-41F4-ABA5-D473B9D27D60@arm.com>
References: <20230127195508.2786-1-julien@xen.org>
 <20230127195508.2786-5-julien@xen.org>
In-Reply-To: <20230127195508.2786-5-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB8133:EE_|DBAEUR03FT063:EE_|AS4PR08MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: aface393-8025-41cf-526e-08db02aeae99
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 iyO/BnotuK0ZD/eEPiH1/FbTM5JjKgiolDncwOavxGeCu4zuN9gWSKBoOy2kir7iPL1kON2KrZxwYgh91Qbee4K1Dq6BUelsMw/7NOGAkdWYvFNBcwwOANSkaHIINh18A/JMm7FnH6ILnRCZI/EgraUC/HXToJ/J4VNtilcPPNz5RnRgbfuRG8bfRSCnGaZVu7AA7SKLAsZ+Seojd4pXUW7Z6PTnoS4ogO+eFdNaT9s0kVxWxMUyGxpxww9UAnlgmqsao2Wv170K43CLu6Lry6AYzxkj+8SNPm3w2v7qBeMFNCDehvwqf8EjnZzLyko8A1dP6zrDn0iP1ImwrBGn4Q22nVU/rJRC+gs8C1l1yB8UPdztqjchzP+ibLeZdG91jCpHQZXCqYwbmEaUPa5C4AjerLBrwWpQM03JGl5KJkDpcYPoKTZlaQac9kMG84MMvI78ZkA1CM0VVNX3LoEOJ82AxO08rIxb5T8ZJE71SLY5j0JP0No6bNyYc2Ceq8K0THJlzSHSAsK0yyG6Nwf0o6tnWlp3Mqk4670cXNtRzaKWEharPuh/DoKw9MMOsWteG7XtAnSh4ET6IxkNFhR1TzxQXRU5hO86XvBUGG+6DBWN5hIIYAP5HSeks6Bl+jcOn66ypDQBsauNNjZSTNR9M3a9m9e/Vw20obYG7U0kIpaIs4B/dPeq1cHaNr9ifU6Add/KQLAda2rCnBeuZGRI749ZRPBRNUshwiIrG+XuC2A=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(451199018)(66476007)(66556008)(6916009)(64756008)(66446008)(8676002)(41300700001)(4326008)(76116006)(83380400001)(91956017)(66946007)(316002)(8936002)(6506007)(36756003)(2906002)(6512007)(33656002)(71200400001)(54906003)(5660300002)(6486002)(478600001)(86362001)(38070700005)(186003)(26005)(122000001)(38100700002)(53546011)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_1A67BC6295DE41F4ABA5D473B9D27D60armcom_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8133
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7a49f224-0116-4b18-6cc9-08db02aea5a6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HXrD61spGOgYg1arDi2Cbjgqo4XbtNYXYC7hrdpc2KvakrFzx8seAlCogozgUF7xAzDWeUrNe5WLG8OWuwVtdsPRZhofnNySmF8A3mVKNkroZz4oxpukxcUkihxbJ719iEEOiMD+EEYPNfV8x/qpOs6iuLYigxTEBuC4YoyrTstpDeRCw94NGFIRJANmigO++2ROgZlnorij/nRyczcfnPXsjxdIEotm7EyBCnBGIvatyiEGt8tH8W8sTfSlVd9yyfNnvsJxEc1jkjuFPsqQZvbNb2tH+JGsYj6H2mqnXPgXe4UnuO0YpVYuK8m00t66fL6MlaSEQj0cq7JWaVFAjRfpzAbA9Lbn8e1pq/5XB4MuarxUstRObIA+Lybam04SlGjbiUbD1K7Xtxf/n7hekc+zU4I/BBn0BDzZlenObvr6QgyjDX56LCG1yscBaemo7mqoNybHB+jMT5JMXTTP7vUCvpV6QQPQC/gWnCQuwTaa9S7H1HnS/ZPBv22XameMuLNtAyB2vNW6OVYFx2Y4kXshNhX1MjoYhsaEue8UXdJplDJU9WijrR4Zufk9NEAdZorec/vFpk2b3kICgt4wAPx+bRqlKGhGz7/8s7kptq5AcR+mwsZygMQYX/cy2b9l7gCSnAztpfA3pJIYxix7vFG1zmpwmxZ8w3Rbk6kJakg18LS14+dk/dhzLnx3K5S80YE7O3KaIzei+cCNvjAdhg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199018)(36840700001)(40470700004)(46966006)(82310400005)(36756003)(36860700001)(26005)(47076005)(6512007)(82740400003)(2616005)(186003)(5660300002)(40480700001)(2906002)(53546011)(356005)(81166007)(478600001)(45080400002)(6486002)(6506007)(70206006)(70586007)(8676002)(4326008)(86362001)(83380400001)(336012)(54906003)(107886003)(40460700003)(316002)(41300700001)(8936002)(6862004)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 10:42:27.9749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aface393-8025-41cf-526e-08db02aeae99
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7902

--_000_1A67BC6295DE41F4ABA5D473B9D27D60armcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On 27 Jan 2023, at 20:55, Julien Grall <julien@xen.org> wrote:

From: Julien Grall <jgrall@amazon.com>

At the moment, switch_ttbr() is switching the TTBR whilst the MMU is
still on.

Switching TTBR is like replacing existing mappings with new ones. So
we need to follow the break-before-make sequence.

In this case, it means the MMU needs to be switched off while the
TTBR is updated. In order to disable the MMU, we need to first
jump to an identity mapping.

Rename switch_ttbr() to switch_ttbr_id() and create an helper on
top to temporary map the identity mapping and call switch_ttbr()
via the identity address.

switch_ttbr_id() is now reworked to temporarily turn off the MMU
before updating the TTBR.

We also need to make sure the helper switch_ttbr() is part of the
identity mapping. So move _end_boot past it.

The arm32 code will use a different approach. So this issue is for now
only resolved on arm64.

Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Tested-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com<mailto:bertrand.mar=
quis@arm.com>>

Cheers
Bertrand


--_000_1A67BC6295DE41F4ABA5D473B9D27D60armcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <92100302E4FEA943A6E4277A45408317@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"overflow-wrap: break-word; -webkit-nbsp-mode: space; line-br=
eak: after-white-space;">
Hi Julien,<br>
<div><br>
<blockquote type=3D"cite">
<div>On 27 Jan 2023, at 20:55, Julien Grall &lt;julien@xen.org&gt; wrote:</=
div>
<br class=3D"Apple-interchange-newline">
<div>
<div>From: Julien Grall &lt;jgrall@amazon.com&gt;<br>
<br>
At the moment, switch_ttbr() is switching the TTBR whilst the MMU is<br>
still on.<br>
<br>
Switching TTBR is like replacing existing mappings with new ones. So<br>
we need to follow the break-before-make sequence.<br>
<br>
In this case, it means the MMU needs to be switched off while the<br>
TTBR is updated. In order to disable the MMU, we need to first<br>
jump to an identity mapping.<br>
<br>
Rename switch_ttbr() to switch_ttbr_id() and create an helper on<br>
top to temporary map the identity mapping and call switch_ttbr()<br>
via the identity address.<br>
<br>
switch_ttbr_id() is now reworked to temporarily turn off the MMU<br>
before updating the TTBR.<br>
<br>
We also need to make sure the helper switch_ttbr() is part of the<br>
identity mapping. So move _end_boot past it.<br>
<br>
The arm32 code will use a different approach. So this issue is for now<br>
only resolved on arm64.<br>
<br>
Signed-off-by: Julien Grall &lt;jgrall@amazon.com&gt;<br>
Reviewed-by: Luca Fancellu &lt;luca.fancellu@arm.com&gt;<br>
Tested-by: Luca Fancellu &lt;luca.fancellu@arm.com&gt;<br>
</div>
</div>
</blockquote>
<div><br>
</div>
<div>Reviewed-by: Bertrand Marquis &lt;<a href=3D"mailto:bertrand.marquis@a=
rm.com">bertrand.marquis@arm.com</a>&gt;</div>
<div><br>
</div>
<div>Cheers</div>
<div>Bertrand</div>
</div>
<br>
</body>
</html>

--_000_1A67BC6295DE41F4ABA5D473B9D27D60armcom_--

