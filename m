Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2A45AA62A
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 05:07:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397214.637707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTx1u-00009C-SE; Fri, 02 Sep 2022 03:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397214.637707; Fri, 02 Sep 2022 03:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTx1u-00006N-NN; Fri, 02 Sep 2022 03:07:38 +0000
Received: by outflank-mailman (input) for mailman id 397214;
 Fri, 02 Sep 2022 03:07:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UH2R=ZF=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oTx1s-00006H-Ll
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 03:07:36 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2045.outbound.protection.outlook.com [40.107.22.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64875f15-2a6c-11ed-82f2-63bd783d45fa;
 Fri, 02 Sep 2022 05:07:35 +0200 (CEST)
Received: from DB8PR04CA0027.eurprd04.prod.outlook.com (2603:10a6:10:110::37)
 by VE1PR08MB5821.eurprd08.prod.outlook.com (2603:10a6:800:1b2::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Fri, 2 Sep
 2022 03:07:31 +0000
Received: from DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::73) by DB8PR04CA0027.outlook.office365.com
 (2603:10a6:10:110::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15 via Frontend
 Transport; Fri, 2 Sep 2022 03:07:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT042.mail.protection.outlook.com (100.127.142.143) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 03:07:31 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Fri, 02 Sep 2022 03:07:31 +0000
Received: from 6a6eac66f970.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 664555D0-A67E-4FFB-B46B-86BE1885F15A.1; 
 Fri, 02 Sep 2022 03:07:20 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6a6eac66f970.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Sep 2022 03:07:20 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB9PR08MB8289.eurprd08.prod.outlook.com (2603:10a6:10:3df::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 2 Sep
 2022 03:07:19 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::5d27:806b:5d1f:f63]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::5d27:806b:5d1f:f63%2]) with mapi id 15.20.5588.011; Fri, 2 Sep 2022
 03:07:19 +0000
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
X-Inumbo-ID: 64875f15-2a6c-11ed-82f2-63bd783d45fa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=n6CvM+eRpKSXCVZfG2KQQGm928BlW+PwNosYnhyYndjaoiljlZLWJDM39U/48hmvxjvF8BTZNeHi8Rcmq1h5jsnikK6mj+wbwZu0ueRQSu3kP7g57P7j5P6hIT6R9DwC+9wCl2rbCSqQmM03D9+oweahwQOtfMzuGNVMkZxEJm6ztjvkm4Flc3o261BGnihA7SUA8wtX4io/nybh5wTF96VXR39E/RWeCBDMdvjdGpQp4ebnGj2Uceg3q8+Y8iyXZfK2mFf6Ma93vuKf19xL5C3mrB7+34Yn53sWAgP2MoENRSgTPI3ziaf1lwyuJ8rdd207BYQo7IiPmyt6QgxJ6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4Dymhsu7LGon53cRf6RwyPQomTyik1zHLqeRrrtoGk=;
 b=OhyF8zK5tmtS4klxDrXFdR4FQFztFlTAHTET1jeQZ9+jLYY4vONiLl/nU06H0N7jC1EmNGvkXpP7e89iOOnVxgZ7+MSO1UzkTR2jhsjoDPvpBZrQKwbmqpZJHrAeyMoGbmdSyx6zRczvnqC6ZwmcH6cX3yufIoBDN5xzlKfZTMR0i7T080krj786ftQ2L8jBGc8xSTJLYC11Z/AG3zNuyiQ8asSxsyn+m2lZjXuNb0zZnKIrwJpUv7INFfoJs1NyzTeZtYnCJ/Bzrijp0nl+pvUfSs/eUBWA6L149Nzd3AnojvS86jhhcCUCovNHONIAbGRGToV75X08RxIqjWtdeg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4Dymhsu7LGon53cRf6RwyPQomTyik1zHLqeRrrtoGk=;
 b=dCz49n43cEUI4Rz1va5mjSfRzCKhddiqTvm0Ojo99cIHcafTJDUTunYLfWRLUo1/vmMUdavWPGHPnY1g75xZyXEdZmNobp/LisZRCewgBoojXlG7QXe+d39c2PzNPRO3dF6dgMHrVMv0cyRUTsMZsIT/DBjQGr0PJa/bwuAaGpQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7xve+M3MFuJpCAqWvZmtTM5cK7whB16EMb4IPkJyIPKFL8A+vNB79/SCx8qLotLsjxFWYc5WIu+jnqJQl7hApEbgRx/bdijIjRiAyA4dk6aVGy6/LpXcoS6nAdzX3CbRBKb0vyDa72+uGyhqo42ab4qktF7s5GCveEnncJUoa1plCkpTha3GMD82fiFqx2RLktzQIFSkbfOY2bGG48p4yrefmuR4tz81uQOgZ2Dh7gh4OvTltnBMktjWW/Dp6g1s1Z33y7g+vo/bfc+kQnejNQCscyDGPJb+xv6LdAXda0lIWuMAZ+GgugG2p76O2LYa/+qxYbk5bH9t2BMZyDo4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4Dymhsu7LGon53cRf6RwyPQomTyik1zHLqeRrrtoGk=;
 b=KRWB+frtcBWRvVlAqjQnr81nmae884sZQugK6Gr9BTEMum9HQaEwos+w4Wy4UH+a29aowLM0boYt7lyzPdTtQu1vjeVXOrOGJEGEF3OXG+D1j41N+KkQrBErKvTPCuRExmUrSapzD1Db0bPHUkYxoP1/ISQUDmDCciuxwf90gIds+280XzDBAspEaDr76PFZO/0eJkXb2FyHkOk+7smVhE5DFMEeSG07VkomtBKJI8Le9+4giOhwpD+UTInyQfBh8oFxtDR6M78c7sehzez7QzotY2ssQrAFMddVPFMer/sTEWPFKzn5NwljxUdel4Gri3oUTNSkhwKf9O2M55Ad+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4Dymhsu7LGon53cRf6RwyPQomTyik1zHLqeRrrtoGk=;
 b=dCz49n43cEUI4Rz1va5mjSfRzCKhddiqTvm0Ojo99cIHcafTJDUTunYLfWRLUo1/vmMUdavWPGHPnY1g75xZyXEdZmNobp/LisZRCewgBoojXlG7QXe+d39c2PzNPRO3dF6dgMHrVMv0cyRUTsMZsIT/DBjQGr0PJa/bwuAaGpQ=
From: Wei Chen <Wei.Chen@arm.com>
To: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
CC: Henry Wang <Henry.Wang@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Topic: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Index:
 AQHYt4ugxTCtO4LgrkGJKD3tY8acia3KwCgAgAAJ8YCAABHIAIAABy8AgACKuYCAAA6DsIAABhiw
Date: Fri, 2 Sep 2022 03:07:19 +0000
Message-ID:
 <PAXPR08MB74206D3DB72C207F1E2EC2739E7A9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-3-Henry.Wang@arm.com>
 <50bc7ce9-dc98-127b-d0db-40bf82929fc7@xen.org>
 <AS8PR08MB79913A96E64B31A02C985EB5927B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2209011003570.2375071@ubuntu-linux-20-04-desktop>
 <fc0706f6-7635-6b0d-811a-c3ed41f481fc@xen.org>
 <alpine.DEB.2.22.394.2209011849040.3931@ubuntu-linux-20-04-desktop>
 <PAXPR08MB74203A415B8F56B83B20B7739E7A9@PAXPR08MB7420.eurprd08.prod.outlook.com>
In-Reply-To:
 <PAXPR08MB74203A415B8F56B83B20B7739E7A9@PAXPR08MB7420.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4F331DF260D8AF4483BC9C2AA766D366.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1a983f6b-eea1-4a83-e707-08da8c904678
x-ms-traffictypediagnostic:
	DB9PR08MB8289:EE_|DBAEUR03FT042:EE_|VE1PR08MB5821:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 p6QK5/0dPBTjpUHN4Viaagp8NllUZOljhdz/dsTKRc9lBTClKFexeijXc1bNBqhrrnwvhXBsmzVJKc8I0JcrBFZriVmIFgmU5bpjiSNsEfkKLNlBLcJGyIJXtoVKG9Hiqi0dEychr/ERx3fx+6M4d9ciHrqMVbu78Mr8MnLf1jyG+mU9yYG1dr5ZV/EI+5UeeY3t9tBTJ0aZtvdSV/fyzytUrs7939jdfBfBP0IQI5O4Vrpna4r4l37z/+gU0INv1Cz+q20cu3AxLuBv7/hG7WYOP8OfU0IzW4mFLEpJXcfONvzpA4y4wC1KIT+v/OAx5NZ5uLIpZMrYDlmXVMnezh4z/Us+jW92NpA/r9LUB6cuD6z415KE4jF53psl3U8tnWni18qSPl21f+5l6OVQXdqiNlqSGRIxcUMJnvgxOMrExJ06fxaIgvRMfJCerz94oGFu1QlfU22afmtzITUHWDY/HZV98vlqxjC3OVFXILx+DAGVFQAeVVB6jKX7Tv8HQq7kcV8B5Rmn+tNjlZdAwDdfuPlA30Lzbd/IjC2Mh73yH+D3Jx6eO3TMBM/1SMPiYQ0utC4U93MvHrIPaK670n4uZ30lOdhT5NqMLkv9AqjDNB8jLs6HVe7W+rcINlXQGDUQZlgSXPMY4E6bAC6UKwGCdXDeDV2cQ1ZHtk8P43Nhk5Pt9CgqtFQd6FejegRyGv0ZMtWyTougouR2lwBDLqZjdDEfJ8wS2mRtdL9T2SqVQ6CMSRntOnW5KUYM5qSp/+O8Z/C2DoV5NKoXUPB5Og==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(66476007)(2906002)(52536014)(38100700002)(83380400001)(4744005)(8936002)(316002)(186003)(478600001)(5660300002)(8676002)(4326008)(64756008)(71200400001)(53546011)(2940100002)(54906003)(41300700001)(110136005)(66556008)(122000001)(76116006)(6506007)(9686003)(7696005)(33656002)(66946007)(86362001)(38070700005)(66446008)(55016003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8289
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	35fc76c1-988f-4034-4e78-08da8c903f9a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d7GR5YzCa+/oPZaMAYLrK+1Kwe7r+jIqVj74TljRB/exGOHBZqrNrHZ8koQQERzkgF4bbeAF+yxKBsSVAc/iGjTZtQKvOMZjJS0guxwayWFFaX7hEAJJCqz9dH1SWsRio8F/RqouNou4V25g0typJhwQNau+CPWjEQrHw2A8u6JuOM3kaGU+UnXf2nJ/LNb9RtHzR//jDntpcsuJTYiVGzKG00S7DuoBx8gZH6D5WQFfQD9c+eMkonB10iuH5lOm4sjUK5/gtuqrVupaMmwi4vK/43B5x3ktXutsGL/ggYAJVAtc9PZXpX46M1NfepqPDqJOKYYQHIW4DDioL9POq57GDl+uOcOzGj8aql9WnK5ZCyozInoSjsRyaI3WMnuxJ7DfsdTAwh0aMS1Ma6Nzvfws5hZ36U7TbxZF/5k90jSfoKW4RqmMezErDh23yI3+z1ZpWVVJ5Pant6pvkFkw/2vHp8xggEJ0j7UFPQVPbO116TE0dscEs4ASw6vdjeGF/6jYPm8BWs4EpsQD1EpazwtF43xm8+JoA7k8CDP9x1V43mJ4JKr7zVTmGZtPpt0PYcd27RhhkeyfQ3l6Q2JgAhJXI7xUBLkjIaS8kZxV0CC9EmAH1en/NOpjgAwzc1MhzFDFjMUwUgCbq9d4wrR35y3s+JNfR7S6GILIexmdMltMgRhy0c/xznT9VX/NjPqzjY88Wj9jnYxyv9KehiJ0crpDTyNjkwc32iRg3HIsTVZ4rYhq4VnqRWTcFMG2TKmgjewBlrCsOkyAWkOnOGgXZA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(39860400002)(396003)(36840700001)(46966006)(40470700004)(5660300002)(8936002)(41300700001)(55016003)(70206006)(70586007)(4326008)(52536014)(82740400003)(33656002)(40480700001)(8676002)(83380400001)(7696005)(86362001)(81166007)(186003)(6506007)(107886003)(9686003)(336012)(356005)(53546011)(40460700003)(2906002)(26005)(2940100002)(54906003)(110136005)(36860700001)(478600001)(47076005)(316002)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 03:07:31.1698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a983f6b-eea1-4a83-e707-08da8c904678
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5821

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWGVuLWRldmVsIDx4ZW4t
ZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIFdlaQ0KPiBD
aGVuDQo+IFNlbnQ6IDIwMjLE6jnUwjLI1SAxMTowMw0KPiBUbzogU3RlZmFubyBTdGFiZWxsaW5p
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgSnVsaWVuIEdyYWxsDQo+IDxqdWxpZW5AeGVuLm9y
Zz4NCj4gQ2M6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZzsNCj4gQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bh
cm0uY29tPjsgVm9sb2R5bXlyIEJhYmNodWsNCj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29t
Pg0KPiBTdWJqZWN0OiBSRTogW1BBVENIIDIvMl0geGVuL2FybTogSGFuZGxlIHJlc2VydmVkIGhl
YXAgcGFnZXMgaW4gYm9vdCBhbmQNCj4gaGVhcCBhbGxvY2F0b3INCj4gDQo+IEhpIEp1bGllbiBh
bmQgU3RlZmFubywNCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9t
OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+ID4gU2VudDog
MjAyMsTqOdTCMsjVIDk6NTENCj4gPiBUbzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4N
Cj4gPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgSGVu
cnkgV2FuZw0KPiA+IDxIZW5yeS5XYW5nQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc7IEJlcnRyYW5kIE1hcnF1aXMNCj4gPiA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29t
PjsgV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBWb2xvZHlteXINCj4gQmFiY2h1aw0KPiA+
IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4NCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDIv
Ml0geGVuL2FybTogSGFuZGxlIHJlc2VydmVkIGhlYXAgcGFnZXMgaW4gYm9vdCBhbmQNCj4gPiBo
ZWFwIGFsbG9jYXRvcg0KPiA+DQo+ID4gT24gVGh1LCAxIFNlcCAyMDIyLCBKdWxpZW4gR3JhbGwg
d3JvdGU6DQo+ID4gPiBIaSBTdGVmYW5vLA0KPiA+DQo+IA0KPiA+IEluIGFueSBjYXNlLCBJIHRo
aW5rIHdlIGNhbiBwb3N0cG9uZSB0byBhZnRlciB0aGUgcmVsZWFzZS4NCg0KTWF5YmUgd2UgY2Fu
IGFkZCBzb21lIG5vdGVzIHRvIHNheSB0aGF0IHRoaXMgZmVhdHVyZSBpcyBzdGlsbA0KZXhwZXJp
bWVudGFsIGluIEVGSSArIERUUyBib290Pw0KDQpDaGVlcnMsDQpXZWkgQ2hlbg0KDQoNCg0K

