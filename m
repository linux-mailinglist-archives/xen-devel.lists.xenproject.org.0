Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4DD54EF72
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jun 2022 05:26:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350978.577455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o22dC-0007T1-QJ; Fri, 17 Jun 2022 03:26:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350978.577455; Fri, 17 Jun 2022 03:26:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o22dC-0007QR-NF; Fri, 17 Jun 2022 03:26:46 +0000
Received: by outflank-mailman (input) for mailman id 350978;
 Fri, 17 Jun 2022 03:26:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YAhX=WY=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1o22dB-000652-CB
 for xen-devel@lists.xenproject.org; Fri, 17 Jun 2022 03:26:45 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe05::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f9407a2-eded-11ec-ab14-113154c10af9;
 Fri, 17 Jun 2022 05:26:44 +0200 (CEST)
Received: from AM7PR03CA0018.eurprd03.prod.outlook.com (2603:10a6:20b:130::28)
 by DB7PR08MB3739.eurprd08.prod.outlook.com (2603:10a6:10:79::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Fri, 17 Jun
 2022 03:26:39 +0000
Received: from AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::48) by AM7PR03CA0018.outlook.office365.com
 (2603:10a6:20b:130::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16 via Frontend
 Transport; Fri, 17 Jun 2022 03:26:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT008.mail.protection.outlook.com (10.152.16.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Fri, 17 Jun 2022 03:26:39 +0000
Received: ("Tessian outbound 01afcf8ccfad:v120");
 Fri, 17 Jun 2022 03:26:39 +0000
Received: from 6d4723de48ce.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A751F9F9-C370-47B6-BD17-8BB5D1F4A263.1; 
 Fri, 17 Jun 2022 03:26:33 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6d4723de48ce.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Jun 2022 03:26:33 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM7PR08MB5464.eurprd08.prod.outlook.com (2603:10a6:20b:10a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Fri, 17 Jun
 2022 03:26:29 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%7]) with mapi id 15.20.5353.015; Fri, 17 Jun 2022
 03:26:29 +0000
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
X-Inumbo-ID: 4f9407a2-eded-11ec-ab14-113154c10af9
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=CtBM35C3cLx2eBiklmjYmBcs5+rV/b+ML6CcVdIuq/CfnkGVKsD/S8WSup/uMZDpE37x3VKR4yNJ2imosmUKIMRh2gku2+Z4ghhVxgE2SGLDNaFGrbEfAXy76Vt5xzv6bk5jChbl0ffM0//q3lL1rOtz/Sy34Hw1ZhPKw0EjSVx4lVQKL+dIl6AQrISboUJYv9/R79+a8RHp8RFyprwkGMQ/+e+S3aWe+eKE7e+lSuF6Qv3ydR5j8fhLOF9p53+9bkMpjW3W+Zzd9c/RMWHpD1v6KZR7nj7kN+21bAWdglH43r4aKm84BsBUvJWIL/eQrITTCthmx4aozRjs3NrnhQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gacrb8LjpHK9r2UNzDUbNdw4fZGBTKqV2TlBvwjjJ5k=;
 b=GxgXzqkup6My2OHpOls4qqvJGUHqAqiJR18NJWaeA+WSQ7HST99CuIV9Wth91DydWYghNyUvzMPhFfRZO94sHMFA1AeARWQ2M0hSkSmP7/9lLXdOzTEFdSvMZNeyPO78SKzDK39caxc/y4uerrXtr/soiUerR9SBnBnA6UDvJG+UTVo9nAVHghgKZZtCqYnbx9jjxib3Qvi4SaA5rcsBlXdAuhiraqtnnC/BjhjHvGEw0RPwBxmGdDpv9Gv6WGgPAk8RrHy1SKoyOw6Sr5U4HTI+htyL+ChZcij/rKudAh/z+TUcvoulwws3+Qz4VCnOz2z309DfTA5MDBg5pn0jmA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gacrb8LjpHK9r2UNzDUbNdw4fZGBTKqV2TlBvwjjJ5k=;
 b=TqGwHkJEEmkCk26B6gzKdqbAQzJ1G+9YiOZfc8x5mTvIYExIsx+1bvhA9lwCaOHoM5MKOn2UqaiAZ09KMOxXh9dOij8uJC78MWFRvfcXA7DGVLnUWnQ6sU34UJWg+geKzqPOCdGLJTkCT/jqThbLpPcFVnC9uZFhG6xzB77ps5I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=abAUTts9yxxEUbiLrXj+DGqUkr/8KE/sJ6nVKk7HsmYBTn0FDu1EFhR9vfWKBEU056yZ72cPZr1M4J47kPNiawj3fGFSHYwzL9Gu29ba1PFZTscdbDbyT6834P1ceVq0FHi2tSDWdyo8+PJ2VQJV323hgmLN7MXmdhOEqVTVt0xNkhCdjT/eWYfkKW7q7Nt3Xmr6rCYJdWJqcjgjYsUj+UX0wCQBCKavnrkspdII4RD4IbGXM/djQf87pf22GAZyj5PrMBLo+k7vvNN+Oa6UVnz/YTvPoeALd+F62dxdQL0Z0P2Lcii+hT/PXqWUtuRqH/9pfbicxPKvZNAX/2xd9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gacrb8LjpHK9r2UNzDUbNdw4fZGBTKqV2TlBvwjjJ5k=;
 b=ZjveQIAFn8btb3ticao9m95QbvBU+WUeHskhbjPs1R/IEPqOCdjxoNYmeq++3tMKYCdx2v1X799rvwZothwgZiX3bAFYAn8BddH4Cgj0Elsy9qLKDGrz0l0qL2uAK7t8ehetBaJrYqExic5pIqDl9l6SH5IDcKsAWnNmJ/v0gTtZfSKA3oJsujwmQ4EmZwNB7nDInlTioQgc2rUHTk8wyPoP1SiIIDM5XOksj5eB/O/WDVJFdCZzoKmTyvK9orpGbvRniq6BFN4v82FhYCmKlFpdaC1CzqENfmHzpFwBpTBGznyrgWx5LWhkzacr3ACzuCejKnHAk8MeS6BicjR8iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gacrb8LjpHK9r2UNzDUbNdw4fZGBTKqV2TlBvwjjJ5k=;
 b=TqGwHkJEEmkCk26B6gzKdqbAQzJ1G+9YiOZfc8x5mTvIYExIsx+1bvhA9lwCaOHoM5MKOn2UqaiAZ09KMOxXh9dOij8uJC78MWFRvfcXA7DGVLnUWnQ6sU34UJWg+geKzqPOCdGLJTkCT/jqThbLpPcFVnC9uZFhG6xzB77ps5I=
From: Henry Wang <Henry.Wang@arm.com>
To: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Dario Faggioli
	<dfaggioli@suse.com>, Anthony PERARD <anthony.perard@citrix.com>
Subject: RE: [RFC PATCH 0/2] Add a new acquire resource to query vcpu
 statistics
Thread-Topic: [RFC PATCH 0/2] Add a new acquire resource to query vcpu
 statistics
Thread-Index: AQHYafs/iBEBw9uXUkyBIqTOdVcxNq1TF8bA
Date: Fri, 17 Jun 2022 03:26:29 +0000
Message-ID:
 <AS8PR08MB7991F28D180D1781FE8E9D0792AF9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <cover.1652797713.git.matias.vara@vates.fr>
In-Reply-To: <cover.1652797713.git.matias.vara@vates.fr>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F86346322E199A4CBBA7963D3ED8D915.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1b6a4420-f2a6-462b-9b1f-08da50113121
x-ms-traffictypediagnostic:
	AM7PR08MB5464:EE_|AM5EUR03FT008:EE_|DB7PR08MB3739:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3739ACD7991D576A435E4CDF92AF9@DB7PR08MB3739.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4Lt31oa89SSGH3KYTfJrDPArjaXQAJmFIHBFM1DyakdSXc0Jlxx/aU6zTxofDFSDWzKBODQNHEaattpIkjehaa5DFekgckF/dV6R7CLuHRtXwKSb/MmjLbfehdcv2wllBZGxUEHyBr085sgsT2OW+u1mtPkxs+tLvGD6Px9ccYZMz6Z9isUUftr99i2wefg6m4TZv6NMoErvzZtzLtCU+t6fzb+HXTC/PvyZTuBQhgjSoqxiRgeJUlbF1XZdExUpTeS7ZjU7/N8bXo3Oi9/8azMFt+qc1nM+ZybkkuqhGOZZaz9zX//wEC1EMgGVfPbPnDCV7yAmJRo+273kEFaf9Kh6pJjISHs7x3NFnyLrPcsxlAZ+DkgyIULGHzl7Rxujy3VHV+0O8y1cg81wAPBOIjFyNVntCOGWAdEflHXxfjMBI7EdbaaVej+wigQqYK3svJx15OTQ7deBnJKoAl0ZXAki/dSZp3At8uyNBZqcrSijfDmFk5ywRFCUhMkzog9DGbSITGtTHduU7alVOB9H/z+KtLrtHfJu2Hrm7TBgA25HKpGtlC/6+sBUHtAwfj46miJzU8wwflTB1WzU9qrYhXRWjg1zi+69zvveqw37NZiJfO0VgNY+XLt0MRLPHveTFKX/Jp4hNCDlbe0e5qu8e+hyum1OWBXOHT94RsLOJy7fljgY1kfevoBfMSitj9ztELpiP968OixkJUncfTuJ4QhxWy55K625zAF6qXS/L1psIG0mLcEDkP8S1szMw8rhkV++G/l0TxGvJzhBmwcQjKFlx1HNlz1NeAZFWuBHEA+tHVcvWE+lMR+Wxt88mdSJ2rB1S4hYrdKlGBm35lV3xQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(66446008)(64756008)(4326008)(33656002)(52536014)(2906002)(8676002)(76116006)(66476007)(66556008)(66946007)(7416002)(55016003)(86362001)(5660300002)(316002)(8936002)(54906003)(498600001)(7696005)(110136005)(6506007)(26005)(966005)(9686003)(71200400001)(83380400001)(38100700002)(122000001)(186003)(38070700005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5464
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	247602ee-206d-419f-0dac-08da50112b20
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hgP/OWL2EP3n2NSeXelpFcwJMPGenw2LamHBCPbIyyKNUMni6Pq9XCo2k44DdmE9rZHZI650YcryMPeBLStrBqSppFl3jyO79xV+POzc1TjJTpe+w/ST3/gCElwXX8erc5dK75U/gjig8V6GHjGIlbq6crS/TTc48HRZVVrX3sJtfUIKys8rxmRaYOtbk6/xXRhZgFV8Pf90V0R9uRGRYpoYbfyMrTz4lP/i160fu8tf407GV/P7Pm28WGxfuPtZLbFpNatHJJMJMxFCZNqiEHX8YQF4IO0IiZH9hi3IUlCqfkzcfldFLi1/nLKGqIf4uy+f0X0wFfAysQemJk6VgwPKgnLyKAvlCxJmjOkptfbUIJdb5+DbmuoG5FUyfyPCnNJe9G9ppqtc6/d7IlTMM3geUTrrnzBUn5pPmEH8Wf0r1JsWbqHdj4jOS3QP8v1Q85Qjo79UaZCkj1ZOacmcY+jky+scaspprZKw+pRWy98eGKSP5EBDxpWsBS+9JhX4lj5BlsHlfizR+ttkilMHQF+JqvCZxC4zWUT5csgMDLOb7jinJAbgw1zNtYvnn6LV2CDVR5APi8BMqhchiJXl/MuQ9uWSsJnjn1uiz1M0hMM4Dgq3sOg3n2MBFSOn3iensP6fuYvvgbl3SUmHdg2ZTofs9DGnGKmZSDTgNieufX1YMNWg/vbaaYE9IsToUCmNfBMD3MaySljUW1V7nT5dolZMN9FTSTewc3PobLSrxGOmQxPd7w+/YUpOIAxpi5TQuOWTjXrGDn8UKSllZGA7u8Bp5PpicEBNSTwbSnp9xB8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(46966006)(40470700004)(36840700001)(316002)(110136005)(86362001)(107886003)(81166007)(36860700001)(54906003)(70206006)(4326008)(8676002)(70586007)(966005)(55016003)(8936002)(33656002)(5660300002)(508600001)(7696005)(6506007)(9686003)(83380400001)(26005)(40460700003)(336012)(82310400005)(2906002)(186003)(47076005)(356005)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 03:26:39.4673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b6a4420-f2a6-462b-9b1f-08da50113121
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3739

Hi,

It seems that this series has been stale for more than a month with no comm=
ent
from maintainer for patch#1 [1] and actions needed from author for patch#2 =
[2].
So sending this email as a gentle reminder. Thanks!

[1] https://patchwork.kernel.org/project/xen-devel/patch/d0afb6657b1e78df48=
57ad7bcc875982e9c022b4.1652797713.git.matias.vara@vates.fr/
[2] https://patchwork.kernel.org/project/xen-devel/patch/e233c4f60c6fe97b93=
b3adf9affeb0404c554130.1652797713.git.matias.vara@vates.fr/

Kind regards,
Henry

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> Matias Ezequiel Vara Larsen
> Subject: [RFC PATCH 0/2] Add a new acquire resource to query vcpu
> statistics
>=20
> Hello all,
>=20
> The purpose of this RFC is to get feedback about a new acquire resource
> that
> exposes vcpu statistics for a given domain. The current mechanism to get
> those
> statistics is by querying the hypervisor. This mechanism relies on a
> hypercall
> and holds the domctl spinlock during its execution. When a pv tool like x=
cp-
> rrdd
> periodically samples these counters, it ends up affecting other paths tha=
t
> share
> that spinlock. By using acquire resources, the pv tool only requires a fe=
w
> hypercalls to set the shared memory region and samples are got without
> issuing
> any other hypercall. The original idea has been suggested by Andrew
> Cooper to
> which I have been discussing about how to implement the current PoC. You
> can
> find the RFC patch series at [1]. The series is rebased on top of stable-=
4.15.
>=20
> I am currently a bit blocked on 1) what to expose and 2) how to expose it=
.
> For
> 1), I decided to expose what xcp-rrdd is querying, e.g.,
> XEN_DOMCTL_getvcpuinfo.
> More precisely, xcp-rrd gets runstate.time[RUNSTATE_running]. This is a
> uint64_t
> counter. However, the time spent in other states may be interesting too.
> Regarding 2), I am not sure if simply using an array of uint64_t is enoug=
h or
> if
> a different interface should be exposed. The remaining question is when t=
o
> get
> new values. For the moment, I am updating this counter during
> vcpu_runstate_change().
>=20
> The current series includes a simple pv tool that shows how this new
> interface is
> used. This tool maps the counter and periodically samples it.
>=20
> Any feedback/help would be appreciated.
>=20
> Thanks, Matias.
>=20
> [1] https://github.com/MatiasVara/xen/tree/feature_stats
>=20
> Matias Ezequiel Vara Larsen (2):
>   xen/memory : Add stats_table resource type
>   tools/misc: Add xen-stats tool
>=20
>  tools/misc/Makefile         |  5 +++
>  tools/misc/xen-stats.c      | 83 +++++++++++++++++++++++++++++++++++++
>  xen/common/domain.c         | 42 +++++++++++++++++++
>  xen/common/memory.c         | 29 +++++++++++++
>  xen/common/sched/core.c     |  5 +++
>  xen/include/public/memory.h |  1 +
>  xen/include/xen/sched.h     |  5 +++
>  7 files changed, 170 insertions(+)
>  create mode 100644 tools/misc/xen-stats.c
>=20
> --
> 2.25.1
>=20


