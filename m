Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EE66E40BB
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 09:23:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521772.810628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poJBp-0001Ov-GB; Mon, 17 Apr 2023 07:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521772.810628; Mon, 17 Apr 2023 07:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poJBp-0001N5-CZ; Mon, 17 Apr 2023 07:22:17 +0000
Received: by outflank-mailman (input) for mailman id 521772;
 Mon, 17 Apr 2023 07:22:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8RDw=AI=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1poJBn-0001Mj-AD
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 07:22:15 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2075.outbound.protection.outlook.com [40.107.6.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92c4ff40-dcf0-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 09:22:13 +0200 (CEST)
Received: from DB6PR0601CA0047.eurprd06.prod.outlook.com (2603:10a6:4:17::33)
 by VI1PR08MB5328.eurprd08.prod.outlook.com (2603:10a6:803:13a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 07:21:43 +0000
Received: from DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::b8) by DB6PR0601CA0047.outlook.office365.com
 (2603:10a6:4:17::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.44 via Frontend
 Transport; Mon, 17 Apr 2023 07:21:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT007.mail.protection.outlook.com (100.127.142.161) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.12 via Frontend Transport; Mon, 17 Apr 2023 07:21:42 +0000
Received: ("Tessian outbound e13c2446394c:v136");
 Mon, 17 Apr 2023 07:21:42 +0000
Received: from 0646f5cb71cd.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3FB95646-3472-4297-BD4E-C6AB4EBE175F.1; 
 Mon, 17 Apr 2023 07:21:31 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0646f5cb71cd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 17 Apr 2023 07:21:31 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB5894.eurprd08.prod.outlook.com (2603:10a6:20b:23d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 07:21:28 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91%5]) with mapi id 15.20.6298.030; Mon, 17 Apr 2023
 07:21:28 +0000
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
X-Inumbo-ID: 92c4ff40-dcf0-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cavBQbLHMJ0mRw8PT5sgIG/4b6X42jfw8a0tN06yiXA=;
 b=j3Es5bQlHZaim3r5oqNiafcjFcytZ/uyJb2pRfITPfzbxpiSMajxYoY0uQ2S/KzgS2oGHfM1sykE+hR6gC6lGmYCiMyQpKL2oUBGcqekvS3jAFbEpxjIqkSEE2vZHK5wnINvXDUHO1xAAxvapr0LiodSRqXOXorMFfhodEPowBw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f230175f34a0fe6f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=InrLjsVg9nZWtrygfBYthw88FAAWAeq23K4DjieBdo8N62NElMCoC5/Nv1R1eq4UX4INwz77BX2yYrWmiydvFFwNzIeXjb369Q+raq0cAzuP+vM1GrGBHB4zut9gdRM6NqTDg0mia6G4aNmqJ1YRgi1v62n5Yx369qIt1z/fDM/oQGEzSSAbz6lrXG41UeS0k4dXdIe2j53TZZC9RTqhuVFEDjogl+TfGgTKgqCyYkMyAw2wBbqy9zVNjPz9/Qnyxu2Ze75TSB0rpHTIJr9UU+d75C9pNJWRLGG3aapex+GtPt05oLdeipAFIKN/bQfYWyR4q61H99Dmzp7R8LVpag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cavBQbLHMJ0mRw8PT5sgIG/4b6X42jfw8a0tN06yiXA=;
 b=JRSbcjxiw9ZXJE94U1s9fa2CohyCpX6Fh6AyNUh6xJmOyxnhOI/DVeVzDoJzwqGIu6a9ODVtxe2NKBKueYjm9uuvbBccU+VLT0fH39jE4jCdD867H8fHbHPlOaDqGzQl75wXP343lvQJdJXgE8TJfRCSXmposBhncHWcmOEiJ9jnBAtcnlOC/B7s39yf8IlHg4DxEDf1wiUMRrsCSfH3BzSILJMG/0pZTbd1lGeqb4iC65kYBAzmbLxYgxr3i1tIDDOGCwKvTwN/j1Pwigl3j2GaSFEUlkBo7EiZPcMmBPXUmSwiCzCqI4tUz4x2jjAt0kIjfH3487b368iX7XVsRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cavBQbLHMJ0mRw8PT5sgIG/4b6X42jfw8a0tN06yiXA=;
 b=j3Es5bQlHZaim3r5oqNiafcjFcytZ/uyJb2pRfITPfzbxpiSMajxYoY0uQ2S/KzgS2oGHfM1sykE+hR6gC6lGmYCiMyQpKL2oUBGcqekvS3jAFbEpxjIqkSEE2vZHK5wnINvXDUHO1xAAxvapr0LiodSRqXOXorMFfhodEPowBw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v7 2/5] xen/arm64: Rework the memory layout
Thread-Topic: [PATCH v7 2/5] xen/arm64: Rework the memory layout
Thread-Index: AQHZcHBTTmBJ360YB0mwtleUAbK62a8vGYQA
Date: Mon, 17 Apr 2023 07:21:27 +0000
Message-ID: <3D6BC31F-05F0-4627-9311-E77867AD32C0@arm.com>
References: <20230416143211.72227-1-julien@xen.org>
 <20230416143211.72227-3-julien@xen.org>
In-Reply-To: <20230416143211.72227-3-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB5894:EE_|DBAEUR03FT007:EE_|VI1PR08MB5328:EE_
X-MS-Office365-Filtering-Correlation-Id: 35a1f825-7cb3-4fb7-0d0c-08db3f1464c9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +2Xf7c4jXVBcYnoglI4FdduRWhMSxrd+U6tGGFWK0g4b0LIbfFsIW7usr8UOQ/4IlVTt32DXvaXtGx2CgsupK+YMXIjaHM25HL20b5ja4d/psqk/Mb28tweCOLeRKS7TCpV6FqIAuKbiKMnZDiJDBA3LSZsRd5NzDNweMlijNarr1LUsqzNpL6tYS84le5P2BAQsc+SgzJwoaAl0G9uBYMEbKPDXIR6tPqFdvi2yfLDedVnc8B5AHE5EJk7kyl0iEB0vdz4n1SzuTZI5n0xs1pSUWg1PMhyUFiuZeIpIwQtNnpAUcVOjZTyw2hMs6gD/IsVdPu/3+yZgwfb8fVJdmZGQQVDgJmlm3VcK98JOzhVmU9jzKetuM22TYAIj1kTaoWefMIUOdM0gxlf1jPmhjPqUVFgYRlUWnUMRO4457QaCjkxjCljHSB/o4kHHBVI4BvV6zJOqV5IWHK3Dz9CzBDlZpRUn1RhfbGudZQRKyF6m7Ufb+G+Fr/GH++ugQ+jtNyJ3K5zc78EOOZOxViDAvn+AOWdpjh7TtH1VXcIePgVJO7uqoMfAikCPMOYC0nh0U+AFxs7hQOu3dZHhwxZXGSOb1lAIHwtsWy0Em3CZ1k9NqTZZyRxQZhgFwESXt6aN509TfhBEz+9C7gmrYguwFA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199021)(5660300002)(2616005)(86362001)(83380400001)(53546011)(186003)(26005)(6506007)(6512007)(122000001)(38100700002)(38070700005)(8676002)(8936002)(33656002)(54906003)(478600001)(71200400001)(6486002)(316002)(41300700001)(91956017)(76116006)(36756003)(64756008)(66446008)(66476007)(66556008)(4326008)(6916009)(66946007)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <79984573A1AEBB4EBF2F93FC9677BA49@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5894
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6e1625eb-0185-4185-2e8b-08db3f145be9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pKIQGbnhSZoxUKzKEjv8ius0KBSsWWC0Rndb4vSH0hbXgEABpmEvZdgyiqS0bGzqo0PIR7b54OGOCkPLgXkV1eNf3tPN4byR+hvIfZmpwic0QYkFzKwBSCWo0QDIdwBNw0viVB2Lg34LXTjy3REzTmaAr2OhB0KgRufsI4Dqw+928oVFqbX3tcZI3JibQ/Djs07LHb7XBzT8axofMP1BTpWH1W8b7is6KzF3kxEuvCdg57/oA8bvJYS6zBQdDDfe4/MOLsiY2dc8PxolYFF1LPPRl7BvMPSrm4ll5S9hts9JGihFQsoq1WC/m4LDOz481WoMldMEbeZLtWrRkot0ZK4uiXGRM0iNam47OqccZEeQM/qRErAklXFfCsJG+VH8awnZkDZpK0tBggnGRPG9YqPoNX1YkjU9PBq1XNps5Z9y007XKFzeV+SfD75qClY8GRS+/Fso/SOyqqljECs/JpZyDV2LGMTDzEyizoSNaCwDGH9jQnrCmLcXM/d0Rq7nkrnJOqWkwmC2zxuyNUv/+q6w4qdX0kecxlpU9//bDlGWBiDqh4jeOySANfBm1xKHg6TX4dNXKiTI5oQlKUqtVvdjLrMKhi4Zw8LMUAn9DYreLxPtF8ZzlQ50g9pV/ODE5HwkgT8RveyBYXSFG6OvUJ/FpT5soDkqhOlbN3+44ts=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(39850400004)(346002)(451199021)(36840700001)(46966006)(336012)(6486002)(86362001)(478600001)(36860700001)(2616005)(47076005)(36756003)(83380400001)(26005)(33656002)(40480700001)(107886003)(6506007)(186003)(53546011)(6512007)(82740400003)(82310400005)(356005)(70206006)(70586007)(81166007)(316002)(2906002)(4326008)(8936002)(8676002)(5660300002)(6862004)(41300700001)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 07:21:42.5381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a1f825-7cb3-4fb7-0d0c-08db3f1464c9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5328



> On 16 Apr 2023, at 15:32, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Xen is currently not fully compliant with the Arm Arm because it will
> switch the TTBR with the MMU on.
>=20
> In order to be compliant, we need to disable the MMU before
> switching the TTBR. The implication is the page-tables should
> contain an identity mapping of the code switching the TTBR.
>=20
> In most of the case we expect Xen to be loaded in low memory. I am aware
> of one platform (i.e AMD Seattle) where the memory start above 512GB.
> To give us some slack, consider that Xen may be loaded in the first 2TB
> of the physical address space.
>=20
> The memory layout is reshuffled to keep the first four slots of the zeroe=
th
> level free. All the regions currently in L0 slot 0 will not be part of
> slot 4 (2TB). This requires a slight tweak of the boot code because
> XEN_VIRT_START (2TB + 2MB) cannot be used as an immediate.
>=20
> This reshuffle will make trivial to create a 1:1 mapping when Xen is
> loaded below 2TB.
>=20
> Lastly, take the opportunity to check a compile time if any of the
> regions may overlap with the reserved area for identity mapping.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>=20

Hi Julien,

It looks fine to me.

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>



