Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD234130CC
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 11:39:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191603.341687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mScEp-0007uq-IS; Tue, 21 Sep 2021 09:38:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191603.341687; Tue, 21 Sep 2021 09:38:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mScEp-0007rY-EF; Tue, 21 Sep 2021 09:38:55 +0000
Received: by outflank-mailman (input) for mailman id 191603;
 Tue, 21 Sep 2021 09:38:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nbRU=OL=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mScEn-0007rS-NL
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 09:38:53 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.49]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 921f87ad-9d7e-4699-a595-d754c60ef4fd;
 Tue, 21 Sep 2021 09:38:50 +0000 (UTC)
Received: from FR0P281CA0056.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::6) by
 AM6PR08MB3029.eurprd08.prod.outlook.com (2603:10a6:209:48::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14; Tue, 21 Sep 2021 09:38:47 +0000
Received: from VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:49:cafe::7c) by FR0P281CA0056.outlook.office365.com
 (2603:10a6:d10:49::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.6 via Frontend
 Transport; Tue, 21 Sep 2021 09:38:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT051.mail.protection.outlook.com (10.152.19.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 09:38:47 +0000
Received: ("Tessian outbound 2e7020cc8961:v103");
 Tue, 21 Sep 2021 09:38:46 +0000
Received: from 2c9da993f3b6.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 85545CAA-61B3-4962-81F6-0903A1D03B47.1; 
 Tue, 21 Sep 2021 09:38:35 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2c9da993f3b6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 21 Sep 2021 09:38:35 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6639.eurprd08.prod.outlook.com (2603:10a6:102:154::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Tue, 21 Sep
 2021 09:38:32 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 09:38:32 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0336.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:18c::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 09:38:31 +0000
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
X-Inumbo-ID: 921f87ad-9d7e-4699-a595-d754c60ef4fd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xb84FUmQ0EMzccCYt/0WDSY++7GO+Xayqs8qAkuNc38=;
 b=ZCR2LOSO2U+p4noifOwMDSQ75U2Zx+2c6/IZdOiD3rHiL0A6HXepTWuCnsNwAoin0oDDqOCIT6Q4pg2xX7UNu9BMOiZcE4fsnHhcqzdUTTDFb6awdOnh0xsXTRo6kumspcyr8uJKzhpcx5JICkmN4sL486X2UTWuVoj9Ov9K8Ns=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3236b2941184db0a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcWgEcO3Le6+kqHEBLauYQbWdd55GgHPARDrwoB0GPs7i+CZ/QmKxhAPbc6FY256ZizOPKALzisJxL6owThRBPTwXHdChmA4ecdgxCoTH64E7CRNI/EFFSC9h/CyO6tv0OAp7h/xqhofVfeypP3Q/lLqqBiSqLy3jRPBrdaw7z0YjP/Erd3I7VVR3SFOiONXn4GOZJGujJal6vl2q2shAcvv1cvOFiik3M7HgimeswYPrCvaKSUrUUvKkj29YMcFT9cWDKTRO0qJRm3AGXtejfclaNozUh7RdFlm7ivQtnbCak4Sa4kty8s5DbeymuDCpM49c+LX5O/HECWh0KsOpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=xb84FUmQ0EMzccCYt/0WDSY++7GO+Xayqs8qAkuNc38=;
 b=Bp7it2I4Hjortl26Bv1DeF6a5jaHPhdSA/rEA7/ZxZs35JpS3zrJfCVqSK/xeR/sklPNp1MzSGmma1+S+YEdIqSnRjn1m0lfTDD50XFgaK3PkAq4umFhZ9E7Wg7jL8w4ohgpCnJc83WSTzprLKUTKwrPwEnlInTnrfBUJ/8fOOFb6r8nlnkaeEkeifjB/uLKqLH8W9vQTyYaWXMjMuVjQ/ZB/MUik3W52RnNRy7fy5ok5yiRJTKNBHaDhFmuFHXqhQMnm8+CG+SZesJ+/WJCHKQwq9jWAv2vdkUHQS3R2QOR54696yRj9WbK18iZvP5NZgF9Yj/Kl04DAUfJi4eWyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xb84FUmQ0EMzccCYt/0WDSY++7GO+Xayqs8qAkuNc38=;
 b=ZCR2LOSO2U+p4noifOwMDSQ75U2Zx+2c6/IZdOiD3rHiL0A6HXepTWuCnsNwAoin0oDDqOCIT6Q4pg2xX7UNu9BMOiZcE4fsnHhcqzdUTTDFb6awdOnh0xsXTRo6kumspcyr8uJKzhpcx5JICkmN4sL486X2UTWuVoj9Ov9K8Ns=
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 2/2] arm/efi: Use dom0less configuration when using EFI
 boot
From: Luca Fancellu <Luca.Fancellu@arm.com>
In-Reply-To: <alpine.DEB.2.21.2109171516270.21985@sstabellini-ThinkPad-T480s>
Date: Tue, 21 Sep 2021 10:38:25 +0100
Cc: Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <18531A94-ECF7-4840-A515-B161A4ABDEF4@arm.com>
References: <20210915142602.42862-1-luca.fancellu@arm.com>
 <20210915142602.42862-3-luca.fancellu@arm.com>
 <b3263ea5-b875-1c28-0e03-f911e0e97382@suse.com>
 <59F99E1E-C306-40BE-8B47-5D92ABF101F5@arm.com>
 <5bfb2544-402b-d6e1-9a8a-027e36a60acd@suse.com>
 <29091674-DCAE-4289-901E-9158FD029D96@arm.com>
 <125df38d-ac1f-c4a3-2ef9-1ce0f03e77c6@suse.com>
 <alpine.DEB.2.21.2109161255040.21985@sstabellini-ThinkPad-T480s>
 <28787ACF-F70E-49C8-B3E2-CFCE8E9B6AA7@arm.com>
 <alpine.DEB.2.21.2109171516270.21985@sstabellini-ThinkPad-T480s>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO4P123CA0336.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::17) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f89ede2-f185-4058-b2a4-08d97ce39c7c
X-MS-TrafficTypeDiagnostic: PAXPR08MB6639:|AM6PR08MB3029:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB30298B6A88E8FB8952AFFB2DE4A19@AM6PR08MB3029.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4KiP46nYiqWVU1dMVzxW2bc9Va/BuAWQ+xn5wukEtIw47zmWc+La0bsEZEC19O9C2QobY5UiZ1bZ5tocvs6gKV2AsqARHQrU1jGmobrjCkJ7snO+wZ87IwCt3d7K6gqdxmNc1ucfhkS9ec89vmutSzZGainiGWPPYrKF1OD1DrOSVKda5yqNCxj+Sbk00Bwwkxi/b7AaZoXAFJnEy2m/ob54R9eqOd5NfCvJ+MuBzsh0bXGQD9dFB4JlowOi9eTH86BKNkkIipJVQzQw09dWTGLwBwmkkSxCpwwYiVmeXzMhBWUAfPfwZzW70gO+CkB8AFYESWl9kTw81/L2gvuH70cR9NeRRIIt9GabpIJ1cz9W9ewdpI8kX3ZqXuAYfhA6dU3rl+1fWRvqHm+dMTebO8/2+gaqJ16XhDROdpQ4xJqBiDUAviwUBnBzQ86PgJIEP27B7fgIs6wjeHw5xot9QmyrI1Ko3O+lvFHcCOA7Z3Gc8lT8xMyYAaxYbBeqgIZsHOqr4Fy1csRgfu8EiEnx2hAoJCqdLRfwq3i6zYvRcmWZ5//Sb8cS7OOm4wAs68l655wXehd/0NmZM9utE00g6fQ9om0kUY9qM1j4ldQyND2I+8cNoiVdjE9I0oSrd+nuQax70u7v4E8R/AoGI8gHTk3RyCr7LSDs/pWduKXXnrIahqJ281SWuh2/dxjcRnhWWzd8wDFk8VpR5t/SttT/G73aQKyV0hxkQeSXCdex1WOUWAeQ0HKoyD5pewVn5NN2
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(508600001)(186003)(33656002)(5660300002)(2616005)(52116002)(26005)(83380400001)(30864003)(6506007)(38350700002)(8676002)(86362001)(53546011)(4326008)(8936002)(6486002)(956004)(38100700002)(66556008)(54906003)(6512007)(2906002)(316002)(66476007)(6666004)(66946007)(36756003)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6639
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0cd08a20-67cd-496f-5e2a-08d97ce39353
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jl12RhDsLClpt38mN+/r5J4qFUqz64cjqgGdNjJYco82CuIK7BR/yUPfuEwsqt9U3UYMh3knfIskzaAGt0e4/A8EujR6oRGPpqUR31gCQ595dpQV36G2VtAp2gjGRUp/AhtOA3+aQ7Kp+QMdfMpPtrrz2UvQ2od1XUV4g7XRHVlJ4Zjt8qMrUi7aunXO2TobqVgrhQC2EtCJIyLg1YKR+vufm8FAvUgD6DMaftHFbEo/ErcdaBt6uo0Yq07cmhoZz3M2TQg3qf8mbLejOBno875/e42OQ0GvZ/bvNl2cnx6MN4j3326/QkBKStLqavWbgwDePCE7wEFqPpWabwJVdZAqeX3e2mT/jjFtDwOn6sgp/YU5tcMp+Np7HTY+7kaIbMj/2LFPQ2yc0HtW3amFL7dDUqWu38TBQmjqmnlyXTf9deYYPrFjK2xlj30mKFrQGGtB9hVN1318yWq7AVwhrglCVM+FS6cnpZmhbNYYWnKJ/2ozDNtxwGKbmGdux4Ik4Otjv+CCGyWSJ6wLsWtWv6AK6FS/uFAx8I4t+YFub/Y+mk9L/0wiDSZsfEYykgFwOGVkSXJN9qQ+hsaNKGR+yCf5WwpCnDLvdpyJiXSJgAzdJktelMr8lb46yRj8BHyQh+xQHgnpaEV5/ew8SX5QRMbcbLH3JY0F4rybOYcNgY71CHFN0e8Kr6VFYJizwWNSmrAjAG0dqz1tgkedtnhDxifZqac1SF9/8mGXIPT3mow=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(6666004)(36860700001)(956004)(30864003)(4326008)(70586007)(2616005)(70206006)(336012)(2906002)(81166007)(316002)(6486002)(8676002)(53546011)(356005)(186003)(6506007)(5660300002)(36756003)(54906003)(82310400003)(6862004)(508600001)(26005)(33656002)(47076005)(83380400001)(6512007)(8936002)(86362001)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 09:38:47.2974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f89ede2-f185-4058-b2a4-08d97ce39c7c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3029



> On 17 Sep 2021, at 23:33, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Fri, 17 Sep 2021, Luca Fancellu wrote:
>>> On 16 Sep 2021, at 21:16, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>>>=20
>>> On Thu, 16 Sep 2021, Jan Beulich wrote:
>>>> On 16.09.2021 17:07, Luca Fancellu wrote:
>>>>> I explain here my understanding on dom0less, this feature is used to =
start domUs at
>>>>> Xen boot in parallel, the name is misleading but it doesn=E2=80=99t r=
equire dom0 to be absent.
>>>>>=20
>>>>> So if you have a dom0 kernel embed in the image, it's completely fine=
 to start it and it=20
>>>>> doesn=E2=80=99t have to be skipped.
>>>>>=20
>>>>> Here the possible user cases:
>>>>> 1) start only dom0 [dom0 modules on xen.cfg or embedded in Xen image]
>>>>> 2) start only domUs, true dom0less [no dom0 modules on xen.cfg or emb=
edded in Xen image, domUs on DT]
>>>>> 3) start dom0 and domUs [(dom0 modules on xen.cfg or embedded in Xen =
image) and domUs on DT]
>>>>=20
>>>> If that's the intention - fine. Stefano?
>>>=20
>>=20
>> Hi Stefano,
>>=20
>>> What do you mean by dom0 modules embedded in the Xen image? I am not
>>> familiar with it, but I imagine it doesn't involve any multiboot,module
>>> nodes in device tree, right?
>>>=20
>>> Putting aside "dom0 modules embedded in Xen image" that I didn't fully
>>> understand, there are three ways to load Dom0:
>>>=20
>>> - dom0 kernel (and ramdisk, optional) on xen.cfg
>>> - dom0 kernel (and ramdisk, optional) on device tree using the "reg" pr=
operty
>>> - dom0 kernel (and ramdisk, optional) on device tree using the "uefi,bi=
nary" property
>>=20
>> True for the #1 and #2, the last one is not implemented. The uefi,binary=
 property
>> for now is only used to load domU modules.
>=20
> Yeah, it is no problem that is not currently implemented, but from a
> device tree binding / efi interface perspective it should be possible.
>=20
>=20
>>> Then, the other use cases are:
>>>=20
>>> - true dom0less, domUs on device tree using the "reg" property
>>> - true dom0less, domUs on device tree using the "uefi,binary" property
>>>=20
>>> And of course all the possible combinations between Dom0 and DomU
>>> loading.
>>>=20
>>>=20
>>> Currently, patch #1 checks for the presence of a Dom0 kernel node and, =
if
>>> present, it decides not to proceed with xen.cfg. So if the Dom0 kernel
>>> node is *not* present, efi_arch_use_config_file returns true.
>>>=20
>>> However, this could be a true dom0less configuration without any Dom0
>>> kernel. If so, you might not want to load xen.cfg at all because it is
>>> not needed. In a true dom0less configuration, we probably want
>>> efi_arch_use_config_file to return false.
>>=20
>> In a true dom0less configuration we might need to read xen.cfg to retrie=
ve the
>> Xen command line,=20
>=20
> The Xen command line could also be on device tree
> (/chosen/xen,xen-bootargs).
>=20
>=20
>> but following the actual implementation of the common code
>> there is more. I=E2=80=99m going to explain.
>>=20
>> What efi_arch_use_config_file really does is not only choosing to read x=
en.cfg
>> or not. Following the common code (xen/common/efi/boot.c) and what its r=
esult activate
>> along the path, it basically decides if the UEFI stub is used as a loade=
r from filesystem
>> or not. We need the UEFI stub as a loader to be 100% UEFI and load our m=
odules.
>>=20
>> The original check basically says =E2=80=9Cif there are multiboot,module=
 in the DT, then some
>> bootloader has loaded in memory the required modules so I=E2=80=99m not =
gonna load anything
>> from the filesystem because I assume it puts everything in place for me =
to boot.=E2=80=9D
>=20
> OK, I am following. It looks like this is the source of the issue.
>=20
>=20
>>> From misc/efi.txt:
>> When booted as an EFI application, Xen requires a configuration file as =
described below unless a bootloader,
>> such as GRUB, has loaded the modules and describes them in the device tr=
ee provided to Xen. If a bootloader
>> provides a device tree containing modules then any configuration files a=
re ignored, and the bootloader is
>> responsible for populating all relevant device tree nodes.
>>=20
>> What I=E2=80=99m doing in patch #1 is restricting that check to just the=
 multiboot,module that are
>> Dom0 module, why? Because with the introduction of dom0less we need to s=
pecify
>> multiboot,modules for domUs, but the presence or not of dom0 modules is =
the only
>> Information we need to understand if the user decided to start Xen with =
everything
>> in places (modules in memory, xen command line, dtb) or if the job is de=
manded to the
>> UEFI stub and its configuration file.
>=20
> I don't think so. Imagine a case where the user has everything in device
> tree, doesn't need xen.cfg, but dom0 and domUs are specified as
> uefi,binary.
>=20
> We don't want xen.cfg but we do want to be able to load files from the
> filesystem. This might not be currently implemented but from an bindings
> perspective it should be possible.
>=20
>=20
>> By the configuration file you can also load in memory the Xen dtb, so Xe=
n can
>> be started as an EFI application without the DTB and then load it using =
the EFI stub.
>=20
> This can be very useful but it would follow the !fdt check and return
> true from efi_arch_use_config_file. So it doesn't really conflict with
> anything we would around multiboot,module and xen,cfg-loading.
>=20
>=20
>> I=E2=80=99m not against this new property =E2=80=9Cxen,cfg-loading=E2=80=
=9D, I just think it is not needed because
>> we have all the information we need without it and in any case we need t=
o read the
>> configuration file because otherwise we won=E2=80=99t have access to the=
 Xen command line.
>=20
> We don't necessarely need to read the Xen command line from xen.cfg :-)
>=20
>=20
>> Now I=E2=80=99m going to show you examples of all use cases that are val=
id with the introduction
>> of this serie:
>>=20
>> 1) Start Xen as EFI application and load only Dom0
>>=20
>>    Xen.cfg:
>>    [global]
>>    default=3Dxen_dom0
>>=20
>>    [xen_dom0]
>>    options=3D<Xen command line>
>>    kernel=3Dvmlinuz-3.0.31-0.4-xen [domain 0 command line options]
>>    ramdisk=3Dinitrd-3.0.31-0.4-xen
>>    dtb=3D<xen DTB>
>>=20
>>    DT:
>>    {no modification}
>>=20
>> 2) Start Xen as EFI application to load a true dom0less setup
>>=20
>>    Xen.cfg:
>>    [global]
>>    default=3Dxen_true_dom0less
>>=20
>>    [xen_true_dom0less]
>>    options=3D<Xen command line>
>>    dtb=3D<xen DTB>
>>=20
>>    DT:
>>    chosen {
>>        #size-cells =3D <0x1>;
>> 	#address-cells =3D <0x1>;
>>=20
>> 	domU1 {
>>            #size-cells =3D <0x1>;=20
>>            #address-cells =3D <0x1>;
>>            compatible =3D "xen,domain=E2=80=9D;
>>            cpus =3D <1>;
>>            memory =3D <0 0xC0000>;
>>=20
>>            module@1 {
>>                compatible =3D "multiboot,kernel", "multiboot,module=E2=
=80=9D;
>>                bootargs =3D "console=3DttyAMA0 root=3D/dev/ram0 rw=E2=80=
=9D;
>>                uefi,binary =3D =E2=80=9CdomU_kernel1.bin"
>>            };
>>=20
>>            module@2 {
>>                compatible =3D =E2=80=9Cmultiboot,ramdisk", "multiboot,mo=
dule=E2=80=9D;
>>                uefi,binary =3D =E2=80=9CdomU_ramdisk1.bin"
>>            };
>>=20
>>            module@3 {
>>                compatible =3D "multiboot,device-tree", "multiboot,module=
=E2=80=9D;
>>                uefi,binary =3D =E2=80=9CdomU_passthrough1.dtb"
>>            };=20
>>        };
>>=20
>>        domU2 { <as above> };
>>    }
>>=20
>> 3) Start Xen as EFI application to load Dom0 and DomUs
>>=20
>>    Xen.cfg:
>>    [global]
>>    default=3Dxen_dom0_domUs
>>=20
>>    [xen_dom0_domUs]
>>    options=3D<Xen command line>
>>    kernel=3Dvmlinuz-3.0.31-0.4-xen [domain 0 command line options]
>>    ramdisk=3Dinitrd-3.0.31-0.4-xen
>>    dtb=3D<xen DTB>
>>=20
>>    DT:
>>    chosen {
>>        #size-cells =3D <0x1>;
>> 	#address-cells =3D <0x1>;
>>=20
>> 	domU1 {
>>            #size-cells =3D <0x1>;=20
>>            #address-cells =3D <0x1>;
>>            compatible =3D "xen,domain=E2=80=9D;
>>            cpus =3D <1>;
>>            memory =3D <0 0xC0000>;
>>=20
>>            module@1 {
>>                compatible =3D "multiboot,kernel", "multiboot,module=E2=
=80=9D;
>>                bootargs =3D "console=3DttyAMA0 root=3D/dev/ram0 rw=E2=80=
=9D;
>>                uefi,binary =3D =E2=80=9CdomU_kernel1.bin"
>>            };
>>=20
>>            module@2 {
>>                compatible =3D =E2=80=9Cmultiboot,ramdisk", "multiboot,mo=
dule=E2=80=9D;
>>                uefi,binary =3D =E2=80=9CdomU_ramdisk1.bin"
>>            };
>>=20
>>            module@3 {
>>                compatible =3D "multiboot,device-tree", "multiboot,module=
=E2=80=9D;
>>                uefi,binary =3D =E2=80=9CdomU_passthrough1.dtb"
>>            };=20
>>        };
>>=20
>>        domU2 { <as above> };
>>    }
>>=20
>> So as you see every case is covered without the introduction of the
>> property.
>>=20
>> Please let me know what do you think.
>=20

Hi Stefano,

> I think that from an interface perspective (not a code perspective) we
> need to be able to account for cases like:
>=20
> 4) Start Xen as EFI application and load only Dom0
> no Xen.cfg
> DT:
>  xen,xen-bootargs
>  dom0/uefi,binary
>  domUs/uefi,binary
>=20
>=20
> But in any case, even disregarding this case, past experience has taught
> me that it is always better to have an explicit flag to trigger a new
> behavior, rather than relying on "guesswork". If we introduce
> "xen,cfg-loading", we are going to be a lot more future-proof that if we
> don't introduce it in terms of backward and forward compatibility in
> case we need to change anything.

I see your point, for sure the DT is a more powerful tool than the simple
text configuration file and it would be the best interface.
However I think we are moving into the direction where x86 and arm
are going to diverge even if we can have a common interface for them
(the configuration file).

For that reason I=E2=80=99m asking if you would be willing to accept a solu=
tion
where we introduce a new keyword in the configuration file:

dom0less=3D<dtb> OR domu_guests=3D<dtb> OR I=E2=80=99m open to suggestion.

Where the pointed dtb contains the domU domains:

/dts-v1/;

/ {
    /* #*cells are here to keep DTC happy */
    #address-cells =3D <2>;
    #size-cells =3D <2>;

    domU1 {
           #size-cells =3D <0x1>;=20
           #address-cells =3D <0x1>;
           compatible =3D "xen,domain=E2=80=9D;
           cpus =3D <1>;
           memory =3D <0 0xC0000>;

           module@1 {
               compatible =3D "multiboot,kernel", "multiboot,module=E2=80=
=9D;
               bootargs =3D "console=3DttyAMA0 root=3D/dev/ram0 rw=E2=80=9D=
;
               uefi,binary =3D =E2=80=9CdomU_kernel1.bin"
           };

           module@2 {
               compatible =3D =E2=80=9Cmultiboot,ramdisk", "multiboot,modul=
e=E2=80=9D;
               uefi,binary =3D =E2=80=9CdomU_ramdisk1.bin"
           };

           module@3 {
               compatible =3D "multiboot,device-tree", "multiboot,module=E2=
=80=9D;
               uefi,binary =3D =E2=80=9CdomU_passthrough1.dtb"
           };=20
    };

    domU2 { <as above> };

};


So that the user cases we discussed are valid:

1) Start Xen and load Dom0:
  =20
   Xen.cfg:
   [global]
   default=3Dxen

   [xen]
   options=3D<Xen command line>
   kernel=3Dvmlinuz-3.0.31-0.4-xen [domain 0 command line options]
   ramdisk=3Dinitrd-3.0.31-0.4-xen
   dtb=3D<xen DTB>

2) Start Xen and load only domUs (true dom0less)

   Xen.cfg:
   [global]
   default=3Dxen

   [xen]
   options=3D<Xen command line>
   dom0less=3D<dom0less DTB>
   dtb=3D<xen DTB>

3) Start Xen and load Dom0 and DomUs

   Xen.cfg:
   [global]
   default=3Dxen

   [xen]
   options=3D<Xen command line>
   kernel=3Dvmlinuz-3.0.31-0.4-xen [domain 0 command line options]
   ramdisk=3Dinitrd-3.0.31-0.4-xen
   dom0less=3D<dom0less DTB>
   dtb=3D<xen DTB>


With this change we will be consistent across x86 and arm UEFI boot
start procedure, we won=E2=80=99t touch the current check on multiboot,modu=
les
because it will be valid, we will have a way to boot dom0less and it
requires less testing for the changing in the common code.

Please let me know what do you think about that.

Cheers,
Luca



