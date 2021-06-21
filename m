Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A62B3AE605
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jun 2021 11:28:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145419.267562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvGDN-0004TF-Tf; Mon, 21 Jun 2021 09:27:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145419.267562; Mon, 21 Jun 2021 09:27:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvGDN-0004RD-PY; Mon, 21 Jun 2021 09:27:33 +0000
Received: by outflank-mailman (input) for mailman id 145419;
 Mon, 21 Jun 2021 09:27:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YNPZ=LP=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lvGDL-0004R5-KF
 for xen-devel@lists.xenproject.org; Mon, 21 Jun 2021 09:27:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::62a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ba56565-6bf4-441b-811e-9530991ece27;
 Mon, 21 Jun 2021 09:27:29 +0000 (UTC)
Received: from AS8PR04CA0156.eurprd04.prod.outlook.com (2603:10a6:20b:331::11)
 by VI1PR08MB4383.eurprd08.prod.outlook.com (2603:10a6:803:fc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Mon, 21 Jun
 2021 09:27:27 +0000
Received: from AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:331:cafe::3f) by AS8PR04CA0156.outlook.office365.com
 (2603:10a6:20b:331::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15 via Frontend
 Transport; Mon, 21 Jun 2021 09:27:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT060.mail.protection.outlook.com (10.152.16.160) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Mon, 21 Jun 2021 09:27:26 +0000
Received: ("Tessian outbound d6f95fd272ef:v96");
 Mon, 21 Jun 2021 09:27:26 +0000
Received: from c9b54244e0e1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A66F881C-3085-4C0B-9702-5F9488D1C81B.1; 
 Mon, 21 Jun 2021 09:27:08 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c9b54244e0e1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Jun 2021 09:27:08 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6815.eurprd08.prod.outlook.com (2603:10a6:102:134::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Mon, 21 Jun
 2021 09:27:07 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025%8]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 09:27:07 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO3P123CA0011.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:ba::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Mon, 21 Jun 2021 09:27:06 +0000
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
X-Inumbo-ID: 1ba56565-6bf4-441b-811e-9530991ece27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVXEi4qfK31avwtbIbY3UEhmsYdI5IEqgtLALzzYuvc=;
 b=zcb0erKGsJnCg297vbRxVjsrbanGNajnDbLmkX6bRn4xaAwP9pT+gQqR/D7Ez6k9Eem1MvIPPpp68HlFXjMWJ06TSd5M/Tvac0NGMmYOs9UtNHuikBEmRLJpZRfeCYdBFPQpJw8kjuH7uLEi5A/xkLsRClrxIDkVEoFSojKYYU4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f405bdbc7e8b9b0f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWHM2ByYQ1wgtDt3jCZKLPXxE/G9Lv/sqZys2bdSMDEY1CUx5nNgCUN7ncguU7XAtrvZv8+KkaAlL81HW+WRtNvidEJq6zrVopQxmvXASUediBeO7g4aKFoa6MS7bL2sXJJp3vlGFg9W3vQ41m8FzVpBzxJ1Cwfn+mSrjUxBQL+pZ5zqVnEG5CADRA2B1PCPjtGR7UzX+ZZ4c48na8A3eYtGeX4A7f4lFR0W8fyKMDTlNWeBPG0VDplFnKk2H/6okD/S4o2UEo4lG/sHNbl38S3cVrQ7GZmY9tSdy8SSbQPCk75tkKC4LFQoorge8JYxdUHzJ3O8wBdDfmEqfv/NYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVXEi4qfK31avwtbIbY3UEhmsYdI5IEqgtLALzzYuvc=;
 b=RDg4wHW8ChmoVjZpDm0+mSmQK0bY98vlkjsBw/9xoAHiGXw3X4z5+1+JOsGTbXq0vQROiu9NrLLmHYHUkkgq3uP/wGBkcZ8iBnkEn9PqDtPXFKP9/SdXuWgzHyXQipereuSlhu9D4zCjrDsH1CsDCbjosgEdKV2B+GC9ZG3a1LAEFddikPoQSFve86FPGkDdfoLJVcbSK77ik5ehkhe15A2GXWYDD03P/LasFgyJIBx/d9v4/PxoDutMV1jo6h6ugDm/+CZ+/EHCAi62nmRwx9zkcLEO10gZqhPPZHawQTdaGjLGPbtWA/7Qsn/qS0ASxENcvU1G+FDVGAjGmL7oCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVXEi4qfK31avwtbIbY3UEhmsYdI5IEqgtLALzzYuvc=;
 b=zcb0erKGsJnCg297vbRxVjsrbanGNajnDbLmkX6bRn4xaAwP9pT+gQqR/D7Ez6k9Eem1MvIPPpp68HlFXjMWJ06TSd5M/Tvac0NGMmYOs9UtNHuikBEmRLJpZRfeCYdBFPQpJw8kjuH7uLEi5A/xkLsRClrxIDkVEoFSojKYYU4=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH 09/10] tools/xenstored: Dump delayed requests
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <20210616144324.31652-10-julien@xen.org>
Date: Mon, 21 Jun 2021 10:27:00 +0100
Cc: xen-devel@lists.xenproject.org,
 raphning@amazon.co.uk,
 doebel@amazon.de,
 Julien Grall <jgrall@amazon.com>,
 Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2CBBD1CA-0E66-4FEA-949A-77DE0BDEBF82@arm.com>
References: <20210616144324.31652-1-julien@xen.org>
 <20210616144324.31652-10-julien@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO3P123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::16) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3ca0f12-bf1a-408f-44a4-08d93496c8df
X-MS-TrafficTypeDiagnostic: PAXPR08MB6815:|VI1PR08MB4383:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB438323AD523B7DE45631453EE40A9@VI1PR08MB4383.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 03TO/OH9jjgwMq33Qp7w7ae9tG0F1H4jtTVXeF7Y+r6B7VDH0wQ0g+kcUru+3uwLx0Ai7nvwP2zIV9I3/abetAS0bvPTK3L0DoeYREwgeaYzCyNEKp0IMh2FN0iJXpxvCm2LJ6yhAK+x791GqWd+yEU2oKyLCSOCfyYmqdI86u/ilikrPE6l0VXw/KsSWV7fPq615RYDzS0a0zy8bW96yhJCCfWQqAZ/u/bhEafiCC7n3DOXVITG/Xx4NmLh9yfbpKdqiJmQ02JukqzKIdnqH8Qt9j9PgWUF/5U1wFRwVNcB/k09QLRtEVr+/k/u2HQ/v3SS7OfNgsqosaKqfI191tJgxyAicz6f2bSKAHhfkNLv1bI17asRXkLGRBIfpukqe67CuzWvdD8rpojlbzC1GLQ1/D2j2fSyJj3nakinJMYwIwKhDzwX0fHRZhA8cnNMBUK1yuptI2mERuh2TRkFeKkh8l9z/OTst5TKVx2wZKgAOH5PnOF8pGGw8Qm9LgfeIFC0O5I4aKHtvYiX3WSxUHKzsmXquMQgiy8QGbji399rWmy6xqkKOnoQ3dB7FSJ06cdWCSpJlcso7D3hP3kCx/M3qpULcRug8od10WIQA3dhqulaclJqs+MNWasawOBdGfdE57TmsbF766SkCpykmSNQK9voSVa+S/iXLyjBdfyLu0g4Lr+4pqO4IzdKVROj
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(83380400001)(6486002)(36756003)(86362001)(478600001)(6666004)(316002)(2906002)(54906003)(16526019)(186003)(8676002)(6916009)(26005)(6512007)(8936002)(66476007)(66556008)(66946007)(52116002)(53546011)(4326008)(6506007)(33656002)(2616005)(5660300002)(956004)(44832011)(38350700002)(38100700002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?M1hRdcUmMgbuRQFyCU63nP8rmRf8rp3NYbEIZwPe3jw2M6PCCpQlyKtkWvk5?=
 =?us-ascii?Q?n5BFKiOEYamoYrH/WGpqlvXhuwcK7YypHFd0tkXFbpV0AWJ4F6wwsSd6jwA/?=
 =?us-ascii?Q?ofCSacpdLOe96Nw4zfpZ53825jN6nRfpucwm1jlkT5njQpJqdmy7iOgrOox9?=
 =?us-ascii?Q?F7dWglx3ksWIgme7qwSg7svQRQRBB1k/nl9hukfTDwthCaDNIwqlQswTJUdd?=
 =?us-ascii?Q?czo32vJ5fi8Kf7kldmJLPqEEMi+Dd7oFTSDpzvWzFiCxpV12FzZo1gR6o293?=
 =?us-ascii?Q?SRkyYdDXmM8x/sBxGk1f9Xi5WgiMVNPvSTxW5k2mVNr7gBtx4X8hbgouA+0q?=
 =?us-ascii?Q?cf0yfBKIFYHYZxffa37Ypq8wUSTHoSekAGGVVVsnjxzFQz1UlNYJIxfFK5oi?=
 =?us-ascii?Q?pbXC/fmS2lG0xwOM4CoNRh9Wesfq/KcvyqsgK0HMsh9tFQY8kjVDY317p45L?=
 =?us-ascii?Q?Bq4V4uDwgA0LXuJfz6dosWzJxzNEOpNpgWSLXLjm7zYzTYbQTGYuoobpjaxo?=
 =?us-ascii?Q?zPTUG9rkSc743XjoTzgweaFJx7WwurlkZqJCtjOo3yWqAvcCBAERyzWDUT/s?=
 =?us-ascii?Q?ml5d+8kYBJey/C7bIzI5N4SmDuKySVOwi31bSM3z8uUlkGI6J1Mh30wXzFLc?=
 =?us-ascii?Q?cvMYNpvI/+VQgdJHeNwBLLnA4eSHeMjDREYJFPaHehTAqztRRZAf0ERhuwlT?=
 =?us-ascii?Q?IW3BklopbMzGWHHUYHvC6Cp7bVCTCsILNf5hOe0kCkpvMcbfmqvRyRYzaSlt?=
 =?us-ascii?Q?Yqzj/5R6igRJuExkhUe3hdSMWtpaHqL81r6krhGK88Lp+Vy9v+bCnBvlV/Ze?=
 =?us-ascii?Q?L0RcX6PfsVCndHStrpb1FGL1piT2zrKcvdwWE1rnJjhU5cXMxZ09stAZJJVu?=
 =?us-ascii?Q?G+sUTNOv1GO76B8apO4cJ12rDwo/eIgIWb8GS/IO32vX6rkk607VFYnIvNqX?=
 =?us-ascii?Q?qJVV2JoGaG/GF3TGPg2hX9+Durdk8seS7/Kkt/qEN84+lV/nYRLkObDURHTc?=
 =?us-ascii?Q?1ibzuK13aM8CXFFPvdnnfwvz/cIBnJPLN7aD9uuSJ6ys7n6iub3nwDy1FSNm?=
 =?us-ascii?Q?xTE+CssvkCJnrEBFaLY6qC1uXFsK4JAUUWpzTfJqpZRJ1zmErl4kmZmiqDcT?=
 =?us-ascii?Q?/7l5fMagwD8ujIKJGcFw5ifFhRbYXHm3qvMO276WjIaNNrgSFvA9sCEpukEa?=
 =?us-ascii?Q?dxdPiw08V92txodCqeciCqRcuZGYOzvbpuu77jDFCEnRWf3x8Bk72t3z5s5/?=
 =?us-ascii?Q?3+wIIJglAkgpxuefqr4spkwNVulYm0g06jMmY5X1plsC4V/jpaQfulTAgJw5?=
 =?us-ascii?Q?lM1syga/dJHU4NpUvUPbm4Sy?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6815
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e8fbae68-823c-4272-98a8-08d93496bcfb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ML36jmNbtmAYVO+cH18tD45mOVYMWk3L1Qq/w2l1VjuPUiqzobJQG3D2rdyl0W+JhTr1v+9Auf84SuFAh/78jpI2sWyqjrddKKBFqIFTDyGyvK18lM65G8rgU/RcdIYQLEdEEzM6sTkGjsju6z32y/dUXI5jr7GE9ZPz0YipIa27VJIAZtDeN9LR5DxJsOBxvqJq78FxrWP+tc4R0FxbqkDCYeCTVSVkJ6tqDdhzvCCK6jOYJslZVHREzDKCfSguhEa0TqEUV+krLnu3V4aVeROKeiJkdNc6lTUYKn06oYdNLayWdEOEKihTbjMUx3VM1uP4uSj9PEvIN5i0JhTQrM5HfzDzielQU71QEYDIn6JNIM0L1vAWRMugnYHNCzXdaIrQaZrwPXWT7WQ1qPu0ppJxC4NkxKnWHzUhZlH2/L5DJAUlNHeQa4WKzuCNvZrFL2oGNVzHqjt/Q+7c0j7UCpqzVIVydzT0R+wUCIc0Y5z0ucBngNPCn9zuQVZKb123yM98xeH0lc5dePPM6q5l6pdyQ3ox3fwxFJ8kvAZOGJuBsY8SiILTxsLrs4u+RBFR2ePDpNMns4Zubbf1bSz8CbWu/kYjROWOTrBPO/w8hiOQCQgVPxXMsn8hYP0TTquZJxpTJCYvShmQ22zeYWwiI+qUvkK4Xsgmxumbgj7myg8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(46966006)(36840700001)(6486002)(6506007)(53546011)(478600001)(6666004)(81166007)(70586007)(8676002)(956004)(26005)(4326008)(44832011)(107886003)(316002)(2616005)(36756003)(6512007)(5660300002)(8936002)(54906003)(47076005)(16526019)(186003)(6862004)(82310400003)(356005)(82740400003)(70206006)(86362001)(336012)(2906002)(36860700001)(83380400001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 09:27:26.8920
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ca0f12-bf1a-408f-44a4-08d93496c8df
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4383



> On 16 Jun 2021, at 15:43, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Currently, only Live-Update request can be delayed. In a follow-up,
> we will want to delay more requests (e.g. transaction start).
> Therefore we want to preserve delayed requests across Live-Update.
>=20
> Delayed requests are just complete "in" buffer. So the code is
> refactored to allow sharing the code to dump "in" buffer.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

> ---
> tools/xenstore/xenstored_core.c | 42 +++++++++++++++++++++++++--------
> 1 file changed, 32 insertions(+), 10 deletions(-)
>=20
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_c=
ore.c
> index 5b7ab7f74013..9eca58682b51 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -2403,25 +2403,47 @@ const char *dump_state_global(FILE *fp)
> 	return NULL;
> }
>=20
> +static const char *dump_input_buffered_data(FILE *fp,
> +					    const struct buffered_data *in,
> +					    unsigned int *total_len)
> +{
> +	unsigned int hlen =3D in->inhdr ? in->used : sizeof(in->hdr);
> +
> +	*total_len +=3D hlen;
> +	if (fp && fwrite(&in->hdr, hlen, 1, fp) !=3D 1)
> +		return "Dump read data error";
> +	if (!in->inhdr && in->used) {
> +		*total_len +=3D in->used;
> +		if (fp && fwrite(in->buffer, in->used, 1, fp) !=3D 1)
> +			return "Dump read data error";
> +	}
> +
> +	return NULL;
> +}
> +
> /* Called twice: first with fp =3D=3D NULL to get length, then for writin=
g data. */
> const char *dump_state_buffered_data(FILE *fp, const struct connection *c=
,
> 				     struct xs_state_connection *sc)
> {
> 	unsigned int len =3D 0, used;
> -	struct buffered_data *out, *in =3D c->in;
> +	struct buffered_data *out;
> 	bool partial =3D true;
> +	struct delayed_request *req;
> +	const char *ret;
>=20
> -	if (in) {
> -		len =3D in->inhdr ? in->used : sizeof(in->hdr);
> -		if (fp && fwrite(&in->hdr, len, 1, fp) !=3D 1)
> -			return "Dump read data error";
> -		if (!in->inhdr && in->used) {
> -			len +=3D in->used;
> -			if (fp && fwrite(in->buffer, in->used, 1, fp) !=3D 1)
> -				return "Dump read data error";
> -		}
> +	/* Dump any command that was delayed */
> +	list_for_each_entry(req, &c->delayed, list) {
> +		if (req->func !=3D process_delayed_message)
> +			continue;
> +
> +		assert(!req->in->inhdr);
> +		if ((ret =3D dump_input_buffered_data(fp, req->in, &len)))
> +			return ret;
> 	}
>=20
> +	if (c->in && (ret =3D dump_input_buffered_data(fp, c->in, &len)))
> +		return ret;
> +
> 	if (sc) {
> 		sc->data_in_len =3D len;
> 		sc->data_resp_len =3D 0;
> --=20
> 2.17.1
>=20
>=20


