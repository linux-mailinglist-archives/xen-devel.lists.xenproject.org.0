Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 243A430C4F8
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 17:10:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80627.147581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6yFP-00070h-VY; Tue, 02 Feb 2021 16:09:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80627.147581; Tue, 02 Feb 2021 16:09:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6yFP-00070I-Rr; Tue, 02 Feb 2021 16:09:47 +0000
Received: by outflank-mailman (input) for mailman id 80627;
 Tue, 02 Feb 2021 16:09:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g09W=HE=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1l6yFO-00070B-7B
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 16:09:46 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.85]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59e05910-d07e-4744-a3b1-f3bf4b37e379;
 Tue, 02 Feb 2021 16:09:43 +0000 (UTC)
Received: from DU2PR04CA0126.eurprd04.prod.outlook.com (2603:10a6:10:231::11)
 by VI1PR08MB5389.eurprd08.prod.outlook.com (2603:10a6:803:137::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Tue, 2 Feb
 2021 16:09:42 +0000
Received: from DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::fd) by DU2PR04CA0126.outlook.office365.com
 (2603:10a6:10:231::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend
 Transport; Tue, 2 Feb 2021 16:09:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT017.mail.protection.outlook.com (10.152.20.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 2 Feb 2021 16:09:42 +0000
Received: ("Tessian outbound e989e14f9207:v71");
 Tue, 02 Feb 2021 16:09:42 +0000
Received: from 3cee38c37ebb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 54133D43-9D15-4A0B-A0C5-0CBF2F60438D.1; 
 Tue, 02 Feb 2021 16:09:36 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3cee38c37ebb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 02 Feb 2021 16:09:36 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB7PR08MB3881.eurprd08.prod.outlook.com (2603:10a6:10:77::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Tue, 2 Feb
 2021 16:09:31 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d%2]) with mapi id 15.20.3805.027; Tue, 2 Feb 2021
 16:09:31 +0000
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
X-Inumbo-ID: 59e05910-d07e-4744-a3b1-f3bf4b37e379
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlbsKsoq5v7rwOLmf68xBCBs+buI++72lSKrZwzCYWE=;
 b=rKj+Krr/o/wUC6tPZk8RBfjYUAxRpW8lDEGgXGLQNXXWHdM6b8Q+CXZNmAuF2y6FqC6MHBtKdZvj1gGKgbGFxceSp6v/l4hThy5CdiJNUshIsdNRHUrjtIIewsVH1KuXvPQ4E9nFrd5oQg5lIPx8xEtcNeRylRgCHCmm+Mu6dIg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8fbbbe638963fdac
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTz/Ff+w+rnsyEFUfpU6Zk55tC/ma718YTlrm5aRNxVVVju23DBxhHdIdP7X5vU/z61kWXNPY4rXgUuCY8njQkSECIBRhbXYikv95fh0xkrEa8QiqXazH5VvvXVs822fNPgJ84sq1gm83bbWoI2A8Fh95i0ESEdXL8QfrEUPjDsJ9M5Z95sTf9CnbiZNrtrxGa2V5dVuXkA7OEXd0E/RIGL0aQZiP0O++qL+0D+x6wqsKW8lFdq3C/GEeTkf41H2MAPdc4+dwzPZwSdydKCgo4Mh38v/OVsZSZvWnvyUd5vHIrp4McQz5OkwjE+8PHP3DK+d+BKEc/117PFD2B+A6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlbsKsoq5v7rwOLmf68xBCBs+buI++72lSKrZwzCYWE=;
 b=LFNZSXfNrOGjC+oq50n689/93QEPZlCyP359UIvrHXm8DrWqMn4A/GDZKi6KGuX9e5rEOISeLxs+m5/a9WXCSqLy4wPanf2XKqQAz835eEtBVJokjUbONaxuHwcMPJAigNgi28Rc3tQ7WVTDz/MmBlq5HsorFKJWgPbciRMWYzC6rCqC4yjRih2SmGvItoxCmrbDo0Ws5wNAC+SHGhlldjj2jlr1JtdKtvQu0NhZSpyENgqwWxQAOvpLpbR7hvcikuQyVCvIMiPHDBHejOXg/HqVK6/mWK56kuftetmHokGniu9v5tL24qZt0OQX5PySC9RAm4p97ntVoWAiDh/Esg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlbsKsoq5v7rwOLmf68xBCBs+buI++72lSKrZwzCYWE=;
 b=rKj+Krr/o/wUC6tPZk8RBfjYUAxRpW8lDEGgXGLQNXXWHdM6b8Q+CXZNmAuF2y6FqC6MHBtKdZvj1gGKgbGFxceSp6v/l4hThy5CdiJNUshIsdNRHUrjtIIewsVH1KuXvPQ4E9nFrd5oQg5lIPx8xEtcNeRylRgCHCmm+Mu6dIg=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "brian.woods@xilinx.com"
	<brian.woods@xilinx.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v3 3/3] arm,smmu: add support for generic DT bindings.
 Implement add_device and dt_xlate.
Thread-Topic: [PATCH v3 3/3] arm,smmu: add support for generic DT bindings.
 Implement add_device and dt_xlate.
Thread-Index: AQHW9DbZcc+nHEHmhUCG1Y8eIX96RapFEyUA
Date: Tue, 2 Feb 2021 16:09:31 +0000
Message-ID: <446A1B3B-4465-4AB1-91BC-17DFB32B3A42@arm.com>
References: <alpine.DEB.2.21.2101261435550.2568@sstabellini-ThinkPad-T480s>
 <20210126225836.6017-3-sstabellini@kernel.org>
In-Reply-To: <20210126225836.6017-3-sstabellini@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 342af303-b8ea-4f19-2cc0-08d8c794f344
x-ms-traffictypediagnostic: DB7PR08MB3881:|VI1PR08MB5389:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB5389A8DFDDBB703EFDF30240FCB59@VI1PR08MB5389.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2449;OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tdKj1qYVJCS5oPdzKnSQE/YpHNwXqC8fg1AqoxE+auzhOVkmdjX9hOYEKbzT+WifGO4hssTkjmulUWTi0HdFCTL7ZXAd8QYdJL6lrJTSx8mass5RiRzQlp9HL1T1sRUexs8bK0nsin9rKxaBlG9n794pv5he3Q1sBlNslM32pGJT8TzbliyFCwR09ByLaENaifEEne5Fxc6qTZ9ok2uMdd35x3PFbjl/1VdjEfT7gN//6YEBrv0z2fPVidrsg6kT902P3/T5ITPRRqvF71xnmAKEmAJl6WJVyooPWb6RMzn6MvvARkOwQ//NKzfKwQIUebjEkQh/O3hMvSySS8fC/GUVbOlGO+StT85UqJq6+u1rcbVShV6PaZaTyq1tv3/p4luytAYwLrz15KEQHIvfDNWCJUEhl3D4QG2GMnI26/tZpetEbxGSXG1XqN9BzVCO8xs8tFCpkKfuGO5pIi84I1r774Yq8xHXlsfP0BXDxC2IexU6lLBzqb7VUB4FLxTfKl6B8Pr6YNZKs3Siyiu5UbpB2g6wydE4nt2ksfatuvU9uHOUQpUX53E2D9TXFnZPIIKgUQbITKmpcIphUJ1yv2y50r09ARV9i8BGmKmxUSPMIqmnRiPvdwPbQ21NlZu9
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(136003)(39860400002)(346002)(6486002)(54906003)(6512007)(86362001)(316002)(83380400001)(8936002)(2616005)(4326008)(66446008)(8676002)(36756003)(478600001)(64756008)(76116006)(66556008)(66476007)(66946007)(33656002)(91956017)(186003)(53546011)(5660300002)(6506007)(71200400001)(26005)(2906002)(6916009)(41533002)(21314003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?Fa8w1JZo0MsSY5VCKf3/PhuA7vH4KVcr9lyhmy7EWt7QiB9GwkKcRuEOLxP+?=
 =?us-ascii?Q?MwKsqC0gU3lkK0VaxtkFHfV1aypCu/3PusAMsbzNMbmKd7H3yvRFXoKKFBlm?=
 =?us-ascii?Q?boZui0xi4BVzxQVpa/VuEGCFtuFXUKtAXWB4jfn02xAg5tL6cX0/PL3N4nUo?=
 =?us-ascii?Q?ZJr4yQ3IP1ZFZRBQmHFv7XK4hb9W6Khw+BcIuHMTODwup/ASY8VuMf69MTcY?=
 =?us-ascii?Q?QPxYKW7FP8/YIAna8xozyd76zN6s6ROa+r4C2spJ1lfu/SPF4GTW2mtg87GJ?=
 =?us-ascii?Q?NFRalQeHbYSh079pwyN6ybdcglWgT99n8HDaeX91QMTD39dz7iLqG2vS4SCV?=
 =?us-ascii?Q?InvLe5EineQ1uBkW63EdGXfpx1OUa4ljmcplfGE4U+jcdHxyWG8NsFeInp9e?=
 =?us-ascii?Q?Cn5NJfkH/dp1U8CaypEwBu0kib0788//nyBko0R0iCr5BkqTfo503RRXY8wS?=
 =?us-ascii?Q?9dFtnsAAjLfUOx4MZugxzIupg4++PF3xnCIlA8yo3h9BT+WHRjwZMezRX0kv?=
 =?us-ascii?Q?luxfQZVMdd9EK2g6XTtQkVOlq+kYNnjvJvyouMrm2FIge4DehIIkOBhGII6R?=
 =?us-ascii?Q?uNzCA4uNGpj50Q4u7Rr132vXFvmNVvUN5ZicxErh0Kq6bJCvKbHRtT43UHud?=
 =?us-ascii?Q?nsUouc9uV0EmXjTf3jCPLa48wfoNEvzQgYYUvLfPYCQsSclELz+Pl9tYMUB2?=
 =?us-ascii?Q?xl8bKX8KAm0dy6Y1jKMk2CUvy4PaMVf2T6MaU3mSmnclC3FJU3vMVa8uI620?=
 =?us-ascii?Q?EmMQ74+Fgg0C2Ba5XqpQlrVjVitIc2Wbw5CRhrTDrUioF7geL15JeRFBhV+z?=
 =?us-ascii?Q?TF083Gwt2OR4iZ5xdFhwVEPnpC33aroGCubQ+pDPLy1k2jwVR0DLcKbt5BX+?=
 =?us-ascii?Q?pVZ5rDjyk5+OfsdY+zG5TYSgMV+Gnm7/hbPKeSq5VHVtYY9dXVP1wXao4VrJ?=
 =?us-ascii?Q?JWBKMKlJ3doFHlbCUeVg/aU0WWVfPVq4IHOFUPwQ2W2l9o7aZXDhrj7zFqI/?=
 =?us-ascii?Q?r2yRAFHMHIweomkn2tijTgVTWNrAI1yvgpD/mrOucewaMSTBL3VYA2a9JIHt?=
 =?us-ascii?Q?LbDOQqbA?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AD65E08474971944822675D966D84841@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3881
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a453dcc7-d444-48cf-9038-08d8c794ecb7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BlMoXFhdLYhayBSbti55912m9QLe08352pWTKqaIYef2o2N66mK6NM5EqqyOLtE1x4dBzvIjB8LodihyPQphoCPBFpcQNw01bgbQpTR+idn51yEgVOlxwLP7K2atiGYGNbL1ULUDbm8Jp30oi2ANtzrtX4W38rtTaqoTWOXPmRyRIWm/liPQF4ndswtzpu5tAJx43BP7bxQliZvulI/NjGU5W0a91Cv7t1+5Ln8tL9dJXSLyx/fikjKEnP2a6J4LRanGOvt6yNx7pjnTuMgLzfP4GPpGIPq6dBFHGKbpmwF+xx5l9JS6lZ2+Hp7PwK9jT4m017E6FoH+xtG5gPxG2cgazLZMqs024t5kAkoi1hi8IWgzEBwY+Pr+PYPW27bEUaoVtbIe0wAVbVGmOazx2tXW3UU46oVrWyg+KDd2Y0ywvQu5MJYS5L7TR6RuYIn6o9vAqwKH9/B3CMScAhDOVL4SO1hP9jCx7nCMgQHiLmim2Ss2qREolcsaiKqvmUvl5pSxDawXD01BMI04H5g01Gceefm5/AJ3hseZBgY7N5hFF04/E/jgCgTl25rDwP1apIS2WclaBC/Xn//dZdgup64HSpznZilsRQ7+lKKRmytxRlsqYjU9Ja1RcN80bqZ7lIaaNm6BzALNk16tVEDsvEfo0wo+LXQg5yGGWRnc660ecT57z/uQDtNb5n8vo3G1cUJJWo5B2gSFFdeTeK1RnQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(36840700001)(46966006)(53546011)(4326008)(6486002)(47076005)(6862004)(86362001)(356005)(81166007)(82740400003)(36756003)(70586007)(2906002)(70206006)(5660300002)(54906003)(316002)(2616005)(82310400003)(8676002)(186003)(33656002)(336012)(6512007)(107886003)(478600001)(83380400001)(26005)(8936002)(6506007)(36860700001)(41533002)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 16:09:42.3263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 342af303-b8ea-4f19-2cc0-08d8c794f344
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5389

Hello Stefano,

> On 26 Jan 2021, at 10:58 pm, Stefano Stabellini <sstabellini@kernel.org> =
wrote:
>=20
> From: Brian Woods <brian.woods@xilinx.com>
>=20
> Now that all arm iommu drivers support generic bindings we can remove
> the workaround from iommu_add_dt_device().
>=20
> Note that if both legacy bindings and generic bindings are present in
> device tree, the legacy bindings are the ones that are used.
>=20
> Signed-off-by: Brian Woods <brian.woods@xilinx.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
> ---
> Changes in v3:
> - split patch
> - make find_smmu return non-const so that we can use it in arm_smmu_dt_ad=
d_device_generic
> - use dt_phandle_args
> - update commit message
> ---
> xen/drivers/passthrough/arm/smmu.c    | 40 ++++++++++++++++++++++++++-
> xen/drivers/passthrough/device_tree.c | 17 +-----------
> 2 files changed, 40 insertions(+), 17 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough=
/arm/smmu.c
> index 9687762283..620ba5a4b5 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -254,6 +254,8 @@ struct iommu_group
> 	atomic_t ref;
> };
>=20
> +static struct arm_smmu_device *find_smmu(const struct device *dev);
> +
> static struct iommu_group *iommu_group_alloc(void)
> {
> 	struct iommu_group *group =3D xzalloc(struct iommu_group);
> @@ -843,6 +845,40 @@ static int register_smmu_master(struct arm_smmu_devi=
ce *smmu,
> 					     fwspec);
> }
>=20
> +static int arm_smmu_dt_add_device_generic(u8 devfn, struct device *dev)
> +{
> +	struct arm_smmu_device *smmu;
> +	struct iommu_fwspec *fwspec;
> +
> +	fwspec =3D dev_iommu_fwspec_get(dev);
> +	if (fwspec =3D=3D NULL)
> +		return -ENXIO;
> +
> +	smmu =3D find_smmu(fwspec->iommu_dev);
> +	if (smmu =3D=3D NULL)
> +		return -ENXIO;
> +
> +	return arm_smmu_dt_add_device_legacy(smmu, dev, fwspec);
> +}
> +
> +static int arm_smmu_dt_xlate_generic(struct device *dev,
> +				    const struct dt_phandle_args *spec)
> +{
> +	uint32_t mask, fwid =3D 0;
> +
> +	if (spec->args_count > 0)
> +		fwid |=3D (SMR_ID_MASK & spec->args[0]) << SMR_ID_SHIFT;
> +
> +	if (spec->args_count > 1)
> +		fwid |=3D (SMR_MASK_MASK & spec->args[1]) << SMR_MASK_SHIFT;
> +	else if (!of_property_read_u32(spec->np, "stream-match-mask", &mask))
> +		fwid |=3D (SMR_MASK_MASK & mask) << SMR_MASK_SHIFT;
> +
> +	return iommu_fwspec_add_ids(dev,
> +				    &fwid,
> +				    1);
> +}
> +
> static struct arm_smmu_device *find_smmu_for_device(struct device *dev)
> {
> 	struct arm_smmu_device *smmu;
> @@ -2766,6 +2802,7 @@ static void arm_smmu_iommu_domain_teardown(struct d=
omain *d)
> static const struct iommu_ops arm_smmu_iommu_ops =3D {
>     .init =3D arm_smmu_iommu_domain_init,
>     .hwdom_init =3D arm_smmu_iommu_hwdom_init,
> +    .add_device =3D arm_smmu_dt_add_device_generic,
>     .teardown =3D arm_smmu_iommu_domain_teardown,
>     .iotlb_flush =3D arm_smmu_iotlb_flush,
>     .iotlb_flush_all =3D arm_smmu_iotlb_flush_all,
> @@ -2773,9 +2810,10 @@ static const struct iommu_ops arm_smmu_iommu_ops =
=3D {
>     .reassign_device =3D arm_smmu_reassign_dev,
>     .map_page =3D arm_iommu_map_page,
>     .unmap_page =3D arm_iommu_unmap_page,
> +    .dt_xlate =3D arm_smmu_dt_xlate_generic,
> };
>=20
> -static __init const struct arm_smmu_device *find_smmu(const struct devic=
e *dev)
> +static struct arm_smmu_device *find_smmu(const struct device *dev)
> {
> 	struct arm_smmu_device *smmu;
> 	bool found =3D false;
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthro=
ugh/device_tree.c
> index a51ae3c9c3..ae07f272e1 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -162,22 +162,7 @@ int iommu_add_dt_device(struct dt_device_node *np)
>          * these callback implemented.
>          */
>         if ( !ops->add_device || !ops->dt_xlate )
> -        {
> -            /*
> -             * Some Device Trees may expose both legacy SMMU and generic
> -             * IOMMU bindings together. However, the SMMU driver is only
> -             * supporting the former and will protect them during the
> -             * initialization. So we need to skip them and not return
> -             * error here.
> -             *
> -             * XXX: This can be dropped when the SMMU is able to deal
> -             * with generic bindings.
> -             */
> -            if ( dt_device_is_protected(np) )
> -                return 0;
> -            else
> -                return -EINVAL;
> -        }
> +            return -EINVAL;
>=20
>         if ( !dt_device_is_available(iommu_spec.np) )
>             break;
> --=20
> 2.17.1
>=20


