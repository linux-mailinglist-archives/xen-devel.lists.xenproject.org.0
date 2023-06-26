Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E994D73D7D5
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 08:38:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555324.867014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDfrT-0000pN-US; Mon, 26 Jun 2023 06:38:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555324.867014; Mon, 26 Jun 2023 06:38:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDfrT-0000mu-RY; Mon, 26 Jun 2023 06:38:07 +0000
Received: by outflank-mailman (input) for mailman id 555324;
 Mon, 26 Jun 2023 06:38:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VCbL=CO=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qDfrS-0000mo-Sn
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 06:38:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00dd9c50-13ec-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 08:38:04 +0200 (CEST)
Received: from AM0PR10CA0084.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::37)
 by DU0PR08MB8115.eurprd08.prod.outlook.com (2603:10a6:10:3eb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 06:37:51 +0000
Received: from AM7EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:15:cafe::75) by AM0PR10CA0084.outlook.office365.com
 (2603:10a6:208:15::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.33 via Frontend
 Transport; Mon, 26 Jun 2023 06:37:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT024.mail.protection.outlook.com (100.127.140.238) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.15 via Frontend Transport; Mon, 26 Jun 2023 06:37:51 +0000
Received: ("Tessian outbound 7c913606c6e6:v142");
 Mon, 26 Jun 2023 06:37:51 +0000
Received: from 69f9ac3a6256.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9F3C3845-AFD6-41F1-9E57-8DCF8B967F34.1; 
 Mon, 26 Jun 2023 06:37:44 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 69f9ac3a6256.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 26 Jun 2023 06:37:44 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB9902.eurprd08.prod.outlook.com (2603:10a6:10:476::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 06:37:39 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38%7]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 06:37:39 +0000
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
X-Inumbo-ID: 00dd9c50-13ec-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ferisvNy9e27IgA7vh9aB23Z45vU94YrxS3hYrKPy2o=;
 b=MxZdoRh31LhKw0+7NyzutzmSe/JnCrXZ6SlH5Mi1O3aV35RFmGj9Gykkx1OH64k5pMfs9etrpKMCt3EW62Pu17KfbHAZgkctL3clQ4bWhGhsw2WQuaFoU/Nd4Id/9p0qyOvHTV+kT7U3Z4cJJuoFl34bo5soH3C+GCKZ2M61Iug=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUflJLn2vN8y2noQtLqF4JznwEbryLhTQTNLXrUfSE6YpVi3ePiAYoNYwWVGVtUu4xs/L1OFkE3bUQA9Dv5U2fdfx39aS1lKjmaf6gjlx0cMU9OSu5lk93RPAS516v2SZ7yDP2PUOzLsoysj3ITixQxCFwi2nB7SIJITKX99mbS+cBFovP+kKJyAT2nVMBxQaUPtpettmnKoiEV1vph7IlxWbmmbl+S8BTTxlDIiwLtyrq0FfmqNAEW+kBEjrmH5ws+GS/4aC7FU56pTpqfWWolb3wMdxpJsK/7RF8vlyHYW13nxCQZHCz4HwNMdGpkeupyY0huMnh10EKvUlcktgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ferisvNy9e27IgA7vh9aB23Z45vU94YrxS3hYrKPy2o=;
 b=SQ6GNGgwndJf3ARm7/ZquU8sQi9V69/CuVj3pP6i3AsYPXZAXmNcPH7CaugaVc5jvFgvQJuKys/hDP19VTS4XG46ue72z2h9WvEtMBTeUeNBTVIuAqWEKLPi9ArcV2FCwMMZEp2qO4UIJQ1/lppdX7C6Z1f3Y05Zpl22VsJktR2FySAwBRjhmTvU0SZYFs/CaYivtbvsgkgEuDO15tZGeszuIxYraQP1oD8Bz0YrxTXDNfshtLfH3cGGNW3T57RWEkaqfjTnd2efdSDIL0nrbyeaAlO/dkGi/nJSwS0+ZS7KYtQ/RHriK0wkRlVd8x5VylBuowy69TchR3pqHWNG6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ferisvNy9e27IgA7vh9aB23Z45vU94YrxS3hYrKPy2o=;
 b=MxZdoRh31LhKw0+7NyzutzmSe/JnCrXZ6SlH5Mi1O3aV35RFmGj9Gykkx1OH64k5pMfs9etrpKMCt3EW62Pu17KfbHAZgkctL3clQ4bWhGhsw2WQuaFoU/Nd4Id/9p0qyOvHTV+kT7U3Z4cJJuoFl34bo5soH3C+GCKZ2M61Iug=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 4/9] xen/arm32: head: Remove 'r6' from the clobber list of
 create_page_tables()
Thread-Topic: [PATCH 4/9] xen/arm32: head: Remove 'r6' from the clobber list
 of create_page_tables()
Thread-Index: AQHZp6aNphiDCO/BkkCsUZAyj9Agbq+cof4A
Date: Mon, 26 Jun 2023 06:37:39 +0000
Message-ID:
 <AS8PR08MB7991C294B8036581B9174A169226A@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-5-julien@xen.org>
In-Reply-To: <20230625204907.57291-5-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 6F1BCC4FCEFEB34A813AE2D32025DEEC.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB9902:EE_|AM7EUR03FT024:EE_|DU0PR08MB8115:EE_
X-MS-Office365-Filtering-Correlation-Id: ee5547a7-787f-449f-2ef2-08db760fdd53
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Ink96l/CR18FOe+XOexTijxSnmkepad9NBfl+5JulJOE07UNF2g8bRPM77gOPU2oEaAtlXE7h3JDlVbo63h2OM8VcPOW/mmqHEqB1HR35LzzXvtN5BYYUYfNkY6O2pMgShpJQmtGENlf2WL7vrnGbKdDfmr+ZvmR01ecIf4FrkCk9OjthZsOpTNMBezgiTlrHmJ1FSJRvY071B36s3LOnTnNIzPtNp9aJpFJmN1j7J/E4wUBQSR4UK72HXLck+TK7pwtJxCY1XNIsHFqVxy6oR0frRwJLOfscBNlub3T5wf0HgEHTM3BWqdms9ikexzEMtgHNf0+EbgL0jcGXzatH3L4ayhq9uhgakut6xRwE2cVaBQrjqkwUWQ/XpbiwnWmN8omqwgA6uSDRAuMhrpVL/iG90qaiE04pomVVqEPK+/1o0HQbSkgwqSYi7DkWigzDSbsNN/rLtBjHKQApkxegIRtfE6selV577MHRnqGKDTLXBMQxYLp9WMzgkhaqA6q0WZKhyx41n3dVbeLASKZgzBPPXeGYKnvPOUYf6qTaAm+/IwLh8dLwSKnjZgKNkUiWU6ZlRquIbaYuuKKyEwayxtqmfANBnvgcmvDKLSxK4lilYGeht0ZSM6TsfyMs8kj
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(39860400002)(396003)(136003)(346002)(451199021)(26005)(33656002)(5660300002)(52536014)(8936002)(66556008)(8676002)(66446008)(4326008)(41300700001)(38070700005)(64756008)(86362001)(66476007)(38100700002)(122000001)(76116006)(55016003)(316002)(66946007)(6506007)(2906002)(4744005)(9686003)(186003)(478600001)(7696005)(71200400001)(83380400001)(54906003)(110136005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9902
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	86a12a24-3793-41a3-5281-08db760fd677
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9nOe7qZy1nu5Ps9W+1O1zL7Aw6x3yQT+q8f6YI25HfaqCfPmIAEuTtaKLzQ1g4RR6BOa8+Lp65RZPLV1lr0uVUqJiK7a6RBP+RdZ/yj6lE2L2T4fn3Sjmh3hcuNg8szbdTpzwPuudiEQehStHb3dN8NOEVHAqm/6bZHqxX+A4FA4aOtCHS5hm4aopsUKum5W3iaYNMvJKMwRlmyoygWo+EnGY3AKZBOhdW8gAVgUOaTKGwdgpSlzu9Wn3S3rIFmPkSKtRqqsGNBcUhONwB8HpBnybllrU6rApzDZLVM8J6CU6scxUdebhAwaO7v4U6+Npbi7SIFY3czcWcI2u10j5rt32GwhdgWnWvGG9DuJEjioZnXbmFU0lnndRKzxRmCETfN+BV23649eTzvFeYpRUk4OO8fE1o/xlFWb611M4KaQBNWtcXJa2LnsOIliekwh23+Wcn/k4V3mDkuGl/tazEQtWVNH1vGz6kPOxgE7F+md+WMvQmXBF33qrJFCxZ0Bo2B09GRvW5fiYbRgG7eZGMSIr1bYtsA2R+PLfoIIF+40qSJNPMIrrvOcr5Ztw61rTfjmU90oQwNWDXcjsWUhwaN9rD5bCTP1t339J9bpTzVn5hTv+pvOCXJOuoHREGBmjdzMZhh3cM3bRBpQF6SYyrTUMf9h3J3Vkd8FxBfg9HkAMf1UuZVYbb/hQddzL/JeR4nJ6gkcXYvUvOPO6WmTVCwv4x9s4W1fO0qR8ApH73JZZSX9VifvylimPqfhWQP6
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199021)(46966006)(36840700001)(40470700004)(5660300002)(52536014)(33656002)(70206006)(316002)(70586007)(4326008)(478600001)(8936002)(8676002)(40460700003)(55016003)(36860700001)(40480700001)(86362001)(110136005)(54906003)(41300700001)(7696005)(82310400005)(4744005)(2906002)(9686003)(186003)(336012)(6506007)(26005)(47076005)(82740400003)(356005)(81166007)(83380400001)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 06:37:51.2391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5547a7-787f-449f-2ef2-08db760fdd53
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8115

Hi Julien,

> -----Original Message-----
> Subject: [PATCH 4/9] xen/arm32: head: Remove 'r6' from the clobber list o=
f
> create_page_tables()
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Since commit 62529f16c8a2 ("xen/arm32: head: Use a page mapping for the
> 1:1 mapping in create_page_tables()"), the register 'r6' is not used
> anymore within create_page_tables(). So remove it from the documentation.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

