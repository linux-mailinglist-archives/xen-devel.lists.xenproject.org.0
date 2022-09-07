Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1812E5B0649
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 16:19:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401858.643818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVvth-0007TJ-1d; Wed, 07 Sep 2022 14:19:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401858.643818; Wed, 07 Sep 2022 14:19:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVvtg-0007Qo-UY; Wed, 07 Sep 2022 14:19:20 +0000
Received: by outflank-mailman (input) for mailman id 401858;
 Wed, 07 Sep 2022 14:19:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a/dp=ZK=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oVvte-0007Pk-UH
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 14:19:19 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60059.outbound.protection.outlook.com [40.107.6.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e812a58-2eb8-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 16:19:17 +0200 (CEST)
Received: from FR3P281CA0081.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1f::11)
 by PAWPR08MB9519.eurprd08.prod.outlook.com (2603:10a6:102:2f1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Wed, 7 Sep
 2022 14:19:14 +0000
Received: from VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1f:cafe::94) by FR3P281CA0081.outlook.office365.com
 (2603:10a6:d10:1f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Wed, 7 Sep 2022 14:19:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT015.mail.protection.outlook.com (10.152.18.176) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 14:19:14 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Wed, 07 Sep 2022 14:19:13 +0000
Received: from d61f644ddd47.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9602F732-3A45-4045-A65D-B75FEE293D9F.1; 
 Wed, 07 Sep 2022 14:19:07 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d61f644ddd47.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 14:19:07 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DU0PR08MB9677.eurprd08.prod.outlook.com (2603:10a6:10:447::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Wed, 7 Sep
 2022 14:19:03 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 14:19:03 +0000
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
X-Inumbo-ID: 0e812a58-2eb8-11ed-af93-0125da4c0113
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=kK3CDf/NuXXDKK2hdtT6iQoXnQ30PCvNOIa9hxr6cWpYALSYv+VfZ64bvktX5ePHbvkj0lZ12Ks8N+kf11Jynsw+54KNsLKdKmaeKpLACvABgPaxy9CTCBIRCq3j/I1nHakWTvug26CGw2bHRi2td3dED1bgr0uLgvuTzQPGNr3AKYeuANUThnixjC5S4pE0dvgQdiitot5mWosLrKX2QTkQzF698wKf8eiktq4I/zyD4E16AlFR22VlxkfOINiugsRx9ptPlqe2f4nL5QgFHVZvtchOuoSN8VjpVfE/R8oXSERncS676aBSB/7J53RJkL5p00Oiovhz64K3Zq/j7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/cBNynxtWFQG6rFHdjzUL5ny1LFAiYA1K+GrixRua6E=;
 b=UPoq0n+vJPNUkiKo2oBe9UYt5LLQ3T8XezEC4N6932LRO8rPs+nLw4wexyFXQq3h/LfNUNzf9slIZ8qEbplr5pqWWXdRE4rn6OK9S3GtFyMky/OEHhCg8HoiG0aaI887qyQOcSW5/d+7jnaviJIQS66T8adWPX0NUyv60flYuEg+vw9TGBZ/EhtZDWEljVOi0ZMDg+ZhNUCF9VUf71deREQbEnmgbf1xMcxTajABCgwGdtl3g4U+ObcHu+EIwt77OjXn/3NCEHa6gpBazXIKSL7xStlQmp3ohBBnkz346yDUZMcmB4YriNy/10dZWwJVn0trdzV/Vtd/rvS6MlqvWg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cBNynxtWFQG6rFHdjzUL5ny1LFAiYA1K+GrixRua6E=;
 b=C2Yd357FgEMrHHJNez5CrmlIpGSJSc+AZ9SkQ0GEcIFPxGwwrFzOOoSmaZ98AuRPR0xxLSDk+6ZALVJoBcMfcpLpqCYrCY6FzON471xviOT2vWWU1hfXpM0FUF4cATaOgdBIQZkw4WOb34nA3Bupre4RLqWvVYV8bS18Q9vEfjA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 36f3934581f1dad3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ytg8y4OOZrPJ6aqlefv+2Xznf9MdKvaVciekEr1a/5+DMjLpweB+ynwwpSzbIPKsVrOeyMl1DL+k/7HIr6nLtTre1VShbvjRMTc8m0dCC0tQH0+EAbHDnPNtKeHIUe5wfLWUFv/BO8/VsDwl04mgtKBH14Cdj7xvY8gPYoMplgp75eq+UWQqM0Zi/zoOnsxSU3GapuMsRxlshhfP1I6A3D7DwYVrGHsMd/ffnjRFM2VdyMQ6yeJ/xDHzdkf19HzktjfoKOxmwqL2k5LsS1YErDy+W4/PpCP9f3xUD246NnAxjwFHxODLlAsPP6xvwWMDbrou+VBeI+QTdd0dX3HKHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/cBNynxtWFQG6rFHdjzUL5ny1LFAiYA1K+GrixRua6E=;
 b=eBoKjsv/TVlRKNE7F+us/Iut62llupTSld8rRdISQR/mICFk37Oo18TDwQ0LKrN+ONSQY4sw2Nw/PIIlT/f4vlmS8fEYZ3Yc+Y98YnUsMxNot+PUALgCiM3tlyr7PvYmEwdsF8nE7KWBqLRTsqW+4ibPBHvSnLwjSEiLAh0/z2YJOfJqBd3N09B60P9C6S/tVsMzDGJIUxE6Fij2AgdHFbzMLlhuJcw09yrLGWqIdZ+CpquzGgXhg0ZwDofS9v4Ny4jL80FNRkyi6jIigGs2c/FymVjKIzkRE4ACFEkBY0S6Q6u36g58j1j0KDrW+bRaP7fNyF8M08JKPdTiXAnqXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cBNynxtWFQG6rFHdjzUL5ny1LFAiYA1K+GrixRua6E=;
 b=C2Yd357FgEMrHHJNez5CrmlIpGSJSc+AZ9SkQ0GEcIFPxGwwrFzOOoSmaZ98AuRPR0xxLSDk+6ZALVJoBcMfcpLpqCYrCY6FzON471xviOT2vWWU1hfXpM0FUF4cATaOgdBIQZkw4WOb34nA3Bupre4RLqWvVYV8bS18Q9vEfjA=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 6/7] xen/arm: introduce new xen,enhanced property value
Thread-Topic: [PATCH v4 6/7] xen/arm: introduce new xen,enhanced property
 value
Thread-Index: AQHYwfap3Ps5bdyrBEC9qTgdrU+ZKq3T8h2AgAAThAA=
Date: Wed, 7 Sep 2022 14:19:03 +0000
Message-ID: <FDF586F6-B69B-4472-A57B-9484D83ABFD4@arm.com>
References: <cover.1662462034.git.rahul.singh@arm.com>
 <667059a3bc6ed9a8b993f64f2b1176a2a131f41e.1662462034.git.rahul.singh@arm.com>
 <a94d42dc-eebc-ae9f-26b0-2553398195ff@xen.org>
In-Reply-To: <a94d42dc-eebc-ae9f-26b0-2553398195ff@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9a37136d-b53e-4acc-5c0c-08da90dbf102
x-ms-traffictypediagnostic:
	DU0PR08MB9677:EE_|VE1EUR03FT015:EE_|PAWPR08MB9519:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ExgSsYAGS777+6SuPh58Xlajyi0TwR72T4HatD5YjScBopRGr/zzacFyN+yF+7EALquye71z9SbHXUcvzdccAH5sYiGvALnCuOYrJjyMgpC+nCnjKEvG88GZimVcIe2YamowlkdoOirxJGCKS7OZHl8NMpTeh5/g1BYxS1FLr4RI6R4+sr+L3SpV8a3Qi3HOJby3WWk1Jo3Arf5mqvxDxJbKmNBaJdQS7+UuCVNVTPM0suUBuC0sqUbR91XXCIfRf9kZgr4W2RMD1lT9fVoA8K1S6b0AO1xb8yWUPobisyGx1m50MLTkk2UQYhDkix9VMfBS7SrQ8dkOxqGBmrbTebpbHF/ubUk89s1DfExA4sljRr0Fq4S5Hdtf4EMGXywUheaw7hTaUAnWkzHG6NPg3BszkW+IhdI6t8pIbqlP8T7yti5ZjBYlyUTTeBB1mBUNgZ02FrckkhWc6bhfP/FiF7X2omyxrzLLvLvYYNerRaEAQpdkTbsCzQbZIy75xBmM5mw3lOaDt5AlXCF/Q5kUEP6H809CGULb3KJH5a8JJUFpwx3fvNWVTd3O2ajdfsNf72Pxp633ZbYb6Nq5+claiLsQSAy56xBo5/DJp2K/2MtieaIkxfsM+Hh/pfXn2LncVyRK5K1eHDa6p/hDoM0/gBf4ZO5Ekg7tva+sTCwyrHGFNRLoScaaOYwO/1Tz+CNCWyRrkEiL2KBytIdCDBObTeatOCoUV8DNlRbr16Z1o9Sx0ik6P8TOJmjZFE28Tx8+xQqv7TFZ1yuS+TQQMDiX5ULYZBMHGtxb7E/uvgP8XD0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(38100700002)(478600001)(2616005)(6506007)(2906002)(122000001)(71200400001)(186003)(36756003)(5660300002)(33656002)(6486002)(8936002)(8676002)(6512007)(76116006)(54906003)(86362001)(66446008)(316002)(66476007)(38070700005)(66946007)(91956017)(64756008)(66556008)(4326008)(83380400001)(26005)(6916009)(41300700001)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A60B344652212648A55A94BDF10DECB6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9677
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4ee4508c-202f-48e2-a7a4-08da90dbea71
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Agr/ApXsDoa/iCWEsrePXb4W/BpRImWlXo3Rg0lIaNpTI9zsw9aOhRzL6OC2uKHUpmc1EMTJdwN11U4sEjy151rlcNfZ6jmU2Th9zCDz4Wv06xPWfFclwrbtb+F7cvTiftdUe68cf7SEQ0GuKGYgso6jPukVWMhYvsR0fMwQol5BScIl0tCZuL64ntRKT6eDs3SnF8aabkCWillAtUisClFPi5x8Rf0UFvKho0CbuXZg49VXcnSATb09fJe90F6nqV21lVmWpj/Np4kjdZdY+RI7wWQW60uJ5Mhy4EvEUxEkqgLyEpANt4WTNOihvvmVaenb5DUGP6Kkzdr83DZAaYy61q2vuO/OytrJwO8hrUWbvQ82RddMHy3kT4d1QzwA5Np2l5RS1bLXRoSqpWmO3tpQgS9313S4zOX6BrI5CT1kZgDTyeOKVGoEflilcvUYlLVqbSAOFZRYahCe1t6intiCNaj3vy23Pv3KUa3yQwKF5IIoZHNL+CKkPSKfXJV5Jgp9WJCXfsXmLneFVuzsr+H3PFBSaftBFZSHFr+x68+P+kZomQP2L68M8r7/538EwrpTfYN6GfXqfi4odnz1WTaPO9Wg562jx0U/QN2A/cNXnOwrDCXNLwvJ2/2a0G/SRQyuDq5L4L7ZxrBjrEbfdEZFaPhe6MzUYYlQ0vq0EvlHlZQA0RLvyefFJORDztxuHH/DdFZzHPuoeC0oDrz78BmgnbkMDufBYpg+rTVE2OM6dtUhysrR/XytP3zaUpCs82EYiwTAEEvfcFUsTXuPpw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(396003)(376002)(136003)(46966006)(40470700004)(36840700001)(356005)(82740400003)(83380400001)(40460700003)(36860700001)(2906002)(81166007)(8676002)(70206006)(4326008)(316002)(54906003)(82310400005)(70586007)(8936002)(40480700001)(6862004)(5660300002)(6512007)(26005)(336012)(2616005)(186003)(53546011)(107886003)(6506007)(6486002)(47076005)(41300700001)(478600001)(86362001)(36756003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 14:19:14.0954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a37136d-b53e-4acc-5c0c-08da90dbf102
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9519

Hi Julien,

> On 7 Sep 2022, at 2:09 pm, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Rahul
>=20
> On 06/09/2022 14:40, Rahul Singh wrote:
>> Introduce a new "xen,enhanced" dom0less property value "no-xenstore" to
>> disable xenstore interface for dom0less guests.
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> Changes in v4:
>>  - Implement defines for dom0less features
>> Changes in v3:
>>  - new patch in this version
>> ---
>>  docs/misc/arm/device-tree/booting.txt |  4 ++++
>>  xen/arch/arm/domain_build.c           | 10 ++++++----
>>  xen/arch/arm/include/asm/kernel.h     | 23 +++++++++++++++++++++--
>>  3 files changed, 31 insertions(+), 6 deletions(-)
>> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/devic=
e-tree/booting.txt
>> index 98253414b8..1b0dca1454 100644
>> --- a/docs/misc/arm/device-tree/booting.txt
>> +++ b/docs/misc/arm/device-tree/booting.txt
>> @@ -204,6 +204,10 @@ with the following properties:
>>      - "disabled"
>>      Xen PV interfaces are disabled.
>>  +    - no-xenstore
>> +    Xen PV interfaces, including grant-table will be enabled but xensto=
re
>=20
> Please use "All default" in front. So it is clear that everything is enab=
led but xenstore.

Ack.=20
>=20
>> +    will be disabled for the VM.
>> +
>>      If the xen,enhanced property is present with no value, it defaults
>>      to "enabled". If the xen,enhanced property is not present, PV
>>      interfaces are disabled.
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 707e247f6a..0b164ef595 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -2891,7 +2891,7 @@ static int __init prepare_dtb_domU(struct domain *=
d, struct kernel_info *kinfo)
>>              goto err;
>>      }
>>  -    if ( kinfo->dom0less_enhanced )
>> +    if ( kinfo->dom0less_feature & DOM0LESS_ENHANCED_NO_XS )
>>      {
>>          ret =3D make_hypervisor_node(d, kinfo, addrcells, sizecells);
>>          if ( ret )
>> @@ -3209,10 +3209,12 @@ static int __init construct_domU(struct domain *=
d,
>>           (rc =3D=3D 0 && !strcmp(dom0less_enhanced, "enabled")) )
>>      {
>>          if ( hardware_domain )
>> -            kinfo.dom0less_enhanced =3D true;
>> +            kinfo.dom0less_feature =3D DOM0LESS_ENHANCED;
>>          else
>> -            panic("Tried to use xen,enhanced without dom0\n");
>> +            panic("At the moment, Xenstore support requires dom0 to be =
present\n");
>>      }
>> +    else if ( rc =3D=3D 0 && !strcmp(dom0less_enhanced, "no-xenstore") =
)
>> +        kinfo.dom0less_feature =3D DOM0LESS_ENHANCED_NO_XS;
>>        if ( vcpu_create(d, 0) =3D=3D NULL )
>>          return -ENOMEM;
>> @@ -3252,7 +3254,7 @@ static int __init construct_domU(struct domain *d,
>>      if ( rc < 0 )
>>          return rc;
>>  -    if ( kinfo.dom0less_enhanced )
>> +    if ( kinfo.dom0less_feature & DOM0LESS_XENSTORE )
>>      {
>>          ASSERT(hardware_domain);
>>          rc =3D alloc_xenstore_evtchn(d);
>> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/as=
m/kernel.h
>> index c4dc039b54..ad240494ea 100644
>> --- a/xen/arch/arm/include/asm/kernel.h
>> +++ b/xen/arch/arm/include/asm/kernel.h
>> @@ -9,6 +9,25 @@
>>  #include <xen/device_tree.h>
>>  #include <asm/setup.h>
>>  +/*
>> + * List of possible features for dom0less domUs
>> + *
>> + * DOM0LESS_ENHANCED_NO_XS: Notify the OS it is running on top of Xen. =
All the
>> + *                          default features (excluding Xenstore) will =
be
>> + *                          available. Note that an OS *must* not rely =
on the
>> + *                          availability of Xen features if this is not=
 set.
>> + * DOM0LESS_XENSTORE:       Xenstore will be enabled for the VM. This f=
eature
>> + *                          can't be enabled without the
>> + *                          DOM0LESS_ENHANCED_NO_XS.
>> + * DOM0LESS_ENHANCED:       Notify the OS it is running on top of Xen. =
All the
>> + *                          default features (including Xenstore) will =
be
>> + *                          available. Note that an OS *must* not rely =
on the
>> + *                          availability of Xen features if this is not=
 set.
>> + */
>> +#define DOM0LESS_ENHANCED_NO_XS  BIT(0, U)
>> +#define DOM0LESS_XENSTORE        BIT(1, U)
>> +#define DOM0LESS_ENHANCED        (DOM0LESS_ENHANCED_NO_XS | DOM0LESS_XE=
NSTORE)
>> +
>>  struct kernel_info {
>>  #ifdef CONFIG_ARM_64
>>      enum domain_type type;
>> @@ -36,8 +55,8 @@ struct kernel_info {
>>      /* Enable pl011 emulation */
>>      bool vpl011;
>>  -    /* Enable PV drivers */
>> -    bool dom0less_enhanced;
>> +    /* Enable/Disable PV drivers interface,grant table, evtchn or xenst=
ore */
>=20
> The part after "," is technically wrong because it also affects other int=
erfaces. But I would drop it to avoid any stale comment (we may add new one=
 in the futures).

Ok . I will remove and will comment like this:
/* Enable/Disable PV drivers interfaces */
=20
Regards,
Rahul=

