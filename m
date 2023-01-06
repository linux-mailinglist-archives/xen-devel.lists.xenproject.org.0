Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC136602A1
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 15:55:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472702.733059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDo7w-0000oC-1L; Fri, 06 Jan 2023 14:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472702.733059; Fri, 06 Jan 2023 14:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDo7v-0000l4-UF; Fri, 06 Jan 2023 14:55:23 +0000
Received: by outflank-mailman (input) for mailman id 472702;
 Fri, 06 Jan 2023 14:55:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fu4g=5D=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pDo7t-0008Ex-UQ
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 14:55:22 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2082.outbound.protection.outlook.com [40.107.22.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24680166-8dd2-11ed-91b6-6bf2151ebd3b;
 Fri, 06 Jan 2023 15:55:21 +0100 (CET)
Received: from AM6PR10CA0102.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::43)
 by DU0PR08MB7924.eurprd08.prod.outlook.com (2603:10a6:10:3cb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14; Fri, 6 Jan
 2023 14:55:19 +0000
Received: from AM7EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::9e) by AM6PR10CA0102.outlook.office365.com
 (2603:10a6:209:8c::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Fri, 6 Jan 2023 14:55:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT007.mail.protection.outlook.com (100.127.140.242) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.17 via Frontend Transport; Fri, 6 Jan 2023 14:55:18 +0000
Received: ("Tessian outbound 6e565e48ed4a:v132");
 Fri, 06 Jan 2023 14:55:18 +0000
Received: from e09339cda5a3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7DA152D5-473D-4C33-BD83-1B60E4AA420E.1; 
 Fri, 06 Jan 2023 14:55:10 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e09339cda5a3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 Jan 2023 14:55:10 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB8276.eurprd08.prod.outlook.com (2603:10a6:20b:56e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.9; Fri, 6 Jan
 2023 14:55:05 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%4]) with mapi id 15.20.5986.007; Fri, 6 Jan 2023
 14:55:05 +0000
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
X-Inumbo-ID: 24680166-8dd2-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bB7mfEV+3gGaxVSg/wMmc8Z8VBSo/9rvzcBJqcrEW6E=;
 b=puFJSeB392T+R3NumBsyprgvCxKLnijg9owvd748IFyIboDftf6A/9sElKDNlHbCRsm5q3w6LOsffYO/OHnAu+kU/FUjOkLHAfMJZj0mssN0no6kAZK8vvXvkLrb/K2NRFCfvP1nxmq1HlswA+2y41b7gs4P5w5R7FFnbqnNJzQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X8atF9RdBlD1kySDpW94N0I9Az1vOquWr9G77/EQVtFJfSi70MmV/Qgj2enwQihYlMQ2+PR3od9zEnHJ83kYXo4A1lf7qitm8qxcggPUlvolcn+uZYV8R9LuegOe3KEsa62jDx2PW5HuGiVi+wdqATywW4mCyWgnnm9sOWwJkgFVlh6vAmNbjJUaAV27bgS9JStqbs6iQKXKRDfJCj4PDx9y9ZGsKE7o9RWt1QgM53/gZyPwR4sFhT8kG44iujKnEB6av07dgPRkaoKUNq7pMB2yEuKW/abjsdON+zefIgnY4AeJzkeTRfP8dR1PW2XFg5fdwP0Vrx2XaHwcoUS4iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bB7mfEV+3gGaxVSg/wMmc8Z8VBSo/9rvzcBJqcrEW6E=;
 b=G+hLPZqKi6CnfJwl/Ec+diB7WYMxiAddUDdxwMF05XmJLX1OzXLW0Vk6oNFWPtlo7lipM9Mn9dlzKpe8G0gnLzdCKqibNwowi5oi7L0vZAMa/aVBFqbzvfsxo4jvjLoPvcGIJnSRaUjk/r2aCzgaJPVJ8Sgn3ecGBBpkYYc2pHAc9E9h5vvQ72JQpjiwq0lL/u5RRjue79m0K78snn5Spyq7eMoiv0P4FSTaA7Whd/KLlzYso1nAPbXKJ5oiDQ3xDGj8uNIGZScOECbS3RnKpx1p2eELpNCwLRgQxqkF3lXX9MYWl8l/bbdWcYP+RyIolJr90ijEnZrCWGse1lEYlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bB7mfEV+3gGaxVSg/wMmc8Z8VBSo/9rvzcBJqcrEW6E=;
 b=puFJSeB392T+R3NumBsyprgvCxKLnijg9owvd748IFyIboDftf6A/9sElKDNlHbCRsm5q3w6LOsffYO/OHnAu+kU/FUjOkLHAfMJZj0mssN0no6kAZK8vvXvkLrb/K2NRFCfvP1nxmq1HlswA+2y41b7gs4P5w5R7FFnbqnNJzQ=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 21/22] xen/arm64: Implement a mapcache for arm64
Thread-Topic: [PATCH 21/22] xen/arm64: Implement a mapcache for arm64
Thread-Index: AQHZEUhyvmaM0DFPMU2aLMVoP+HuFa6RlnZQ
Date: Fri, 6 Jan 2023 14:55:05 +0000
Message-ID:
 <AS8PR08MB7991F5B73FB994683F3C00B992FB9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-22-julien@xen.org>
In-Reply-To: <20221216114853.8227-22-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: DE5208C9CF86F842B8BCA8463358CE56.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB8276:EE_|AM7EUR03FT007:EE_|DU0PR08MB7924:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c4f5ae3-c42e-4cb2-ba48-08daeff60718
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ukdUnozmQMKQ6pzLifjqnjK8/ooHo7JyIDuPmvdrU7IqhmW/3byjGqRD68LNOPS+s2ZBltQeRWGkYCEeUxpbILpi7hAQaelQxOWQZvYvXvWveHi+duqYny9U5sOrdUhezVt0FXvMX9Kw2VKpmiS219FLuZEg6Tt0MbbMtHQ/qYHiYIzrocnG9Ab0Bz1K0WWCJplrm7CurwB1giMgXFmstGU+3KwbIXN28ZuhkBtwOQ+LsO0VGBMy2iWGgj2eS4Ua2SEHsakhfQmwvtdBUOATK917w/YBfR0iijjL26uM3j9xmQ9OZp26Hp7LdOsqq6jguzilNF3xnNZE11nnn8fO76IZIboawEvhVFc1ItVTJI0lzmHQa4ceQfUj/K1gRHBD2slNMDFhZVSl+qvMz1Kdww/CIfY5T+XfU01JCJZ+46zL9p5EjriZQpC2UQpZageMwM3EDrkHCBmX5h1D3niKfwIP8NmfcxxC4kiSTmwyRDW2JeeJQsd6ec1dfmLqXR/EfC+ebLXopk244DieY9m1VbrD40KL0E2jPYEJpj/nvKoWSJa5xAjsS6qEe84J+PZAYjBTsP0fGNvQ9ZUub4PP0vvssOX233Ou/YV/w+QHDPT/9rKeHVL8+y1LAzhGpFQPzpeupqUw/5Vlp7lDdmDyF7DWuiiiqPI0We+K8OqosEmDWH4UzEUEh0viRubWwenEFujSayAp5g2vgX90ggUvAA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(451199015)(9686003)(86362001)(2906002)(316002)(110136005)(186003)(55016003)(38070700005)(54906003)(33656002)(122000001)(6506007)(38100700002)(83380400001)(71200400001)(76116006)(478600001)(64756008)(7696005)(8936002)(8676002)(66556008)(66476007)(52536014)(41300700001)(5660300002)(66446008)(26005)(66946007)(4326008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8276
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	02c45455-cb9a-4a70-4736-08daeff5ff04
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FzOsndoCTQoQS+Atcvxo22dDwB+vKIoCf+2jAETww4rGMW1yYo1r+quRBaAlUDmh6eejwrjl0jZ0Sz3prwFzTKNycNGIgw2b8GhnvHGhexseS0Rd7xAeCSvQL3qxmv54AQ7te6k3ivUAweNHrILgd6kcIsVhYK7UyMeS3lrbgCphtLYfOuXogSKqFA1prIZFO0/SSV/Kh39UtXxFD7lUfSsM0FLYe2sjp5ZRVlZf/opbNhx8V3gJ/AFev6t+YZmKL+91StKv7lkRR9X9/InMTgLosMKYNhSaclXg8WrWvjzOjTMm6NahLxVUvxl6vBZADlPDy/iD/xZvMeQF+oM71PuQx+VsL1egkv6ZvopR3rnkm3BXAU2Z6oe0ZGOnW5gHLcPe/iqtHLOnmQSUAEGSmeSa5zluw613Zgfp51oEW2mKKTq38IPXNDg3k2WF1nMHOA+mZUJbGvDDY0lKz2DjCN2BCB3p8E5N5Ks/PALopoORIxrdRm3zNZj1NPsMSSGmEE9bycwy3JyXwX5GwGZ59dy0x9rUtiateYUsDVygB2Fpxj3QyKxt0qPxp4M7JeXQZG2PTP8KUFHKY24IyWsfzxmmX2QEBtksJszCopd6ZQPjlh3fxmaR44/oVv02bS0HGxg3+ozAYKKKOxKXz60V15Li+CjyDqmYMh7mNfNKKYInNNfDZMvQeC+rUNmAsBlM4s0pa/pAIuKXYDkotZ1fWg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39850400004)(451199015)(46966006)(40470700004)(36840700001)(316002)(41300700001)(70586007)(8676002)(86362001)(54906003)(70206006)(4326008)(110136005)(8936002)(81166007)(36860700001)(82740400003)(356005)(33656002)(6506007)(83380400001)(336012)(107886003)(478600001)(9686003)(47076005)(40460700003)(52536014)(2906002)(40480700001)(7696005)(26005)(186003)(55016003)(5660300002)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 14:55:18.5932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c4f5ae3-c42e-4cb2-ba48-08daeff60718
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7924

Hi Julien,

> -----Original Message-----
> Subject: [PATCH 21/22] xen/arm64: Implement a mapcache for arm64
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> At the moment, on arm64, map_domain_page() is implemented using
> virt_to_mfn(). Therefore it is relying on the directmap.
>=20
> In a follow-up patch, we will allow the admin to remove the directmap.
> Therefore we want to implement a mapcache.
>=20
> Thanksfully there is already one for arm32. So select
> ARCH_ARM_DOMAIN_PAGE
> and add the necessary boiler plate to support 64-bit:
>     - The page-table start at level 0, so we need to allocate the level
>       1 page-table
>     - map_domain_page() should check if the page is in the directmap. If
>       yes, then use virt_to_mfn() to limit the performance impact
>       when the directmap is still enabled (this will be selectable
>       on the command line).
>=20
> Take the opportunity to replace first_table_offset(...) with offsets[...]=
.
>=20
> Note that, so far, arch_mfns_in_directmap() always return true on

Nit: s/return/returns/

> arm64. So the mapcache is not yet used. This will change in a
> follow-up patch.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

