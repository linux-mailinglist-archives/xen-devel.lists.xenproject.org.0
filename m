Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C06FA6E3EB5
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 07:00:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521722.810548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poGxq-00070o-SX; Mon, 17 Apr 2023 04:59:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521722.810548; Mon, 17 Apr 2023 04:59:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poGxq-0006xb-Oj; Mon, 17 Apr 2023 04:59:42 +0000
Received: by outflank-mailman (input) for mailman id 521722;
 Mon, 17 Apr 2023 04:59:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c4/u=AI=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1poGxp-0006wd-RX
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 04:59:41 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2077.outbound.protection.outlook.com [40.107.7.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8ce5176-dcdc-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 06:59:40 +0200 (CEST)
Received: from AS9PR06CA0578.eurprd06.prod.outlook.com (2603:10a6:20b:486::11)
 by PAWPR08MB9007.eurprd08.prod.outlook.com (2603:10a6:102:340::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Mon, 17 Apr
 2023 04:59:03 +0000
Received: from AM7EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:486:cafe::7d) by AS9PR06CA0578.outlook.office365.com
 (2603:10a6:20b:486::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.46 via Frontend
 Transport; Mon, 17 Apr 2023 04:59:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT057.mail.protection.outlook.com (100.127.140.117) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.17 via Frontend Transport; Mon, 17 Apr 2023 04:59:02 +0000
Received: ("Tessian outbound e13c2446394c:v136");
 Mon, 17 Apr 2023 04:59:02 +0000
Received: from 8c13dcad87d6.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 32089347-C54A-4591-8306-B81DDEE7F8B9.1; 
 Mon, 17 Apr 2023 04:58:56 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8c13dcad87d6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 17 Apr 2023 04:58:56 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAWPR08MB9472.eurprd08.prod.outlook.com (2603:10a6:102:2e3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 04:58:53 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6298.030; Mon, 17 Apr 2023
 04:58:53 +0000
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
X-Inumbo-ID: a8ce5176-dcdc-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPH0HizTlrsxooKXXMwgC2ytuuQzv08uUCOKt2VaMqY=;
 b=e3VapdMCAglgMnJC7nAS/+oofEljWOWSglyM6LA5t3iEdDC4WL/thkwDgIe97qgVrkvpihInVW4z/S5LDi8E9WbGhDhZ7QsSpKGRu9L4zIxvWl9X/qy49f03+iQv+r7/renK2N9E2cAWGmlwJEUcS5jPQ0sMoUpDouwmgcOBqGU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACW2nwKqRoCy5byk2BP5IukdO0mfETcpniYmThIQ1wOCUC2fbkUp2OMMUjJ6OInpyqNgAKs48tnlCkVJQ0AOQSxenk553MvqNF7mq59v/EhLEd1/mieaR9NrmyUReJpJVDcPLkkfCVBxcdekwHNvismVaiLveaz+onIeShLYN6Mfvo6S6uDuf2FfoT9iPsJBEXMyw8bGBZkJ/bVSnlcPNixqoefemFNmNODV6ofdnD0v2Na+EMUwKdS57Q0oOqax6NtRGZKwR2/pBP8IePDbWw1atUQvXMtP+Y3iV3Eb+hR/9Eva/MDPHAmk/1RJ2qT7uUU6B9Pm/KqaHJSO20Nkwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPH0HizTlrsxooKXXMwgC2ytuuQzv08uUCOKt2VaMqY=;
 b=NbPmL/PJgiG0icgEMyk4i2X1qJqP1saWg+inbRbKx8W2JJD7mXY9IY6XBT1gpYElR/kuJ+46NyFWU5eE59I9xo95StkBeOQeyOg/iDS1noqJmKJXZyLlJUuFu9CudLvCzqLQu9avK43NcW0LrN/nJH6zmSHvSKzF4cn5RUVLHp1UQPSA4aN5ER0DYYL1k76+FZmBuotDh6VmKUeK54zIUZm2cRCZ3InVwig/VOt1ivNdcp5exzL4tSmxIZbvWAv5NwXYM1aBYnYemUUzG2ySzKg2yOLlKlhC6I8CxOI2wbcV5LGscL3yYKX43bNOA4gVmMFeQOkuUFJl0clCPggJ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPH0HizTlrsxooKXXMwgC2ytuuQzv08uUCOKt2VaMqY=;
 b=e3VapdMCAglgMnJC7nAS/+oofEljWOWSglyM6LA5t3iEdDC4WL/thkwDgIe97qgVrkvpihInVW4z/S5LDi8E9WbGhDhZ7QsSpKGRu9L4zIxvWl9X/qy49f03+iQv+r7/renK2N9E2cAWGmlwJEUcS5jPQ0sMoUpDouwmgcOBqGU=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v7 2/5] xen/arm64: Rework the memory layout
Thread-Topic: [PATCH v7 2/5] xen/arm64: Rework the memory layout
Thread-Index: AQHZcHBVTtqn5UnQqEuWlkR+HSSWja8uwBIw
Date: Mon, 17 Apr 2023 04:58:51 +0000
Message-ID:
 <AS8PR08MB79915D100B2E1FB81292E195929C9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230416143211.72227-1-julien@xen.org>
 <20230416143211.72227-3-julien@xen.org>
In-Reply-To: <20230416143211.72227-3-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9BA70659DD6C1640BE51CFACAB071D32.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAWPR08MB9472:EE_|AM7EUR03FT057:EE_|PAWPR08MB9007:EE_
X-MS-Office365-Filtering-Correlation-Id: 5de19443-a1a9-4180-12c4-08db3f007699
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 AciZvIQRxgIlwp1nhMKJAeApjuHw5XfWyIkiB21pq6DcTjpBmi+Zok3KzsdHaM1lCjRI7XB4xbSSv8qbVhsLOY8dTUjZ0Tjeke9F/fHcU7tU9jNcMAmKe84/xw+JO8YKyU93HasZNNnyrD5eqkq3PLvpDyUxAxXEHlmKb164mjdFTQqcu7p71b89Ue6K0LhvAoo68j7NCb+oJam7BpbEMrkQ3o0oozL4z5FmldmX1+jvI44s7jismTxGaAJ3R0W2qOtwuYm7V+FmFa0MZUaR7jYOF2K/Fn3f/jOhATrLr4HBWM/LFMryUgP1ducZeXfTcheP7WhhuLOUqCxLdH3D48P2yUUqOKBYRW0GSJnEMGD4khhWn689+4KHKOI4nW0Z6MDykxT9MOY4O0PD1xmpBee0jHkN/my5MGiyurc8QdsvwOsHShFYIG3tS++KTvlU49MSqTIqOB310+sNwyXNqyXFs8G+PQyajqvWbEBNFfWhILBq5Q1SCtpRuvTjiTKGdXAIa9BW6ZZSXej8Iz+cQcAIpXx1FOAMpRdSj16z0HMQzc4I4hpKp8eeFCCYpFIm2nd/Aoydnnsd0iDRpt4TNr67NZdDVSQv8oeWEd/t15sAdIlPd6s99FCAQ1te9BhQ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(136003)(39860400002)(346002)(451199021)(54906003)(110136005)(9686003)(26005)(6506007)(478600001)(76116006)(66946007)(66476007)(66556008)(64756008)(66446008)(83380400001)(316002)(7696005)(71200400001)(186003)(4326008)(8676002)(41300700001)(8936002)(5660300002)(2906002)(122000001)(52536014)(38070700005)(33656002)(38100700002)(55016003)(86362001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9472
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	62e69a6e-d52d-47ea-3ffc-08db3f006ff5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SLVQnWwr/OBn/kQdL4BKi0JYRtX+jovrO9i9ZzPGz+gO6reqbwgaOk/iANOE+DSUJ23p5zBFAKfzZ2+gnFRBaiWaoH5/PdbDV/Tn1k2f5mTN1vIrioEBlh4tbz6TyKbdFhxf9P0+mrWXadzTaMHizhkQ1oX6B5idGFgtTjDXU23/A5PaOiEvN8rdNLisNad3FO3CJ6DXu0adyFJONbRZNuyB/CdX3pC8IsgGBOeP0f/46u+JnjAiqli4CXdfCxfSGdgU5s/143hdfSLcy9pcVlClA3bGW+AZojTZzhtkNJGQk9ilRh4lcmyl+JHXBCFCPoEk+Jh/FJIT/aZGiIiO4m3tAziGSvgDsgU5YKH04H7/7J0EbUqZyLIgWyAGUd1oBOyC90zpWLoO1/VEX4etKN4MpYtNfrUWUa9EwhNp9LKSTeqlH5sPsv9Lx5DpcXZ6oJ2qr+mRDws7mSlLPP/dponkith6SxXQ0BwKx4sDeFKZEvn54tCFgCDwSz+RVcgMXf4otI5f5YmfcklDCcNo73ZgnukCGN2MvqppLNIjmlrI77uf1fQd6WPyKScWv0f8HGgUNREtt/nI6uRzy8Vid4oVd9WbiRkW41HpclbaIL8CbrLXUCPq61GtabnpcLPgzm71By4bbVvZ2/6qD55sifQRACZykOPQwyxsnCEuZHYT8tF7qnS0x0uqM9ekusEmBFnQaqgnIFiGDUZjeonp4g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199021)(40470700004)(36840700001)(46966006)(110136005)(478600001)(54906003)(86362001)(55016003)(36860700001)(47076005)(33656002)(83380400001)(26005)(336012)(107886003)(40480700001)(9686003)(40460700003)(82740400003)(7696005)(186003)(82310400005)(6506007)(4326008)(356005)(316002)(81166007)(2906002)(70206006)(70586007)(8936002)(8676002)(5660300002)(52536014)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 04:59:02.4725
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5de19443-a1a9-4180-12c4-08db3f007699
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9007

Hi Julien,

> -----Original Message-----
> Subject: [PATCH v7 2/5] xen/arm64: Rework the memory layout
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Xen is currently not fully compliant with the Arm Arm because it will
> switch the TTBR with the MMU on.
>=20
> In order to be compliant, we need to disable the MMU before
> switching the TTBR. The implication is the page-tables should
> contain an identity mapping of the code switching the TTBR.
>=20
> In most of the case we expect Xen to be loaded in low memory. I am aware
> of one platform (i.e AMD Seattle) where the memory start above 512GB.
> To give us some slack, consider that Xen may be loaded in the first 2TB
> of the physical address space.
>=20
> The memory layout is reshuffled to keep the first four slots of the zeroe=
th
> level free. All the regions currently in L0 slot 0 will not be part of
> slot 4 (2TB). This requires a slight tweak of the boot code because
> XEN_VIRT_START (2TB + 2MB) cannot be used as an immediate.
>=20
> This reshuffle will make trivial to create a 1:1 mapping when Xen is
> loaded below 2TB.
>=20
> Lastly, take the opportunity to check a compile time if any of the
> regions may overlap with the reserved area for identity mapping.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

This time I used our CI to test this series patch by patch on top of stagin=
g
today (Apr 17), so that we can see if the qemu issue reported by Bertrand
in v6 still persists.

I can confirm all boards including the qemu-arm64 passed this time, so:

Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

