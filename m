Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4114D6C7B8A
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 10:36:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514250.796332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfdqJ-0002Zz-7b; Fri, 24 Mar 2023 09:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514250.796332; Fri, 24 Mar 2023 09:36:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfdqJ-0002Wc-3o; Fri, 24 Mar 2023 09:36:15 +0000
Received: by outflank-mailman (input) for mailman id 514250;
 Fri, 24 Mar 2023 09:36:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Cuu=7Q=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pfdqH-0002WU-On
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 09:36:13 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4dc1189b-ca27-11ed-b464-930f4c7d94ae;
 Fri, 24 Mar 2023 10:36:07 +0100 (CET)
Received: from AM5PR0202CA0001.eurprd02.prod.outlook.com
 (2603:10a6:203:69::11) by PAWPR08MB8934.eurprd08.prod.outlook.com
 (2603:10a6:102:33e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 09:35:58 +0000
Received: from AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::2f) by AM5PR0202CA0001.outlook.office365.com
 (2603:10a6:203:69::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38 via Frontend
 Transport; Fri, 24 Mar 2023 09:35:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT003.mail.protection.outlook.com (100.127.140.227) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.22 via Frontend Transport; Fri, 24 Mar 2023 09:35:57 +0000
Received: ("Tessian outbound 0df938784972:v135");
 Fri, 24 Mar 2023 09:35:57 +0000
Received: from feb259280792.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E30D52CD-6F94-4231-952C-C9C7357A85F9.1; 
 Fri, 24 Mar 2023 09:35:50 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id feb259280792.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Mar 2023 09:35:50 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by VI1PR08MB5342.eurprd08.prod.outlook.com (2603:10a6:803:132::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 09:35:48 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3%7]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 09:35:47 +0000
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
X-Inumbo-ID: 4dc1189b-ca27-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnALK8E0o110EXwtcQdQ23kE05L8EfHdw8q4WTuFnt8=;
 b=Z8tnV4b+iyR3PBkJ6FJOxboxvYQnnJLXspJ3HztH+rku1+483k7RLU5V4wXMk206vVix4FmKdbAz+nQJewitOPuTitqX9OPo5U6Rg7OC8oM9NeD85Q5075hnyN+U66gdpHVOWEQ3BdueAR8Jgn7VlHJwjj/NTuT2mJkB19f0I3c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 93fd08c2c09377d0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOpHdq00KAMPZ5ijqvNBOaifkm/pD2nm3DjasQ7DxD//fEBOVhCSIIOQmEXNg1MitIG9/DIi6poIMOsnZTNXCylkMn7Szkqv09huFmjVrJV5+/K1bdlP+aOYo50z24VWowkwIG2gZaTFOdTDkwxx3kTKkO78XRIHEsR/hDvNAsuJ0PJqZkA2+mzzig1K35Yf5B6Xm6jI0vhAF8rQaeWLmafeL8TWu85QGMD8+FqUEz4HSn731fw21LzCKmInjfV+n4ihgGlXOElGIFBmwRmNRAXLSmIf/jR03J6mreT4Sd/DeuBEtB2s1O07BAdGo0Iz2PsWV10T4Puw5Dwbb1Bopw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnALK8E0o110EXwtcQdQ23kE05L8EfHdw8q4WTuFnt8=;
 b=i/sbvH2MgLpN7T7PAiGoqSJgR/mPxQK0GVK7nzxXBbjRmQPxClecurLg1pnqK2v98/TtTCEofyk/VfEDWJ5qZG8FZ+6Sz4Q3lCwLCsQvgq4IOYawXhEmT0JN0nfptWMPf1ltRS/d0AcsiLARJL/49rc3nJN7W637CGADHKinJHrYScWIT/Qc6+zo+eyEc6S7CAabbOqjaRVQFRL0WGOdxL4GS8K8UtQ1AjAowqF+8luJ5HoYVqOoUsEWi1ESA+paFR7cwyappMvzz0eAw8XDpuIy9xvvFc/Hi2HgrBcp8D+EXmS7iMOVzqX5NgwW0yfxEc4JzKnC9Pp1lBU+5rJeRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnALK8E0o110EXwtcQdQ23kE05L8EfHdw8q4WTuFnt8=;
 b=Z8tnV4b+iyR3PBkJ6FJOxboxvYQnnJLXspJ3HztH+rku1+483k7RLU5V4wXMk206vVix4FmKdbAz+nQJewitOPuTitqX9OPo5U6Rg7OC8oM9NeD85Q5075hnyN+U66gdpHVOWEQ3BdueAR8Jgn7VlHJwjj/NTuT2mJkB19f0I3c=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 2/2] xen/arm: vpl011: Fix domain_vpl011_init error path
Thread-Topic: [PATCH v2 2/2] xen/arm: vpl011: Fix domain_vpl011_init error
 path
Thread-Index: AQHZXY9vXeyq3ki000ag4E2VLenl168JrNoA
Date: Fri, 24 Mar 2023 09:35:47 +0000
Message-ID: <97EBE93D-01BE-4DCE-8726-6D8066F79CA0@arm.com>
References: <20230323135636.25318-1-michal.orzel@amd.com>
 <20230323135636.25318-3-michal.orzel@amd.com>
In-Reply-To: <20230323135636.25318-3-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|VI1PR08MB5342:EE_|AM7EUR03FT003:EE_|PAWPR08MB8934:EE_
X-MS-Office365-Filtering-Correlation-Id: acad260e-5079-4d55-52fc-08db2c4b2c3b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3iiCbv98GBFJ/nu1LnuGRtTQUFEPHPm4/FHjIP3yHZ3ign/Et6Ksk7C4vjU+sH/1LiUHbVotfuWWa+ZkYElR7HzTK+9WmIr4lnK0FbjyvQGlM9dmXZc/Kr6PlMsgqdFjoLSLBakrU5k+/n4I8PUP4TYeg63JR9+Ykrth44focn1teOZuQygU83W3Za6V+yQpJ9aPpnllYdmgAYMSoub0KAUOkTz42nRf8krfkofSJ+dHknunc2d8cbpc8t2Kw87gtmd2DyWVP4+YiF/hMTA2Dirck6oHcpqhCEHCnzuf0jTT/e4Gw9snGfJ5XgsbGpkvODImva4A8TvnRlBfNO3P9CURyLXa1Ls4JtKg+xT/Rlws9BuT67zrO5+7pRZL1el9t7nEc/fmMuds7f4LSwxOZB7y4JuOGuVs05avtKU2ivDDQRl/cMV6FbbaeIkN3J7rRwCtZGePuanpnqQDV2QrqFLFL+YB+KOKpfYYkKfDsM1sntNH2deN5LrYVg2xl5FiDHS93+lFVW1fFd8k1WGZbcZ1EtL/HHeIpE+d94vr72Z5Pcgte72GdD2V8e7SONQbk9/351HMmMg/kokIpIMUYJVGsA0POpCSTsIdb9+YdNehX2tqjJxCMXvra6qiOwuqmNrcHWcqoTb+zWDO9RmadfRd3OpsQZDKlQyPkwUvWBQiSnznaY4bHaAKzHsVY8A2N9AkSFaNmg02JF3Sbke49CdX6IAHMrOev+QNeh+u8co=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(376002)(346002)(39850400004)(366004)(451199018)(2616005)(6486002)(86362001)(6512007)(6506007)(26005)(53546011)(83380400001)(71200400001)(6916009)(66946007)(41300700001)(91956017)(54906003)(38070700005)(316002)(33656002)(478600001)(64756008)(4326008)(66446008)(76116006)(66556008)(8676002)(66476007)(38100700002)(186003)(36756003)(4744005)(122000001)(5660300002)(8936002)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F5023C087040D746AC9AAC864EA2918A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5342
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f2aae5a6-9547-48cc-5ca3-08db2c4b2645
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LGJ5dmd+NIlI19ROdHhqKTvDAkgfy1jphIWr8L7YLjBvEVDqgnDp4s67yyqWx9H3wyPFfQs+phxyLp7UQWBFnv0vNwatXF5tc+U1uO2OvM+dOeLvEw0DoADiGv6O+kPHekboePobrnLk0ycrR3eQDygMjZU4jwymYA90RrEfIPWb1mr7T9G5dadylTmEXPNrDXzeMLdyoPsb63dHHGcDuInXE8xjmRF/oUJB05Sd9Vqh4bU7B8q4RoBbulzroDhLdNzh9XE8w42p5E6HpZCrMn6POwlmdkciZdoIgtHU714tnZpGPdCUZeD037VerLzugeM8A16DFHGvKcQkKVni2cqvGm3qcJyLtF7g7nwj5z7ulYMtAe0badzpJcsNvdx0ow4Df2Pd5xGjPKssy0nTbDBxP1M276Z0+O1pnPoaCa5KmfxEQoKBq+OvndXoG6KKDj21FfM8oecipzo7C1iHx/Rqn1YUuhi1k5hGgrgZTKNw+RVHDRluqEI7OH+v6//D/aJuUQ1pmdJG7/SAXiOuQyxN7YwHiku0arql9ujIZXbj+VHBVwSje7AG5DnlCaPrxitH89SYdc3qm5s5KGjaerGV746yR8JAq9m59Icr3jbVPJ7E6JOPoMNV7g3f47UUvnxca/QqTLDmTLxheIEEBc6TZpgOFtOtTgI7GCgsRl0chMe7tPGY399KSGUj1ZMxEXroo57K55GKueaRXsBgMw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199018)(46966006)(40470700004)(36840700001)(70206006)(4326008)(8676002)(70586007)(8936002)(40460700003)(33656002)(36756003)(41300700001)(53546011)(83380400001)(186003)(6512007)(40480700001)(356005)(81166007)(86362001)(36860700001)(336012)(47076005)(2616005)(107886003)(26005)(82310400005)(6506007)(54906003)(6862004)(478600001)(6486002)(316002)(82740400003)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 09:35:57.8686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acad260e-5079-4d55-52fc-08db2c4b2c3b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8934



> On 23 Mar 2023, at 13:56, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> When vgic_reserve_virq() fails and backend is in domain, we should also
> free the allocated event channel.
>=20
> When backend is in Xen and call to xzalloc() returns NULL, there is no
> need to call xfree(). This should be done instead on an error path
> from vgic_reserve_virq(). Moreover, we should be calling XFREE() to
> prevent an extra free in domain_vpl011_deinit().
>=20
> In order not to repeat the same steps twice, call domain_vpl011_deinit()
> on an error path whenever there is more work to do than returning rc.
> Since this function can now be called from different places and more
> than once, add proper guards, use XFREE() instead of xfree() and move
> vgic_free_virq() to it.
>=20
> Take the opportunity to return -ENOMEM instead of -EINVAL when memory
> allocation fails.
>=20
> Fixes: 1ee1e4b0d1ff ("xen/arm: Allow vpl011 to be used by DomU")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>


Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>



