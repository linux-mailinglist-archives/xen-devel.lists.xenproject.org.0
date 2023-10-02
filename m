Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AEF7B4D96
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 10:49:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611237.950719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnEc7-0001vv-JC; Mon, 02 Oct 2023 08:49:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611237.950719; Mon, 02 Oct 2023 08:49:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnEc7-0001uB-GU; Mon, 02 Oct 2023 08:49:15 +0000
Received: by outflank-mailman (input) for mailman id 611237;
 Mon, 02 Oct 2023 08:49:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L3JV=FQ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qnEc6-0001to-CA
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 08:49:14 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062d.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f6f0323-6100-11ee-878e-cb3800f73035;
 Mon, 02 Oct 2023 10:49:13 +0200 (CEST)
Received: from DU2P250CA0010.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::15)
 by DU0PR08MB7590.eurprd08.prod.outlook.com (2603:10a6:10:317::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Mon, 2 Oct
 2023 08:49:04 +0000
Received: from DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::48) by DU2P250CA0010.outlook.office365.com
 (2603:10a6:10:231::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30 via Frontend
 Transport; Mon, 2 Oct 2023 08:49:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT015.mail.protection.outlook.com (100.127.142.112) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.21 via Frontend Transport; Mon, 2 Oct 2023 08:49:04 +0000
Received: ("Tessian outbound fdf44c93bd44:v211");
 Mon, 02 Oct 2023 08:49:04 +0000
Received: from e4bb056d3835.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6134099B-86B5-4C9A-8A89-C58D39814B09.1; 
 Mon, 02 Oct 2023 08:48:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e4bb056d3835.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 02 Oct 2023 08:48:57 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBBPR08MB5929.eurprd08.prod.outlook.com (2603:10a6:10:208::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Mon, 2 Oct
 2023 08:48:55 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.029; Mon, 2 Oct 2023
 08:48:55 +0000
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
X-Inumbo-ID: 8f6f0323-6100-11ee-878e-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4V3X3mrn/qs9ntBg0e5ODgaKaqid07T93p7ynfbkKM=;
 b=sz785gZJlw0iiSKEQdz5RZncvCO1w/OeXahDLsQAO2J9mj2kJponeCbTdtru7VhMcWTAbvo3WJF+wfFIKZ8vf27CIy7GS/xIjlRlz5GOI8p+B6gKzTiGcrh86sBpCeIjgu4+DK/DWxZti5G6JBQmX7wNtG2Vz/77Wfs8S7sFNG8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4113b1df3912da69
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWwN0coVjs2pMz07OXVvrB1yaZ7GnYNoLhp/t3vx1Ljy16I4JUIgC4ZS3KZPEHmFr65fDU3lak+F5XlM/ZCBeLahMPQB9gfcClpLybh1FjtxEVkVGu9IKKoT2J+m4DVnDIh2ANpN9qnME9QmVRn0N6QJlfVQYVS3B7cYQFfIVYecoENDEtyrxzQhD3eG+ibzzSqUeHzNJvIWoZJZU3G/d7DjI18E1wQ/DHb5zK93n9VplAscKvwteyOswCN6buYDxEE5NmU8zDkTKJNlo+cbpI+8H9ftFMnyzYLbXk9qx2hgh+9tc5yPQVkdf3/DMn+8OVFWbXX2LJIcWatuseJPww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4V3X3mrn/qs9ntBg0e5ODgaKaqid07T93p7ynfbkKM=;
 b=fk5rasqgpeAM2Q/KbtcIo8vCWtaD0E7n1XwXCITe4XFeHFZurm8vTeAHY/lKP0TIgpzyFyTE3cPgh86tTzF9KGqD7npcgl7ZWna20wlVenMJxOqKeTAz9NJlt5myHTAwjHdc1ZRnF/EulZQ0Nehatd28IXR+atoZDshMrOSh8stCKtKLzpYCLaAmZjPzxBAOXbx1oHlFCuaYhD5IkOJTaE8g2TlM9Zql5S4rXwLfYWz/7u+VEs3BQwt1cQLIg4Tv5ey0tp1jABUeJKP5oYIjNDkoVdyWgQsu6jbGoUpI08btwyxYIJfUyYBZxAfBO+k/eqiPdmxFaDCOwK3aIup11w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4V3X3mrn/qs9ntBg0e5ODgaKaqid07T93p7ynfbkKM=;
 b=sz785gZJlw0iiSKEQdz5RZncvCO1w/OeXahDLsQAO2J9mj2kJponeCbTdtru7VhMcWTAbvo3WJF+wfFIKZ8vf27CIy7GS/xIjlRlz5GOI8p+B6gKzTiGcrh86sBpCeIjgu4+DK/DWxZti5G6JBQmX7wNtG2Vz/77Wfs8S7sFNG8=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Stefano Stabellini
	<stefano.stabellini@amd.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [for-4.18] [XEN v2] xen: arm: procinfo.h: Fixed a typo
Thread-Topic: [for-4.18] [XEN v2] xen: arm: procinfo.h: Fixed a typo
Thread-Index: AQHZ9Q1G9jZ9I34DJk2NrkGGKU74QQ==
Date: Mon, 2 Oct 2023 08:48:55 +0000
Message-ID: <740DFE9C-891E-41EA-AF89-87789938FB43@arm.com>
References: <20230928121243.2636484-1-ayan.kumar.halder@amd.com>
 <170236c7-6410-42c2-acf3-8e8cc5b7086d@xen.org>
In-Reply-To: <170236c7-6410-42c2-acf3-8e8cc5b7086d@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DBBPR08MB5929:EE_|DBAEUR03FT015:EE_|DU0PR08MB7590:EE_
X-MS-Office365-Filtering-Correlation-Id: b90c265b-6127-4e12-bcf4-08dbc3246e9a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Fy8cmDsW+hHiRhSuxOXD/Nr0+SKcnX5L+FwlKNIQTtUDuxco3fS4Zg4QaaK+cFTWln6qLNKqbT+mdvdY9GlSjBCHv4ouMmcSTLUC1Ht1hMLMSFPW6V5vvAhA1qVKJm9SL8uCes0sFny8VMZg9p0MY6vWor65ugIPbnokIxiZ5vMWpR1u+Y5fBzbhC9oTvyuss/ZUi+vevidrr4OryF2xlzrQn1FfS1N5ebzxRaqWQNEcsXnI74uldXLP0ySg5c/7qWzw8xDFzFKkKaTvFPKVdUijjFdG0N6/Ont09TYtYwJnDfK0N0vT7oPnl88n7OqZvFo+A3EK1oTXpl9fbJX+A7zqGxqc++czEDNBgy+MyyLwZCDm0DOhILArcJXB4Gh5ELsb8IgcaS3Er+eRLjWH1rF7QQsMrkk3WMdaIsEn53bAoOi/40TKywHNUjooXDv7Qq6kX+M4TQ/8ySpC+Gcu4GDQdvy+diAkNrYJ+RSq09Fd2tVxnvWuDJ1Sgn+BSNLJNnJ712ev0Sp79Rsf9ShsnTv3thVoUb0OLY4CY9Qd7LmdmdN/tvTAcSCTlFDnftsSQxwQboBW8tW7yeSTMMWlbyuDryK3ACWl9/5w6RLKXNAZTS1T1pnRli7oDLj6Ih2T/7GEQ5mTDqBZxGXXrbsE1g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(346002)(396003)(136003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(91956017)(66946007)(76116006)(2906002)(8936002)(8676002)(4326008)(6916009)(5660300002)(316002)(64756008)(54906003)(66476007)(66446008)(66556008)(41300700001)(6486002)(478600001)(6512007)(6506007)(71200400001)(53546011)(26005)(2616005)(83380400001)(38100700002)(38070700005)(122000001)(33656002)(86362001)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BBC19A52BDCE5145BB4688F4F98E5EBB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5929
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a16f6f37-1662-4914-1820-08dbc3246948
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lauB3DL3atpqSc4UmDrMcwQRR7/TtG1iWS6tQdXQ2mV0EvTUSwPsiNWagvhTzy8ZHShNecbDy2I6XBDTX5+S8akG9iM8OG73f5J7iarJszc0pCFvEHgGm3ByuCeLcSOTYaFDmmyAz04JexqRx4Sn0fd/3nw76w6m23K+qij+EC8JgR6D2y87TwvwBDvsVZRUgfUFDSJKB8/FK5U41Dqr6DdL3ack9auIO3pp9Jf2JZxNPGZEa1pd0bvevsmm1/Wv4gnXcmUMXjwRWJQn4p1+eYA6uwzvawMuPzPwAWZsQLbLXaEYnK0ibereCgxLbp6fRVsF4LbsZYlcSSwvGYoINBsjXS6yjsr6bi48P/tDKlewH8ptPeGDnImMBGPB7cC1c1mlB7Li2LswG9oknuk7D0DMBR9UeV0IdDrC0ZmEQw68rtX/ffBDe2Abc9nR8VcpzHOd2OH4dO/Ehr8cxXzONGGEN4mf8KRcfCVszwQAfNAMjmNztsMyihpGGfnCuYo1C3ZDHep867Jf9yowXkWctTeZS0CjEnylHFZoCOvzn8lYDuCJBRGf5YLBG5Lnf2GoYRhiitntRywAqgsSxDbewL+V2k3LgaDfp1VS6vGeO5pt5UQNdz3uVgMX2QKMvp90xd2JG2XmeAvGJS6lQgUiUJVo1eWhVy7FIgAhzEH+b/5iUtmgBmKVsZU97vNwql2hmJNeXqnG6ca0gvA0LD+/wdfv8x/gaNKAh25n/s/ioUQ=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(376002)(396003)(346002)(230922051799003)(64100799003)(451199024)(82310400011)(1800799009)(186009)(40470700004)(46966006)(36840700001)(336012)(40460700003)(6512007)(26005)(107886003)(2616005)(36860700001)(82740400003)(33656002)(86362001)(81166007)(356005)(36756003)(83380400001)(47076005)(40480700001)(54906003)(478600001)(316002)(8936002)(6862004)(8676002)(4326008)(5660300002)(70586007)(70206006)(6486002)(6506007)(41300700001)(53546011)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 08:49:04.4930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b90c265b-6127-4e12-bcf4-08dbc3246e9a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7590

Hi Julien,

> On Oct 2, 2023, at 16:45, Julien Grall <julien@xen.org> wrote:
>=20
> Hi,
>=20
> Adding Henry to release ack the patch.

Thanks.

>=20
> Cheers,
>=20
> On 28/09/2023 13:12, Ayan Kumar Halder wrote:
>> Change VPCU to vCPU.
>> Also add a space before '*/'.
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> Acked-by: Julien Grall <jgrall@amazon.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

>> ---
>> Changes from -
>> v1 - 1. Change VCPU --> vCPU.
>> 2. Add a space before '*/'.
>>  xen/arch/arm/include/asm/procinfo.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> diff --git a/xen/arch/arm/include/asm/procinfo.h b/xen/arch/arm/include/=
asm/procinfo.h
>> index 02be56e348..3a05f27784 100644
>> --- a/xen/arch/arm/include/asm/procinfo.h
>> +++ b/xen/arch/arm/include/asm/procinfo.h
>> @@ -24,7 +24,7 @@
>>  #include <xen/sched.h>
>>    struct processor {
>> -    /* Initialize specific processor register for the new VPCU*/
>> +    /* Initialize specific processor register for the new vCPU */
>>      void (*vcpu_initialise)(struct vcpu *v);
>>  };
>> =20
>=20
> --=20
> Julien Grall


