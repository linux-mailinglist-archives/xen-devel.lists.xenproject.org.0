Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A04791932
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 15:57:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595254.928759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdA4a-0004Eo-FH; Mon, 04 Sep 2023 13:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595254.928759; Mon, 04 Sep 2023 13:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdA4a-0004Co-Cd; Mon, 04 Sep 2023 13:57:00 +0000
Received: by outflank-mailman (input) for mailman id 595254;
 Mon, 04 Sep 2023 13:56:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pUi+=EU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qdA4Z-00034Y-4H
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 13:56:59 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e97153c4-4b2a-11ee-9b0d-b553b5be7939;
 Mon, 04 Sep 2023 15:56:57 +0200 (CEST)
Received: from DU2PR04CA0350.eurprd04.prod.outlook.com (2603:10a6:10:2b4::22)
 by DB4PR08MB8103.eurprd08.prod.outlook.com (2603:10a6:10:385::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 13:56:54 +0000
Received: from DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b4:cafe::14) by DU2PR04CA0350.outlook.office365.com
 (2603:10a6:10:2b4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32 via Frontend
 Transport; Mon, 4 Sep 2023 13:56:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT060.mail.protection.outlook.com (100.127.142.238) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.25 via Frontend Transport; Mon, 4 Sep 2023 13:56:54 +0000
Received: ("Tessian outbound 1eb4e931b055:v175");
 Mon, 04 Sep 2023 13:56:53 +0000
Received: from 876806955b08.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E8D23892-B9C9-4837-8F74-A6CAB91BB410.1; 
 Mon, 04 Sep 2023 13:56:47 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 876806955b08.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 04 Sep 2023 13:56:47 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU0PR08MB7614.eurprd08.prod.outlook.com (2603:10a6:10:31c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 13:56:44 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 13:56:44 +0000
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
X-Inumbo-ID: e97153c4-4b2a-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKEnHB9nC3h0nG0gTidwgT0CvFTAyAF25MIFKgqiqYo=;
 b=F0joPjgjdSsECMpbTH7S72sc9IHS2eSibHzGn08Ttpkaz9Cj6JBQ+Ckr9/NaLQehP5Hh+pR+iURv89KX+S6KR7FBah0/q5TCd9J5ie1snBUgOiYksIM8S/XAlLkUmIRPHQYN8AkfcvN+0M0+G3yZTO8RGO3lXfLM/TdrPDqxlBA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8e89487cd32bdd7c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLYo41M8SG+h6IZVOsqKb1KndyRqEdeLeyPzNb9MiRI/vTdlCZwYpin39sV3ivGvelVckQngv4ZVZsT8R4Lq2+FTE3NMYdKnJk8Cd7ICYahcLMK7kNq+z0ecRlM2h7kyIb7JRBAOEPuMTuWlUurEKBkr8UauL+V81NQEhFIoksaR74/lBB5tWJLpmYrOhU2gTNk4zXpDiIOyq9/xrQNMqX+WVjVjsDXYpJwUIxQAvxmRKAusntIE/F51BQdskn4atX0fJSnkVKz0sbXrzN2ca/YSh9hWVLxh/IJaiN3PyP7ghvKwfOVpywpgnTqYb/cWv7tDTdC0SgSNPPaFH/Z14A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKEnHB9nC3h0nG0gTidwgT0CvFTAyAF25MIFKgqiqYo=;
 b=K+HJyUfgkDKvdr5aOxZYKiZQv1desOqSpTXhWA9vFLRp6E1jRe27GdhjTL3rP4ULTQ+KwmxIQwIsp3HeyNsXvEV7Mk0JAeuwjLRWpAZeSGfq5vQtk1Sp5RSCaA8wYV/+TiBLHVchwxNJGzKO8+lWgs0uugGJfPk8OEvJj4NqjWbr9jtvrWWXiwM9VwJFoz/baerRAVt8q+EBdvq/RqfXpkcCqz3MrnpnphaNNHSC89t8AiVv4KG+DU291THpJDrO7enmvc2pYaG/2OM1snbl/4tkbeG2ac2PKlrpfqOja+eHHWqhMXK/FxoHjNAFUd2ly3DmpB9oQKkq/wnMT4qvpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKEnHB9nC3h0nG0gTidwgT0CvFTAyAF25MIFKgqiqYo=;
 b=F0joPjgjdSsECMpbTH7S72sc9IHS2eSibHzGn08Ttpkaz9Cj6JBQ+Ckr9/NaLQehP5Hh+pR+iURv89KX+S6KR7FBah0/q5TCd9J5ie1snBUgOiYksIM8S/XAlLkUmIRPHQYN8AkfcvN+0M0+G3yZTO8RGO3lXfLM/TdrPDqxlBA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "leo.yan@linaro.org" <leo.yan@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Alexey Klimov <alexey.klimov@linaro.org>
Subject: Re: [PATCH v1 1/2] xen/arm: Add macro XEN_VM_MAPPING
Thread-Topic: [PATCH v1 1/2] xen/arm: Add macro XEN_VM_MAPPING
Thread-Index: AQHZ2/p+UpPxNbzQ2kazbqUwug846LAKt0SA
Date: Mon, 4 Sep 2023 13:56:44 +0000
Message-ID: <943B904C-E479-4FF5-B0C2-D0F329B1B969@arm.com>
References: <20230831110107.2747633-1-leo.yan@linaro.org>
 <20230831110107.2747633-2-leo.yan@linaro.org>
In-Reply-To: <20230831110107.2747633-2-leo.yan@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DU0PR08MB7614:EE_|DBAEUR03FT060:EE_|DB4PR08MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: f1e6efca-0c33-4683-b851-08dbad4ecbc1
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7VJnczl371E/CVJtVRCxOTYP/OGbkp9vyzqs5+Dlh7rFekXP/5v65uFG0/j9p/SGRTjlLal8KYqoGUQfy74A7dk+6eX/Te2CF2FaP01cEAv6mO+kSybJAEmVw2V99rYHoiv0sL3z34H10CErEVWKK2T2ZNhUGcOgkQTbDowlywzFLlQv1UtM/XfByXS3VVf6CeztKqtjhAah9XdHf7k5O4rPJpecgy6ik3LlDl4vBENTqgU5rRbUwn/R259ynWcTvMfZnWZW9zLYEbOIFyJfmvERXhzoL4XY1L6hMi1WN81uUFCB5rV87mwciPfJqmpWTQtlHW8NrJL7+eIr5yWq6jEjlguv1ReEVldr2pqLR1qim/SThNOTLRXjsUE4DHFUj80kraGXe2cAXiyg0ZfW7zirbcxxcgjRp1drC3RfF44kCQRYhkSM/nn0kY4H0dWoaIcDCVN7/WIyUniufCJN8hcowcCLF/n21P5eRGssTn73eSy3yn5/gOFoC5JUvAEuMdf8snhf56rfHJotCBvfLZ9u2SFyDUzgJEcUr1VfHcQJg4v1YafpHpsLUK6yB/saSc5NY4w7c45IxLWxp/q32szxTLV9acSsouAbDBE7MsoPvetRFYKUZAGI6GzuJAoQgr6iCb9lUHrkK3ahY8JFJQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199024)(186009)(1800799009)(66476007)(6916009)(66446008)(76116006)(2906002)(66946007)(36756003)(64756008)(54906003)(86362001)(316002)(33656002)(91956017)(66556008)(5660300002)(4326008)(8936002)(8676002)(41300700001)(6512007)(2616005)(38070700005)(83380400001)(26005)(38100700002)(478600001)(122000001)(71200400001)(6486002)(6506007)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <17739B12D2C8DC40985B9B2A921939CD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7614
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2b97cce1-1a7b-4760-44cc-08dbad4ec609
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gV1xWVQnkcFO578v/MuHi+9xi5+SVGR+nrOLoKyBuG4xQhui4xi5opPHDol7nWOJZA0jUG4SPiQBml9kcN9Fsb6VNqGmW0mb0rKADa/KhSQwCo5QCwQ3QVFpBlaxql5SxHHaH1oP66CBPyZiXaZEKAltzZH3mxO8kqew70ULB22IT7B3IH21Yj2+QIQ4PVAdGvNaPhGJ9cmyc7UjZRjqtDm2NrD36Oc0qIl/8g6oC6+aaRGr8YeJGVeux9Bt+UqTtblvhXRn1WEHZXfgAlJRnMtgbs7xtfuGHlDpeJQJOAgxZuASeU19VgvIOMosPTLtJKiM6f6QSBIbFviKFXeneQk5JeLew3avc6NZ7moj6gKRXlmt3h6fcMI3XYD+lIYw8+PJbrOKJNe2wi4g6PkoOxfkSW3tSveKcGXBnMFPIHd3xQNqTN+SQ3QO+dW+8r5y7gPSq/NnOf9TawIx9CVK8vrjlQIC+ajOluxFaAjFQ0nUlYO0NjzoBlDOlcf4ksxWbJBQZE2EnH6P9GzhDJdn8RoU9LWjBD9so+oQuE3ucB3FQ9UuHztq9ZLxEYnSUL4eMumVaIwQ2ymdH+wdgw+Wb+5KZ5woo0/er3UAO5s268bnh/qjCk0lLge8W3bKmKli34aX5p3rfv4SR8UjNPcVVkGzHdEQoKS31et9qBYqwrjQSWhTk09TVvu7YKpewFtDY6+KHVT7DtvNctXnax3tOXDKo26kpLsDfM0Ql/dA+Fcm0lTe15zHVC9USniWdous
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(376002)(136003)(346002)(396003)(1800799009)(82310400011)(451199024)(186009)(46966006)(40470700004)(36840700001)(8936002)(5660300002)(6862004)(316002)(2906002)(36756003)(54906003)(70206006)(70586007)(8676002)(4326008)(41300700001)(40460700003)(6486002)(53546011)(36860700001)(6506007)(107886003)(26005)(47076005)(6512007)(336012)(40480700001)(82740400003)(81166007)(478600001)(356005)(2616005)(83380400001)(33656002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 13:56:54.0581
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e6efca-0c33-4683-b851-08dbad4ecbc1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8103

Hi Leo,

> On 31 Aug 2023, at 13:01, Leo Yan <leo.yan@linaro.org> wrote:
>=20
> Xen maps the virtual memory space starting from L0 slot 4, so it's open
> coded for macros with the offset '4'.
>=20
> For more readable, add a new macro XEN_VM_MAPPING which defines the
> start slot for Xen virtual memory mapping, and all virtual memory
> regions are defined based on it.
>=20
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

As said on patch 2, please check current staging code as it does not work
like this anymore.

Cheers
Bertrand

> ---
> xen/arch/arm/include/asm/config.h | 11 ++++++-----
> 1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm=
/config.h
> index 83cbf6b0cb..21f4e68a40 100644
> --- a/xen/arch/arm/include/asm/config.h
> +++ b/xen/arch/arm/include/asm/config.h
> @@ -117,11 +117,14 @@
> #define XEN_VIRT_START          _AT(vaddr_t, MB(2))
> #else
>=20
> +#define IDENTITY_MAPPING_AREA_NR_L0 4
> +#define XEN_VM_MAPPING SLOT0(IDENTITY_MAPPING_AREA_NR_L0)
> +
> #define SLOT0_ENTRY_BITS  39
> #define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
> #define SLOT0_ENTRY_SIZE  SLOT0(1)
>=20
> -#define XEN_VIRT_START          (SLOT0(4) + _AT(vaddr_t, MB(2)))
> +#define XEN_VIRT_START          (XEN_VM_MAPPING + _AT(vaddr_t, MB(2)))
> #endif
>=20
> /*
> @@ -184,12 +187,10 @@
>=20
> #else /* ARM_64 */
>=20
> -#define IDENTITY_MAPPING_AREA_NR_L0  4
> -
> -#define VMAP_VIRT_START  (SLOT0(4) + GB(1))
> +#define VMAP_VIRT_START  (XEN_VM_MAPPING + GB(1))
> #define VMAP_VIRT_SIZE   GB(1)
>=20
> -#define FRAMETABLE_VIRT_START  (SLOT0(4) + GB(32))
> +#define FRAMETABLE_VIRT_START  (XEN_VM_MAPPING + GB(32))
> #define FRAMETABLE_SIZE        GB(32)
> #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
>=20
> --=20
> 2.39.2
>=20


