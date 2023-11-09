Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B17757E6D7C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 16:35:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629725.982095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1732-0007PR-P1; Thu, 09 Nov 2023 15:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629725.982095; Thu, 09 Nov 2023 15:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1732-0007Ng-MR; Thu, 09 Nov 2023 15:34:24 +0000
Received: by outflank-mailman (input) for mailman id 629725;
 Thu, 09 Nov 2023 15:34:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T6cS=GW=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r1731-0007Na-QS
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 15:34:23 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062b.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74026ef3-7f15-11ee-9b0e-b553b5be7939;
 Thu, 09 Nov 2023 16:34:21 +0100 (CET)
Received: from AS9PR01CA0041.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:542::15) by AS8PR08MB6502.eurprd08.prod.outlook.com
 (2603:10a6:20b:335::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 15:34:19 +0000
Received: from AM3PEPF0000A799.eurprd04.prod.outlook.com
 (2603:10a6:20b:542:cafe::ad) by AS9PR01CA0041.outlook.office365.com
 (2603:10a6:20b:542::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19 via Frontend
 Transport; Thu, 9 Nov 2023 15:34:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A799.mail.protection.outlook.com (10.167.16.104) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.16 via Frontend Transport; Thu, 9 Nov 2023 15:34:17 +0000
Received: ("Tessian outbound 20615a7e7970:v228");
 Thu, 09 Nov 2023 15:34:17 +0000
Received: from bb318f0b44e7.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F076043C-6D0B-4D80-AD73-73806E012614.1; 
 Thu, 09 Nov 2023 15:34:10 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bb318f0b44e7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 09 Nov 2023 15:34:10 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DBBPR08MB5996.eurprd08.prod.outlook.com (2603:10a6:10:201::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Thu, 9 Nov
 2023 15:34:08 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::76e6:a7e1:1592:866]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::76e6:a7e1:1592:866%3]) with mapi id 15.20.6954.028; Thu, 9 Nov 2023
 15:34:08 +0000
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
X-Inumbo-ID: 74026ef3-7f15-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=YWnosif68JtEfxYFdPtqctzVSvgdCMLu9AvkqI0651Ldp3lwMzVdk9Coe+MCPvObDdccwpkqMX2pHVXJ5NqLIqGfPHGy5Ubp2KCdwJtWv3UEbnrjzbpbotKGpXtCrQcaT+80Y6PNmrmOWKU9Y0sLcLPugYHBLZ79p2D4rPhGdIbv4Ww5tW00aEgemCFHN1PofmhhON3uY0BhgoJzX5KlQKiDWSNJWrpSpO3chucgOF5j1Ujs47rsFa7NRhb+EfqPxyoS+xUXD6Enk4dIOU6bYL4cp4lSByzreCjqAl6XkIuquVtP4aCZ7JxQQPVIVLzh/piY6XaVOUIZmedotCpiBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3eXTsVsY4QZ48T4C22IeeOy/fXf/zPA1j8gxc0ySaQ=;
 b=nZE7ZvCjLLD1kXokFWs+b7hkTGqVsFGs1GYzNChw1VZjJV8eUu3M16fnhCSpEttfEorAdS0vEyAvebV3KjGcDVE3/iaVHqxTZ+kFR+5/41e3XMKkyrH40IOfnm2J2ln8akoehXKdEk7oapEfYFFnWssOXq38+UQEWqeXrFItR27MYIhazTWb07vi14t1mUzVKyrGfy3zMdWZFjnfjFYN+q/TVZPh+e3+81QKRcT2pQxh3O/e4VcBZDtP0DavEzKzzP1FSlWemoUkdpqI7lFtBlX8/d4+u3+d2viG43ryNQQowCJ4VhK+Ij01jmKxRYyI0OTc23d5bXkeooEIjh7UuQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3eXTsVsY4QZ48T4C22IeeOy/fXf/zPA1j8gxc0ySaQ=;
 b=Vmc7LFd8Od5Zp7Mq/QBJoHH+zw2xjE3sqiY4vaoGna/upEtwLFTM9DyrO4527SSIij4WBYH57js+szu4nojJVYg8RAtyZTPZGzIYS5MMEc9L0DTEQsS5xUn+wu3AuaH+9eNKh158+gcaYn+bpecRvFGqHCWQW2M/W7UJvpwIOJs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0c1673d4d9d96599
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKUzpYGr791q1ycs9Tb8PDwtQrgAWyU82DLeYC0FAbsivDON/NHz78l1kHQnEsF2NJzWs3Au/awKY3pENzzQLrP8wn1QRUkkbxzsjhqUL3m27pBNJQZtxfzkzHn8BQr4bFLK8PqCEq/+FFdSbVCylgRfoiPc6i+dH61nXnsfDwHG+HxqiXxdTZ9v0TzGlJ+niU4uNjU0hPhbzm9B3CjkUNZ6e33mFX/RoKlOTxhay/6F48NrcW0JumNyQ7UmkMEVY96+qosgPejgE1//zLCEyJTaKOohjvi5BkFrIfRY5thCO3X8Wdqn/5CfNyx//VxKMmJqqR4EtbD6IaH2c+7+tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3eXTsVsY4QZ48T4C22IeeOy/fXf/zPA1j8gxc0ySaQ=;
 b=Ey8nfoMnJQ2MWozOYeaoQFelMezeSFxtWoNo4UYNCdjVZPqTDUqbyQAJ7c9UP1ldijt+UuUtzqIYotUWfAqRybOKp2SLnef6RHUUjAzn3TAu3KA9cXSnfKVTH7k8DlJRW0lTvh7dVZb2eX6/iVAr8XqoLcPOKrr02qLFKsJgXU9wbneDHYWsZe8ZxHApDVMcy5mSXvvHHzn58u0t5SQK5cx61yb3D0V6dpdDwQQVvJIgOp+N+0wDgTGVQnThyGuo4lWbussrTfQOq7gdRV0dVK8CE3XxH3OR58hmJCe9GGpi7IA+oVuLYtW1E+DIEqYnueMEI8vOXUvSjQ2HGiVLcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3eXTsVsY4QZ48T4C22IeeOy/fXf/zPA1j8gxc0ySaQ=;
 b=Vmc7LFd8Od5Zp7Mq/QBJoHH+zw2xjE3sqiY4vaoGna/upEtwLFTM9DyrO4527SSIij4WBYH57js+szu4nojJVYg8RAtyZTPZGzIYS5MMEc9L0DTEQsS5xUn+wu3AuaH+9eNKh158+gcaYn+bpecRvFGqHCWQW2M/W7UJvpwIOJs=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 4/5] xen/arm: Move static memory build code in separate
 modules
Thread-Topic: [PATCH v3 4/5] xen/arm: Move static memory build code in
 separate modules
Thread-Index: AQHaEuwaVYEciB6sG06PR543lMQVdbBx1haAgABIYIA=
Date: Thu, 9 Nov 2023 15:34:07 +0000
Message-ID: <B989BAAD-FD9C-401E-AD4D-4C039ECB9DF0@arm.com>
References: <20231109090615.3878767-1-luca.fancellu@arm.com>
 <20231109090615.3878767-5-luca.fancellu@arm.com>
 <cea75c65-ed76-4f23-a0cf-7500da9e3e36@amd.com>
In-Reply-To: <cea75c65-ed76-4f23-a0cf-7500da9e3e36@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DBBPR08MB5996:EE_|AM3PEPF0000A799:EE_|AS8PR08MB6502:EE_
X-MS-Office365-Filtering-Correlation-Id: 85b5572e-034c-4251-af48-08dbe13955fc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zMJou4njVTU/3poXrNav4FFHVI/rfyr252MC3rb9PGa7JESdu/nf6jY2bGzeCOPs0xnOKDaBkeS+KBERH+iimeyOnoxlKHMh3yWcgVuJBc4I74EQ2KilWp21R2imXywr4a5kGDGPh9+bs3Z0opmcVFfckiTFkBUtrzQ3I8y5XvPxzeDAPvEZXqLORGQMr75vG2wdiEh2i7GJsQUnuv4THN0Gk8YzX5scRUxT5LBIT1u3gsDa11ObvtnnJEI+J/oP5+Co8jVGz/c/PBzGwa6TfRjiT3+cGSCDHO2OAUlV4wHJ65wa5r+gC/LJPKXZyAwF0A06hRIdlu//C0Dorv3brMaxs+HrsNajN8RWpXZDQ6ErkBc9gSALAwjBw2kZMWpMZt1wdRF9gvMUrDOgN4khqElgdqAfENSRRZaiFvZLykrnwI/Bb/2nrYISoTTGdZWAZ9CNDOM412wrD6eQ7KlzO4++wuknlADWnG0/jT3iTkcd85i4fpWhK4IHGwEqBedbCG3WgAYvp+fcf1LDhF07rSVbajnW+Tn7NoCmp4WhlXLEzWrWketpwlArGkMnNHrPCMiM6O8MmEaRMfPQjM9Mx60QS4BNF9+rEzkRMCSS8nilfMye9Jmeut1+p1JHesZhHabcSU4a1fsJrPtKNLHrRFJSv7VNvmmbqMBnvob7f5/xZcqkNFJXXIivFVVVIv/d
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(136003)(39860400002)(376002)(230273577357003)(230173577357003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(26005)(2616005)(38070700009)(53546011)(6506007)(6512007)(41300700001)(76116006)(66556008)(66446008)(91956017)(66946007)(64756008)(66476007)(54906003)(316002)(6916009)(5660300002)(36756003)(86362001)(33656002)(8936002)(4326008)(8676002)(122000001)(38100700002)(71200400001)(6486002)(478600001)(2906002)(4744005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <66191205DE5AAF429044B6FBA7E13F5A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5996
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a760afab-04b3-4241-6cf2-08dbe1395056
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O05S7UtmjZXnZm211NOx7ME1fNku4sfHuLgUTjIK2cboUDoHGkmAYBcca0ulYfp/p6VxuL4AK64yO7P4OcTGU5ByXEr9TmUGstwVASEbYFx4URMy/KnqJ7JZMT+YkGPVf89v23WYDcns9dHQCtBCx2EWnoViLUrRWvouM5xKek8i7xCgjjjW2UZ5A8oKOoL9tgG2JDaJPC2+63RDA61mFhJ2u5H67bxOeGK5QlRpFVPQ0C2pTV5bsO8KDCev8q9O3x0rLZTmrR5xjm8f7hYDLhTCScTt8N56uMQ0Tjp2qIWQEBIvqVk+ukp2q09MWdfVt/Btzofzix6qoRwbRCQEeYBvCGXfHoGP8OL/AAUpsWqAH8do7L+f3ECLeHbnA1ectBGwevX+g3JOU5fUOiS9z4F4MzYkdyfUun9n+MClVMMQzQuVE/m0kFMEwfvAwGF9MfbVBNXzvM2SD6SaPEaSXROor3tk77JiHbTJXs6JqqX7HtEBGzWHIVmWkB8QoVOe8UE8jrigZG0XbCt9XmZ7ybwohIqsKxGhjpokK42Y2MztwPwDunRRFmUJ7DLx3sKE5RKGP05BQDhkDXB4pcvwgurSPokEIGpOm9Rk3EPXnFH++oYvYG+gYOzz0wEHWSifqFhHS8OoNlh4NnPafyh+Gq36zFPJmIvgvSfHfQDVgyLy1nhFjBJiKsELGYH7rW1EsmDREA+zGy91263QqGIrd1KY3Gfx0TbEcWujM2xaQYX+iB15Fx/h/6SfVrMRK3umG8gHTChfJqCjAtgYuDjHwA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(346002)(39860400002)(136003)(230922051799003)(230173577357003)(230273577357003)(82310400011)(451199024)(1800799009)(64100799003)(186009)(36840700001)(46966006)(40470700004)(6512007)(41300700001)(47076005)(6486002)(478600001)(6506007)(2616005)(53546011)(336012)(4744005)(8936002)(6862004)(54906003)(8676002)(5660300002)(2906002)(36860700001)(316002)(70586007)(70206006)(26005)(81166007)(356005)(4326008)(107886003)(86362001)(82740400003)(40480700001)(36756003)(40460700003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 15:34:17.4597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b5572e-034c-4251-af48-08dbe13955fc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6502



> On 9 Nov 2023, at 11:14, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Hi Luca,
>=20
> On 09/11/2023 10:06, Luca Fancellu wrote:
>>=20
>>=20
>> Move static memory and static shared memory code in separate modules
>> so that they are included only when the corresponding feature is
>> enabled, doing that we modularise the features and we remove some
>> ifdefs from the code to improve readability.
>>=20
>> Move process_shm_node function from bootfdt module and make it
>> externally visible.
> What about process_domain_node()? This function is related to "xen,domain=
"
> compatible that is only present for dom0less domUs.

I see it a bit tricky to do, in fact putting it on the static-memory module=
 would need to have it
externally visible from its module, but also it needs to have device_tree_g=
et_meminfo
externally visible from the bootfdt.

I think that one is more a glue-code mostly related to dt and this cross de=
pendency suggests me to
keep it as it is.

Cheers,
Luca


