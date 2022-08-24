Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AB959F93C
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 14:16:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392510.630904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQpIi-0000VU-Sg; Wed, 24 Aug 2022 12:16:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392510.630904; Wed, 24 Aug 2022 12:16:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQpIi-0000Sp-Ns; Wed, 24 Aug 2022 12:16:04 +0000
Received: by outflank-mailman (input) for mailman id 392510;
 Wed, 24 Aug 2022 12:16:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EISj=Y4=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oQpIg-0000Sg-Nm
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 12:16:02 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2054.outbound.protection.outlook.com [40.107.20.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83a411fe-23a6-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 14:16:00 +0200 (CEST)
Received: from DB6PR0801CA0043.eurprd08.prod.outlook.com (2603:10a6:4:2b::11)
 by DB9PR08MB6940.eurprd08.prod.outlook.com (2603:10a6:10:2a6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Wed, 24 Aug
 2022 12:15:56 +0000
Received: from DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::92) by DB6PR0801CA0043.outlook.office365.com
 (2603:10a6:4:2b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14 via Frontend
 Transport; Wed, 24 Aug 2022 12:15:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT031.mail.protection.outlook.com (100.127.142.173) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Wed, 24 Aug 2022 12:15:55 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Wed, 24 Aug 2022 12:15:55 +0000
Received: from 00a2fc007262.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 09EB3F46-BB5A-4E6E-9C7D-38586CA56C0E.1; 
 Wed, 24 Aug 2022 12:15:43 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 00a2fc007262.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 Aug 2022 12:15:43 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DBBPR08MB5224.eurprd08.prod.outlook.com (2603:10a6:10:f1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Wed, 24 Aug
 2022 12:15:41 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5546.022; Wed, 24 Aug 2022
 12:15:41 +0000
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
X-Inumbo-ID: 83a411fe-23a6-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=crTqqbctWnmSPO8eE8HlOliA27Umsm2hnL5kQYfZL5W8FvPeT8kCE5NGxW0hcmZtU2D5llN2n0u23AmEi/g3v57A66zIQ1SkYchVjjk4fx/ZCe8LYaOiaiWKY7EGDYqIM7itjSdHIO61nLffEFeQzflOz0bHAePKGOHS3HDxYScfUWoDdl+KmG/aaqIKeGk8v5Kal3lPR1CHUdGuYW7p/eZNJk0Gcd/YAycWfqI99l/kGRis3V15KxSOSw6ONb8pv72JntiQB5qIwWFIuWHynCC2XTA5TmngvanR5gtuv3D5F/ZaIGUziDnjVGHeq3oZx2wQavsyMYbxsB0dL5KGWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHVb2HoZR+iufNqRpb5CiYE87ICXq8OgVwbteZuDL3g=;
 b=hr38Ydum+ixhiVCYfRzeYEvXZz/MblSHZDGZ0H9XC6GTsHHnRcyzQIiN0xRzyAM97zrmB8IQt+gaKiI7dL/SceSLzhqf1aFDzWYoCEpf6VAyxmDbU7zikUd8o1n04K/4sdk9cMqEiEwyu7b1R7NlGa6a2SQ1NYAQ8wxi0NqD7lPoq16IHim4uAndGyZRkOD8+o99ggiwB+i9pAcH10gUG05Z+d+dFYaRVMq5ndaXbwLu+bYbAdHYBIDfkgy7j0OC352i3p7mGsc7Vo744O5lgH3I/uc2b6BMxw2xfX/UV5Shh4NDsK4E0BI+aSyg8zTHInoz2PQQTkrqsUCQ7uaYJA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHVb2HoZR+iufNqRpb5CiYE87ICXq8OgVwbteZuDL3g=;
 b=fh+rE19vnIhAKhU5P1FRn89rTUoRpkRgipnOdYbES+R5s58WDCJj/cBiHXWRMadvOtJRcF5HyiZuaNlTp9g0GkapR9OfIVGOF3iSrek6cH57+nCT4ctyV1NiphVQDx0LbXkWmP1wcPHcTjenAsUF8FPin/BgpBkSXWlW8URdZ5Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2ad0b40c3ce7735c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKEjk0/8im6sA/bPuJXGyEJoixe4TvpMjqPJU5ffrAn0LMF3PFw0ymnWB2tGKXZZ43cLjvoADFmsIrDlJIBa+FOZtbhM1wM8RKIfQFqooYa3ZaNa2SfCqC0sGJvrQ+u5Tvd8diLrkUJPAnxa/O62WF1Q82WhZ5fwMtXHHWAcO9XucOVZgLOHSoBTjAJjqZIDUBnGlPlaYxdM0Ah6VyRs58xoBF5uCbxJpX6SQSo7aCMKpzZJwShwyRnvZztz2oORGsQiDhrBMdqJFzE6hvyRM8e8JiGnw4m9zhxWvjYxnX5AA5fw6xKTboxB3L56f1OFs00yOFIwKNFCO3vtvWFBhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHVb2HoZR+iufNqRpb5CiYE87ICXq8OgVwbteZuDL3g=;
 b=LgHrsajQvdRlPUK44BtXV2FDih+DkyevMs1EWdJe3VjO6n+zjIxBfcGjjpiB4obwHGkrLm50kS+JyFeBieyFp8JvQ7wlcB46PueOyc5XprTAbryWgDdhJAL0Vva5owUtzhpT8DJ+dvlZOFX4F4BWIJxVcnY5sGRxE6Ree1TUqua5Mrk+hZ+O6pfQWfh35wVuQVq6S1XdDNEsuRW1t+89EH+btgshgCMOvcUoDDu+UfWgm/KRZhve7pfN5nppVtL8Jymbge/+p73S78kArI8FbTyCgRUaYwc0HIGmZFqif4oXTcCticSou0mu3HxgI4eEt1xrOJJtV4I73goKpaP/3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHVb2HoZR+iufNqRpb5CiYE87ICXq8OgVwbteZuDL3g=;
 b=fh+rE19vnIhAKhU5P1FRn89rTUoRpkRgipnOdYbES+R5s58WDCJj/cBiHXWRMadvOtJRcF5HyiZuaNlTp9g0GkapR9OfIVGOF3iSrek6cH57+nCT4ctyV1NiphVQDx0LbXkWmP1wcPHcTjenAsUF8FPin/BgpBkSXWlW8URdZ5Q=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 7/7] xen/arm: introduce new xen,enhanced property value
Thread-Topic: [PATCH v2 7/7] xen/arm: introduce new xen,enhanced property
 value
Thread-Index: AQHYs7NVSZ6RtK1DJkmDvOUuzqeVhq28SEyAgAG2wAA=
Date: Wed, 24 Aug 2022 12:15:41 +0000
Message-ID: <1E823DBF-8576-4E26-B12D-B69CE581F36F@arm.com>
References: <cover.1660902588.git.rahul.singh@arm.com>
 <2fb69ff7cf9a36dd1294da4f9f4b968ff7076d42.1660902588.git.rahul.singh@arm.com>
 <d5ed6097-8a08-eb4d-35a0-ab28f82b881f@xen.org>
In-Reply-To: <d5ed6097-8a08-eb4d-35a0-ab28f82b881f@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0cd9977e-261c-443b-569d-08da85ca6561
x-ms-traffictypediagnostic:
	DBBPR08MB5224:EE_|DBAEUR03FT031:EE_|DB9PR08MB6940:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Te/UloZVB3G4i0HbY4aJTAFKpcyzPKcx8PwTkR8PSBau3Uuv1S1M6ZGml7/zvccoV5J91gNIhcpKGC3rbPMD2YFpEYBHjhmoNZAZvu1eWrnDMElF2ta+j/p1pZ9seqmU3agtkSo0eSoE5adQSmW3KjUAxr1crkGtkwNkLfwKeF4sCxU3Bzv+Pl51BhBPj7e09RkHGJdp2u8IJTox+HxL32NbWWY2lT51hSb7fvPTMLXrQIbYJMQ/vtH8Cv6ncJ5SoHIxUJVSUoBig8MRkr1u6V2J5ZsbTJxBmw3pASEuR/OvlCv70M7hCA0YlmPuLf65Q+BV7C6lkWuUpIZBoXxt9K8Tg6jfg1I9eiFsPmJgmm0pHw0+vBs1OKS7D5qbXg9MdE1r9WdChpdGLQVrFalNcrk+k8Trcke5N9VhWE3Ob5x3csar+hgPZq4b9YUPt2jMpK46GILnLkCancDSAnt42cU01tSrdtcjD0p8Ml/248HhrHtzbcNSNymJJ1Ir8sDuZG1Hj1ifyqVw0G1+hiUyWQFB9dvw8yD1emn3y4RPVc818ljizwuxnYjn2c7qmq8OofCOOHBqMyh5m6Zhr28WmI3A+QndlerDn5BBnncmhbQAHVDlxXUVcOpOZX7937UgR3zX2V1KOxibPoSr67JKBuDjVh9ImjV2dL+YxinimnMgFMTYz98fUk8Vs91XztXDDzsu8Q8C7rK/4Mn69z8RTq89EtspAxgv3MBNz9s2f/ze3hLjyFOQhhcCAyP5/JYCgNC9nBZFLjhBlo9siPvMLvz5sfjId8PFFU9LRoe0XUQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(36756003)(38100700002)(2906002)(122000001)(83380400001)(5660300002)(33656002)(8936002)(41300700001)(54906003)(4326008)(91956017)(66446008)(66476007)(64756008)(8676002)(71200400001)(76116006)(66946007)(38070700005)(6512007)(66556008)(26005)(2616005)(186003)(6916009)(316002)(53546011)(86362001)(6486002)(478600001)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <001690B7CB30AE43A0FF240FD15DDBCD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5224
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ba4210f0-a2e6-48c9-623b-08da85ca5cd8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QF2sUucGibySMCAeY1Dw4R7GOmKIfFW180eF+mWqk0uoNzxyQgy0LK2cxQsql8S6bOC4cJohcY7W7xGid+SNuQfMzvYCgK1vEwXJebKWbXc2gmZwhoxdtDU8R49TC5RrKYqP/IaX7mHDo8jbPUnwtWob+qka6gyqP+TqwjNfwIzAQsxmrCyk5ChNflBXRBhpgnKdaJAeZiEOkTklDC/vCvNJnx7m14my/ryrICtrAL2DtB7KESuCWBuoHYdGCJbv7egvRWqY8tolvy0HHMAoAcdeIAWV3cOWdvx8EI1Fx982qQainW3xWXJxr73A4e+4I4skQ2dr76Vy0Yt1S2uBXW9pobILMPoKb8i7nPipTyIt5cEWzc0bnWNaoMEugEVtFP0umezTgBWuMr9Msx+dAVUpdHv8t0vT8jGruJOo+D+LKaqQqfkPc8MbFo7uCHhHILb5eWgwHqbKrPSCxyuxlcP8RO4URN8w0m2RPmjsG9+B3wNzlVcIGODy0f9Vd+zSJ0Hlcv+t7GMMG41zLv/olPfRob0xaQR8cvo8mFw5gFgxsgD/DkpzZESEDHP6c4MFE8UlZKjBjHGrjRnHTN22TJ/Pim/fgoNHBdG7hldE+ukP1N1s+B7a5KW9pqV9L9QgpIVwTn74K2qHONwAqc3zynmhdFT3be4EEngoMCdBeKG/NA29d1SntAkwFGFXGYXTCjodULE6lGSVr7R7T4lhc1TU8WZbb4VkMByOWanr/KF6nHF+p9+FPdCFF2Z9Lae7qn+KiFTWhiNZvgZvoW2xCg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(136003)(39860400002)(346002)(40470700004)(46966006)(36840700001)(82310400005)(2906002)(82740400003)(6506007)(41300700001)(107886003)(6512007)(26005)(36756003)(83380400001)(40480700001)(36860700001)(356005)(316002)(54906003)(33656002)(81166007)(6486002)(478600001)(8936002)(5660300002)(6862004)(47076005)(53546011)(336012)(186003)(70586007)(86362001)(70206006)(8676002)(4326008)(2616005)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 12:15:55.7112
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cd9977e-261c-443b-569d-08da85ca6561
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6940

SGkgSnVsaWVuLA0KDQo+IE9uIDIzIEF1ZyAyMDIyLCBhdCAxMTowNSBhbSwgSnVsaWVuIEdyYWxs
IDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSwNCj4gDQo+IE9uIDE5LzA4LzIwMjIg
MTE6MDIsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4gSW50cm9kdWNlIGEgbmV3ICJ4ZW4sZW5oYW5j
ZWQiIGRvbTBsZXNzIHByb3BlcnR5IHZhbHVlICJldnRjaG4iIHRvDQo+PiBlbmFibGUvZGlzYWJs
ZSBldmVudC1jaGFubmVsIGludGVyZmFjZXMgZm9yIGRvbTBsZXNzIGd1ZXN0cy4NCj4gDQo+IFRo
ZSBkb2N1bWVudGF0aW9uIGluIGRvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQg
aXMgbWlzc2luZy4gQWxzbywgeW91IHByb2JhYmx5IHdhbnRzIHRvIHVwZGF0ZSBkb2NzL2ZlYXR1
cmUvZG9tMGxlc3MucGFuZG9jIGJlY2F1c2UgdGhlIHNlY3Rpb24gIlBWIGRyaXZlcnMiIHN1Z2dl
c3RzIHRoYXQgaWYgdGhlIHByb3BlcnR5ICJ4ZW4sZW5oYW5jZWQiIGlzIHNwZWNpZmllZCwgdGhl
biB3ZSB3b3VsZCBlbmQgdXAgdG8gYWxsb2NhdGUgaW5mb3JtYXRpb24gZm9yIFBWIGRyaXZlcnMu
DQo+IA0KPiBBRkFJVSwgdGhpcyBpcyBub3QgdGhlIGNhc2Ugd2hlbiAiZXZ0Y2huIiBpcyBzcGVj
aWZpZWQuDQo+IA0KPj4gVGhlIGNvbmZpZ3VyYWJsZSBvcHRpb24gaXMgZm9yIGRvbVVzIG9ubHku
IEZvciBkb20wIHdlIGFsd2F5cyBzZXQgdGhlDQo+PiBjb3JyZXNwb25kaW5nIHByb3BlcnR5IGlu
IHRoZSBYZW4gY29kZSB0byB0cnVlLg0KPj4gU2lnbmVkLW9mZi1ieTogUmFodWwgU2luZ2ggPHJh
aHVsLnNpbmdoQGFybS5jb20+DQo+PiAtLS0NCj4+IENoYW5nZXMgaW4gdjI6DQo+PiAgLSBubyBj
aGFuZ2UNCj4+IC0tLQ0KPj4gLS0tDQo+PiAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jICAg
ICAgIHwgMTQ5ICsrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQ0KPj4gIHhlbi9hcmNoL2Fy
bS9pbmNsdWRlL2FzbS9rZXJuZWwuaCB8ICAgMyArDQo+PiAgMiBmaWxlcyBjaGFuZ2VkLCA4MiBp
bnNlcnRpb25zKCspLCA3MCBkZWxldGlvbnMoLSkNCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9h
cm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+IGluZGV4
IDUxMDFiY2E5NzkuLmJkOGI4NDc1YjcgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPj4gQEAg
LTEzOTYsODUgKzEzOTYsOTIgQEAgc3RhdGljIGludCBfX2luaXQgbWFrZV9oeXBlcnZpc29yX25v
ZGUoc3RydWN0IGRvbWFpbiAqZCwNCj4+ICAgICAgaWYgKCByZXMgKQ0KPj4gICAgICAgICAgcmV0
dXJuIHJlczsNCj4+ICANCj4gDQo+IA0KPiBUaGUgZGlmZiBiZWxvdyBpcyBxdWl0ZSBkaWZmaWN1
bHQgdG8gcmVhZC4gSSBoYXZlIGFwcGxpZWQgdG8gaGF2ZSBhIGxvb2suIFlvdSBzZWVtIHRvIGhh
dmUgc2ltcGx5IGluZGVudGVkIHRoZSBjb2RlIGFuZCBub3cgc29tZSBvZiB0aGUNCj4gbGluZXMg
YXJlIG92ZXIgdGhlIDgwIGNoYXJhY3RlcnMgbWFyay4NCj4gDQo+IElkZWFsbHksIEkgd291bGQg
bGlrZSB0byBhdm9pZCBsYXJnZSAnaWYnLiBTbyBJIHdvdWxkIHN1Z2dlc3QgdG8gZWl0aGVyDQo+
IHJlLW9yZGVyaW5nIHRoZSBjb2RlIG9yIHNwbGl0IGluIG11bHRpcGxlIGZ1bmN0aW9ucy4NCj4g
DQo+IEhvd2V2ZXIsIHJlYWRpbmcgdGhlIGJpbmRpbmcgb2YgInhlbix4ZW4iLCB0aGUgcHJvcGVy
dHkgInJlZyIgYW5kICJpbnRlcnJ1cHRzIiBhcmUgbm90IG9wdGlvbmFsLg0KPiANCj4gSSBhbHNv
IGRvbid0IHRoaW5rIGNhbiBtYWtlIHRoZW0gb3B0aW9uYWwgYmVjYXVzZSBzb21lIE9TZXMgbWF5
IG5vdCBib290IGlmIGl0IGNhbid0IGZpbmQgb25lIG9mIHRoZSBwcm9wZXJ0eS4NCj4gDQo+IElu
IGFueSBjYXNlLCBhdCBtaW5pbXVtIHlvdSBzaG91bGQgZXhwbGFpbiB3aHkgdGhpcyBpcyBmaW5l
IHRvIG1ha2UgdGhlbSBvcHRpb25hbC4NCj4gDQo+IFsuLi5dDQoNCklmIHdlIHdhbnQgdG8gZXhw
b3NlIHRoZSAicmVn4oCdIGFuZCDigJxpbnRlcnJ1cHRz4oCdIHByb3BlcnR5IGFsd2F5cyB0byBn
dWVzdHMgYW5kIHRoZXNlIHByb3BlcnRpZXMgYXJlIG5vdCANCm9wdGlvbmFsIHRoZW4gd2UgY2Fu
IGRpc2NhcmQgdGhpcyBwYXRjaCBhbmQgYWRkIHN1cHBvcnQgZm9yICJ4ZW4sZW5oYW5jZWTigJ0g
cHJvcGVydHkgZm9yIGRvbVVzIGZvcg0Kc3RhdGljIGV2dGNobiB0byB3b3JrIGZvciBkb21Vcw0K
DQpQbGVhc2UgbGV0IG1lIGtub3cgeW91ciB2aWV3IG9uIHRoaXMuDQoNCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMN
CmluZGV4IGJmZTdiYzZiMzYuLmExZTIzZWVlNTkgMTAwNjQ0DQotLS0gYS94ZW4vYXJjaC9hcm0v
ZG9tYWluX2J1aWxkLmMNCisrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KQEAgLTM1
NjIsMTIgKzM1NjIsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBjb25zdHJ1Y3RfZG9tVShzdHJ1Y3Qg
ZG9tYWluICpkLA0KICAgaWYgKCByYyA9PSAtRUlMU0VRIHx8DQogICAgIHJjID09IC1FTk9EQVRB
IHx8DQogICAgIChyYyA9PSAwICYmICFzdHJjbXAoZG9tMGxlc3NfZW5oYW5jZWQsIOKAnGVuYWJs
ZWTigJ0pKSApDQotICB7DQotICAgIGlmICggaGFyZHdhcmVfZG9tYWluICkNCiAgICAgICBraW5m
by5kb20wbGVzc19lbmhhbmNlZCA9IHRydWU7DQotICAgIGVsc2UNCi0gICAgICBwYW5pYyjigJxU
cmllZCB0byB1c2UgeGVuLGVuaGFuY2VkIHdpdGhvdXQgZG9tMFxu4oCdKTsNCi0gIH0NCiAgIGlm
ICggdmNwdV9jcmVhdGUoZCwgMCkgPT0gTlVMTCApDQogICAgIHJldHVybiAtRU5PTUVNOw0KIA0K
IA0KUmVnYXJkcywNClJhaHVs

