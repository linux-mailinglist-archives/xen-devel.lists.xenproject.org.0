Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 334F06602A4
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 15:55:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472703.733070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDo7z-0001Cq-BL; Fri, 06 Jan 2023 14:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472703.733070; Fri, 06 Jan 2023 14:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDo7z-00019h-7Z; Fri, 06 Jan 2023 14:55:27 +0000
Received: by outflank-mailman (input) for mailman id 472703;
 Fri, 06 Jan 2023 14:55:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fu4g=5D=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pDo7x-0008RI-Ee
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 14:55:25 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2048.outbound.protection.outlook.com [40.107.15.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 258e20f2-8dd2-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 15:55:23 +0100 (CET)
Received: from AS9PR05CA0282.eurprd05.prod.outlook.com (2603:10a6:20b:492::30)
 by DBAPR08MB5765.eurprd08.prod.outlook.com (2603:10a6:10:1ac::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.9; Fri, 6 Jan
 2023 14:55:20 +0000
Received: from AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:492:cafe::2c) by AS9PR05CA0282.outlook.office365.com
 (2603:10a6:20b:492::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Fri, 6 Jan 2023 14:55:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT041.mail.protection.outlook.com (100.127.140.233) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.17 via Frontend Transport; Fri, 6 Jan 2023 14:55:19 +0000
Received: ("Tessian outbound 0d7b2ab0f13d:v132");
 Fri, 06 Jan 2023 14:55:19 +0000
Received: from 8f9292e1ac63.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7220374F-2E78-4048-A5A1-36C49D8790D3.1; 
 Fri, 06 Jan 2023 14:55:13 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8f9292e1ac63.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 Jan 2023 14:55:13 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB8276.eurprd08.prod.outlook.com (2603:10a6:20b:56e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.9; Fri, 6 Jan
 2023 14:55:11 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%4]) with mapi id 15.20.5986.007; Fri, 6 Jan 2023
 14:55:11 +0000
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
X-Inumbo-ID: 258e20f2-8dd2-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pvb4D82JzYha9OwUYmFkfhpda4iWTVoaQQUM1CakWko=;
 b=zaPCpssBGC6uqfrsAcLDqZm38Jv5/amYx6w0JVnnONXRWT55fpV5RoZqmIrEwUIoMH8bctUJPpLD+9mAZzbcev3iEaG2g7gKCaL/b4kjqVLx0txk8UBdMW6APi3xMOyLW2iOv5iS5WyEVtIBPyJGwze5+T4ABctKaGzIxgh8bns=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OzVdum+7CSjxhKe2Z2G+T37IUNFKTKFriY2iJoxOz6cbxwyHjmkhfJx5d3mfHYlKUxtCx5pkki0/1asrTIXBELbkgN86LAWj9cQnikWlvrfC3Sm3bbYTqzN/qiKiuZB/7THpYZVAa/AhqzQFO+439Z8HCp/o/kyoHLFATvcq+/bOtFBaApnVjw6px75IZjBhyHOzbzgS7sPg0jq7Qld4bzByPsyOeIig4nAe5hUe4kw1gpWuUOeOdjHQd4wy9z9Hsu5SQdVnP/h2n2WwrUe/EKGA8l7Raku/2g++7Brz4BviGb2Lc1+wDOvqPcNQN8bDyvRw9mGh92BOuqHVMseC1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pvb4D82JzYha9OwUYmFkfhpda4iWTVoaQQUM1CakWko=;
 b=KtDvqMcies27SHY2M+lKqeUZmXejBtrtUSvlKnzhkE1LwRig6HXVquxeLavBaOYVYSvldfRsSqz6Wv7xuNwBQNPlG4rjC2bPUlZAWYuZUWKMBptwvaHNPUjoihM2piFRCChfcFTHRZwseuE/0S9HHDSOGCIwD6OtzA65b6AFRZlO00fxJOeOwQBpbxgkYSoYUJTZfAQYtS3boSGALi3k87unzefNr42dxKm9Xt8aN7QPBH5Lntr6jPZJYDmZG3cCtaDs/lLgl2v78F6d3BTPcNE/cXABOy55XoJ5G/ddVHzO/GS65gC/Va9WD//Fd1cKoaj8sM5Kuw4clB4dsB3Djw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pvb4D82JzYha9OwUYmFkfhpda4iWTVoaQQUM1CakWko=;
 b=zaPCpssBGC6uqfrsAcLDqZm38Jv5/amYx6w0JVnnONXRWT55fpV5RoZqmIrEwUIoMH8bctUJPpLD+9mAZzbcev3iEaG2g7gKCaL/b4kjqVLx0txk8UBdMW6APi3xMOyLW2iOv5iS5WyEVtIBPyJGwze5+T4ABctKaGzIxgh8bns=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 22/22] xen/arm64: Allow the admin to enable/disable the
 directmap
Thread-Topic: [PATCH 22/22] xen/arm64: Allow the admin to enable/disable the
 directmap
Thread-Index: AQHZEUh1e0APpjxFfUWN/NZXS3PZ8q6RmKBQ
Date: Fri, 6 Jan 2023 14:55:10 +0000
Message-ID:
 <AS8PR08MB799182CB8FD58DDAFB38228592FB9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-23-julien@xen.org>
In-Reply-To: <20221216114853.8227-23-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A6FB936F6608A0469363276AA3709019.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB8276:EE_|AM7EUR03FT041:EE_|DBAPR08MB5765:EE_
X-MS-Office365-Filtering-Correlation-Id: b46bf93e-0806-4662-5142-08daeff607e1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qtra5IawdtYSHZQGtqyEjs/He7J0Z+2eiRTZMrK+hQYyFUI3AXm8AVFE9PfuWCztjUJGoQ3hOMHXWMaSumbU6bph64nnVfzM6AbBRfWQYfn+/K5PVJkACydbOsjI0/ShPD9iZXI37K+R2ap0cUbTRKV9TzCYe8h8IZzvEV5f0ebg1qJl7W+lWMAmE8oc0WTeC+eXNSeIIJgUUbLwCjtwcZv2eNhIMOK5iD72D+6MUBpk/h3rrTIkYO7/66ATd+MhMO0tdfnENsUjrwFkWt/DMoHVpawKXPpz2mLufuJkk2obh7O7jtM1wLH7WBn13kor7ZSOJYckAoTvVSz3Z106DVtbnZWBNVF+2jv6IARHwALxcTSX8N0aPlyFPcJFnlD0D5avbJJR3kQtRkM6TJIMinIOZm6vPGfsL/Ab0vVQJ7wnGTfAKiQQE0mDqYsVL+kfPxmJIqhArla5pa6HGIlmJv0dui7oqHRBWGRqZSyO3yxnN80igsjp2vObDh5/XbIMsi+oiVS44cKl8UPhxS3uNeikCLQcrYz0y0VIHfzoIJ+p0M5AUMCTMVt+dVNZiXd213d3vhMDtXn2vhZPTmiqeTV1lyOLZE/2glPLdXNQXOLq89bDeMj+KyuZLvrhwLSTRN60soXCgoCmh8Az9Qbu24iYW3ToN+0H7QrYeDbcmY4y1I8wnaZXrkKMmfAMIy0Zw4PqzR75f+fG17cCuFmgRg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(451199015)(9686003)(86362001)(2906002)(316002)(110136005)(186003)(55016003)(38070700005)(54906003)(33656002)(122000001)(6506007)(38100700002)(83380400001)(71200400001)(76116006)(478600001)(64756008)(7696005)(8936002)(8676002)(66556008)(66476007)(52536014)(41300700001)(5660300002)(66446008)(26005)(66946007)(4326008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8276
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2a94f699-ac09-4852-da28-08daeff6028d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uNzPYVJ8DDoYaVm4JDPfmmqUruzP/3TbFdui6aQ3eMLqzRr46E1jxDylHMRATVZxBROCFFixpqC9hoH1DjwlnAhwOVsVCP1Fm9j6/rdA0HMsajXc3eFK46YJzye3re4u1J4EioF8EBIR3YE3j2IsLVBzAp4ARvTe0rbWExVC+XVtiag3sD64JJ9pwaMmbq1pUzntDiaLh1jkSsIMHrcZTUQrsSK89AC8OP6eHJJ0Eb/nI8E+qYZ1w2dDcQE7FOYVOJTp+TvFoElXqqT0odBNVyywjrRfL8Bkq0V13EGIOxFkdtbtRQSdsFx33FvffuGFzSjwMOxv770EJ94i7TLwJVCN6/Xd/vmoxhxouF93CxGuRMT0hklwi7KEKFJpDTjGMyBIjlRdL8Mo6q0zcoepmXQAcPevM8vJeltWcJtIhwcl2CvOAOKUzWKw1VRDUJzaAciUpMMMiczcw5XXpBIAgvbL2PhaROYlNk06YW1EtWQa4k5CZj/daxqIwdHDAh0gu+ZdlemghtL6UxOk9WaPB5ZJmTj55xEbYRIUFZj2vA0XZ2tCr7ltaa3BQEr2VQFMZKjLb25t43PJ2nYiF0NAU6x6ikkL5mgRzeNnWjXkz16ycwequiIEBobm/7XytSQh11ITrXV+YeBw77jk5iHID/+L6akf+5iSslPLgSZULMtrdmZmMIm+dT5eckdolwpGLsSgUgXggC5xLKy5B9YgNQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(136003)(346002)(376002)(396003)(451199015)(46966006)(36840700001)(40470700004)(81166007)(82740400003)(40460700003)(356005)(2906002)(8676002)(70206006)(70586007)(5660300002)(33656002)(86362001)(83380400001)(41300700001)(4326008)(36860700001)(8936002)(478600001)(82310400005)(54906003)(7696005)(336012)(110136005)(316002)(55016003)(52536014)(9686003)(40480700001)(186003)(107886003)(6506007)(26005)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 14:55:19.8921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b46bf93e-0806-4662-5142-08daeff607e1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5765

Hi Julien,

> -----Original Message-----
> Subject: [PATCH 22/22] xen/arm64: Allow the admin to enable/disable the
> directmap
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Implement the same command line option as x86 to enable/disable the
> directmap. By default this is kept enabled.
>=20
> Also modify setup_directmap_mappings() to populate the L0 entries
> related to the directmap area.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>=20
> ----
>     This patch is in an RFC state we need to decide what to do for arm32.
>=20
>     Also, this is moving code that was introduced in this series. So
>     this will need to be fix in the next version (assuming Arm64 will
>     be ready).
>=20
>     This was sent early as PoC to enable secret-free hypervisor
>     on Arm64.
> ---
> @@ -606,16 +613,27 @@ void __init setup_directmap_mappings(unsigned
> long base_mfn,
>      directmap_virt_end =3D XENHEAP_VIRT_START + nr_mfns * PAGE_SIZE;
>  }
>  #else /* CONFIG_ARM_64 */
> -/* Map the region in the directmap area. */
> +/*
> + * This either populate a valid fdirect map, or allocates empty L1 table=
s

I guess this is a typo: s/fdirect/direct/ ?

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

