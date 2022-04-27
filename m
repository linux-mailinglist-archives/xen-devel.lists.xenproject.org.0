Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04801511885
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 15:51:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315098.533462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nji4d-00047e-QA; Wed, 27 Apr 2022 13:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315098.533462; Wed, 27 Apr 2022 13:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nji4d-00044W-N9; Wed, 27 Apr 2022 13:51:19 +0000
Received: by outflank-mailman (input) for mailman id 315098;
 Wed, 27 Apr 2022 13:51:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bzB+=VF=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nji4b-00044Q-Gi
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 13:51:17 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ae1578b-c631-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 15:51:15 +0200 (CEST)
Received: from AS9P250CA0019.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:532::23)
 by DB6PR08MB2853.eurprd08.prod.outlook.com (2603:10a6:6:1d::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Wed, 27 Apr
 2022 13:51:12 +0000
Received: from VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:532:cafe::a7) by AS9P250CA0019.outlook.office365.com
 (2603:10a6:20b:532::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21 via Frontend
 Transport; Wed, 27 Apr 2022 13:51:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT014.mail.protection.outlook.com (10.152.19.38) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 13:51:12 +0000
Received: ("Tessian outbound ac9bb5dd84f6:v118");
 Wed, 27 Apr 2022 13:51:11 +0000
Received: from cf7b74148849.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D8B14CDF-7017-473D-895E-EC4B16A79A3F.1; 
 Wed, 27 Apr 2022 13:51:05 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cf7b74148849.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Apr 2022 13:51:05 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB4881.eurprd08.prod.outlook.com (2603:10a6:20b:c8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 27 Apr
 2022 13:51:03 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 13:51:03 +0000
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
X-Inumbo-ID: 1ae1578b-c631-11ec-a405-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BeQzg3o7eIWyaWlEjxzow+/2ZIvElTHn1MxAwyYueq2dw3jwysaa8zocHbq//0sPoTNlhWwWGRKh05BLMiTbvRsNMAmJI5MyKRDV5BYFzHYQ9gfx4MmSOUsGfulrY8vz1zbTmaocLmX9WdWHluL/q22+iBSGSs1sOeXN2dKF1lPdfZthHdijOcpXUo+p5nB6HKTFV6Oc6rPVqXMMp0VbyDNV1d1wl3QIB3fYoD87ZwU1vG1pGDIlXeUqN3ZAd5TYZ28upidPfQM+9BLfcW90VbAdVC4pJd/wUrE5qEjA0PFx8658mDZohSQyLipOjnd+QuGYQI796vrQ8gegIWpDqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9Htmx+KZWw2gmZcWEuzpZEkvFES4J2c3eFst/alGYA=;
 b=fZcfg+akAJ7vM4xfld+T3r/S+87K+ZZw6scDIplbpXRDYd30+FBOamlbvECazEKUfx7cp1qm4XSdkUSn+2OgsGym45RB8zx36jR3BAAq5nZ0lm+OF8MbSAg9gVyP1MwYgp8Z63YhVygjD7GosiYn/B8LTV62OaJhGXpmCkL4+9evKw3xKLofEe8uftdpMIE9pSdTwqGoKWLekH/NuW36/+R/fDluekYTIjUK0BBypb6MMvZyihEwOOa0ClYOINw5FCSNGKva0HKCl9UiWQdmsZHA1Zhhl0AjDhH/GfwL8ddbnK9bF1Lxz8xgkVhtj+RB5M3AysC8Qde112q/2G/0Aw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9Htmx+KZWw2gmZcWEuzpZEkvFES4J2c3eFst/alGYA=;
 b=Ihq1i0TkVUopbVFkj02ndHz/UkOPZF7T2c2cQn3CI0TD4/GsurooNYx8Bf4qtvqI2wh9w526XuCNEdtQAslCIg5edNpXj9XPLBLHA2mXewrGuhsdXY7qFaqPfEKLCGnpWDHvJIHBroZQb9Nd+2y3nAzJQ19SJBvlDHySuanyY3c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 537a857bb6577d5e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UvcxBIBiBMj7/UUsPDG/wWB4NgdJsOEPPqwfFp3vA93RmiVp+ydo+RRKeqmWBcHYHAjbabN2/P+NP3xWC1yLTNZS3VjF7YYZHTpHodcK/DNZFurG/fF4zhi8bh6jeWVYAn6RvEgsY3MtUZDpz/yrQPvBcGM+s9wkYkB0dCO8cz9y6RtjQ066W8XsaahlaKvAREf9y8VP5MIHsXI6cymdoPiCTRLR4kG4paEBtzkpXryB5QAHxVtTNql9lIRNPmR9z8IVHhJy8YwNH0CLEhK1qqRX7OE9V5gJzI/HBqjDbWBJW2V+Ux1iRXpPDrWcVi5nEVLHDwYTi466C8ByvsfghQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9Htmx+KZWw2gmZcWEuzpZEkvFES4J2c3eFst/alGYA=;
 b=YfNN8t+YcPmEI5mlVJj10vobQQ4EGLGiU8yQcAwWIsWVd59rlOgQ0DGe/hWy+RKO2j4fE5u1f/8Hv5T6gCiFpISbn2GXMyThn8RZUQkn6VgG/y6FWlte3UJth+PHfkj8d+9cD4iCwm6eX6f3aPk5G5vs3VXt5SroehfnXPTMfoZRf3nFj/5nwormzBDfwfpe4JSE13Q3HN2ndpX23ImJv9FMxNYIQ4VVV4sdvDlHOfkY+RHbwHIQl/sE3UDki5GmEO9e/t035m4FUueLzI+4dfE/qX21RfFC+IYTwxruxeO6G/f9asGfew1Z1A0IzRFqNjVZ64BK5R417Djr62YmGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9Htmx+KZWw2gmZcWEuzpZEkvFES4J2c3eFst/alGYA=;
 b=Ihq1i0TkVUopbVFkj02ndHz/UkOPZF7T2c2cQn3CI0TD4/GsurooNYx8Bf4qtvqI2wh9w526XuCNEdtQAslCIg5edNpXj9XPLBLHA2mXewrGuhsdXY7qFaqPfEKLCGnpWDHvJIHBroZQb9Nd+2y3nAzJQ19SJBvlDHySuanyY3c=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] SUPPORT.MD: Correct the amount of physical memory
 supported for Arm
Thread-Topic: [PATCH] SUPPORT.MD: Correct the amount of physical memory
 supported for Arm
Thread-Index: AQHYWjoysOpjhra2zUGfwjKV6P+iV60DxzaA
Date: Wed, 27 Apr 2022 13:51:03 +0000
Message-ID: <2AFEFEE2-DDF7-42EB-A1AD-88642596152C@arm.com>
References: <20220427132246.52715-1-julien@xen.org>
In-Reply-To: <20220427132246.52715-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 68ed816a-4d5e-477e-a639-08da2854fd85
x-ms-traffictypediagnostic:
	AM6PR08MB4881:EE_|VE1EUR03FT014:EE_|DB6PR08MB2853:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR08MB28532286C2183DBA017C2BCB9DFA9@DB6PR08MB2853.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NdzeYAgJkewWr+nD8SY6M2DTRDyQ1uezIqUnMMEahPLgi8Qvf+ZGiHmx8o1bD3IFb85HXop6P4rdi+xbu/qFolzrSUcZfRAgx1D47xc5Ii07JnrNWaae/2tt574ovqXW+83iimP6JkiAa7e6CDkCjqldNNc6lni3L69qpHy9KDje9CJol6PDi5wc0MYwQ925ndCkZCXnK6WpZkAnt5b3POfO9Zc7PjEOwk4HN55w0SAoumQi5x6OgHd9fVUR3Gxaiyggiy4H0Mo/gWQroDoOkKcRNmzVk5AARvsEBL37jl2L8X2+Jio5nmb5jqJRp/RUYeB6RF5CwRxItf/3XqXLnzfnriIFpK6HTGEI9sXMZcvSl1WyLko6OuEZoocnVCUgDE08o84W4PJ9MZ6dWZn2oiEKjsb7JC4NPQXXIWzQ5Rb8pOmn8B8avFj2cLT26wtuLUW2ZsDc0G6IrP40/bl/ca0wSJ3pgn46drdZ6exJBnDVgtT6HGCSjypDKruKyYIqGXP8qNmDlgGBKvHu//nQ2OQ1uqwBOpjidIqkLxOWjC9jzyJiL79RDGsKMUgkUPeXfc06UayQLJ0U1SnKBpVH1tiqRL/vojlsIO4o7ehCUe9OXAvuZEjAv9xD3F2gKEDT1jYXx1+rYT9kj2q7V+WK+Yq6aTka4fH+ThXD9sZevRlcJpETPU7oIltc9Ji1ecuJLyShhAyww4j6ktR6wcZsoy6/re1ZNMQqmXC6c0BPy/5HX5nm5DLD44xAKtiUBwHF
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(53546011)(5660300002)(6506007)(6916009)(38070700005)(54906003)(6512007)(26005)(38100700002)(36756003)(8936002)(2616005)(83380400001)(186003)(6486002)(508600001)(71200400001)(33656002)(76116006)(86362001)(66946007)(91956017)(316002)(64756008)(66446008)(66476007)(66556008)(8676002)(4326008)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <96D2F92452D08342BE70ABD88CB0E7A1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4881
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6fb3a92c-e5e3-4e58-90ae-08da2854f868
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v0SxaGDXT6n5s6m/0SQoa1ll/HzC4K2/MRYkS6Sm6KuLkUNnYtKQKOi2AYdzmFV59QYwQZuKHR2kg6t3qvI11oRVPHzO/kY3d8Rli6BSyhlG9B1fsUvsB0PVcgkA9rzUvfxMZX98HXNUTr68E7bUe16+lW3OFQ+NeSAvtSatVyIL9K0s1eSkS3FBwini6VxNP44Ec8m/YumKJKWr3KqGiD6mcpdWRYxlZRgZeKAnFJojVeN8C74wnStZlSBjNCGev/kFpCtX5VK/fdIl7aavKUHRiDG9UX3Ha4oEat7xvFy7V7+wJ2RTaR0AJx8EzGS6Kp64X5NyWS57aiMTwn+lj1LLTAXKr+msK+pUrhjyLchYOdd+wHwkhdPTLxHJR5rZaRXB3Glql7CKiBQL6PFBfIpy9YCZkXCdOdTq0ykJhwTBRxPuweATbvVie67M3O8TEn1qTMQc7M2c4x3bRnZ4xV7xZ8nIqWgw1VctAoC3SwYdYNUTmZtS3O4Fp5kyo0U49SkbQvKI1rCUv8Uj+EYPBjtLCmmXu8CFEF8jkZK/2muHOzgxbBmcdr24uEIHyT0oUgK/5sBe7+hckyqFC59KlIjq883P/07MKGMpqz3btwIm+QDS9ASRS1D7R5SghFbwounJzfkB6g/+ZMfByii0ITAdN3WlyzXGRjx7GdHME6PvmfZRreDwE0fYpZ5Esn95
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(2616005)(186003)(47076005)(86362001)(40460700003)(2906002)(33656002)(6486002)(8936002)(6862004)(36756003)(83380400001)(8676002)(54906003)(356005)(316002)(508600001)(336012)(82310400005)(81166007)(26005)(70206006)(70586007)(6506007)(6512007)(5660300002)(36860700001)(53546011)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 13:51:12.1011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ed816a-4d5e-477e-a639-08da2854fd85
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2853

Hi Julien,

> On 27 Apr 2022, at 14:22, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> As part of XSA-385, SUPPORT.MD gained a statement regarding the amount
> of physical memory supported.
>=20
> However, booting Xen on a Arm platform with that amount of memory would
> result to a breakage because the frametable area is too small.
>=20
> The wiki [1] (as of April 2022) claims we were able to support up to
> 5 TiB on Arm64 and 16 GiB. However, this is not the case because
> the struct page_info has always been bigger than expected (56 bytes
> for 64-bit and 32-bytes for 32-bit).
>=20
> I don't have any HW with such amount of memory. So rather than
> modifying the code, take the opportunity to use the limit that should
> work on Arm (2 TiB for 64-bit and 12 GiB for 32-bit).

Sadly I have no hardware either even remotely near this capacity and
I think those limits are right for now so...

>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com> #arm part

Cheers
Bertrand

> ---
> SUPPORT.md | 7 ++++---
> 1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 088dda9561c1..1e3c69a07615 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -50,9 +50,10 @@ For the Cortex A57 r0p0 - r1p1, see Errata 832075.
>=20
> ### Physical Memory
>=20
> -    Status: Supported up to 8 TiB
> -
> -Hosts with more memory are supported, but not security supported.
> +    Status, x86: Supported up to 8 TiB. Hosts with more memory are
> +                 supported but not security support.
> +    Status, Arm32: Supported up to 12 GiB
> +    Status, Arm64: Supported up to 2 TiB
>=20
> ### Physical Memory Hotplug
>=20
> --=20
> 2.32.0
>=20


