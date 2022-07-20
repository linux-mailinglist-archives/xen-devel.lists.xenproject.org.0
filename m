Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E62657B441
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 12:00:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371474.603411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE6UV-00041y-Gb; Wed, 20 Jul 2022 09:59:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371474.603411; Wed, 20 Jul 2022 09:59:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE6UV-0003yW-Df; Wed, 20 Jul 2022 09:59:39 +0000
Received: by outflank-mailman (input) for mailman id 371474;
 Wed, 20 Jul 2022 09:59:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M0/z=XZ=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oE6UU-0003yQ-4A
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 09:59:38 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140043.outbound.protection.outlook.com [40.107.14.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a760480e-0812-11ed-bd2d-47488cf2e6aa;
 Wed, 20 Jul 2022 11:59:35 +0200 (CEST)
Received: from AS8PR04CA0016.eurprd04.prod.outlook.com (2603:10a6:20b:310::21)
 by AS8PR08MB7338.eurprd08.prod.outlook.com (2603:10a6:20b:445::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.13; Wed, 20 Jul
 2022 09:59:30 +0000
Received: from AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::c8) by AS8PR04CA0016.outlook.office365.com
 (2603:10a6:20b:310::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.25 via Frontend
 Transport; Wed, 20 Jul 2022 09:59:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT041.mail.protection.outlook.com (10.152.17.186) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Wed, 20 Jul 2022 09:59:30 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Wed, 20 Jul 2022 09:59:29 +0000
Received: from 0ef1267f4c57.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BE1E66FA-7869-47D6-8E58-9118F2983DAA.1; 
 Wed, 20 Jul 2022 09:59:19 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0ef1267f4c57.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 20 Jul 2022 09:59:19 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by HE1PR0801MB1659.eurprd08.prod.outlook.com (2603:10a6:3:86::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Wed, 20 Jul
 2022 09:59:16 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7%9]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 09:59:15 +0000
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
X-Inumbo-ID: a760480e-0812-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=oWm3KOALTp/mXxN68prjgnE6iWWLc6dfTQKZKKTYsDZJ5UuaObjabE1vjkS8/CCI9+X/Svoz2VE22KQO1xgELvt+Leyb8iNiJN/HbUf9d/wSBgm4h9+02g1I+SbMOcxg2/DZDNLdBUKMJPIZK7FjKvNkwf2H3Y68Pgh/aamX1NG9DtVY+nzz+560RdmQZr6qOkdZK/jKX/EFBkwuubiOX9jH2H0+C785+tH8jlYcOmluUdUlJkpZy9PAVCAyRZA/2Ag3huD7MWFbbBljbLp0xXIlU7/YvdK2zQKQ3lEWmthDw1ZmbVZgQDtwIEr2DoAUMfs7t9r+fOPeX2X+bRk1Hw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=waZRSNbw2JIFtxSxpSxziJAbnbk5G9weqWK6chagXzg=;
 b=PLlclkh5uIR8eoaWOZhpoUGD3IMoFNbK02o81geLEOM44GkJW7HKzn56IUgkXDMmB2VqRXh+IcwR7JHGyeg4HS65/3CtEVz4rIwZnI2+ZnoNVokKgCDCgNtcSLdMOfzDmlpDzpl0dddAfyDbuzRLPq4AOwyiW7kkojJdtd+51A8jLCJtBWRt+XHkWqatatN1rzLriYBajw4H7Uz0YeDs1ZwPG6rJPxpiiArGDnqzX2v7+Q0u82Wgz2mJt1sY1z13dfjHwB90Q1RJcVh3H0wRk4IjIbmutm2RKpfbRG3KDUXuWgr8Gnl8mGeToi00bSsqOpCMo8r+ZFKHBzgZDY9l7g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=waZRSNbw2JIFtxSxpSxziJAbnbk5G9weqWK6chagXzg=;
 b=7EkV658C2R2B+zXpWyILRITDWxohUvyp8JUNkYxjkKmsZnrMVjxKSnV80RbxT9PzZdimqlzuDkV8XaiwLLylJ5+YExRwlqFsw1N7uivcBbQgi073KH1hlCx3/uo3amyJ8eQoep/0GSECvRhmOgzYCO2OPx94xNuPk3bofLiF0gY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8ea63d52ae289603
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EsPdQiTNzXTTT+ABA8OiXot21wlLZ++k6Ofc8tx82FoV305T71zjUGAcx0YXLfvKB9ofzslLqOaBvMOhQEYQAf01P0hReARN6XpkUqXGAQneuklzGRFEPOmkh9gDNG3kjdxkAWKdlPG/XuZjVzCtFb2UEDubJSmOCnHb5OBV4/uSaJF5f1+UIzq35wrRRiaHxP05AjuLuOPXOd9P7xoTJ4Y7sAaG4b9ocEL1iB+IxQBLdPWYXs8LUWOx63HOYCsXUC0GqRJGGlecYDOcxiCsjaG3zKUp8ZhaLwSal/bAnUWSWfK58MXI4HVi9hi5yBJOyRSOsuIgPtjnnL2TT8a5QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=waZRSNbw2JIFtxSxpSxziJAbnbk5G9weqWK6chagXzg=;
 b=ADNXXo7YeceUFqRQ6E334Hb7jEru9grVN9cGsDyh2dAI2vEkmcyWMHx2BdFoxI16MeQ3+Snj7BpUBFBNZMQgFoX4iPHX3JFlEjSrzyjD8k25bCHa669HNzEMgQ8GH2G/+JPmsTWglUzdefRYGO+TiYSXe4E3t4veOurpeDK7LYH5SSsJCkeOStilIXfyLOsQx0Oi+wOiPDGxoSzpnHOwQnK+C4+Oxsv8G2vfkYCQvgDd66kJzT8tSkA7822YqUoxPTLI/wpiPTc3eXq/NX/YwHg5Y6HRY/snniwyAfVQJK3TlxxwIuNBl8lwtWC52c39NOhb4Q0JyCcPrAB7VKKnrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=waZRSNbw2JIFtxSxpSxziJAbnbk5G9weqWK6chagXzg=;
 b=7EkV658C2R2B+zXpWyILRITDWxohUvyp8JUNkYxjkKmsZnrMVjxKSnV80RbxT9PzZdimqlzuDkV8XaiwLLylJ5+YExRwlqFsw1N7uivcBbQgi073KH1hlCx3/uo3amyJ8eQoep/0GSECvRhmOgzYCO2OPx94xNuPk3bofLiF0gY=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich
	<jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/8] xen/evtchn: modify evtchn_alloc_unbound to allocate
 specified port
Thread-Topic: [PATCH 2/8] xen/evtchn: modify evtchn_alloc_unbound to allocate
 specified port
Thread-Index:
 AQHYhkXaSSR0QDc2DUiowhnmyNd/Sq1bgqiAgB3xuACAAai8gIAA1/CAgAA2U4CAAAT8AIAABuwAgAAKeYCAAAnjAIAAC4AAgAAEsgCACtZcgA==
Date: Wed, 20 Jul 2022 09:59:15 +0000
Message-ID: <BB3ECBA1-A028-44A0-A6BB-5D6BD009C095@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <5ea66595248c41a011ac465bfabd7a7a40dcd565.1655903088.git.rahul.singh@arm.com>
 <2cdde2eb-33ac-568b-a0ae-b819b7b4161b@xen.org>
 <1494EC8C-9916-472F-9285-57C0FF656919@arm.com>
 <abcf96b0-1c41-476a-de08-adb3eaaaa05d@xen.org>
 <addaeb82-2d15-a46e-f9f9-274572d2ddc2@suse.com>
 <9711c08f-7e16-daf3-f010-1e6a53b0b9a0@xen.org>
 <5f200481-ed3c-a463-90aa-3718c0ab57a3@suse.com>
 <758779b3-ef39-aa95-15c9-9b84b952e80b@xen.org>
 <3b42f9ab-383c-694c-cef0-5d24531e556a@suse.com>
 <019c5cb4-7e6a-d822-3c02-e3199d499106@xen.org>
 <93E40C29-DD1E-4C9B-936B-45ACA69BBD66@arm.com>
 <d868fab2-c55a-7e2c-cd54-6dc3eedbbf26@xen.org>
In-Reply-To: <d868fab2-c55a-7e2c-cd54-6dc3eedbbf26@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 5e7ba93b-588d-421d-ad3b-08da6a3689fa
x-ms-traffictypediagnostic:
	HE1PR0801MB1659:EE_|AM5EUR03FT041:EE_|AS8PR08MB7338:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Rf8rSjZILAI18uEuT3srC+1FpnlwcuQw/b/9tjqQ5x8uVkJRg81Da+jkbx7kOmrA6HX5WixFtwTqkzFaBgK0TpYd1I2Mj8ORf5KXK6RqEaw/sbv8DBRkqN8zo/pmGpHVCr5mfaOEpJXDVWLKfMvPn2jVr8fXLkv05RvhTUH/hbpjEZmQ7ct6nQgj1xTxOYOe+vwWxWr7m8EMNVjQShLZZGzp9liiB/zy2WYfR19LUn67NIlFV8spm1GJQB8K/1CpyJRlqm7/obciykFPlAZRi0nq1HjD3z7ZB212RsygTEZUOw1NyVf9Au5vX82BIMvAvgRdIWSfJEl/00FB/9F07cncdzQXDif0fEu8D8Jf+JOPHjVTRA5jB/3a8UMlI2rElAE7fdUgSe//TZvM1m1XfRvrccMbXU3tFUh9C0nsjeRu3MXFJxtHEekrSJJz46NaZlBeqBM3pF32UiaZi5YA8SN9FU+Wzs3yDiVAFaX7XwzuP9XEkm1kMjAIvc95Vg7srFMtQdiUeFuuSjW7axEICqsX1PPdZvnOnzSw6jDkOtkcbmm5CHiNYCTiTKw95X3KXDijHsjD0o6nA7GRfxFkVta1PO6oP+4WsFZuaGFdZxW5d6QWKtxvvkV3P7Jf9L9t3iIzuY4jdMyyFXUwi6G3jetgegPfcpGdc1u8NsEQsHXA2Iitv+ouA2LCGQ1SZKxZp9KibX+AUMeL96oNUUECPOPIZk8welY43QyROPxWDkOiKmoETvz+rr+VlbcJD1c73vKc1S9vMoy/rLuXTbrfxXY5cVchnwpQDilps/ty8QdHZTUKAy41P6DoaEW49m4G9ljxX66r6W6Cv0/q3LifPg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(66476007)(8936002)(64756008)(66946007)(5660300002)(4326008)(66556008)(33656002)(76116006)(2616005)(66446008)(36756003)(2906002)(8676002)(38100700002)(53546011)(41300700001)(86362001)(478600001)(71200400001)(38070700005)(122000001)(91956017)(6512007)(6916009)(6506007)(83380400001)(186003)(54906003)(316002)(26005)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <ACCE292BE700514BBA0F9140CE58F7E0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1659
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	587dafac-2133-4c52-b3fd-08da6a36817d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K+49hf44WX1RIbAlEbK9XmJPZ1bY9WuDTbQBN83cwpNLiVRFKxB5zV//1vjda8EcTNzUnreU7Jtn1dKRJoIB/ZhZ1yOU52WrarK+2GABQDsytQjv3bgtxwg3+CUynm/3zFTExjt2ZuK+8kwWbLlH9caR32LiKZwXCw7/4a0EVFuuJgJ7SIsRGaU/4Qbx4QLfx5MfrpfFS3NSuGVGYAbgue0/BevgAN1Eyy5g/hvsyx0a5i+srPeasmjNLZY9ocQZw8nfI4r46tfRSh6Pefjd5IRyNMqRH2SfNRIOOvkOuBOCgMaT/2z5o5A96G2i6fC/x41PG+v2m8vHhu/iw53AQ8giJDdHBgrkLT9rmB0p7h3lm7LPKc4IZGSMnPVf0doH/eAEtdmsi2XtTKtg2iQVjm/Hy7C2ZvvFgfJ4v2JedtWllJKUHeVETcxbywjH/jyR+RVAKxJSeZRmcgitzwPSWi+BIfltSVGveQ68dt0pKhu1TGzj8dySV5q5JabdiPDHiu6nHsoOkPacEcHoJ3W9WpQsm0sUV0ODw21/X66HVFYEDWp0A4IUn3Nw9egRQgiWYPYHHzsiurV/YvCNl0++y56SEWzKhbs2L9nfJBidYJGmD/u2Zq56Ckst737YzyAR0A1ir3xJWFn7xymHZkYUHs2mgyNmkowkQYVTCf9kQFe0dP07bLZ7/ErFrm2OirEirXPr0AviOl3T88bUf3ykZNXH51snuuzD9TqAIV3dYLSAmMP3j5QloybSH5Y9QbW0L88m2ngbNFFyqZSSw16wTbL8HXikFojRpbQa5Qj6IB7ezfqMUO/WTeMfrKtA6e6b
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(396003)(39860400002)(40470700004)(36840700001)(46966006)(2906002)(83380400001)(2616005)(40480700001)(47076005)(356005)(336012)(4326008)(36756003)(8676002)(186003)(316002)(70586007)(70206006)(54906003)(33656002)(26005)(8936002)(478600001)(6862004)(53546011)(6506007)(41300700001)(40460700003)(6512007)(5660300002)(6486002)(86362001)(82740400003)(82310400005)(81166007)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 09:59:30.1377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7ba93b-588d-421d-ad3b-08da6a3689fa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7338

Hi ,

> On 13 Jul 2022, at 1:29 pm, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 13/07/2022 13:12, Bertrand Marquis wrote:
>>> On 13 Jul 2022, at 12:31, Julien Grall <julien@xen.org> wrote:
>>>> I can't
>>>> see why it would be wrong to have a more tight limit on static ports
>>>> than on traditional ("dynamic") ones. Even if only to make sure so
>>>> many dynamic ones are left.
>>>=20
>>> This is similar to Xen forbidding to close a static port: it is not the=
 hypervisor business to check that there are enough event channel ports fre=
ed for dynamic allocation.
>> On other side we need to be cautious not to add too much complexity in t=
he code by trying to make things always magically work.
>> If you want Xen to be accessible to non expert by magically working all =
the time, there would be a lot of work to do.
>=20
> It is not clear to me whether you are referring to a developper or admin =
here.
>=20
> On the admin side, we need to make sure they have an easy way to configur=
e event channels. One knob is always going to easier than two knobs.
>=20
> On the developper side, this could be resolved by better documentation in=
 the code/interface.
>=20
> Cheers,

To conclude the discussion, If everyone agree I will add the below patch or=
 similar in the next version to restrict the
max number of evtchn supported as suggested.


diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 532e50e321..a8c5825a4f 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3422,7 +3422,7 @@ void __init create_domUs(void)
         struct xen_domctl_createdomain d_cfg =3D {
             .arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE,
             .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
-            .max_evtchn_port =3D -1,
+            .max_evtchn_port =3D MAX_EVTCHNS_PORT,
             .max_grant_frames =3D -1,
             .max_maptrack_frames =3D -1,
             .grant_opts =3D XEN_DOMCTL_GRANT_version(opt_gnttab_max_versio=
n),
@@ -3582,7 +3582,7 @@ void __init create_dom0(void)
     struct domain *dom0;
     struct xen_domctl_createdomain dom0_cfg =3D {
         .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
-        .max_evtchn_port =3D -1,
+        .max_evtchn_port =3D MAX_EVTCHNS_PORT,
         .max_grant_frames =3D gnttab_dom0_frames(),
         .max_maptrack_frames =3D -1,
         .grant_opts =3D XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index f08b07b8de..b1f95fbe1a 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -763,7 +763,7 @@ static struct domain *__init create_dom0(const module_t=
 *image,
 {
     struct xen_domctl_createdomain dom0_cfg =3D {
         .flags =3D IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity =
: 0,
-        .max_evtchn_port =3D -1,
+        .max_evtchn_port =3D MAX_EVTCHNS_PORT,
         .max_grant_frames =3D -1,
         .max_maptrack_frames =3D -1,
         .grant_opts =3D XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index d6c029020f..783359f733 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -76,6 +76,8 @@ extern domid_t hardware_domid;
 /* Maximum number of event channels for any ABI. */
 #define MAX_NR_EVTCHNS MAX(EVTCHN_2L_NR_CHANNELS, EVTCHN_FIFO_NR_CHANNELS)
=20
+#define MAX_EVTCHNS_PORT 4096
+
 #define EVTCHNS_PER_BUCKET (PAGE_SIZE / next_power_of_2(sizeof(struct evtc=
hn)))
 #define EVTCHNS_PER_GROUP  (BUCKETS_PER_GROUP * EVTCHNS_PER_BUCKET)
 #define NR_EVTCHN_GROUPS   DIV_ROUND_UP(MAX_NR_EVTCHNS, EVTCHNS_PER_GROUP

Regards,
Rahul=

