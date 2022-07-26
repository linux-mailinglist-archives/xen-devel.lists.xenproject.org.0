Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3125815B8
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 16:51:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375382.607728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGLtz-0003Ra-4W; Tue, 26 Jul 2022 14:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375382.607728; Tue, 26 Jul 2022 14:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGLtz-0003OG-1S; Tue, 26 Jul 2022 14:51:15 +0000
Received: by outflank-mailman (input) for mailman id 375382;
 Tue, 26 Jul 2022 14:51:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+jxi=X7=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oGLtx-0003OA-66
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 14:51:13 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2067.outbound.protection.outlook.com [40.107.20.67])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6403e8fb-0cf2-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 16:51:12 +0200 (CEST)
Received: from DB7PR02CA0005.eurprd02.prod.outlook.com (2603:10a6:10:52::18)
 by AM0PR08MB3476.eurprd08.prod.outlook.com (2603:10a6:208:dd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Tue, 26 Jul
 2022 14:51:10 +0000
Received: from DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::d7) by DB7PR02CA0005.outlook.office365.com
 (2603:10a6:10:52::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.7 via Frontend
 Transport; Tue, 26 Jul 2022 14:51:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT061.mail.protection.outlook.com (100.127.143.28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Tue, 26 Jul 2022 14:51:09 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Tue, 26 Jul 2022 14:51:09 +0000
Received: from 96fa35068418.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 22B09FD4-217D-469E-BE6C-13DAB90E5D54.1; 
 Tue, 26 Jul 2022 14:51:02 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 96fa35068418.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Jul 2022 14:51:02 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DB9PR08MB6617.eurprd08.prod.outlook.com (2603:10a6:10:261::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Tue, 26 Jul
 2022 14:51:00 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7%9]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 14:51:00 +0000
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
X-Inumbo-ID: 6403e8fb-0cf2-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=aD8GX9ztNvG4vPnWqePG6xEf3BH9mRAJlQPOldcDBCI6mC/kJWvdmNhBAsM5znMEhqNmUlguci7/QHXIhhvJypOo0xJU2YH4KAKKP5L/zAYeq6cm3+8SAeVDzCEhjTIB7KUFNzUJMq9Ja81tNpdqmP4hy973HE9GdlFkDOAQnM7iAFUAXq5ptxteErT6nYcYCHiDo//9xmWYoASHxe6xazduqMsrvJSsRBAXPQ7HzA6SBewxaXBSjMRzfFgvHxgTo+yYUAigT1r9Vi8mgwTECzEWLfa5WKgvvPwHsJ9dR718ecuuZkae08/wta7Ibk9CVS4j2FIbZ9v+ZbwAM1aENw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhwiUm89xg+3yZ4e6A8obhVLJ5u9gC4z9JCao1eTK5Q=;
 b=lOyzJICMrR1+6pH0uzIUedzmC9to8Rq4hBxqnljvHwjnj6hVrWKFZnKutq/VWz5Cmwrvl7Tb8za1LIwv5FbwPHSZKSSzC/MEfZX1dWBjNqXQOSZiaPQZd7bkLbBhF5HQVyO0LOtSnO946q6+JtKXcLjJiZuF9F3W+nYjP1jZrImXVRYGNoHNnZzLgDGIgp6gxDuI02Xc1PeOk0iLXFsGB4Oz2/WD/fZ5QErr0jn2ClwkiyL5x4Tfq4AO1b6vyEyUK6ov3PvvO8HcyN9ZJjBjoHdFftDviKgNvEh6u+9NPPh0ukU6hd72lzlyRKYK5vQnAsRDrdL3mAT1p7yu27vScA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhwiUm89xg+3yZ4e6A8obhVLJ5u9gC4z9JCao1eTK5Q=;
 b=xqMPQZH31HR0ulE8jj13BQibfoSH+iqyvogwkku0ZUta750yxEPEM0chvMJ3CZRQ31+0H1kirTLGxUfHOE6bADQOz7HOgiQEYgXviJ6rik2l6Gls29al5+PkJXbGreygoFgBmThsCUcY96S+euxhadcCji0SXJ4W5snY9yXDu1I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2ef176a711a58498
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZpWhPYcBJLQazWRrAKlxlovdyXQYM1jOYF8thytmpHJ0puKkzFgshvgZGEj+q+dixD2l+tpC1tNoxYlbmZ3TpZwgo8l0Do+x/f9fHIMIDXU+d6NIIZnryhRMD1zofXmN2erRxkAiqF6ZMFvAhe/V/c+Vh95l7ap0XoCwWEPTYJqiqQkTWAej1iA8rA0uCNFD7zfpIh0dGcx3HRGSl4wXtZKK8DWQLD8SoJTd6dIQ4D9ezVNuZYwRi8kUftLTXI04KMfiZweqYEARp9tyWtk3rjgLKIpZY+rBWAhkp131bdk3HTJSg/a7ig7ZoN7VSaRTGHuojlrf9tVb/p+BXvcXbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhwiUm89xg+3yZ4e6A8obhVLJ5u9gC4z9JCao1eTK5Q=;
 b=A5tfFLvy6Jw49Lweph3DVSBh3QJAC8jObnEhIcAifyNoapHMI2syxdFC/q8zkPpIuwlnw39T+XK4KWJig+H8TDw8q+qzxeGwvIUNuzsPYUw2U3WtcowjB1qNHtvPzXjcUhCxIEPrP+42Hm/+7E2h2z5mt4Uq9tn8zbMTn4q92w+qT1OE4RtgJdSZ2+Gda4HVoYuwaKsxwxn+sbaxphuESpEQ1crhhFrObBLPQMwGpZ5iUzFEiIKjGB7cJF/xj7zZYt6aBTdU++v9dTCETJyr+00XDKBfdU8o19arzmbWSjKYhQhU6xWti/FR2E7YWV8vLShnk0vyLijpHAbgOa/Jkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhwiUm89xg+3yZ4e6A8obhVLJ5u9gC4z9JCao1eTK5Q=;
 b=xqMPQZH31HR0ulE8jj13BQibfoSH+iqyvogwkku0ZUta750yxEPEM0chvMJ3CZRQ31+0H1kirTLGxUfHOE6bADQOz7HOgiQEYgXviJ6rik2l6Gls29al5+PkJXbGreygoFgBmThsCUcY96S+euxhadcCji0SXJ4W5snY9yXDu1I=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH V7 11/11] xen/arm: account IO handlers for emulated PCI
 MSI-X
Thread-Topic: [PATCH V7 11/11] xen/arm: account IO handlers for emulated PCI
 MSI-X
Thread-Index: AQHYm5cUcU3VrnySPEy+ivRgo8KSXq2Qxw6A
Date: Tue, 26 Jul 2022 14:50:59 +0000
Message-ID: <71A6D8F4-5591-4869-B5A2-486E6B8243F9@arm.com>
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <20220719174253.541965-12-olekstysh@gmail.com>
In-Reply-To: <20220719174253.541965-12-olekstysh@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4d81a3d5-e7eb-4188-acfc-08da6f16470c
x-ms-traffictypediagnostic:
	DB9PR08MB6617:EE_|DBAEUR03FT061:EE_|AM0PR08MB3476:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9tTaAIFSkqMyWRN/l7YvAsnxfuhjEumb3lZkyQAdVGzeEJvJVQf2EloJea4h0yqW3+pqkPnTvu5sixdZ9YPqTuWkMUQxHDFX1LwSVViQYkhehcyDqiqEalYIoR6EiScyag1B0O34ox27Y1BlxoiGNBRBB/ufmr65iYY2ny27A+BkoG+e1AqiCdf8Hp9vm2bPTgNmSZGwOHYIv2mX/s6VGMuKKluysL3rXTNCfCvSR2R5hZAtp6XyYmF0GMAUXg8Wj2O/N/brw0NEcxuWyNx2vr7ho8ZAKHleZF9psStXIW95wqpDFNrqZO/8P8U4swh95zsjO8tGhG7wHnfa0OmkGwd890qX7F/m1dBuhujDM1CuGYKaEdXaOzdgc02kV4ENzYwx/UYODkkKjqBUmocraV0f0K1VYQfPDk5YdoyISPEr3pLuafmk1iyAL5J+eLQrLFqILsZQYJcqLKjqod3hzasaqE7LqRj9trNse+CH5Dn6JD898OZanhTBT7vOpxe6EIJVHb+sF071e/CS6bpus1HbvZU6LC+Fc15hZQHcUaKEL7QJyjnxdOyW7QZQU3SC80gIQfqoTwVTyagMCGC5qMyoxWqHy6rful4M6xXW6uLJk2LdeTRLJmhj/gExPH69no+fmRr7xlLbxSUXLBFazfLDmWvYVMSjOf8Mswn8w7+cUlu9nvmvrpxG35itQX0ddEAYnxjlY+Mm6rtapdG5X0sUAPau/F/Zvf5yn4zO+03wl1/t4WVKHMCekrcItxyMrSg4kM4U7y3BERDnd5MDqtfhmTrJKb0Zy+Hl6xM2RB/ELqMO+ziPgbz+bcFwMOiz3XBTRUVJr3nvDwscqiBR7A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(316002)(54906003)(38070700005)(36756003)(2616005)(186003)(6916009)(33656002)(6486002)(2906002)(38100700002)(15650500001)(4744005)(122000001)(5660300002)(8936002)(4326008)(91956017)(66446008)(64756008)(66476007)(66946007)(76116006)(66556008)(83380400001)(6512007)(41300700001)(86362001)(71200400001)(478600001)(53546011)(26005)(6506007)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <21077206A8B39347B9D59283D3CCB984@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6617
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a19e27cb-b8a8-434c-c2a6-08da6f164115
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eAtthxZB758DcPaWbI680KAmd5NRPq3RkmjipprR2NkK54lUP04b2bXGafMC8qsAZS0KV4XjZnTLHAly3Ur7yxXrc94iZnUkmM/YQGuk9V1a1potyqBvY/x9x+f4MY01Vf93Jp9cgvq1/XzPAmqrBTQPz9/3j6dIh60/Lgdm6RUJvO2rUeXhb9hYwEgr6PLY1oeV6DpKbvzsYx8R2kI3Uc+7yEhejEJEPDdbtS93ZSPyYza+g2K75UnRAmWq7pjVvKfpl0lXn1tnAxN7UgBwLjy1QwnXVbbqwYPAQDSpjNINst/GNsvUABMh0kNLQEXIqO1VfqKFocNdFnwLS7o9Jgc4CLzfJSw3GajM1s/1IQ5jKn2SvjCAfCcnRolTDvpCyEqCyMINhxIXWYBd8JCNjR8Id5TnSn9WlWJzDo0FoJ1VdXBpIJTf/GCpgnATPjRL0mDJoWvbn2jckwlq7FCfxd7GzVQaK240TEdwHyEL32HKrLfYFHpuZkpKsLDiylUTKMxg62I93kIpaF404cfY98FcxIxHP4magkgt1bplOC/4Epa3PTee2SDE3MpEnmKFcJ1c95R5N2krMfzC85A5j5EzPkIySxCBnKESCVLZcI83tNtbFZki3vOwpQwQD8lagvTz+uBZVa0ihs5XO46GJgZJrNMlkugO5s8/B5Xf4sUJSvLdVvzFacgI5qzg6oD00pKhb9WUBb5F1HaEUXzamUP/UoUyp3i+4NcKyD6iwYuUqntNNe+3rboWZMJuiCk2S0OHVZgwXB937IQ00Dtr4r230q4ZFKZL0nBQjIs6A+IDwGz9WU4A2Gr44DrTVG27
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(346002)(376002)(40470700004)(36840700001)(46966006)(2616005)(107886003)(70586007)(47076005)(41300700001)(336012)(316002)(8676002)(4326008)(82310400005)(15650500001)(26005)(86362001)(70206006)(36756003)(6506007)(186003)(33656002)(6512007)(53546011)(356005)(81166007)(82740400003)(40480700001)(36860700001)(83380400001)(8936002)(6862004)(5660300002)(54906003)(478600001)(40460700003)(6486002)(4744005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 14:51:09.8323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d81a3d5-e7eb-4188-acfc-08da6f16470c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3476

Hi Oleksandr,

> On 19 Jul 2022, at 6:42 pm, Oleksandr Tyshchenko <olekstysh@gmail.com> wr=
ote:
>=20
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>=20
> At the moment, we always allocate an extra 16 slots for IO handlers
> (see MAX_IO_HANDLER). So while adding IO trap handlers for the emulated
> MSI-X registers we need to explicitly tell that we have additional IO
> handlers, so those are accounted.
>=20
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Acked-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul


