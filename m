Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 850F83D6CFF
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jul 2021 05:46:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161032.295675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8E1Y-0002k2-71; Tue, 27 Jul 2021 03:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161032.295675; Tue, 27 Jul 2021 03:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8E1Y-0002iG-12; Tue, 27 Jul 2021 03:44:56 +0000
Received: by outflank-mailman (input) for mailman id 161032;
 Tue, 27 Jul 2021 03:44:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=99OC=MT=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m8E1W-0002iA-PC
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 03:44:55 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.67]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff8e33ee-ee8c-11eb-96d0-12813bfff9fa;
 Tue, 27 Jul 2021 03:44:52 +0000 (UTC)
Received: from AS8P251CA0025.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::20)
 by HE1PR0802MB2140.eurprd08.prod.outlook.com (2603:10a6:3:c2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Tue, 27 Jul
 2021 03:44:49 +0000
Received: from AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::ce) by AS8P251CA0025.outlook.office365.com
 (2603:10a6:20b:2f2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend
 Transport; Tue, 27 Jul 2021 03:44:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT027.mail.protection.outlook.com (10.152.16.138) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Tue, 27 Jul 2021 03:44:48 +0000
Received: ("Tessian outbound cee5995f7b16:v100");
 Tue, 27 Jul 2021 03:44:47 +0000
Received: from 3c8f3dc00911.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 202A5B9E-6444-4131-BD2D-B2DDAA33F9F3.1; 
 Tue, 27 Jul 2021 03:44:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3c8f3dc00911.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 27 Jul 2021 03:44:42 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR0802MB2174.eurprd08.prod.outlook.com (2603:10a6:800:9c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Tue, 27 Jul
 2021 03:44:39 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c%5]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 03:44:39 +0000
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
X-Inumbo-ID: ff8e33ee-ee8c-11eb-96d0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDs3gsKu1twi7kPgWPq2SdF8u49lwxbAB0z9y9/NQEY=;
 b=yFTFk7l+dDi1Axb5S55UUqy9c+zuAk5IgKYIbIEnhhClN+mo2WH1D0iNJiYCDm/V8tbbEk4MqLbqis3gaupS/tsBPDyXZqy4MtO83gGT+mA2dX9to/FVLhU4Z7X1L1NIMGwAxCeHuGXKZggAmUkaq+bLxIC1qygwq7BrIhAVGqE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+PCtYwIOozcNNXAz4WU6IG/aiSuwytfDrGrueoYjhWwRwKZVeom+sW85arYZXjYZfyQ2rf9ywlAEviwP+3OdmRGoFFimFqL30l5q0cNoY7YwWIK1nYOsiRKKbkkkH83P505GmiEgrrEAKdqFH7vU0y9W2nG491y84GAqmRpIQK31PP3tZ+jTNgD19tvD8S0RtgiVQd62p949X9lPaytMPJaLygcO/8aMD4lw2vhnbQAaCUxXlBxdsInODOYM64PeQHtGvwwtryqJnpukKKFuSo+l334Sp4NUOO/I9OFn5C51/NxAcEXxvXZpdq23P11LVEaFZmqNb5El7dMdyYUAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDs3gsKu1twi7kPgWPq2SdF8u49lwxbAB0z9y9/NQEY=;
 b=MVz9IY+4mawEh+pTLrHrvoLsIuFSG7Hnp8P/34eKFddLje1Ah3FB3LNeiGIRo2yLZabhcztYoBLbHnPeEKsGyu/Pk+45Ee/7tLF09Oo5qSLz45vM1DY+vGN+YPh7uKmjydXxf6b0APcu8QAOSKc0WTUUO39gX2i/33nxYPTR10TLzrloh1yOplbjFLF8V7NIgM6HK+Hghj8xx5Cuwshk5VvV1b+4SclI0p3/CDFxWue3FRZwruZVoxxaDNCH1IpM/EEvfj7AUTObEkGuwomSU3+zHt7oFUOz0qTSer2T3OKkiKybI0zsDkh272yP62OZGLi+LGFvOuw2rr81PkWC2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDs3gsKu1twi7kPgWPq2SdF8u49lwxbAB0z9y9/NQEY=;
 b=yFTFk7l+dDi1Axb5S55UUqy9c+zuAk5IgKYIbIEnhhClN+mo2WH1D0iNJiYCDm/V8tbbEk4MqLbqis3gaupS/tsBPDyXZqy4MtO83gGT+mA2dX9to/FVLhU4Z7X1L1NIMGwAxCeHuGXKZggAmUkaq+bLxIC1qygwq7BrIhAVGqE=
From: Penny Zheng <Penny.Zheng@arm.com>
To: "julien@xen.org" <julien@xen.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
Subject: RE: [PATCH V3 10/10] xen/arm: introduce allocate_static_memory
Thread-Topic: [PATCH V3 10/10] xen/arm: introduce allocate_static_memory
Thread-Index: AQHXeTjsii93P3Jir0yV0AuWxQR1FqtWPVlQ
Date: Tue, 27 Jul 2021 03:44:39 +0000
Message-ID:
 <VE1PR08MB52153A258DE5E33D11C337CDF7E99@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210715051819.3073628-1-penny.zheng@arm.com>
 <20210715051819.3073628-11-penny.zheng@arm.com>
In-Reply-To: <20210715051819.3073628-11-penny.zheng@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4F45553F46B38E45BB803876702A3CCF.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 0be14203-d539-4e16-7587-08d950b0e1e3
x-ms-traffictypediagnostic: VI1PR0802MB2174:|HE1PR0802MB2140:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB21401D5B5F2E26DAE6CBCB9EF7E99@HE1PR0802MB2140.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 p7rki8FWqzbvbeA8W6lYeT2QdRthO7e+cMhGGMMfS6V5ajiBmECzFsQASg3jwOiZjf8ie810SQTNuLqiaSPUzWptDBawvHLbSERtgkSs55HKRoG+OqB4hXquwkf7jw8cm8pMkBlQFnRyI1KSsMUF5AKYqN8uTgO+OH6xt9Zs22OUZUkscnxe8J3FwYQ0+YsBUnvCFYgtsOnufJ3aO7M7DbzNRzctZvnXO/+W9ZV0u5YwnylpxxEpBt6Re87SnYb4ULGKNcalewmPPA+dHOZKWjkLknizsA/a+UWZ7yoDqCwgGrSc45o4mfNqMTtQ4k4BcYhR4fzT5HhSZ1IBPM4PF0eNsH8Yi54W4oZomvASOi0p/k5eLcw5ZMeeZa/XVdaio4c0zeqSGw4mzc5Twroka9vhQK2T6eXxegAh/GPoOXJyACrnlu+YC1B4r2BWNMaRsy4BfRFSPIbMiFoB8NN/uwoBxLWEjwr3xB/L8lAHJH46F0GA4S/DMxl/MJbqiCh8zhcKX2/LdDO3Mtoib1HH+cC3F62Y/6+kHpwcLeAr9S7qMl/+vUmKhn0Ouc2RwaeeOndt6ojsSC3QdhmAc+dtHNKxioaQmQr8Bg5AzXryo/blLOoNfEcEsiIOq4uDgq4HFPRLHFVj+Y2aEsR5wn9zjp7RkmdcfXCsCKMzI+csrKEYO3gblsdQguNMRf/+5i1jvthRmGGz3DhDlkyB9FE2xA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(4326008)(83380400001)(55016002)(33656002)(478600001)(6916009)(38100700002)(122000001)(66556008)(2906002)(64756008)(52536014)(71200400001)(7696005)(54906003)(86362001)(53546011)(6506007)(8676002)(9686003)(5660300002)(76116006)(8936002)(66476007)(66946007)(66446008)(186003)(316002)(26005)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?h+Pu7CqWHBPpPCCPFjKr7wqYyVl3FDBinS4qQdHL8oo20L9pEsudvFPgeteo?=
 =?us-ascii?Q?jvVD4H5h+wU453HdAoXbuzD3iVD7MA6KX+PZazQmriqQM7jOv45NB7vnmxQd?=
 =?us-ascii?Q?vwTX5THYgew9y78qdkhbcx2To9SguvRMUrODswfOsbEL+WgW93wDc0mr+3Zd?=
 =?us-ascii?Q?yvTAfnM7k7aD4H/Nz3jvUix5dO39ywYxFJFHBs4Vq75g1BvzyVq56QoB9rNQ?=
 =?us-ascii?Q?S7IC2sYr3IWanKuqNt2rMQwOt/q1t4t47uw5g+fbkDajJETqx+fqIOGWHBTR?=
 =?us-ascii?Q?xOLal20kAG7Q4DQMUHjNqaHzohkfjirEtGGPIh2/N8x3GOhFHL8d6Rtdddaz?=
 =?us-ascii?Q?tstyDCNkWDNpoBRlGjqfNPhLZSXBfWgCHxuLY1qQIgFay6CrQnJL1mbtIEtJ?=
 =?us-ascii?Q?WtHqdwrTEFWjt61LKIeBA1FPBrON58ied5Kz0mfhNbTSyHRKzlg0op55J0EM?=
 =?us-ascii?Q?KXWfkgqXBE9liERbp0ZxJ5yXY5wjJMuVCEuRSny9y2HvzYH96e15c3lvJLm9?=
 =?us-ascii?Q?0cpsjw0D0A49/RcgwFYimSeuIG166YCcmDdpbpoKnwVrJboj6jLEvt0SNBfq?=
 =?us-ascii?Q?e4v0Ol923XpZtmBldixcz6dQy9dp3PGnXhSUZddGjepDJPgLDwuR6YG4rogX?=
 =?us-ascii?Q?ig/1pg4iyH7O1b67IEhgOmLN0q9DYyZsPxiH4+E+T/Aaz5WsWnPQfkdbToCV?=
 =?us-ascii?Q?ERc3xvkXbN0O/Q4jxMx3qLVaHKP6l4Iyd3eL84d6nlJw+heCWiXfxtHPZJt7?=
 =?us-ascii?Q?xv5forJLzgcL3V760jFTytKzrLLVe3ArncyvadAIzW/2x7or0FfL3K5AlPH7?=
 =?us-ascii?Q?VCa/lmnAUudVg89XuMGHD+V0cQpa+Hqw6P54y/ww6kpls1ua35kyKh0KacdX?=
 =?us-ascii?Q?NEoZgMwYKJlTJ2PBStznVVSTfOxIa7uOOArsYbS2XFQQMaugbMHohHkSQLFG?=
 =?us-ascii?Q?MUOw1toiO+zsWWWtkU5SSvqs1H7YNFXoT6YIYI8ofwxsWp+8HkfOobUCKDjl?=
 =?us-ascii?Q?Tnj73L4Om+1EhaFLdhj4ET3sNzrkDDEgxcsn2PcjW1LmWgLrOf5Z6KKoxAdu?=
 =?us-ascii?Q?wR+/libod7ixOOTHZcVTN0BizH13aeow06ePY227/0VXac0g7DpuZA/Wx5cr?=
 =?us-ascii?Q?7zfVxMpgrEtimvLh+8cIaHnZ49XKTTNvxdxDiLk6IfJuyU+fyiO+Bv7sbxto?=
 =?us-ascii?Q?T93LPutTQSJvv7A5Dn41QQw0etC7iDupwg3pLzq7QGVaKeSsC5YjuZhlNtbf?=
 =?us-ascii?Q?yOUQYraT4taM2cDvgc698QWVcw7S4VFyDdZHbUGVmu0bm2ePFo4+0I/23N+v?=
 =?us-ascii?Q?i4k=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2174
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	187033f4-d8f2-4f77-dc3f-08d950b0dc7e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vhgqBOd/MsmHEqh74rnzGRpD19gTvBI2owl5DCtd0yenJUbWCxZd6eqL/iqVqRyEB3PTp+qKKm5hleiJjUXxpfmHjwGMdOBx1MeoHLTJvLbAwXdeMGMWw8TTXuKFmxpPwNxA0CI9Kb/UYGkSvRayXoS37KfnV0zTbMrXOgXMmeGl1YRurOxdwM2blwXb4WgcOQs0UmhZ6v/fLVjpLfWz6j7qsd8PhyyBYe7pCpqmV5phTcSMuSteZm4/+ZWJiGCHe9Qt/TeQ/2ECJbJFV6ZqcEL+8Ope0SUXC0MgHJCL9OCW02xEa0ZZFdxqm+PzW50K88eAwkraV89CikNvp0AWF0yqYiVlcAhjOUlCvZqog+sHASsJsEsVPErg5/0SdlOVcz3gtpJmcXjJalmVqbAUD//0Apwq/xRGejglkfTlx9TDwmdjioozaVlZCXPHvC1XbVOtQ1/0dXP6X0+aG8rbrGKTjPik/RtD0QqKfdyNGPdV1ZaIVJ5jz3xtgZMrkf9JA7rIYPs379+Eum6uT2QMcB2s43r2JqIguf6w97SkJEj++Zb+1/pZ2JwyysVLdbrwBqx5q5Dt0ylrKxSystSAXGcBOelRLcfic8ZrxXLiabGmY7xSuh6Utv6szoje3NA4RoZIma3SnHfafL8svmVpZXMmpfbx9J+5hNbEAcqDFFXOAtTH4v9emoJubHvileaY8BbuCnx9izOIQmIWHEf/+Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(316002)(70206006)(70586007)(54906003)(53546011)(7696005)(9686003)(6506007)(8676002)(55016002)(356005)(83380400001)(5660300002)(6862004)(4326008)(26005)(8936002)(47076005)(52536014)(86362001)(82310400003)(336012)(2906002)(508600001)(81166007)(33656002)(186003)(107886003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 03:44:48.3122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be14203-d539-4e16-7587-08d950b0e1e3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2140

Hi Julien

> -----Original Message-----
> From: Penny Zheng <penny.zheng@arm.com>
> Sent: Thursday, July 15, 2021 1:18 PM
> To: xen-devel@lists.xenproject.org; sstabellini@kernel.org; julien@xen.or=
g
> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Penny Zheng
> <Penny.Zheng@arm.com>; Wei Chen <Wei.Chen@arm.com>;
> jbeulich@suse.com; nd <nd@arm.com>
> Subject: [PATCH V3 10/10] xen/arm: introduce allocate_static_memory
>=20
> This commit introduces allocate_static_memory to allocate static memory a=
s
> guest RAM for Domain on Static Allocation.
>=20
> It uses acquire_domstatic_pages to acquire pre-configured static memory f=
or
> this domain, and uses guest_physmap_add_page to set up P2M table.
> These pre-defined static memory banks shall be firstly mapped to the fixe=
d
> guest RAM address `GUEST_RAM0_BASE`. And until it exhausts the
> `GUEST_RAM0_SIZE`, it will seek to `GUEST_RAM1_BASE`, and so on.
> `GUEST_RAM0` may take up several pre-defined physical RAM regions.
>=20
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v3 changes:
> - parse "xen,static-mem" in way of phandle back to property.
> - use unsigned int for index
> - rename allocate_static_bank_memory to append_static_memory_to_bank
> - infer the next GFN from the bank information
> - simplify the code in double loop.
> ---
>  xen/arch/arm/domain_build.c | 137
> +++++++++++++++++++++++++++++++++++-
>  1 file changed, 135 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index cdb16f2086..ed290ee31b 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -480,6 +480,139 @@ fail:
>            (unsigned long)kinfo->unassigned_mem >> 10);  }
>=20
> +static bool __init append_static_memory_to_bank(struct domain *d,
> +                                                struct membank *bank,
> +                                                mfn_t smfn,
> +                                                paddr_t size) {
> +    int res;
> +    paddr_t tot_size =3D size;
> +    /* Infer next GFN. */
> +    gfn_t sgfn =3D gaddr_to_gfn(bank->start + bank->size);
> +
> +    while ( tot_size > 0 )
> +    {
> +        unsigned int order =3D get_allocation_size(tot_size);
> +
> +        res =3D guest_physmap_add_page(d, sgfn, smfn, order);

When constructing Patch v4, and second thought on this commit:

Do you think that here we shall define a new function guest_physmap_add_pag=
es for adding
nr pages p2m mapping, just like what we did for assign_pages(...).

Since right now guest_physmap_add_page is also limited to taking care of pa=
ge with a single order,=20
We had trouble of count-to-order conversion when page number is not in a po=
wer-of-two here too.

> +        if ( res )
> +        {
> +            dprintk(XENLOG_ERR, "Failed map pages to DOMU: %d", res);
> +            return false;
> +        }
> +
> +        smfn =3D mfn_add(smfn, 1UL << order);
> +        tot_size -=3D (1UL << (PAGE_SHIFT + order));
> +    }
> +
> +    bank->size =3D bank->size + size;
> +    return true;
> +}
> +
> +/* Allocate memory from static memory as RAM for one specific domain d.
> +*/ static void __init allocate_static_memory(struct domain *d,
> +                                          struct kernel_info *kinfo,
> +                                          const struct dt_property *prop=
,
> +                                          u32 addr_cells, u32
> +size_cells) {
> +    unsigned int nr_banks, gbank, bank =3D 0;
> +    const uint64_t rambase[] =3D GUEST_RAM_BANK_BASES;
> +    const uint64_t ramsize[] =3D GUEST_RAM_BANK_SIZES;
> +    const __be32 *cell;
> +    u32 reg_cells =3D addr_cells + size_cells;
> +    u64 tot_size =3D 0;
> +    paddr_t pbase, psize, gsize;
> +    mfn_t smfn;
> +
> +    /* Start with GUEST_RAM0. */
> +    kinfo->mem.nr_banks =3D 0;
> +    gbank =3D 0;
> +    gsize =3D ramsize[gbank];
> +    kinfo->mem.bank[gbank].start =3D rambase[gbank];
> +
> +    cell =3D (const __be32 *)prop->value;
> +    nr_banks =3D (prop->length) / (reg_cells * sizeof (u32));
> +    BUG_ON(nr_banks > NR_MEM_BANKS);
> +
> +    while ( bank < nr_banks )
> +    {
> +        device_tree_get_reg(&cell, addr_cells, size_cells, &pbase, &psiz=
e);
> +        tot_size +=3D psize;
> +        smfn =3D maddr_to_mfn(pbase);
> +
> +        if ( !acquire_domstatic_pages(d, psize >> PAGE_SHIFT, smfn, 0) )
> +        {
> +            printk(XENLOG_ERR
> +                    "%pd: cannot acquire static memory "
> +                    "(0x%"PRIpaddr" - 0x%"PRIpaddr").\n",
> +                    d, pbase, pbase + psize);
> +            goto fail;
> +        }
> +
> +        printk(XENLOG_INFO "%pd: STATIC BANK[%d] %#"PRIpaddr"-
> %#"PRIpaddr"\n",
> +               d, bank, pbase, pbase + psize);
> +
> +        /*
> +         * It shall be mapped to the fixed guest RAM address rambase[i],
> +         * And until it exhausts the ramsize[i], it will seek to the nex=
t
> +         * rambase[i+1].
> +         */
> +        while ( 1 )
> +        {
> +            /*
> +             * The current physical bank is fully mapped.
> +             * Handle the next physical bank.
> +             */
> +            if ( gsize >=3D psize )
> +            {
> +                if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[g=
bank],
> +                                                   smfn, psize) )
> +                    goto fail;
> +
> +                gsize =3D gsize - psize;
> +                bank++;
> +                break;
> +            }
> +            /*
> +             * Current guest bank memory is not enough to map.
> +             * Check if we have another guest bank available.
> +             * gbank refers guest memory bank index.
> +             */
> +            else if ( (gbank + 2) > GUEST_RAM_BANKS ) {
> +                printk("Exhausted the number of guest bank\n");
> +                goto fail;
> +            }
> +            else
> +            {
> +                if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[g=
bank],
> +                                                   smfn, gsize) )
> +                    goto fail;
> +
> +                psize =3D psize - gsize;
> +                smfn =3D mfn_add(smfn, gsize >> PAGE_SHIFT);
> +                /* Update to the next guest bank. */
> +                gbank++;
> +                gsize =3D ramsize[gbank];
> +                kinfo->mem.bank[gbank].start =3D rambase[gbank];
> +            }
> +        }
> +    }
> +
> +    kinfo->mem.nr_banks =3D ++gbank;
> +    kinfo->unassigned_mem -=3D tot_size;
> +    if ( kinfo->unassigned_mem )
> +        printk(XENLOG_ERR
> +               "Size of \"memory\" property doesn't match up with the on=
es "
> +               "defined in \"xen,static-mem\".\n");
> +
> +    return;
> +
> +fail:
> +    panic("Failed to allocate requested static memory for domain %pd."
> +          "Fix the VMs configurations.\n",
> +          d);
> +}
> +
>  static int __init write_properties(struct domain *d, struct kernel_info =
*kinfo,
>                                     const struct dt_device_node *node)  {=
 @@ -2486,8 +2619,8
> @@ static int __init construct_domU(struct domain *d,
>      if ( !static_mem )
>          allocate_memory(d, &kinfo);
>      else
> -        /* TODO: allocate_static_memory(...). */
> -        BUG();
> +        allocate_static_memory(d, &kinfo, static_mem_prop,
> +                               static_mem_addr_cells,
> + static_mem_size_cells);
>=20
>      rc =3D prepare_dtb_domU(d, &kinfo);
>      if ( rc < 0 )
> --
> 2.25.1

A lot thanks

Penny


