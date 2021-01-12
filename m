Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BCD2F2E01
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 12:36:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65614.116280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzHxt-0006SQ-SG; Tue, 12 Jan 2021 11:35:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65614.116280; Tue, 12 Jan 2021 11:35:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzHxt-0006Ro-NX; Tue, 12 Jan 2021 11:35:57 +0000
Received: by outflank-mailman (input) for mailman id 65614;
 Tue, 12 Jan 2021 11:35:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zMwe=GP=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kzHxr-0006RR-UO
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 11:35:55 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.70]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8024076b-abe0-4acb-aeaa-4e7dbd0624f2;
 Tue, 12 Jan 2021 11:35:55 +0000 (UTC)
Received: from DB7PR05CA0020.eurprd05.prod.outlook.com (2603:10a6:10:36::33)
 by AM9PR08MB6195.eurprd08.prod.outlook.com (2603:10a6:20b:284::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 11:35:53 +0000
Received: from DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::9c) by DB7PR05CA0020.outlook.office365.com
 (2603:10a6:10:36::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Tue, 12 Jan 2021 11:35:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT029.mail.protection.outlook.com (10.152.20.131) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 11:35:52 +0000
Received: ("Tessian outbound f362b81824dc:v71");
 Tue, 12 Jan 2021 11:35:52 +0000
Received: from 9f95c95824e2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DFFF7863-56CA-4273-AA56-93DB83F54F47.1; 
 Tue, 12 Jan 2021 11:35:47 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9f95c95824e2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Jan 2021 11:35:47 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB4271.eurprd08.prod.outlook.com (2603:10a6:803:fd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 11:35:46 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6%5]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 11:35:46 +0000
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
X-Inumbo-ID: 8024076b-abe0-4acb-aeaa-4e7dbd0624f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+216yQ1WbMZaug+B6fcdodgrjl+5luN9zrVBDrIfhA=;
 b=wyLHYaZISlRw2sJSL0KilA8CliUDpoqo6PNCkp3RM3g1FlYmFepS9ZjBFHHAVfEG3F7Kqyhirz4ViTyiu7fAB1h45cZmIDnkjz9qGxpF2WuWpQ07lTWFo4GoIVmVvTU3609EOv4sSyWDz0YdBilg5eelUQWfp5lUS5xLcjwfyzM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9739261f04250e12
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oMEcRS3afpE4FbLfZ/EeIgoB50Wexgnvo+H7Bq89RKswLE/xtsEyOhwqMaJdRyXzzRu/cSP0IOGAcZOeEJVDgSpoAwlE106iTfknE1b3YeEPnJnkgW5k6iuFnbyDYFpLtu0uH8RBFZP4AK9BRmnDYY7t1aeHgD2Xw6KQwY8ejMbW3veqMZPJoyrV63ZQQJWmSY/Dvkssw7lAgXNwB4wMLhVPj2u9O1zTmm9dG0PB1BocpsaWgdFlT8Pg32bVjXz3vJCA0ekjaLymvJMUO08pT5hYaXG5fC4rPpMef7Ln6nVUaoWloATFSLDypmXONvwTSF3gskxPvCOXnlK+2/3O9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+216yQ1WbMZaug+B6fcdodgrjl+5luN9zrVBDrIfhA=;
 b=bcrzkSCKSpeALcV2jjn34DTi4jG01y+C2H+4KxG3jBHDgEKIi5JEtvsd4U7roKYh/T2aH/nbFY2aJwllZ4LFXuj1eZepnFRjHgny7x+oIlqV5TMV+Dleee19TzT4nSSL6qdK0zZrVZRgdO9LuxEe7u9ahYf3GIOlcpy74II4OMpdGuCmXmSV+CMEbvBCkkLMejVc2Mts5CB4J5MAH+XH0Dmuaius8NDXPeJWeL/VKc6u8NFWFYAEVgEgGlZTTIodw56QA0BTKfP3HsmVpS/8hEL9uUPsScrgoN5LcmYJw/kSsrwIcKE0YsXK9iahZdtuqqESYk5q5tSPqqPA8OQToA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+216yQ1WbMZaug+B6fcdodgrjl+5luN9zrVBDrIfhA=;
 b=wyLHYaZISlRw2sJSL0KilA8CliUDpoqo6PNCkp3RM3g1FlYmFepS9ZjBFHHAVfEG3F7Kqyhirz4ViTyiu7fAB1h45cZmIDnkjz9qGxpF2WuWpQ07lTWFo4GoIVmVvTU3609EOv4sSyWDz0YdBilg5eelUQWfp5lUS5xLcjwfyzM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 07/11] xen/arm: bitops: Implement a ffsll function
Thread-Topic: [PATCH v4 07/11] xen/arm: bitops: Implement a ffsll function
Thread-Index: AQHW5c2vv6J1akVlkkOrk3JqhZNFu6oj4ocA
Date: Tue, 12 Jan 2021 11:35:46 +0000
Message-ID: <2396BD7E-E504-4EEA-B666-FE4AF253E979@arm.com>
References: <cover.1610115608.git.rahul.singh@arm.com>
 <7c0410f150d78bae49c1d8ae0d918b56c2b0c7de.1610115608.git.rahul.singh@arm.com>
In-Reply-To:
 <7c0410f150d78bae49c1d8ae0d918b56c2b0c7de.1610115608.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 13585e9f-3185-4ba6-0ac8-08d8b6ee37f2
x-ms-traffictypediagnostic: VI1PR08MB4271:|AM9PR08MB6195:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB6195C40A4411AC9D16BC96239DAA0@AM9PR08MB6195.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2/YyIDqc4pmNlibTOhfux0W0p6Uq4lYUR9/l67C4wFTSji3tR6RRZcbQo1GWmniaV5roVQzGozUTpnvGaMzv472ROa+W/dvM2roiR56NWP5ZHoOlNabHe2Bevb+ez9qdZ35gCh2JX20enx+TqwFGfx64SizzzgE+NNhhGEwoSA03xGoGmSp8NI8Tj2Y8PvI/hHHGCv88JsGs914wIVOQYs9Ti8qNRCG0AaqGfrHzdcBA80GzNXicOaHv3icdprqJam0VYW7HLnhI08ikJi2qDY+LP1fUAjSYzue1T2f6GzmwSgfKqcqYL96J18yMsVOXYnPoanjMPD2KMFXPE5wLe5bahSxx+GR6t4EmgE+oyvyg0rZVpUZWPShq3TZicNmG8mCeRBnNB3o/C+/yDxp7mPQu907sSwGlMDy4+P1tlxrirdDhUkTQSGGFDuJ1cjao
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(366004)(376002)(39860400002)(2616005)(64756008)(8676002)(8936002)(76116006)(2906002)(66556008)(66476007)(91956017)(37006003)(66446008)(54906003)(6506007)(6512007)(66946007)(71200400001)(86362001)(6486002)(316002)(6862004)(5660300002)(4326008)(6636002)(478600001)(53546011)(26005)(186003)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?dM8402Wlm1O67NdKCS831YRxhQuTKhzUZ0eXuJKODUbtjHxzcH3XqI1MpPki?=
 =?us-ascii?Q?dx/q025CCr6XnDmvugmdJWFfGT/yOcMRT3BraxdXEYwhgXPy2MImIN3qyYd8?=
 =?us-ascii?Q?kuVEDJVCz4hvMXz41ORm0vQ1mhP5jYfrXWSRppwjGohpZWAyfyVWn+48fj69?=
 =?us-ascii?Q?mk3etpwGjgWrewUkzH+jstT6A6Ogqh7UYh5h0yRT7Ujzu3P9grNeDazWLQ3q?=
 =?us-ascii?Q?TlBGwwb/UYANRTtcxIpP1OUHJKR39RSLq5e3xdKKxZ8XIkcX0qbCpAUqi4wg?=
 =?us-ascii?Q?nuGDJBwi/1a7na65UKGNGqcA7cWGtxZM9sEStcMqJD7jRQRPoekfLyQP7yYv?=
 =?us-ascii?Q?PmrnEGXRemTuH5zYXjbefAO2JA0bc83pocmsKSauphogQKntPUp4TBlXQXeX?=
 =?us-ascii?Q?KTf9IYfwUAyMCcbc22QPvEFPtX8GQHbIpOphk5ZEmaF7pNlhUmRoDXoJvsBj?=
 =?us-ascii?Q?2AQpuhEk8+8d+foYM4WlKZdBznwQiTIsR6MV965Tj10kxMUAiKBO2CcR1hAD?=
 =?us-ascii?Q?2RBkyrwJhjF/hw7FEeFcQ6VVsTYYlxlzhVLF/a/Sa0WEzbb3aOqcc8l+xIEo?=
 =?us-ascii?Q?eUcOEz8hkj9tBcoB8bxOVwgXvut7wwuCvGZaH+Tpi9M9UUYUpgAmWJuxq4TY?=
 =?us-ascii?Q?gy7b4xfHF7pavStHmbZ6+ltkleBQrF8ownIr11ItsXACqwdQMsbR5M+ANxF1?=
 =?us-ascii?Q?yA401OP9/RxHhXf0s/bz/ESGkqnXGejq7UlsrfxAnkMTkVRKknHIOS2FMLFi?=
 =?us-ascii?Q?edfLTFTvZgZn7aoePTmNGl1CXyXhfkWTr+7n8vLW9JMYqcCB5SvMQayHNxOL?=
 =?us-ascii?Q?ELDCRAg2xF8RSijRQCn9dboI1TZEaPtjNCB60iBIreD7Fh2uJHrArHHIJA4n?=
 =?us-ascii?Q?VuchRGwOijfpzusNH6A8BQiIH7AFAXONQ/kE/ATSZFtyHi/VMCnzXropXuyd?=
 =?us-ascii?Q?/2YBV37lu2VjnFQwuBawwL2G8Qe6vavueMv/kdsLyeOvUl4iv4eukVHEgqcy?=
 =?us-ascii?Q?oI4I?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <397FE1730A6BFF439193D97F01101041@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4271
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7e095383-8ab0-4732-2f8b-08d8b6ee341c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rVdC2pRl1lAlvuJ6N1eM9+Gp7egikPJ+2JWzy+M1fcyvQln0Vr4aVX+Wr0q8lgxkiGTiPSBJ+HzrMcA+jtezNABWZC5XHKPBKO7u3GC8KvpCUfa4l8Fs2L0B8W55N6SaTCDzmivEI96chLTquJkQL4oET4U34y0acxg+t0sJrjgKgf0cdgz8UKFZEJ2dfcMOMKltFb7r2z8frf29n/RYMgSgGvGVHD9aWZgOg2yRbJ7TTJ/i5pDugEQO+qoQebuDqDXbHkPEYQfwd7jSM/mbRxWMSqOsP1LeWHMeY9DPhDVUWdnmKGqalacRsQTENayT8JiSPZzeAcnISqd8Jf5Sim0tzHlvihEhpN6AQJHObHg0tN8B7gGzImjCJKv3g7xQ3j5PLqrP1kE/CKjLZCvD4lgY+YUqNMBhIrtNsuaa6Yq++sUnOBUeY1r6owefdYACSe2pncgPYOy/OPal64Hh3j1Un9M1666e3tE6mWaLeCVgbaRpG7WftCofeuXjqp0/
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(46966006)(33656002)(316002)(6486002)(356005)(26005)(47076005)(186003)(86362001)(34020700004)(82310400003)(6512007)(81166007)(6636002)(336012)(6862004)(37006003)(54906003)(6506007)(2906002)(8676002)(70206006)(82740400003)(36756003)(5660300002)(4326008)(53546011)(8936002)(107886003)(70586007)(478600001)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 11:35:52.9936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13585e9f-3185-4ba6-0ac8-08d8b6ee37f2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6195

Hi,

> On 8 Jan 2021, at 14:46, Rahul Singh <Rahul.Singh@arm.com> wrote:
>=20
> Implement the ffsll based on built-in function "__builtin_ffsll()"
>=20
> ffsll will return one plus the index of the least significant 1-bit in
> doublewords or if doublewords is zero, returns zero.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes in V4:
> - This patch is introduce in this verison.
> ---
> xen/include/asm-arm/bitops.h | 12 ++++++++++++
> 1 file changed, 12 insertions(+)
>=20
> diff --git a/xen/include/asm-arm/bitops.h b/xen/include/asm-arm/bitops.h
> index 71ae14cab3..7f83ee1828 100644
> --- a/xen/include/asm-arm/bitops.h
> +++ b/xen/include/asm-arm/bitops.h
> @@ -170,6 +170,18 @@ static inline unsigned int find_first_set_bit(unsign=
ed long word)
>         return ffsl(word) - 1;
> }
>=20
> +/**
> + * ffsll - find the first least significant set bit
> + * @doubleword: double word to search
> + *
> + * Returns one plus the index of the least significant 1-bit in @doublew=
ord
> + * or if doubleword is zero, returns zero.
> + */
> +static inline int ffsll(long long doubleword)
> +{
> +        return __builtin_ffsll(doubleword);
> +}
> +
> /**
>  * hweightN - returns the hamming weight of a N-bit word
>  * @x: the word to weigh
> --=20
> 2.17.1
>=20


