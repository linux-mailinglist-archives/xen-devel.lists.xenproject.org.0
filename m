Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C18557E310
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 16:32:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373299.605428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEthB-0002Om-9W; Fri, 22 Jul 2022 14:32:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373299.605428; Fri, 22 Jul 2022 14:32:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEthB-0002MC-6c; Fri, 22 Jul 2022 14:32:01 +0000
Received: by outflank-mailman (input) for mailman id 373299;
 Fri, 22 Jul 2022 14:32:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sdc0=X3=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1oEth9-0002JJ-W4
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 14:32:00 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70080.outbound.protection.outlook.com [40.107.7.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a9d5eaa-09cb-11ed-bd2d-47488cf2e6aa;
 Fri, 22 Jul 2022 16:31:58 +0200 (CEST)
Received: from DB7PR03CA0098.eurprd03.prod.outlook.com (2603:10a6:10:72::39)
 by PAXPR08MB6909.eurprd08.prod.outlook.com (2603:10a6:102:139::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Fri, 22 Jul
 2022 14:31:55 +0000
Received: from DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::3f) by DB7PR03CA0098.outlook.office365.com
 (2603:10a6:10:72::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19 via Frontend
 Transport; Fri, 22 Jul 2022 14:31:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT064.mail.protection.outlook.com (100.127.143.3) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Fri, 22 Jul 2022 14:31:55 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Fri, 22 Jul 2022 14:31:54 +0000
Received: from b05fc40e0ce7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CBF649D1-9D16-4579-A133-2148D54FE865.1; 
 Fri, 22 Jul 2022 14:31:46 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b05fc40e0ce7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 22 Jul 2022 14:31:46 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AM6PR08MB3239.eurprd08.prod.outlook.com (2603:10a6:209:47::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.21; Fri, 22 Jul
 2022 14:31:45 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5458.019; Fri, 22 Jul 2022
 14:31:45 +0000
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
X-Inumbo-ID: 0a9d5eaa-09cb-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=kqnKNq1A2NzwnSCUI3DpS4mo7qKz3TUClSA3+XtpnFMiI1DnbPNTgOUBWAhkXQsYfQbCzFfZzocRn9/OMWs1iJYPdE1leVXdwZFqt06I0OrNqugOchK6JZrF5OkpVpoiXUle78/X5DMIcf5CdUclbAALplD3YCoMOtvhQXCbdeKtBO1Y7Jiwe3rtf9Gm0TWj2EYwyJifrU7Qy5OPnrhKr1OsLmoj4V5rSp8lVu59sYTuss0efYg/efNb2jSMKY5vIJv5pxfLOZ+OEgcDyTVXpSlVJSBe3bszKHEsWog8Y0LvNg1JQyT6PTLzAwE0YjI29td9A01txzhbFUskf0KxcA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=naDHrJpGCE9wgT5Y6+JlfCKxrH2lMRdgjZLYHRmDdg4=;
 b=DOC9vfqG6SUAKL9ImWgMJMPPi10E4o7IT+5PmMxs7wwkW23QTKXvuAs9Dz1CIb7FVIaUr7eKV8H3mQMFc3lC77oIrrIAtf8Qp1a3GOmps8GdxcaW3e2/umy2sR4npWPJXUe93fBViGSZqLkgSGCnkTe17k5esW5brjC0d1xKc83qqZcM5VjqenX8iHcuUVhXUAZRpIPSS00jXgbUUjpW6R1/0dHFoMRYOYcZ3Zlkx2YbCZ34F3Uokgz1jPh54nSTIoOS7B78SMlvvgxceVRH5wCf7JfTw1inrh4kKVEuVSYGSN6iK/dsAXnZC3VHIG9A2qLIjX59yk86Gc87OGsMNQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naDHrJpGCE9wgT5Y6+JlfCKxrH2lMRdgjZLYHRmDdg4=;
 b=XtBUQlcioV3SOCJ21XiaL/TXkYzZ6g+DOOOit/bd6qhKsa3PZyFgGTerPPFkSz0XF7aY9jjcLz0LlcslknQWqrie7Al4vZFuEDcS8ZRQlv3EYpFOSR8vkPzuM8Ka9LKs9f6TWDloAdow0RazHESaPU1EQr/GwgCz2pIBnaArPPE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f0c288de30d6da2c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIhlCyWhw8qkklmaXvffjGzdeXfufiB6+mncz4+PL4Urhy4/ULWwpoxqWcUTWYnu7dSkepaLG96/EdkuLgt27hvkPPqPHXxUf1dFBzZ1AXWHb7tjDBRzJD5+IjWB9t9xKNVXmIRmzEfiuGsoyw2rD0lGUHhJCbnGPe/Ky7K0P6yfNvgExhuJZi+zGjfbafQdO0Gs0MiM0JxqhFDVsiafjURfs3aJPvDx+O+BnOQUPoHO0ONdPrgFQXv9jtohS1vALkr91W6H49GoYh7hZ/QNctXUiyTn5jlTIeD3VOY9koXcP4oXAs/M8TFkJHzEPCbnPKk1+OixnxmGxZB2ffCzNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=naDHrJpGCE9wgT5Y6+JlfCKxrH2lMRdgjZLYHRmDdg4=;
 b=g0b047k0KmYPWqFJqw+kWCNF4vitu2765RQItIGiVDgi0oQsXKGOIqNwNDEMZ1UcqKw9nWuGMWhu62UN4dqmTW3S0yvpohQWlGaeRsW2f82++dkhHaXrOXXWiRixUoxT2kcNbNiJ1h0MkoNbg3EgYRI2K3PgxSOAJfcFHAC1XPoZzozOcia5p1zEr2MmSdODqgm8xzdb7RHar+bTdzfeIEsnQ9IT9BaCBIAuYz9EpbY6x+iD5c2Zgh/DtTa7YRTJVbmIjjchgIl7b1z5nO6e5RDWFa2VOhXDNaokbsSEA5gA+7tbn+k3yrJOQ1V494PTWhk0BnAQa7tkkhC1OveNrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naDHrJpGCE9wgT5Y6+JlfCKxrH2lMRdgjZLYHRmDdg4=;
 b=XtBUQlcioV3SOCJ21XiaL/TXkYzZ6g+DOOOit/bd6qhKsa3PZyFgGTerPPFkSz0XF7aY9jjcLz0LlcslknQWqrie7Al4vZFuEDcS8ZRQlv3EYpFOSR8vkPzuM8Ka9LKs9f6TWDloAdow0RazHESaPU1EQr/GwgCz2pIBnaArPPE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH v3 24/25] tools: Add -Werror by default to all tools/
Thread-Topic: [XEN PATCH v3 24/25] tools: Add -Werror by default to all tools/
Thread-Index: AQHYh+S2cSvMt2yjdUK6F8k4/yD9Ya2Kn74A
Date: Fri, 22 Jul 2022 14:31:45 +0000
Message-ID: <BFD9C67E-8B2B-44F4-B746-A137366455D4@arm.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-25-anthony.perard@citrix.com>
In-Reply-To: <20220624160422.53457-25-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 39608cff-d96d-4fe3-0c11-08da6beeed11
x-ms-traffictypediagnostic:
	AM6PR08MB3239:EE_|DBAEUR03FT064:EE_|PAXPR08MB6909:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DfhhH2XGYHKKZXaWxPkmJB2Bit6v1qlK32Gz+UR2WChOYqSuF7FTWDsudQ3E3yY6Zt1LuAb3tIeUVL1NJi7RgZ0qwoUu4FQtGE0wJPg3dfTR++sFGn0qR2HGs1PHcicZOl3MRYVHEb1lfyNOWr9ONPqZJfGiIpd24euztjRsQDwI8yBWsOm6fihJdNbiJfgigOfjCFG4i3vCQ4S2Ftd5UNcQE0p2zCjuXK6iJCO53SD4RgbVvfiawidnUhuOUkBz1d/xNKgkMzG0CIZFuohjuLsh2tMSUCL1y8LJb809cbJwkhTSXbUpS4yHKJ3DG8f41djZMHodI9hCXQrSyyLvd6aEhr+JnxuRLHWv2CVYByfEgPwa+vIpEM62R4wwiTU2jdicGSM6zkSGcxY/HzIAb+mO9/CAgsyaXWUeGK9OpIKMxngf3qCGWgLBdnp6vzRq7642NEGW2poq9RNmwV37PXix9GovxHOhmhPyENo830vGpSvGGVNoiOfO3F7eMUal/MnHC/YQ9FlVuPb0JbVdwN+hNsRu0j2ijykDCwoG7rS1y71xFfPTKAuq+gvRh1cEphYq/vN+TksPk0CYsfY7GlNOvRRWS6sZU8CAQB7aYz9o18zTi2pavNrPZKuOYmrvpGKbC07C4kZRNir9uUDqL37TQ8CIxe9zaJ8Ox4mlZ5FxXu5nCdD5yuSrzMidvbnE4Q5Xaz1lSAiB2xLBVu50n8QZ18Av/oC/mlBoq6vM/JlVAPAiQyNpwNlxWhxThiLi0tRx55BVOYYrdEC0UxS5/TukToWAwrJ7dp0oXtbSqZn0NC5Lv2CT95O/luZ4AHRuU3S+mJIqdLXu44fbu9/4Dw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(4744005)(33656002)(6916009)(5660300002)(71200400001)(41300700001)(122000001)(2616005)(478600001)(54906003)(86362001)(38070700005)(316002)(2906002)(66476007)(8676002)(4326008)(26005)(91956017)(64756008)(76116006)(38100700002)(8936002)(66946007)(186003)(53546011)(6512007)(6486002)(6506007)(66446008)(66556008)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3FC41CDFCF0AA8449FD2329C5A7F7C6C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3239
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1364ee79-89a3-402b-e0fc-08da6beee74b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TbPkZBav0Zb+aiqZjpmZxJk4/fkTnEiu7Vu+GETeZD/qWDx0bHVCSciRFz0EcVD6MVtLM7M8SIcevvf1dEkIKJple2WEy1Kdx1Fa1eQPaNx5tlQjdmjenazrjkg5kYybCqfMlwUhRPSwh7+dDk+VnBBf6/4rb3HhrBtwAVjaDXdDX0XCLNmJzmiTmFX8bAu4UYgGB7rqZNc17Lj5PFW8rdvrdYk5NdPQh3nzcASDZzPntnMDum/f7hMLMINGa6Au/YRRscjXjGIgPcMYSDhFHnmy48gG4nE9LFmL2XMTpuFWIlMJiDHYGzYcJAb3qynisETR0NZ8H2jjtSFuOGLn01Awbl6iEj5yE0Vn212aGEZLagSS52o82MPtOU0IJ+SiM+CWYN1k0mF1X3roLFe3qx3zS40z1miLHJg+S4+7wYvHmzybdH1oo/jAh2zr1EdTW6QesWzbmYliwX6O6Xu71Y25GtVkPV/BC1XHYbUhvAXZidgVJQn9BHlrhESsJScFVCmjjKdc7JYF6lgtuOKRp8sWaty61TwS6g4Gs/i/8tp8hwSbekZRkr3mZbDyOgC8y5I/p5oGf1fmolAL2EdQo7UzbUM2SAO6pCCH/F8CX1hURp7OsK8KVdJdxMT/0XUuuV9TEQHudjjVfLFjR6c3lhZJ/RGyFp2pk8lqUEFdLvoyOt7xYpSevkalM5JvJOlePNeHfKlYEwUisFieuRlQSatQ9QDDdGY8PHM28PwNfycmMbRAL5MkxhnWybsAhlQxcXJ/rMSBoEIJ68iUlRPwt8IqquS8DfAYv6d/hb+qlPAL/5KXgEz0JUcgNBXzs0XK
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(346002)(376002)(39860400002)(40470700004)(46966006)(36840700001)(33656002)(47076005)(26005)(53546011)(336012)(41300700001)(2906002)(186003)(2616005)(6506007)(6512007)(81166007)(40460700003)(86362001)(356005)(82740400003)(40480700001)(36860700001)(82310400005)(36756003)(478600001)(316002)(4744005)(6486002)(4326008)(70586007)(70206006)(8676002)(6862004)(54906003)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 14:31:55.0052
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39608cff-d96d-4fe3-0c11-08da6beeed11
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6909



> On 24 Jun 2022, at 17:04, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> And provide an option to ./configure to disable it.
>=20
> A follow-up patch will remove -Werror from every other Makefile in
> tools/. ("tools: Remove -Werror everywhere else")
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Hi Antony,

Looks good to me

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>




