Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DE92F2E07
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 12:36:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65619.116293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzHyS-0006c5-93; Tue, 12 Jan 2021 11:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65619.116293; Tue, 12 Jan 2021 11:36:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzHyS-0006bf-5W; Tue, 12 Jan 2021 11:36:32 +0000
Received: by outflank-mailman (input) for mailman id 65619;
 Tue, 12 Jan 2021 11:36:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zMwe=GP=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kzHyR-0006bX-AT
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 11:36:31 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.84]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c2c7f15d-9c0f-48f5-ada1-69d20874f193;
 Tue, 12 Jan 2021 11:36:30 +0000 (UTC)
Received: from DB9PR02CA0006.eurprd02.prod.outlook.com (2603:10a6:10:1d9::11)
 by DB6PR0802MB2246.eurprd08.prod.outlook.com (2603:10a6:4:86::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 11:36:27 +0000
Received: from DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::d4) by DB9PR02CA0006.outlook.office365.com
 (2603:10a6:10:1d9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Tue, 12 Jan 2021 11:36:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT054.mail.protection.outlook.com (10.152.20.248) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 11:36:27 +0000
Received: ("Tessian outbound af289585f0f4:v71");
 Tue, 12 Jan 2021 11:36:27 +0000
Received: from eecd3198ced3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6E2142C0-C589-49B0-9A30-9E9D739854CB.1; 
 Tue, 12 Jan 2021 11:36:22 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eecd3198ced3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Jan 2021 11:36:22 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VE1PR08MB5838.eurprd08.prod.outlook.com (2603:10a6:800:1a7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 11:36:21 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6%5]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 11:36:21 +0000
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
X-Inumbo-ID: c2c7f15d-9c0f-48f5-ada1-69d20874f193
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQ8sdCuQpZ8aafS6v6i39dOZitmU8Op4n+cuk7Sy9P8=;
 b=thk6n84ejCMX9Eyb24WH007DSim97ZC9gzTwwujmyfuCk61QUdddDOuCNy7O6nbS+1rcToacuIGO1mNm73vYS8UcpIufv3+B2kon+OHWQaJsAGnqcj96AL9Tnjug88VWgiQNcmrah/4hqhOSrFG+yIYdXLOuQ9Pto3tsYKAzbFU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6779c2a81be489e4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ngPcQ0n0lrTq7dSnA0cHbcTvH5STz4xy9WehVuM+CNXQkgbZ6GhQ8MFwzH5vHksPzgMxpUqFoKPXZEdZSOSus2nW2bQBy9lurJtJScpqrwBripOPwk4QL0ZFYPCS9l+/tNNR4Kt9Y2PBq2khNI5AcK+f8PwGpGwD96FwkAdXotgyh4kxlwHO8N3Qnx74vcdh3mzb3Dr9Q/cwE0Ke9X7nW5EkM1H7WidvT4nUopUb0TU9urqjk/5PI6RSPWpikaY+AGXMu5A/OwpQ4uURapK+qlXQ8WSJil2MAGovEj3R3FCCCXFxlv//F2hGWRs8g4EGdGOXZvf0BkNpRYP6b22fhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQ8sdCuQpZ8aafS6v6i39dOZitmU8Op4n+cuk7Sy9P8=;
 b=aGmKvRQxLw3cRmgAOWCHFVuTn5tG/TGCLc5SoSh688nIuKDRY4xLvccKxLrSeHpm57X6eEpeyxqMAY35Y2lHPfQG6tTHWyw3osrUOXnkBVkEsqZr7UvmQpA4V0GOsKc6xo7II/KUYPOlhsc6cQ9PsANQJn1WNLfXWTeM6rZ6VkX6HaJS2CpSebdTLp6WxX6J3B20cPvTJJ2NGZSo6mMJpOIu+xV5uxCRaRCR6EcWDZgGT1msiZZF96dq+5c5Dk8ojhfH3Age5G+CvwOI/i727YLccJKQ0BecbH894SvbPepE5dlh8LLX41STOk5fRjXwWd67z9MJRE1Zn8CNmJccEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQ8sdCuQpZ8aafS6v6i39dOZitmU8Op4n+cuk7Sy9P8=;
 b=thk6n84ejCMX9Eyb24WH007DSim97ZC9gzTwwujmyfuCk61QUdddDOuCNy7O6nbS+1rcToacuIGO1mNm73vYS8UcpIufv3+B2kon+OHWQaJsAGnqcj96AL9Tnjug88VWgiQNcmrah/4hqhOSrFG+yIYdXLOuQ9Pto3tsYKAzbFU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v4 08/11] xen/compiler: import 'fallthrough' keyword from
 linux
Thread-Topic: [PATCH v4 08/11] xen/compiler: import 'fallthrough' keyword from
 linux
Thread-Index: AQHW5c27CajBWtWb2Eu4HMlGCx2Xjqoj4q8A
Date: Tue, 12 Jan 2021 11:36:21 +0000
Message-ID: <A4B06AD0-D915-4888-8A41-3A141C89C3E3@arm.com>
References: <cover.1610115608.git.rahul.singh@arm.com>
 <aab15a158f6acb5f5a1cfd0dad1d4493b1fcace9.1610115608.git.rahul.singh@arm.com>
In-Reply-To:
 <aab15a158f6acb5f5a1cfd0dad1d4493b1fcace9.1610115608.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 176025a6-161f-48c2-635f-08d8b6ee4caa
x-ms-traffictypediagnostic: VE1PR08MB5838:|DB6PR0802MB2246:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB2246631D4DB16D9B80D64A879DAA0@DB6PR0802MB2246.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 AE8cYgeLHeQ2+PTfw/6W7HJ6sZ2a8ERzxUVFligTQ8suRLM4eVKvLRAl2ORBcms1TjzdkAJ69n+gbT1/3mEqpFr13KTFXcnrU9guUdNDZRhYM6tctuaVFlqoqg7BWrSJ9oQTDo9yYwi/V9iWp8mE/1m5JuEu2j9eSHGbJPMD1UtPdRWY097AS8YDxp4uQWROn8+Sx0WiNdyLdOlP6OXJripgxrpqv1tA9nM4FXulFNroZ82MOlZoB/bZrZpzWhRkvhCKOfhPH2It6t+CheKyvob4ehP+atlLWnhWbfbXk9tzfsKoXLlsdBKqu/RlmZZGu0OOXmQgrZhO4RDIWW+eCG8uxhmVUgPiYjSWu+/6a9jMTRVP7VopX2Eb5RvhZS1v0varMmtxlhCPez8IHvmOvnl0D28jHak034fVFrrRFmDWGpnlSJ+dB7NviTVjs5DZcBHgsQRJJrGRgvP+ec5OE7YekG+mxcMqnnFW0/YGbKI97DaPRJzh3DdPi4yThBzZIAI+Fybhl86nsOR6DacaXw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(136003)(346002)(39860400002)(2616005)(6512007)(5660300002)(186003)(2906002)(91956017)(6636002)(66946007)(36756003)(66476007)(83380400001)(71200400001)(478600001)(966005)(37006003)(6486002)(6506007)(316002)(86362001)(66446008)(8936002)(66556008)(4326008)(76116006)(54906003)(26005)(53546011)(6862004)(8676002)(33656002)(64756008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?AZqPdXbf+uK30HcT5zW8QyNGnm14hlm0WhaiM5TsekxXNd2NN+V3iNxYdF7E?=
 =?us-ascii?Q?XG0C6gP1fFexnM3cXI7pQ3bBnPnxIqM92Cx6temZiLCSRCsiDPcjRXZGJMgQ?=
 =?us-ascii?Q?t0B//IHjoHqhbZd0VPLixE98sWJPaBzIH/nlfuuxUOBEwpH2iKIM/30XQ0hU?=
 =?us-ascii?Q?TxM2f+B4IXDZkNk5xL8Msp54pqihjF1RBjS0DcK582VV3Cu/F9IeMJYmTr3A?=
 =?us-ascii?Q?3gmxOhZBo+Hrs3NXynGJMXTSKryk69v460vNCTxEi4zcyBwaQO7c7yWdYN1G?=
 =?us-ascii?Q?0Cx4KNTFUqiDCUrAPWfKXGM4Fwk5m6yPWyzbinNjiF8anAPl2PD8ke6Bf0J+?=
 =?us-ascii?Q?bjM0/mhesn90Fw3AEWv/zdaB8fvWyfBYwqwL1SB2V8+flyNbdp+5rWbUymDP?=
 =?us-ascii?Q?vJ2lLZKTLa45OLiFVae1F8daeEPdHYXDRNCJpXiFxmRylExIRj06rS48uzar?=
 =?us-ascii?Q?2wS4p3fCFAhTfw1rcQlXrX5J9N6zfTTH7oXecdRnM2BHFoHksM9BDfdguOmY?=
 =?us-ascii?Q?87KeRSLAn4lwybIY4OwGBbdI8l2EIRbClyVmJtaMe/kLA/B+EnLiUe5UdxLs?=
 =?us-ascii?Q?Mgtvo12US3JdpR5GTVRYgEeEBcSAYdimAA/O00kIRQGVT/nw/z6ep3JSFNby?=
 =?us-ascii?Q?IduCVjOcONzZJ8a345DZZRyHtSS3E+lq8O+GOSEsqMdDdKvhY8US+a57JGIm?=
 =?us-ascii?Q?rtEay0ITN5Kgh1oK1lReoc3yAEsnr43vgLaYEYDb1ON1raWTJVZHaQL7NCj2?=
 =?us-ascii?Q?cUzzJ9gI0ZkcJE39PQwyemZgtI9xIEURLnyV+m3Xh2TslUcYPxAZ8RbVaOZa?=
 =?us-ascii?Q?H1z9iKpfk41rECdlSZiBPFhG6QPrKuV7a7WRtc4AW5I0AZ4bPObRk3NcsebG?=
 =?us-ascii?Q?WkFKg5Z8et97zz2TYKcMyByLBUTLCMX6pgDHMN8sG2XEnRsy6iy+Uknpm7QM?=
 =?us-ascii?Q?P/LKjhG5chkRaxWUHWIl3UvndoK5NNNBXSlJkvrLvABHXS0Xi3Wwq0BOctAk?=
 =?us-ascii?Q?AGPQ?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6037BA0F97611A449EA7DFD94504DCD3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5838
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4eda9daa-0685-43a5-7639-08d8b6ee48cd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aze6VWgtHS3d0iDaS8T18COh5DuK+ArLg7Jdmw1mm9H1mX/bRltqnwtcvuHioGrj/4bwZIeog0YxwnnrJ4aIKH+hsmAfKWcJDoMYCCKRS0Iprp2YrvuzcSHXOSYArSDiJhnG/sUrfholjL3sEWpkkz2QzPRL/Yqz1snYjxQWgSXGbNjzxJCs7uXek7X2DHeeteoB5OGOvg5WvWJVMV6DEzJPusRlMngK61zx203x9gBK35TdXRffndxC8+rBQwxF2Fm8DhfrIzybL66YZ5UaxT7G5kbtmAtO+RLPkfUvWSwCy/9YAdJJLGB385AEhphXzS3bfOmweuUHn+o1rJimPJ6bL2nxSsr8xL0z9nz9lcKKObJRF4z7Z5SawqHKZlMaogotqwLyCcRjltjXSgfcIIAto7ojcFy5oqXisQxb6t5m2PqpjZmWIp+KgPXzkVXlOrGlH4Pzr17PDTX0VdJWyrCzbMz0vS4oFXM/6D7eXCYoERKR0ohxfDv8j+t7yfq8eqTyd2QeKF3intnj/OCwRhlYz3fLG/rhmqrCXLmQHMbx1Ac5my4j19Kdwc+ktmNT
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966006)(34020700004)(6636002)(82310400003)(47076005)(54906003)(81166007)(4326008)(316002)(86362001)(2906002)(966005)(26005)(82740400003)(5660300002)(53546011)(6506007)(83380400001)(37006003)(186003)(8676002)(33656002)(6862004)(70586007)(70206006)(6486002)(36756003)(6512007)(2616005)(478600001)(356005)(336012)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 11:36:27.7571
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 176025a6-161f-48c2-635f-08d8b6ee4caa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2246

Hi,

> On 8 Jan 2021, at 14:46, Rahul Singh <Rahul.Singh@arm.com> wrote:
>=20
> -Wimplicit-fallthrough warns when a switch case falls through. Warning
> can be suppress by either adding a /* fallthrough */ comment, or by
> using a null statement: __attribute__ ((fallthrough))
>=20
> Define the pseudo keyword 'fallthrough' for the ability to convert the
> various case block /* fallthrough */ style comments to null statement
> "__attribute__((__fallthrough__))"
>=20
> In C mode, GCC supports the __fallthrough__ attribute since 7.1,
> the same time the warning and the comment parsing were introduced.
>=20
> fallthrough devolves to an empty "do {} while (0)" if the compiler
> version (any version less than gcc 7) does not support the attribute.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes in V4:
> - This patch is introduce in this verison.
> ---
> xen/include/xen/compiler.h | 16 ++++++++++++++++
> 1 file changed, 16 insertions(+)
>=20
> diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
> index e643e69128..0ec0b4698e 100644
> --- a/xen/include/xen/compiler.h
> +++ b/xen/include/xen/compiler.h
> @@ -33,6 +33,22 @@
> #define unreachable() __builtin_unreachable()
> #endif
>=20
> +/*
> + * Add the pseudo keyword 'fallthrough' so case statement blocks
> + * must end with any of these keywords:
> + *   break;
> + *   fallthrough;
> + *   goto <label>;
> + *   return [expression];
> + *
> + *  gcc: https://gcc.gnu.org/onlinedocs/gcc/Statement-Attributes.html#St=
atement-Attributes
> + */
> +#if (!defined(__clang__) && (__GNUC__ >=3D 7))
> +# define fallthrough        __attribute__((__fallthrough__))
> +#else
> +# define fallthrough        do {} while (0)  /* fallthrough */
> +#endif
> +
> #ifdef __clang__
> /* Clang can replace some vars with new automatic ones that go in .data;
>  * mark all explicit-segment vars 'used' to prevent that. */
> --=20
> 2.17.1
>=20


