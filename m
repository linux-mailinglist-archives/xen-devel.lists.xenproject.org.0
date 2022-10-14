Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 633145FECC2
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 12:53:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422751.668993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojIJo-0003bw-Ae; Fri, 14 Oct 2022 10:53:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422751.668993; Fri, 14 Oct 2022 10:53:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojIJo-0003ZQ-7s; Fri, 14 Oct 2022 10:53:32 +0000
Received: by outflank-mailman (input) for mailman id 422751;
 Fri, 14 Oct 2022 10:53:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Pkr=2P=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ojIJm-0003Z3-Lu
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 10:53:30 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20074.outbound.protection.outlook.com [40.107.2.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f6ea996-4bae-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 12:53:28 +0200 (CEST)
Received: from DU2P251CA0010.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::25)
 by DU0PR08MB9679.eurprd08.prod.outlook.com (2603:10a6:10:445::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 14 Oct
 2022 10:53:26 +0000
Received: from DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::69) by DU2P251CA0010.outlook.office365.com
 (2603:10a6:10:230::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Fri, 14 Oct 2022 10:53:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT010.mail.protection.outlook.com (100.127.142.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Fri, 14 Oct 2022 10:53:25 +0000
Received: ("Tessian outbound 6c699027a257:v130");
 Fri, 14 Oct 2022 10:53:25 +0000
Received: from f2c80caf7ee3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CD105B67-B80E-4108-BACA-5682235EAB03.1; 
 Fri, 14 Oct 2022 10:53:15 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f2c80caf7ee3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 Oct 2022 10:53:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB6715.eurprd08.prod.outlook.com (2603:10a6:10:26f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.28; Fri, 14 Oct
 2022 10:53:12 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%7]) with mapi id 15.20.5709.015; Fri, 14 Oct 2022
 10:53:12 +0000
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
X-Inumbo-ID: 6f6ea996-4bae-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PAkSMaqF55FZsRB4EYzeGeq6HX9u5vWUN5GIc4vzPuQbRqELkAKetOdcMo7xqhAbmzoTqO+ML7JPEElpKL2jckxIdVCQNdcYRjT68+9o3h6aIkTUwOs7/Ettqb0dpQkwlnsRrmW1H1O58oNOIcDb23jHx4lc1gqDndQtB0fU7vQfeAt2O0e4p9PLE8wj1Mlbp9OExzGOmcAiZhPy5GGnnp6m/QBZYudiQR8xzambLugDUsqXzCKsMX7ub2tI7h6QluBPJK91k2kjg36aSfKDBaT5PzmgW9IuwfT4ilwggq+ZhG5EbUZc4a0oqFT0xNEzx8eW8o9Cc+dQUyBLfzCWAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zeCrEx6uxBpFQnoMQNaF/5FHws6SrBOtz2IWoU8HGnM=;
 b=a4PD5OAsZrHKQ/kBeip+Mj7Xpnor+ojwNAd2+zRwCzOj+2PqVf5IEtNEDAXBDxR9ss6S8iElslpnDonKjv7YUZsoodhHVQndWNNYYgX3vePJYDQcnOCntyaj0lX3G3XwUrl9uIQOCMg+TKruI49lTuTwILMsGZH3fpq8M9/ZPqwQhaDpuHR3TT93xHkKLZ6/XqmmUV3eGFQzpZeRRjwZSMueJCqn34Tc5fwdGnjxPXdbrYhO6X2bSqZ7t1HM+gYKdMy27wE+A/zM+L+2zEdYrd6UR3JiPpfGHeoeozrn1U32Z1pQuIwLs4TMy2KpWfJWr4qhvbgKIbIR4Ntl1UGElQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeCrEx6uxBpFQnoMQNaF/5FHws6SrBOtz2IWoU8HGnM=;
 b=qTsl4ZaGXFMiFVkAyFJ5hVJ0mmYvX4+J4G5awSaNxtrqatGqTL5Ez5XU6I5MUNX7KKgnZYzRlAcBr5a524ekdgmnfsPLez9lfY/nr5dr/9CKGyZJW1zPpBVrKJwVYMGjJuZtsPFPR0rQb9szQ39LOxTP+wq4mX7Q3P6AC5kflFw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EewzD0sNSGK7hsKBvibS1GMP+AEdkjgL8ToxO5VlMZ/R6YImocQJWdqTWv7VPWCHumzWWJqXFxijai7htVE7GZQQETDOszky700uNqaLhcBXUZYLRg6ne0lkrcbHlRsbV4m16wgAOZ/dm2m710vJBz+wXmhKpnxfmzr3KuI4msYqwhjzRWT5nD2lbUZw8ZDBkBn/igjK/G/pM+/VHKCQoHw7jCeo12p0clvGJrkTRjqnjdDRM1Z/M7dhHc8U1B8s7zzHZi7APVmOyFarghDFBPgbYyO9XpsfH3e5b2YxaZeRFrq9P7YmBqEsaZ95Yvz1jiniVcFwldGG7hX/aoz1LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zeCrEx6uxBpFQnoMQNaF/5FHws6SrBOtz2IWoU8HGnM=;
 b=KmxoIhkdWjTESamg2iRJKDb72lvKz6UObePkMQ4ABT0UE4N6ivZ0QfzDOGv8b7U1Y4oF4KNIKdlodRmsP+lJQla6WSTn6GCU840jIlmkOaJLcurmJ2IQ8lOsejWAbXihKSGF3UuuZAs5bYN5UimcWx8pPYNqA8UkbiRSXs1pqGDFtHopg9FkCT2gohbA09nzoKJvX5FPNKR8Jd86BDg6rkR0pZTHIZV3D9SeZI6ea1hR5bhEdvFN/1rZf39a+WU8Cn/unU1xoajOKnKRqRQ5yIc5YaoCrF44ZpIYATai5eiP0fS84a0/OKZdqHFCIJLPPT2+bKqvCbKn+EY9/uOjNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeCrEx6uxBpFQnoMQNaF/5FHws6SrBOtz2IWoU8HGnM=;
 b=qTsl4ZaGXFMiFVkAyFJ5hVJ0mmYvX4+J4G5awSaNxtrqatGqTL5Ez5XU6I5MUNX7KKgnZYzRlAcBr5a524ekdgmnfsPLez9lfY/nr5dr/9CKGyZJW1zPpBVrKJwVYMGjJuZtsPFPR0rQb9szQ39LOxTP+wq4mX7Q3P6AC5kflFw=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>
Subject: RE: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Topic: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Index:
 AQHY36RSrOIThkYtnEq9RrtWc+uYX64NnUwAgAAAd5CAAA4NgIAAAPkwgAAIMgCAAAAtcA==
Date: Fri, 14 Oct 2022 10:53:12 +0000
Message-ID:
 <AS8PR08MB79919FFC44E975825EE9CB3392249@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221014080917.14980-1-Henry.Wang@arm.com>
 <70670b7c-e87d-9eb7-691f-48c44e9d57db@suse.com>
 <AS8PR08MB79913CFDD2388EA05ADD187D92249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e7e24a21-1ebb-ede0-efed-275bbf503021@xen.org>
 <AS8PR08MB7991B0B2400B1B9D0E6B1C4592249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <db3e4568-edf4-c5c6-4f99-3444a38cc40a@suse.com>
In-Reply-To: <db3e4568-edf4-c5c6-4f99-3444a38cc40a@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C6BEBE2E5341CB41A42D74335C7B4CB4.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB6715:EE_|DBAEUR03FT010:EE_|DU0PR08MB9679:EE_
X-MS-Office365-Filtering-Correlation-Id: ea854d5a-8e49-4b28-6c64-08daadd251d8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MvDhQlPEKCs4SC02tXwejwWGblIQgXEk/deU7wNNHvSUzk3SIo8YWOEdfXz3izd/npdUQq7XnSZEmM8/D0pjV0DZ188zrfyCXJBdmpj6DGAkYT/8DaG75VOZi+G97uek0KETJmf7GZppmCyKNuDKw+ZsgAsvU23nxM3MYt8ugXpsAaO2qLYUZxJbYE98Dk/GuHq+H/9qtab4SULrGZU+pqskdw7OXrW2vtkTppSu6v62WtPgB6wGK86IKcKQruYCrTpFUOOpVuTGKVsNxZ9ez4t0EssjeXpxU6X8Z/INOXenNnbHPGP18PzDf79B+CvYUiVFUjRt+/a0GtSCxpIr1rEMIjV9Qnr9lNF4N4qTlGz7nPxLCNrnzUXYwSnM45OnzgbJixgMDq5OzudK9JDHS7Zcb4TjZr6r+i8GenoFHEMdYpFsCbKQXp9rFyPLw1usrA0MBcZVWKkDd62Y6UJl7TyPWyVOi1Co9MRB109vlpovucqaHPoIfkpHVp2JePETtiuQMRJqlTxMNESVYC+d5ozIB0r5Jmt6/OWolPJot54Ka7p+ftoGZsoHvdueGkZ6pXkGgYnEx8zhkf31kWq2t2422SKkLDPoy5IBSZNVT8QZx83ugds012cTEhryalWCrJokjvPsHeOKC6CbudNHym7oBg+/fjnLI/5wKIJnQoyKTUmJZDkLwr1L9mw+4GXojKhTTVCCyIWR70AYSbcZGf+d5OEnvn2eK2HM1FANo2/0r8bdHJ4yQCD3JokFT3/f2gXdmQDvoXvrTKxRg/7Y1w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(451199015)(76116006)(64756008)(53546011)(66446008)(7696005)(66946007)(83380400001)(66476007)(66556008)(6506007)(33656002)(6916009)(71200400001)(54906003)(86362001)(478600001)(316002)(8676002)(38100700002)(52536014)(38070700005)(5660300002)(2906002)(8936002)(9686003)(4326008)(26005)(55016003)(122000001)(186003)(41300700001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6715
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b1ccef96-821e-42c5-9ee5-08daadd249fa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eheoMpIOlNyP1jSOALvCpysGcaNi2rP3HLuMlrKOINNxEwFzmkPw7unrwTSPb8BZ2hyHFEErq/3TF38uek4k+yR2/9F+E6+6CyL2XIp03xkTdF0MHNPp+i99zSQMHlN2BSlqu3Yz7jlJwlyhnWY45W+Dlt32E9FZSrg82VLpgtMoZJcHpW0tM80PD/p/bK9XdWC4nyRENfkuOzDSscFJTp7tnGrBakww/2M/c2VnacS2eAn0+QVthGrXgmwG++HGGxcH9qNo6n2rWA4s+FLI0pxanC2bAhA9na9pCd2aqcWV+hrg3w0OUMQI7b5X/8OirHx5cwmMBdz+NN/vnOzePDVw3DdzdLNjF1GY1T3g5tN/R6NlZ+4Tc01iFs9g42wKmILepZ1+LLiGZvNdey5yqiJgeg+MDxAaJK46UMNbjpTC0IMhz6qW6dwsduFe7MqSq37Jm64wjlQ91OekIpI4pqZMwh/lTbUhDfoFagH+2KBe9qAEVQTGOaqCVC7LwHnOe8ajNBQbbs0hykGtKaK2Fk1C9iVHBcq6ix/kijFKslSllugX8fHDxvDZOZRR0boYxJkYLDzzCcyYTHcJ8HZB3oRTiwR4EFORy1DYWcOIQmXB9HnXro7b++L8/T5Eei1/BDpTWFPswiIuRg7p7MgMmY/0psOtrdrwZTvNaF/JpdYQfzGgU++tz2BzDj47YZ7VENO/kOxRknhDiUTbp1z9qa8/wQsKSnp1kBHVFL6hTWK2/fXj0xcjIWz3CUY7frKVNbFP/g67+rraHFhdUz2OGQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(26005)(186003)(9686003)(7696005)(6506007)(53546011)(47076005)(36860700001)(83380400001)(336012)(2906002)(5660300002)(40480700001)(55016003)(40460700003)(6862004)(8936002)(54906003)(478600001)(316002)(82310400005)(41300700001)(52536014)(70206006)(4326008)(8676002)(70586007)(33656002)(86362001)(81166007)(82740400003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 10:53:25.4221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea854d5a-8e49-4b28-6c64-08daadd251d8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9679

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0geGVuL2Fy
bTogcDJtOiBQb3B1bGF0ZSBwYWdlcyBmb3IgR0lDdjIgbWFwcGluZyBpbg0KPiBhcmNoX2RvbWFp
bl9jcmVhdGUoKQ0KPiANCj4gT24gMTQuMTAuMjAyMiAxMjozOCwgSGVucnkgV2FuZyB3cm90ZToN
Cj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogSnVsaWVuIEdyYWxs
IDxqdWxpZW5AeGVuLm9yZz4NCj4gPj4+Pj4gKyAgICBpZiAoIGQtPmFyY2gucGFnaW5nLnAybV90
b3RhbF9wYWdlcyAhPSAwICkNCj4gPj4+Pj4gKyAgICB7DQo+ID4+Pj4+ICsgICAgICAgIHNwaW5f
bG9jaygmZC0+YXJjaC5wYWdpbmcubG9jayk7DQo+ID4+Pj4+ICsgICAgICAgIHAybV9zZXRfYWxs
b2NhdGlvbihkLCAwLCBOVUxMKTsNCj4gPj4+Pj4gKyAgICAgICAgc3Bpbl91bmxvY2soJmQtPmFy
Y2gucGFnaW5nLmxvY2spOw0KPiA+Pj4+PiArICAgICAgICBBU1NFUlQoZC0+YXJjaC5wYWdpbmcu
cDJtX3RvdGFsX3BhZ2VzID09IDApOw0KPiA+Pj4+PiArICAgIH0NCj4gPj4+Pg0KPiA+Pj4+IElz
IGl0IGludGVudGlvbmFsIHRvIGxhcmdlbHkgb3Blbi1jb2RlIHAybV90ZWFyZG93bl9hbGxvY2F0
aW9uKCkgaGVyZT8NCj4gPj4+DQo+ID4+PiBZZXMsIEFGQUlDVCBwMm1fdGVhcmRvd25fYWxsb2Nh
dGlvbigpIGlzIHByZWVtcHRpYmxlIGFuZCB3ZSBkb24ndA0KPiB3YW50DQo+ID4+PiBhbnkgcHJl
ZW1wdGlvbiBoZXJlLg0KPiA+Pg0KPiA+PiBMaWtlIEphbiwgSSB3b3VsZCBwcmVmZXIgaWYgd2Ug
Y2FuIGF2b2lkIHRoZSBkdXBsaWNhdGlvbi4gVGhlIGxvb3ANCj4gPj4gc3VnZ2VzdGVkIGJ5IEph
biBzaG91bGQgd29yay4NCj4gPg0KPiA+IEkgYW0gYSBsaXR0bGUgYml0IHdvcnJpZWQgYWJvdXQg
dGhlIC1FTk9NRU0sIGlmIC1FTk9NRU0gaXMNCj4gPiByZXR1cm5lZCBmcm9tIHAybV90ZWFyZG93
bl9hbGxvY2F0aW9uKGQpLCBJIHRoaW5rIHdlIGFyZSBpbg0KPiA+IHRoZSBpbmZpbml0ZSBsb29w
LCBvciBkaWQgSSBtaXNzIHVuZGVyc3Rvb2QgdGhlIGxvb3AgdGhhdCBKYW4gcmVmZXJyZWQNCj4g
PiB0bz8NCj4gDQo+IFdoZXJlIHdvdWxkIC1FTk9NRU0gY29tZSBmcm9tPyBXZSdyZSBmaXJtbHkg
ZnJlZWluZyBtZW1vcnkgaGVyZS4gLQ0KPiBFTk9NRU0NCj4gY2FuIG9ubHkgb2NjdXIgZm9yIGEg
bm9uLXplcm8gMm5kIGFyZ3VtZW50Lg0KDQpNeSBpbml0aWFsIHRob3VnaHQgaXMgdGhlICJlbHNl
IGlmIiBwYXJ0IGluIHAybV9zZXRfYWxsb2NhdGlvbi4gSXQgbWlnaHQgYmUNCndyb25nLiBXb3Vs
ZCB0aGUgY29kZSBiZWxvdyBzZWVtcyBvayB0byB5b3U/DQoNCmludCBlcnI7DQoNCmRvIHsNCiAg
ICBlcnIgPSBwMm1fdGVhcmRvd25fYWxsb2NhdGlvbihkKQ0KfSB3aGlsZSAoIGVyciA9PSAtRVJF
U1RBUlQgKQ0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiBKYW4NCg==

