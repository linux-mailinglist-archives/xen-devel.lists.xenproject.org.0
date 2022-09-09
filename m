Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B705B3235
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 10:49:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403920.646189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWZgP-0007S4-6S; Fri, 09 Sep 2022 08:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403920.646189; Fri, 09 Sep 2022 08:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWZgP-0007Q6-3W; Fri, 09 Sep 2022 08:48:17 +0000
Received: by outflank-mailman (input) for mailman id 403920;
 Fri, 09 Sep 2022 08:48:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xTTi=ZM=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oWZgM-0007Q0-GV
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 08:48:14 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10056.outbound.protection.outlook.com [40.107.1.56])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 191eee47-301c-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 10:47:56 +0200 (CEST)
Received: from DB6PR0802CA0044.eurprd08.prod.outlook.com (2603:10a6:4:a3::30)
 by AS1PR08MB7561.eurprd08.prod.outlook.com (2603:10a6:20b:470::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Fri, 9 Sep
 2022 08:48:05 +0000
Received: from DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::ae) by DB6PR0802CA0044.outlook.office365.com
 (2603:10a6:4:a3::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Fri, 9 Sep 2022 08:48:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT037.mail.protection.outlook.com (100.127.142.208) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Fri, 9 Sep 2022 08:48:05 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Fri, 09 Sep 2022 08:48:05 +0000
Received: from 9f49eb945789.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 533C5D48-966B-425A-B70D-FEB36666D608.1; 
 Fri, 09 Sep 2022 08:47:59 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9f49eb945789.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 09 Sep 2022 08:47:59 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VE1PR08MB5725.eurprd08.prod.outlook.com (2603:10a6:800:1b0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Fri, 9 Sep
 2022 08:47:56 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Fri, 9 Sep 2022
 08:47:56 +0000
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
X-Inumbo-ID: 191eee47-301c-11ed-9760-273f2230c3a0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=I8a9UnKVbTR85PvoEVhbLae/AVHvVbyFw7rXgoYUGNBXYoDySuI9fX0UklJnDNtPIs8EvIvQRSp+NNV9Z6Loyx4k8R7DY8ZwgwZCpTS0IxXjGVz18GSAVeEFP76iyyr8Xi6WDyZOjJbe+HNSx6i8wv6ZAWd7b6X7aaGasLZBhgHfUYgPi5U3n6WR+H/ENILi3aXsRJptOyhKw47R1UzEvTYKGjUQbNNiZpqQSTYpM12ujrFVDRtdctVQQz9EEpEp36xjzRgtDzStiqtFKY6cU5DDAtoNY8eIDDzg72CXpGzaWV/fOL2431RcL9bAr71q0xNeZRGTv5ngJNxLjW4gWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dUFCoM03gkskNqqdPwVSdN/jE1pWbq6byaxesKdkOQ=;
 b=ehklOCvQZ1jUXiu40ON46JxVRRf3t/gGRbF49/BoBvy2tE37KvJzF3+W9ONk7j8jS+/ewp0njOj+iRo7ST/Ef8buTupIKU6VpLkpWs1VYPDRG5HIu+E5H8pPgGfiXDELOfPN4ny9+FiG+vkiCNpGhxH0ascssHxOaNyyXWKE8lrx0ZebXe2pe2vYZPeZzKzasZ+fakmDU+yT66jBRQXPziYOn4w5w+3+rbWN+O9gBsI3qx/8W9K0ChkyaMPVynXHS7Buta2wUjmQ9g/uQtTo45JGq2d6xHaB3rO+8n9BCpZsU6UozotH2In/YgwqwSaTYfm/nRzKWIyQXSr1gaY7DA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dUFCoM03gkskNqqdPwVSdN/jE1pWbq6byaxesKdkOQ=;
 b=tFRZOqOIno+/RjN+sv8KLuwj0NZdagIaz/+zEHtOxxpNp4FXeDHRsnNQbr5lzBjJbQUnq4pQTlnqdFAh4W9A1fqvBsi0pI+ktMYD7HEn2hY+lOvr7ZXuu41G5dCSf4Bwrm0nTmm0dgJIDXVLRzp1r0H6HXWxUBnlWuGfnpK2u2I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2mEUgGFw9e0diKB0OK6ux5fRjV1NkRtwy/nZaZ8Me9xnR6eWptGZ7BnXjlqqaphmm3UsC0V5uBDbw9HK/VWN/W+7uaDEBkokCgH6PQb05/dOxIbztEIOk4b6s4ZBnaG8TP6f7ELrXQl1D9wFtL8jauKfOYOxjaWIBZtWXN4z4pybSPaQxQjrHDXEkgnw+YQrEG8TLLdqzI43CEBIOLqXXaKQeDFFeO4yhohkzqaZhzQweBylCx6MFAKdOHSTeskEE5dbzCQsP8xOS+fey6k0b5H0zHm091tmkCTd9mr4SCiUD/n7HT/uQnd6peQgFVs35hfzcYbPqOx3wfrHmVYCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dUFCoM03gkskNqqdPwVSdN/jE1pWbq6byaxesKdkOQ=;
 b=UZc/eoRaFPEyP6s0VgwQd9+QbQjFJY7kCjXsYLh0L44agmxPo7jziTRQF3XE7RRZVHo/LKloBbcUfl48PIUACZ1Vs8l5O8q4FNBsu6wGSn4enti9YzdIm1PMGVuI/lV3cQXmer6Ab2+XC2cQd2l/KvCcZJnZYqZDgl56Zg7M5Yhg1t+0c1wzisPxbSQ2vR7cvjE5f5RBQ936WR1GH6vrB0dTinIAeB/nimLlwTuSY0ppTDDHbb+kMdnc5D6wQyz1HCypDf6o2w6jsRotlbHYaY6LuOl54jlMiJs7oEYAOEOwO+cbaki7i2KYIWEmk1pLbIV8aO86JK9aTqeO6aVDeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dUFCoM03gkskNqqdPwVSdN/jE1pWbq6byaxesKdkOQ=;
 b=tFRZOqOIno+/RjN+sv8KLuwj0NZdagIaz/+zEHtOxxpNp4FXeDHRsnNQbr5lzBjJbQUnq4pQTlnqdFAh4W9A1fqvBsi0pI+ktMYD7HEn2hY+lOvr7ZXuu41G5dCSf4Bwrm0nTmm0dgJIDXVLRzp1r0H6HXWxUBnlWuGfnpK2u2I=
From: Henry Wang <Henry.Wang@arm.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: RE: [PATCH] xen/gnttab: fix gnttab_acquire_resource()
Thread-Topic: [PATCH] xen/gnttab: fix gnttab_acquire_resource()
Thread-Index: AQHYxCOLeMow4nnAdEmRQz42iuSBI63Wx2cg
Date: Fri, 9 Sep 2022 08:47:56 +0000
Message-ID:
 <AS8PR08MB79918E22F292563B320F502592439@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220909080944.28559-1-jgross@suse.com>
In-Reply-To: <20220909080944.28559-1-jgross@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 095221FFA4D56443AA0EEAE590DBF937.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a5027476-f259-4e4c-9339-08da92400305
x-ms-traffictypediagnostic:
	VE1PR08MB5725:EE_|DBAEUR03FT037:EE_|AS1PR08MB7561:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZSi9sNTO3SJ6EjXI+oS8Z6qjRTy5KuMuGVSVIqymbBn9anWT5i8zo+nq4LhGKN9yonYYRTAZ6JeILeisrFdvJWJ/L9XYAWyAGwW6EK0czsKIb4Q2DEL0fjEpwUA6gHwyNE0aI7+nXPS4emq7oXclZT7qB7PD6VppiUqP3B/s1kdVJR7vD/2ScOTXCtW3wwhSHpbkyjnma3onval4XqSelyeD5aHXre3Ba4oWOXWdBQxSqIIa9FxsCuqR/De0BmQO28CGC3HN0q2FzzGM5LzQwTeyvMZAczAE8kSgYPWC9w+MJmAqGfa3L6BYxIrqSgt/SEqQe+XLNI7obhFc16ifts2i/Ioc2Jdzyn9c8Ja+7kVOTjErk2V+0N0RJz+TkLOELyMyD0vW0yxLeMEU1eMkAKOZNlsLS10HmZ+BPC7wBSqjFy5T8m23dTZt0ISSsbPmkmyG9MH39MeJuJEDYeXQzV7c7HOfXZ4spzqPOsaCtyepZBhffXQN/8x0+OvW4yV6126ejYQLNMw6CgO/IQxyUcW/BRspwqql4wKyUGuW60oVkOiXa79+DZ/vdm6ckIRn9xp8GqJVHDxgwJZWXV8Jlwb+B01WCQTpqpkrD+OO1oE3Me9gOHu7PRCw6X++lQh9URV4mKOSgbpOZBllx4aKP4QIVhUChB9ploDnqpDXEMNhwoxNutd8M3hvynnoK0eE7BO+BRazMUspNgAQlzDHylR8YOEKrhNyQapPheG3rqFq+1tySZLacUfrAlF9HrO76c8lDOv1bPrbXEb6PTovgA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(6506007)(4744005)(4326008)(86362001)(8676002)(64756008)(66556008)(66946007)(76116006)(478600001)(66446008)(186003)(8936002)(7696005)(52536014)(33656002)(5660300002)(66476007)(55016003)(71200400001)(2906002)(41300700001)(110136005)(316002)(9686003)(26005)(54906003)(83380400001)(38070700005)(38100700002)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5725
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dcddcc6e-4c40-4f8e-378c-08da923ffd8b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pb0xorxDF5VxfuroW8PatXmjimuoac+6zysF5UhzRe1BfuWchc3hqtNQsYdRqDfStTAUSMTKgFS54jRhcA+gcUJq3VyjdF8CArQNZNMDkMdwkNJqO6f6Gn+3gK9AUjYKEp+sevc0rcN4YHtBPbx18EA3gtsANjgEIYavsD9O9ABtzv/qiIND+C8HPc/dQUnjAdbNRvGwa9nyh0Q11xlvaCcJH73SXO4yatBQ6DWPLdyABA4A+pPyKO3xPvzzG7nX0jPg+f6IBdUmiixUvleR+MV0bwBnEqv0CPk/ExNJwCm8S792w/sWij7MZ+0gOmjp8b/oAJmNXNlw9NVy/VLJ6PHYZ0FzKtHyTI5ja9+fAD0aCNoq+/PFGv87feoqf+i91PEtGcnvZieNN3Ysbu4J+tNAE7ySD9bD95zynhgM8u5eUTXzIymtfbzOT91F3eQd3E0qAJmQxA5NwqfDZ8NrqdG3b8vgYbgaWLL01Mxa4oay0qm6/Voba8rnlm1bWjRN5WBvK630QEjWVigB9FlHQyv/0tH69Wg9J0FPN0qiTsw87ScEj7cLJ/vlSp/EECD42+V1koZnyBPkIB40OLevQH62HE5OR8Jo1xFnmVoKrXyagn8rB7VGb93r7zl7qt4CH9h5UH21e77Pdb3TH4LiL0BWBguvOeaU8KdkpdBFEXSgLhZVkb0iOPtFx+LrPFoPRHBHYjEQIo/4qA6C4BWLSplW0vuNFPK/aQG5invigLffKiXuzGy/ZJsHYbfTWEenBZ2zFDYlDWTAr8GTyFN1cQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(346002)(39860400002)(136003)(46966006)(40470700004)(36840700001)(4326008)(47076005)(70586007)(336012)(4744005)(8936002)(5660300002)(52536014)(8676002)(2906002)(70206006)(33656002)(26005)(86362001)(9686003)(7696005)(82310400005)(478600001)(186003)(40480700001)(41300700001)(55016003)(6506007)(83380400001)(40460700003)(81166007)(356005)(36860700001)(316002)(110136005)(82740400003)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 08:48:05.2449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5027476-f259-4e4c-9339-08da92400305
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7561

Hi Juergen,

> -----Original Message-----
> From: Juergen Gross <jgross@suse.com>
> Subject: [PATCH] xen/gnttab: fix gnttab_acquire_resource()
>=20
> Commit 9dc46386d89d ("gnttab: work around "may be used uninitialized"
> warning") was wrong, as vaddr can legitimately be NULL in case
> XENMEM_resource_grant_table_id_status was specified for a grant table
> v1. This would result in crashes in debug builds due to
> ASSERT_UNREACHABLE() triggering.
>=20
> Basically revert said commit, but keep returning -ENODATA in that case.
>=20
> Fixes: 9dc46386d89d ("gnttab: work around "may be used uninitialized"
> warning")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> Might be considered for 4.17 and for backporting

Of course, feel free to add:

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

If the maintainer give an ack about this patch.

Kind regards,
Henry

