Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB22746FEBE
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 11:27:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243752.421761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvd7p-0006RH-1R; Fri, 10 Dec 2021 10:27:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243752.421761; Fri, 10 Dec 2021 10:27:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvd7o-0006OM-UI; Fri, 10 Dec 2021 10:27:36 +0000
Received: by outflank-mailman (input) for mailman id 243752;
 Fri, 10 Dec 2021 10:27:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbv1=Q3=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1mvd7m-0006OD-Kt
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 10:27:34 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8799b1c-59a3-11ec-9d12-4777fae47e2b;
 Fri, 10 Dec 2021 11:27:32 +0100 (CET)
Received: from DB7PR05CA0002.eurprd05.prod.outlook.com (2603:10a6:10:36::15)
 by AM8PR08MB5732.eurprd08.prod.outlook.com (2603:10a6:20b:1d4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Fri, 10 Dec
 2021 10:27:29 +0000
Received: from DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::c) by DB7PR05CA0002.outlook.office365.com
 (2603:10a6:10:36::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12 via Frontend
 Transport; Fri, 10 Dec 2021 10:27:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT060.mail.protection.outlook.com (10.152.21.231) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.12 via Frontend Transport; Fri, 10 Dec 2021 10:27:29 +0000
Received: ("Tessian outbound 1cd1a01725a6:v110");
 Fri, 10 Dec 2021 10:27:28 +0000
Received: from f7557812f8b8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 41CCE805-A939-4ACE-AE4C-17FFF1C61A4C.1; 
 Fri, 10 Dec 2021 10:27:07 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f7557812f8b8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Dec 2021 10:27:07 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6893.eurprd08.prod.outlook.com (2603:10a6:102:13f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Fri, 10 Dec
 2021 10:26:56 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::b9c9:c5dc:15e:b622]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::b9c9:c5dc:15e:b622%5]) with mapi id 15.20.4755.024; Fri, 10 Dec 2021
 10:26:56 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0496.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1ab::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.21 via Frontend Transport; Fri, 10 Dec 2021 10:26:55 +0000
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
X-Inumbo-ID: c8799b1c-59a3-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSMWwai/sh9sNCKstRZt02G+hTCv/YcrVajAiDcm4UI=;
 b=iWJG4r6Dkm7YOm0Doe6XNg38q4RONAxg4PPQo/DF6hK4aaqcwYQRyExH7/6qnZEWrNj5JswsFCsuQamcAX6TsCcK8D/x9ksrFWLdrwG6Lb3XIET6EUgpeW3Q2MGj5wLYzw7l4Mt0i3NW1TLV+rHPpf42zBZ7tzzS8qohg64HccA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 13fab0b08e7e109e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2a0s0RAQvYf5rcPkgp8n87inNxIr7P1TaoeuTT1jj5aEmsf14IG3adXEZWEAabHvxI1ja+wh6SZE1JBqh7aMjwru0ICGyXA3JBI5nxhVlu8wlXVI77FkkVHyHYE/bB0TaMZbflPeOQasq4OYGVGl8s8qCUmfc1bfaKj+BQclzSQVlau8jj8TtRUKLuHmpMlepCzi4PLe3gIJ0T3itLLmvrcXKYSYVYZNjdG5asomDRy9mW95nY6Fstd39trQXsjRL6DR3EMRU8Fp+GMZZvDBZZkBnBv6JOAGSxnFqJEJGRkFVTzjVKLbJVybf7ME8ilsKTEdTMuFdiOTbI5WjSfng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSMWwai/sh9sNCKstRZt02G+hTCv/YcrVajAiDcm4UI=;
 b=C574HQzvJw3JowxC6w9s0S5LWI85kS55vAeOyTZYqP7E7cwSx597863T/iSyPa8kdFiI+c4w/d1b2q2aCjYqFBI55lZkjQShKFDj92TdZ1b2xfX+AXXnQ25RkPOXkapJPoT3QNLW5o8+pWgFLB/46HiqCJfVuGJzGfGtJBKEYCINfyj/PaokKWy7s5OtgJdmTGzvVaDOqx4u+8EXmAED4hP4NmNUJ/XrbPGHSkz5VEGjXaOUr5tEWn6Gbhd9UNmk4Oj1iNX6Z5QzRbvUUPZSIvlM7JXSvjT3Zvhfa4zc5uQkrSjTzj/3DaduqO3nb5Owp8+6lM0XCSx8T4678Td6nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSMWwai/sh9sNCKstRZt02G+hTCv/YcrVajAiDcm4UI=;
 b=iWJG4r6Dkm7YOm0Doe6XNg38q4RONAxg4PPQo/DF6hK4aaqcwYQRyExH7/6qnZEWrNj5JswsFCsuQamcAX6TsCcK8D/x9ksrFWLdrwG6Lb3XIET6EUgpeW3Q2MGj5wLYzw7l4Mt0i3NW1TLV+rHPpf42zBZ7tzzS8qohg64HccA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH] arm/efi: Handle Xen bootargs from both xen.cfg and DT
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <984732f0-8433-a294-acaf-c4130a2ab341@xen.org>
Date: Fri, 10 Dec 2021 10:26:49 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Wei Chen <wei.chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E84E06F3-8468-426C-AFE1-DB0E0A49B353@arm.com>
References: <20211206153658.49727-1-luca.fancellu@arm.com>
 <984732f0-8433-a294-acaf-c4130a2ab341@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LO4P123CA0496.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::15) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: b4cb09b7-2120-413b-17b8-08d9bbc7ab1a
X-MS-TrafficTypeDiagnostic:
	PAXPR08MB6893:EE_|DB5EUR03FT060:EE_|AM8PR08MB5732:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB5732CA945C72A49C6A2350C3E4719@AM8PR08MB5732.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Uz/ufysHHU5xCa4qdHHBCpGvCxNuaNugYpyhWU+u2c4afJrzCRhPxkZZpMktwrZ1BollNL3p/ipougf0s5i6RrPaXiJ3CWZfLxHeAzQfcLxH76oJqC+zLLxRcKiREm8wWObFlVrDcAy9LTW+oucU619Aa6fZ3y/u/8o9mXLKahFC48z0N3AT/X5dBT/yX5IN6oV41Prnf0+IxR/tLOimjwhK0rdf1PKENFg9y7Nb09hKcEdOKUr4I9dKjL7snPcfQ674LuWH9juUeTCqbLL0Trlu4NG3JtV/Em1BEQVSDh9y6XrPFzkb645KloxuNE+1nDh2IZiQF1OGujwnV8VH5OSlvsqbSPn/GN8kkcjCnBi2uCDo95L78HTto/iOutXk21tq1MTRsfa1FMEy3Xkexu7iIHuzaHw3IRLbUBkcOQAZHcRNSQvY2ao3p0nQ5300UhGttujqCihuTmysfGorPOoBQAhCKntrRo7WJxy2RZHG9+4IqvrQQ61bNT9RJNVZzFajFTCEdZhHIgye0Zu//fn2ntUyf6MGCunPy65oPA7U0qgwWkTnI6Ds6Pz8ZRMHmjCri0TtdDgl8p53Quk166IJKa/9juUIwvD7OMvUTOQDgUcHwbOb25rN7B+RJ+40QF+4YOMq6K551oWDImdPBjdkn9oSTCIfNqAl3PGNs6c0oVzlnHeYXcWB+xvpCnwysxhfNpLlYUJXlfECSVhR4Pg/irX1Vvj9SDRHCPhR2dc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(86362001)(6512007)(38100700002)(4326008)(5660300002)(8676002)(66476007)(38350700002)(8936002)(36756003)(6666004)(83380400001)(2906002)(52116002)(186003)(66556008)(66946007)(33656002)(956004)(508600001)(6486002)(2616005)(54906003)(26005)(44832011)(6506007)(53546011)(6916009)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6893
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	54eafc05-90bf-4631-ad55-08d9bbc7974d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iR+JbMBSv6YuYIjMFaYBOElR4Wse9jbKbEcXv+sYRz7bCE0tM3/pkeXcdBNRaezUjUNzVo7dVOZhqmGkvRL/pU02HsP/luvRJgRdtgnb523it+SCCoy/qVKfaZcOIr2zxe3n136tKxQME0ZvnSvxgakrzq1Otvj0Ly8I6Cg68W5PjI52yQU7yGDwSr6Wffvp2ebN78MD7Bif9e6LY9eX6FiV2Qmnu6IV191MaDa1zfr/a9QW6zOtA9NvsZBUoA1DDqQ20xhZnCF/+pUmalRzUTacMsJzVIC/Lo0inP3MlfAfmGhCV5oDnxjj7+nlLZDJac0QAEl+McJgzYXkw1NftSpuTPwUbt2aS3B3lL3/OjtblCHeToF1kZNAnBKWMOAVUIMurgTFtu7WTt/99pgjqYpoCpYz+g3BdI6B237qTORE4T20lyULWf3i8l7xBW1l2/LZHfWI0GscmUuCXnshcOw6Qw4rXrupj9BELvoGvSTXoc/E8XDjdlHQFBeRM+XnD/2Jd2uZlDN5OeOhCnhhHb+Sl8hI+7vWc/5ijdHx1N1KijCiBOMpOaDdg3/vABlHVE6bVgxebAbK/1B9e4PfPAl9rmRrvyxweNt/exlpCqL450PnqBXpeNl+QVGshUiUO2LHXaf96s4aY8gBSRoncp9+oBsQAta8OzUP5imHrC6gO8c3dmQR3FzTy32JieXQWWBDB2oWEEIxKyvithsom28E6AH0a3EMslJGluWBz779tmCBED46aOEMh1j2mp6ncY6XVE5KpKV/gG75QPJ/3w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700001)(4326008)(186003)(40460700001)(33656002)(6486002)(107886003)(956004)(5660300002)(2616005)(6862004)(6512007)(70206006)(508600001)(83380400001)(336012)(70586007)(6506007)(26005)(82310400004)(356005)(8676002)(36756003)(53546011)(2906002)(54906003)(316002)(44832011)(6666004)(47076005)(8936002)(81166007)(36860700001)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 10:27:29.3060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4cb09b7-2120-413b-17b8-08d9bbc7ab1a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5732



> On 8 Dec 2021, at 18:10, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20
> On 06/12/2021 15:36, Luca Fancellu wrote:
>> Currently the Xen UEFI stub can accept Xen boot arguments from
>> the Xen configuration file using the "options=3D" keyword, but also
>> directly from the device tree specifying xen,xen-bootargs
>> property.
>> When the configuration file is used, device tree boot arguments
>> are ignored and overwritten even if the keyword "options=3D" is
>> not used.
>> This patch handle this case, if xen,xen-bootargs is found in the
>> device tree, it is used for xen boot arguments regardless they
>> are specified in the Xen configuration file or not.
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>>  docs/misc/efi.pandoc        | 4 ++++
>>  xen/arch/arm/efi/efi-boot.h | 7 +++++++
>>  2 files changed, 11 insertions(+)
>> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
>> index abafb3452758..b7d99de87f15 100644
>> --- a/docs/misc/efi.pandoc
>> +++ b/docs/misc/efi.pandoc
>> @@ -249,6 +249,10 @@ UEFI stub for module loading.
>>  When adding DomU modules to device tree, also add the property
>>  xen,uefi-cfg-load under chosen for Xen to load the Xen config file.
>>  Otherwise, Xen will skip the config file and rely on device tree alone.
>> +When using the Xen configuration file in conjunction with the device tr=
ee, you
>> +can specify the Xen boot arguments in the configuration file with the "=
options=3D"
>> +keyword or in the device tree with the "xen,xen-bootargs" property, but=
 be
>> +aware that a device tree value has a precedence over the configuration =
file.
>=20
> I am not sure I agree with the precedence chosen here. With UEFI environm=
ent it is a lot easier to update the configuration file over the Device-Tre=
e. So this could be used to quickly test a command line before updating the=
 Device-Tree.
>=20
> Also, somewhat unrelated to this patch. Looking at the code, the command =
line is a concatenation of "options=3D" from the configuration file and the=
 extra arguments provided on the command line used to execute the UEFI bina=
ry.
>=20
> When using the command line from the Device-Tree, I think it would still =
make sense to append the later because it could allow a user to provide a s=
ingle Device-Tree with extra options on the UEFI command line.
>=20
> But I think this is a separate subject. So if we are going to go with the=
 precedence you suggested, then we should at least clarify in the documenta=
tion that it will replace both.

Hi Julien,

Yes I see your point, currently the boot arguments are done in this way <im=
age name> <CFG bootargs> <CMD line bootargs> as you pointed out,

would it be ok in your opinion to check if <CFG bootargs> is specified and =
if it=E2=80=99s not, use the <DT bootargs> instead (if any)?

Cheers,
Luca


>=20
> Cheers,
>=20
> --=20
> Julien Grall


