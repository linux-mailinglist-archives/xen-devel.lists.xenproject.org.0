Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 509556DEC68
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 09:18:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520059.807284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmUk7-00049b-L6; Wed, 12 Apr 2023 07:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520059.807284; Wed, 12 Apr 2023 07:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmUk7-00046y-Hh; Wed, 12 Apr 2023 07:18:11 +0000
Received: by outflank-mailman (input) for mailman id 520059;
 Wed, 12 Apr 2023 07:18:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QpzN=AD=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pmUk5-00046s-Io
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 07:18:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c638a7e-d902-11ed-b21e-6b7b168915f2;
 Wed, 12 Apr 2023 09:18:08 +0200 (CEST)
Received: from DB8PR06CA0018.eurprd06.prod.outlook.com (2603:10a6:10:100::31)
 by DBBPR08MB6315.eurprd08.prod.outlook.com (2603:10a6:10:209::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.28; Wed, 12 Apr
 2023 07:18:00 +0000
Received: from DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::31) by DB8PR06CA0018.outlook.office365.com
 (2603:10a6:10:100::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.40 via Frontend
 Transport; Wed, 12 Apr 2023 07:18:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT012.mail.protection.outlook.com (100.127.142.126) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.29 via Frontend Transport; Wed, 12 Apr 2023 07:18:00 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Wed, 12 Apr 2023 07:18:00 +0000
Received: from 7d22e4c8651a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DEB2799E-E68B-4E4C-A210-5916B48206A0.1; 
 Wed, 12 Apr 2023 07:17:49 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7d22e4c8651a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 12 Apr 2023 07:17:49 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB9684.eurprd08.prod.outlook.com (2603:10a6:10:460::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Wed, 12 Apr
 2023 07:17:45 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6277.034; Wed, 12 Apr 2023
 07:17:45 +0000
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
X-Inumbo-ID: 2c638a7e-d902-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Fnve0Ztn4Wjfr4f/V2rjsT2NHcKUk9HKR+bwZFLvtc=;
 b=CAqdnEz25wKZE4gSHr90pjg5KnXY3kQEG0gaVO0v3dJMYF1lNr3RZwVdf+fSmLts2iUbCNy5AbiXgilcNoq8OghVcVpzNKZvcCQM9IFJcITjV3J2yW+CJW6WFFCbzz5L6ZWCp31AQj9D9ntMwUf9Z10iaJ/XKdBVu2eko3fOnIM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1crUVwBDPTW1NvxRDV5eMksN6QeaD8uO3cmHDY0LWsYuCRlUflwn0Yu/jYpyqED2+9E/OQaqtA+cgHOVy7VE4gSTRKTkWjagZPzoeVqIhAgiMyy3VR4cyl4k69DWW0cblcsvbiF+mX2JrmYk+xgZv4AXMBx62DRt/HCRTTbPruC1C2iXHgu6g/LRWXKkSf5AzzSafkTSShH10hpziOU+7flaRW+1CcFbnMp6nPqD8y+W+7ne6cGD6EJyYc07AcUa3kALETaMXjAvnQOLdUAeVxSNgSvDSNEe5FNdj3XXYlqnDk0GjAjZeqa83bJNaK1A3VeO9I5B+T9eew16DVykQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Fnve0Ztn4Wjfr4f/V2rjsT2NHcKUk9HKR+bwZFLvtc=;
 b=EfCwq65pgHkLjORH9b+qT3uYCSFr34Z5cjX/cHJMAKSxq8f2e+2vqUsPyP3Ol33vYrHepexNNOG6tKcaL7mJf9932RsBQbof6JGtlIfVso2/08ojBBCUlCb6oqOHMhy3FgMxUv3S5IYBeMPSlUsUO+c11d1iMDHS82mda5cWGHJ+RsJAQ7PNBiPxBKU2v4QgodAdQ178yXrvVkeYOo5j//8/Hxj33ikGv3ED7JBY+sSpk8wAP4oD7pjrFDANzVdoqaQWVDPPYRBlIxYR0+nkCcy99tGTB6bYHMhbnHjIEfEdDyZVgFhiTe0FCd6XTLD3oYsWb7q73x4Fucv99QzIYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Fnve0Ztn4Wjfr4f/V2rjsT2NHcKUk9HKR+bwZFLvtc=;
 b=CAqdnEz25wKZE4gSHr90pjg5KnXY3kQEG0gaVO0v3dJMYF1lNr3RZwVdf+fSmLts2iUbCNy5AbiXgilcNoq8OghVcVpzNKZvcCQM9IFJcITjV3J2yW+CJW6WFFCbzz5L6ZWCp31AQj9D9ntMwUf9Z10iaJ/XKdBVu2eko3fOnIM=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 2/3] xen/arm: vpl011: Handle correctly TXFE when backend
 in Xen
Thread-Topic: [PATCH 2/3] xen/arm: vpl011: Handle correctly TXFE when backend
 in Xen
Thread-Index: AQHZZ7BjfTPA7ZSpsEidFkEBoEBCAa8nPfIg
Date: Wed, 12 Apr 2023 07:17:45 +0000
Message-ID:
 <AS8PR08MB79915E2D49B4F3564257A483929B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230405111750.12491-1-michal.orzel@amd.com>
 <20230405111750.12491-3-michal.orzel@amd.com>
In-Reply-To: <20230405111750.12491-3-michal.orzel@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D65879B074B6EA42AC8C56E519FC8DAF.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB9684:EE_|DBAEUR03FT012:EE_|DBBPR08MB6315:EE_
X-MS-Office365-Filtering-Correlation-Id: 337f0675-ee7f-4aec-d694-08db3b260c3b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oxrzO5H0Ik6PQI3RZJlN0xOz/FZxQISaBcqoCEGlcFtjFw2vllvb+0iIGYh4xqtQCBxF+5ND610YK2ykqtbBeT02NaEPSTg0T410fF9UvbiAYKsN0ptbSMPEN5SSiH0Or1+J7juSdl6OFF8MtL6prNUI8sA7u6vmABgVJlpEPis6mWIEYyUs66+dGyuldF3UGfQ+lf2JajawnZvI1dXyhZgieljcX0vDMqLcxVqHSfyRH3OTQvwBpkEh0g5ZGxtKIDM4CVMeIRmIzbpqVXaoF+Xq9nvK0QOyNlnD7r0U0YZQysl2cANLQyYRqI/jSbSxt3nFiwmWPl8ZUduHwwwK9jcfM8AZ2W97ayYlKbvJgfaOXfDuMiD20CMOPDolL8KJQ+jhlfvpPtRG/D9IHAicwsUFQT/bpHg16wCgfMvt4LPxq1XvuPZbmybm2/AE7jwyThhMxWQd8g1kUBTyispJSU0kpMzVNTHVi1IcvSvmAgAlDs5miV4DZqOslxCmxddj9ScAGcTrRuzGGVcHuRoeVfURIWaz4RMTytC20SOXDpkHe83qOnELhJkFEAVOIvQ3v8YptBS3g0UaG/K5/JlXH+v+DXKvTXn+0NkN2qeSRC8S70RHdqG2Y20orCKtSJUm
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199021)(33656002)(86362001)(76116006)(110136005)(316002)(64756008)(71200400001)(41300700001)(54906003)(7696005)(66946007)(8676002)(4326008)(478600001)(66476007)(66446008)(66556008)(5660300002)(55016003)(8936002)(2906002)(4744005)(122000001)(38070700005)(52536014)(38100700002)(186003)(83380400001)(26005)(6506007)(9686003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9684
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3084d2e2-1f7e-4595-0ad1-08db3b260348
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K/5TPRNLPKViX0Tp3VTdvqnZI04de9Dhj7YoQvjTXz3upqPXYoDiFdR/CjbYwmHlvt9vlTIaChCv4YWkqxWjKMkB+fHCaCBTBJdTrINI2/MT/YueMNKr/zY04a6U8/bwl0LyMzQnKXdtJE6pPyYoPbGyX3NV4NZSNIfK9OVINH2LOcCVe2ycg8XCxTTwcoLuuTBuPba89W6R6UGzRAt3hsBPdNZlg30URTg9sSWBoMZjVwRkFeefCqYshjzJN6ZQFfdqmJ4/iDc5Hx//nSNRtgTyFyCowckrK09EgczFnsJBDFOrbQXtHN7RFUEmOBHrEGyEtYfrPcKTZAd/IHNWRTt2F4a0vvv/w9v7jDW9YLLtWyozIN4NxKNNgyRW5SNzFgL6r5JdSiNQ8M9nSXlJ/3ACpTi1fil8l36OasvGPgn0f4YDSm6E0lzyEVJyB3tvJg8JQBAijFO5LuMthgVDE4D+C25+0ccOJGZgaI/tzyD1IPDZ2hWQLf4muppE9wTmLh6APHYGIaQWNT/xjaghHDxDt1KAlfi/9blctgiJIF4qpp6qJeAcuJ3tWfUZMMdg9kmokMC75sKfwMDb2j4hMD1v7ezm0+8yOBXmqeeXroqcOAx7lZtlHzoMhXazuNmiZ7kodfBoczPSkI7EoxgDGk7krD8QwnX11XFY7ZFzuW0w5/ZD9XLrbDMJQQLL0OBf4sfiKiKGx483+7NW7wBmrw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199021)(46966006)(40470700004)(36840700001)(2906002)(4744005)(356005)(40460700003)(41300700001)(81166007)(52536014)(5660300002)(8936002)(8676002)(82310400005)(33656002)(86362001)(40480700001)(7696005)(55016003)(9686003)(6506007)(26005)(107886003)(54906003)(36860700001)(83380400001)(478600001)(336012)(47076005)(186003)(316002)(70206006)(70586007)(4326008)(110136005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 07:18:00.3101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 337f0675-ee7f-4aec-d694-08db3b260c3b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6315

Hi Michal,

> -----Original Message-----
> Subject: [PATCH 2/3] xen/arm: vpl011: Handle correctly TXFE when backend =
in
> Xen
>=20
> When backend is in Xen, the handling of data written to DR register is a
> bit special because we want to tell guest that we are always ready for ne=
w
> data to be written (i.e. no real FIFO, TXFF/BUSY never set and TXI always
> set). This conflicts with the current handling of TXFE bit, which we
> always clear and never set on a write path (we happen to set it when we
> receive char from serial input due to use of vpl011_data_avail() but this
> might never be called). This can lead to issues if a guest driver makes
> use of TXFE bit to check for TX transmission completion (such guest could
> then wait endlessly). Fix it by keeping TXFE always set to match the
> current emulation logic.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>
Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

