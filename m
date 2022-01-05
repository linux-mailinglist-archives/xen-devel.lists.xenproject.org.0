Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E1A485344
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jan 2022 14:11:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253587.434762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n563j-0006Ln-I7; Wed, 05 Jan 2022 13:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253587.434762; Wed, 05 Jan 2022 13:10:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n563j-0006Jm-F1; Wed, 05 Jan 2022 13:10:31 +0000
Received: by outflank-mailman (input) for mailman id 253587;
 Wed, 05 Jan 2022 13:10:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nls+=RV=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1n563h-0006Jg-L1
 for xen-devel@lists.xenproject.org; Wed, 05 Jan 2022 13:10:30 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9943d09-6e28-11ec-81c0-a30af7de8005;
 Wed, 05 Jan 2022 14:10:27 +0100 (CET)
Received: from AM6P191CA0050.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::27)
 by DB9PR08MB7399.eurprd08.prod.outlook.com (2603:10a6:10:371::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 5 Jan
 2022 13:10:19 +0000
Received: from AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::4b) by AM6P191CA0050.outlook.office365.com
 (2603:10a6:209:7f::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7 via Frontend
 Transport; Wed, 5 Jan 2022 13:10:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT024.mail.protection.outlook.com (10.152.16.175) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4844.14 via Frontend Transport; Wed, 5 Jan 2022 13:10:18 +0000
Received: ("Tessian outbound a33f292be81b:v110");
 Wed, 05 Jan 2022 13:10:18 +0000
Received: from 3aed54ce92f1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 66D80BE7-4E39-433C-91DE-24F52F03AC0B.1; 
 Wed, 05 Jan 2022 13:10:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3aed54ce92f1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 05 Jan 2022 13:10:11 +0000
Received: from HE1PR0801MB2123.eurprd08.prod.outlook.com (2603:10a6:3:7e::8)
 by HE1PR0801MB1899.eurprd08.prod.outlook.com (2603:10a6:3:4e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Wed, 5 Jan
 2022 13:10:07 +0000
Received: from HE1PR0801MB2123.eurprd08.prod.outlook.com
 ([fe80::6df0:a983:cb3f:deae]) by HE1PR0801MB2123.eurprd08.prod.outlook.com
 ([fe80::6df0:a983:cb3f:deae%5]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 13:10:06 +0000
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
X-Inumbo-ID: d9943d09-6e28-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKkQUpGIt52IPiU2Xi1sfOjx+gYHusJi35XBTolNK0g=;
 b=wRfHTIhAgDa7d4wbq4ZqeKlrsxJePVFR9VkOfxt28+gifsHqLlERYj7LutKCl8E0d8j3eMvRi4bfVRd28ZaO2On7Y/rWrV2Y/otivol8g7f7kmNUBgrtf83ztTAdg1tOrMlEoZl+ebQOmqXY7iSpz2eZkM3Su7jae+pSYT71A5o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 878bdd90749f3025
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bCbzBHD/er+Y4pS3hIsyVlnMo+xgnPiNFgE9pmFwRtpGpQj7+ndD/8QsEaJynKyCWLQi+EyYB/extegXRwumaPjfe+wIg/SmQGe1fM+T2rGQPduNG7VJZel6Z8t1qK+G5BaCTVGGICScx2iD4eI8emvHcoUZtAA6NBdm3jsK1U7R7LfVTyJKglfuLRfXh3t2bp2KlubijGvWCIEd/8N4Pi1DdiIf1cIiYPcwKUcKKiRhL6dYvrDoxrYwmv9fYxHXjGJGNW6kph39jlbf5uaPmnMXtxn7VBYvst9/zoFPiv6+jHWZOWayERXt+7F8o/VyCN7URjwYUxI22kQ1v5FTyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKkQUpGIt52IPiU2Xi1sfOjx+gYHusJi35XBTolNK0g=;
 b=N1EqYr3pGg8d1WQRziMolqszAN+8YZ4c9eaJBQiVNcGqzvArY93Ci8ETIDe+Eyl8+bm/15R36gEuwWen4CoJAcquMmlHtORUvh8l+l2PPUr2Z1SG72K26aJkAPyP2s9w+1O7bhNaxR+7yZZXCNbMAy4zfPJupOczwxDaLwiwv2E4j18MpHO+vYag58jsbbndFAzbqpKiGBUdM54S0qSfJXpGPzVAJeNMUdJCMjKXuGqtGl+XlUiKJq4pAtK7aw7VRFDKZ2Gmk7ltErzgeJ03F+Jxe8bWzOsTWm9003yDhLyN8izud/nK3ynrssoBtFz+OvHNzVGNEgikeIfh3RO6WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKkQUpGIt52IPiU2Xi1sfOjx+gYHusJi35XBTolNK0g=;
 b=wRfHTIhAgDa7d4wbq4ZqeKlrsxJePVFR9VkOfxt28+gifsHqLlERYj7LutKCl8E0d8j3eMvRi4bfVRd28ZaO2On7Y/rWrV2Y/otivol8g7f7kmNUBgrtf83ztTAdg1tOrMlEoZl+ebQOmqXY7iSpz2eZkM3Su7jae+pSYT71A5o=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 1/5] tools/libxl: Mark pointer args of many functions
 constant
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <YdVuZyvwrDUxn4O4@perard>
Date: Wed, 5 Jan 2022 13:09:57 +0000
Cc: Elliott Mitchell <ehem+xen@m5p.com>,
 xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <AC735889-DA89-49E6-9214-31EFC8890AB9@arm.com>
References: <cover.1640590794.git.ehem+xen@m5p.com>
 <80dd561339dbe54f1ed2c2302ace389e87d445fe.1640590794.git.ehem+xen@m5p.com>
 <YdVuZyvwrDUxn4O4@perard>
To: Anthony PERARD <anthony.perard@citrix.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LO2P265CA0298.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::22) To HE1PR0801MB2123.eurprd08.prod.outlook.com
 (2603:10a6:3:7e::8)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 546bd9a3-680a-456d-3052-08d9d04cb8af
X-MS-TrafficTypeDiagnostic:
	HE1PR0801MB1899:EE_|AM5EUR03FT024:EE_|DB9PR08MB7399:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB73996C6595A4B2D70EDCB720E44B9@DB9PR08MB7399.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7K9xmfXOybsO+0BSZzL8VRmM6s887dI7fMNe5INssXFz4Nzd2TFa9/0KUFJVlUs95IVUpnl5+0gJNfsTY1viK/GLeDbcd811YE1lbsT7JTolkUD4/nybpw0lb72SYpk7EGmc4wGhTMx7x5PQ5+lGCxDl49NtrX01crQaFCsd3vJiidmyaXqWD87o5UvTanIQFCWODUn73KyPdpVTYHoGcUTpqG1dhO6SzowyTwvguAM8VMVIZ/C3iY8amV8kzLd1yniQjwo3PtIIkl6k6b63qEhU1YiT3Aql/ONCtDwSFe+HccqIVWaPi8sEjCxO9aXqdijGzEiHo8fRpd/Zp90+DgyGDcOj1w74M9ejHOZBYptTLuIJXDNL7RzW7dxFveBSXeOXXv4jYpJMix3zBCVnXbKBVC10ry6jdaU8F4dEVtoWNSDHizmrOhANeJqcDDQZIBW9WbmdfUw1vKKaaJGEDEp3aih2dQCi5SJ2qltb22aOQTVK+1F90qBYr+yF/U1kr9NjVMFl8Wg4YiZlhw+zNwonsGJDNcCOLJxzMSytFsVjm8AHk4D21QfOEAc1PEs4LeWB/Kvnhur6ZZLU5F8WaMOKMpey5giRCXxcdRY9g5YwGDIJaE3av0ZXvR7yyvLgT+yAIux3CE1JQAX2BdIvlE7cqF897V/Q68VaGOPJ2ogfpMOu7iipdL2z1/CwDPSKPVNARXjqV4cEnuCnLGeZJ13oJH9GT5idWI1Fio33fL1QuI1tWWpGRB3c/kD37PWJFbNhp7d66hBveD+DQEH4rb0IkJ3hzyJx0yvPENP3uXkkjhcLXUrMVhmsGNnbRcsm
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0801MB2123.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(26005)(186003)(6506007)(53546011)(316002)(54906003)(52116002)(36756003)(6666004)(4326008)(966005)(8936002)(2616005)(6486002)(86362001)(66476007)(83380400001)(2906002)(8676002)(66556008)(66946007)(6512007)(38100700002)(5660300002)(38350700002)(33656002)(6916009)(44832011)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1899
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1fb30251-bc53-4383-dd8c-08d9d04cb0fd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KQXCwiEevgLiIQDU1/86zvAAY1NaSwEwHlVRapBVu1QnBQoibxq8xcwbxSf5aM05jsuvoHHzASB999C4LVpQPU0EJr93ldBE+7FNDPPgECcnuBud1rh6ejYz3uCnbx404YGP17k15SLrf7+6TpmlkiTD1VeNh6cUJx2vLXtZ1tKLO12U2FgRYtOXdg+uN70q8QxsgPD5sh42jeFbH85xJUrYuY/Sw4uN+QcNxwgii3ScNmWTmaH9Kha9RJC1KcD4DxmZqIl7AG+pJGNUjEkGFbBtdKG1T2gHiS6Pahyop6dpUwAybZ2XIbCkEtlzGd76fiaj7X5qJUFkn8QSk825lFhVfz83i8iLyeZLb+PUL2WiSvrlfnE1EK+AZoHO+8J9VddbMZMvPiZ+X/dF2kA9j1Vdj7pXFv2AcSyIZJ6aNPCWHjBp19TcFPAeLbURW43eXzqr1injVlLe6BPyBr6cqNv/KMP3lfCveYTCmg/E29tir7wqL2VfBEWoWXqPiHGsmPuDxvP2VLjHKGzH7+K/AEqWLn+3xfs2EhoXZIqRhgEqgrbOipjQcjU8ki3VtO9fFQZOnFHXnOmL5+oJOeKtr3LDR2bvimUMa4R4Uv+g5FGc6yz4iyY4cRYZy6cY4+7Z8IA27x8ZCsM7MJpvjUcq4HbrAtNl96vVo6B1L+ZBnSbKO5XmOELbqB3fDudJV6Cipw8rT6IpW7dWWijWujclk+g2FTnFpByPI9s3KPL0Arx3XeGyNv2qBaDg3PcvzaUTFKMqi+DyrMwVJZOL9eIqXLo+CrEQBnpRWFYdTEVhq084O4q5Z4Pi/eMu9lipF6ryRa7q+SqXt5HrWCM+3sYh6rL2fNuuZAO1U8ENu2qJRkk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(40470700002)(36840700001)(46966006)(6666004)(508600001)(83380400001)(966005)(336012)(6512007)(53546011)(6506007)(5660300002)(316002)(8936002)(81166007)(4326008)(8676002)(2906002)(54906003)(107886003)(36756003)(82310400004)(6862004)(70206006)(6486002)(356005)(86362001)(26005)(40460700001)(2616005)(47076005)(70586007)(33656002)(36860700001)(186003)(44832011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 13:10:18.3591
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 546bd9a3-680a-456d-3052-08d9d04cb8af
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7399



> On 5 Jan 2022, at 10:09, Anthony PERARD <anthony.perard@citrix.com> wrote=
:
>=20
> On Fri, Dec 18, 2020 at 01:37:44PM -0800, Elliott Mitchell wrote:
>> Anything *_is_empty(), *_is_default(), or *_gen_json() is going to be
>> examining the pointed to thing, not modifying it.  This potentially
>> results in higher-performance output.  This also allows spreading
>> constants further, allowing more checking and security.
>>=20
>> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
>=20
> This patch doesn't build.
>=20
>    libxl_cpuid.c:510:17: error: conflicting types for =E2=80=98libxl_cpui=
d_policy_list_gen_json=E2=80=99
>      510 | yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand=
,
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    In file included from libxl_internal.h:89,
>                     from libxl_cpuid.c:15:
>    /home/sheep/work/xen/tools/libs/light/../../../tools/include/libxl_jso=
n.h:30:17: note: previous declaration of =E2=80=98libxl_cpuid_policy_list_g=
en_json=E2=80=99 was here
>       30 | yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand=
,
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Also we talked about this patch before, in
>    https://lore.kernel.org/xen-devel/YImXfc4oaPgWzkeT@perard/
>=20
> Cheers,

Sorry about that, when I=E2=80=99ve put my R-by I thought it was building, =
I=E2=80=99ve checked again and it=E2=80=99s not building for x86_64, arm32 =
and arm64 looks fine so far.

Cheers,
Luca

>=20
> --=20
> Anthony PERARD
>=20


