Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 083402CBDFE
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 14:13:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42715.76852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkRwK-0002QX-0I; Wed, 02 Dec 2020 13:13:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42715.76852; Wed, 02 Dec 2020 13:12:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkRwJ-0002Q8-T1; Wed, 02 Dec 2020 13:12:59 +0000
Received: by outflank-mailman (input) for mailman id 42715;
 Wed, 02 Dec 2020 13:12:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8zz6=FG=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kkRwH-0002Pz-Kf
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 13:12:57 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::622])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e11294f4-781e-42b1-931a-bbc1c18d8ab6;
 Wed, 02 Dec 2020 13:12:55 +0000 (UTC)
Received: from DB6P195CA0005.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::15) by
 VI1PR08MB2926.eurprd08.prod.outlook.com (2603:10a6:802:1f::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.25; Wed, 2 Dec 2020 13:12:51 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::9) by DB6P195CA0005.outlook.office365.com
 (2603:10a6:4:cb::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Wed, 2 Dec 2020 13:12:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 13:12:51 +0000
Received: ("Tessian outbound 39646a0fd094:v71");
 Wed, 02 Dec 2020 13:12:51 +0000
Received: from a78df1f4684e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 89062AA4-2033-48B8-8BD4-98D5C9F00FC4.1; 
 Wed, 02 Dec 2020 13:12:14 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a78df1f4684e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 02 Dec 2020 13:12:14 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB5995.eurprd08.prod.outlook.com (2603:10a6:10:20b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Wed, 2 Dec
 2020 13:12:11 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef%2]) with mapi id 15.20.3611.025; Wed, 2 Dec 2020
 13:12:11 +0000
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
X-Inumbo-ID: e11294f4-781e-42b1-931a-bbc1c18d8ab6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Cc/cAPggcQ9iLguvdoXkIND+u55kDfmkYFsK+EnMJg=;
 b=J5z7A/l7mtxaCHj1ouS52IPgwkjgcjEigLXQ9UrNTNNui970XwAb2qBJyMgofRtoRU+uzoTLLkTLsXX9SA93DnIi9P3B5Wq7KKh1+HAV3AlP+QA4xgg3rCmVXFrsIRkJ9dpTPL8ZMyhIigcWSgtN6rAPYm7kApb5ZXD8OLwqWcQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 13d21086afb81b74
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uos2AYuQDgjp6LtyXCx9iznQ4apT1B1AbP9onbKZzr5RTuuuzt9YSet8WOvBaz73O+JGJCazJMPOoTBWaf8Uk7t6MDPkZyftRFgNKDfJZK65ibUVaC0LQ8ZcdOxPV7MkS6lwcbvm+YJyB2HFqXDurs31WTIgmp0q0DNKct5LlrVgLyirOxFxdUgReCXWeOP7VaKVBBbXNyORG0bHSPQfaunKZcllWIOFqbMnbPJLNo9r0hQaoIVCvypfniz7Z7Wb230LL2Egut8yn1ztTtDT+jdZAduQlC7JWUcmzsY8Fx8RgvKHAbO5ddATSAXOnIpDGU9Tez9K1TbU13m1ft0IEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Cc/cAPggcQ9iLguvdoXkIND+u55kDfmkYFsK+EnMJg=;
 b=RVdjTrGtWCf3YIdcidPluKsWDs3tduswn4v/M2VsndVOBRr9zQXTN7t8yDg92IcQ1rvCiwa427Bu4aCdy+eMqe2pgEWLUAKReP+famA0HkhZFAZU6XMWE3d9Hb9Yb9GUIUAsyioWUyV9yGrWsu6RlavCevFhR0X76l+07BdT0bNUekGnUtLTyI+5zMDTzSzi8WyOkFZ3reASuRbEmHv2nYBJ/S5+uirrwrT7r2iB+moJhqwFh6OZWs5SsyeF4m9RZdZOPt+6vYv0X9u+de44QtN1rKy6N6o9ClfV0NYlnF0iYhjy3z6YQNkBAuhtewMiozuc6gEI7Pr2Q9NI8tEcSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Cc/cAPggcQ9iLguvdoXkIND+u55kDfmkYFsK+EnMJg=;
 b=J5z7A/l7mtxaCHj1ouS52IPgwkjgcjEigLXQ9UrNTNNui970XwAb2qBJyMgofRtoRU+uzoTLLkTLsXX9SA93DnIi9P3B5Wq7KKh1+HAV3AlP+QA4xgg3rCmVXFrsIRkJ9dpTPL8ZMyhIigcWSgtN6rAPYm7kApb5ZXD8OLwqWcQ=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 4/8] xen/arm: Remove support for MSI on SMMUv3
Thread-Topic: [PATCH v2 4/8] xen/arm: Remove support for MSI on SMMUv3
Thread-Index: AQHWxBX8l+Fkiiynvkqd+dcwplqzQKni/UOAgAAB/QCAANIPAA==
Date: Wed, 2 Dec 2020 13:12:11 +0000
Message-ID: <D79D7DC5-649D-4517-A8CA-B13632595DA5@arm.com>
References: <cover.1606406359.git.rahul.singh@arm.com>
 <cfc6cbe23f05162d5c62df9db09fef3f8e0b8e14.1606406359.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2012011621380.1100@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2012011639230.1100@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2012011639230.1100@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6ae88d13-195d-4402-d9bf-08d896c3f91a
x-ms-traffictypediagnostic: DBBPR08MB5995:|VI1PR08MB2926:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB292634CA91D13F00919C48FBFCF30@VI1PR08MB2926.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SzbccR+LMeqCqkiT/JouZamUbnWrPdGFDK5xoOfJu1qi9o3Hq64i2KZQZYCmvuAGI7t9TrlU1E4nbS78BrVYBtKsI8wn7QwiahYy5Gn8eeh0Bn9dKdolEPzxzysrj4VSPav8HRGA2cQg1pTCOXdp1mhKxhZJzaxGZlBUbZfoodlfWO/Nl+saZhJLLacSPwSHFhGnhtw5xVONFqk0eX/f4DYGuHPolpd3WxtefAW98FIaHTOec4481kvZyNqIe8u4rJMIXPHMhRr6GqHRqqzduvCWei1+VaH1Ay+GXA5ME6palWMzwczegTQaLOmE6fwrHRFCbU0+dGTJYkZ5MG+k4B42cJ1ejFh9Dh1homMbttrrCM+Yt0fuPaZbDZQyFWNM
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(54906003)(316002)(71200400001)(86362001)(186003)(2616005)(26005)(6506007)(53546011)(478600001)(33656002)(6486002)(36756003)(8676002)(6916009)(83380400001)(6512007)(4326008)(66946007)(66446008)(66556008)(66476007)(91956017)(64756008)(8936002)(76116006)(2906002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?HFoCDPrkj+YQamFR0s8UhDIkXRhur5upbD795tE3qHIzd9SBrBHbPnAWVr9i?=
 =?us-ascii?Q?45cW4+xkGSvF0itNJTzGYj9JdNbEoFA9sYS/EXmjhKkB8undmKGLxLkrdjPW?=
 =?us-ascii?Q?qhvkEwqUQmvMzfLJR/4JdYswhHtPHN+buJl5qgU5fcgN7IW0cdul8hDo8S9+?=
 =?us-ascii?Q?3pykblP394kUSDM8L/XTxepQafQ96RdiA8BFREoS1feE6a0/Bd07uj439mt6?=
 =?us-ascii?Q?bHm2kg46zYdrRo2DTGZMh0jneJTp9BgL439fQlsCI/dR+z7+Wfh0HgH2Z9p4?=
 =?us-ascii?Q?3GmDWYgX6z2kl5XfLq1SbcdmmaQ5UhIjYJNKJbUIdO6wNmLDO8bVHmFk5HaN?=
 =?us-ascii?Q?3Pfca/qn5Jj7mDdS7EVsBT9POsoHxWv3VVrMQPY7uX+bWCKvIEezS/urmvD5?=
 =?us-ascii?Q?jFCmNmZIVP+tg0pRTPJCrRP7/3Ba8PHT9Zk4gufkkiCqCnVorGMrWLnB8krF?=
 =?us-ascii?Q?XdnhbMaTArcY7QY7Vb3VvPcIOnp7+VIB9BfNsGDLEiwv2vYwckWOXLgu/tr+?=
 =?us-ascii?Q?xnLRFNMxevPv8/L16Tx1gafE/FjAdaP7HLXPQDYtyDhengrX7xYXZOI9QvW4?=
 =?us-ascii?Q?ZpjtfCzsvA9r3URNxxop60nLcLeCTP6LKeDYa3WMB5cTNhePKparfSyrE7Mi?=
 =?us-ascii?Q?5w+woNBhPDN2yBRC9XxNZfvZjJX2eN3O023LfLiuuvMoHFyIgZI/zbJ1UgNZ?=
 =?us-ascii?Q?IOzdblA8//+wha50u0Q33ErBJqWNeWkzc2UcTTTG/2Oles+A2axAhDcEovik?=
 =?us-ascii?Q?jxhprhlren3YLRByCQPziUCV7Q8YY7yl1ZU/LkBrvLbDM9ZU4HeYJZsK5QWk?=
 =?us-ascii?Q?NXlEq5crkwAga9n5XHFec03skFXm4SLWcWpJg7IngHM+AAaPi1eUYDUDmZQy?=
 =?us-ascii?Q?6BeqwRQVzzocbDLP14DQqSDM8+C1yiE3xP7kgOc7YUv/IMBWrZ5p3hRF/llv?=
 =?us-ascii?Q?0vg3Pv1LlGA9ROMrwMKODz2XgW4se73ov0MAFx0VTHSX3YxnTfFsZoW4cAke?=
 =?us-ascii?Q?3qw6?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2FA825F89933114180A599C906B2E501@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5995
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3ed73565-a444-41db-32b6-08d896c3e11d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QbHQPmSLhX4W+zezjQdYg5/wrUdZ10InVr9TDF+RgJ8K9R+Rnd6baPaSNEQDKm7qJviyV84DPUPM71puGJbm7TdTgHOjm/P4S/5MX0WN7nCLqSQ83pU/j222xd7+TM+RvUWdLrJVQ8mr8rHXlNQOB1+NsBE6bCb6Q1D+dKCfSlff3VPop8hidTqGc8Z7ZNEwdMqxM3DP+i+LPX7cgFQm0ETv4GR3e8OQt180CcbuE4DUoj8gLojAO0/nZKwgGkW6TwYlzoj97r0oZxcIrPsNJNJTMZHMCoEPajgp3G80kJ6OSMaHLGUjmchqHbl5olwiYcCdI4c54acBX04T4N9r+fnMsNu/3ww/0qdLeH0iN52mEDInDMm+7Ff3EF4/xIBtbQJ/BN/D+3eDnw9+Gl6Lvw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(46966005)(36756003)(356005)(47076004)(4326008)(54906003)(336012)(70586007)(81166007)(316002)(86362001)(186003)(5660300002)(2616005)(82740400003)(2906002)(70206006)(33656002)(107886003)(8676002)(6512007)(6862004)(6486002)(6506007)(82310400003)(83380400001)(8936002)(53546011)(26005)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 13:12:51.4850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae88d13-195d-4402-d9bf-08d896c3f91a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2926

Hello Stefano,

> On 2 Dec 2020, at 12:40 am, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>=20
> On Tue, 1 Dec 2020, Stefano Stabellini wrote:
>> On Thu, 26 Nov 2020, Rahul Singh wrote:
>>> XEN does not support MSI on ARM platforms, therefore remove the MSI
>>> support from SMMUv3 driver.
>>>=20
>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>=20
>> I wonder if it makes sense to #ifdef CONFIG_MSI this code instead of
>> removing it completely.
>=20
> One more thought: could this patch be achieved by reverting
> 166bdbd23161160f2abcea70621adba179050bee ? If this patch could be done
> by a couple of revert, it would be great to say it in the commit
> message.
>=20
 Ok will add in next version.

>=20
>> In the past, we tried to keep the entire file as textually similar to
>> the original Linux driver as possible to make it easier to backport
>> features and fixes. So, in this case we would probably not even used an
>> #ifdef but maybe something like:
>>=20
>>  if (/* msi_enabled */ 0)
>>      return;
>>=20
>> at the beginning of arm_smmu_setup_msis.
>>=20
>>=20
>> However, that strategy didn't actually work very well because backports
>> have proven difficult to do anyway. So at that point we might as well at
>> least have clean code in Xen and do the changes properly.

Main reason to remove the feature/code that is not usable in XEN is to have=
 a clean code.

Regards,
Rahul

>>=20
>> So that's my reasoning for accepting this patch :-)
>>=20
>> Julien, are you happy with this too?
>>=20
>>=20
>>> ---
>>> xen/drivers/passthrough/arm/smmu-v3.c | 176 +-------------------------
>>> 1 file changed, 3 insertions(+), 173 deletions(-)
>>>=20
>>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passth=
rough/arm/smmu-v3.c
>>> index cec304e51a..401f7ae006 100644
>>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>>> @@ -416,31 +416,6 @@ enum pri_resp {
>>> 	PRI_RESP_SUCC =3D 2,
>>> };
>>>=20
>>> -enum arm_smmu_msi_index {
>>> -	EVTQ_MSI_INDEX,
>>> -	GERROR_MSI_INDEX,
>>> -	PRIQ_MSI_INDEX,
>>> -	ARM_SMMU_MAX_MSIS,
>>> -};
>>> -
>>> -static phys_addr_t arm_smmu_msi_cfg[ARM_SMMU_MAX_MSIS][3] =3D {
>>> -	[EVTQ_MSI_INDEX] =3D {
>>> -		ARM_SMMU_EVTQ_IRQ_CFG0,
>>> -		ARM_SMMU_EVTQ_IRQ_CFG1,
>>> -		ARM_SMMU_EVTQ_IRQ_CFG2,
>>> -	},
>>> -	[GERROR_MSI_INDEX] =3D {
>>> -		ARM_SMMU_GERROR_IRQ_CFG0,
>>> -		ARM_SMMU_GERROR_IRQ_CFG1,
>>> -		ARM_SMMU_GERROR_IRQ_CFG2,
>>> -	},
>>> -	[PRIQ_MSI_INDEX] =3D {
>>> -		ARM_SMMU_PRIQ_IRQ_CFG0,
>>> -		ARM_SMMU_PRIQ_IRQ_CFG1,
>>> -		ARM_SMMU_PRIQ_IRQ_CFG2,
>>> -	},
>>> -};
>>> -
>>> struct arm_smmu_cmdq_ent {
>>> 	/* Common fields */
>>> 	u8				opcode;
>>> @@ -504,10 +479,6 @@ struct arm_smmu_cmdq_ent {
>>> 		} pri;
>>>=20
>>> 		#define CMDQ_OP_CMD_SYNC	0x46
>>> -		struct {
>>> -			u32			msidata;
>>> -			u64			msiaddr;
>>> -		} sync;
>>> 	};
>>> };
>>>=20
>>> @@ -649,12 +620,6 @@ struct arm_smmu_device {
>>>=20
>>> 	struct arm_smmu_strtab_cfg	strtab_cfg;
>>>=20
>>> -	/* Hi16xx adds an extra 32 bits of goodness to its MSI payload */
>>> -	union {
>>> -		u32			sync_count;
>>> -		u64			padding;
>>> -	};
>>> -
>>> 	/* IOMMU core code handle */
>>> 	struct iommu_device		iommu;
>>> };
>>> @@ -945,20 +910,7 @@ static int arm_smmu_cmdq_build_cmd(u64 *cmd, struc=
t arm_smmu_cmdq_ent *ent)
>>> 		cmd[1] |=3D FIELD_PREP(CMDQ_PRI_1_RESP, ent->pri.resp);
>>> 		break;
>>> 	case CMDQ_OP_CMD_SYNC:
>>> -		if (ent->sync.msiaddr)
>>> -			cmd[0] |=3D FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_IRQ);
>>> -		else
>>> -			cmd[0] |=3D FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_SEV);
>>> -		cmd[0] |=3D FIELD_PREP(CMDQ_SYNC_0_MSH, ARM_SMMU_SH_ISH);
>>> -		cmd[0] |=3D FIELD_PREP(CMDQ_SYNC_0_MSIATTR, ARM_SMMU_MEMATTR_OIWB);
>>> -		/*
>>> -		 * Commands are written little-endian, but we want the SMMU to
>>> -		 * receive MSIData, and thus write it back to memory, in CPU
>>> -		 * byte order, so big-endian needs an extra byteswap here.
>>> -		 */
>>> -		cmd[0] |=3D FIELD_PREP(CMDQ_SYNC_0_MSIDATA,
>>> -				     cpu_to_le32(ent->sync.msidata));
>>> -		cmd[1] |=3D ent->sync.msiaddr & CMDQ_SYNC_1_MSIADDR_MASK;
>>> +		cmd[0] |=3D FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_SEV);
>>> 		break;
>>> 	default:
>>> 		return -ENOENT;
>>> @@ -1054,50 +1006,6 @@ static void arm_smmu_cmdq_issue_cmd(struct arm_s=
mmu_device *smmu,
>>> 	spin_unlock_irqrestore(&smmu->cmdq.lock, flags);
>>> }
>>>=20
>>> -/*
>>> - * The difference between val and sync_idx is bounded by the maximum s=
ize of
>>> - * a queue at 2^20 entries, so 32 bits is plenty for wrap-safe arithme=
tic.
>>> - */
>>> -static int __arm_smmu_sync_poll_msi(struct arm_smmu_device *smmu, u32 =
sync_idx)
>>> -{
>>> -	ktime_t timeout;
>>> -	u32 val;
>>> -
>>> -	timeout =3D ktime_add_us(ktime_get(), ARM_SMMU_CMDQ_SYNC_TIMEOUT_US);
>>> -	val =3D smp_cond_load_acquire(&smmu->sync_count,
>>> -				    (int)(VAL - sync_idx) >=3D 0 ||
>>> -				    !ktime_before(ktime_get(), timeout));
>>> -
>>> -	return (int)(val - sync_idx) < 0 ? -ETIMEDOUT : 0;
>>> -}
>>> -
>>> -static int __arm_smmu_cmdq_issue_sync_msi(struct arm_smmu_device *smmu=
)
>>> -{
>>> -	u64 cmd[CMDQ_ENT_DWORDS];
>>> -	unsigned long flags;
>>> -	struct arm_smmu_cmdq_ent  ent =3D {
>>> -		.opcode =3D CMDQ_OP_CMD_SYNC,
>>> -		.sync	=3D {
>>> -			.msiaddr =3D virt_to_phys(&smmu->sync_count),
>>> -		},
>>> -	};
>>> -
>>> -	spin_lock_irqsave(&smmu->cmdq.lock, flags);
>>> -
>>> -	/* Piggy-back on the previous command if it's a SYNC */
>>> -	if (smmu->prev_cmd_opcode =3D=3D CMDQ_OP_CMD_SYNC) {
>>> -		ent.sync.msidata =3D smmu->sync_nr;
>>> -	} else {
>>> -		ent.sync.msidata =3D ++smmu->sync_nr;
>>> -		arm_smmu_cmdq_build_cmd(cmd, &ent);
>>> -		arm_smmu_cmdq_insert_cmd(smmu, cmd);
>>> -	}
>>> -
>>> -	spin_unlock_irqrestore(&smmu->cmdq.lock, flags);
>>> -
>>> -	return __arm_smmu_sync_poll_msi(smmu, ent.sync.msidata);
>>> -}
>>> -
>>> static int __arm_smmu_cmdq_issue_sync(struct arm_smmu_device *smmu)
>>> {
>>> 	u64 cmd[CMDQ_ENT_DWORDS];
>>> @@ -1119,12 +1027,9 @@ static int __arm_smmu_cmdq_issue_sync(struct arm=
_smmu_device *smmu)
>>> static int arm_smmu_cmdq_issue_sync(struct arm_smmu_device *smmu)
>>> {
>>> 	int ret;
>>> -	bool msi =3D (smmu->features & ARM_SMMU_FEAT_MSI) &&
>>> -		   (smmu->features & ARM_SMMU_FEAT_COHERENCY);
>>>=20
>>> -	ret =3D msi ? __arm_smmu_cmdq_issue_sync_msi(smmu)
>>> -		  : __arm_smmu_cmdq_issue_sync(smmu);
>>> -	if (ret)
>>> +	ret =3D __arm_smmu_cmdq_issue_sync(smmu);
>>> +	if ( ret )
>>> 		dev_err_ratelimited(smmu->dev, "CMD_SYNC timeout\n");
>>> 	return ret;
>>> }
>>> @@ -2898,83 +2803,10 @@ static int arm_smmu_update_gbpa(struct arm_smmu=
_device *smmu, u32 set, u32 clr)
>>> 	return ret;
>>> }
>>>=20
>>> -static void arm_smmu_free_msis(void *data)
>>> -{
>>> -	struct device *dev =3D data;
>>> -	platform_msi_domain_free_irqs(dev);
>>> -}
>>> -
>>> -static void arm_smmu_write_msi_msg(struct msi_desc *desc, struct msi_m=
sg *msg)
>>> -{
>>> -	phys_addr_t doorbell;
>>> -	struct device *dev =3D msi_desc_to_dev(desc);
>>> -	struct arm_smmu_device *smmu =3D dev_get_drvdata(dev);
>>> -	phys_addr_t *cfg =3D arm_smmu_msi_cfg[desc->platform.msi_index];
>>> -
>>> -	doorbell =3D (((u64)msg->address_hi) << 32) | msg->address_lo;
>>> -	doorbell &=3D MSI_CFG0_ADDR_MASK;
>>> -
>>> -	writeq_relaxed(doorbell, smmu->base + cfg[0]);
>>> -	writel_relaxed(msg->data, smmu->base + cfg[1]);
>>> -	writel_relaxed(ARM_SMMU_MEMATTR_DEVICE_nGnRE, smmu->base + cfg[2]);
>>> -}
>>> -
>>> -static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
>>> -{
>>> -	struct msi_desc *desc;
>>> -	int ret, nvec =3D ARM_SMMU_MAX_MSIS;
>>> -	struct device *dev =3D smmu->dev;
>>> -
>>> -	/* Clear the MSI address regs */
>>> -	writeq_relaxed(0, smmu->base + ARM_SMMU_GERROR_IRQ_CFG0);
>>> -	writeq_relaxed(0, smmu->base + ARM_SMMU_EVTQ_IRQ_CFG0);
>>> -
>>> -	if (smmu->features & ARM_SMMU_FEAT_PRI)
>>> -		writeq_relaxed(0, smmu->base + ARM_SMMU_PRIQ_IRQ_CFG0);
>>> -	else
>>> -		nvec--;
>>> -
>>> -	if (!(smmu->features & ARM_SMMU_FEAT_MSI))
>>> -		return;
>>> -
>>> -	if (!dev->msi_domain) {
>>> -		dev_info(smmu->dev, "msi_domain absent - falling back to wired irqs\=
n");
>>> -		return;
>>> -	}
>>> -
>>> -	/* Allocate MSIs for evtq, gerror and priq. Ignore cmdq */
>>> -	ret =3D platform_msi_domain_alloc_irqs(dev, nvec, arm_smmu_write_msi_=
msg);
>>> -	if (ret) {
>>> -		dev_warn(dev, "failed to allocate MSIs - falling back to wired irqs\=
n");
>>> -		return;
>>> -	}
>>> -
>>> -	for_each_msi_entry(desc, dev) {
>>> -		switch (desc->platform.msi_index) {
>>> -		case EVTQ_MSI_INDEX:
>>> -			smmu->evtq.q.irq =3D desc->irq;
>>> -			break;
>>> -		case GERROR_MSI_INDEX:
>>> -			smmu->gerr_irq =3D desc->irq;
>>> -			break;
>>> -		case PRIQ_MSI_INDEX:
>>> -			smmu->priq.q.irq =3D desc->irq;
>>> -			break;
>>> -		default:	/* Unknown */
>>> -			continue;
>>> -		}
>>> -	}
>>> -
>>> -	/* Add callback to free MSIs on teardown */
>>> -	devm_add_action(dev, arm_smmu_free_msis, dev);
>>> -}
>>> -
>>> static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
>>> {
>>> 	int irq, ret;
>>>=20
>>> -	arm_smmu_setup_msis(smmu);
>>> -
>>> 	/* Request interrupt lines */
>>> 	irq =3D smmu->evtq.q.irq;
>>> 	if (irq) {
>>> @@ -3250,8 +3082,6 @@ static int arm_smmu_device_hw_probe(struct arm_sm=
mu_device *smmu)
>>> 	if (reg & IDR0_SEV)
>>> 		smmu->features |=3D ARM_SMMU_FEAT_SEV;
>>>=20
>>> -	if (reg & IDR0_MSI)
>>> -		smmu->features |=3D ARM_SMMU_FEAT_MSI;
>>>=20
>>> 	if (reg & IDR0_HYP)
>>> 		smmu->features |=3D ARM_SMMU_FEAT_HYP;
>>> --=20
>>> 2.17.1
>>>=20
>>=20


