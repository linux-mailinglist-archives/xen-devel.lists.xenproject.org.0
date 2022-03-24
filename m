Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEDB4E63EC
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 14:14:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294303.500347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXNIM-0000Fh-65; Thu, 24 Mar 2022 13:14:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294303.500347; Thu, 24 Mar 2022 13:14:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXNIM-0000CI-27; Thu, 24 Mar 2022 13:14:30 +0000
Received: by outflank-mailman (input) for mailman id 294303;
 Thu, 24 Mar 2022 13:14:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eW/x=UD=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nXNIK-0000CC-FY
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 13:14:28 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe05::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54a6f688-ab74-11ec-a405-831a346695d4;
 Thu, 24 Mar 2022 14:14:27 +0100 (CET)
Received: from AM6PR10CA0052.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::29)
 by DBBPR08MB5979.eurprd08.prod.outlook.com (2603:10a6:10:205::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.19; Thu, 24 Mar
 2022 13:14:24 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::67) by AM6PR10CA0052.outlook.office365.com
 (2603:10a6:209:80::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Thu, 24 Mar 2022 13:14:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.18 via Frontend Transport; Thu, 24 Mar 2022 13:14:23 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Thu, 24 Mar 2022 13:14:23 +0000
Received: from 89412f60e5b5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 16CBAAEA-A12A-4D5E-97AD-3025D1F8CF99.1; 
 Thu, 24 Mar 2022 13:14:11 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 89412f60e5b5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 24 Mar 2022 13:14:11 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM9PR08MB6196.eurprd08.prod.outlook.com (2603:10a6:20b:283::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Thu, 24 Mar
 2022 13:14:11 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62%3]) with mapi id 15.20.5102.018; Thu, 24 Mar 2022
 13:14:10 +0000
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
X-Inumbo-ID: 54a6f688-ab74-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+ZNNO57lwXp6OS5Qzumv2jLyCPJzdejkFnuBLLYtG4=;
 b=IqTE1DDMIGEKtwFeSFriQqMMplvNyGZwOGzle3Rym7j5LPUqh3eRRByXTgnWOR+54HY9LziC3XBP5M6xjxRJUOh7R2QFtvSUKN6TgA85PuCqWy8cOyhTmYjFCZxVWKLzJey5d93ndn4SUSOfKiLgGkYLzZNo3mSKQFEKLPcq4M4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d8e79a538ecbcc37
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DdcIvQ2Scut+KXrz2kEwz6xG1S3mqgcf+NFfh4LV6vh/iT1EX1yuGSnUp1qNB2zHeNtBJC2i+7HuXakTreh/uDM3ouOwfm5psNRqx9asLlmRqFCZWvq5iCrZFGCrAeDXZ6mDXyLBcnppKB2NlLfL4CvU3Ln8wxWVoJOZYErcklrSYX0iTK+04UEikIjfLuYP8vPgIQPNcvvrbGjP5e327GrkSPlWuLG9mMiP1GicgJVWGb6kg1uLqeDlsK086M//ZUQ1YvmaPFXILprbNuHlaiq99XXlmkoVCCtuqsfElSe/A3S++ZvD2zEbfgxLyMCv9eOdTQ6s3eH0cgC3gkG+XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+ZNNO57lwXp6OS5Qzumv2jLyCPJzdejkFnuBLLYtG4=;
 b=IMtVGTUzJUPbpJPDtg857f8LZqGpc2rKkOd4AcpX3i8MD0S7Mm3Hm/0nf9WJ8HTaJNmgNlPJGfnAzEH2mup4gFEaNEnylT/RolYSVIboJ0QFcGA4fnAyqyZq9iqiui5gByt6MMF6Z/CQNg3wxqVnf9IOL9eJtCYcvj+PPTJP4p+IDqVr2VHWrHQcVgwyvNqMHidGTsmH6IlRDfQc2m1fW+yNE5HxGJBn4QARgKom5HsWKBCRrVlV0YY88IgfKxgq4M3x3E0r2VYEt1Q4/FStvuCZV6p6STcaATW6TdLimyKaxAXrAZOREMTirSEUl58BThwNyIaC4cGuJ3JfIuwoKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+ZNNO57lwXp6OS5Qzumv2jLyCPJzdejkFnuBLLYtG4=;
 b=IqTE1DDMIGEKtwFeSFriQqMMplvNyGZwOGzle3Rym7j5LPUqh3eRRByXTgnWOR+54HY9LziC3XBP5M6xjxRJUOh7R2QFtvSUKN6TgA85PuCqWy8cOyhTmYjFCZxVWKLzJey5d93ndn4SUSOfKiLgGkYLzZNo3mSKQFEKLPcq4M4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, George
 Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Michal Orzel
	<Michal.Orzel@arm.com>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [RFC PATCH] xen/build: Add cppcheck and cppcheck-html make rules
Thread-Topic: [RFC PATCH] xen/build: Add cppcheck and cppcheck-html make rules
Thread-Index: AQHYP279DnP7J8Edsk+NG7Po4Qnn9azOgP+AgAACOoA=
Date: Thu, 24 Mar 2022 13:14:10 +0000
Message-ID: <22347566-F8A0-44B1-AD01-44D237B893C5@arm.com>
References:
 <77c79e86050eef2b706ee11e64183d57a0f5bcee.1648119732.git.bertrand.marquis@arm.com>
 <aff044ff-2a46-527d-9237-802487351bbc@citrix.com>
In-Reply-To: <aff044ff-2a46-527d-9237-802487351bbc@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: f8d7185c-ad66-4c2a-27f1-08da0d98372a
x-ms-traffictypediagnostic:
	AM9PR08MB6196:EE_|VE1EUR03FT025:EE_|DBBPR08MB5979:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB59794B0A52AE10B293F822149D199@DBBPR08MB5979.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 sw/tEkkrHfIeNzOkfzEcbncRcifmUHBxAuBpa7Ag7q/A7s+ZJPli0uJCLXXZ7qJJEyPMMDG2NR8HCqqbglwkPb8d8oblL3bjcufO7LFf9vA2m6PLEqc0q3Hz3v0W6PX8Cq9UPCk5gjCqZLI+X+go01a0VHNJ0L/A9JMZ/Gt5zszp6bPekz9ggKFai9NDSlP7KN9Doyyq4DVobGNf05T2vTZlFT97DpMZvJeei6a4IeQd0U5vR4JJQz8KT+t109+vhLVJhtqFEmG18jAfInVabunLDlDnMCsnlO4cq5c8Jg3bKFcDMY0I6Y/7tEwZipwc5bj40fc33pwu+g4j62NDRQXHUvr3tm5ItP8+lkB7lfC00j14MF4tXJSpyTUhez16Qakkzfmp5L49ExvJjerIOnDtF6soYuH6tVjCKSNiIfdNFvlMjwsQ7OQ1Znimk2gzi7ucxJXNY0nZ65gMvu8BL7aca7whppBtmUiYNTBDEZ1smFJc+b7nJtC86wkZQTM5sKQ+LAO6gND9WupX8ezi+IR7iFyxsxrnihJQX5oUd8gcWXqY5/fyMobzftjwgdLohI+laQlVxWD5iXXXHFv46gQWUVy9u2c0bKwa1DwajjjUoFG58x16wSfriKKvy+q8/iBVe57Gq9L4m17L+1gK2NEd02e41qwbziLkyX8SWr1kZ1EYpf808Or6Fgtvu/MaqTfdoKNm7TPhpgFK34rD20s7F7EG1DvGqMHlyXtSgO4Gh0qPRkFE86DEH9V5qvHdju8wAMzDKKUoLC3eOzi7GO7cd8KkXqLMmNzJYLZ9wtV4PcwcvIRrUzQbAEDpUb+5
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(66946007)(64756008)(66446008)(76116006)(66476007)(53546011)(4326008)(6512007)(5660300002)(33656002)(91956017)(6506007)(2906002)(8936002)(316002)(54906003)(6916009)(36756003)(66574015)(186003)(508600001)(83380400001)(86362001)(8676002)(38070700005)(6486002)(26005)(38100700002)(122000001)(2616005)(71200400001)(966005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <762CA97ED318724386077F8E3A7F2187@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6196
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	72214e6f-b51b-4f25-dc93-08da0d982f5b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BJ8BbTUO0+0QlvTpP+Nm4qXM/0GbLstYXJ8dM0dGL/ylAbqvHzndngv8ZRLLDz404+ekDei+/lN5uPKkZntS42XCfneLMWjHtaUpX0d6QCdx+mNXzNUyEgJbl/yltl0wmM9a2y6DX65u0qW+L/528EVmVjoLI2/Ygi/M0u4qsu+3cKOFvAPlCRid91c65qfXrtz4hjNMs8pc8sRYwtpT3hWgva4zf6IUahJxaE/FBRrXVk4iuil+0cq01/oxsZVFmaUp2xVM2Yd+/EQQhS+iqM+GayzQyqKRV+5xMBcqJQIzD3Z2sKS7rlNS58Aa0jm9EADwPiXHH/scgymmI+VAuLJoMlKJQRDhUIBkNr5u8/lzdPz4aaSwKdUT8UkxMJ+zarwNYBEuvpVVwejwkV8WOUa/PyvBSimuS3tXcaWyaRrMCuocbRTIS06lqu4njy5UQJlMSkk31FsOcLpNTat1FRusR9lKNJXaAdljgznUkAagrKUYH6IWuSfc5nP0sdX9bLukoHJ+1ykV6lMC5fJVF3F1eDnHsYSViTpzA6IIG7fD03Do6efX5Noto4io03YypFN1YqVDpVtjJVA700gDFrQyd3QR+UK6CUv/jl5w6ARLQvFXF7kcuIjNh3cF7r5RSNBPtY1Bxj7DasiU+AhlI4jURTRuy8uPFuQhwnEkJLhVsCJawfaGUa8TH5sU9NyL2kxgm+Y5TWNHibWpTPpPWsjBVupKM4sp3uGPexOAR/Cva+Jz45OOl8z+8jkxaqhGnRCAXKMynZsur+DvLdcyYQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(83380400001)(8676002)(36756003)(66574015)(54906003)(316002)(107886003)(26005)(336012)(2616005)(40460700003)(186003)(70206006)(47076005)(86362001)(70586007)(82310400004)(8936002)(6862004)(4326008)(6512007)(81166007)(356005)(33656002)(508600001)(53546011)(6506007)(6486002)(5660300002)(966005)(36860700001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 13:14:23.7108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d7185c-ad66-4c2a-27f1-08da0d98372a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5979

Hi Andrew,

> On 24 Mar 2022, at 14:06, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> On 24/03/2022 11:04, Bertrand Marquis wrote:
>> cppcheck can be used to check Xen code quality.
>>=20
>> To create a report do "make cppcheck" on a built tree adding any options
>> you added during the process you used to build xen (like CROSS_COMPILE
>> or XEN_TARGET_ARCH). This will generate an xml report xen-cppcheck.xml.
>>=20
>> To create a html report do "make cppcheck-html" in the same way and a
>> full report to be seen in a browser will be generated in
>> cppcheck-htmlreport/index.html.
>>=20
>> For better results it is recommended to build your own cppcheck from the
>> latest sources that you can find at [1].
>> Development and result analysis has been done with cppcheck 2.7.
>>=20
>> The Makefile rule is searching for all C files which have been compiled
>> (ie which have a generated .o file) and is running cppcheck on all of
>> them using the current configuration of xen so only the code actually
>> compiled is checked.
>>=20
>> A new tool is introduced to merge all cppcheck reports into one global
>> report including all findings and removing duplicates.
>>=20
>> Some extra variables can be used to customize the report:
>> - CPPCHECK can be used to give the full path to the cppcheck binary to
>> use (default is to use the one from the standard path).
>> - CPPCHECK_HTMLREPORT can be used to give the full path to
>> cppcheck-htmlreport (default is to use the one from the standard path).
>>=20
>> This has been tested on several arm configurations (x86 should work but
>> has not been tested).
>>=20
>> [1] https://cppcheck.sourceforge.io/
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>=20
> Does CPPCheck have configurable errors vs warnings?  Should we wire this
> into CI so we can fail builds which introduce errors that we've already
> managed to purge from the codebase?

No we cannot configure which findings are errors or warnings.
What we can (and probably will) do is create a list of cppcheck rules that =
we
want to check and pass that to cppcheck (can be done using a text file). On=
ce
this is done and all findings are solved we should definitely add cppcheck =
to the
CI and fail builds when errors are introduced.

>=20
> Also, please include Anthony on future patches, given the extent of
> makefile changes.

I will for sure.

Cheers
Bertrand


