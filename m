Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E0C4E63B1
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 13:54:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294296.500325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXMyv-0005bc-3r; Thu, 24 Mar 2022 12:54:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294296.500325; Thu, 24 Mar 2022 12:54:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXMyv-0005YX-02; Thu, 24 Mar 2022 12:54:25 +0000
Received: by outflank-mailman (input) for mailman id 294296;
 Thu, 24 Mar 2022 12:54:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eW/x=UD=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nXMys-0005Y6-Q6
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 12:54:22 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85f5af85-ab71-11ec-8fbc-03012f2f19d4;
 Thu, 24 Mar 2022 13:54:21 +0100 (CET)
Received: from AM6P195CA0058.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::35)
 by AM9PR08MB7257.eurprd08.prod.outlook.com (2603:10a6:20b:430::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.19; Thu, 24 Mar
 2022 12:52:08 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::d8) by AM6P195CA0058.outlook.office365.com
 (2603:10a6:209:87::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Thu, 24 Mar 2022 12:52:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.18 via Frontend Transport; Thu, 24 Mar 2022 12:52:07 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Thu, 24 Mar 2022 12:52:06 +0000
Received: from 6639cf076f09.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E39BBC88-F02F-488C-800A-542AFFEB233D.1; 
 Thu, 24 Mar 2022 12:52:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6639cf076f09.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 24 Mar 2022 12:52:00 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DBAPR08MB5736.eurprd08.prod.outlook.com (2603:10a6:10:1a9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Thu, 24 Mar
 2022 12:51:53 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62%3]) with mapi id 15.20.5102.018; Thu, 24 Mar 2022
 12:51:53 +0000
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
X-Inumbo-ID: 85f5af85-ab71-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XJwMMejm9GXSvgCe1exxwxvD/4wDjN8iPVcdEoB9SM=;
 b=p3YHuIeuH/vNAQ8deY/NsjM2xGcddoG6VtUoJU3c8RArBmLDHSaIAESzEQZGqo6dAyzQV6PtWGUh6Jktr1gSLSciH0D3uDVQe+O9sB3izGUH4POU5KAUG3RI8gRKyFJtA5v4AknNc5hnE39/1L9riVCFSk9yhVrUYrQGfLp4+f0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: dc2af07565a36faf
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWNKrMWl7M6N5MuZzaLjXJwlGAHJq2t/kqk6Qec7zwIg6Hr3U204EvGMJiNFzP/Yx+u3m2ZyyGzoMzWJQBQrkJoD7MYppf32KCAQKTVUcJJdvyeXNY29AFRYnqmTl1AoMtVpHYc5A361OQ5sSnpMfAcM3IIfjNS5+5QrJmMll0riKiftdJpYKYcmHHFsBmbvZLeD+ZL/zTmswTKEVLXNNuVezvCFy9pu+tTWgAITD/Z56vmjlgf5M0ljcQw86jAyv9bFvAeeO8JKE9m5ddfTPY3TSbf7Mlv59iG0ve9klwU5QiDck83v6svUwO2xChDt6alTHx+gT44AVhZTP6o3RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3XJwMMejm9GXSvgCe1exxwxvD/4wDjN8iPVcdEoB9SM=;
 b=CEgdWIbYfAWFCzHm/kzD1diXMVKE8ZOuHkunwf6bVRfBcSoITkZEnZfaZnLxt1Zk8v9bmRAIFPPYvI9FEpsOapHIfZEsG4tdPmcacgaTpDJNVZRAiWI/jHGXPUqmsYNxsUydEcXZ3aF2j3zwVdg5t//pJgvxXSXEscFldCWG2mjQpjvukpHRL9tW7/3eZhmaR0vJzroipxI3KnrwDchFYbFyOOiFZEvD4o4rSn/vti1jlzPuz2xzPcKqmHnQqPEUBQYaXu5mMcl4FnhSsWYj9M0Wm0V4hopmq8FOekaegPqXOqrbmiIGDcSqt7xILUHCJ+Kevhf1/wLyqJN7REC1Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XJwMMejm9GXSvgCe1exxwxvD/4wDjN8iPVcdEoB9SM=;
 b=p3YHuIeuH/vNAQ8deY/NsjM2xGcddoG6VtUoJU3c8RArBmLDHSaIAESzEQZGqo6dAyzQV6PtWGUh6Jktr1gSLSciH0D3uDVQe+O9sB3izGUH4POU5KAUG3RI8gRKyFJtA5v4AknNc5hnE39/1L9riVCFSk9yhVrUYrQGfLp4+f0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Michal
 Orzel <Michal.Orzel@arm.com>
Subject: Re: [RFC PATCH] xen/build: Add cppcheck and cppcheck-html make rules
Thread-Topic: [RFC PATCH] xen/build: Add cppcheck and cppcheck-html make rules
Thread-Index: AQHYP279DnP7J8Edsk+NG7Po4Qnn9azObqSAgAAOWoA=
Date: Thu, 24 Mar 2022 12:51:52 +0000
Message-ID: <B72F2112-CDA2-488E-9F61-EF59767F51FA@arm.com>
References:
 <77c79e86050eef2b706ee11e64183d57a0f5bcee.1648119732.git.bertrand.marquis@arm.com>
 <60d17fb0-1a1a-0793-5989-506f03f143b7@xen.org>
In-Reply-To: <60d17fb0-1a1a-0793-5989-506f03f143b7@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 53353a85-5855-43a9-0850-08da0d951a95
x-ms-traffictypediagnostic:
	DBAPR08MB5736:EE_|VE1EUR03FT025:EE_|AM9PR08MB7257:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB7257EF621E4DEF9BF5CD3C7B9D199@AM9PR08MB7257.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /mIN6eDeTxbAg+5uaw2ojuWCpXN6V9mfz88mnRUXkwE+g9hKMKu5pQKOvbef+mLew/14IheT0ex18dn3IRGoupcbfvTTMDfQSh54a7ZFUf4YFuZdaXgxT4lX2qrbAIcNJ3T9omEyIe2b3VCYYWF23hunUVOhOIkJtqiwyOD0l1SLSEVBllhn5yYhAfEel7a0lgN0yDotD4KMBi8jb/uHUDiv+ofwNb9WLmyzxynz60dKCKPkMQd7EbK8JbLgdk6jG8V63NT2gbwSIWxKtNmwHSiIBrjxgIDQo4l65EVi5thQokfj4UNdZHj4TkmYb5FcV3TvQP28OlvZgKXfpqnQ4IM6EE+pDUc2ph3h0dQfeaaofyIsd+yl03bgWBSFW36q1Ls/RoACUT56OgDTsXtS9v3HgreprP8vVQuHTXoGhaJojzry6q+KDdl94IM1Hm06MzSaniTmul+pDIipIjYIO0ZaiwvbMClskSoOD37mKCQqLRMAtdg2V2q0gzJGpF82HjKisbRSiWF+Jf8dmXU/6V1+8+42nirvXmeOhshhrRFEZkKvfRkzgcoA/cW0m7r3UvKvlOug2o39NG+vVKCyGB0C2H2hyRHfqJLmT6vrKeNm/uhIKTfal6wpCxeletxDmYa1ui5wR5EzR+OaDME4Q8MBq/8ZErvlouMNnthsx9JR6pewzf7BcTwJ22XQc7gqCT+gbynZraQBSotEaHcuamErhXsJim6NGgohJhts7IFhVjhh1TLMIkVsmdfImoLQI/XQGCqb37X3MPTnBOm1Q6RS2JjRdbrGDSjL9nPYRQRv+pJsite6FO1/uCMhfLwF
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(6512007)(53546011)(66574015)(86362001)(26005)(2616005)(186003)(122000001)(38100700002)(38070700005)(66476007)(64756008)(66446008)(5660300002)(33656002)(8936002)(66946007)(91956017)(76116006)(36756003)(66556008)(4326008)(8676002)(2906002)(316002)(6486002)(966005)(6916009)(54906003)(71200400001)(508600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <812903B651F94F4DB213907CDA9EB8B3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5736
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7cf4c37e-c0b9-48ac-8b66-08da0d951206
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UOpW8p7qSrfM51AW89pcB5b0NvW7JIZCDuIQWhyibQu1e+yV5oGxVVNj+bHCuAtotLq7E6ZMC926NYin5ZrSbMSVjeknmSS5Ub2f+ZNSJQqpnqSRxhXh0Hnx4pc3CU6kRc97zeqGD3HmSODo8HpLSlIaC8jJgkw2TWG0MUDc0/VNAzb1OFwG8uZXYThmqJae6qipMA6trersfPIqb/67IBA3e8xb/knURv74FXTbgLfimSeShlBA86nt2Zq/X2nTD680aTI7sa3xWF51qvIqW8OKLfauwLLaWKw6jixc3b8V6YpVwQucseDt6zDZE50yss25YXDCydVHWMcy9shVl7DGuDh1yE+8AiD4a0dFP96fHDzpVYi6KkGhvdw4YSpsFURH41g5iEDmAaW1o+2AraVqM/KcUtFA/SLr8uPwQOdrXZXKuv1k2eHDhX9rRPZC6mfZV5Vt1kN+6cri9saGze1mg96FdZh8x4JWOdqwVDvNuOWUxGqHTVcZK/i4Q/AcuU68LkUKjj2t53lNZooHKGBqR1MXBatNPMzOjBG6eWBiHHiQ1RWJ/dprvVmdIMDA25LRYuEl6siq7r7btG7Ua5mvBLCIDrJ/29cOn4gnrApW3hbPAo4yY8MF+SzTIWrDN3XdmUKlxw5u8T7pEYp7WvYWDD2AihMR1312m8LEahMJ9ESKUqfGQ96JR5pMxmxQPsf+myOsM06HeJjBG0zFuRDEqrXliw89AqeKH6DtXe1oDNRAwU7rdD9AQ5OZvDLlb6mHCwOY4r4k1KJvHjqFYA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(82310400004)(36860700001)(86362001)(6512007)(356005)(81166007)(966005)(6506007)(33656002)(2906002)(6486002)(498600001)(4326008)(8676002)(70586007)(6862004)(40460700003)(70206006)(66574015)(47076005)(336012)(2616005)(26005)(53546011)(36756003)(186003)(5660300002)(54906003)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 12:52:07.2671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53353a85-5855-43a9-0850-08da0d951a95
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7257

Hi Julien,

> On 24 Mar 2022, at 13:00, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 24/03/2022 11:04, Bertrand Marquis wrote:
>> cppcheck can be used to check Xen code quality.
>=20
> Is there anything we should be concerned of in the initial report?

Nothing major no.
Michal will soon push a serie with a first set of fixes, mostly related to =
unused variables.

>=20
>> To create a report do "make cppcheck" on a built tree adding any options
>> you added during the process you used to build xen (like CROSS_COMPILE
>> or XEN_TARGET_ARCH). This will generate an xml report xen-cppcheck.xml.
>> To create a html report do "make cppcheck-html" in the same way and a
>> full report to be seen in a browser will be generated in
>> cppcheck-htmlreport/index.html.
>> For better results it is recommended to build your own cppcheck from the
>> latest sources that you can find at [1].
>> Development and result analysis has been done with cppcheck 2.7.
>=20
> We want to write down the minimum version of cppcheck we are going to sup=
port. My suggestion would be to use the version you picked for your develop=
ment.

Agree, 2.7 (current stable) should be the one as we had some unstable behav=
iours with other versions.
Should I put that in the main readme ?

>=20
>> The Makefile rule is searching for all C files which have been compiled
>> (ie which have a generated .o file) and is running cppcheck on all of
>> them using the current configuration of xen so only the code actually
>> compiled is checked.
>> A new tool is introduced to merge all cppcheck reports into one global
>> report including all findings and removing duplicates.
>> Some extra variables can be used to customize the report:
>> - CPPCHECK can be used to give the full path to the cppcheck binary to
>> use (default is to use the one from the standard path).
>> - CPPCHECK_HTMLREPORT can be used to give the full path to
>> cppcheck-htmlreport (default is to use the one from the standard path).
>> This has been tested on several arm configurations (x86 should work but
>> has not been tested).
>> [1] https://cppcheck.sourceforge.io/
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>> ---
>>  .gitignore                           |  3 ++
>>  xen/Makefile                         | 75 +++++++++++++++++++++++++++-
>>  xen/arch/arm/include/asm/processor.h |  4 +-
>>  xen/include/xen/config.h             |  4 ++
>>  xen/include/xen/kconfig.h            |  5 ++
>>  xen/tools/merge_cppcheck_reports.py  | 73 +++++++++++++++++++++++++++
>=20
> In the long term, I think it would be useful if we generate the report re=
gularly. We might be able to hook the script that generate https://xenbits.=
xen.org/docs/.

Agree

>=20
>> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include=
/asm/processor.h
>> index 852b5f3c24..0b4ba73760 100644
>> --- a/xen/arch/arm/include/asm/processor.h
>> +++ b/xen/arch/arm/include/asm/processor.h
>> @@ -219,9 +219,11 @@
>>                           SCTLR_Axx_ELx_A    | SCTLR_Axx_ELx_C   |\
>>                           SCTLR_Axx_ELx_WXN  | SCTLR_Axx_ELx_EE)
>>  -#if (SCTLR_EL2_SET ^ SCTLR_EL2_CLEAR) !=3D 0xffffffffffffffffUL
>> +#ifndef CPPCHECK
>> +#if (SCTLR_EL2_SET ^ SCTLR_EL2_CLEAR) !=3D 0xffffffffffffffffULL
>>  #error "Inconsistent SCTLR_EL2 set/clear bits"
>>  #endif
>> +#endif
>=20
> Why is it necessary?

The ULL was an attempt to fix but did not work. I will remove that in the n=
ext version.
Here cppcheck preprocessor is wrongly generating the error for a reason tha=
t I could not understand, hence the ifdef.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


