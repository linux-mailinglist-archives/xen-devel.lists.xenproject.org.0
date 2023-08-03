Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6219376E5B0
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 12:29:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576233.902171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVaK-0003xc-L7; Thu, 03 Aug 2023 10:29:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576233.902171; Thu, 03 Aug 2023 10:29:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVaK-0003vi-IM; Thu, 03 Aug 2023 10:29:36 +0000
Received: by outflank-mailman (input) for mailman id 576233;
 Thu, 03 Aug 2023 10:29:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3G/A=DU=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qRVaI-0003v5-Rh
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 10:29:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20607.outbound.protection.outlook.com
 [2a01:111:f400:7d00::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a32e5ee8-31e8-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 12:29:33 +0200 (CEST)
Received: from AS9PR06CA0151.eurprd06.prod.outlook.com (2603:10a6:20b:45c::8)
 by DB8PR08MB5356.eurprd08.prod.outlook.com (2603:10a6:10:f9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Thu, 3 Aug
 2023 10:29:22 +0000
Received: from AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::88) by AS9PR06CA0151.outlook.office365.com
 (2603:10a6:20b:45c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20 via Frontend
 Transport; Thu, 3 Aug 2023 10:29:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT031.mail.protection.outlook.com (100.127.140.84) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.45 via Frontend Transport; Thu, 3 Aug 2023 10:29:21 +0000
Received: ("Tessian outbound ba2f3d95109c:v145");
 Thu, 03 Aug 2023 10:29:21 +0000
Received: from 1ef2d0cc2d0d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 962BB63B-1BA6-4B37-A1EB-BC29480D9AC3.1; 
 Thu, 03 Aug 2023 10:28:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1ef2d0cc2d0d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 03 Aug 2023 10:28:27 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PA4PR08MB6080.eurprd08.prod.outlook.com (2603:10a6:102:ec::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 10:28:26 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 10:28:25 +0000
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
X-Inumbo-ID: a32e5ee8-31e8-11ee-b268-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9r9HetsJDprQeKfL5CvjTbWMKMTHnuWnREm361MzuU=;
 b=C6IYVpD2idZzspeF3Z0F3b9fQHnhZQAFQhXtU6aGUhl9cl1NxYZ18b9Hsy4Ck025OwrtfRb80AL1hNQMtARw2HEH9WyV9V5x1KFSiruowRwprN4df0+eUGqbe0WWZ9nN/487fyxyH+uSekXkHmON0Sj/EUhiofR0fJM1JyqWFTo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e8896e8b218cbc21
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lodZzfBkCsdbLmKJi0XtEdXCVsEDdEx8UjV49aN8hg31fHcyvuvcB/3lwcuusThSBNHNkSF74fJwsBaV/la9UEcnJPDSIcQD25Q48LbdypP94Ooif1u0WNATZ2kaPCWSDxkjzsVT0H33zUahyrWbKciEw08q4JtL6jE1byvt6lTcYCCAIFdMK40VGVQ74wEGnFCAiCTnyGfAzDCAYdEki9PH8VaEOswHSeG/o3YocESnM2ttBC/cYIjiDtDsYiDI1Osj0zpOThecai92f+qQoQWRZZzEjwvDKwqhtsvfMvo4h1SSI0WnEFpFvsjP+KV/zEQoCG1UaudXL7hMuGfBjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9r9HetsJDprQeKfL5CvjTbWMKMTHnuWnREm361MzuU=;
 b=GaJ/5lj8H0X60f6WYY7NallDOoz1Cdebn5v6OJQ1wp4IGDilwG2hYLobTWcG0+g/wdD6bCvy4O5/yP8OaB2veIUEIEF+Cv03ha1ZA5qvj8PkYqmeO37y/fn6orKUoXpp5nKBjH108nGqYExtKFVLfMPDFQECzNd12e92A+/o5rQJ1X1dFo1wUilIBnx621P2NBNbdvybNRJLtCixqqcDhoMrz1NnJAvkLXcsPE/O2dDP0SFxrKKOq3dbHzIeMB4iX9RMx+MyyyD9C5SE/pAbZhjUQDjP197LAcoV0mHjmNxI40gKR5fFChJBY9ypL2b+n0yFHHc0SUU9OG3fdGBM9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9r9HetsJDprQeKfL5CvjTbWMKMTHnuWnREm361MzuU=;
 b=C6IYVpD2idZzspeF3Z0F3b9fQHnhZQAFQhXtU6aGUhl9cl1NxYZ18b9Hsy4Ck025OwrtfRb80AL1hNQMtARw2HEH9WyV9V5x1KFSiruowRwprN4df0+eUGqbe0WWZ9nN/487fyxyH+uSekXkHmON0Sj/EUhiofR0fJM1JyqWFTo=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Federico Serafini <federico.serafini@bugseng.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "consulting@bugseng.com"
	<consulting@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH v2] xen/string: add missing parameter names
Thread-Topic: [XEN PATCH v2] xen/string: add missing parameter names
Thread-Index: AQHZxeRL9pSVXV1k9k69k8jE/HqUO6/YXqGA
Date: Thu, 3 Aug 2023 10:28:24 +0000
Message-ID: <B1F3B24C-15FC-4A0F-BFB9-8C3C33E8FEB5@arm.com>
References:
 <16c5362b740ed66100b55b528881cb26c1430f15.1691050900.git.federico.serafini@bugseng.com>
In-Reply-To:
 <16c5362b740ed66100b55b528881cb26c1430f15.1691050900.git.federico.serafini@bugseng.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PA4PR08MB6080:EE_|AM7EUR03FT031:EE_|DB8PR08MB5356:EE_
X-MS-Office365-Filtering-Correlation-Id: 0075ddaf-ae46-4694-0d95-08db940c8086
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0LiG+lpIOQw7kKe7PGylGc6IizikbOb9l5ri/zBCLnk0Tyd+bIpGFteA3CSnnopftf76WJEcHV5WrAvqUqsDHQXeEcGGVX4lRtevfi8u/lwqGXs5ZaUmbBOX+K5I3aDKCS/zjcnyziGEbin16DvlyziIyVdorNQQNN+/TXGJ6c+rUMIT/Od55L4TN1wx9dgZsGU9itEZhd2fgZCp2O/cG224MZFREBhRZQBa5Rvxxw6h1lvtWZrstKRuy2RGk4B3Snxpani3wOXFyddMTy/Mlw0VM75j2IoJNHjkckO3BHZwwErVTFmPOphX9UxlEVnCfvvT4KV9gA2GcBkoJY8SPbyb+0wmWuDZhjMOdf+mcckpHkzTm5ldR/ik6bVl8j4NYzzffzJAjEG5LEg7jS+gaolRd6rrGRl6zoVy1gudPtX437FIQT4k/7RAFJl4HsOUCVdwOzjyKTOu5qQPN8HZhNrSyvgbFqxLKNHPAI8XGiFc5SP68ECYkNiA//XBkAWrAAKGDsrfEWtJD/0BopyVGWRfEi6llN/Sz79l0eOdTFvI0rECQSvVx1E8DgJEbagEPr9mdr2vQ6zg9LfebZG3R6ZvPWKiNX4H1SmeQl2SiEhDQYpS/wg5MzVTV8y2vfiRMuCHOUaNUURuAh24jTeVmA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199021)(2616005)(53546011)(6506007)(83380400001)(26005)(186003)(316002)(76116006)(2906002)(91956017)(66946007)(4326008)(64756008)(66446008)(66476007)(66556008)(5660300002)(6916009)(41300700001)(8676002)(8936002)(6486002)(71200400001)(6512007)(54906003)(478600001)(38100700002)(122000001)(33656002)(36756003)(86362001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <71A0FAA146D44A4A8309A86C51282DEC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6080
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c3a4e142-d08c-4622-169f-08db940c5e33
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/nLRkvyb1ay5t3DKzePXrEhLiwyyl6F+FVD/ppyiAauB/ANbmNC3TShbTwpLzRNLgpSXFDu50EyDdw5uQyP/haUKJ/CdX+y22ZrdITdTpg+JrLVNF9tRugXPgpA8PUSKxrr4n+DsfgJrbhwChGf2zC/SikA9HGmt0dhQ5EoPU4KLbg9myh6ZODOQqOIRcW6V9uYblJtOmS+c44GbibArW4WugATyq5/LWXTJLLO/TlJvzXSMe7EpkuOS9Xi+aak+5o+uBCOGG9z5WTDhiovkXJ4UeQHYVUmj+nigXZRcyC7yrWDQDNxYXaIaYzSB1eo95KJrXkNQYlV0szpHzdxalf/CVUq1gcVV/Et1ZMwkwGSlwi+CJyYhNqUjvrbTugXwHsTqLkc7sYvhK8EXyQ2fxZWEuPyuFP6zgrm4II0uctdOiESWaUi+gVcxbAGtD3IFNx8OAJb8HrpbaCv7jl52tr6kdFOi2JBFR06A6hhKV58c67sV0mnEAFy3Zw+wYac784N4HGaPViiH9VmZe9agscUs0hdCf3eM7bnqLFTwugjMx1EOkOaEWZ/J0k0aiiqYldeqkiwafTXV8eQoKS+y0xCYafWubHsopWiuaRnToU8jr4qUPujVTKAnFBaVh6bTPszfUOoFlOnx/CwAOqzG4jtZ+eWp/NxA9wZrwpleuEq3j7GNtKoiouVZvcMQqxtcXIFG+lzmJrG47x5yN0QEDxfpS9IYJCTrXireIALbPMQzLyfhFa6RKC3vITncCKg9
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199021)(82310400008)(36840700001)(46966006)(40470700004)(40460700003)(2616005)(53546011)(6506007)(83380400001)(26005)(186003)(336012)(47076005)(36860700001)(316002)(2906002)(70586007)(70206006)(4326008)(5660300002)(6862004)(41300700001)(8676002)(8936002)(6486002)(6512007)(54906003)(478600001)(40480700001)(356005)(81166007)(33656002)(86362001)(36756003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 10:29:21.8750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0075ddaf-ae46-4694-0d95-08db940c8086
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5356



> On 3 Aug 2023, at 09:26, Federico Serafini <federico.serafini@bugseng.com=
> wrote:
>=20
> Add missing parameter names to address violation of MISRA C:2012
> rule 8.2 ("Function types shall be in prototype form with named
> parameters").
>=20
> No functional changes.
>=20
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
> Changes in v2:
>  - memset() adjusted.
> ---
> xen/include/xen/string.h | 42 ++++++++++++++++++++--------------------
> 1 file changed, 21 insertions(+), 21 deletions(-)
>=20
> diff --git a/xen/include/xen/string.h b/xen/include/xen/string.h
> index b4d2217a96..e91e3112e0 100644
> --- a/xen/include/xen/string.h
> +++ b/xen/include/xen/string.h
> @@ -12,27 +12,27 @@
> #define strncpy __xen_has_no_strncpy__
> #define strncat __xen_has_no_strncat__
>=20
> -size_t strlcpy(char *, const char *, size_t);
> -size_t strlcat(char *, const char *, size_t);
> -int strcmp(const char *, const char *);
> -int strncmp(const char *, const char *, size_t);
> -int strcasecmp(const char *, const char *);
> -int strncasecmp(const char *, const char *, size_t);
> -char *strchr(const char *, int);
> -char *strrchr(const char *, int);
> -char *strstr(const char *, const char *);
> -size_t strlen(const char *);
> -size_t strnlen(const char *, size_t);
> -char *strpbrk(const char *, const char *);
> -char *strsep(char **, const char *);
> -size_t strspn(const char *, const char *);
> -
> -void *memset(void *, int, size_t);
> -void *memcpy(void *, const void *, size_t);
> -void *memmove(void *, const void *, size_t);
> -int memcmp(const void *, const void *, size_t);
> -void *memchr(const void *, int, size_t);
> -void *memchr_inv(const void *, int, size_t);
> +size_t strlcpy(char *dest, const char *src, size_t size);
> +size_t strlcat(char *dest, const char *src, size_t size);
> +int strcmp(const char *cs, const char *ct);
> +int strncmp(const char *cs, const char *ct, size_t count);
> +int strcasecmp(const char *s1, const char *s2);
> +int strncasecmp(const char *s1, const char *s2, size_t len);
> +char *strchr(const char *s, int c);
> +char *strrchr(const char *s, int c);
> +char *strstr(const char *s1, const char *s2);
> +size_t strlen(const char *s);
> +size_t strnlen(const char *s, size_t count);
> +char *strpbrk(const char *cs, const char *ct);
> +char *strsep(char **s, const char *ct);
> +size_t strspn(const char *s, const char *accept);
> +
> +void *memset(void *s, int c, size_t count);
> +void *memcpy(void *dest, const void *src, size_t count);

There is a comment in arch/arm/rm32/lib/memcpy.S with this:
/* Prototype: void *memcpy(void *dest, const void *src, size_t n); */

> +void *memmove(void *dest, const void *src, size_t count);

There is a comment in arch/arm/rm32/lib/memmove.S with this:
 * Prototype: void *memmove(void *dest, const void *src, size_t n);

> +int memcmp(const void *cs, const void *ct, size_t count);
> +void *memchr(const void *s, int c, size_t n);
> +void *memchr_inv(const void *s, int c, size_t n);

@Stefano: would it make sense to remove it as part of this patch or maybe n=
ot?

Apart from that, the patch looks good to me:

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>



