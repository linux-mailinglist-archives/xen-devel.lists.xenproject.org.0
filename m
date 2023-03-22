Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 762E66C4F7F
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 16:32:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513523.794647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf0Rq-0005ym-FM; Wed, 22 Mar 2023 15:32:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513523.794647; Wed, 22 Mar 2023 15:32:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf0Rq-0005wT-Bo; Wed, 22 Mar 2023 15:32:22 +0000
Received: by outflank-mailman (input) for mailman id 513523;
 Wed, 22 Mar 2023 15:32:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxM9=7O=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pf0Ro-0005wN-Tm
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 15:32:20 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb8c82e8-c8c6-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 16:32:19 +0100 (CET)
Received: from DUZPR01CA0304.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::6) by PAWPR08MB9122.eurprd08.prod.outlook.com
 (2603:10a6:102:342::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 15:32:10 +0000
Received: from DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b7:cafe::b1) by DUZPR01CA0304.outlook.office365.com
 (2603:10a6:10:4b7::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Wed, 22 Mar 2023 15:32:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT062.mail.protection.outlook.com (100.127.142.64) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.17 via Frontend Transport; Wed, 22 Mar 2023 15:32:09 +0000
Received: ("Tessian outbound cfb430c87a1e:v135");
 Wed, 22 Mar 2023 15:32:09 +0000
Received: from ca6e6af40027.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 671F22E6-B5CB-4E9A-ACD5-B680FCF4710A.1; 
 Wed, 22 Mar 2023 15:31:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ca6e6af40027.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 22 Mar 2023 15:31:58 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB8712.eurprd08.prod.outlook.com (2603:10a6:10:400::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 15:31:55 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3%7]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 15:31:55 +0000
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
X-Inumbo-ID: bb8c82e8-c8c6-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/ZDuoIlgmSqrEPggJrZYbxTyjW8pSA/JtkX+2WEkV0=;
 b=PNUojeeuEQ+DdAPQ6YavxXegUEDGxX+TKRTiskrHhp3B8ErS3J0WK7hpxsHupgwqy8NCZ3T72bJhrIHneWXdPv+inHsGE78Kn+h8XQmaTeVDNWfVCrpg+O92CREBa0dOcp+iVRK8jYpofVtYSKflR5ZoX1g5cyMSFSEnozEY3jE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: beefb365102f552e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i31Y3t1KTfar8BzNcsBxyh2bMtRSU6GIbHqCrb6tPE4ubfPnsYiHJcRLTHPWP8exzHpBUWJQa5s0s11Tnn+vXYi2S2VMswvrF4qftYpQXW28L/3JhV9tqYYyAzAPqxdDwr9MG3ORpIc1SlC1CL6FOKPBPZE4Di8kdxvzo76F7yELeLtnuqcJ6cpgiwiVw98qEmi+zIEgcO9kAbkVVelfCzgg5hGVGPZ6iSQw/NL/N+QcnSTg6bVQ4JTOe/lBXoipGz4AsLqMtNYB4pGKUqHEi86rBuJAdT3P3nd4nF/ZrK9SqBOwgtLvT20RU3Z0xyQ5Xu4ICmc+jUor8l1J6XT5sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/ZDuoIlgmSqrEPggJrZYbxTyjW8pSA/JtkX+2WEkV0=;
 b=APIdzuYJS77tIigDO7Pesa/5i44IHrC2r4Oq7cVkjtuE5JjPi+HczZHxDPAoBj1lW4GBF/IbbFlEliTj8OZUDXfzASX1qtKr6xl5Df0v5ODskVV5oZYK0ylw+3Rp3IHgLwHYMhzTtsOYAv2iHFB+5GE+JnF8btTxnpeD9uH0ORncGBK8JQRXW++Wf8d32ioocCBZOfQ/MbTR6JddHYVLvt5aLEBZuI+2+eCmVbcW8sLiqTB4jgoENTsuokGXjx0cQhBsko5y7M2nye/TUGCJN3vDqV6cmHoOk5Bj0mtPlvM4OS3BPFjSOlXsVm9ocK8BZ5ihdzMzUeTRzAsOmaUIfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/ZDuoIlgmSqrEPggJrZYbxTyjW8pSA/JtkX+2WEkV0=;
 b=PNUojeeuEQ+DdAPQ6YavxXegUEDGxX+TKRTiskrHhp3B8ErS3J0WK7hpxsHupgwqy8NCZ3T72bJhrIHneWXdPv+inHsGE78Kn+h8XQmaTeVDNWfVCrpg+O92CREBa0dOcp+iVRK8jYpofVtYSKflR5ZoX1g5cyMSFSEnozEY3jE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] xen/arm: vpl011: Fix domain_vpl011_init error path
Thread-Topic: [PATCH 2/2] xen/arm: vpl011: Fix domain_vpl011_init error path
Thread-Index: AQHZXKlPma7CnH/bnE+l0dOUYhvW568G7X0A
Date: Wed, 22 Mar 2023 15:31:55 +0000
Message-ID: <15347B63-580C-401A-A8B4-CA19F5A2C5CF@arm.com>
References: <20230322102941.959-1-michal.orzel@amd.com>
 <20230322102941.959-3-michal.orzel@amd.com>
In-Reply-To: <20230322102941.959-3-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB8712:EE_|DBAEUR03FT062:EE_|PAWPR08MB9122:EE_
X-MS-Office365-Filtering-Correlation-Id: 44d77739-9ac4-4720-01d5-08db2aea9a0d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 d2XK5xrDHv5V6HplvWhVkv6Qh6x+JqmRQHf9ts0NhFKwXK3sZNymbiQDxo+s/+v3W+2nYi0JPXnbLF6DqDedNIJn+OrSp3oC3f/RB1yJSj5sCx8BX7iUBHbuV7GA8ptzllus5t0VcAGTRNE5pAzPaB3UwMHH9hWFOyiFI2adyJg7/NdPUZhD8oxMDPrpbLWeWEtWmD1YeYB+R5/qgMGUed2BGDrzshvpOmWThwHa9UrjW1ARR9nZNqL+3U8uUYgbvxjdxbdLfzyYmmXrfT1VP3lbUJyFCuBArWQA+44LwBMzvxsE1+IYWtjZBOnC8pfGPB6eA4IxT1KSwKwL5Qc/nh440SRy5Cbs3+4EqPbrM5l9LaNlaIYnCzh90biC7mWsfL6E8DjZGHsMH9xI79NIDDq6odlEMqiuZ6JR6ApHznsvcy1u+1WcsZi+gYSG7Iv4BcXbiIRq8qGVdbyfdvncWy7DhQShwIPPIl68lzoxVgmOUQT/nolCsNVpOOaOhQLLWqopFU7WdjLctGM70lSrS9xSflxDw6s3k4aM6Y7wdg9J5SFKdfiHXyEclvKWHtcqCU+AezK0nfeap/tJKWWL5gL/+dEOLLdn/9NH293Oo36Caur7dF+AV1ZhSyrYgpN0Rfqqf34OSLKiwRhRkAYWkj22B/4XsvasC0K3Tb0dECTMNoXIvSoUQw2nfFrlGoa8qpUsFZ9TMHkJuIpbXcqIOkoWKkwIfB1Mtj+YcYe35hI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(451199018)(71200400001)(2616005)(6506007)(316002)(6486002)(6512007)(478600001)(33656002)(54906003)(186003)(53546011)(26005)(38070700005)(38100700002)(86362001)(2906002)(122000001)(8936002)(4744005)(66946007)(66476007)(5660300002)(4326008)(6916009)(8676002)(41300700001)(66446008)(66556008)(76116006)(36756003)(64756008)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <30163EFDAA3B694FB0C72FEBCB67CE49@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8712
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bb3ba553-f627-436f-6f29-08db2aea9176
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HPXJRco/PsM5+XXDnk2imkkbn/4Io7GStxJUNyydT3rRBh7mt1ly0HtcrXrRR1sIRPnUB5G4LrNf+dxq5CH8/SiESlY3LiP8dHmxW8MPRheVVD8pFNoYFOo4XD0RtdMPktb2CbEbtlsjxe64mQ6/t+wkOZ3MgNFJ7JwQDi9J+LQfj0IZqej8l/Cwz4csPzyZbeffAUlViOzsslD/5FDzcUCnmwYldoUJumURjICdhh988UyVuj09vQpTVli3KEk1M+9Ag2WrK6dlKoLgBbWAg6RK84l/1rOYmUkxQzAuyU4PDVd+pjSYStN4S+YvQ2g+8sirUpwlMHDji6ANor3rymw2c1DPMKuKj7GJs7et5We1daumZhq3RbuUp8P7Ymr13/t+kU4ItRD+5i8qpUtoo7RDW8m77PaOBieb4EqFZax7H8VnjJpo3+F+6EZ8/XQKvOkWeX0c/x7ZmLEbZ/bwv6GOg/mCxCPF5O2DZPR8/2Xq69k+YBebBnuF27GGB7FYAttd1EFJpMzLpNWju7J2MPyJJa04XjOLlA6oPFoTcfqc615OomyPPrT98pmNu7RniRx+ded87Vl6QbUHBHsw2Ky1HyCU0snQ3oLGnZyv+OEuIcFrCnqKfcr/eKQt/eGEv18ODbTn9c20KBmfncafXY2Mh7nu/jBe/wwyMEhTr4dNrqr5ZqEPpprLQ3Le4eEt5F3C29iDa6kCpjhpFiSQ8g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199018)(36840700001)(40470700004)(46966006)(6512007)(4744005)(6506007)(186003)(53546011)(26005)(6486002)(47076005)(2616005)(478600001)(54906003)(316002)(336012)(107886003)(82740400003)(4326008)(8936002)(70206006)(6862004)(41300700001)(36860700001)(70586007)(36756003)(8676002)(40460700003)(5660300002)(2906002)(86362001)(81166007)(356005)(82310400005)(40480700001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 15:32:09.8158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44d77739-9ac4-4720-01d5-08db2aea9a0d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9122



> On 22 Mar 2023, at 10:29, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> When vgic_reserve_virq() fails and backend is in domain, we should also
> free the allocated event channel.
>=20
> When backend is in Xen and call to xzalloc() returns NULL, there is no
> need to call xfree(). This should be done instead on an error path
> from vgic_reserve_virq(). Also, take the opportunity to return -ENOMEM
> instead of -EINVAL when memory allocation fails.
>=20
> Fixes: 1ee1e4b0d1ff ("xen/arm: Allow vpl011 to be used by DomU")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Also this one looks good to me:

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>



