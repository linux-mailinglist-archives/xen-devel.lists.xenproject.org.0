Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7D67CF50C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 12:22:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619108.963700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQAM-0005cj-JQ; Thu, 19 Oct 2023 10:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619108.963700; Thu, 19 Oct 2023 10:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQAM-0005Zg-GT; Thu, 19 Oct 2023 10:22:10 +0000
Received: by outflank-mailman (input) for mailman id 619108;
 Thu, 19 Oct 2023 10:22:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AWKy=GB=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qtQAK-0005YB-Qo
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 10:22:08 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a856a20-6e69-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 12:22:06 +0200 (CEST)
Received: from DUZPR01CA0222.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::29) by DB9PR08MB9849.eurprd08.prod.outlook.com
 (2603:10a6:10:462::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Thu, 19 Oct
 2023 10:22:03 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com
 (2603:10a6:10:4b4:cafe::4a) by DUZPR01CA0222.outlook.office365.com
 (2603:10a6:10:4b4::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24 via Frontend
 Transport; Thu, 19 Oct 2023 10:22:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.24 via Frontend Transport; Thu, 19 Oct 2023 10:22:02 +0000
Received: ("Tessian outbound 028b72acc2da:v215");
 Thu, 19 Oct 2023 10:22:02 +0000
Received: from b8cc3c7b04a8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 17C4B66C-6A5A-4E3B-B6B5-98AADA88E828.1; 
 Thu, 19 Oct 2023 10:21:55 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b8cc3c7b04a8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 19 Oct 2023 10:21:55 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GVXPR08MB10449.eurprd08.prod.outlook.com (2603:10a6:150:157::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Thu, 19 Oct
 2023 10:21:53 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 10:21:53 +0000
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
X-Inumbo-ID: 5a856a20-6e69-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63SHCnY+JwYxHH0v7V3GFQAXf7A7Bxi0BaX6dcLHy6Y=;
 b=GyfdWmXtCVdJWrck45psuDPEx5cdx8ePpRoCt6hhEFlHvDYreewl9nWs8tQkAl/c8rYz3GrSCPjzYqZzVmteA1+MnpSOaG8LFtc7YpwHjkDG4dTLUO2uafvdPcPvL8umEUxH5wh5sE6TLSt9eXo9xDS5Gvvsswi87Iz6arlHBPA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 55f8debd1347259f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fx2DFTAnpRnfApmoAZsEWRtEVI2MXlhYcgoGKXzHX/M2BrPCfqZUHtphlNue4uAZHDFakON/ZGWF8OlueQRscvryNn6i1EywwAOPxiynGzv/8WFHOi1A7lhz4mm7kPyj2yyzduCIdhI4Was3QMfeAUD8wnOZpr4L/sCeon50xYpTg0FfpsZjw7PuQbOj4qHJepMyoOoRyQTyaGwDrnNwJbaDQn/fLKlxksXVii3h6EYOzKtoaHFmeEYSaUgAUcGPMxm0qf9aRFajiAX9evbVajAgAksUNNWCRI8K0TqOxWBOjeSaEDzFw36z6WvwE5XklFlXP1AZWLP+eaPhv7vmuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63SHCnY+JwYxHH0v7V3GFQAXf7A7Bxi0BaX6dcLHy6Y=;
 b=ZNncUYz3iU193AxjYSJDy3UutWn8Bp6CnKVfuOGoWVEU2Sx//F2NiE+JCWJTzyW+NIzbTpRGFi4NrdEMUOQzqKQ2sBmS+hn7+/Ulf+s5AFVUW6py4qLvlswYiUk0DJhJT7q3GDF5TCgxEIV4JxJDzukiY9YN/8PKgitbrO3av241k6jkCZF8S6FpRiNijjX6UWh3K++dW+i2x0S4a9YYHJucAOXIMjFcfheI7s2FEQ7eWkFQC5t1sMMU7AX/kPi7Z/8v5KxoVbeoEShiPa2GFBuzjK5UGxT+o0f/DTumTEunFbMkUR0toag/uqJCYiACXShI8NHLLZ31yLpWQA0iJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63SHCnY+JwYxHH0v7V3GFQAXf7A7Bxi0BaX6dcLHy6Y=;
 b=GyfdWmXtCVdJWrck45psuDPEx5cdx8ePpRoCt6hhEFlHvDYreewl9nWs8tQkAl/c8rYz3GrSCPjzYqZzVmteA1+MnpSOaG8LFtc7YpwHjkDG4dTLUO2uafvdPcPvL8umEUxH5wh5sE6TLSt9eXo9xDS5Gvvsswi87Iz6arlHBPA=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.18 v2] iommu/vt-d: fix SAGAW capability parsing
Thread-Topic: [PATCH for-4.18 v2] iommu/vt-d: fix SAGAW capability parsing
Thread-Index: AQHaAd1VLBU5LYOtFUqTZ+pB/Sc9JLBQu6uAgAAstQA=
Date: Thu, 19 Oct 2023 10:21:53 +0000
Message-ID: <9F9DCAFD-2253-4D33-B9A1-3D04C859DB22@arm.com>
References: <20231018160733.24655-1-roger.pau@citrix.com>
 <709ade00-9112-2866-4d2b-3bb718b13b46@suse.com>
In-Reply-To: <709ade00-9112-2866-4d2b-3bb718b13b46@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GVXPR08MB10449:EE_|DB5PEPF00014B8C:EE_|DB9PR08MB9849:EE_
X-MS-Office365-Filtering-Correlation-Id: ff0bdb47-3032-4706-43ba-08dbd08d3c87
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OqJ/gDweVyjLGFgvd9UmMHDFSOoaBnqPBPg4081KeripwNSOT/ii6AyaG15zRzo9xYJU+HbNOAEAyCH90nLQsPXY49DUDvLULVWgh8FvdPqxiN6cu2HtpqD8qqIdCOaLItLwBuf2+vL4Xfakp1xi8n1Mr2rbNqQkJsU/VVkUqwuo2WWa66egS//NE83+/Y4GeMmVIcB91Q7SsUVKU436b5ejTMwtRVQWpzZqb+wIAvMOkhkCxXGGQcdweIoui7s9fyS85hn9+fX5fyYefb/r1b0yce56KTf4dW+a+tGC2mzY5M8AFm545XAm860uOSlHQ7QntOw5fE9scdrJxftZLDAtW2lC4CPm8FDoSCKIV4WhCmAXZ7hsaZ8yDbcALe5tLTrAHkvuHIdg0GYaZT//AU63Wm9fo48wM/PtT9lsGzYfn67zi9+dcmC8bjQksqXaAe/6rFaLFzFHU/TNnav2nPJimCW3R7HZOzLMZQyqqONhZYtT14V03NzGKkZ3aP3JTLf/ui2h9TLNjDEf2iIvXKwql4430mUsSQJ8bq2uZhdJGQdf+ATAWRA2eO86+GhSdc8Xb6T4qJ5FP62iIcuIUnXF68nGBnHnTXEKZzE0kDOWNF+5ysd27A3a9oclQZxolXF70xkDgGo1DfNNzhbrBg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(136003)(376002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(36756003)(66556008)(6916009)(316002)(66476007)(6512007)(6486002)(53546011)(91956017)(478600001)(2906002)(26005)(6506007)(76116006)(41300700001)(64756008)(66446008)(54906003)(4326008)(66946007)(71200400001)(38100700002)(2616005)(4744005)(5660300002)(122000001)(38070700005)(8936002)(33656002)(8676002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AA13ECD984B0994DADF7E6B28780980F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10449
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e1e5165c-3540-4a5d-7fc9-08dbd08d36bb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Yl+AuvvFc4rhFUlNgGGSqHPzR4v9iCB9cvq9D3J2KMXLqo2CCwVIJY/xMOmbqwg0zIaOp8GeO+lDWE5kYJm3vWoCquyiXbe3W7SF7fHX4P093fFRZZakdlll8FUTu3GgKgZJ8R+RUfwNpccsItpB+ScVQAPQUMkAGLmmZx+ZEEWtwJGLAT1TsDzE0KtKLFueMJC5JQBq1KUtfMkn8Zt/fLy05HZx6TE+bcD5tYBPbE9mRrBitK599wo75HB5kaNmVn3P6UR9d5B+gzEB7ftC01wxN2e1uxeCM32wikllmu90bLEpG0dWX3HmjCbUzZrSx0m2vP8z2ZGhaLif4V9IlQb/8HjuZ54v/Db6o44X4kbtgCFumpCYzOpB+/WFw60nsriTHuKGW8SCclBxCo2JWOrdg0jeMkjJ5MhIDKFEAzwP6sWIc2MLwr2Z8UGnJQ/HYIvAKMiefvMKtsYQKvG2xJgkiSWCZjMcPdsdpSXsu0wps8+2EIjIsVcVpT0xcOHNsBA4Iw+HCgOnWNbFiRth2lZ+o5OphrDYhCFoqQzisUQ2heAryZo84n644xgy+ScK+rWmXZB+TGGmjMEEhWcagfUY/Zm7eSRk/maAK/HkjPYU5EeNS0dpje8MKH/HmChARaSEUyriQ8w6n9H2AGKjNp/ONFhej8cjE4I1sOmXFfLzYJbcRVbyRob3FaHOnYbcJ+n5+Vn/IlwbQtHqqWyhQPGCiGW2+yo6KRrT6fkTP8H2kn/mVye/AA26ZnEBWMnV
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(396003)(376002)(230922051799003)(451199024)(186009)(64100799003)(82310400011)(1800799009)(46966006)(40470700004)(36840700001)(36860700001)(40480700001)(47076005)(40460700003)(6486002)(54906003)(478600001)(70586007)(70206006)(2906002)(82740400003)(5660300002)(356005)(86362001)(8676002)(81166007)(4326008)(8936002)(316002)(41300700001)(36756003)(6862004)(33656002)(4744005)(336012)(6512007)(26005)(2616005)(53546011)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 10:22:02.7208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff0bdb47-3032-4706-43ba-08dbd08d3c87
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9849

Hi Roger, Jan,

> On Oct 19, 2023, at 15:41, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 18.10.2023 18:07, Roger Pau Monne wrote:
>=20
> I'd be happy to adjust any of the mentioned items while committing, but
> of course I would first need to know which ones you agree with. Since all
> of them are cosmetic, either way
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

I am not sure if there is a v3 or the v2 will be committed with some
committers handling the comments, but either way I am ok with the
release-ack tag below:

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

>=20
> Jan


